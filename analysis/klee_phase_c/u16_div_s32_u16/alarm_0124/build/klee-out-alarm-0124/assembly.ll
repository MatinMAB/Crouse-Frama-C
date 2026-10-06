; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124/build/u16_div_s32_u16_alarm_0124.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"x_value\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"y_value\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [119 x i8] c"KLEE-ALARM-0124: signed overflow. assert (s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value) <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0124.err\00", align 1
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
  %x_value = alloca i32, align 4
  %y_value = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %y_value, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i32* %x_value to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i16* %y_value to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i32, i32* %x_value, align 4, !dbg !62
  %3 = load i16, i16* %y_value, align 2, !dbg !63
  %call = call zeroext i16 @u16_div_s32_u16(i32 %2, i16 zeroext %3), !dbg !64
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
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !492
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !493
  %conv9 = zext i16 %5 to i32, !dbg !494
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !495
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !495
  %div = sdiv i32 %4, %conv9, !dbg !495, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !496
  %conv10 = zext i16 %6 to i32, !dbg !497
  %mul = mul nsw i32 %div, %conv10, !dbg !498
  %sub = sub nsw i32 %3, %mul, !dbg !499
  %conv11 = sext i32 %sub to i64, !dbg !500
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv11), !dbg !501
  %tobool = icmp ne i32 %call, 0, !dbg !501
  br i1 %tobool, label %if.end, label %if.then12, !dbg !502

if.then12:                                        ; preds = %if.else8
  store i16 0, i16* %retval, align 2, !dbg !503
  br label %return, !dbg !503

if.end:                                           ; preds = %if.else8
  %7 = load i32, i32* %x_value.addr, align 4, !dbg !505
  %8 = load i32, i32* %x_value.addr, align 4, !dbg !507
  %9 = load i16, i16* %y_value.addr, align 2, !dbg !508
  %conv13 = zext i16 %9 to i32, !dbg !509
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !510
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !510
  %div14 = sdiv i32 %8, %conv13, !dbg !510, !klee.check.div !106
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !511
  %conv15 = zext i16 %10 to i32, !dbg !512
  %mul16 = mul nsw i32 %div14, %conv15, !dbg !513
  %sub17 = sub nsw i32 %7, %mul16, !dbg !514
  %conv18 = sext i32 %sub17 to i64, !dbg !515
  %call19 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv18, i32 1), !dbg !516
  %tobool20 = icmp ne i32 %call19, 0, !dbg !516
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !517

if.then21:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !518
  br label %return, !dbg !518

if.end22:                                         ; preds = %if.end
  %11 = load i32, i32* %x_value.addr, align 4, !dbg !520
  %12 = load i16, i16* %y_value.addr, align 2, !dbg !522
  %conv23 = zext i16 %12 to i32, !dbg !523
  %int_cast_to_i642 = zext i32 %conv23 to i64, !dbg !524
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !524
  %div24 = sdiv i32 %11, %conv23, !dbg !524, !klee.check.div !106
  %conv25 = sext i32 %div24 to i64, !dbg !525
  %13 = load i16, i16* %y_value.addr, align 2, !dbg !526
  %conv26 = zext i16 %13 to i32, !dbg !527
  %conv27 = sext i32 %conv26 to i64, !dbg !528
  %call28 = call i32 @klee_alarm_s32_mul_upper(i64 %conv25, i64 %conv27), !dbg !529
  %tobool29 = icmp ne i32 %call28, 0, !dbg !529
  br i1 %tobool29, label %if.end31, label %if.then30, !dbg !530

if.then30:                                        ; preds = %if.end22
  store i16 0, i16* %retval, align 2, !dbg !531
  br label %return, !dbg !531

if.end31:                                         ; preds = %if.end22
  %14 = load i32, i32* %x_value.addr, align 4, !dbg !533
  %15 = load i16, i16* %y_value.addr, align 2, !dbg !535
  %conv32 = zext i16 %15 to i32, !dbg !536
  %int_cast_to_i643 = zext i32 %conv32 to i64, !dbg !537
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !537
  %div33 = sdiv i32 %14, %conv32, !dbg !537, !klee.check.div !106
  %conv34 = sext i32 %div33 to i64, !dbg !538
  %16 = load i16, i16* %y_value.addr, align 2, !dbg !539
  %conv35 = zext i16 %16 to i32, !dbg !540
  %conv36 = sext i32 %conv35 to i64, !dbg !541
  %call37 = call i32 @klee_alarm_s32_mul_lower(i64 %conv34, i64 %conv36), !dbg !542
  %tobool38 = icmp ne i32 %call37, 0, !dbg !542
  br i1 %tobool38, label %if.end40, label %if.then39, !dbg !543

if.then39:                                        ; preds = %if.end31
  store i16 0, i16* %retval, align 2, !dbg !544
  br label %return, !dbg !544

if.end40:                                         ; preds = %if.end31
  %17 = load i32, i32* %x_value.addr, align 4, !dbg !546
  %18 = load i32, i32* %x_value.addr, align 4, !dbg !547
  %19 = load i16, i16* %y_value.addr, align 2, !dbg !548
  %conv41 = zext i16 %19 to i32, !dbg !548
  %int_cast_to_i644 = zext i32 %conv41 to i64, !dbg !549
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !549
  %div42 = sdiv i32 %18, %conv41, !dbg !549, !klee.check.div !106
  %20 = load i16, i16* %y_value.addr, align 2, !dbg !550
  %conv43 = zext i16 %20 to i32, !dbg !550
  %mul44 = mul nsw i32 %div42, %conv43, !dbg !551
  %sub45 = sub nsw i32 %17, %mul44, !dbg !552
  %shl = shl i32 %sub45, 1, !dbg !553
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !554
  %21 = load i32, i32* %s32Temp1, align 4, !dbg !555
  %22 = load i16, i16* %y_value.addr, align 2, !dbg !557
  %conv46 = zext i16 %22 to i32, !dbg !558
  %int_cast_to_i645 = zext i32 %conv46 to i64, !dbg !559
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !559
  %div47 = sdiv i32 %21, %conv46, !dbg !559, !klee.check.div !106
  %conv48 = sext i32 %div47 to i64, !dbg !560
  %23 = load i32, i32* %x_value.addr, align 4, !dbg !561
  %24 = load i16, i16* %y_value.addr, align 2, !dbg !562
  %conv49 = zext i16 %24 to i32, !dbg !563
  %int_cast_to_i646 = zext i32 %conv49 to i64, !dbg !564
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !564
  %div50 = sdiv i32 %23, %conv49, !dbg !564, !klee.check.div !106
  %conv51 = sext i32 %div50 to i64, !dbg !565
  %call52 = call i32 @klee_alarm_s32_add_upper(i64 %conv48, i64 %conv51), !dbg !566
  %tobool53 = icmp ne i32 %call52, 0, !dbg !566
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !567

if.then54:                                        ; preds = %if.end40
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 516, i8* getelementptr inbounds ([119 x i8], [119 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !568
  unreachable, !dbg !568

if.end55:                                         ; preds = %if.end40
  %25 = load i32, i32* %s32Temp1, align 4, !dbg !570
  %26 = load i16, i16* %y_value.addr, align 2, !dbg !571
  %conv56 = zext i16 %26 to i32, !dbg !572
  %int_cast_to_i647 = zext i32 %conv56 to i64, !dbg !573
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !573
  %div57 = sdiv i32 %25, %conv56, !dbg !573, !klee.check.div !106
  %27 = load i32, i32* %x_value.addr, align 4, !dbg !574
  %28 = load i16, i16* %y_value.addr, align 2, !dbg !575
  %conv58 = zext i16 %28 to i32, !dbg !576
  %int_cast_to_i648 = zext i32 %conv58 to i64, !dbg !577
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !577
  %div59 = sdiv i32 %27, %conv58, !dbg !577, !klee.check.div !106
  %add = add nsw i32 %div57, %div59, !dbg !578
  %conv60 = sext i32 %add to i64, !dbg !579
  store volatile i64 %conv60, i64* @klee_alarm_sink_s64, align 8, !dbg !580
  store i16 0, i16* %retval, align 2, !dbg !581
  br label %return, !dbg !581

return:                                           ; preds = %if.end55, %if.then39, %if.then30, %if.then21, %if.then12, %if.else, %if.then7
  %29 = load i16, i16* %retval, align 2, !dbg !582
  ret i16 %29, !dbg !582
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !583 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !586, metadata !DIExpression()), !dbg !587
  %0 = load i64, i64* %left.addr, align 8, !dbg !588
  %cmp = icmp sge i64 %0, 0, !dbg !589
  %conv = zext i1 %cmp to i32, !dbg !589
  ret i32 %conv, !dbg !590
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !591 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !594, metadata !DIExpression()), !dbg !595
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !596, metadata !DIExpression()), !dbg !597
  %0 = load i32, i32* %count.addr, align 4, !dbg !598
  %cmp = icmp uge i32 %0, 63, !dbg !600
  br i1 %cmp, label %if.then, label %if.end, !dbg !601

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !602
  br label %return, !dbg !602

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !604
  %2 = load i32, i32* %count.addr, align 4, !dbg !605
  %sh_prom = zext i32 %2 to i64, !dbg !606
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !606
  %shl = shl i64 1, %sh_prom, !dbg !606, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !607
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !608
  %conv = zext i1 %cmp1 to i32, !dbg !608
  store i32 %conv, i32* %retval, align 4, !dbg !609
  br label %return, !dbg !609

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !610
  ret i32 %3, !dbg !610
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !611 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !614, metadata !DIExpression()), !dbg !615
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !616, metadata !DIExpression()), !dbg !617
  %0 = load i64, i64* %left.addr, align 8, !dbg !618
  %1 = load i64, i64* %right.addr, align 8, !dbg !619
  %mul = mul nsw i64 %0, %1, !dbg !620
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !621
  %conv = zext i1 %cmp to i32, !dbg !621
  ret i32 %conv, !dbg !622
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !623 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !624, metadata !DIExpression()), !dbg !625
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !626, metadata !DIExpression()), !dbg !627
  %0 = load i64, i64* %left.addr, align 8, !dbg !628
  %1 = load i64, i64* %right.addr, align 8, !dbg !629
  %mul = mul nsw i64 %0, %1, !dbg !630
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !631
  %conv = zext i1 %cmp to i32, !dbg !631
  ret i32 %conv, !dbg !632
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !633 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !634, metadata !DIExpression()), !dbg !635
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !636, metadata !DIExpression()), !dbg !637
  %0 = load i64, i64* %left.addr, align 8, !dbg !638
  %1 = load i64, i64* %right.addr, align 8, !dbg !639
  %add = add nsw i64 %0, %1, !dbg !640
  %cmp = icmp sle i64 %add, 2147483647, !dbg !641
  %conv = zext i1 %cmp to i32, !dbg !641
  ret i32 %conv, !dbg !642
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !643 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !646, metadata !DIExpression()), !dbg !647
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !648, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !650, metadata !DIExpression()), !dbg !651
  store i32 0, i32* %u32Temp, align 4, !dbg !651
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !652
  %conv = zext i16 %0 to i32, !dbg !652
  %cmp = icmp eq i32 %conv, 0, !dbg !654
  br i1 %cmp, label %if.then, label %if.else, !dbg !655

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !656
  br label %return, !dbg !656

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !658
  %conv2 = zext i16 %1 to i32, !dbg !658
  %shl = shl i32 %conv2, 16, !dbg !660
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !661
  %conv3 = zext i16 %2 to i32, !dbg !661
  %shr = ashr i32 %conv3, 1, !dbg !662
  %add = add nsw i32 %shl, %shr, !dbg !663
  store i32 %add, i32* %u32Temp, align 4, !dbg !664
  %3 = load i32, i32* %u32Temp, align 4, !dbg !665
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !666
  %conv4 = zext i16 %4 to i32, !dbg !666
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !667
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !667
  %div = udiv i32 %3, %conv4, !dbg !667, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !668
  %5 = load i32, i32* %u32Temp, align 4, !dbg !669
  %cmp5 = icmp ult i32 %5, 65535, !dbg !671
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !672

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !673
  %and = and i32 %6, 65535, !dbg !675
  %conv8 = trunc i32 %and to i16, !dbg !673
  store i16 %conv8, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !677
  br label %return, !dbg !677

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !679
  ret i16 %7, !dbg !679
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !680 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !683, metadata !DIExpression()), !dbg !684
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !687, metadata !DIExpression()), !dbg !688
  store i32 0, i32* %u32Temp1, align 4, !dbg !688
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !689, metadata !DIExpression()), !dbg !690
  store i32 0, i32* %u32Temp2, align 4, !dbg !690
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !691
  %conv = zext i16 %0 to i32, !dbg !691
  %and = and i32 %conv, 65535, !dbg !692
  %conv1 = trunc i32 %and to i16, !dbg !691
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !693
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !694
  %conv2 = zext i16 %1 to i32, !dbg !694
  %cmp = icmp eq i32 %conv2, 0, !dbg !696
  br i1 %cmp, label %if.then, label %if.else, !dbg !697

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !698
  br label %return, !dbg !698

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !700
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !702
  %conv4 = zext i16 %3 to i32, !dbg !702
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !703
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !703
  %div = udiv i32 %2, %conv4, !dbg !703, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !704
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !705
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !706
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !707
  %conv5 = zext i16 %6 to i32, !dbg !707
  %mul = mul i32 %5, %conv5, !dbg !708
  %sub = sub i32 %4, %mul, !dbg !709
  %shl = shl i32 %sub, 1, !dbg !710
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !711
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !712
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !713
  %conv6 = zext i16 %8 to i32, !dbg !713
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !714
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !714
  %div7 = udiv i32 %7, %conv6, !dbg !714, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !715
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !716
  %conv8 = zext i16 %10 to i32, !dbg !716
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !717
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !717
  %div9 = udiv i32 %9, %conv8, !dbg !717, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !718
  store i32 %add, i32* %u32Temp2, align 4, !dbg !719
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !720
  %cmp10 = icmp ult i32 %11, 65535, !dbg !722
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !723

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !724
  %and13 = and i32 %12, 65535, !dbg !726
  %conv14 = trunc i32 %and13 to i16, !dbg !724
  store i16 %conv14, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !728
  br label %return, !dbg !728

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !730
  ret i16 %13, !dbg !730
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !731 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !734, metadata !DIExpression()), !dbg !735
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !736, metadata !DIExpression()), !dbg !737
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !738, metadata !DIExpression()), !dbg !739
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !740, metadata !DIExpression()), !dbg !741
  store i32 0, i32* %s32Result, align 4, !dbg !741
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !742, metadata !DIExpression()), !dbg !743
  store i32 0, i32* %s32Temp1, align 4, !dbg !743
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !744
  %conv = sext i16 %0 to i32, !dbg !744
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !745
  %conv1 = zext i16 %1 to i32, !dbg !745
  %mul = mul nsw i32 %conv, %conv1, !dbg !746
  store i32 %mul, i32* %s32Result, align 4, !dbg !747
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !748
  %conv2 = sext i16 %2 to i32, !dbg !748
  %cmp = icmp eq i32 %conv2, 0, !dbg !750
  br i1 %cmp, label %if.then, label %if.else7, !dbg !751

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !752
  %cmp4 = icmp slt i32 %3, 0, !dbg !755
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !756

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !757
  br label %return, !dbg !757

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !759
  br label %return, !dbg !759

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !761
  %5 = load i32, i32* %s32Result, align 4, !dbg !763
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !764
  %conv8 = sext i16 %6 to i32, !dbg !764
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !765
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !765
  %div = sdiv i32 %5, %conv8, !dbg !765, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !766
  %conv9 = sext i16 %7 to i32, !dbg !766
  %mul10 = mul nsw i32 %div, %conv9, !dbg !767
  %sub = sub nsw i32 %4, %mul10, !dbg !768
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !769
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !770
  %shl = shl i32 %8, 1, !dbg !771
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !772
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !773
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !774
  %conv11 = sext i16 %10 to i32, !dbg !774
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !775
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !775
  %div12 = sdiv i32 %9, %conv11, !dbg !775, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !776
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !777
  %conv13 = sext i16 %12 to i32, !dbg !777
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !778
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !778
  %div14 = sdiv i32 %11, %conv13, !dbg !778, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !779
  store i32 %add, i32* %s32Result, align 4, !dbg !780
  %13 = load i32, i32* %s32Result, align 4, !dbg !781
  %cmp15 = icmp slt i32 %13, 32767, !dbg !783
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !784

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !785
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !788
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !789

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !790
  %conv21 = trunc i32 %15 to i16, !dbg !792
  store i16 %conv21, i16* %retval, align 2, !dbg !793
  br label %return, !dbg !793

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !794
  br label %return, !dbg !794

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !796
  br label %return, !dbg !796

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !798
  ret i16 %16, !dbg !798
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !799 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !802, metadata !DIExpression()), !dbg !803
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !804, metadata !DIExpression()), !dbg !805
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !806, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !808, metadata !DIExpression()), !dbg !809
  store i32 0, i32* %s32Result, align 4, !dbg !809
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !810, metadata !DIExpression()), !dbg !811
  store i32 0, i32* %s32Temp1, align 4, !dbg !811
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !812
  %conv = zext i16 %0 to i32, !dbg !812
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !813
  %conv1 = sext i16 %1 to i32, !dbg !813
  %mul = mul nsw i32 %conv, %conv1, !dbg !814
  store i32 %mul, i32* %s32Result, align 4, !dbg !815
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !816
  %conv2 = zext i16 %2 to i32, !dbg !816
  %cmp = icmp eq i32 %conv2, 0, !dbg !818
  br i1 %cmp, label %if.then, label %if.else7, !dbg !819

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !820
  %cmp4 = icmp slt i32 %3, 0, !dbg !823
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !824

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !825
  br label %return, !dbg !825

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !827
  br label %return, !dbg !827

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !829
  %5 = load i32, i32* %s32Result, align 4, !dbg !831
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !832
  %conv8 = zext i16 %6 to i32, !dbg !832
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !833
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !833
  %div = sdiv i32 %5, %conv8, !dbg !833, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !834
  %conv9 = zext i16 %7 to i32, !dbg !834
  %mul10 = mul nsw i32 %div, %conv9, !dbg !835
  %sub = sub nsw i32 %4, %mul10, !dbg !836
  %shl = shl i32 %sub, 1, !dbg !837
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !838
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !839
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !840
  %conv11 = zext i16 %9 to i32, !dbg !840
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !841
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !841
  %div12 = sdiv i32 %8, %conv11, !dbg !841, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !842
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !843
  %conv13 = zext i16 %11 to i32, !dbg !843
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !844
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !844
  %div14 = sdiv i32 %10, %conv13, !dbg !844, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !845
  store i32 %add, i32* %s32Result, align 4, !dbg !846
  %12 = load i32, i32* %s32Result, align 4, !dbg !847
  %cmp15 = icmp slt i32 %12, 32767, !dbg !849
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !850

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !851
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !854
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !855

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !856
  %conv21 = trunc i32 %14 to i16, !dbg !858
  store i16 %conv21, i16* %retval, align 2, !dbg !859
  br label %return, !dbg !859

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !860
  br label %return, !dbg !860

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !862
  br label %return, !dbg !862

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !864
  ret i16 %15, !dbg !864
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !865 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !868, metadata !DIExpression()), !dbg !869
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !870, metadata !DIExpression()), !dbg !871
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !872, metadata !DIExpression()), !dbg !873
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !874, metadata !DIExpression()), !dbg !875
  store i32 0, i32* %u32Result, align 4, !dbg !875
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !876, metadata !DIExpression()), !dbg !877
  store i32 0, i32* %u32Temp1, align 4, !dbg !877
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !878, metadata !DIExpression()), !dbg !879
  store i32 0, i32* %s32Result, align 4, !dbg !879
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !880, metadata !DIExpression()), !dbg !881
  store i32 0, i32* %s32Temp1, align 4, !dbg !881
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !882
  %conv = sext i16 %0 to i32, !dbg !882
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !883
  %conv1 = zext i16 %1 to i32, !dbg !883
  %mul = mul nsw i32 %conv, %conv1, !dbg !884
  store i32 %mul, i32* %s32Result, align 4, !dbg !885
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !886
  %conv2 = sext i16 %2 to i32, !dbg !886
  %cmp = icmp eq i32 %conv2, 0, !dbg !888
  br i1 %cmp, label %if.then, label %if.else7, !dbg !889

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !890
  %cmp4 = icmp sge i32 %3, 0, !dbg !893
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !894

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !895
  br label %return, !dbg !895

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !897
  br label %return, !dbg !897

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !899
  %5 = load i32, i32* %s32Result, align 4, !dbg !901
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !902
  %conv8 = sext i16 %6 to i32, !dbg !902
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !903
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !903
  %div = sdiv i32 %5, %conv8, !dbg !903, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !904
  %conv9 = sext i16 %7 to i32, !dbg !904
  %mul10 = mul nsw i32 %div, %conv9, !dbg !905
  %sub = sub nsw i32 %4, %mul10, !dbg !906
  %shl = shl i32 %sub, 1, !dbg !907
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !908
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !909
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !910
  %conv11 = sext i16 %9 to i32, !dbg !910
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !911
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !911
  %div12 = sdiv i32 %8, %conv11, !dbg !911, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !912
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !913
  %conv13 = sext i16 %11 to i32, !dbg !913
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !914
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !914
  %div14 = sdiv i32 %10, %conv13, !dbg !914, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !915
  store i32 %add, i32* %s32Result, align 4, !dbg !916
  %12 = load i32, i32* %s32Result, align 4, !dbg !917
  %cmp15 = icmp slt i32 %12, 65535, !dbg !919
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !920

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !921
  %cmp18 = icmp sgt i32 %13, 0, !dbg !924
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !925

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !926
  %conv21 = trunc i32 %14 to i16, !dbg !928
  store i16 %conv21, i16* %retval, align 2, !dbg !929
  br label %return, !dbg !929

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !930
  br label %return, !dbg !930

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !932
  br label %return, !dbg !932

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !934
  ret i16 %15, !dbg !934
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !935 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !938, metadata !DIExpression()), !dbg !939
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !940, metadata !DIExpression()), !dbg !941
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !942, metadata !DIExpression()), !dbg !943
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !944, metadata !DIExpression()), !dbg !945
  store i32 0, i32* %s32Result, align 4, !dbg !945
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !946, metadata !DIExpression()), !dbg !947
  store i32 0, i32* %s32Temp1, align 4, !dbg !947
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !948
  %conv = sext i16 %0 to i32, !dbg !948
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !949
  %conv1 = zext i16 %1 to i32, !dbg !949
  %mul = mul nsw i32 %conv, %conv1, !dbg !950
  store i32 %mul, i32* %s32Result, align 4, !dbg !951
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !952
  %conv2 = zext i16 %2 to i32, !dbg !952
  %cmp = icmp eq i32 %conv2, 0, !dbg !954
  br i1 %cmp, label %if.then, label %if.else7, !dbg !955

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !956
  %cmp4 = icmp sge i32 %3, 0, !dbg !959
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !960

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !961
  br label %return, !dbg !961

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !963
  br label %return, !dbg !963

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !965
  %5 = load i32, i32* %s32Result, align 4, !dbg !967
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !968
  %conv8 = zext i16 %6 to i32, !dbg !968
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !969
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !969
  %div = sdiv i32 %5, %conv8, !dbg !969, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !970
  %conv9 = zext i16 %7 to i32, !dbg !970
  %mul10 = mul nsw i32 %div, %conv9, !dbg !971
  %sub = sub nsw i32 %4, %mul10, !dbg !972
  %shl = shl i32 %sub, 1, !dbg !973
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !974
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !975
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !976
  %conv11 = zext i16 %9 to i32, !dbg !976
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !977
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !977
  %div12 = sdiv i32 %8, %conv11, !dbg !977, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !978
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !979
  %conv13 = zext i16 %11 to i32, !dbg !979
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !980
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !980
  %div14 = sdiv i32 %10, %conv13, !dbg !980, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !981
  store i32 %add, i32* %s32Result, align 4, !dbg !982
  %12 = load i32, i32* %s32Result, align 4, !dbg !983
  %cmp15 = icmp slt i32 %12, 65535, !dbg !985
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !986

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !987
  %cmp18 = icmp sgt i32 %13, 0, !dbg !990
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !991

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !992
  %conv21 = trunc i32 %14 to i16, !dbg !994
  store i16 %conv21, i16* %retval, align 2, !dbg !995
  br label %return, !dbg !995

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !998
  br label %return, !dbg !998

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1000
  ret i16 %15, !dbg !1000
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1001 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1004, metadata !DIExpression()), !dbg !1005
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1006, metadata !DIExpression()), !dbg !1007
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1008, metadata !DIExpression()), !dbg !1009
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1010, metadata !DIExpression()), !dbg !1011
  store i32 0, i32* %u32Temp1, align 4, !dbg !1011
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1012, metadata !DIExpression()), !dbg !1013
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1013
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1014
  %conv = zext i16 %0 to i32, !dbg !1014
  %cmp = icmp eq i32 %conv, 0, !dbg !1016
  br i1 %cmp, label %if.then, label %if.else, !dbg !1017

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1018
  br label %return, !dbg !1018

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1020
  %conv2 = zext i16 %1 to i32, !dbg !1020
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1022
  %conv3 = zext i16 %2 to i32, !dbg !1022
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1023
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1024
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1025
  %conv4 = zext i16 %3 to i32, !dbg !1025
  %shr = ashr i32 %conv4, 1, !dbg !1026
  %conv5 = trunc i32 %shr to i16, !dbg !1025
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1027
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1028
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1029
  %conv6 = zext i16 %5 to i32, !dbg !1029
  %add = add i32 %4, %conv6, !dbg !1030
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1031
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1032
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1033
  %conv7 = zext i16 %7 to i32, !dbg !1033
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1034
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1034
  %div = udiv i32 %6, %conv7, !dbg !1034, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1035
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1036
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1038
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1039

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1040
  %and = and i32 %9, 65535, !dbg !1042
  %conv11 = trunc i32 %and to i16, !dbg !1043
  store i16 %conv11, i16* %retval, align 2, !dbg !1044
  br label %return, !dbg !1044

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1045
  br label %return, !dbg !1045

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1047
  ret i16 %10, !dbg !1047
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1048 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1055, metadata !DIExpression()), !dbg !1056
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i32 0, i32* %u32Temp1, align 4, !dbg !1058
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1059
  %cmp = icmp eq i32 %0, 0, !dbg !1061
  br i1 %cmp, label %if.then, label %if.else, !dbg !1062

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1063
  br label %return, !dbg !1063

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1065
  %conv = zext i16 %1 to i32, !dbg !1065
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1067
  %conv1 = zext i16 %2 to i32, !dbg !1067
  %mul = mul nsw i32 %conv, %conv1, !dbg !1068
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1069
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1070
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1070
  %div = udiv i32 %mul, %3, !dbg !1070, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1071
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1072
  %conv2 = zext i16 %4 to i32, !dbg !1072
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1074
  %conv3 = zext i16 %5 to i32, !dbg !1074
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1075
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1076
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1077
  %mul5 = mul i32 %6, %7, !dbg !1078
  %sub = sub i32 %mul4, %mul5, !dbg !1079
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1080
  %div6 = udiv i32 %8, 2, !dbg !1081
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1082
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1083

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1084
  %inc = add i32 %9, 1, !dbg !1084
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1084
  br label %if.end, !dbg !1086

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1087
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1089
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1090

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1091
  %and = and i32 %11, 65535, !dbg !1093
  %conv13 = trunc i32 %and to i16, !dbg !1094
  store i16 %conv13, i16* %retval, align 2, !dbg !1095
  br label %return, !dbg !1095

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1096
  br label %return, !dbg !1096

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1098
  ret i16 %12, !dbg !1098
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1099 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1102, metadata !DIExpression()), !dbg !1103
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1104, metadata !DIExpression()), !dbg !1105
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1106, metadata !DIExpression()), !dbg !1107
  store i32 0, i32* %u32Temp1, align 4, !dbg !1107
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1108
  %conv = zext i16 %0 to i32, !dbg !1108
  %cmp = icmp eq i32 %conv, 0, !dbg !1110
  br i1 %cmp, label %if.then, label %if.else, !dbg !1111

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1112
  br label %return, !dbg !1112

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1114
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1116
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1117
  %conv2 = zext i16 %3 to i32, !dbg !1117
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1118
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1118
  %div = udiv i32 %2, %conv2, !dbg !1118, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1119
  %conv3 = zext i16 %4 to i32, !dbg !1119
  %mul = mul i32 %div, %conv3, !dbg !1120
  %sub = sub i32 %1, %mul, !dbg !1121
  %shl = shl i32 %sub, 1, !dbg !1122
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1123
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1124
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1125
  %conv4 = zext i16 %6 to i32, !dbg !1125
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1126
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1126
  %div5 = udiv i32 %5, %conv4, !dbg !1126, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1127
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1128
  %conv6 = zext i16 %8 to i32, !dbg !1128
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1129
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1129
  %div7 = udiv i32 %7, %conv6, !dbg !1129, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1130
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1131
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1132
  store i32 %9, i32* %retval, align 4, !dbg !1133
  br label %return, !dbg !1133

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1134
  ret i32 %10, !dbg !1134
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1135 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1140, metadata !DIExpression()), !dbg !1141
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1142, metadata !DIExpression()), !dbg !1143
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1144, metadata !DIExpression()), !dbg !1145
  store i32 0, i32* %s32Temp1, align 4, !dbg !1145
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1146, metadata !DIExpression()), !dbg !1147
  store i32 0, i32* %s32Temp2, align 4, !dbg !1147
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1148, metadata !DIExpression()), !dbg !1149
  store i32 0, i32* %s32Temp3, align 4, !dbg !1149
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1150
  %conv = sext i16 %0 to i32, !dbg !1150
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1151
  %conv1 = sext i16 %1 to i32, !dbg !1151
  %mul = mul nsw i32 %conv, %conv1, !dbg !1152
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1153
  %2 = load i16, i16* %div.addr, align 2, !dbg !1154
  %conv2 = sext i16 %2 to i32, !dbg !1154
  %cmp = icmp eq i32 %conv2, 0, !dbg !1156
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1157

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1158
  %cmp4 = icmp slt i32 %3, 0, !dbg !1161
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1162

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1163
  br label %return, !dbg !1163

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1165
  br label %return, !dbg !1165

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1167
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1169
  %6 = load i16, i16* %div.addr, align 2, !dbg !1170
  %conv8 = sext i16 %6 to i32, !dbg !1170
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1171
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1171
  %div9 = sdiv i32 %5, %conv8, !dbg !1171, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1172
  %conv10 = sext i16 %7 to i32, !dbg !1172
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1173
  %sub = sub nsw i32 %4, %mul11, !dbg !1174
  %shl = shl i32 %sub, 1, !dbg !1175
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1176
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1177
  %9 = load i16, i16* %div.addr, align 2, !dbg !1178
  %conv12 = sext i16 %9 to i32, !dbg !1178
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1179
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1179
  %div13 = sdiv i32 %8, %conv12, !dbg !1179, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1180
  %11 = load i16, i16* %div.addr, align 2, !dbg !1181
  %conv14 = sext i16 %11 to i32, !dbg !1181
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1182
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1182
  %div15 = sdiv i32 %10, %conv14, !dbg !1182, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1183
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1184
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1185
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1187
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1188

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1189
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1192
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1193

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1194
  %conv22 = trunc i32 %14 to i16, !dbg !1196
  store i16 %conv22, i16* %retval, align 2, !dbg !1197
  br label %return, !dbg !1197

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1198
  br label %return, !dbg !1198

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1200
  br label %return, !dbg !1200

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1202
  ret i16 %15, !dbg !1202
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1203 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1206, metadata !DIExpression()), !dbg !1207
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1208, metadata !DIExpression()), !dbg !1209
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1210, metadata !DIExpression()), !dbg !1211
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1212, metadata !DIExpression()), !dbg !1213
  store i32 0, i32* %s32Result, align 4, !dbg !1213
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1214, metadata !DIExpression()), !dbg !1215
  store i32 0, i32* %s32Temp1, align 4, !dbg !1215
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1216
  %conv = sext i16 %0 to i32, !dbg !1216
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1217
  %conv1 = sext i16 %1 to i32, !dbg !1217
  %mul = mul nsw i32 %conv, %conv1, !dbg !1218
  store i32 %mul, i32* %s32Result, align 4, !dbg !1219
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1220
  %conv2 = zext i16 %2 to i32, !dbg !1220
  %cmp = icmp eq i32 %conv2, 0, !dbg !1222
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1223

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1224
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1227
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1228

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1229
  br label %return, !dbg !1229

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1231
  %cmp7 = icmp eq i32 %4, 0, !dbg !1233
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1234

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1235
  br label %return, !dbg !1235

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1237
  br label %return, !dbg !1237

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1239
  %6 = load i32, i32* %s32Result, align 4, !dbg !1241
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1242
  %conv12 = zext i16 %7 to i32, !dbg !1242
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1243
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1243
  %div = sdiv i32 %6, %conv12, !dbg !1243, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1244
  %conv13 = zext i16 %8 to i32, !dbg !1244
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1245
  %sub = sub nsw i32 %5, %mul14, !dbg !1246
  %shl = shl i32 %sub, 1, !dbg !1247
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1248
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1249
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1250
  %conv15 = zext i16 %10 to i32, !dbg !1250
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1251
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1251
  %div16 = sdiv i32 %9, %conv15, !dbg !1251, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1252
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1253
  %conv17 = zext i16 %12 to i32, !dbg !1253
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1254
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1254
  %div18 = sdiv i32 %11, %conv17, !dbg !1254, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1255
  store i32 %add, i32* %s32Result, align 4, !dbg !1256
  %13 = load i32, i32* %s32Result, align 4, !dbg !1257
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1259
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1260

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1261
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1264
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1265

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1266
  %conv25 = trunc i32 %15 to i16, !dbg !1268
  store i16 %conv25, i16* %retval, align 2, !dbg !1269
  br label %return, !dbg !1269

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1270
  br label %return, !dbg !1270

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1272
  br label %return, !dbg !1272

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1274
  ret i16 %16, !dbg !1274
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1275 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1278, metadata !DIExpression()), !dbg !1279
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1280, metadata !DIExpression()), !dbg !1281
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1282, metadata !DIExpression()), !dbg !1283
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1284
  %cmp = icmp eq i32 %0, 0, !dbg !1286
  br i1 %cmp, label %if.then, label %if.else, !dbg !1287

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1288
  br label %return, !dbg !1288

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1290
  %cmp1 = icmp sle i32 %1, 0, !dbg !1293
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1294

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1295
  br label %return, !dbg !1295

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1297
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1299
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1300
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1301
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1301
  %div = udiv i32 %3, %4, !dbg !1301, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1302
  %mul = mul i32 %div, %5, !dbg !1303
  %sub = sub i32 %2, %mul, !dbg !1304
  %shl = shl i32 %sub, 1, !dbg !1305
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1306
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1307
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1308
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1309
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1309
  %div4 = udiv i32 %6, %7, !dbg !1309, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1310
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1311
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1312
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1312
  %div5 = udiv i32 %8, %9, !dbg !1312, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1313
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1314
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1315
  store i32 %10, i32* %retval, align 4, !dbg !1316
  br label %return, !dbg !1316

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1317
  ret i32 %11, !dbg !1317
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1318 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1321, metadata !DIExpression()), !dbg !1322
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1323, metadata !DIExpression()), !dbg !1324
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1325, metadata !DIExpression()), !dbg !1326
  store i32 0, i32* %s32Temp1, align 4, !dbg !1326
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %cmp = icmp eq i32 %0, 0, !dbg !1329
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1330

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1331
  %cmp1 = icmp sge i32 %1, 0, !dbg !1334
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1335

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1336
  br label %return, !dbg !1336

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1338
  br label %return, !dbg !1338

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1340
  %cmp4 = icmp sge i32 %2, 0, !dbg !1343
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1344

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1345
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1347
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1348
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1349
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1349
  %div = udiv i32 %4, %5, !dbg !1349, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %mul = mul i32 %div, %6, !dbg !1351
  %sub = sub i32 %3, %mul, !dbg !1352
  %shl = shl i32 %sub, 1, !dbg !1353
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1354
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1355
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1357
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1357
  %div6 = udiv i32 %7, %8, !dbg !1357, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1358
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1359
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1360
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1360
  %div7 = udiv i32 %9, %10, !dbg !1360, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1361
  store i32 %add, i32* %retval, align 4, !dbg !1362
  br label %return, !dbg !1362

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1363
  br label %return, !dbg !1363

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1365
  ret i32 %11, !dbg !1365
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1366 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1369, metadata !DIExpression()), !dbg !1370
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1371, metadata !DIExpression()), !dbg !1372
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1373, metadata !DIExpression()), !dbg !1374
  store i32 0, i32* %u32Temp1, align 4, !dbg !1374
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1375, metadata !DIExpression()), !dbg !1376
  store i32 0, i32* %u32Temp2, align 4, !dbg !1376
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1377
  %cmp = icmp eq i32 %0, 0, !dbg !1379
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1380

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %cmp1 = icmp slt i32 %1, 0, !dbg !1384
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1385

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1386
  br label %return, !dbg !1386

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1388
  br label %return, !dbg !1388

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1390
  %cmp4 = icmp sge i32 %2, 0, !dbg !1393
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1394

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %cmp6 = icmp eq i32 %3, 0, !dbg !1398
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1399

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1400
  br label %return, !dbg !1400

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1402
  %cmp9 = icmp sle i32 %4, 0, !dbg !1405
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1406

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1407
  br label %return, !dbg !1407

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1409
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1411
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1413
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1413
  %div = sdiv i32 %6, %7, !dbg !1413, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1414
  %mul = mul nsw i32 %div, %8, !dbg !1415
  %sub = sub nsw i32 %5, %mul, !dbg !1416
  %shl = shl i32 %sub, 1, !dbg !1417
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1418
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1419
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1421
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1421
  %div12 = udiv i32 %9, %10, !dbg !1421, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1424
  %div13 = sdiv i32 %11, %12, !dbg !1424, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1425
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1426
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1427
  store i32 %13, i32* %retval, align 4, !dbg !1428
  br label %return, !dbg !1428

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1429
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1432
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1433

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1434
  br label %return, !dbg !1434

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1436
  %sub18 = sub nsw i32 0, %15, !dbg !1438
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1439
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1440
  %sub19 = sub nsw i32 0, %16, !dbg !1441
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1442
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1443
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1444
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1446
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1446
  %div20 = sdiv i32 %18, %19, !dbg !1446, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1447
  %mul21 = mul nsw i32 %div20, %20, !dbg !1448
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1449
  %shl23 = shl i32 %sub22, 1, !dbg !1450
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1451
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1452
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1453
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1454
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1454
  %div24 = udiv i32 %21, %22, !dbg !1454, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1455
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1457
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1457
  %div25 = sdiv i32 %23, %24, !dbg !1457, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1458
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1459
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1460
  store i32 %25, i32* %retval, align 4, !dbg !1461
  br label %return, !dbg !1461

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1462
  ret i32 %26, !dbg !1462
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1463 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1466, metadata !DIExpression()), !dbg !1467
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1468, metadata !DIExpression()), !dbg !1469
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1470, metadata !DIExpression()), !dbg !1471
  store i32 0, i32* %u32Temp1, align 4, !dbg !1471
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1472, metadata !DIExpression()), !dbg !1473
  store i32 0, i32* %u32Temp2, align 4, !dbg !1473
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1474, metadata !DIExpression()), !dbg !1475
  store i32 0, i32* %u32Temp3, align 4, !dbg !1475
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1476, metadata !DIExpression()), !dbg !1477
  store i32 0, i32* %numerator_old, align 4, !dbg !1477
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1478
  %cmp = icmp eq i32 %0, 0, !dbg !1480
  br i1 %cmp, label %if.then, label %if.else, !dbg !1481

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1482
  br label %return, !dbg !1482

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1484
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1487
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1489
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1489
  %div = udiv i32 %3, %4, !dbg !1489, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1490
  %sub = sub i32 %1, %mul, !dbg !1491
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1492
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1493
  %and = and i32 %5, 1, !dbg !1495
  %cmp1 = icmp eq i32 %and, 0, !dbg !1496
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1497

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %shr = lshr i32 %6, 1, !dbg !1500
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1501
  br label %if.end, !dbg !1502

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %shr4 = lshr i32 %7, 1, !dbg !1505
  %add = add i32 %shr4, 1, !dbg !1506
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1507
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1508
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1510
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1511
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1512

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1513
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1515
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1516
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1516
  %div7 = udiv i32 %10, %11, !dbg !1516, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1517
  br label %return, !dbg !1517

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1518
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1520
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1521
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1521
  %div9 = udiv i32 %12, %13, !dbg !1521, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1522
  store i32 %add10, i32* %retval, align 4, !dbg !1523
  br label %return, !dbg !1523

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1524
  ret i32 %14, !dbg !1524
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1525 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1528, metadata !DIExpression()), !dbg !1529
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1530, metadata !DIExpression()), !dbg !1531
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1532, metadata !DIExpression()), !dbg !1533
  store i32 0, i32* %u32Temp1, align 4, !dbg !1533
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1534, metadata !DIExpression()), !dbg !1535
  store i32 0, i32* %u32Temp2, align 4, !dbg !1535
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1536
  %cmp = icmp sle i32 %0, 0, !dbg !1538
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1539

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %cmp1 = icmp sge i32 %1, 0, !dbg !1543
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1544

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1545
  br label %return, !dbg !1545

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1547
  %sub = sub nsw i32 0, %2, !dbg !1549
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1550
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1551
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1552
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1554
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1554
  %div = udiv i32 %4, %5, !dbg !1554, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1555
  %mul = mul i32 %div, %6, !dbg !1556
  %sub3 = sub i32 %3, %mul, !dbg !1557
  %shl = shl i32 %sub3, 1, !dbg !1558
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1559
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1560
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1561
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1562
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1562
  %div4 = udiv i32 %7, %8, !dbg !1562, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1564
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1565
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1565
  %div5 = udiv i32 %9, %10, !dbg !1565, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1566
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1567
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1568
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1570
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1571

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1572
  %sub8 = sub i32 0, %12, !dbg !1574
  store i32 %sub8, i32* %retval, align 4, !dbg !1575
  br label %return, !dbg !1575

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1576
  br label %return, !dbg !1576

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1578
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1580
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1582
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1582
  %div11 = udiv i32 %14, %15, !dbg !1582, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %mul12 = mul i32 %div11, %16, !dbg !1584
  %sub13 = sub i32 %13, %mul12, !dbg !1585
  %shl14 = shl i32 %sub13, 1, !dbg !1586
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1587
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1588
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1589
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1590
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1590
  %div15 = udiv i32 %17, %18, !dbg !1590, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1591
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1592
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1593
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1593
  %div16 = udiv i32 %19, %20, !dbg !1593, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1594
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1595
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1596
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1598
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1599

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1600
  store i32 %22, i32* %retval, align 4, !dbg !1602
  br label %return, !dbg !1602

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1603
  br label %return, !dbg !1603

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1605
  ret i32 %23, !dbg !1605
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1606 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1609, metadata !DIExpression()), !dbg !1610
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1611, metadata !DIExpression()), !dbg !1612
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1613, metadata !DIExpression()), !dbg !1614
  store i32 0, i32* %s32Temp1, align 4, !dbg !1614
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1615, metadata !DIExpression()), !dbg !1616
  store i32 0, i32* %s32Temp2, align 4, !dbg !1616
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1617, metadata !DIExpression()), !dbg !1618
  store i32 0, i32* %u32Temp0, align 4, !dbg !1618
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1619, metadata !DIExpression()), !dbg !1620
  store i32 0, i32* %u32Temp1, align 4, !dbg !1620
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1621, metadata !DIExpression()), !dbg !1622
  store i32 0, i32* %u32Temp2, align 4, !dbg !1622
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1623
  %cmp = icmp eq i32 %0, 0, !dbg !1625
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1626

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1627
  %cmp1 = icmp slt i32 %1, 0, !dbg !1630
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1631

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1632
  br label %return, !dbg !1632

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1634
  br label %return, !dbg !1634

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1636
  %cmp4 = icmp sle i32 %2, 0, !dbg !1639
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1640

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1641
  %sub = sub nsw i32 0, %3, !dbg !1643
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1644
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1645
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1646
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1647
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1647
  %div = udiv i32 %4, %5, !dbg !1647, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1648
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1649
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1650
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1651
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1652
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1652
  %div6 = udiv i32 %7, %8, !dbg !1652, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1653
  %mul = mul i32 %div6, %9, !dbg !1654
  %sub7 = sub i32 %6, %mul, !dbg !1655
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1656
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1657
  %and = and i32 %10, 1, !dbg !1659
  %cmp8 = icmp eq i32 %and, 0, !dbg !1660
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1661

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1662
  %shr = lshr i32 %11, 1, !dbg !1664
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1665
  br label %if.end, !dbg !1666

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1667
  %shr11 = lshr i32 %12, 1, !dbg !1669
  %add = add i32 %shr11, 1, !dbg !1670
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1671
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1672
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1674
  %cmp12 = icmp ult i32 %13, %14, !dbg !1675
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1676

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1677
  %neg = xor i32 %15, -1, !dbg !1679
  %add14 = add i32 %neg, 1, !dbg !1680
  store i32 %add14, i32* %retval, align 4, !dbg !1681
  br label %return, !dbg !1681

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1682
  %add16 = add i32 %16, 1, !dbg !1684
  %neg17 = xor i32 %add16, -1, !dbg !1685
  %add18 = add i32 %neg17, 1, !dbg !1686
  store i32 %add18, i32* %retval, align 4, !dbg !1687
  br label %return, !dbg !1687

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1688
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1690
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1692
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1692
  %div20 = udiv i32 %18, %19, !dbg !1692, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1693
  %mul21 = mul i32 %div20, %20, !dbg !1694
  %sub22 = sub i32 %17, %mul21, !dbg !1695
  %shl = shl i32 %sub22, 1, !dbg !1696
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1697
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1698
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1699
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1700
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1700
  %div23 = udiv i32 %21, %22, !dbg !1700, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1701
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1702
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1703
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1703
  %div24 = udiv i32 %23, %24, !dbg !1703, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1704
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1705
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1706
  store i32 %25, i32* %retval, align 4, !dbg !1707
  br label %return, !dbg !1707

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1708
  ret i32 %26, !dbg !1708
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1709 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1712, metadata !DIExpression()), !dbg !1713
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1714, metadata !DIExpression()), !dbg !1715
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1716, metadata !DIExpression()), !dbg !1717
  store i32 0, i32* %s32Temp1, align 4, !dbg !1717
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1718, metadata !DIExpression()), !dbg !1719
  store i32 0, i32* %s32Temp2, align 4, !dbg !1719
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1720, metadata !DIExpression()), !dbg !1721
  store i32 0, i32* %denominator_prime, align 4, !dbg !1721
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1722, metadata !DIExpression()), !dbg !1723
  store i32 0, i32* %u32Temp1, align 4, !dbg !1723
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1724, metadata !DIExpression()), !dbg !1725
  store i32 0, i32* %u32Temp2, align 4, !dbg !1725
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1726, metadata !DIExpression()), !dbg !1727
  store i32 0, i32* %u32numerator, align 4, !dbg !1727
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1728, metadata !DIExpression()), !dbg !1729
  store i32 0, i32* %u32denominator, align 4, !dbg !1729
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1730
  %cmp = icmp slt i32 %0, 0, !dbg !1732
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1733

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1734
  %cmp1 = icmp sle i32 %1, 0, !dbg !1737
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1738

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1739
  %cmp3 = icmp sge i32 %2, 0, !dbg !1742
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1743

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1744
  br label %return, !dbg !1744

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1746
  %sub = sub nsw i32 0, %3, !dbg !1748
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1749
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1750
  %sub5 = sub nsw i32 0, %4, !dbg !1751
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1752
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1753
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1754
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1755
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1756
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1756
  %div = udiv i32 %6, %7, !dbg !1756, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1757
  %mul = mul i32 %div, %8, !dbg !1758
  %sub6 = sub i32 %5, %mul, !dbg !1759
  %shl = shl i32 %sub6, 1, !dbg !1760
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1761
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1762
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1763
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1764
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1764
  %div7 = udiv i32 %9, %10, !dbg !1764, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1765
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1766
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1767
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1767
  %div8 = udiv i32 %11, %12, !dbg !1767, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1768
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1769
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1770
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1772
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1773

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1774
  store i32 %14, i32* %retval, align 4, !dbg !1776
  br label %return, !dbg !1776

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1777
  br label %return, !dbg !1777

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1779
  %neg = xor i32 %15, -1, !dbg !1781
  %add13 = add nsw i32 %neg, 1, !dbg !1782
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1783
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1784
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1785
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1786
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1787
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1787
  %div14 = udiv i32 %17, %18, !dbg !1787, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %mul15 = mul i32 %div14, %19, !dbg !1789
  %sub16 = sub i32 %16, %mul15, !dbg !1790
  %shl17 = shl i32 %sub16, 1, !dbg !1791
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1792
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1793
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1794
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1795
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1795
  %div18 = udiv i32 %20, %21, !dbg !1795, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1796
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1797
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1798
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1798
  %div19 = sdiv i32 %22, %23, !dbg !1798, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1799
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1800
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1801
  %neg21 = xor i32 %24, -1, !dbg !1802
  %add22 = add nsw i32 %neg21, 1, !dbg !1803
  store i32 %add22, i32* %retval, align 4, !dbg !1804
  br label %return, !dbg !1804

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1805
  %cmp24 = icmp sle i32 %25, 0, !dbg !1808
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1809

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1810
  %cmp26 = icmp sge i32 %26, 0, !dbg !1813
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1814

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1815
  br label %return, !dbg !1815

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1817
  %neg29 = xor i32 %27, -1, !dbg !1819
  %add30 = add nsw i32 %neg29, 1, !dbg !1820
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1821
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1822
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1823
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1824
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1825
  %div31 = udiv i32 %29, %30, !dbg !1825, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1826
  %mul32 = mul i32 %div31, %31, !dbg !1827
  %sub33 = sub i32 %28, %mul32, !dbg !1828
  %shl34 = shl i32 %sub33, 1, !dbg !1829
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1830
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1832
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1833
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1833
  %div35 = udiv i32 %32, %33, !dbg !1833, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1834
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1835
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1836
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1836
  %div36 = udiv i32 %34, %35, !dbg !1836, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1837
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1838
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1839
  %neg38 = xor i32 %36, -1, !dbg !1840
  %add39 = add nsw i32 %neg38, 1, !dbg !1841
  store i32 %add39, i32* %retval, align 4, !dbg !1842
  br label %return, !dbg !1842

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1843
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1845
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1846
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1847
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1847
  %div41 = sdiv i32 %38, %39, !dbg !1847, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1848
  %mul42 = mul nsw i32 %div41, %40, !dbg !1849
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1850
  %shl44 = shl i32 %sub43, 1, !dbg !1851
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1852
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1853
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1854
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1855
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1855
  %div45 = sdiv i32 %41, %42, !dbg !1855, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1856
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1857
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1858
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1858
  %div46 = udiv i32 %43, %44, !dbg !1858, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1859
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1860
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1861
  store i32 %45, i32* %retval, align 4, !dbg !1862
  br label %return, !dbg !1862

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1863
  ret i32 %46, !dbg !1863
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1864 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1867, metadata !DIExpression()), !dbg !1868
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1869, metadata !DIExpression()), !dbg !1870
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1871, metadata !DIExpression()), !dbg !1872
  store i32 0, i32* %numerator_prime, align 4, !dbg !1872
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1873, metadata !DIExpression()), !dbg !1874
  store i32 0, i32* %u32Temp1, align 4, !dbg !1874
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1875, metadata !DIExpression()), !dbg !1876
  store i32 0, i32* %u32Temp2, align 4, !dbg !1876
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1877, metadata !DIExpression()), !dbg !1878
  store i32 0, i32* %u32Temp3, align 4, !dbg !1878
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1879, metadata !DIExpression()), !dbg !1880
  store i32 0, i32* %s32Temp1, align 4, !dbg !1880
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1881, metadata !DIExpression()), !dbg !1882
  store i32 0, i32* %s32Temp2, align 4, !dbg !1882
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1883, metadata !DIExpression()), !dbg !1884
  store i32 0, i32* %s32Temp3, align 4, !dbg !1884
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1885
  %cmp = icmp eq i32 %0, 0, !dbg !1887
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1888

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1889
  %cmp1 = icmp slt i32 %1, 0, !dbg !1892
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1893

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1894
  br label %return, !dbg !1894

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1896
  br label %return, !dbg !1896

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1898
  %cmp4 = icmp slt i32 %2, 0, !dbg !1901
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1902

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1903
  %sub = sub nsw i32 0, %3, !dbg !1905
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1906
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1907
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1908
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1909
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1909
  %div = udiv i32 %4, %5, !dbg !1909, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1910
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1911
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1912
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1913
  %mul = mul i32 %7, %8, !dbg !1914
  %sub6 = sub i32 %6, %mul, !dbg !1915
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1916
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1917
  %and = and i32 %9, 1, !dbg !1919
  %cmp7 = icmp eq i32 %and, 0, !dbg !1920
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1921

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1922
  %shr = lshr i32 %10, 1, !dbg !1924
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1925
  br label %if.end, !dbg !1926

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1927
  %shr10 = lshr i32 %11, 1, !dbg !1929
  %add = add i32 %shr10, 1, !dbg !1930
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1931
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1932
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1934
  %cmp11 = icmp ult i32 %12, %13, !dbg !1935
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1936

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1937
  %neg = xor i32 %14, -1, !dbg !1939
  %add13 = add i32 %neg, 1, !dbg !1940
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1941
  br label %if.end18, !dbg !1942

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1943
  %add15 = add i32 %15, 1, !dbg !1945
  %neg16 = xor i32 %add15, -1, !dbg !1946
  %add17 = add i32 %neg16, 1, !dbg !1947
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1948
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1949
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1951
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1952

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1953
  %conv = trunc i32 %17 to i16, !dbg !1955
  store i16 %conv, i16* %retval, align 2, !dbg !1956
  br label %return, !dbg !1956

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1957
  br label %return, !dbg !1957

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1959
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1961
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1962
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1962
  %div23 = udiv i32 %18, %19, !dbg !1962, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1963
  %mul24 = mul i32 %div23, %20, !dbg !1964
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1965
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1966
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1967
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1968
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1969
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1969
  %div25 = udiv i32 %22, %23, !dbg !1969, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1970
  %mul26 = mul i32 %div25, %24, !dbg !1971
  %sub27 = sub i32 %21, %mul26, !dbg !1972
  %shl = shl i32 %sub27, 1, !dbg !1973
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1974
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1975
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1976
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1977
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1977
  %div28 = udiv i32 %25, %26, !dbg !1977, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1978
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1979
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1980
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1980
  %div29 = udiv i32 %27, %28, !dbg !1980, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1981
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1982
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1983
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1985
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1986

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1987
  %conv34 = trunc i32 %30 to i16, !dbg !1989
  store i16 %conv34, i16* %retval, align 2, !dbg !1990
  br label %return, !dbg !1990

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1991
  br label %return, !dbg !1991

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1993
  ret i16 %31, !dbg !1993
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1994 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2000, metadata !DIExpression()), !dbg !2001
  %2 = icmp eq i64 %0, 0, !dbg !2002
  br i1 %2, label %3, label %4, !dbg !2004

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2005
  unreachable, !dbg !2005

4:                                                ; preds = %1
  ret void, !dbg !2006
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2007 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2013, metadata !DIExpression()), !dbg !2015
  call void @llvm.dbg.value(metadata i64 %1, metadata !2014, metadata !DIExpression()), !dbg !2015
  %3 = icmp ult i64 %1, %0, !dbg !2016
  br i1 %3, label %5, label %4, !dbg !2018

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2019
  unreachable, !dbg !2019

5:                                                ; preds = %2
  ret void, !dbg !2021
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124/div_Ccode_alarm_0124.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124")
!4 = !{}
!5 = !{!6, !13, !18, !21, !25, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124")
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
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !20)
!20 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !24)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !27)
!27 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !15, line: 25, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !31)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !18)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124")
!50 = !DISubroutineType(types: !51)
!51 = !{!24}
!52 = !DILocalVariable(name: "x_value", scope: !48, file: !49, line: 9, type: !22)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "y_value", scope: !48, file: !49, line: 10, type: !29)
!55 = !DILocation(line: 10, column: 14, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !29)
!57 = !DILocation(line: 11, column: 14, scope: !48)
!58 = !DILocation(line: 13, column: 24, scope: !48)
!59 = !DILocation(line: 13, column: 5, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 16, column: 30, scope: !48)
!63 = !DILocation(line: 16, column: 39, scope: !48)
!64 = !DILocation(line: 16, column: 14, scope: !48)
!65 = !DILocation(line: 16, column: 12, scope: !48)
!66 = !DILocation(line: 18, column: 11, scope: !48)
!67 = !DILocation(line: 19, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124")
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
!377 = !DILocalVariable(name: "denominator", arg: 2, scope: !374, file: !69, line: 399, type: !28)
!378 = !DILocation(line: 399, column: 45, scope: !374)
!379 = !DILocalVariable(name: "u16Temp1", scope: !374, file: !69, line: 401, type: !28)
!380 = !DILocation(line: 401, column: 6, scope: !374)
!381 = !DILocalVariable(name: "s32Temp1", scope: !374, file: !69, line: 402, type: !21)
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
!422 = !{!13, !28, !28}
!423 = !DILocalVariable(name: "numerator", arg: 1, scope: !420, file: !69, line: 440, type: !28)
!424 = !DILocation(line: 440, column: 28, scope: !420)
!425 = !DILocalVariable(name: "denominator", arg: 2, scope: !420, file: !69, line: 440, type: !28)
!426 = !DILocation(line: 440, column: 43, scope: !420)
!427 = !DILocalVariable(name: "u32Temp1", scope: !420, file: !69, line: 442, type: !428)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !25)
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
!465 = !{!28, !21, !28}
!466 = !DILocalVariable(name: "x_value", arg: 1, scope: !463, file: !69, line: 478, type: !21)
!467 = !DILocation(line: 478, column: 25, scope: !463)
!468 = !DILocalVariable(name: "y_value", arg: 2, scope: !463, file: !69, line: 478, type: !28)
!469 = !DILocation(line: 478, column: 38, scope: !463)
!470 = !DILocalVariable(name: "s32Temp1", scope: !463, file: !69, line: 480, type: !21)
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
!489 = !DILocation(line: 496, column: 63, scope: !490)
!490 = distinct !DILexicalBlock(scope: !491, file: !69, line: 496, column: 7)
!491 = distinct !DILexicalBlock(scope: !476, file: !69, line: 494, column: 2)
!492 = !DILocation(line: 496, column: 85, scope: !490)
!493 = !DILocation(line: 496, column: 100, scope: !490)
!494 = !DILocation(line: 496, column: 95, scope: !490)
!495 = !DILocation(line: 496, column: 93, scope: !490)
!496 = !DILocation(line: 496, column: 116, scope: !490)
!497 = !DILocation(line: 496, column: 111, scope: !490)
!498 = !DILocation(line: 496, column: 109, scope: !490)
!499 = !DILocation(line: 496, column: 71, scope: !490)
!500 = !DILocation(line: 496, column: 47, scope: !490)
!501 = !DILocation(line: 496, column: 9, scope: !490)
!502 = !DILocation(line: 496, column: 7, scope: !491)
!503 = !DILocation(line: 497, column: 7, scope: !504)
!504 = distinct !DILexicalBlock(scope: !490, file: !69, line: 496, column: 130)
!505 = !DILocation(line: 500, column: 53, scope: !506)
!506 = distinct !DILexicalBlock(scope: !491, file: !69, line: 500, column: 7)
!507 = !DILocation(line: 500, column: 75, scope: !506)
!508 = !DILocation(line: 500, column: 90, scope: !506)
!509 = !DILocation(line: 500, column: 85, scope: !506)
!510 = !DILocation(line: 500, column: 83, scope: !506)
!511 = !DILocation(line: 500, column: 106, scope: !506)
!512 = !DILocation(line: 500, column: 101, scope: !506)
!513 = !DILocation(line: 500, column: 99, scope: !506)
!514 = !DILocation(line: 500, column: 61, scope: !506)
!515 = !DILocation(line: 500, column: 37, scope: !506)
!516 = !DILocation(line: 500, column: 9, scope: !506)
!517 = !DILocation(line: 500, column: 7, scope: !491)
!518 = !DILocation(line: 501, column: 7, scope: !519)
!519 = distinct !DILexicalBlock(scope: !506, file: !69, line: 500, column: 135)
!520 = !DILocation(line: 504, column: 50, scope: !521)
!521 = distinct !DILexicalBlock(scope: !491, file: !69, line: 504, column: 7)
!522 = !DILocation(line: 504, column: 65, scope: !521)
!523 = !DILocation(line: 504, column: 60, scope: !521)
!524 = !DILocation(line: 504, column: 58, scope: !521)
!525 = !DILocation(line: 504, column: 34, scope: !521)
!526 = !DILocation(line: 504, column: 91, scope: !521)
!527 = !DILocation(line: 504, column: 86, scope: !521)
!528 = !DILocation(line: 504, column: 76, scope: !521)
!529 = !DILocation(line: 504, column: 9, scope: !521)
!530 = !DILocation(line: 504, column: 7, scope: !491)
!531 = !DILocation(line: 505, column: 7, scope: !532)
!532 = distinct !DILexicalBlock(scope: !521, file: !69, line: 504, column: 103)
!533 = !DILocation(line: 508, column: 50, scope: !534)
!534 = distinct !DILexicalBlock(scope: !491, file: !69, line: 508, column: 7)
!535 = !DILocation(line: 508, column: 65, scope: !534)
!536 = !DILocation(line: 508, column: 60, scope: !534)
!537 = !DILocation(line: 508, column: 58, scope: !534)
!538 = !DILocation(line: 508, column: 34, scope: !534)
!539 = !DILocation(line: 508, column: 91, scope: !534)
!540 = !DILocation(line: 508, column: 86, scope: !534)
!541 = !DILocation(line: 508, column: 76, scope: !534)
!542 = !DILocation(line: 508, column: 9, scope: !534)
!543 = !DILocation(line: 508, column: 7, scope: !491)
!544 = !DILocation(line: 509, column: 7, scope: !545)
!545 = distinct !DILexicalBlock(scope: !534, file: !69, line: 508, column: 103)
!546 = !DILocation(line: 511, column: 15, scope: !491)
!547 = !DILocation(line: 511, column: 27, scope: !491)
!548 = !DILocation(line: 511, column: 35, scope: !491)
!549 = !DILocation(line: 511, column: 34, scope: !491)
!550 = !DILocation(line: 511, column: 46, scope: !491)
!551 = !DILocation(line: 511, column: 44, scope: !491)
!552 = !DILocation(line: 511, column: 23, scope: !491)
!553 = !DILocation(line: 511, column: 56, scope: !491)
!554 = !DILocation(line: 511, column: 12, scope: !491)
!555 = !DILocation(line: 513, column: 50, scope: !556)
!556 = distinct !DILexicalBlock(scope: !491, file: !69, line: 513, column: 7)
!557 = !DILocation(line: 513, column: 66, scope: !556)
!558 = !DILocation(line: 513, column: 61, scope: !556)
!559 = !DILocation(line: 513, column: 59, scope: !556)
!560 = !DILocation(line: 513, column: 34, scope: !556)
!561 = !DILocation(line: 513, column: 93, scope: !556)
!562 = !DILocation(line: 513, column: 108, scope: !556)
!563 = !DILocation(line: 513, column: 103, scope: !556)
!564 = !DILocation(line: 513, column: 101, scope: !556)
!565 = !DILocation(line: 513, column: 77, scope: !556)
!566 = !DILocation(line: 513, column: 9, scope: !556)
!567 = !DILocation(line: 513, column: 7, scope: !491)
!568 = !DILocation(line: 514, column: 7, scope: !569)
!569 = distinct !DILexicalBlock(scope: !556, file: !69, line: 513, column: 121)
!570 = !DILocation(line: 521, column: 41, scope: !491)
!571 = !DILocation(line: 521, column: 57, scope: !491)
!572 = !DILocation(line: 521, column: 52, scope: !491)
!573 = !DILocation(line: 521, column: 50, scope: !491)
!574 = !DILocation(line: 521, column: 74, scope: !491)
!575 = !DILocation(line: 521, column: 89, scope: !491)
!576 = !DILocation(line: 521, column: 84, scope: !491)
!577 = !DILocation(line: 521, column: 82, scope: !491)
!578 = !DILocation(line: 521, column: 66, scope: !491)
!579 = !DILocation(line: 521, column: 25, scope: !491)
!580 = !DILocation(line: 521, column: 23, scope: !491)
!581 = !DILocation(line: 522, column: 3, scope: !491)
!582 = !DILocation(line: 539, column: 1, scope: !463)
!583 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !584, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!584 = !DISubroutineType(types: !585)
!585 = !{!24, !18}
!586 = !DILocalVariable(name: "left", arg: 1, scope: !583, file: !33, line: 84, type: !18)
!587 = !DILocation(line: 84, column: 51, scope: !583)
!588 = !DILocation(line: 86, column: 12, scope: !583)
!589 = !DILocation(line: 86, column: 17, scope: !583)
!590 = !DILocation(line: 86, column: 5, scope: !583)
!591 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !592, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!592 = !DISubroutineType(types: !593)
!593 = !{!24, !18, !25}
!594 = !DILocalVariable(name: "left", arg: 1, scope: !591, file: !33, line: 90, type: !18)
!595 = !DILocation(line: 90, column: 41, scope: !591)
!596 = !DILocalVariable(name: "count", arg: 2, scope: !591, file: !33, line: 90, type: !25)
!597 = !DILocation(line: 90, column: 56, scope: !591)
!598 = !DILocation(line: 92, column: 9, scope: !599)
!599 = distinct !DILexicalBlock(scope: !591, file: !33, line: 92, column: 9)
!600 = !DILocation(line: 92, column: 15, scope: !599)
!601 = !DILocation(line: 92, column: 9, scope: !591)
!602 = !DILocation(line: 93, column: 9, scope: !603)
!603 = distinct !DILexicalBlock(scope: !599, file: !33, line: 92, column: 32)
!604 = !DILocation(line: 95, column: 12, scope: !591)
!605 = !DILocation(line: 95, column: 34, scope: !591)
!606 = !DILocation(line: 95, column: 31, scope: !591)
!607 = !DILocation(line: 95, column: 17, scope: !591)
!608 = !DILocation(line: 95, column: 41, scope: !591)
!609 = !DILocation(line: 95, column: 5, scope: !591)
!610 = !DILocation(line: 96, column: 1, scope: !591)
!611 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !612, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!612 = !DISubroutineType(types: !613)
!613 = !{!24, !18, !18}
!614 = !DILocalVariable(name: "left", arg: 1, scope: !611, file: !33, line: 78, type: !18)
!615 = !DILocation(line: 78, column: 38, scope: !611)
!616 = !DILocalVariable(name: "right", arg: 2, scope: !611, file: !33, line: 78, type: !18)
!617 = !DILocation(line: 78, column: 52, scope: !611)
!618 = !DILocation(line: 80, column: 12, scope: !611)
!619 = !DILocation(line: 80, column: 19, scope: !611)
!620 = !DILocation(line: 80, column: 17, scope: !611)
!621 = !DILocation(line: 80, column: 25, scope: !611)
!622 = !DILocation(line: 80, column: 5, scope: !611)
!623 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !612, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!624 = !DILocalVariable(name: "left", arg: 1, scope: !623, file: !33, line: 72, type: !18)
!625 = !DILocation(line: 72, column: 38, scope: !623)
!626 = !DILocalVariable(name: "right", arg: 2, scope: !623, file: !33, line: 72, type: !18)
!627 = !DILocation(line: 72, column: 52, scope: !623)
!628 = !DILocation(line: 74, column: 12, scope: !623)
!629 = !DILocation(line: 74, column: 19, scope: !623)
!630 = !DILocation(line: 74, column: 17, scope: !623)
!631 = !DILocation(line: 74, column: 25, scope: !623)
!632 = !DILocation(line: 74, column: 5, scope: !623)
!633 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !612, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!634 = !DILocalVariable(name: "left", arg: 1, scope: !633, file: !33, line: 54, type: !18)
!635 = !DILocation(line: 54, column: 38, scope: !633)
!636 = !DILocalVariable(name: "right", arg: 2, scope: !633, file: !33, line: 54, type: !18)
!637 = !DILocation(line: 54, column: 52, scope: !633)
!638 = !DILocation(line: 56, column: 12, scope: !633)
!639 = !DILocation(line: 56, column: 19, scope: !633)
!640 = !DILocation(line: 56, column: 17, scope: !633)
!641 = !DILocation(line: 56, column: 25, scope: !633)
!642 = !DILocation(line: 56, column: 5, scope: !633)
!643 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 557, type: !644, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!644 = !DISubroutineType(types: !645)
!645 = !{!28, !28, !28}
!646 = !DILocalVariable(name: "numerator", arg: 1, scope: !643, file: !69, line: 557, type: !28)
!647 = !DILocation(line: 557, column: 31, scope: !643)
!648 = !DILocalVariable(name: "denominator", arg: 2, scope: !643, file: !69, line: 557, type: !28)
!649 = !DILocation(line: 557, column: 46, scope: !643)
!650 = !DILocalVariable(name: "u32Temp", scope: !643, file: !69, line: 559, type: !428)
!651 = !DILocation(line: 559, column: 6, scope: !643)
!652 = !DILocation(line: 560, column: 5, scope: !653)
!653 = distinct !DILexicalBlock(scope: !643, file: !69, line: 560, column: 5)
!654 = !DILocation(line: 560, column: 17, scope: !653)
!655 = !DILocation(line: 560, column: 5, scope: !643)
!656 = !DILocation(line: 562, column: 3, scope: !657)
!657 = distinct !DILexicalBlock(scope: !653, file: !69, line: 561, column: 2)
!658 = !DILocation(line: 566, column: 14, scope: !659)
!659 = distinct !DILexicalBlock(scope: !653, file: !69, line: 565, column: 2)
!660 = !DILocation(line: 566, column: 23, scope: !659)
!661 = !DILocation(line: 566, column: 32, scope: !659)
!662 = !DILocation(line: 566, column: 44, scope: !659)
!663 = !DILocation(line: 566, column: 29, scope: !659)
!664 = !DILocation(line: 566, column: 11, scope: !659)
!665 = !DILocation(line: 567, column: 13, scope: !659)
!666 = !DILocation(line: 567, column: 21, scope: !659)
!667 = !DILocation(line: 567, column: 20, scope: !659)
!668 = !DILocation(line: 567, column: 11, scope: !659)
!669 = !DILocation(line: 568, column: 6, scope: !670)
!670 = distinct !DILexicalBlock(scope: !659, file: !69, line: 568, column: 6)
!671 = !DILocation(line: 568, column: 14, scope: !670)
!672 = !DILocation(line: 568, column: 6, scope: !659)
!673 = !DILocation(line: 570, column: 11, scope: !674)
!674 = distinct !DILexicalBlock(scope: !670, file: !69, line: 569, column: 3)
!675 = !DILocation(line: 570, column: 19, scope: !674)
!676 = !DILocation(line: 570, column: 4, scope: !674)
!677 = !DILocation(line: 574, column: 4, scope: !678)
!678 = distinct !DILexicalBlock(scope: !670, file: !69, line: 573, column: 3)
!679 = !DILocation(line: 578, column: 1, scope: !643)
!680 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 595, type: !681, scopeLine: 596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!681 = !DISubroutineType(types: !682)
!682 = !{!28, !428, !28}
!683 = !DILocalVariable(name: "x_value", arg: 1, scope: !680, file: !69, line: 595, type: !428)
!684 = !DILocation(line: 595, column: 25, scope: !680)
!685 = !DILocalVariable(name: "y_value", arg: 2, scope: !680, file: !69, line: 595, type: !28)
!686 = !DILocation(line: 595, column: 38, scope: !680)
!687 = !DILocalVariable(name: "u32Temp1", scope: !680, file: !69, line: 597, type: !428)
!688 = !DILocation(line: 597, column: 6, scope: !680)
!689 = !DILocalVariable(name: "u32Temp2", scope: !680, file: !69, line: 597, type: !428)
!690 = !DILocation(line: 597, column: 17, scope: !680)
!691 = !DILocation(line: 598, column: 12, scope: !680)
!692 = !DILocation(line: 598, column: 20, scope: !680)
!693 = !DILocation(line: 598, column: 10, scope: !680)
!694 = !DILocation(line: 599, column: 5, scope: !695)
!695 = distinct !DILexicalBlock(scope: !680, file: !69, line: 599, column: 5)
!696 = !DILocation(line: 599, column: 13, scope: !695)
!697 = !DILocation(line: 599, column: 5, scope: !680)
!698 = !DILocation(line: 601, column: 3, scope: !699)
!699 = distinct !DILexicalBlock(scope: !695, file: !69, line: 600, column: 2)
!700 = !DILocation(line: 605, column: 14, scope: !701)
!701 = distinct !DILexicalBlock(scope: !695, file: !69, line: 604, column: 2)
!702 = !DILocation(line: 605, column: 22, scope: !701)
!703 = !DILocation(line: 605, column: 21, scope: !701)
!704 = !DILocation(line: 605, column: 12, scope: !701)
!705 = !DILocation(line: 606, column: 14, scope: !701)
!706 = !DILocation(line: 606, column: 25, scope: !701)
!707 = !DILocation(line: 606, column: 36, scope: !701)
!708 = !DILocation(line: 606, column: 34, scope: !701)
!709 = !DILocation(line: 606, column: 22, scope: !701)
!710 = !DILocation(line: 606, column: 45, scope: !701)
!711 = !DILocation(line: 606, column: 12, scope: !701)
!712 = !DILocation(line: 607, column: 15, scope: !701)
!713 = !DILocation(line: 607, column: 24, scope: !701)
!714 = !DILocation(line: 607, column: 23, scope: !701)
!715 = !DILocation(line: 607, column: 36, scope: !701)
!716 = !DILocation(line: 607, column: 44, scope: !701)
!717 = !DILocation(line: 607, column: 43, scope: !701)
!718 = !DILocation(line: 607, column: 33, scope: !701)
!719 = !DILocation(line: 607, column: 12, scope: !701)
!720 = !DILocation(line: 608, column: 6, scope: !721)
!721 = distinct !DILexicalBlock(scope: !701, file: !69, line: 608, column: 6)
!722 = !DILocation(line: 608, column: 15, scope: !721)
!723 = !DILocation(line: 608, column: 6, scope: !701)
!724 = !DILocation(line: 610, column: 11, scope: !725)
!725 = distinct !DILexicalBlock(scope: !721, file: !69, line: 609, column: 3)
!726 = !DILocation(line: 610, column: 20, scope: !725)
!727 = !DILocation(line: 610, column: 4, scope: !725)
!728 = !DILocation(line: 614, column: 4, scope: !729)
!729 = distinct !DILexicalBlock(scope: !721, file: !69, line: 613, column: 3)
!730 = !DILocation(line: 618, column: 1, scope: !680)
!731 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 637, type: !732, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!732 = !DISubroutineType(types: !733)
!733 = !{!6, !6, !28, !6}
!734 = !DILocalVariable(name: "factor1", arg: 1, scope: !731, file: !69, line: 637, type: !6)
!735 = !DILocation(line: 637, column: 33, scope: !731)
!736 = !DILocalVariable(name: "factor2", arg: 2, scope: !731, file: !69, line: 637, type: !28)
!737 = !DILocation(line: 637, column: 46, scope: !731)
!738 = !DILocalVariable(name: "denominator", arg: 3, scope: !731, file: !69, line: 637, type: !6)
!739 = !DILocation(line: 637, column: 59, scope: !731)
!740 = !DILocalVariable(name: "s32Result", scope: !731, file: !69, line: 639, type: !21)
!741 = !DILocation(line: 639, column: 6, scope: !731)
!742 = !DILocalVariable(name: "s32Temp1", scope: !731, file: !69, line: 639, type: !21)
!743 = !DILocation(line: 639, column: 21, scope: !731)
!744 = !DILocation(line: 640, column: 14, scope: !731)
!745 = !DILocation(line: 640, column: 24, scope: !731)
!746 = !DILocation(line: 640, column: 22, scope: !731)
!747 = !DILocation(line: 640, column: 12, scope: !731)
!748 = !DILocation(line: 641, column: 5, scope: !749)
!749 = distinct !DILexicalBlock(scope: !731, file: !69, line: 641, column: 5)
!750 = !DILocation(line: 641, column: 17, scope: !749)
!751 = !DILocation(line: 641, column: 5, scope: !731)
!752 = !DILocation(line: 643, column: 6, scope: !753)
!753 = distinct !DILexicalBlock(scope: !754, file: !69, line: 643, column: 6)
!754 = distinct !DILexicalBlock(scope: !749, file: !69, line: 642, column: 2)
!755 = !DILocation(line: 643, column: 16, scope: !753)
!756 = !DILocation(line: 643, column: 6, scope: !754)
!757 = !DILocation(line: 645, column: 4, scope: !758)
!758 = distinct !DILexicalBlock(scope: !753, file: !69, line: 644, column: 3)
!759 = !DILocation(line: 649, column: 4, scope: !760)
!760 = distinct !DILexicalBlock(scope: !753, file: !69, line: 648, column: 3)
!761 = !DILocation(line: 654, column: 14, scope: !762)
!762 = distinct !DILexicalBlock(scope: !749, file: !69, line: 653, column: 2)
!763 = !DILocation(line: 654, column: 27, scope: !762)
!764 = !DILocation(line: 654, column: 37, scope: !762)
!765 = !DILocation(line: 654, column: 36, scope: !762)
!766 = !DILocation(line: 654, column: 50, scope: !762)
!767 = !DILocation(line: 654, column: 49, scope: !762)
!768 = !DILocation(line: 654, column: 24, scope: !762)
!769 = !DILocation(line: 654, column: 12, scope: !762)
!770 = !DILocation(line: 655, column: 14, scope: !762)
!771 = !DILocation(line: 655, column: 23, scope: !762)
!772 = !DILocation(line: 655, column: 12, scope: !762)
!773 = !DILocation(line: 656, column: 16, scope: !762)
!774 = !DILocation(line: 656, column: 25, scope: !762)
!775 = !DILocation(line: 656, column: 24, scope: !762)
!776 = !DILocation(line: 656, column: 41, scope: !762)
!777 = !DILocation(line: 656, column: 51, scope: !762)
!778 = !DILocation(line: 656, column: 50, scope: !762)
!779 = !DILocation(line: 656, column: 38, scope: !762)
!780 = !DILocation(line: 656, column: 13, scope: !762)
!781 = !DILocation(line: 657, column: 6, scope: !782)
!782 = distinct !DILexicalBlock(scope: !762, file: !69, line: 657, column: 6)
!783 = !DILocation(line: 657, column: 16, scope: !782)
!784 = !DILocation(line: 657, column: 6, scope: !762)
!785 = !DILocation(line: 659, column: 7, scope: !786)
!786 = distinct !DILexicalBlock(scope: !787, file: !69, line: 659, column: 7)
!787 = distinct !DILexicalBlock(scope: !782, file: !69, line: 658, column: 3)
!788 = !DILocation(line: 659, column: 17, scope: !786)
!789 = !DILocation(line: 659, column: 7, scope: !787)
!790 = !DILocation(line: 661, column: 17, scope: !791)
!791 = distinct !DILexicalBlock(scope: !786, file: !69, line: 660, column: 4)
!792 = !DILocation(line: 661, column: 12, scope: !791)
!793 = !DILocation(line: 661, column: 5, scope: !791)
!794 = !DILocation(line: 666, column: 5, scope: !795)
!795 = distinct !DILexicalBlock(scope: !786, file: !69, line: 665, column: 4)
!796 = !DILocation(line: 671, column: 4, scope: !797)
!797 = distinct !DILexicalBlock(scope: !782, file: !69, line: 670, column: 3)
!798 = !DILocation(line: 675, column: 1, scope: !731)
!799 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 693, type: !800, scopeLine: 694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!800 = !DISubroutineType(types: !801)
!801 = !{!6, !28, !6, !28}
!802 = !DILocalVariable(name: "factor1", arg: 1, scope: !799, file: !69, line: 693, type: !28)
!803 = !DILocation(line: 693, column: 33, scope: !799)
!804 = !DILocalVariable(name: "factor2", arg: 2, scope: !799, file: !69, line: 693, type: !6)
!805 = !DILocation(line: 693, column: 46, scope: !799)
!806 = !DILocalVariable(name: "denominator", arg: 3, scope: !799, file: !69, line: 693, type: !28)
!807 = !DILocation(line: 693, column: 59, scope: !799)
!808 = !DILocalVariable(name: "s32Result", scope: !799, file: !69, line: 695, type: !21)
!809 = !DILocation(line: 695, column: 6, scope: !799)
!810 = !DILocalVariable(name: "s32Temp1", scope: !799, file: !69, line: 695, type: !21)
!811 = !DILocation(line: 695, column: 21, scope: !799)
!812 = !DILocation(line: 696, column: 14, scope: !799)
!813 = !DILocation(line: 696, column: 24, scope: !799)
!814 = !DILocation(line: 696, column: 22, scope: !799)
!815 = !DILocation(line: 696, column: 12, scope: !799)
!816 = !DILocation(line: 697, column: 5, scope: !817)
!817 = distinct !DILexicalBlock(scope: !799, file: !69, line: 697, column: 5)
!818 = !DILocation(line: 697, column: 16, scope: !817)
!819 = !DILocation(line: 697, column: 5, scope: !799)
!820 = !DILocation(line: 699, column: 6, scope: !821)
!821 = distinct !DILexicalBlock(scope: !822, file: !69, line: 699, column: 6)
!822 = distinct !DILexicalBlock(scope: !817, file: !69, line: 698, column: 2)
!823 = !DILocation(line: 699, column: 16, scope: !821)
!824 = !DILocation(line: 699, column: 6, scope: !822)
!825 = !DILocation(line: 701, column: 4, scope: !826)
!826 = distinct !DILexicalBlock(scope: !821, file: !69, line: 700, column: 3)
!827 = !DILocation(line: 705, column: 4, scope: !828)
!828 = distinct !DILexicalBlock(scope: !821, file: !69, line: 704, column: 3)
!829 = !DILocation(line: 710, column: 14, scope: !830)
!830 = distinct !DILexicalBlock(scope: !817, file: !69, line: 709, column: 2)
!831 = !DILocation(line: 710, column: 28, scope: !830)
!832 = !DILocation(line: 710, column: 38, scope: !830)
!833 = !DILocation(line: 710, column: 37, scope: !830)
!834 = !DILocation(line: 710, column: 53, scope: !830)
!835 = !DILocation(line: 710, column: 51, scope: !830)
!836 = !DILocation(line: 710, column: 24, scope: !830)
!837 = !DILocation(line: 710, column: 66, scope: !830)
!838 = !DILocation(line: 710, column: 12, scope: !830)
!839 = !DILocation(line: 711, column: 16, scope: !830)
!840 = !DILocation(line: 711, column: 25, scope: !830)
!841 = !DILocation(line: 711, column: 24, scope: !830)
!842 = !DILocation(line: 711, column: 41, scope: !830)
!843 = !DILocation(line: 711, column: 51, scope: !830)
!844 = !DILocation(line: 711, column: 50, scope: !830)
!845 = !DILocation(line: 711, column: 38, scope: !830)
!846 = !DILocation(line: 711, column: 13, scope: !830)
!847 = !DILocation(line: 712, column: 6, scope: !848)
!848 = distinct !DILexicalBlock(scope: !830, file: !69, line: 712, column: 6)
!849 = !DILocation(line: 712, column: 16, scope: !848)
!850 = !DILocation(line: 712, column: 6, scope: !830)
!851 = !DILocation(line: 714, column: 7, scope: !852)
!852 = distinct !DILexicalBlock(scope: !853, file: !69, line: 714, column: 7)
!853 = distinct !DILexicalBlock(scope: !848, file: !69, line: 713, column: 3)
!854 = !DILocation(line: 714, column: 17, scope: !852)
!855 = !DILocation(line: 714, column: 7, scope: !853)
!856 = !DILocation(line: 716, column: 17, scope: !857)
!857 = distinct !DILexicalBlock(scope: !852, file: !69, line: 715, column: 4)
!858 = !DILocation(line: 716, column: 12, scope: !857)
!859 = !DILocation(line: 716, column: 5, scope: !857)
!860 = !DILocation(line: 720, column: 5, scope: !861)
!861 = distinct !DILexicalBlock(scope: !852, file: !69, line: 719, column: 4)
!862 = !DILocation(line: 725, column: 4, scope: !863)
!863 = distinct !DILexicalBlock(scope: !848, file: !69, line: 724, column: 3)
!864 = !DILocation(line: 728, column: 1, scope: !799)
!865 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 747, type: !866, scopeLine: 748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!866 = !DISubroutineType(types: !867)
!867 = !{!28, !6, !28, !6}
!868 = !DILocalVariable(name: "factor1", arg: 1, scope: !865, file: !69, line: 747, type: !6)
!869 = !DILocation(line: 747, column: 33, scope: !865)
!870 = !DILocalVariable(name: "factor2", arg: 2, scope: !865, file: !69, line: 747, type: !28)
!871 = !DILocation(line: 747, column: 46, scope: !865)
!872 = !DILocalVariable(name: "denominator", arg: 3, scope: !865, file: !69, line: 747, type: !6)
!873 = !DILocation(line: 747, column: 59, scope: !865)
!874 = !DILocalVariable(name: "u32Result", scope: !865, file: !69, line: 749, type: !428)
!875 = !DILocation(line: 749, column: 6, scope: !865)
!876 = !DILocalVariable(name: "u32Temp1", scope: !865, file: !69, line: 749, type: !428)
!877 = !DILocation(line: 749, column: 21, scope: !865)
!878 = !DILocalVariable(name: "s32Result", scope: !865, file: !69, line: 750, type: !21)
!879 = !DILocation(line: 750, column: 6, scope: !865)
!880 = !DILocalVariable(name: "s32Temp1", scope: !865, file: !69, line: 750, type: !21)
!881 = !DILocation(line: 750, column: 21, scope: !865)
!882 = !DILocation(line: 751, column: 14, scope: !865)
!883 = !DILocation(line: 751, column: 24, scope: !865)
!884 = !DILocation(line: 751, column: 22, scope: !865)
!885 = !DILocation(line: 751, column: 12, scope: !865)
!886 = !DILocation(line: 753, column: 5, scope: !887)
!887 = distinct !DILexicalBlock(scope: !865, file: !69, line: 753, column: 5)
!888 = !DILocation(line: 753, column: 17, scope: !887)
!889 = !DILocation(line: 753, column: 5, scope: !865)
!890 = !DILocation(line: 755, column: 6, scope: !891)
!891 = distinct !DILexicalBlock(scope: !892, file: !69, line: 755, column: 6)
!892 = distinct !DILexicalBlock(scope: !887, file: !69, line: 754, column: 2)
!893 = !DILocation(line: 755, column: 16, scope: !891)
!894 = !DILocation(line: 755, column: 6, scope: !892)
!895 = !DILocation(line: 757, column: 4, scope: !896)
!896 = distinct !DILexicalBlock(scope: !891, file: !69, line: 756, column: 3)
!897 = !DILocation(line: 761, column: 4, scope: !898)
!898 = distinct !DILexicalBlock(scope: !891, file: !69, line: 760, column: 3)
!899 = !DILocation(line: 766, column: 15, scope: !900)
!900 = distinct !DILexicalBlock(scope: !887, file: !69, line: 765, column: 2)
!901 = !DILocation(line: 766, column: 29, scope: !900)
!902 = !DILocation(line: 766, column: 39, scope: !900)
!903 = !DILocation(line: 766, column: 38, scope: !900)
!904 = !DILocation(line: 766, column: 54, scope: !900)
!905 = !DILocation(line: 766, column: 52, scope: !900)
!906 = !DILocation(line: 766, column: 25, scope: !900)
!907 = !DILocation(line: 766, column: 68, scope: !900)
!908 = !DILocation(line: 766, column: 12, scope: !900)
!909 = !DILocation(line: 767, column: 16, scope: !900)
!910 = !DILocation(line: 767, column: 25, scope: !900)
!911 = !DILocation(line: 767, column: 24, scope: !900)
!912 = !DILocation(line: 767, column: 41, scope: !900)
!913 = !DILocation(line: 767, column: 51, scope: !900)
!914 = !DILocation(line: 767, column: 50, scope: !900)
!915 = !DILocation(line: 767, column: 38, scope: !900)
!916 = !DILocation(line: 767, column: 13, scope: !900)
!917 = !DILocation(line: 768, column: 6, scope: !918)
!918 = distinct !DILexicalBlock(scope: !900, file: !69, line: 768, column: 6)
!919 = !DILocation(line: 768, column: 16, scope: !918)
!920 = !DILocation(line: 768, column: 6, scope: !900)
!921 = !DILocation(line: 770, column: 7, scope: !922)
!922 = distinct !DILexicalBlock(scope: !923, file: !69, line: 770, column: 7)
!923 = distinct !DILexicalBlock(scope: !918, file: !69, line: 769, column: 3)
!924 = !DILocation(line: 770, column: 17, scope: !922)
!925 = !DILocation(line: 770, column: 7, scope: !923)
!926 = !DILocation(line: 772, column: 17, scope: !927)
!927 = distinct !DILexicalBlock(scope: !922, file: !69, line: 771, column: 4)
!928 = !DILocation(line: 772, column: 12, scope: !927)
!929 = !DILocation(line: 772, column: 5, scope: !927)
!930 = !DILocation(line: 776, column: 5, scope: !931)
!931 = distinct !DILexicalBlock(scope: !922, file: !69, line: 775, column: 4)
!932 = !DILocation(line: 781, column: 4, scope: !933)
!933 = distinct !DILexicalBlock(scope: !918, file: !69, line: 780, column: 3)
!934 = !DILocation(line: 784, column: 1, scope: !865)
!935 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 803, type: !936, scopeLine: 804, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!936 = !DISubroutineType(types: !937)
!937 = !{!28, !6, !28, !28}
!938 = !DILocalVariable(name: "factor1", arg: 1, scope: !935, file: !69, line: 803, type: !6)
!939 = !DILocation(line: 803, column: 33, scope: !935)
!940 = !DILocalVariable(name: "factor2", arg: 2, scope: !935, file: !69, line: 803, type: !28)
!941 = !DILocation(line: 803, column: 46, scope: !935)
!942 = !DILocalVariable(name: "denominator", arg: 3, scope: !935, file: !69, line: 803, type: !28)
!943 = !DILocation(line: 803, column: 59, scope: !935)
!944 = !DILocalVariable(name: "s32Result", scope: !935, file: !69, line: 805, type: !21)
!945 = !DILocation(line: 805, column: 6, scope: !935)
!946 = !DILocalVariable(name: "s32Temp1", scope: !935, file: !69, line: 805, type: !21)
!947 = !DILocation(line: 805, column: 21, scope: !935)
!948 = !DILocation(line: 806, column: 14, scope: !935)
!949 = !DILocation(line: 806, column: 24, scope: !935)
!950 = !DILocation(line: 806, column: 22, scope: !935)
!951 = !DILocation(line: 806, column: 12, scope: !935)
!952 = !DILocation(line: 808, column: 5, scope: !953)
!953 = distinct !DILexicalBlock(scope: !935, file: !69, line: 808, column: 5)
!954 = !DILocation(line: 808, column: 17, scope: !953)
!955 = !DILocation(line: 808, column: 5, scope: !935)
!956 = !DILocation(line: 810, column: 6, scope: !957)
!957 = distinct !DILexicalBlock(scope: !958, file: !69, line: 810, column: 6)
!958 = distinct !DILexicalBlock(scope: !953, file: !69, line: 809, column: 2)
!959 = !DILocation(line: 810, column: 16, scope: !957)
!960 = !DILocation(line: 810, column: 6, scope: !958)
!961 = !DILocation(line: 812, column: 4, scope: !962)
!962 = distinct !DILexicalBlock(scope: !957, file: !69, line: 811, column: 3)
!963 = !DILocation(line: 816, column: 4, scope: !964)
!964 = distinct !DILexicalBlock(scope: !957, file: !69, line: 815, column: 3)
!965 = !DILocation(line: 821, column: 15, scope: !966)
!966 = distinct !DILexicalBlock(scope: !953, file: !69, line: 820, column: 2)
!967 = !DILocation(line: 821, column: 29, scope: !966)
!968 = !DILocation(line: 821, column: 39, scope: !966)
!969 = !DILocation(line: 821, column: 38, scope: !966)
!970 = !DILocation(line: 821, column: 54, scope: !966)
!971 = !DILocation(line: 821, column: 52, scope: !966)
!972 = !DILocation(line: 821, column: 25, scope: !966)
!973 = !DILocation(line: 821, column: 68, scope: !966)
!974 = !DILocation(line: 821, column: 12, scope: !966)
!975 = !DILocation(line: 822, column: 16, scope: !966)
!976 = !DILocation(line: 822, column: 25, scope: !966)
!977 = !DILocation(line: 822, column: 24, scope: !966)
!978 = !DILocation(line: 822, column: 41, scope: !966)
!979 = !DILocation(line: 822, column: 51, scope: !966)
!980 = !DILocation(line: 822, column: 50, scope: !966)
!981 = !DILocation(line: 822, column: 38, scope: !966)
!982 = !DILocation(line: 822, column: 13, scope: !966)
!983 = !DILocation(line: 823, column: 6, scope: !984)
!984 = distinct !DILexicalBlock(scope: !966, file: !69, line: 823, column: 6)
!985 = !DILocation(line: 823, column: 16, scope: !984)
!986 = !DILocation(line: 823, column: 6, scope: !966)
!987 = !DILocation(line: 825, column: 7, scope: !988)
!988 = distinct !DILexicalBlock(scope: !989, file: !69, line: 825, column: 7)
!989 = distinct !DILexicalBlock(scope: !984, file: !69, line: 824, column: 3)
!990 = !DILocation(line: 825, column: 17, scope: !988)
!991 = !DILocation(line: 825, column: 7, scope: !989)
!992 = !DILocation(line: 827, column: 17, scope: !993)
!993 = distinct !DILexicalBlock(scope: !988, file: !69, line: 826, column: 4)
!994 = !DILocation(line: 827, column: 12, scope: !993)
!995 = !DILocation(line: 827, column: 5, scope: !993)
!996 = !DILocation(line: 831, column: 5, scope: !997)
!997 = distinct !DILexicalBlock(scope: !988, file: !69, line: 830, column: 4)
!998 = !DILocation(line: 836, column: 4, scope: !999)
!999 = distinct !DILexicalBlock(scope: !984, file: !69, line: 835, column: 3)
!1000 = !DILocation(line: 840, column: 1, scope: !935)
!1001 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 858, type: !1002, scopeLine: 859, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!28, !28, !28, !28}
!1004 = !DILocalVariable(name: "factor1", arg: 1, scope: !1001, file: !69, line: 858, type: !28)
!1005 = !DILocation(line: 858, column: 33, scope: !1001)
!1006 = !DILocalVariable(name: "factor2", arg: 2, scope: !1001, file: !69, line: 858, type: !28)
!1007 = !DILocation(line: 858, column: 46, scope: !1001)
!1008 = !DILocalVariable(name: "denominator", arg: 3, scope: !1001, file: !69, line: 858, type: !28)
!1009 = !DILocation(line: 858, column: 59, scope: !1001)
!1010 = !DILocalVariable(name: "u32Temp1", scope: !1001, file: !69, line: 860, type: !428)
!1011 = !DILocation(line: 860, column: 6, scope: !1001)
!1012 = !DILocalVariable(name: "u16TempDenom", scope: !1001, file: !69, line: 861, type: !28)
!1013 = !DILocation(line: 861, column: 6, scope: !1001)
!1014 = !DILocation(line: 863, column: 5, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1001, file: !69, line: 863, column: 5)
!1016 = !DILocation(line: 863, column: 17, scope: !1015)
!1017 = !DILocation(line: 863, column: 5, scope: !1001)
!1018 = !DILocation(line: 865, column: 3, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 864, column: 2)
!1020 = !DILocation(line: 869, column: 14, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 868, column: 2)
!1022 = !DILocation(line: 869, column: 24, scope: !1021)
!1023 = !DILocation(line: 869, column: 22, scope: !1021)
!1024 = !DILocation(line: 869, column: 12, scope: !1021)
!1025 = !DILocation(line: 870, column: 18, scope: !1021)
!1026 = !DILocation(line: 870, column: 30, scope: !1021)
!1027 = !DILocation(line: 870, column: 16, scope: !1021)
!1028 = !DILocation(line: 871, column: 14, scope: !1021)
!1029 = !DILocation(line: 871, column: 25, scope: !1021)
!1030 = !DILocation(line: 871, column: 23, scope: !1021)
!1031 = !DILocation(line: 871, column: 12, scope: !1021)
!1032 = !DILocation(line: 872, column: 14, scope: !1021)
!1033 = !DILocation(line: 872, column: 25, scope: !1021)
!1034 = !DILocation(line: 872, column: 23, scope: !1021)
!1035 = !DILocation(line: 872, column: 12, scope: !1021)
!1036 = !DILocation(line: 873, column: 6, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1021, file: !69, line: 873, column: 6)
!1038 = !DILocation(line: 873, column: 15, scope: !1037)
!1039 = !DILocation(line: 873, column: 6, scope: !1021)
!1040 = !DILocation(line: 875, column: 12, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 874, column: 3)
!1042 = !DILocation(line: 875, column: 21, scope: !1041)
!1043 = !DILocation(line: 875, column: 11, scope: !1041)
!1044 = !DILocation(line: 875, column: 4, scope: !1041)
!1045 = !DILocation(line: 880, column: 4, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 879, column: 3)
!1047 = !DILocation(line: 885, column: 1, scope: !1001)
!1048 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 902, type: !1049, scopeLine: 903, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!28, !28, !28, !428}
!1051 = !DILocalVariable(name: "factor1", arg: 1, scope: !1048, file: !69, line: 902, type: !28)
!1052 = !DILocation(line: 902, column: 33, scope: !1048)
!1053 = !DILocalVariable(name: "factor2", arg: 2, scope: !1048, file: !69, line: 902, type: !28)
!1054 = !DILocation(line: 902, column: 46, scope: !1048)
!1055 = !DILocalVariable(name: "denominator", arg: 3, scope: !1048, file: !69, line: 902, type: !428)
!1056 = !DILocation(line: 902, column: 59, scope: !1048)
!1057 = !DILocalVariable(name: "u32Temp1", scope: !1048, file: !69, line: 904, type: !428)
!1058 = !DILocation(line: 904, column: 6, scope: !1048)
!1059 = !DILocation(line: 905, column: 5, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1048, file: !69, line: 905, column: 5)
!1061 = !DILocation(line: 905, column: 17, scope: !1060)
!1062 = !DILocation(line: 905, column: 5, scope: !1048)
!1063 = !DILocation(line: 907, column: 3, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 906, column: 2)
!1065 = !DILocation(line: 911, column: 15, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 910, column: 2)
!1067 = !DILocation(line: 911, column: 25, scope: !1066)
!1068 = !DILocation(line: 911, column: 23, scope: !1066)
!1069 = !DILocation(line: 911, column: 36, scope: !1066)
!1070 = !DILocation(line: 911, column: 34, scope: !1066)
!1071 = !DILocation(line: 911, column: 12, scope: !1066)
!1072 = !DILocation(line: 912, column: 8, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 912, column: 6)
!1074 = !DILocation(line: 912, column: 18, scope: !1073)
!1075 = !DILocation(line: 912, column: 16, scope: !1073)
!1076 = !DILocation(line: 912, column: 28, scope: !1073)
!1077 = !DILocation(line: 912, column: 40, scope: !1073)
!1078 = !DILocation(line: 912, column: 39, scope: !1073)
!1079 = !DILocation(line: 912, column: 26, scope: !1073)
!1080 = !DILocation(line: 912, column: 53, scope: !1073)
!1081 = !DILocation(line: 912, column: 64, scope: !1073)
!1082 = !DILocation(line: 912, column: 50, scope: !1073)
!1083 = !DILocation(line: 912, column: 6, scope: !1066)
!1084 = !DILocation(line: 914, column: 12, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1073, file: !69, line: 913, column: 3)
!1086 = !DILocation(line: 915, column: 3, scope: !1085)
!1087 = !DILocation(line: 916, column: 6, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 916, column: 6)
!1089 = !DILocation(line: 916, column: 15, scope: !1088)
!1090 = !DILocation(line: 916, column: 6, scope: !1066)
!1091 = !DILocation(line: 918, column: 12, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1088, file: !69, line: 917, column: 3)
!1093 = !DILocation(line: 918, column: 21, scope: !1092)
!1094 = !DILocation(line: 918, column: 11, scope: !1092)
!1095 = !DILocation(line: 918, column: 4, scope: !1092)
!1096 = !DILocation(line: 922, column: 4, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1088, file: !69, line: 921, column: 3)
!1098 = !DILocation(line: 925, column: 1, scope: !1048)
!1099 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 942, type: !1100, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!428, !428, !28}
!1102 = !DILocalVariable(name: "x_value", arg: 1, scope: !1099, file: !69, line: 942, type: !428)
!1103 = !DILocation(line: 942, column: 25, scope: !1099)
!1104 = !DILocalVariable(name: "y_value", arg: 2, scope: !1099, file: !69, line: 942, type: !28)
!1105 = !DILocation(line: 942, column: 38, scope: !1099)
!1106 = !DILocalVariable(name: "u32Temp1", scope: !1099, file: !69, line: 944, type: !428)
!1107 = !DILocation(line: 944, column: 6, scope: !1099)
!1108 = !DILocation(line: 945, column: 5, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1099, file: !69, line: 945, column: 5)
!1110 = !DILocation(line: 945, column: 13, scope: !1109)
!1111 = !DILocation(line: 945, column: 5, scope: !1099)
!1112 = !DILocation(line: 947, column: 3, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1109, file: !69, line: 946, column: 2)
!1114 = !DILocation(line: 951, column: 15, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1109, file: !69, line: 950, column: 2)
!1116 = !DILocation(line: 951, column: 26, scope: !1115)
!1117 = !DILocation(line: 951, column: 34, scope: !1115)
!1118 = !DILocation(line: 951, column: 33, scope: !1115)
!1119 = !DILocation(line: 951, column: 45, scope: !1115)
!1120 = !DILocation(line: 951, column: 43, scope: !1115)
!1121 = !DILocation(line: 951, column: 23, scope: !1115)
!1122 = !DILocation(line: 951, column: 54, scope: !1115)
!1123 = !DILocation(line: 951, column: 12, scope: !1115)
!1124 = !DILocation(line: 952, column: 15, scope: !1115)
!1125 = !DILocation(line: 952, column: 23, scope: !1115)
!1126 = !DILocation(line: 952, column: 22, scope: !1115)
!1127 = !DILocation(line: 952, column: 35, scope: !1115)
!1128 = !DILocation(line: 952, column: 44, scope: !1115)
!1129 = !DILocation(line: 952, column: 43, scope: !1115)
!1130 = !DILocation(line: 952, column: 32, scope: !1115)
!1131 = !DILocation(line: 952, column: 12, scope: !1115)
!1132 = !DILocation(line: 953, column: 10, scope: !1115)
!1133 = !DILocation(line: 953, column: 3, scope: !1115)
!1134 = !DILocation(line: 955, column: 1, scope: !1099)
!1135 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 973, type: !1136, scopeLine: 974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!6, !6, !6, !6}
!1138 = !DILocalVariable(name: "fak1", arg: 1, scope: !1135, file: !69, line: 973, type: !6)
!1139 = !DILocation(line: 973, column: 33, scope: !1135)
!1140 = !DILocalVariable(name: "fak2", arg: 2, scope: !1135, file: !69, line: 973, type: !6)
!1141 = !DILocation(line: 973, column: 43, scope: !1135)
!1142 = !DILocalVariable(name: "div", arg: 3, scope: !1135, file: !69, line: 973, type: !6)
!1143 = !DILocation(line: 973, column: 53, scope: !1135)
!1144 = !DILocalVariable(name: "s32Temp1", scope: !1135, file: !69, line: 975, type: !21)
!1145 = !DILocation(line: 975, column: 6, scope: !1135)
!1146 = !DILocalVariable(name: "s32Temp2", scope: !1135, file: !69, line: 975, type: !21)
!1147 = !DILocation(line: 975, column: 20, scope: !1135)
!1148 = !DILocalVariable(name: "s32Temp3", scope: !1135, file: !69, line: 975, type: !21)
!1149 = !DILocation(line: 975, column: 34, scope: !1135)
!1150 = !DILocation(line: 976, column: 13, scope: !1135)
!1151 = !DILocation(line: 976, column: 20, scope: !1135)
!1152 = !DILocation(line: 976, column: 18, scope: !1135)
!1153 = !DILocation(line: 976, column: 11, scope: !1135)
!1154 = !DILocation(line: 977, column: 5, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1135, file: !69, line: 977, column: 5)
!1156 = !DILocation(line: 977, column: 9, scope: !1155)
!1157 = !DILocation(line: 977, column: 5, scope: !1135)
!1158 = !DILocation(line: 979, column: 6, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1160, file: !69, line: 979, column: 6)
!1160 = distinct !DILexicalBlock(scope: !1155, file: !69, line: 978, column: 2)
!1161 = !DILocation(line: 979, column: 15, scope: !1159)
!1162 = !DILocation(line: 979, column: 6, scope: !1160)
!1163 = !DILocation(line: 981, column: 4, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1159, file: !69, line: 980, column: 3)
!1165 = !DILocation(line: 985, column: 4, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1159, file: !69, line: 984, column: 3)
!1167 = !DILocation(line: 990, column: 15, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1155, file: !69, line: 989, column: 2)
!1169 = !DILocation(line: 990, column: 28, scope: !1168)
!1170 = !DILocation(line: 990, column: 39, scope: !1168)
!1171 = !DILocation(line: 990, column: 37, scope: !1168)
!1172 = !DILocation(line: 990, column: 46, scope: !1168)
!1173 = !DILocation(line: 990, column: 44, scope: !1168)
!1174 = !DILocation(line: 990, column: 24, scope: !1168)
!1175 = !DILocation(line: 990, column: 52, scope: !1168)
!1176 = !DILocation(line: 990, column: 12, scope: !1168)
!1177 = !DILocation(line: 991, column: 15, scope: !1168)
!1178 = !DILocation(line: 991, column: 24, scope: !1168)
!1179 = !DILocation(line: 991, column: 23, scope: !1168)
!1180 = !DILocation(line: 991, column: 32, scope: !1168)
!1181 = !DILocation(line: 991, column: 41, scope: !1168)
!1182 = !DILocation(line: 991, column: 40, scope: !1168)
!1183 = !DILocation(line: 991, column: 29, scope: !1168)
!1184 = !DILocation(line: 991, column: 12, scope: !1168)
!1185 = !DILocation(line: 992, column: 6, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1168, file: !69, line: 992, column: 6)
!1187 = !DILocation(line: 992, column: 15, scope: !1186)
!1188 = !DILocation(line: 992, column: 6, scope: !1168)
!1189 = !DILocation(line: 994, column: 7, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 994, column: 7)
!1191 = distinct !DILexicalBlock(scope: !1186, file: !69, line: 993, column: 3)
!1192 = !DILocation(line: 994, column: 16, scope: !1190)
!1193 = !DILocation(line: 994, column: 7, scope: !1191)
!1194 = !DILocation(line: 996, column: 17, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1190, file: !69, line: 995, column: 4)
!1196 = !DILocation(line: 996, column: 12, scope: !1195)
!1197 = !DILocation(line: 996, column: 5, scope: !1195)
!1198 = !DILocation(line: 1000, column: 5, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1190, file: !69, line: 999, column: 4)
!1200 = !DILocation(line: 1005, column: 4, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1186, file: !69, line: 1004, column: 3)
!1202 = !DILocation(line: 1008, column: 1, scope: !1135)
!1203 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1026, type: !1204, scopeLine: 1027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!6, !6, !6, !28}
!1206 = !DILocalVariable(name: "data1", arg: 1, scope: !1203, file: !69, line: 1026, type: !6)
!1207 = !DILocation(line: 1026, column: 33, scope: !1203)
!1208 = !DILocalVariable(name: "data2", arg: 2, scope: !1203, file: !69, line: 1026, type: !6)
!1209 = !DILocation(line: 1026, column: 43, scope: !1203)
!1210 = !DILocalVariable(name: "denominator", arg: 3, scope: !1203, file: !69, line: 1026, type: !28)
!1211 = !DILocation(line: 1026, column: 53, scope: !1203)
!1212 = !DILocalVariable(name: "s32Result", scope: !1203, file: !69, line: 1028, type: !21)
!1213 = !DILocation(line: 1028, column: 6, scope: !1203)
!1214 = !DILocalVariable(name: "s32Temp1", scope: !1203, file: !69, line: 1028, type: !21)
!1215 = !DILocation(line: 1028, column: 21, scope: !1203)
!1216 = !DILocation(line: 1029, column: 14, scope: !1203)
!1217 = !DILocation(line: 1029, column: 22, scope: !1203)
!1218 = !DILocation(line: 1029, column: 20, scope: !1203)
!1219 = !DILocation(line: 1029, column: 12, scope: !1203)
!1220 = !DILocation(line: 1031, column: 5, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 1031, column: 5)
!1222 = !DILocation(line: 1031, column: 17, scope: !1221)
!1223 = !DILocation(line: 1031, column: 5, scope: !1203)
!1224 = !DILocation(line: 1033, column: 6, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1226, file: !69, line: 1033, column: 6)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1032, column: 2)
!1227 = !DILocation(line: 1033, column: 16, scope: !1225)
!1228 = !DILocation(line: 1033, column: 6, scope: !1226)
!1229 = !DILocation(line: 1035, column: 4, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1034, column: 3)
!1231 = !DILocation(line: 1037, column: 11, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1037, column: 11)
!1233 = !DILocation(line: 1037, column: 21, scope: !1232)
!1234 = !DILocation(line: 1037, column: 11, scope: !1225)
!1235 = !DILocation(line: 1039, column: 4, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1232, file: !69, line: 1038, column: 3)
!1237 = !DILocation(line: 1043, column: 4, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1232, file: !69, line: 1042, column: 3)
!1239 = !DILocation(line: 1048, column: 15, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1047, column: 2)
!1241 = !DILocation(line: 1048, column: 28, scope: !1240)
!1242 = !DILocation(line: 1048, column: 38, scope: !1240)
!1243 = !DILocation(line: 1048, column: 37, scope: !1240)
!1244 = !DILocation(line: 1048, column: 51, scope: !1240)
!1245 = !DILocation(line: 1048, column: 50, scope: !1240)
!1246 = !DILocation(line: 1048, column: 25, scope: !1240)
!1247 = !DILocation(line: 1048, column: 64, scope: !1240)
!1248 = !DILocation(line: 1048, column: 12, scope: !1240)
!1249 = !DILocation(line: 1049, column: 16, scope: !1240)
!1250 = !DILocation(line: 1049, column: 25, scope: !1240)
!1251 = !DILocation(line: 1049, column: 24, scope: !1240)
!1252 = !DILocation(line: 1049, column: 41, scope: !1240)
!1253 = !DILocation(line: 1049, column: 51, scope: !1240)
!1254 = !DILocation(line: 1049, column: 50, scope: !1240)
!1255 = !DILocation(line: 1049, column: 38, scope: !1240)
!1256 = !DILocation(line: 1049, column: 13, scope: !1240)
!1257 = !DILocation(line: 1050, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1240, file: !69, line: 1050, column: 6)
!1259 = !DILocation(line: 1050, column: 16, scope: !1258)
!1260 = !DILocation(line: 1050, column: 6, scope: !1240)
!1261 = !DILocation(line: 1052, column: 7, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1052, column: 7)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !69, line: 1051, column: 3)
!1264 = !DILocation(line: 1052, column: 17, scope: !1262)
!1265 = !DILocation(line: 1052, column: 7, scope: !1263)
!1266 = !DILocation(line: 1054, column: 17, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1053, column: 4)
!1268 = !DILocation(line: 1054, column: 12, scope: !1267)
!1269 = !DILocation(line: 1054, column: 5, scope: !1267)
!1270 = !DILocation(line: 1058, column: 5, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1057, column: 4)
!1272 = !DILocation(line: 1063, column: 4, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1258, file: !69, line: 1062, column: 3)
!1274 = !DILocation(line: 1067, column: 1, scope: !1203)
!1275 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1084, type: !1276, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!428, !428, !21}
!1278 = !DILocalVariable(name: "numerator", arg: 1, scope: !1275, file: !69, line: 1084, type: !428)
!1279 = !DILocation(line: 1084, column: 25, scope: !1275)
!1280 = !DILocalVariable(name: "denominator", arg: 2, scope: !1275, file: !69, line: 1084, type: !21)
!1281 = !DILocation(line: 1084, column: 40, scope: !1275)
!1282 = !DILocalVariable(name: "u32Temp1", scope: !1275, file: !69, line: 1086, type: !428)
!1283 = !DILocation(line: 1086, column: 6, scope: !1275)
!1284 = !DILocation(line: 1087, column: 5, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1087, column: 5)
!1286 = !DILocation(line: 1087, column: 17, scope: !1285)
!1287 = !DILocation(line: 1087, column: 5, scope: !1275)
!1288 = !DILocation(line: 1089, column: 3, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1088, column: 2)
!1290 = !DILocation(line: 1093, column: 6, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1292, file: !69, line: 1093, column: 6)
!1292 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1092, column: 2)
!1293 = !DILocation(line: 1093, column: 18, scope: !1291)
!1294 = !DILocation(line: 1093, column: 6, scope: !1292)
!1295 = !DILocation(line: 1095, column: 4, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1291, file: !69, line: 1094, column: 3)
!1297 = !DILocation(line: 1099, column: 16, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1291, file: !69, line: 1098, column: 3)
!1299 = !DILocation(line: 1099, column: 30, scope: !1298)
!1300 = !DILocation(line: 1099, column: 40, scope: !1298)
!1301 = !DILocation(line: 1099, column: 39, scope: !1298)
!1302 = !DILocation(line: 1099, column: 55, scope: !1298)
!1303 = !DILocation(line: 1099, column: 53, scope: !1298)
!1304 = !DILocation(line: 1099, column: 26, scope: !1298)
!1305 = !DILocation(line: 1099, column: 68, scope: !1298)
!1306 = !DILocation(line: 1099, column: 13, scope: !1298)
!1307 = !DILocation(line: 1100, column: 16, scope: !1298)
!1308 = !DILocation(line: 1100, column: 25, scope: !1298)
!1309 = !DILocation(line: 1100, column: 24, scope: !1298)
!1310 = !DILocation(line: 1100, column: 41, scope: !1298)
!1311 = !DILocation(line: 1100, column: 51, scope: !1298)
!1312 = !DILocation(line: 1100, column: 50, scope: !1298)
!1313 = !DILocation(line: 1100, column: 38, scope: !1298)
!1314 = !DILocation(line: 1100, column: 13, scope: !1298)
!1315 = !DILocation(line: 1101, column: 11, scope: !1298)
!1316 = !DILocation(line: 1101, column: 4, scope: !1298)
!1317 = !DILocation(line: 1104, column: 1, scope: !1275)
!1318 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1121, type: !1319, scopeLine: 1122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!428, !21, !428}
!1321 = !DILocalVariable(name: "numerator", arg: 1, scope: !1318, file: !69, line: 1121, type: !21)
!1322 = !DILocation(line: 1121, column: 25, scope: !1318)
!1323 = !DILocalVariable(name: "denominator", arg: 2, scope: !1318, file: !69, line: 1121, type: !428)
!1324 = !DILocation(line: 1121, column: 40, scope: !1318)
!1325 = !DILocalVariable(name: "s32Temp1", scope: !1318, file: !69, line: 1123, type: !21)
!1326 = !DILocation(line: 1123, column: 6, scope: !1318)
!1327 = !DILocation(line: 1124, column: 5, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1124, column: 5)
!1329 = !DILocation(line: 1124, column: 17, scope: !1328)
!1330 = !DILocation(line: 1124, column: 5, scope: !1318)
!1331 = !DILocation(line: 1126, column: 6, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1126, column: 6)
!1333 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1125, column: 2)
!1334 = !DILocation(line: 1126, column: 16, scope: !1332)
!1335 = !DILocation(line: 1126, column: 6, scope: !1333)
!1336 = !DILocation(line: 1128, column: 4, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1332, file: !69, line: 1127, column: 3)
!1338 = !DILocation(line: 1132, column: 4, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1332, file: !69, line: 1131, column: 3)
!1340 = !DILocation(line: 1137, column: 6, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1342, file: !69, line: 1137, column: 6)
!1342 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1136, column: 2)
!1343 = !DILocation(line: 1137, column: 16, scope: !1341)
!1344 = !DILocation(line: 1137, column: 6, scope: !1342)
!1345 = !DILocation(line: 1139, column: 17, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !69, line: 1138, column: 3)
!1347 = !DILocation(line: 1139, column: 31, scope: !1346)
!1348 = !DILocation(line: 1139, column: 41, scope: !1346)
!1349 = !DILocation(line: 1139, column: 40, scope: !1346)
!1350 = !DILocation(line: 1139, column: 56, scope: !1346)
!1351 = !DILocation(line: 1139, column: 54, scope: !1346)
!1352 = !DILocation(line: 1139, column: 27, scope: !1346)
!1353 = !DILocation(line: 1139, column: 69, scope: !1346)
!1354 = !DILocation(line: 1139, column: 13, scope: !1346)
!1355 = !DILocation(line: 1140, column: 13, scope: !1346)
!1356 = !DILocation(line: 1140, column: 23, scope: !1346)
!1357 = !DILocation(line: 1140, column: 22, scope: !1346)
!1358 = !DILocation(line: 1140, column: 39, scope: !1346)
!1359 = !DILocation(line: 1140, column: 48, scope: !1346)
!1360 = !DILocation(line: 1140, column: 47, scope: !1346)
!1361 = !DILocation(line: 1140, column: 36, scope: !1346)
!1362 = !DILocation(line: 1140, column: 4, scope: !1346)
!1363 = !DILocation(line: 1144, column: 4, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1341, file: !69, line: 1143, column: 3)
!1365 = !DILocation(line: 1147, column: 1, scope: !1318)
!1366 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1164, type: !1367, scopeLine: 1165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!428, !21, !21}
!1369 = !DILocalVariable(name: "numerator", arg: 1, scope: !1366, file: !69, line: 1164, type: !21)
!1370 = !DILocation(line: 1164, column: 25, scope: !1366)
!1371 = !DILocalVariable(name: "denominator", arg: 2, scope: !1366, file: !69, line: 1164, type: !21)
!1372 = !DILocation(line: 1164, column: 40, scope: !1366)
!1373 = !DILocalVariable(name: "u32Temp1", scope: !1366, file: !69, line: 1166, type: !428)
!1374 = !DILocation(line: 1166, column: 6, scope: !1366)
!1375 = !DILocalVariable(name: "u32Temp2", scope: !1366, file: !69, line: 1166, type: !428)
!1376 = !DILocation(line: 1166, column: 20, scope: !1366)
!1377 = !DILocation(line: 1167, column: 5, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1167, column: 5)
!1379 = !DILocation(line: 1167, column: 17, scope: !1378)
!1380 = !DILocation(line: 1167, column: 5, scope: !1366)
!1381 = !DILocation(line: 1169, column: 6, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1383, file: !69, line: 1169, column: 6)
!1383 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1168, column: 2)
!1384 = !DILocation(line: 1169, column: 16, scope: !1382)
!1385 = !DILocation(line: 1169, column: 6, scope: !1383)
!1386 = !DILocation(line: 1171, column: 4, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1170, column: 3)
!1388 = !DILocation(line: 1175, column: 4, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1174, column: 3)
!1390 = !DILocation(line: 1180, column: 6, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1392, file: !69, line: 1180, column: 6)
!1392 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1179, column: 2)
!1393 = !DILocation(line: 1180, column: 16, scope: !1391)
!1394 = !DILocation(line: 1180, column: 6, scope: !1392)
!1395 = !DILocation(line: 1182, column: 7, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1182, column: 7)
!1397 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1181, column: 3)
!1398 = !DILocation(line: 1182, column: 17, scope: !1396)
!1399 = !DILocation(line: 1182, column: 7, scope: !1397)
!1400 = !DILocation(line: 1184, column: 5, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1396, file: !69, line: 1183, column: 4)
!1402 = !DILocation(line: 1188, column: 8, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1404, file: !69, line: 1188, column: 8)
!1404 = distinct !DILexicalBlock(scope: !1396, file: !69, line: 1187, column: 4)
!1405 = !DILocation(line: 1188, column: 20, scope: !1403)
!1406 = !DILocation(line: 1188, column: 8, scope: !1404)
!1407 = !DILocation(line: 1190, column: 6, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1403, file: !69, line: 1189, column: 5)
!1409 = !DILocation(line: 1194, column: 18, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1403, file: !69, line: 1193, column: 5)
!1411 = !DILocation(line: 1194, column: 32, scope: !1410)
!1412 = !DILocation(line: 1194, column: 42, scope: !1410)
!1413 = !DILocation(line: 1194, column: 41, scope: !1410)
!1414 = !DILocation(line: 1194, column: 57, scope: !1410)
!1415 = !DILocation(line: 1194, column: 55, scope: !1410)
!1416 = !DILocation(line: 1194, column: 28, scope: !1410)
!1417 = !DILocation(line: 1194, column: 71, scope: !1410)
!1418 = !DILocation(line: 1194, column: 15, scope: !1410)
!1419 = !DILocation(line: 1195, column: 18, scope: !1410)
!1420 = !DILocation(line: 1195, column: 29, scope: !1410)
!1421 = !DILocation(line: 1195, column: 27, scope: !1410)
!1422 = !DILocation(line: 1195, column: 45, scope: !1410)
!1423 = !DILocation(line: 1195, column: 57, scope: !1410)
!1424 = !DILocation(line: 1195, column: 55, scope: !1410)
!1425 = !DILocation(line: 1195, column: 42, scope: !1410)
!1426 = !DILocation(line: 1195, column: 15, scope: !1410)
!1427 = !DILocation(line: 1196, column: 13, scope: !1410)
!1428 = !DILocation(line: 1196, column: 6, scope: !1410)
!1429 = !DILocation(line: 1202, column: 7, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1431, file: !69, line: 1202, column: 7)
!1431 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1201, column: 3)
!1432 = !DILocation(line: 1202, column: 19, scope: !1430)
!1433 = !DILocation(line: 1202, column: 7, scope: !1431)
!1434 = !DILocation(line: 1204, column: 5, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1203, column: 4)
!1436 = !DILocation(line: 1208, column: 18, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1207, column: 4)
!1438 = !DILocation(line: 1208, column: 17, scope: !1437)
!1439 = !DILocation(line: 1208, column: 15, scope: !1437)
!1440 = !DILocation(line: 1209, column: 20, scope: !1437)
!1441 = !DILocation(line: 1209, column: 19, scope: !1437)
!1442 = !DILocation(line: 1209, column: 17, scope: !1437)
!1443 = !DILocation(line: 1210, column: 17, scope: !1437)
!1444 = !DILocation(line: 1210, column: 31, scope: !1437)
!1445 = !DILocation(line: 1210, column: 41, scope: !1437)
!1446 = !DILocation(line: 1210, column: 40, scope: !1437)
!1447 = !DILocation(line: 1210, column: 56, scope: !1437)
!1448 = !DILocation(line: 1210, column: 54, scope: !1437)
!1449 = !DILocation(line: 1210, column: 27, scope: !1437)
!1450 = !DILocation(line: 1210, column: 70, scope: !1437)
!1451 = !DILocation(line: 1210, column: 14, scope: !1437)
!1452 = !DILocation(line: 1211, column: 17, scope: !1437)
!1453 = !DILocation(line: 1211, column: 28, scope: !1437)
!1454 = !DILocation(line: 1211, column: 26, scope: !1437)
!1455 = !DILocation(line: 1211, column: 44, scope: !1437)
!1456 = !DILocation(line: 1211, column: 56, scope: !1437)
!1457 = !DILocation(line: 1211, column: 54, scope: !1437)
!1458 = !DILocation(line: 1211, column: 41, scope: !1437)
!1459 = !DILocation(line: 1211, column: 14, scope: !1437)
!1460 = !DILocation(line: 1212, column: 12, scope: !1437)
!1461 = !DILocation(line: 1212, column: 5, scope: !1437)
!1462 = !DILocation(line: 1217, column: 1, scope: !1366)
!1463 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1234, type: !1464, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!428, !428, !428}
!1466 = !DILocalVariable(name: "numerator", arg: 1, scope: !1463, file: !69, line: 1234, type: !428)
!1467 = !DILocation(line: 1234, column: 25, scope: !1463)
!1468 = !DILocalVariable(name: "denominator", arg: 2, scope: !1463, file: !69, line: 1234, type: !428)
!1469 = !DILocation(line: 1234, column: 40, scope: !1463)
!1470 = !DILocalVariable(name: "u32Temp1", scope: !1463, file: !69, line: 1237, type: !428)
!1471 = !DILocation(line: 1237, column: 6, scope: !1463)
!1472 = !DILocalVariable(name: "u32Temp2", scope: !1463, file: !69, line: 1237, type: !428)
!1473 = !DILocation(line: 1237, column: 20, scope: !1463)
!1474 = !DILocalVariable(name: "u32Temp3", scope: !1463, file: !69, line: 1237, type: !428)
!1475 = !DILocation(line: 1237, column: 34, scope: !1463)
!1476 = !DILocalVariable(name: "numerator_old", scope: !1463, file: !69, line: 1237, type: !428)
!1477 = !DILocation(line: 1237, column: 48, scope: !1463)
!1478 = !DILocation(line: 1238, column: 5, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1463, file: !69, line: 1238, column: 5)
!1480 = !DILocation(line: 1238, column: 16, scope: !1479)
!1481 = !DILocation(line: 1238, column: 5, scope: !1463)
!1482 = !DILocation(line: 1240, column: 3, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1479, file: !69, line: 1239, column: 2)
!1484 = !DILocation(line: 1244, column: 14, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1479, file: !69, line: 1243, column: 2)
!1486 = !DILocation(line: 1244, column: 26, scope: !1485)
!1487 = !DILocation(line: 1244, column: 41, scope: !1485)
!1488 = !DILocation(line: 1244, column: 51, scope: !1485)
!1489 = !DILocation(line: 1244, column: 50, scope: !1485)
!1490 = !DILocation(line: 1244, column: 38, scope: !1485)
!1491 = !DILocation(line: 1244, column: 24, scope: !1485)
!1492 = !DILocation(line: 1244, column: 12, scope: !1485)
!1493 = !DILocation(line: 1245, column: 7, scope: !1494)
!1494 = distinct !DILexicalBlock(scope: !1485, file: !69, line: 1245, column: 6)
!1495 = !DILocation(line: 1245, column: 16, scope: !1494)
!1496 = !DILocation(line: 1245, column: 24, scope: !1494)
!1497 = !DILocation(line: 1245, column: 6, scope: !1485)
!1498 = !DILocation(line: 1247, column: 16, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1494, file: !69, line: 1246, column: 3)
!1500 = !DILocation(line: 1247, column: 27, scope: !1499)
!1501 = !DILocation(line: 1247, column: 13, scope: !1499)
!1502 = !DILocation(line: 1248, column: 3, scope: !1499)
!1503 = !DILocation(line: 1251, column: 16, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1494, file: !69, line: 1250, column: 3)
!1505 = !DILocation(line: 1251, column: 27, scope: !1504)
!1506 = !DILocation(line: 1251, column: 32, scope: !1504)
!1507 = !DILocation(line: 1251, column: 13, scope: !1504)
!1508 = !DILocation(line: 1254, column: 6, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1485, file: !69, line: 1254, column: 6)
!1510 = !DILocation(line: 1254, column: 17, scope: !1509)
!1511 = !DILocation(line: 1254, column: 15, scope: !1509)
!1512 = !DILocation(line: 1254, column: 6, scope: !1485)
!1513 = !DILocation(line: 1256, column: 12, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1509, file: !69, line: 1255, column: 3)
!1515 = !DILocation(line: 1256, column: 22, scope: !1514)
!1516 = !DILocation(line: 1256, column: 21, scope: !1514)
!1517 = !DILocation(line: 1256, column: 4, scope: !1514)
!1518 = !DILocation(line: 1260, column: 13, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1509, file: !69, line: 1259, column: 3)
!1520 = !DILocation(line: 1260, column: 23, scope: !1519)
!1521 = !DILocation(line: 1260, column: 22, scope: !1519)
!1522 = !DILocation(line: 1260, column: 36, scope: !1519)
!1523 = !DILocation(line: 1260, column: 4, scope: !1519)
!1524 = !DILocation(line: 1265, column: 1, scope: !1463)
!1525 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1282, type: !1526, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1526 = !DISubroutineType(types: !1527)
!1527 = !{!21, !428, !21}
!1528 = !DILocalVariable(name: "numerator", arg: 1, scope: !1525, file: !69, line: 1282, type: !428)
!1529 = !DILocation(line: 1282, column: 25, scope: !1525)
!1530 = !DILocalVariable(name: "denominator", arg: 2, scope: !1525, file: !69, line: 1282, type: !21)
!1531 = !DILocation(line: 1282, column: 40, scope: !1525)
!1532 = !DILocalVariable(name: "u32Temp1", scope: !1525, file: !69, line: 1284, type: !428)
!1533 = !DILocation(line: 1284, column: 6, scope: !1525)
!1534 = !DILocalVariable(name: "u32Temp2", scope: !1525, file: !69, line: 1284, type: !428)
!1535 = !DILocation(line: 1284, column: 20, scope: !1525)
!1536 = !DILocation(line: 1285, column: 5, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1525, file: !69, line: 1285, column: 5)
!1538 = !DILocation(line: 1285, column: 17, scope: !1537)
!1539 = !DILocation(line: 1285, column: 5, scope: !1525)
!1540 = !DILocation(line: 1287, column: 6, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1542, file: !69, line: 1287, column: 6)
!1542 = distinct !DILexicalBlock(scope: !1537, file: !69, line: 1286, column: 2)
!1543 = !DILocation(line: 1287, column: 18, scope: !1541)
!1544 = !DILocation(line: 1287, column: 6, scope: !1542)
!1545 = !DILocation(line: 1289, column: 4, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1541, file: !69, line: 1288, column: 3)
!1547 = !DILocation(line: 1293, column: 19, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1541, file: !69, line: 1292, column: 3)
!1549 = !DILocation(line: 1293, column: 18, scope: !1548)
!1550 = !DILocation(line: 1293, column: 16, scope: !1548)
!1551 = !DILocation(line: 1294, column: 16, scope: !1548)
!1552 = !DILocation(line: 1294, column: 30, scope: !1548)
!1553 = !DILocation(line: 1294, column: 40, scope: !1548)
!1554 = !DILocation(line: 1294, column: 39, scope: !1548)
!1555 = !DILocation(line: 1294, column: 55, scope: !1548)
!1556 = !DILocation(line: 1294, column: 53, scope: !1548)
!1557 = !DILocation(line: 1294, column: 26, scope: !1548)
!1558 = !DILocation(line: 1294, column: 69, scope: !1548)
!1559 = !DILocation(line: 1294, column: 13, scope: !1548)
!1560 = !DILocation(line: 1295, column: 16, scope: !1548)
!1561 = !DILocation(line: 1295, column: 25, scope: !1548)
!1562 = !DILocation(line: 1295, column: 24, scope: !1548)
!1563 = !DILocation(line: 1295, column: 41, scope: !1548)
!1564 = !DILocation(line: 1295, column: 51, scope: !1548)
!1565 = !DILocation(line: 1295, column: 50, scope: !1548)
!1566 = !DILocation(line: 1295, column: 38, scope: !1548)
!1567 = !DILocation(line: 1295, column: 13, scope: !1548)
!1568 = !DILocation(line: 1296, column: 7, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1548, file: !69, line: 1296, column: 7)
!1570 = !DILocation(line: 1296, column: 16, scope: !1569)
!1571 = !DILocation(line: 1296, column: 7, scope: !1548)
!1572 = !DILocation(line: 1298, column: 13, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1569, file: !69, line: 1297, column: 4)
!1574 = !DILocation(line: 1298, column: 12, scope: !1573)
!1575 = !DILocation(line: 1298, column: 5, scope: !1573)
!1576 = !DILocation(line: 1302, column: 5, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1569, file: !69, line: 1301, column: 4)
!1578 = !DILocation(line: 1308, column: 15, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1537, file: !69, line: 1307, column: 2)
!1580 = !DILocation(line: 1308, column: 29, scope: !1579)
!1581 = !DILocation(line: 1308, column: 39, scope: !1579)
!1582 = !DILocation(line: 1308, column: 38, scope: !1579)
!1583 = !DILocation(line: 1308, column: 54, scope: !1579)
!1584 = !DILocation(line: 1308, column: 52, scope: !1579)
!1585 = !DILocation(line: 1308, column: 25, scope: !1579)
!1586 = !DILocation(line: 1308, column: 68, scope: !1579)
!1587 = !DILocation(line: 1308, column: 12, scope: !1579)
!1588 = !DILocation(line: 1309, column: 15, scope: !1579)
!1589 = !DILocation(line: 1309, column: 24, scope: !1579)
!1590 = !DILocation(line: 1309, column: 23, scope: !1579)
!1591 = !DILocation(line: 1309, column: 40, scope: !1579)
!1592 = !DILocation(line: 1309, column: 50, scope: !1579)
!1593 = !DILocation(line: 1309, column: 49, scope: !1579)
!1594 = !DILocation(line: 1309, column: 37, scope: !1579)
!1595 = !DILocation(line: 1309, column: 12, scope: !1579)
!1596 = !DILocation(line: 1310, column: 6, scope: !1597)
!1597 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1310, column: 6)
!1598 = !DILocation(line: 1310, column: 15, scope: !1597)
!1599 = !DILocation(line: 1310, column: 6, scope: !1579)
!1600 = !DILocation(line: 1312, column: 11, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1597, file: !69, line: 1311, column: 3)
!1602 = !DILocation(line: 1312, column: 4, scope: !1601)
!1603 = !DILocation(line: 1316, column: 4, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1597, file: !69, line: 1315, column: 3)
!1605 = !DILocation(line: 1319, column: 1, scope: !1525)
!1606 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1337, type: !1607, scopeLine: 1338, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!21, !21, !428}
!1609 = !DILocalVariable(name: "numerator", arg: 1, scope: !1606, file: !69, line: 1337, type: !21)
!1610 = !DILocation(line: 1337, column: 25, scope: !1606)
!1611 = !DILocalVariable(name: "denominator", arg: 2, scope: !1606, file: !69, line: 1337, type: !428)
!1612 = !DILocation(line: 1337, column: 40, scope: !1606)
!1613 = !DILocalVariable(name: "s32Temp1", scope: !1606, file: !69, line: 1339, type: !21)
!1614 = !DILocation(line: 1339, column: 6, scope: !1606)
!1615 = !DILocalVariable(name: "s32Temp2", scope: !1606, file: !69, line: 1339, type: !21)
!1616 = !DILocation(line: 1339, column: 20, scope: !1606)
!1617 = !DILocalVariable(name: "u32Temp0", scope: !1606, file: !69, line: 1340, type: !428)
!1618 = !DILocation(line: 1340, column: 6, scope: !1606)
!1619 = !DILocalVariable(name: "u32Temp1", scope: !1606, file: !69, line: 1340, type: !428)
!1620 = !DILocation(line: 1340, column: 20, scope: !1606)
!1621 = !DILocalVariable(name: "u32Temp2", scope: !1606, file: !69, line: 1340, type: !428)
!1622 = !DILocation(line: 1340, column: 34, scope: !1606)
!1623 = !DILocation(line: 1341, column: 5, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1606, file: !69, line: 1341, column: 5)
!1625 = !DILocation(line: 1341, column: 17, scope: !1624)
!1626 = !DILocation(line: 1341, column: 5, scope: !1606)
!1627 = !DILocation(line: 1343, column: 6, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1343, column: 6)
!1629 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1342, column: 2)
!1630 = !DILocation(line: 1343, column: 16, scope: !1628)
!1631 = !DILocation(line: 1343, column: 6, scope: !1629)
!1632 = !DILocation(line: 1345, column: 4, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1344, column: 3)
!1634 = !DILocation(line: 1349, column: 4, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1348, column: 3)
!1636 = !DILocation(line: 1354, column: 6, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1638, file: !69, line: 1354, column: 6)
!1638 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1353, column: 2)
!1639 = !DILocation(line: 1354, column: 16, scope: !1637)
!1640 = !DILocation(line: 1354, column: 6, scope: !1638)
!1641 = !DILocation(line: 1356, column: 16, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1637, file: !69, line: 1355, column: 3)
!1643 = !DILocation(line: 1356, column: 15, scope: !1642)
!1644 = !DILocation(line: 1356, column: 13, scope: !1642)
!1645 = !DILocation(line: 1357, column: 16, scope: !1642)
!1646 = !DILocation(line: 1357, column: 25, scope: !1642)
!1647 = !DILocation(line: 1357, column: 24, scope: !1642)
!1648 = !DILocation(line: 1357, column: 13, scope: !1642)
!1649 = !DILocation(line: 1358, column: 15, scope: !1642)
!1650 = !DILocation(line: 1358, column: 28, scope: !1642)
!1651 = !DILocation(line: 1358, column: 37, scope: !1642)
!1652 = !DILocation(line: 1358, column: 36, scope: !1642)
!1653 = !DILocation(line: 1358, column: 52, scope: !1642)
!1654 = !DILocation(line: 1358, column: 50, scope: !1642)
!1655 = !DILocation(line: 1358, column: 24, scope: !1642)
!1656 = !DILocation(line: 1358, column: 13, scope: !1642)
!1657 = !DILocation(line: 1360, column: 8, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1642, file: !69, line: 1360, column: 7)
!1659 = !DILocation(line: 1360, column: 20, scope: !1658)
!1660 = !DILocation(line: 1360, column: 27, scope: !1658)
!1661 = !DILocation(line: 1360, column: 7, scope: !1642)
!1662 = !DILocation(line: 1362, column: 20, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1658, file: !69, line: 1361, column: 4)
!1664 = !DILocation(line: 1362, column: 32, scope: !1663)
!1665 = !DILocation(line: 1362, column: 17, scope: !1663)
!1666 = !DILocation(line: 1363, column: 4, scope: !1663)
!1667 = !DILocation(line: 1366, column: 20, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1658, file: !69, line: 1365, column: 4)
!1669 = !DILocation(line: 1366, column: 32, scope: !1668)
!1670 = !DILocation(line: 1366, column: 38, scope: !1668)
!1671 = !DILocation(line: 1366, column: 17, scope: !1668)
!1672 = !DILocation(line: 1370, column: 7, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1642, file: !69, line: 1370, column: 7)
!1674 = !DILocation(line: 1370, column: 18, scope: !1673)
!1675 = !DILocation(line: 1370, column: 16, scope: !1673)
!1676 = !DILocation(line: 1370, column: 7, scope: !1642)
!1677 = !DILocation(line: 1372, column: 14, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1371, column: 4)
!1679 = !DILocation(line: 1372, column: 13, scope: !1678)
!1680 = !DILocation(line: 1372, column: 23, scope: !1678)
!1681 = !DILocation(line: 1372, column: 5, scope: !1678)
!1682 = !DILocation(line: 1376, column: 14, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1375, column: 4)
!1684 = !DILocation(line: 1376, column: 23, scope: !1683)
!1685 = !DILocation(line: 1376, column: 12, scope: !1683)
!1686 = !DILocation(line: 1376, column: 27, scope: !1683)
!1687 = !DILocation(line: 1376, column: 5, scope: !1683)
!1688 = !DILocation(line: 1383, column: 16, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1637, file: !69, line: 1382, column: 3)
!1690 = !DILocation(line: 1383, column: 30, scope: !1689)
!1691 = !DILocation(line: 1383, column: 40, scope: !1689)
!1692 = !DILocation(line: 1383, column: 39, scope: !1689)
!1693 = !DILocation(line: 1383, column: 55, scope: !1689)
!1694 = !DILocation(line: 1383, column: 53, scope: !1689)
!1695 = !DILocation(line: 1383, column: 26, scope: !1689)
!1696 = !DILocation(line: 1383, column: 69, scope: !1689)
!1697 = !DILocation(line: 1383, column: 13, scope: !1689)
!1698 = !DILocation(line: 1384, column: 16, scope: !1689)
!1699 = !DILocation(line: 1384, column: 26, scope: !1689)
!1700 = !DILocation(line: 1384, column: 25, scope: !1689)
!1701 = !DILocation(line: 1384, column: 42, scope: !1689)
!1702 = !DILocation(line: 1384, column: 51, scope: !1689)
!1703 = !DILocation(line: 1384, column: 50, scope: !1689)
!1704 = !DILocation(line: 1384, column: 39, scope: !1689)
!1705 = !DILocation(line: 1384, column: 13, scope: !1689)
!1706 = !DILocation(line: 1385, column: 11, scope: !1689)
!1707 = !DILocation(line: 1385, column: 4, scope: !1689)
!1708 = !DILocation(line: 1388, column: 1, scope: !1606)
!1709 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1405, type: !1710, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1710 = !DISubroutineType(types: !1711)
!1711 = !{!21, !21, !21}
!1712 = !DILocalVariable(name: "numerator", arg: 1, scope: !1709, file: !69, line: 1405, type: !21)
!1713 = !DILocation(line: 1405, column: 25, scope: !1709)
!1714 = !DILocalVariable(name: "denominator", arg: 2, scope: !1709, file: !69, line: 1405, type: !21)
!1715 = !DILocation(line: 1405, column: 40, scope: !1709)
!1716 = !DILocalVariable(name: "s32Temp1", scope: !1709, file: !69, line: 1407, type: !21)
!1717 = !DILocation(line: 1407, column: 6, scope: !1709)
!1718 = !DILocalVariable(name: "s32Temp2", scope: !1709, file: !69, line: 1407, type: !21)
!1719 = !DILocation(line: 1407, column: 20, scope: !1709)
!1720 = !DILocalVariable(name: "denominator_prime", scope: !1709, file: !69, line: 1408, type: !428)
!1721 = !DILocation(line: 1408, column: 6, scope: !1709)
!1722 = !DILocalVariable(name: "u32Temp1", scope: !1709, file: !69, line: 1408, type: !428)
!1723 = !DILocation(line: 1408, column: 29, scope: !1709)
!1724 = !DILocalVariable(name: "u32Temp2", scope: !1709, file: !69, line: 1408, type: !428)
!1725 = !DILocation(line: 1408, column: 43, scope: !1709)
!1726 = !DILocalVariable(name: "u32numerator", scope: !1709, file: !69, line: 1409, type: !428)
!1727 = !DILocation(line: 1409, column: 6, scope: !1709)
!1728 = !DILocalVariable(name: "u32denominator", scope: !1709, file: !69, line: 1409, type: !428)
!1729 = !DILocation(line: 1409, column: 23, scope: !1709)
!1730 = !DILocation(line: 1410, column: 5, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1709, file: !69, line: 1410, column: 5)
!1732 = !DILocation(line: 1410, column: 15, scope: !1731)
!1733 = !DILocation(line: 1410, column: 5, scope: !1709)
!1734 = !DILocation(line: 1412, column: 6, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1736, file: !69, line: 1412, column: 6)
!1736 = distinct !DILexicalBlock(scope: !1731, file: !69, line: 1411, column: 2)
!1737 = !DILocation(line: 1412, column: 18, scope: !1735)
!1738 = !DILocation(line: 1412, column: 6, scope: !1736)
!1739 = !DILocation(line: 1414, column: 7, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1741, file: !69, line: 1414, column: 7)
!1741 = distinct !DILexicalBlock(scope: !1735, file: !69, line: 1413, column: 3)
!1742 = !DILocation(line: 1414, column: 19, scope: !1740)
!1743 = !DILocation(line: 1414, column: 7, scope: !1741)
!1744 = !DILocation(line: 1416, column: 5, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1740, file: !69, line: 1415, column: 4)
!1746 = !DILocation(line: 1420, column: 21, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1740, file: !69, line: 1419, column: 4)
!1748 = !DILocation(line: 1420, column: 20, scope: !1747)
!1749 = !DILocation(line: 1420, column: 18, scope: !1747)
!1750 = !DILocation(line: 1421, column: 23, scope: !1747)
!1751 = !DILocation(line: 1421, column: 22, scope: !1747)
!1752 = !DILocation(line: 1421, column: 20, scope: !1747)
!1753 = !DILocation(line: 1422, column: 16, scope: !1747)
!1754 = !DILocation(line: 1422, column: 33, scope: !1747)
!1755 = !DILocation(line: 1422, column: 46, scope: !1747)
!1756 = !DILocation(line: 1422, column: 45, scope: !1747)
!1757 = !DILocation(line: 1422, column: 64, scope: !1747)
!1758 = !DILocation(line: 1422, column: 62, scope: !1747)
!1759 = !DILocation(line: 1422, column: 29, scope: !1747)
!1760 = !DILocation(line: 1422, column: 81, scope: !1747)
!1761 = !DILocation(line: 1422, column: 14, scope: !1747)
!1762 = !DILocation(line: 1423, column: 17, scope: !1747)
!1763 = !DILocation(line: 1423, column: 30, scope: !1747)
!1764 = !DILocation(line: 1423, column: 29, scope: !1747)
!1765 = !DILocation(line: 1423, column: 49, scope: !1747)
!1766 = !DILocation(line: 1423, column: 58, scope: !1747)
!1767 = !DILocation(line: 1423, column: 57, scope: !1747)
!1768 = !DILocation(line: 1423, column: 46, scope: !1747)
!1769 = !DILocation(line: 1423, column: 14, scope: !1747)
!1770 = !DILocation(line: 1424, column: 8, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1747, file: !69, line: 1424, column: 8)
!1772 = !DILocation(line: 1424, column: 17, scope: !1771)
!1773 = !DILocation(line: 1424, column: 8, scope: !1747)
!1774 = !DILocation(line: 1426, column: 13, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1425, column: 5)
!1776 = !DILocation(line: 1426, column: 6, scope: !1775)
!1777 = !DILocation(line: 1430, column: 6, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1429, column: 5)
!1779 = !DILocation(line: 1436, column: 20, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1735, file: !69, line: 1435, column: 3)
!1781 = !DILocation(line: 1436, column: 19, scope: !1780)
!1782 = !DILocation(line: 1436, column: 29, scope: !1780)
!1783 = !DILocation(line: 1436, column: 17, scope: !1780)
!1784 = !DILocation(line: 1437, column: 16, scope: !1780)
!1785 = !DILocation(line: 1437, column: 33, scope: !1780)
!1786 = !DILocation(line: 1437, column: 46, scope: !1780)
!1787 = !DILocation(line: 1437, column: 45, scope: !1780)
!1788 = !DILocation(line: 1437, column: 61, scope: !1780)
!1789 = !DILocation(line: 1437, column: 59, scope: !1780)
!1790 = !DILocation(line: 1437, column: 29, scope: !1780)
!1791 = !DILocation(line: 1437, column: 75, scope: !1780)
!1792 = !DILocation(line: 1437, column: 13, scope: !1780)
!1793 = !DILocation(line: 1438, column: 16, scope: !1780)
!1794 = !DILocation(line: 1438, column: 29, scope: !1780)
!1795 = !DILocation(line: 1438, column: 28, scope: !1780)
!1796 = !DILocation(line: 1438, column: 45, scope: !1780)
!1797 = !DILocation(line: 1438, column: 54, scope: !1780)
!1798 = !DILocation(line: 1438, column: 53, scope: !1780)
!1799 = !DILocation(line: 1438, column: 42, scope: !1780)
!1800 = !DILocation(line: 1438, column: 13, scope: !1780)
!1801 = !DILocation(line: 1439, column: 13, scope: !1780)
!1802 = !DILocation(line: 1439, column: 12, scope: !1780)
!1803 = !DILocation(line: 1439, column: 22, scope: !1780)
!1804 = !DILocation(line: 1439, column: 4, scope: !1780)
!1805 = !DILocation(line: 1444, column: 6, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1807, file: !69, line: 1444, column: 6)
!1807 = distinct !DILexicalBlock(scope: !1731, file: !69, line: 1443, column: 2)
!1808 = !DILocation(line: 1444, column: 18, scope: !1806)
!1809 = !DILocation(line: 1444, column: 6, scope: !1807)
!1810 = !DILocation(line: 1446, column: 7, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1812, file: !69, line: 1446, column: 7)
!1812 = distinct !DILexicalBlock(scope: !1806, file: !69, line: 1445, column: 3)
!1813 = !DILocation(line: 1446, column: 19, scope: !1811)
!1814 = !DILocation(line: 1446, column: 7, scope: !1812)
!1815 = !DILocation(line: 1448, column: 5, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1811, file: !69, line: 1447, column: 4)
!1817 = !DILocation(line: 1452, column: 23, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1811, file: !69, line: 1451, column: 4)
!1819 = !DILocation(line: 1452, column: 22, scope: !1818)
!1820 = !DILocation(line: 1452, column: 35, scope: !1818)
!1821 = !DILocation(line: 1452, column: 20, scope: !1818)
!1822 = !DILocation(line: 1453, column: 17, scope: !1818)
!1823 = !DILocation(line: 1453, column: 31, scope: !1818)
!1824 = !DILocation(line: 1453, column: 41, scope: !1818)
!1825 = !DILocation(line: 1453, column: 40, scope: !1818)
!1826 = !DILocation(line: 1453, column: 59, scope: !1818)
!1827 = !DILocation(line: 1453, column: 57, scope: !1818)
!1828 = !DILocation(line: 1453, column: 27, scope: !1818)
!1829 = !DILocation(line: 1453, column: 76, scope: !1818)
!1830 = !DILocation(line: 1453, column: 14, scope: !1818)
!1831 = !DILocation(line: 1454, column: 17, scope: !1818)
!1832 = !DILocation(line: 1454, column: 27, scope: !1818)
!1833 = !DILocation(line: 1454, column: 26, scope: !1818)
!1834 = !DILocation(line: 1454, column: 46, scope: !1818)
!1835 = !DILocation(line: 1454, column: 55, scope: !1818)
!1836 = !DILocation(line: 1454, column: 54, scope: !1818)
!1837 = !DILocation(line: 1454, column: 43, scope: !1818)
!1838 = !DILocation(line: 1454, column: 14, scope: !1818)
!1839 = !DILocation(line: 1455, column: 14, scope: !1818)
!1840 = !DILocation(line: 1455, column: 13, scope: !1818)
!1841 = !DILocation(line: 1455, column: 23, scope: !1818)
!1842 = !DILocation(line: 1455, column: 5, scope: !1818)
!1843 = !DILocation(line: 1460, column: 16, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1806, file: !69, line: 1459, column: 3)
!1845 = !DILocation(line: 1460, column: 30, scope: !1844)
!1846 = !DILocation(line: 1460, column: 40, scope: !1844)
!1847 = !DILocation(line: 1460, column: 39, scope: !1844)
!1848 = !DILocation(line: 1460, column: 55, scope: !1844)
!1849 = !DILocation(line: 1460, column: 53, scope: !1844)
!1850 = !DILocation(line: 1460, column: 26, scope: !1844)
!1851 = !DILocation(line: 1460, column: 69, scope: !1844)
!1852 = !DILocation(line: 1460, column: 13, scope: !1844)
!1853 = !DILocation(line: 1461, column: 16, scope: !1844)
!1854 = !DILocation(line: 1461, column: 26, scope: !1844)
!1855 = !DILocation(line: 1461, column: 25, scope: !1844)
!1856 = !DILocation(line: 1461, column: 42, scope: !1844)
!1857 = !DILocation(line: 1461, column: 51, scope: !1844)
!1858 = !DILocation(line: 1461, column: 50, scope: !1844)
!1859 = !DILocation(line: 1461, column: 39, scope: !1844)
!1860 = !DILocation(line: 1461, column: 13, scope: !1844)
!1861 = !DILocation(line: 1462, column: 11, scope: !1844)
!1862 = !DILocation(line: 1462, column: 4, scope: !1844)
!1863 = !DILocation(line: 1465, column: 1, scope: !1709)
!1864 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1483, type: !1865, scopeLine: 1484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1865 = !DISubroutineType(types: !1866)
!1866 = !{!6, !21, !428}
!1867 = !DILocalVariable(name: "numerator", arg: 1, scope: !1864, file: !69, line: 1483, type: !21)
!1868 = !DILocation(line: 1483, column: 25, scope: !1864)
!1869 = !DILocalVariable(name: "denominator", arg: 2, scope: !1864, file: !69, line: 1483, type: !428)
!1870 = !DILocation(line: 1483, column: 40, scope: !1864)
!1871 = !DILocalVariable(name: "numerator_prime", scope: !1864, file: !69, line: 1486, type: !428)
!1872 = !DILocation(line: 1486, column: 6, scope: !1864)
!1873 = !DILocalVariable(name: "u32Temp1", scope: !1864, file: !69, line: 1486, type: !428)
!1874 = !DILocation(line: 1486, column: 27, scope: !1864)
!1875 = !DILocalVariable(name: "u32Temp2", scope: !1864, file: !69, line: 1486, type: !428)
!1876 = !DILocation(line: 1486, column: 41, scope: !1864)
!1877 = !DILocalVariable(name: "u32Temp3", scope: !1864, file: !69, line: 1486, type: !428)
!1878 = !DILocation(line: 1486, column: 55, scope: !1864)
!1879 = !DILocalVariable(name: "s32Temp1", scope: !1864, file: !69, line: 1487, type: !21)
!1880 = !DILocation(line: 1487, column: 6, scope: !1864)
!1881 = !DILocalVariable(name: "s32Temp2", scope: !1864, file: !69, line: 1487, type: !21)
!1882 = !DILocation(line: 1487, column: 20, scope: !1864)
!1883 = !DILocalVariable(name: "s32Temp3", scope: !1864, file: !69, line: 1487, type: !21)
!1884 = !DILocation(line: 1487, column: 34, scope: !1864)
!1885 = !DILocation(line: 1488, column: 5, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1864, file: !69, line: 1488, column: 5)
!1887 = !DILocation(line: 1488, column: 17, scope: !1886)
!1888 = !DILocation(line: 1488, column: 5, scope: !1864)
!1889 = !DILocation(line: 1490, column: 6, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1891, file: !69, line: 1490, column: 6)
!1891 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1489, column: 2)
!1892 = !DILocation(line: 1490, column: 15, scope: !1890)
!1893 = !DILocation(line: 1490, column: 6, scope: !1891)
!1894 = !DILocation(line: 1492, column: 4, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1890, file: !69, line: 1491, column: 3)
!1896 = !DILocation(line: 1496, column: 4, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1890, file: !69, line: 1495, column: 3)
!1898 = !DILocation(line: 1501, column: 6, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1900, file: !69, line: 1501, column: 6)
!1900 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1500, column: 2)
!1901 = !DILocation(line: 1501, column: 16, scope: !1899)
!1902 = !DILocation(line: 1501, column: 6, scope: !1900)
!1903 = !DILocation(line: 1503, column: 23, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1502, column: 3)
!1905 = !DILocation(line: 1503, column: 22, scope: !1904)
!1906 = !DILocation(line: 1503, column: 20, scope: !1904)
!1907 = !DILocation(line: 1504, column: 16, scope: !1904)
!1908 = !DILocation(line: 1504, column: 32, scope: !1904)
!1909 = !DILocation(line: 1504, column: 31, scope: !1904)
!1910 = !DILocation(line: 1504, column: 13, scope: !1904)
!1911 = !DILocation(line: 1505, column: 15, scope: !1904)
!1912 = !DILocation(line: 1505, column: 34, scope: !1904)
!1913 = !DILocation(line: 1505, column: 45, scope: !1904)
!1914 = !DILocation(line: 1505, column: 43, scope: !1904)
!1915 = !DILocation(line: 1505, column: 31, scope: !1904)
!1916 = !DILocation(line: 1505, column: 13, scope: !1904)
!1917 = !DILocation(line: 1507, column: 8, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1904, file: !69, line: 1507, column: 7)
!1919 = !DILocation(line: 1507, column: 20, scope: !1918)
!1920 = !DILocation(line: 1507, column: 27, scope: !1918)
!1921 = !DILocation(line: 1507, column: 7, scope: !1904)
!1922 = !DILocation(line: 1509, column: 19, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1918, file: !69, line: 1508, column: 4)
!1924 = !DILocation(line: 1509, column: 31, scope: !1923)
!1925 = !DILocation(line: 1509, column: 17, scope: !1923)
!1926 = !DILocation(line: 1510, column: 4, scope: !1923)
!1927 = !DILocation(line: 1513, column: 20, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1918, file: !69, line: 1512, column: 4)
!1929 = !DILocation(line: 1513, column: 32, scope: !1928)
!1930 = !DILocation(line: 1513, column: 38, scope: !1928)
!1931 = !DILocation(line: 1513, column: 17, scope: !1928)
!1932 = !DILocation(line: 1516, column: 7, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1904, file: !69, line: 1516, column: 7)
!1934 = !DILocation(line: 1516, column: 18, scope: !1933)
!1935 = !DILocation(line: 1516, column: 16, scope: !1933)
!1936 = !DILocation(line: 1516, column: 7, scope: !1904)
!1937 = !DILocation(line: 1518, column: 18, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1933, file: !69, line: 1517, column: 4)
!1939 = !DILocation(line: 1518, column: 16, scope: !1938)
!1940 = !DILocation(line: 1518, column: 28, scope: !1938)
!1941 = !DILocation(line: 1518, column: 14, scope: !1938)
!1942 = !DILocation(line: 1519, column: 4, scope: !1938)
!1943 = !DILocation(line: 1522, column: 18, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1933, file: !69, line: 1521, column: 4)
!1945 = !DILocation(line: 1522, column: 26, scope: !1944)
!1946 = !DILocation(line: 1522, column: 16, scope: !1944)
!1947 = !DILocation(line: 1522, column: 30, scope: !1944)
!1948 = !DILocation(line: 1522, column: 14, scope: !1944)
!1949 = !DILocation(line: 1524, column: 8, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1904, file: !69, line: 1524, column: 7)
!1951 = !DILocation(line: 1524, column: 18, scope: !1950)
!1952 = !DILocation(line: 1524, column: 7, scope: !1904)
!1953 = !DILocation(line: 1526, column: 18, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1525, column: 4)
!1955 = !DILocation(line: 1526, column: 12, scope: !1954)
!1956 = !DILocation(line: 1526, column: 5, scope: !1954)
!1957 = !DILocation(line: 1530, column: 5, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1529, column: 4)
!1959 = !DILocation(line: 1535, column: 16, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1534, column: 3)
!1961 = !DILocation(line: 1535, column: 26, scope: !1960)
!1962 = !DILocation(line: 1535, column: 25, scope: !1960)
!1963 = !DILocation(line: 1535, column: 41, scope: !1960)
!1964 = !DILocation(line: 1535, column: 39, scope: !1960)
!1965 = !DILocation(line: 1535, column: 13, scope: !1960)
!1966 = !DILocation(line: 1536, column: 16, scope: !1960)
!1967 = !DILocation(line: 1536, column: 30, scope: !1960)
!1968 = !DILocation(line: 1536, column: 40, scope: !1960)
!1969 = !DILocation(line: 1536, column: 39, scope: !1960)
!1970 = !DILocation(line: 1536, column: 55, scope: !1960)
!1971 = !DILocation(line: 1536, column: 53, scope: !1960)
!1972 = !DILocation(line: 1536, column: 26, scope: !1960)
!1973 = !DILocation(line: 1536, column: 68, scope: !1960)
!1974 = !DILocation(line: 1536, column: 13, scope: !1960)
!1975 = !DILocation(line: 1537, column: 16, scope: !1960)
!1976 = !DILocation(line: 1537, column: 25, scope: !1960)
!1977 = !DILocation(line: 1537, column: 24, scope: !1960)
!1978 = !DILocation(line: 1537, column: 41, scope: !1960)
!1979 = !DILocation(line: 1537, column: 51, scope: !1960)
!1980 = !DILocation(line: 1537, column: 50, scope: !1960)
!1981 = !DILocation(line: 1537, column: 38, scope: !1960)
!1982 = !DILocation(line: 1537, column: 13, scope: !1960)
!1983 = !DILocation(line: 1538, column: 7, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1960, file: !69, line: 1538, column: 7)
!1985 = !DILocation(line: 1538, column: 16, scope: !1984)
!1986 = !DILocation(line: 1538, column: 7, scope: !1960)
!1987 = !DILocation(line: 1540, column: 17, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1984, file: !69, line: 1539, column: 4)
!1989 = !DILocation(line: 1540, column: 12, scope: !1988)
!1990 = !DILocation(line: 1540, column: 5, scope: !1988)
!1991 = !DILocation(line: 1544, column: 5, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1984, file: !69, line: 1543, column: 4)
!1993 = !DILocation(line: 1548, column: 1, scope: !1864)
!1994 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1995, file: !1995, line: 12, type: !1996, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1999)
!1995 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1996 = !DISubroutineType(types: !1997)
!1997 = !{null, !1998}
!1998 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1999 = !{!2000}
!2000 = !DILocalVariable(name: "z", arg: 1, scope: !1994, file: !1995, line: 12, type: !1998)
!2001 = !DILocation(line: 0, scope: !1994)
!2002 = !DILocation(line: 13, column: 9, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !1994, file: !1995, line: 13, column: 7)
!2004 = !DILocation(line: 13, column: 7, scope: !1994)
!2005 = !DILocation(line: 14, column: 5, scope: !2003)
!2006 = !DILocation(line: 15, column: 1, scope: !1994)
!2007 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2008, file: !2008, line: 20, type: !2009, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2012)
!2008 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2009 = !DISubroutineType(types: !2010)
!2010 = !{null, !2011, !2011}
!2011 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2012 = !{!2013, !2014}
!2013 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2007, file: !2008, line: 20, type: !2011)
!2014 = !DILocalVariable(name: "shift", arg: 2, scope: !2007, file: !2008, line: 20, type: !2011)
!2015 = !DILocation(line: 0, scope: !2007)
!2016 = !DILocation(line: 21, column: 13, scope: !2017)
!2017 = distinct !DILexicalBlock(scope: !2007, file: !2008, line: 21, column: 7)
!2018 = !DILocation(line: 21, column: 7, scope: !2007)
!2019 = !DILocation(line: 27, column: 5, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !2017, file: !2008, line: 21, column: 26)
!2021 = !DILocation(line: 29, column: 1, scope: !2007)
