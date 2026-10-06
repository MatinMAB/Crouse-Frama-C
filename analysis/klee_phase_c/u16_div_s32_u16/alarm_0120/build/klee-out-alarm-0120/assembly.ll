; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120/build/u16_div_s32_u16_alarm_0120.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"x_value\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"y_value\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [135 x i8] c"KLEE-ALARM-0120: invalid LHS operand for left shift. assert 0 <= (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value));\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0120.err\00", align 1
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
  %call = call i32 @klee_alarm_s32_lshift_upper(i64 %conv11, i32 1), !dbg !501
  %tobool = icmp ne i32 %call, 0, !dbg !501
  br i1 %tobool, label %if.end, label %if.then12, !dbg !502

if.then12:                                        ; preds = %if.else8
  store i16 0, i16* %retval, align 2, !dbg !503
  br label %return, !dbg !503

if.end:                                           ; preds = %if.else8
  %7 = load i32, i32* %x_value.addr, align 4, !dbg !505
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !507
  %conv13 = zext i16 %8 to i32, !dbg !508
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !509
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !509
  %div14 = sdiv i32 %7, %conv13, !dbg !509, !klee.check.div !106
  %conv15 = sext i32 %div14 to i64, !dbg !510
  %9 = load i16, i16* %y_value.addr, align 2, !dbg !511
  %conv16 = zext i16 %9 to i32, !dbg !512
  %conv17 = sext i32 %conv16 to i64, !dbg !513
  %call18 = call i32 @klee_alarm_s32_mul_upper(i64 %conv15, i64 %conv17), !dbg !514
  %tobool19 = icmp ne i32 %call18, 0, !dbg !514
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !515

if.then20:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !516
  br label %return, !dbg !516

if.end21:                                         ; preds = %if.end
  %10 = load i32, i32* %x_value.addr, align 4, !dbg !518
  %11 = load i16, i16* %y_value.addr, align 2, !dbg !520
  %conv22 = zext i16 %11 to i32, !dbg !521
  %int_cast_to_i642 = zext i32 %conv22 to i64, !dbg !522
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !522
  %div23 = sdiv i32 %10, %conv22, !dbg !522, !klee.check.div !106
  %conv24 = sext i32 %div23 to i64, !dbg !523
  %12 = load i16, i16* %y_value.addr, align 2, !dbg !524
  %conv25 = zext i16 %12 to i32, !dbg !525
  %conv26 = sext i32 %conv25 to i64, !dbg !526
  %call27 = call i32 @klee_alarm_s32_mul_lower(i64 %conv24, i64 %conv26), !dbg !527
  %tobool28 = icmp ne i32 %call27, 0, !dbg !527
  br i1 %tobool28, label %if.end30, label %if.then29, !dbg !528

if.then29:                                        ; preds = %if.end21
  store i16 0, i16* %retval, align 2, !dbg !529
  br label %return, !dbg !529

if.end30:                                         ; preds = %if.end21
  %13 = load i32, i32* %x_value.addr, align 4, !dbg !531
  %14 = load i32, i32* %x_value.addr, align 4, !dbg !533
  %15 = load i16, i16* %y_value.addr, align 2, !dbg !534
  %conv31 = zext i16 %15 to i32, !dbg !535
  %int_cast_to_i643 = zext i32 %conv31 to i64, !dbg !536
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !536
  %div32 = sdiv i32 %14, %conv31, !dbg !536, !klee.check.div !106
  %16 = load i16, i16* %y_value.addr, align 2, !dbg !537
  %conv33 = zext i16 %16 to i32, !dbg !538
  %mul34 = mul nsw i32 %div32, %conv33, !dbg !539
  %sub35 = sub nsw i32 %13, %mul34, !dbg !540
  %conv36 = sext i32 %sub35 to i64, !dbg !541
  %call37 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv36), !dbg !542
  %tobool38 = icmp ne i32 %call37, 0, !dbg !542
  br i1 %tobool38, label %if.end40, label %if.then39, !dbg !543

if.then39:                                        ; preds = %if.end30
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 511, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !544
  unreachable, !dbg !544

if.end40:                                         ; preds = %if.end30
  %17 = load i32, i32* %x_value.addr, align 4, !dbg !546
  %18 = load i32, i32* %x_value.addr, align 4, !dbg !547
  %19 = load i16, i16* %y_value.addr, align 2, !dbg !548
  %conv41 = zext i16 %19 to i32, !dbg !549
  %int_cast_to_i644 = zext i32 %conv41 to i64, !dbg !550
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !550
  %div42 = sdiv i32 %18, %conv41, !dbg !550, !klee.check.div !106
  %20 = load i16, i16* %y_value.addr, align 2, !dbg !551
  %conv43 = zext i16 %20 to i32, !dbg !552
  %mul44 = mul nsw i32 %div42, %conv43, !dbg !553
  %sub45 = sub nsw i32 %17, %mul44, !dbg !554
  %shl = shl i32 %sub45, 1, !dbg !555
  %conv46 = sext i32 %shl to i64, !dbg !556
  store volatile i64 %conv46, i64* @klee_alarm_sink_s64, align 8, !dbg !557
  store i16 0, i16* %retval, align 2, !dbg !558
  br label %return, !dbg !558

return:                                           ; preds = %if.end40, %if.then29, %if.then20, %if.then12, %if.else, %if.then7
  %21 = load i16, i16* %retval, align 2, !dbg !559
  ret i16 %21, !dbg !559
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !560 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !563, metadata !DIExpression()), !dbg !564
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !565, metadata !DIExpression()), !dbg !566
  %0 = load i32, i32* %count.addr, align 4, !dbg !567
  %cmp = icmp uge i32 %0, 63, !dbg !569
  br i1 %cmp, label %if.then, label %if.end, !dbg !570

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !571
  br label %return, !dbg !571

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !573
  %2 = load i32, i32* %count.addr, align 4, !dbg !574
  %sh_prom = zext i32 %2 to i64, !dbg !575
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !575
  %shl = shl i64 1, %sh_prom, !dbg !575, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !576
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !577
  %conv = zext i1 %cmp1 to i32, !dbg !577
  store i32 %conv, i32* %retval, align 4, !dbg !578
  br label %return, !dbg !578

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !579
  ret i32 %3, !dbg !579
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !580 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !583, metadata !DIExpression()), !dbg !584
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !585, metadata !DIExpression()), !dbg !586
  %0 = load i64, i64* %left.addr, align 8, !dbg !587
  %1 = load i64, i64* %right.addr, align 8, !dbg !588
  %mul = mul nsw i64 %0, %1, !dbg !589
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !590
  %conv = zext i1 %cmp to i32, !dbg !590
  ret i32 %conv, !dbg !591
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !592 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !593, metadata !DIExpression()), !dbg !594
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !595, metadata !DIExpression()), !dbg !596
  %0 = load i64, i64* %left.addr, align 8, !dbg !597
  %1 = load i64, i64* %right.addr, align 8, !dbg !598
  %mul = mul nsw i64 %0, %1, !dbg !599
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !600
  %conv = zext i1 %cmp to i32, !dbg !600
  ret i32 %conv, !dbg !601
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !602 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !605, metadata !DIExpression()), !dbg !606
  %0 = load i64, i64* %left.addr, align 8, !dbg !607
  %cmp = icmp sge i64 %0, 0, !dbg !608
  %conv = zext i1 %cmp to i32, !dbg !608
  ret i32 %conv, !dbg !609
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !610 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !613, metadata !DIExpression()), !dbg !614
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !615, metadata !DIExpression()), !dbg !616
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !617, metadata !DIExpression()), !dbg !618
  store i32 0, i32* %u32Temp, align 4, !dbg !618
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !619
  %conv = zext i16 %0 to i32, !dbg !619
  %cmp = icmp eq i32 %conv, 0, !dbg !621
  br i1 %cmp, label %if.then, label %if.else, !dbg !622

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !623
  br label %return, !dbg !623

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !625
  %conv2 = zext i16 %1 to i32, !dbg !625
  %shl = shl i32 %conv2, 16, !dbg !627
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !628
  %conv3 = zext i16 %2 to i32, !dbg !628
  %shr = ashr i32 %conv3, 1, !dbg !629
  %add = add nsw i32 %shl, %shr, !dbg !630
  store i32 %add, i32* %u32Temp, align 4, !dbg !631
  %3 = load i32, i32* %u32Temp, align 4, !dbg !632
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !633
  %conv4 = zext i16 %4 to i32, !dbg !633
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !634
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !634
  %div = udiv i32 %3, %conv4, !dbg !634, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !635
  %5 = load i32, i32* %u32Temp, align 4, !dbg !636
  %cmp5 = icmp ult i32 %5, 65535, !dbg !638
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !639

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !640
  %and = and i32 %6, 65535, !dbg !642
  %conv8 = trunc i32 %and to i16, !dbg !640
  store i16 %conv8, i16* %retval, align 2, !dbg !643
  br label %return, !dbg !643

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !644
  br label %return, !dbg !644

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !646
  ret i16 %7, !dbg !646
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !647 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !650, metadata !DIExpression()), !dbg !651
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !652, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !654, metadata !DIExpression()), !dbg !655
  store i32 0, i32* %u32Temp1, align 4, !dbg !655
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !656, metadata !DIExpression()), !dbg !657
  store i32 0, i32* %u32Temp2, align 4, !dbg !657
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !658
  %conv = zext i16 %0 to i32, !dbg !658
  %and = and i32 %conv, 65535, !dbg !659
  %conv1 = trunc i32 %and to i16, !dbg !658
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !660
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !661
  %conv2 = zext i16 %1 to i32, !dbg !661
  %cmp = icmp eq i32 %conv2, 0, !dbg !663
  br i1 %cmp, label %if.then, label %if.else, !dbg !664

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !665
  br label %return, !dbg !665

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !667
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !669
  %conv4 = zext i16 %3 to i32, !dbg !669
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !670
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !670
  %div = udiv i32 %2, %conv4, !dbg !670, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !671
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !672
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !673
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !674
  %conv5 = zext i16 %6 to i32, !dbg !674
  %mul = mul i32 %5, %conv5, !dbg !675
  %sub = sub i32 %4, %mul, !dbg !676
  %shl = shl i32 %sub, 1, !dbg !677
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !678
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !679
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !680
  %conv6 = zext i16 %8 to i32, !dbg !680
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !681
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !681
  %div7 = udiv i32 %7, %conv6, !dbg !681, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !682
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !683
  %conv8 = zext i16 %10 to i32, !dbg !683
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !684
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !684
  %div9 = udiv i32 %9, %conv8, !dbg !684, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !685
  store i32 %add, i32* %u32Temp2, align 4, !dbg !686
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !687
  %cmp10 = icmp ult i32 %11, 65535, !dbg !689
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !690

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !691
  %and13 = and i32 %12, 65535, !dbg !693
  %conv14 = trunc i32 %and13 to i16, !dbg !691
  store i16 %conv14, i16* %retval, align 2, !dbg !694
  br label %return, !dbg !694

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !695
  br label %return, !dbg !695

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !697
  ret i16 %13, !dbg !697
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !698 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !701, metadata !DIExpression()), !dbg !702
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !703, metadata !DIExpression()), !dbg !704
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !705, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !707, metadata !DIExpression()), !dbg !708
  store i32 0, i32* %s32Result, align 4, !dbg !708
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !709, metadata !DIExpression()), !dbg !710
  store i32 0, i32* %s32Temp1, align 4, !dbg !710
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !711
  %conv = sext i16 %0 to i32, !dbg !711
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !712
  %conv1 = zext i16 %1 to i32, !dbg !712
  %mul = mul nsw i32 %conv, %conv1, !dbg !713
  store i32 %mul, i32* %s32Result, align 4, !dbg !714
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !715
  %conv2 = sext i16 %2 to i32, !dbg !715
  %cmp = icmp eq i32 %conv2, 0, !dbg !717
  br i1 %cmp, label %if.then, label %if.else7, !dbg !718

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !719
  %cmp4 = icmp slt i32 %3, 0, !dbg !722
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !723

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !724
  br label %return, !dbg !724

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !728
  %5 = load i32, i32* %s32Result, align 4, !dbg !730
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !731
  %conv8 = sext i16 %6 to i32, !dbg !731
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !732
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !732
  %div = sdiv i32 %5, %conv8, !dbg !732, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !733
  %conv9 = sext i16 %7 to i32, !dbg !733
  %mul10 = mul nsw i32 %div, %conv9, !dbg !734
  %sub = sub nsw i32 %4, %mul10, !dbg !735
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !736
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !737
  %shl = shl i32 %8, 1, !dbg !738
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !739
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !740
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !741
  %conv11 = sext i16 %10 to i32, !dbg !741
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !742
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !742
  %div12 = sdiv i32 %9, %conv11, !dbg !742, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !743
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !744
  %conv13 = sext i16 %12 to i32, !dbg !744
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !745
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !745
  %div14 = sdiv i32 %11, %conv13, !dbg !745, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !746
  store i32 %add, i32* %s32Result, align 4, !dbg !747
  %13 = load i32, i32* %s32Result, align 4, !dbg !748
  %cmp15 = icmp slt i32 %13, 32767, !dbg !750
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !751

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !752
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !755
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !756

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !757
  %conv21 = trunc i32 %15 to i16, !dbg !759
  store i16 %conv21, i16* %retval, align 2, !dbg !760
  br label %return, !dbg !760

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !761
  br label %return, !dbg !761

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !763
  br label %return, !dbg !763

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !765
  ret i16 %16, !dbg !765
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !766 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !769, metadata !DIExpression()), !dbg !770
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !771, metadata !DIExpression()), !dbg !772
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !773, metadata !DIExpression()), !dbg !774
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !775, metadata !DIExpression()), !dbg !776
  store i32 0, i32* %s32Result, align 4, !dbg !776
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !777, metadata !DIExpression()), !dbg !778
  store i32 0, i32* %s32Temp1, align 4, !dbg !778
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !779
  %conv = zext i16 %0 to i32, !dbg !779
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !780
  %conv1 = sext i16 %1 to i32, !dbg !780
  %mul = mul nsw i32 %conv, %conv1, !dbg !781
  store i32 %mul, i32* %s32Result, align 4, !dbg !782
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !783
  %conv2 = zext i16 %2 to i32, !dbg !783
  %cmp = icmp eq i32 %conv2, 0, !dbg !785
  br i1 %cmp, label %if.then, label %if.else7, !dbg !786

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !787
  %cmp4 = icmp slt i32 %3, 0, !dbg !790
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !791

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !792
  br label %return, !dbg !792

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !794
  br label %return, !dbg !794

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !796
  %5 = load i32, i32* %s32Result, align 4, !dbg !798
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !799
  %conv8 = zext i16 %6 to i32, !dbg !799
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !800
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !800
  %div = sdiv i32 %5, %conv8, !dbg !800, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !801
  %conv9 = zext i16 %7 to i32, !dbg !801
  %mul10 = mul nsw i32 %div, %conv9, !dbg !802
  %sub = sub nsw i32 %4, %mul10, !dbg !803
  %shl = shl i32 %sub, 1, !dbg !804
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !805
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !806
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !807
  %conv11 = zext i16 %9 to i32, !dbg !807
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !808
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !808
  %div12 = sdiv i32 %8, %conv11, !dbg !808, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !809
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !810
  %conv13 = zext i16 %11 to i32, !dbg !810
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !811
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !811
  %div14 = sdiv i32 %10, %conv13, !dbg !811, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !812
  store i32 %add, i32* %s32Result, align 4, !dbg !813
  %12 = load i32, i32* %s32Result, align 4, !dbg !814
  %cmp15 = icmp slt i32 %12, 32767, !dbg !816
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !817

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !818
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !821
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !822

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !823
  %conv21 = trunc i32 %14 to i16, !dbg !825
  store i16 %conv21, i16* %retval, align 2, !dbg !826
  br label %return, !dbg !826

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !827
  br label %return, !dbg !827

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !829
  br label %return, !dbg !829

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !831
  ret i16 %15, !dbg !831
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !832 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !835, metadata !DIExpression()), !dbg !836
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !837, metadata !DIExpression()), !dbg !838
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !839, metadata !DIExpression()), !dbg !840
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !841, metadata !DIExpression()), !dbg !842
  store i32 0, i32* %u32Result, align 4, !dbg !842
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !843, metadata !DIExpression()), !dbg !844
  store i32 0, i32* %u32Temp1, align 4, !dbg !844
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !845, metadata !DIExpression()), !dbg !846
  store i32 0, i32* %s32Result, align 4, !dbg !846
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !847, metadata !DIExpression()), !dbg !848
  store i32 0, i32* %s32Temp1, align 4, !dbg !848
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !849
  %conv = sext i16 %0 to i32, !dbg !849
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !850
  %conv1 = zext i16 %1 to i32, !dbg !850
  %mul = mul nsw i32 %conv, %conv1, !dbg !851
  store i32 %mul, i32* %s32Result, align 4, !dbg !852
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !853
  %conv2 = sext i16 %2 to i32, !dbg !853
  %cmp = icmp eq i32 %conv2, 0, !dbg !855
  br i1 %cmp, label %if.then, label %if.else7, !dbg !856

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !857
  %cmp4 = icmp sge i32 %3, 0, !dbg !860
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !861

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !862
  br label %return, !dbg !862

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !864
  br label %return, !dbg !864

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !866
  %5 = load i32, i32* %s32Result, align 4, !dbg !868
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !869
  %conv8 = sext i16 %6 to i32, !dbg !869
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !870
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !870
  %div = sdiv i32 %5, %conv8, !dbg !870, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !871
  %conv9 = sext i16 %7 to i32, !dbg !871
  %mul10 = mul nsw i32 %div, %conv9, !dbg !872
  %sub = sub nsw i32 %4, %mul10, !dbg !873
  %shl = shl i32 %sub, 1, !dbg !874
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !875
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !876
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !877
  %conv11 = sext i16 %9 to i32, !dbg !877
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !878
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !878
  %div12 = sdiv i32 %8, %conv11, !dbg !878, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !879
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !880
  %conv13 = sext i16 %11 to i32, !dbg !880
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !881
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !881
  %div14 = sdiv i32 %10, %conv13, !dbg !881, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !882
  store i32 %add, i32* %s32Result, align 4, !dbg !883
  %12 = load i32, i32* %s32Result, align 4, !dbg !884
  %cmp15 = icmp slt i32 %12, 65535, !dbg !886
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !887

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !888
  %cmp18 = icmp sgt i32 %13, 0, !dbg !891
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !892

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !893
  %conv21 = trunc i32 %14 to i16, !dbg !895
  store i16 %conv21, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !897
  br label %return, !dbg !897

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !899
  br label %return, !dbg !899

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !901
  ret i16 %15, !dbg !901
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !902 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !905, metadata !DIExpression()), !dbg !906
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !907, metadata !DIExpression()), !dbg !908
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !909, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !911, metadata !DIExpression()), !dbg !912
  store i32 0, i32* %s32Result, align 4, !dbg !912
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !913, metadata !DIExpression()), !dbg !914
  store i32 0, i32* %s32Temp1, align 4, !dbg !914
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !915
  %conv = sext i16 %0 to i32, !dbg !915
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !916
  %conv1 = zext i16 %1 to i32, !dbg !916
  %mul = mul nsw i32 %conv, %conv1, !dbg !917
  store i32 %mul, i32* %s32Result, align 4, !dbg !918
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !919
  %conv2 = zext i16 %2 to i32, !dbg !919
  %cmp = icmp eq i32 %conv2, 0, !dbg !921
  br i1 %cmp, label %if.then, label %if.else7, !dbg !922

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !923
  %cmp4 = icmp sge i32 %3, 0, !dbg !926
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !927

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !928
  br label %return, !dbg !928

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !930
  br label %return, !dbg !930

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !932
  %5 = load i32, i32* %s32Result, align 4, !dbg !934
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !935
  %conv8 = zext i16 %6 to i32, !dbg !935
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !936
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !936
  %div = sdiv i32 %5, %conv8, !dbg !936, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !937
  %conv9 = zext i16 %7 to i32, !dbg !937
  %mul10 = mul nsw i32 %div, %conv9, !dbg !938
  %sub = sub nsw i32 %4, %mul10, !dbg !939
  %shl = shl i32 %sub, 1, !dbg !940
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !941
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !942
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !943
  %conv11 = zext i16 %9 to i32, !dbg !943
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !944
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !944
  %div12 = sdiv i32 %8, %conv11, !dbg !944, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !945
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !946
  %conv13 = zext i16 %11 to i32, !dbg !946
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !947
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !947
  %div14 = sdiv i32 %10, %conv13, !dbg !947, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !948
  store i32 %add, i32* %s32Result, align 4, !dbg !949
  %12 = load i32, i32* %s32Result, align 4, !dbg !950
  %cmp15 = icmp slt i32 %12, 65535, !dbg !952
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !953

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !954
  %cmp18 = icmp sgt i32 %13, 0, !dbg !957
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !958

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !959
  %conv21 = trunc i32 %14 to i16, !dbg !961
  store i16 %conv21, i16* %retval, align 2, !dbg !962
  br label %return, !dbg !962

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !963
  br label %return, !dbg !963

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !965
  br label %return, !dbg !965

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !967
  ret i16 %15, !dbg !967
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !968 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !971, metadata !DIExpression()), !dbg !972
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !973, metadata !DIExpression()), !dbg !974
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !975, metadata !DIExpression()), !dbg !976
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !977, metadata !DIExpression()), !dbg !978
  store i32 0, i32* %u32Temp1, align 4, !dbg !978
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !979, metadata !DIExpression()), !dbg !980
  store i16 0, i16* %u16TempDenom, align 2, !dbg !980
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !981
  %conv = zext i16 %0 to i32, !dbg !981
  %cmp = icmp eq i32 %conv, 0, !dbg !983
  br i1 %cmp, label %if.then, label %if.else, !dbg !984

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !985
  br label %return, !dbg !985

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !987
  %conv2 = zext i16 %1 to i32, !dbg !987
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !989
  %conv3 = zext i16 %2 to i32, !dbg !989
  %mul = mul nsw i32 %conv2, %conv3, !dbg !990
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !991
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !992
  %conv4 = zext i16 %3 to i32, !dbg !992
  %shr = ashr i32 %conv4, 1, !dbg !993
  %conv5 = trunc i32 %shr to i16, !dbg !992
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !994
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !995
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !996
  %conv6 = zext i16 %5 to i32, !dbg !996
  %add = add i32 %4, %conv6, !dbg !997
  store i32 %add, i32* %u32Temp1, align 4, !dbg !998
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !999
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1000
  %conv7 = zext i16 %7 to i32, !dbg !1000
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1001
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1001
  %div = udiv i32 %6, %conv7, !dbg !1001, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1002
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1003
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1005
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1006

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1007
  %and = and i32 %9, 65535, !dbg !1009
  %conv11 = trunc i32 %and to i16, !dbg !1010
  store i16 %conv11, i16* %retval, align 2, !dbg !1011
  br label %return, !dbg !1011

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1012
  br label %return, !dbg !1012

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1014
  ret i16 %10, !dbg !1014
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1015 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i32 0, i32* %u32Temp1, align 4, !dbg !1025
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1026
  %cmp = icmp eq i32 %0, 0, !dbg !1028
  br i1 %cmp, label %if.then, label %if.else, !dbg !1029

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1030
  br label %return, !dbg !1030

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1032
  %conv = zext i16 %1 to i32, !dbg !1032
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1034
  %conv1 = zext i16 %2 to i32, !dbg !1034
  %mul = mul nsw i32 %conv, %conv1, !dbg !1035
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1036
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1037
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1037
  %div = udiv i32 %mul, %3, !dbg !1037, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1038
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1039
  %conv2 = zext i16 %4 to i32, !dbg !1039
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1041
  %conv3 = zext i16 %5 to i32, !dbg !1041
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1042
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1043
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1044
  %mul5 = mul i32 %6, %7, !dbg !1045
  %sub = sub i32 %mul4, %mul5, !dbg !1046
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1047
  %div6 = udiv i32 %8, 2, !dbg !1048
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1049
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1050

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1051
  %inc = add i32 %9, 1, !dbg !1051
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1051
  br label %if.end, !dbg !1053

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1054
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1056
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1057

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1058
  %and = and i32 %11, 65535, !dbg !1060
  %conv13 = trunc i32 %and to i16, !dbg !1061
  store i16 %conv13, i16* %retval, align 2, !dbg !1062
  br label %return, !dbg !1062

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1063
  br label %return, !dbg !1063

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1065
  ret i16 %12, !dbg !1065
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1066 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1069, metadata !DIExpression()), !dbg !1070
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1071, metadata !DIExpression()), !dbg !1072
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i32 0, i32* %u32Temp1, align 4, !dbg !1074
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1075
  %conv = zext i16 %0 to i32, !dbg !1075
  %cmp = icmp eq i32 %conv, 0, !dbg !1077
  br i1 %cmp, label %if.then, label %if.else, !dbg !1078

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1079
  br label %return, !dbg !1079

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1081
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1083
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1084
  %conv2 = zext i16 %3 to i32, !dbg !1084
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1085
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1085
  %div = udiv i32 %2, %conv2, !dbg !1085, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1086
  %conv3 = zext i16 %4 to i32, !dbg !1086
  %mul = mul i32 %div, %conv3, !dbg !1087
  %sub = sub i32 %1, %mul, !dbg !1088
  %shl = shl i32 %sub, 1, !dbg !1089
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1090
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1091
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1092
  %conv4 = zext i16 %6 to i32, !dbg !1092
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1093
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1093
  %div5 = udiv i32 %5, %conv4, !dbg !1093, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1094
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv6 = zext i16 %8 to i32, !dbg !1095
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1096
  %div7 = udiv i32 %7, %conv6, !dbg !1096, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1097
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1098
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1099
  store i32 %9, i32* %retval, align 4, !dbg !1100
  br label %return, !dbg !1100

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1101
  ret i32 %10, !dbg !1101
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1102 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1105, metadata !DIExpression()), !dbg !1106
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1107, metadata !DIExpression()), !dbg !1108
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1109, metadata !DIExpression()), !dbg !1110
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1111, metadata !DIExpression()), !dbg !1112
  store i32 0, i32* %s32Temp1, align 4, !dbg !1112
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1113, metadata !DIExpression()), !dbg !1114
  store i32 0, i32* %s32Temp2, align 4, !dbg !1114
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1115, metadata !DIExpression()), !dbg !1116
  store i32 0, i32* %s32Temp3, align 4, !dbg !1116
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1117
  %conv = sext i16 %0 to i32, !dbg !1117
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1118
  %conv1 = sext i16 %1 to i32, !dbg !1118
  %mul = mul nsw i32 %conv, %conv1, !dbg !1119
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1120
  %2 = load i16, i16* %div.addr, align 2, !dbg !1121
  %conv2 = sext i16 %2 to i32, !dbg !1121
  %cmp = icmp eq i32 %conv2, 0, !dbg !1123
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1124

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1125
  %cmp4 = icmp slt i32 %3, 0, !dbg !1128
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1129

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1130
  br label %return, !dbg !1130

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1132
  br label %return, !dbg !1132

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1134
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1136
  %6 = load i16, i16* %div.addr, align 2, !dbg !1137
  %conv8 = sext i16 %6 to i32, !dbg !1137
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1138
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1138
  %div9 = sdiv i32 %5, %conv8, !dbg !1138, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1139
  %conv10 = sext i16 %7 to i32, !dbg !1139
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1140
  %sub = sub nsw i32 %4, %mul11, !dbg !1141
  %shl = shl i32 %sub, 1, !dbg !1142
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1143
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1144
  %9 = load i16, i16* %div.addr, align 2, !dbg !1145
  %conv12 = sext i16 %9 to i32, !dbg !1145
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1146
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1146
  %div13 = sdiv i32 %8, %conv12, !dbg !1146, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1147
  %11 = load i16, i16* %div.addr, align 2, !dbg !1148
  %conv14 = sext i16 %11 to i32, !dbg !1148
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1149
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1149
  %div15 = sdiv i32 %10, %conv14, !dbg !1149, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1150
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1151
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1152
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1154
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1155

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1156
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1159
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1160

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1161
  %conv22 = trunc i32 %14 to i16, !dbg !1163
  store i16 %conv22, i16* %retval, align 2, !dbg !1164
  br label %return, !dbg !1164

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1165
  br label %return, !dbg !1165

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1167
  br label %return, !dbg !1167

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1169
  ret i16 %15, !dbg !1169
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1170 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1173, metadata !DIExpression()), !dbg !1174
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1175, metadata !DIExpression()), !dbg !1176
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1177, metadata !DIExpression()), !dbg !1178
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1179, metadata !DIExpression()), !dbg !1180
  store i32 0, i32* %s32Result, align 4, !dbg !1180
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1181, metadata !DIExpression()), !dbg !1182
  store i32 0, i32* %s32Temp1, align 4, !dbg !1182
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1183
  %conv = sext i16 %0 to i32, !dbg !1183
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1184
  %conv1 = sext i16 %1 to i32, !dbg !1184
  %mul = mul nsw i32 %conv, %conv1, !dbg !1185
  store i32 %mul, i32* %s32Result, align 4, !dbg !1186
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1187
  %conv2 = zext i16 %2 to i32, !dbg !1187
  %cmp = icmp eq i32 %conv2, 0, !dbg !1189
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1190

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1191
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1194
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1195

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1196
  br label %return, !dbg !1196

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1198
  %cmp7 = icmp eq i32 %4, 0, !dbg !1200
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1201

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1202
  br label %return, !dbg !1202

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1204
  br label %return, !dbg !1204

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1206
  %6 = load i32, i32* %s32Result, align 4, !dbg !1208
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1209
  %conv12 = zext i16 %7 to i32, !dbg !1209
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1210
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1210
  %div = sdiv i32 %6, %conv12, !dbg !1210, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1211
  %conv13 = zext i16 %8 to i32, !dbg !1211
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1212
  %sub = sub nsw i32 %5, %mul14, !dbg !1213
  %shl = shl i32 %sub, 1, !dbg !1214
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1215
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1216
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1217
  %conv15 = zext i16 %10 to i32, !dbg !1217
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1218
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1218
  %div16 = sdiv i32 %9, %conv15, !dbg !1218, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1219
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1220
  %conv17 = zext i16 %12 to i32, !dbg !1220
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1221
  %div18 = sdiv i32 %11, %conv17, !dbg !1221, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1222
  store i32 %add, i32* %s32Result, align 4, !dbg !1223
  %13 = load i32, i32* %s32Result, align 4, !dbg !1224
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1226
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1227

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1228
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1231
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1232

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1233
  %conv25 = trunc i32 %15 to i16, !dbg !1235
  store i16 %conv25, i16* %retval, align 2, !dbg !1236
  br label %return, !dbg !1236

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1237
  br label %return, !dbg !1237

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1239
  br label %return, !dbg !1239

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1241
  ret i16 %16, !dbg !1241
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1242 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1245, metadata !DIExpression()), !dbg !1246
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1247, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1249, metadata !DIExpression()), !dbg !1250
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1251
  %cmp = icmp eq i32 %0, 0, !dbg !1253
  br i1 %cmp, label %if.then, label %if.else, !dbg !1254

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1255
  br label %return, !dbg !1255

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1257
  %cmp1 = icmp sle i32 %1, 0, !dbg !1260
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1261

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1262
  br label %return, !dbg !1262

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1264
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1266
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1267
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1268
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1268
  %div = udiv i32 %3, %4, !dbg !1268, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1269
  %mul = mul i32 %div, %5, !dbg !1270
  %sub = sub i32 %2, %mul, !dbg !1271
  %shl = shl i32 %sub, 1, !dbg !1272
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1273
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1274
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1275
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1276
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1276
  %div4 = udiv i32 %6, %7, !dbg !1276, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1277
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1279
  %div5 = udiv i32 %8, %9, !dbg !1279, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1280
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1281
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1282
  store i32 %10, i32* %retval, align 4, !dbg !1283
  br label %return, !dbg !1283

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1284
  ret i32 %11, !dbg !1284
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1285 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1288, metadata !DIExpression()), !dbg !1289
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1290, metadata !DIExpression()), !dbg !1291
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1292, metadata !DIExpression()), !dbg !1293
  store i32 0, i32* %s32Temp1, align 4, !dbg !1293
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %cmp = icmp eq i32 %0, 0, !dbg !1296
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1297

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1298
  %cmp1 = icmp sge i32 %1, 0, !dbg !1301
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1302

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1303
  br label %return, !dbg !1303

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1305
  br label %return, !dbg !1305

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1307
  %cmp4 = icmp sge i32 %2, 0, !dbg !1310
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1311

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1312
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1314
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1315
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1316
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1316
  %div = udiv i32 %4, %5, !dbg !1316, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1317
  %mul = mul i32 %div, %6, !dbg !1318
  %sub = sub i32 %3, %mul, !dbg !1319
  %shl = shl i32 %sub, 1, !dbg !1320
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1321
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1322
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1323
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1324
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1324
  %div6 = udiv i32 %7, %8, !dbg !1324, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1325
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1326
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1327
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1327
  %div7 = udiv i32 %9, %10, !dbg !1327, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1328
  store i32 %add, i32* %retval, align 4, !dbg !1329
  br label %return, !dbg !1329

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1330
  br label %return, !dbg !1330

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1332
  ret i32 %11, !dbg !1332
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1333 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1336, metadata !DIExpression()), !dbg !1337
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1338, metadata !DIExpression()), !dbg !1339
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1340, metadata !DIExpression()), !dbg !1341
  store i32 0, i32* %u32Temp1, align 4, !dbg !1341
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1342, metadata !DIExpression()), !dbg !1343
  store i32 0, i32* %u32Temp2, align 4, !dbg !1343
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1344
  %cmp = icmp eq i32 %0, 0, !dbg !1346
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1347

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1348
  %cmp1 = icmp slt i32 %1, 0, !dbg !1351
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1352

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1353
  br label %return, !dbg !1353

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1355
  br label %return, !dbg !1355

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1357
  %cmp4 = icmp sge i32 %2, 0, !dbg !1360
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1361

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1362
  %cmp6 = icmp eq i32 %3, 0, !dbg !1365
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1366

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1367
  br label %return, !dbg !1367

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1369
  %cmp9 = icmp sle i32 %4, 0, !dbg !1372
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1373

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1374
  br label %return, !dbg !1374

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1376
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1378
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1379
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1380
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1380
  %div = sdiv i32 %6, %7, !dbg !1380, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1381
  %mul = mul nsw i32 %div, %8, !dbg !1382
  %sub = sub nsw i32 %5, %mul, !dbg !1383
  %shl = shl i32 %sub, 1, !dbg !1384
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1385
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1386
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1387
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1388
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1388
  %div12 = udiv i32 %9, %10, !dbg !1388, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1389
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1391
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1391
  %div13 = sdiv i32 %11, %12, !dbg !1391, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1392
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1393
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1394
  store i32 %13, i32* %retval, align 4, !dbg !1395
  br label %return, !dbg !1395

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1396
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1399
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1400

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1401
  br label %return, !dbg !1401

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1403
  %sub18 = sub nsw i32 0, %15, !dbg !1405
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1406
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %sub19 = sub nsw i32 0, %16, !dbg !1408
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1409
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1410
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1411
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1413
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1413
  %div20 = sdiv i32 %18, %19, !dbg !1413, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1414
  %mul21 = mul nsw i32 %div20, %20, !dbg !1415
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1416
  %shl23 = shl i32 %sub22, 1, !dbg !1417
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1418
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1419
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1421
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1421
  %div24 = udiv i32 %21, %22, !dbg !1421, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1424
  %div25 = sdiv i32 %23, %24, !dbg !1424, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1425
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1426
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1427
  store i32 %25, i32* %retval, align 4, !dbg !1428
  br label %return, !dbg !1428

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1429
  ret i32 %26, !dbg !1429
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1430 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1433, metadata !DIExpression()), !dbg !1434
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1435, metadata !DIExpression()), !dbg !1436
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1437, metadata !DIExpression()), !dbg !1438
  store i32 0, i32* %u32Temp1, align 4, !dbg !1438
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1439, metadata !DIExpression()), !dbg !1440
  store i32 0, i32* %u32Temp2, align 4, !dbg !1440
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1441, metadata !DIExpression()), !dbg !1442
  store i32 0, i32* %u32Temp3, align 4, !dbg !1442
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1443, metadata !DIExpression()), !dbg !1444
  store i32 0, i32* %numerator_old, align 4, !dbg !1444
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %cmp = icmp eq i32 %0, 0, !dbg !1447
  br i1 %cmp, label %if.then, label %if.else, !dbg !1448

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1449
  br label %return, !dbg !1449

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1451
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1453
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1454
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1455
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1456
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1456
  %div = udiv i32 %3, %4, !dbg !1456, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1457
  %sub = sub i32 %1, %mul, !dbg !1458
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1459
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1460
  %and = and i32 %5, 1, !dbg !1462
  %cmp1 = icmp eq i32 %and, 0, !dbg !1463
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1464

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %shr = lshr i32 %6, 1, !dbg !1467
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1468
  br label %if.end, !dbg !1469

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %shr4 = lshr i32 %7, 1, !dbg !1472
  %add = add i32 %shr4, 1, !dbg !1473
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1474
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1475
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1477
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1478
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1479

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1480
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1482
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1483
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1483
  %div7 = udiv i32 %10, %11, !dbg !1483, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1488
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1488
  %div9 = udiv i32 %12, %13, !dbg !1488, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1489
  store i32 %add10, i32* %retval, align 4, !dbg !1490
  br label %return, !dbg !1490

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1491
  ret i32 %14, !dbg !1491
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1492 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1497, metadata !DIExpression()), !dbg !1498
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1499, metadata !DIExpression()), !dbg !1500
  store i32 0, i32* %u32Temp1, align 4, !dbg !1500
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1501, metadata !DIExpression()), !dbg !1502
  store i32 0, i32* %u32Temp2, align 4, !dbg !1502
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %cmp = icmp sle i32 %0, 0, !dbg !1505
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1506

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1507
  %cmp1 = icmp sge i32 %1, 0, !dbg !1510
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1511

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1514
  %sub = sub nsw i32 0, %2, !dbg !1516
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1517
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1518
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1519
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1520
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1521
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1521
  %div = udiv i32 %4, %5, !dbg !1521, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %mul = mul i32 %div, %6, !dbg !1523
  %sub3 = sub i32 %3, %mul, !dbg !1524
  %shl = shl i32 %sub3, 1, !dbg !1525
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1526
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1527
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1529
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1529
  %div4 = udiv i32 %7, %8, !dbg !1529, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1532
  %div5 = udiv i32 %9, %10, !dbg !1532, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1533
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1534
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1535
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1537
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1538

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1539
  %sub8 = sub i32 0, %12, !dbg !1541
  store i32 %sub8, i32* %retval, align 4, !dbg !1542
  br label %return, !dbg !1542

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1543
  br label %return, !dbg !1543

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1545
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1547
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1549
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1549
  %div11 = udiv i32 %14, %15, !dbg !1549, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1550
  %mul12 = mul i32 %div11, %16, !dbg !1551
  %sub13 = sub i32 %13, %mul12, !dbg !1552
  %shl14 = shl i32 %sub13, 1, !dbg !1553
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1554
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1555
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1557
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1557
  %div15 = udiv i32 %17, %18, !dbg !1557, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1560
  %div16 = udiv i32 %19, %20, !dbg !1560, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1561
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1562
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1563
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1565
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1566

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1567
  store i32 %22, i32* %retval, align 4, !dbg !1569
  br label %return, !dbg !1569

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1570
  br label %return, !dbg !1570

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1572
  ret i32 %23, !dbg !1572
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1573 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1576, metadata !DIExpression()), !dbg !1577
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1578, metadata !DIExpression()), !dbg !1579
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1580, metadata !DIExpression()), !dbg !1581
  store i32 0, i32* %s32Temp1, align 4, !dbg !1581
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1582, metadata !DIExpression()), !dbg !1583
  store i32 0, i32* %s32Temp2, align 4, !dbg !1583
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 0, i32* %u32Temp0, align 4, !dbg !1585
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1586, metadata !DIExpression()), !dbg !1587
  store i32 0, i32* %u32Temp1, align 4, !dbg !1587
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1588, metadata !DIExpression()), !dbg !1589
  store i32 0, i32* %u32Temp2, align 4, !dbg !1589
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %cmp = icmp eq i32 %0, 0, !dbg !1592
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1593

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1594
  %cmp1 = icmp slt i32 %1, 0, !dbg !1597
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1598

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1599
  br label %return, !dbg !1599

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1601
  br label %return, !dbg !1601

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1603
  %cmp4 = icmp sle i32 %2, 0, !dbg !1606
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1607

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1608
  %sub = sub nsw i32 0, %3, !dbg !1610
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1611
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1612
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1613
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1614
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1614
  %div = udiv i32 %4, %5, !dbg !1614, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1615
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1616
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1617
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1618
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1619
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1619
  %div6 = udiv i32 %7, %8, !dbg !1619, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1620
  %mul = mul i32 %div6, %9, !dbg !1621
  %sub7 = sub i32 %6, %mul, !dbg !1622
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1623
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %and = and i32 %10, 1, !dbg !1626
  %cmp8 = icmp eq i32 %and, 0, !dbg !1627
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1628

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %shr = lshr i32 %11, 1, !dbg !1631
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1632
  br label %if.end, !dbg !1633

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1634
  %shr11 = lshr i32 %12, 1, !dbg !1636
  %add = add i32 %shr11, 1, !dbg !1637
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1638
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1639
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1641
  %cmp12 = icmp ult i32 %13, %14, !dbg !1642
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1643

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1644
  %neg = xor i32 %15, -1, !dbg !1646
  %add14 = add i32 %neg, 1, !dbg !1647
  store i32 %add14, i32* %retval, align 4, !dbg !1648
  br label %return, !dbg !1648

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1649
  %add16 = add i32 %16, 1, !dbg !1651
  %neg17 = xor i32 %add16, -1, !dbg !1652
  %add18 = add i32 %neg17, 1, !dbg !1653
  store i32 %add18, i32* %retval, align 4, !dbg !1654
  br label %return, !dbg !1654

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1655
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1657
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1658
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1659
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1659
  %div20 = udiv i32 %18, %19, !dbg !1659, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1660
  %mul21 = mul i32 %div20, %20, !dbg !1661
  %sub22 = sub i32 %17, %mul21, !dbg !1662
  %shl = shl i32 %sub22, 1, !dbg !1663
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1664
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1665
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1666
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1667
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1667
  %div23 = udiv i32 %21, %22, !dbg !1667, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1668
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1670
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1670
  %div24 = udiv i32 %23, %24, !dbg !1670, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1671
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1672
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1673
  store i32 %25, i32* %retval, align 4, !dbg !1674
  br label %return, !dbg !1674

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1675
  ret i32 %26, !dbg !1675
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1676 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1679, metadata !DIExpression()), !dbg !1680
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1681, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1683, metadata !DIExpression()), !dbg !1684
  store i32 0, i32* %s32Temp1, align 4, !dbg !1684
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1685, metadata !DIExpression()), !dbg !1686
  store i32 0, i32* %s32Temp2, align 4, !dbg !1686
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1687, metadata !DIExpression()), !dbg !1688
  store i32 0, i32* %denominator_prime, align 4, !dbg !1688
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1689, metadata !DIExpression()), !dbg !1690
  store i32 0, i32* %u32Temp1, align 4, !dbg !1690
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1691, metadata !DIExpression()), !dbg !1692
  store i32 0, i32* %u32Temp2, align 4, !dbg !1692
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1693, metadata !DIExpression()), !dbg !1694
  store i32 0, i32* %u32numerator, align 4, !dbg !1694
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1695, metadata !DIExpression()), !dbg !1696
  store i32 0, i32* %u32denominator, align 4, !dbg !1696
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1697
  %cmp = icmp slt i32 %0, 0, !dbg !1699
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1700

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %cmp1 = icmp sle i32 %1, 0, !dbg !1704
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1705

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1706
  %cmp3 = icmp sge i32 %2, 0, !dbg !1709
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1710

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1711
  br label %return, !dbg !1711

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1713
  %sub = sub nsw i32 0, %3, !dbg !1715
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1716
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %sub5 = sub nsw i32 0, %4, !dbg !1718
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1719
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1720
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1721
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1722
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1723
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1723
  %div = udiv i32 %6, %7, !dbg !1723, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1724
  %mul = mul i32 %div, %8, !dbg !1725
  %sub6 = sub i32 %5, %mul, !dbg !1726
  %shl = shl i32 %sub6, 1, !dbg !1727
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1728
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1729
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1730
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1731
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1731
  %div7 = udiv i32 %9, %10, !dbg !1731, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1732
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1734
  %div8 = udiv i32 %11, %12, !dbg !1734, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1735
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1736
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1737
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1739
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1740

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1741
  store i32 %14, i32* %retval, align 4, !dbg !1743
  br label %return, !dbg !1743

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1744
  br label %return, !dbg !1744

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1746
  %neg = xor i32 %15, -1, !dbg !1748
  %add13 = add nsw i32 %neg, 1, !dbg !1749
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1750
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1751
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1752
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1753
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1754
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1754
  %div14 = udiv i32 %17, %18, !dbg !1754, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1755
  %mul15 = mul i32 %div14, %19, !dbg !1756
  %sub16 = sub i32 %16, %mul15, !dbg !1757
  %shl17 = shl i32 %sub16, 1, !dbg !1758
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1759
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1760
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1761
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1762
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1762
  %div18 = udiv i32 %20, %21, !dbg !1762, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1763
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1765
  %div19 = sdiv i32 %22, %23, !dbg !1765, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1766
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1767
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1768
  %neg21 = xor i32 %24, -1, !dbg !1769
  %add22 = add nsw i32 %neg21, 1, !dbg !1770
  store i32 %add22, i32* %retval, align 4, !dbg !1771
  br label %return, !dbg !1771

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1772
  %cmp24 = icmp sle i32 %25, 0, !dbg !1775
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1776

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1777
  %cmp26 = icmp sge i32 %26, 0, !dbg !1780
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1781

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1782
  br label %return, !dbg !1782

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %neg29 = xor i32 %27, -1, !dbg !1786
  %add30 = add nsw i32 %neg29, 1, !dbg !1787
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1788
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1789
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1790
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1791
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1792
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1792
  %div31 = udiv i32 %29, %30, !dbg !1792, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1793
  %mul32 = mul i32 %div31, %31, !dbg !1794
  %sub33 = sub i32 %28, %mul32, !dbg !1795
  %shl34 = shl i32 %sub33, 1, !dbg !1796
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1797
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1798
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1799
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1800
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1800
  %div35 = udiv i32 %32, %33, !dbg !1800, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1801
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1803
  %div36 = udiv i32 %34, %35, !dbg !1803, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1804
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1805
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1806
  %neg38 = xor i32 %36, -1, !dbg !1807
  %add39 = add nsw i32 %neg38, 1, !dbg !1808
  store i32 %add39, i32* %retval, align 4, !dbg !1809
  br label %return, !dbg !1809

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1810
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1812
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1813
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1814
  %div41 = sdiv i32 %38, %39, !dbg !1814, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1815
  %mul42 = mul nsw i32 %div41, %40, !dbg !1816
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1817
  %shl44 = shl i32 %sub43, 1, !dbg !1818
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1819
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1820
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1822
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1822
  %div45 = sdiv i32 %41, %42, !dbg !1822, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1823
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1825
  %div46 = udiv i32 %43, %44, !dbg !1825, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1826
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1827
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1828
  store i32 %45, i32* %retval, align 4, !dbg !1829
  br label %return, !dbg !1829

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1830
  ret i32 %46, !dbg !1830
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1831 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1834, metadata !DIExpression()), !dbg !1835
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1836, metadata !DIExpression()), !dbg !1837
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1838, metadata !DIExpression()), !dbg !1839
  store i32 0, i32* %numerator_prime, align 4, !dbg !1839
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1840, metadata !DIExpression()), !dbg !1841
  store i32 0, i32* %u32Temp1, align 4, !dbg !1841
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1842, metadata !DIExpression()), !dbg !1843
  store i32 0, i32* %u32Temp2, align 4, !dbg !1843
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1844, metadata !DIExpression()), !dbg !1845
  store i32 0, i32* %u32Temp3, align 4, !dbg !1845
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1846, metadata !DIExpression()), !dbg !1847
  store i32 0, i32* %s32Temp1, align 4, !dbg !1847
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1848, metadata !DIExpression()), !dbg !1849
  store i32 0, i32* %s32Temp2, align 4, !dbg !1849
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1850, metadata !DIExpression()), !dbg !1851
  store i32 0, i32* %s32Temp3, align 4, !dbg !1851
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1852
  %cmp = icmp eq i32 %0, 0, !dbg !1854
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1855

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1856
  %cmp1 = icmp slt i32 %1, 0, !dbg !1859
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1860

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1861
  br label %return, !dbg !1861

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1863
  br label %return, !dbg !1863

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1865
  %cmp4 = icmp slt i32 %2, 0, !dbg !1868
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1869

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1870
  %sub = sub nsw i32 0, %3, !dbg !1872
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1873
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1874
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1875
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1876
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1876
  %div = udiv i32 %4, %5, !dbg !1876, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1877
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1878
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1879
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1880
  %mul = mul i32 %7, %8, !dbg !1881
  %sub6 = sub i32 %6, %mul, !dbg !1882
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1883
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1884
  %and = and i32 %9, 1, !dbg !1886
  %cmp7 = icmp eq i32 %and, 0, !dbg !1887
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1888

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1889
  %shr = lshr i32 %10, 1, !dbg !1891
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1892
  br label %if.end, !dbg !1893

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1894
  %shr10 = lshr i32 %11, 1, !dbg !1896
  %add = add i32 %shr10, 1, !dbg !1897
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1898
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1899
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1901
  %cmp11 = icmp ult i32 %12, %13, !dbg !1902
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1903

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1904
  %neg = xor i32 %14, -1, !dbg !1906
  %add13 = add i32 %neg, 1, !dbg !1907
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1908
  br label %if.end18, !dbg !1909

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1910
  %add15 = add i32 %15, 1, !dbg !1912
  %neg16 = xor i32 %add15, -1, !dbg !1913
  %add17 = add i32 %neg16, 1, !dbg !1914
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1915
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1916
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1918
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1919

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1920
  %conv = trunc i32 %17 to i16, !dbg !1922
  store i16 %conv, i16* %retval, align 2, !dbg !1923
  br label %return, !dbg !1923

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1924
  br label %return, !dbg !1924

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1926
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1928
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1929
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1929
  %div23 = udiv i32 %18, %19, !dbg !1929, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1930
  %mul24 = mul i32 %div23, %20, !dbg !1931
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1932
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1933
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1934
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1935
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1936
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1936
  %div25 = udiv i32 %22, %23, !dbg !1936, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1937
  %mul26 = mul i32 %div25, %24, !dbg !1938
  %sub27 = sub i32 %21, %mul26, !dbg !1939
  %shl = shl i32 %sub27, 1, !dbg !1940
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1941
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1942
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1943
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1944
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1944
  %div28 = udiv i32 %25, %26, !dbg !1944, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1945
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1947
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1947
  %div29 = udiv i32 %27, %28, !dbg !1947, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1948
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1949
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1950
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1952
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1953

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1954
  %conv34 = trunc i32 %30 to i16, !dbg !1956
  store i16 %conv34, i16* %retval, align 2, !dbg !1957
  br label %return, !dbg !1957

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1958
  br label %return, !dbg !1958

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1960
  ret i16 %31, !dbg !1960
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1961 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1967, metadata !DIExpression()), !dbg !1968
  %2 = icmp eq i64 %0, 0, !dbg !1969
  br i1 %2, label %3, label %4, !dbg !1971

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1972
  unreachable, !dbg !1972

4:                                                ; preds = %1
  ret void, !dbg !1973
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1974 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1980, metadata !DIExpression()), !dbg !1982
  call void @llvm.dbg.value(metadata i64 %1, metadata !1981, metadata !DIExpression()), !dbg !1982
  %3 = icmp ult i64 %1, %0, !dbg !1983
  br i1 %3, label %5, label %4, !dbg !1985

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1986
  unreachable, !dbg !1986

5:                                                ; preds = %2
  ret void, !dbg !1988
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120/div_Ccode_alarm_0120.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120")
!4 = !{}
!5 = !{!6, !13, !18, !21, !25, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !18)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0120")
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
!489 = !DILocation(line: 496, column: 53, scope: !490)
!490 = distinct !DILexicalBlock(scope: !491, file: !69, line: 496, column: 7)
!491 = distinct !DILexicalBlock(scope: !476, file: !69, line: 494, column: 2)
!492 = !DILocation(line: 496, column: 75, scope: !490)
!493 = !DILocation(line: 496, column: 90, scope: !490)
!494 = !DILocation(line: 496, column: 85, scope: !490)
!495 = !DILocation(line: 496, column: 83, scope: !490)
!496 = !DILocation(line: 496, column: 106, scope: !490)
!497 = !DILocation(line: 496, column: 101, scope: !490)
!498 = !DILocation(line: 496, column: 99, scope: !490)
!499 = !DILocation(line: 496, column: 61, scope: !490)
!500 = !DILocation(line: 496, column: 37, scope: !490)
!501 = !DILocation(line: 496, column: 9, scope: !490)
!502 = !DILocation(line: 496, column: 7, scope: !491)
!503 = !DILocation(line: 497, column: 7, scope: !504)
!504 = distinct !DILexicalBlock(scope: !490, file: !69, line: 496, column: 135)
!505 = !DILocation(line: 500, column: 50, scope: !506)
!506 = distinct !DILexicalBlock(scope: !491, file: !69, line: 500, column: 7)
!507 = !DILocation(line: 500, column: 65, scope: !506)
!508 = !DILocation(line: 500, column: 60, scope: !506)
!509 = !DILocation(line: 500, column: 58, scope: !506)
!510 = !DILocation(line: 500, column: 34, scope: !506)
!511 = !DILocation(line: 500, column: 91, scope: !506)
!512 = !DILocation(line: 500, column: 86, scope: !506)
!513 = !DILocation(line: 500, column: 76, scope: !506)
!514 = !DILocation(line: 500, column: 9, scope: !506)
!515 = !DILocation(line: 500, column: 7, scope: !491)
!516 = !DILocation(line: 501, column: 7, scope: !517)
!517 = distinct !DILexicalBlock(scope: !506, file: !69, line: 500, column: 103)
!518 = !DILocation(line: 504, column: 50, scope: !519)
!519 = distinct !DILexicalBlock(scope: !491, file: !69, line: 504, column: 7)
!520 = !DILocation(line: 504, column: 65, scope: !519)
!521 = !DILocation(line: 504, column: 60, scope: !519)
!522 = !DILocation(line: 504, column: 58, scope: !519)
!523 = !DILocation(line: 504, column: 34, scope: !519)
!524 = !DILocation(line: 504, column: 91, scope: !519)
!525 = !DILocation(line: 504, column: 86, scope: !519)
!526 = !DILocation(line: 504, column: 76, scope: !519)
!527 = !DILocation(line: 504, column: 9, scope: !519)
!528 = !DILocation(line: 504, column: 7, scope: !491)
!529 = !DILocation(line: 505, column: 7, scope: !530)
!530 = distinct !DILexicalBlock(scope: !519, file: !69, line: 504, column: 103)
!531 = !DILocation(line: 508, column: 63, scope: !532)
!532 = distinct !DILexicalBlock(scope: !491, file: !69, line: 508, column: 7)
!533 = !DILocation(line: 508, column: 85, scope: !532)
!534 = !DILocation(line: 508, column: 100, scope: !532)
!535 = !DILocation(line: 508, column: 95, scope: !532)
!536 = !DILocation(line: 508, column: 93, scope: !532)
!537 = !DILocation(line: 508, column: 116, scope: !532)
!538 = !DILocation(line: 508, column: 111, scope: !532)
!539 = !DILocation(line: 508, column: 109, scope: !532)
!540 = !DILocation(line: 508, column: 71, scope: !532)
!541 = !DILocation(line: 508, column: 47, scope: !532)
!542 = !DILocation(line: 508, column: 9, scope: !532)
!543 = !DILocation(line: 508, column: 7, scope: !491)
!544 = !DILocation(line: 509, column: 7, scope: !545)
!545 = distinct !DILexicalBlock(scope: !532, file: !69, line: 508, column: 130)
!546 = !DILocation(line: 516, column: 41, scope: !491)
!547 = !DILocation(line: 516, column: 63, scope: !491)
!548 = !DILocation(line: 516, column: 78, scope: !491)
!549 = !DILocation(line: 516, column: 73, scope: !491)
!550 = !DILocation(line: 516, column: 71, scope: !491)
!551 = !DILocation(line: 516, column: 94, scope: !491)
!552 = !DILocation(line: 516, column: 89, scope: !491)
!553 = !DILocation(line: 516, column: 87, scope: !491)
!554 = !DILocation(line: 516, column: 49, scope: !491)
!555 = !DILocation(line: 516, column: 104, scope: !491)
!556 = !DILocation(line: 516, column: 25, scope: !491)
!557 = !DILocation(line: 516, column: 23, scope: !491)
!558 = !DILocation(line: 517, column: 3, scope: !491)
!559 = !DILocation(line: 535, column: 1, scope: !463)
!560 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !561, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!561 = !DISubroutineType(types: !562)
!562 = !{!24, !18, !25}
!563 = !DILocalVariable(name: "left", arg: 1, scope: !560, file: !33, line: 90, type: !18)
!564 = !DILocation(line: 90, column: 41, scope: !560)
!565 = !DILocalVariable(name: "count", arg: 2, scope: !560, file: !33, line: 90, type: !25)
!566 = !DILocation(line: 90, column: 56, scope: !560)
!567 = !DILocation(line: 92, column: 9, scope: !568)
!568 = distinct !DILexicalBlock(scope: !560, file: !33, line: 92, column: 9)
!569 = !DILocation(line: 92, column: 15, scope: !568)
!570 = !DILocation(line: 92, column: 9, scope: !560)
!571 = !DILocation(line: 93, column: 9, scope: !572)
!572 = distinct !DILexicalBlock(scope: !568, file: !33, line: 92, column: 32)
!573 = !DILocation(line: 95, column: 12, scope: !560)
!574 = !DILocation(line: 95, column: 34, scope: !560)
!575 = !DILocation(line: 95, column: 31, scope: !560)
!576 = !DILocation(line: 95, column: 17, scope: !560)
!577 = !DILocation(line: 95, column: 41, scope: !560)
!578 = !DILocation(line: 95, column: 5, scope: !560)
!579 = !DILocation(line: 96, column: 1, scope: !560)
!580 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !581, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!581 = !DISubroutineType(types: !582)
!582 = !{!24, !18, !18}
!583 = !DILocalVariable(name: "left", arg: 1, scope: !580, file: !33, line: 78, type: !18)
!584 = !DILocation(line: 78, column: 38, scope: !580)
!585 = !DILocalVariable(name: "right", arg: 2, scope: !580, file: !33, line: 78, type: !18)
!586 = !DILocation(line: 78, column: 52, scope: !580)
!587 = !DILocation(line: 80, column: 12, scope: !580)
!588 = !DILocation(line: 80, column: 19, scope: !580)
!589 = !DILocation(line: 80, column: 17, scope: !580)
!590 = !DILocation(line: 80, column: 25, scope: !580)
!591 = !DILocation(line: 80, column: 5, scope: !580)
!592 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !581, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!593 = !DILocalVariable(name: "left", arg: 1, scope: !592, file: !33, line: 72, type: !18)
!594 = !DILocation(line: 72, column: 38, scope: !592)
!595 = !DILocalVariable(name: "right", arg: 2, scope: !592, file: !33, line: 72, type: !18)
!596 = !DILocation(line: 72, column: 52, scope: !592)
!597 = !DILocation(line: 74, column: 12, scope: !592)
!598 = !DILocation(line: 74, column: 19, scope: !592)
!599 = !DILocation(line: 74, column: 17, scope: !592)
!600 = !DILocation(line: 74, column: 25, scope: !592)
!601 = !DILocation(line: 74, column: 5, scope: !592)
!602 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !603, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!603 = !DISubroutineType(types: !604)
!604 = !{!24, !18}
!605 = !DILocalVariable(name: "left", arg: 1, scope: !602, file: !33, line: 84, type: !18)
!606 = !DILocation(line: 84, column: 51, scope: !602)
!607 = !DILocation(line: 86, column: 12, scope: !602)
!608 = !DILocation(line: 86, column: 17, scope: !602)
!609 = !DILocation(line: 86, column: 5, scope: !602)
!610 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 553, type: !611, scopeLine: 554, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!611 = !DISubroutineType(types: !612)
!612 = !{!28, !28, !28}
!613 = !DILocalVariable(name: "numerator", arg: 1, scope: !610, file: !69, line: 553, type: !28)
!614 = !DILocation(line: 553, column: 31, scope: !610)
!615 = !DILocalVariable(name: "denominator", arg: 2, scope: !610, file: !69, line: 553, type: !28)
!616 = !DILocation(line: 553, column: 46, scope: !610)
!617 = !DILocalVariable(name: "u32Temp", scope: !610, file: !69, line: 555, type: !428)
!618 = !DILocation(line: 555, column: 6, scope: !610)
!619 = !DILocation(line: 556, column: 5, scope: !620)
!620 = distinct !DILexicalBlock(scope: !610, file: !69, line: 556, column: 5)
!621 = !DILocation(line: 556, column: 17, scope: !620)
!622 = !DILocation(line: 556, column: 5, scope: !610)
!623 = !DILocation(line: 558, column: 3, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !69, line: 557, column: 2)
!625 = !DILocation(line: 562, column: 14, scope: !626)
!626 = distinct !DILexicalBlock(scope: !620, file: !69, line: 561, column: 2)
!627 = !DILocation(line: 562, column: 23, scope: !626)
!628 = !DILocation(line: 562, column: 32, scope: !626)
!629 = !DILocation(line: 562, column: 44, scope: !626)
!630 = !DILocation(line: 562, column: 29, scope: !626)
!631 = !DILocation(line: 562, column: 11, scope: !626)
!632 = !DILocation(line: 563, column: 13, scope: !626)
!633 = !DILocation(line: 563, column: 21, scope: !626)
!634 = !DILocation(line: 563, column: 20, scope: !626)
!635 = !DILocation(line: 563, column: 11, scope: !626)
!636 = !DILocation(line: 564, column: 6, scope: !637)
!637 = distinct !DILexicalBlock(scope: !626, file: !69, line: 564, column: 6)
!638 = !DILocation(line: 564, column: 14, scope: !637)
!639 = !DILocation(line: 564, column: 6, scope: !626)
!640 = !DILocation(line: 566, column: 11, scope: !641)
!641 = distinct !DILexicalBlock(scope: !637, file: !69, line: 565, column: 3)
!642 = !DILocation(line: 566, column: 19, scope: !641)
!643 = !DILocation(line: 566, column: 4, scope: !641)
!644 = !DILocation(line: 570, column: 4, scope: !645)
!645 = distinct !DILexicalBlock(scope: !637, file: !69, line: 569, column: 3)
!646 = !DILocation(line: 574, column: 1, scope: !610)
!647 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 591, type: !648, scopeLine: 592, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!648 = !DISubroutineType(types: !649)
!649 = !{!28, !428, !28}
!650 = !DILocalVariable(name: "x_value", arg: 1, scope: !647, file: !69, line: 591, type: !428)
!651 = !DILocation(line: 591, column: 25, scope: !647)
!652 = !DILocalVariable(name: "y_value", arg: 2, scope: !647, file: !69, line: 591, type: !28)
!653 = !DILocation(line: 591, column: 38, scope: !647)
!654 = !DILocalVariable(name: "u32Temp1", scope: !647, file: !69, line: 593, type: !428)
!655 = !DILocation(line: 593, column: 6, scope: !647)
!656 = !DILocalVariable(name: "u32Temp2", scope: !647, file: !69, line: 593, type: !428)
!657 = !DILocation(line: 593, column: 17, scope: !647)
!658 = !DILocation(line: 594, column: 12, scope: !647)
!659 = !DILocation(line: 594, column: 20, scope: !647)
!660 = !DILocation(line: 594, column: 10, scope: !647)
!661 = !DILocation(line: 595, column: 5, scope: !662)
!662 = distinct !DILexicalBlock(scope: !647, file: !69, line: 595, column: 5)
!663 = !DILocation(line: 595, column: 13, scope: !662)
!664 = !DILocation(line: 595, column: 5, scope: !647)
!665 = !DILocation(line: 597, column: 3, scope: !666)
!666 = distinct !DILexicalBlock(scope: !662, file: !69, line: 596, column: 2)
!667 = !DILocation(line: 601, column: 14, scope: !668)
!668 = distinct !DILexicalBlock(scope: !662, file: !69, line: 600, column: 2)
!669 = !DILocation(line: 601, column: 22, scope: !668)
!670 = !DILocation(line: 601, column: 21, scope: !668)
!671 = !DILocation(line: 601, column: 12, scope: !668)
!672 = !DILocation(line: 602, column: 14, scope: !668)
!673 = !DILocation(line: 602, column: 25, scope: !668)
!674 = !DILocation(line: 602, column: 36, scope: !668)
!675 = !DILocation(line: 602, column: 34, scope: !668)
!676 = !DILocation(line: 602, column: 22, scope: !668)
!677 = !DILocation(line: 602, column: 45, scope: !668)
!678 = !DILocation(line: 602, column: 12, scope: !668)
!679 = !DILocation(line: 603, column: 15, scope: !668)
!680 = !DILocation(line: 603, column: 24, scope: !668)
!681 = !DILocation(line: 603, column: 23, scope: !668)
!682 = !DILocation(line: 603, column: 36, scope: !668)
!683 = !DILocation(line: 603, column: 44, scope: !668)
!684 = !DILocation(line: 603, column: 43, scope: !668)
!685 = !DILocation(line: 603, column: 33, scope: !668)
!686 = !DILocation(line: 603, column: 12, scope: !668)
!687 = !DILocation(line: 604, column: 6, scope: !688)
!688 = distinct !DILexicalBlock(scope: !668, file: !69, line: 604, column: 6)
!689 = !DILocation(line: 604, column: 15, scope: !688)
!690 = !DILocation(line: 604, column: 6, scope: !668)
!691 = !DILocation(line: 606, column: 11, scope: !692)
!692 = distinct !DILexicalBlock(scope: !688, file: !69, line: 605, column: 3)
!693 = !DILocation(line: 606, column: 20, scope: !692)
!694 = !DILocation(line: 606, column: 4, scope: !692)
!695 = !DILocation(line: 610, column: 4, scope: !696)
!696 = distinct !DILexicalBlock(scope: !688, file: !69, line: 609, column: 3)
!697 = !DILocation(line: 614, column: 1, scope: !647)
!698 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 633, type: !699, scopeLine: 634, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!699 = !DISubroutineType(types: !700)
!700 = !{!6, !6, !28, !6}
!701 = !DILocalVariable(name: "factor1", arg: 1, scope: !698, file: !69, line: 633, type: !6)
!702 = !DILocation(line: 633, column: 33, scope: !698)
!703 = !DILocalVariable(name: "factor2", arg: 2, scope: !698, file: !69, line: 633, type: !28)
!704 = !DILocation(line: 633, column: 46, scope: !698)
!705 = !DILocalVariable(name: "denominator", arg: 3, scope: !698, file: !69, line: 633, type: !6)
!706 = !DILocation(line: 633, column: 59, scope: !698)
!707 = !DILocalVariable(name: "s32Result", scope: !698, file: !69, line: 635, type: !21)
!708 = !DILocation(line: 635, column: 6, scope: !698)
!709 = !DILocalVariable(name: "s32Temp1", scope: !698, file: !69, line: 635, type: !21)
!710 = !DILocation(line: 635, column: 21, scope: !698)
!711 = !DILocation(line: 636, column: 14, scope: !698)
!712 = !DILocation(line: 636, column: 24, scope: !698)
!713 = !DILocation(line: 636, column: 22, scope: !698)
!714 = !DILocation(line: 636, column: 12, scope: !698)
!715 = !DILocation(line: 637, column: 5, scope: !716)
!716 = distinct !DILexicalBlock(scope: !698, file: !69, line: 637, column: 5)
!717 = !DILocation(line: 637, column: 17, scope: !716)
!718 = !DILocation(line: 637, column: 5, scope: !698)
!719 = !DILocation(line: 639, column: 6, scope: !720)
!720 = distinct !DILexicalBlock(scope: !721, file: !69, line: 639, column: 6)
!721 = distinct !DILexicalBlock(scope: !716, file: !69, line: 638, column: 2)
!722 = !DILocation(line: 639, column: 16, scope: !720)
!723 = !DILocation(line: 639, column: 6, scope: !721)
!724 = !DILocation(line: 641, column: 4, scope: !725)
!725 = distinct !DILexicalBlock(scope: !720, file: !69, line: 640, column: 3)
!726 = !DILocation(line: 645, column: 4, scope: !727)
!727 = distinct !DILexicalBlock(scope: !720, file: !69, line: 644, column: 3)
!728 = !DILocation(line: 650, column: 14, scope: !729)
!729 = distinct !DILexicalBlock(scope: !716, file: !69, line: 649, column: 2)
!730 = !DILocation(line: 650, column: 27, scope: !729)
!731 = !DILocation(line: 650, column: 37, scope: !729)
!732 = !DILocation(line: 650, column: 36, scope: !729)
!733 = !DILocation(line: 650, column: 50, scope: !729)
!734 = !DILocation(line: 650, column: 49, scope: !729)
!735 = !DILocation(line: 650, column: 24, scope: !729)
!736 = !DILocation(line: 650, column: 12, scope: !729)
!737 = !DILocation(line: 651, column: 14, scope: !729)
!738 = !DILocation(line: 651, column: 23, scope: !729)
!739 = !DILocation(line: 651, column: 12, scope: !729)
!740 = !DILocation(line: 652, column: 16, scope: !729)
!741 = !DILocation(line: 652, column: 25, scope: !729)
!742 = !DILocation(line: 652, column: 24, scope: !729)
!743 = !DILocation(line: 652, column: 41, scope: !729)
!744 = !DILocation(line: 652, column: 51, scope: !729)
!745 = !DILocation(line: 652, column: 50, scope: !729)
!746 = !DILocation(line: 652, column: 38, scope: !729)
!747 = !DILocation(line: 652, column: 13, scope: !729)
!748 = !DILocation(line: 653, column: 6, scope: !749)
!749 = distinct !DILexicalBlock(scope: !729, file: !69, line: 653, column: 6)
!750 = !DILocation(line: 653, column: 16, scope: !749)
!751 = !DILocation(line: 653, column: 6, scope: !729)
!752 = !DILocation(line: 655, column: 7, scope: !753)
!753 = distinct !DILexicalBlock(scope: !754, file: !69, line: 655, column: 7)
!754 = distinct !DILexicalBlock(scope: !749, file: !69, line: 654, column: 3)
!755 = !DILocation(line: 655, column: 17, scope: !753)
!756 = !DILocation(line: 655, column: 7, scope: !754)
!757 = !DILocation(line: 657, column: 17, scope: !758)
!758 = distinct !DILexicalBlock(scope: !753, file: !69, line: 656, column: 4)
!759 = !DILocation(line: 657, column: 12, scope: !758)
!760 = !DILocation(line: 657, column: 5, scope: !758)
!761 = !DILocation(line: 662, column: 5, scope: !762)
!762 = distinct !DILexicalBlock(scope: !753, file: !69, line: 661, column: 4)
!763 = !DILocation(line: 667, column: 4, scope: !764)
!764 = distinct !DILexicalBlock(scope: !749, file: !69, line: 666, column: 3)
!765 = !DILocation(line: 671, column: 1, scope: !698)
!766 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 689, type: !767, scopeLine: 690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!767 = !DISubroutineType(types: !768)
!768 = !{!6, !28, !6, !28}
!769 = !DILocalVariable(name: "factor1", arg: 1, scope: !766, file: !69, line: 689, type: !28)
!770 = !DILocation(line: 689, column: 33, scope: !766)
!771 = !DILocalVariable(name: "factor2", arg: 2, scope: !766, file: !69, line: 689, type: !6)
!772 = !DILocation(line: 689, column: 46, scope: !766)
!773 = !DILocalVariable(name: "denominator", arg: 3, scope: !766, file: !69, line: 689, type: !28)
!774 = !DILocation(line: 689, column: 59, scope: !766)
!775 = !DILocalVariable(name: "s32Result", scope: !766, file: !69, line: 691, type: !21)
!776 = !DILocation(line: 691, column: 6, scope: !766)
!777 = !DILocalVariable(name: "s32Temp1", scope: !766, file: !69, line: 691, type: !21)
!778 = !DILocation(line: 691, column: 21, scope: !766)
!779 = !DILocation(line: 692, column: 14, scope: !766)
!780 = !DILocation(line: 692, column: 24, scope: !766)
!781 = !DILocation(line: 692, column: 22, scope: !766)
!782 = !DILocation(line: 692, column: 12, scope: !766)
!783 = !DILocation(line: 693, column: 5, scope: !784)
!784 = distinct !DILexicalBlock(scope: !766, file: !69, line: 693, column: 5)
!785 = !DILocation(line: 693, column: 16, scope: !784)
!786 = !DILocation(line: 693, column: 5, scope: !766)
!787 = !DILocation(line: 695, column: 6, scope: !788)
!788 = distinct !DILexicalBlock(scope: !789, file: !69, line: 695, column: 6)
!789 = distinct !DILexicalBlock(scope: !784, file: !69, line: 694, column: 2)
!790 = !DILocation(line: 695, column: 16, scope: !788)
!791 = !DILocation(line: 695, column: 6, scope: !789)
!792 = !DILocation(line: 697, column: 4, scope: !793)
!793 = distinct !DILexicalBlock(scope: !788, file: !69, line: 696, column: 3)
!794 = !DILocation(line: 701, column: 4, scope: !795)
!795 = distinct !DILexicalBlock(scope: !788, file: !69, line: 700, column: 3)
!796 = !DILocation(line: 706, column: 14, scope: !797)
!797 = distinct !DILexicalBlock(scope: !784, file: !69, line: 705, column: 2)
!798 = !DILocation(line: 706, column: 28, scope: !797)
!799 = !DILocation(line: 706, column: 38, scope: !797)
!800 = !DILocation(line: 706, column: 37, scope: !797)
!801 = !DILocation(line: 706, column: 53, scope: !797)
!802 = !DILocation(line: 706, column: 51, scope: !797)
!803 = !DILocation(line: 706, column: 24, scope: !797)
!804 = !DILocation(line: 706, column: 66, scope: !797)
!805 = !DILocation(line: 706, column: 12, scope: !797)
!806 = !DILocation(line: 707, column: 16, scope: !797)
!807 = !DILocation(line: 707, column: 25, scope: !797)
!808 = !DILocation(line: 707, column: 24, scope: !797)
!809 = !DILocation(line: 707, column: 41, scope: !797)
!810 = !DILocation(line: 707, column: 51, scope: !797)
!811 = !DILocation(line: 707, column: 50, scope: !797)
!812 = !DILocation(line: 707, column: 38, scope: !797)
!813 = !DILocation(line: 707, column: 13, scope: !797)
!814 = !DILocation(line: 708, column: 6, scope: !815)
!815 = distinct !DILexicalBlock(scope: !797, file: !69, line: 708, column: 6)
!816 = !DILocation(line: 708, column: 16, scope: !815)
!817 = !DILocation(line: 708, column: 6, scope: !797)
!818 = !DILocation(line: 710, column: 7, scope: !819)
!819 = distinct !DILexicalBlock(scope: !820, file: !69, line: 710, column: 7)
!820 = distinct !DILexicalBlock(scope: !815, file: !69, line: 709, column: 3)
!821 = !DILocation(line: 710, column: 17, scope: !819)
!822 = !DILocation(line: 710, column: 7, scope: !820)
!823 = !DILocation(line: 712, column: 17, scope: !824)
!824 = distinct !DILexicalBlock(scope: !819, file: !69, line: 711, column: 4)
!825 = !DILocation(line: 712, column: 12, scope: !824)
!826 = !DILocation(line: 712, column: 5, scope: !824)
!827 = !DILocation(line: 716, column: 5, scope: !828)
!828 = distinct !DILexicalBlock(scope: !819, file: !69, line: 715, column: 4)
!829 = !DILocation(line: 721, column: 4, scope: !830)
!830 = distinct !DILexicalBlock(scope: !815, file: !69, line: 720, column: 3)
!831 = !DILocation(line: 724, column: 1, scope: !766)
!832 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 743, type: !833, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!833 = !DISubroutineType(types: !834)
!834 = !{!28, !6, !28, !6}
!835 = !DILocalVariable(name: "factor1", arg: 1, scope: !832, file: !69, line: 743, type: !6)
!836 = !DILocation(line: 743, column: 33, scope: !832)
!837 = !DILocalVariable(name: "factor2", arg: 2, scope: !832, file: !69, line: 743, type: !28)
!838 = !DILocation(line: 743, column: 46, scope: !832)
!839 = !DILocalVariable(name: "denominator", arg: 3, scope: !832, file: !69, line: 743, type: !6)
!840 = !DILocation(line: 743, column: 59, scope: !832)
!841 = !DILocalVariable(name: "u32Result", scope: !832, file: !69, line: 745, type: !428)
!842 = !DILocation(line: 745, column: 6, scope: !832)
!843 = !DILocalVariable(name: "u32Temp1", scope: !832, file: !69, line: 745, type: !428)
!844 = !DILocation(line: 745, column: 21, scope: !832)
!845 = !DILocalVariable(name: "s32Result", scope: !832, file: !69, line: 746, type: !21)
!846 = !DILocation(line: 746, column: 6, scope: !832)
!847 = !DILocalVariable(name: "s32Temp1", scope: !832, file: !69, line: 746, type: !21)
!848 = !DILocation(line: 746, column: 21, scope: !832)
!849 = !DILocation(line: 747, column: 14, scope: !832)
!850 = !DILocation(line: 747, column: 24, scope: !832)
!851 = !DILocation(line: 747, column: 22, scope: !832)
!852 = !DILocation(line: 747, column: 12, scope: !832)
!853 = !DILocation(line: 749, column: 5, scope: !854)
!854 = distinct !DILexicalBlock(scope: !832, file: !69, line: 749, column: 5)
!855 = !DILocation(line: 749, column: 17, scope: !854)
!856 = !DILocation(line: 749, column: 5, scope: !832)
!857 = !DILocation(line: 751, column: 6, scope: !858)
!858 = distinct !DILexicalBlock(scope: !859, file: !69, line: 751, column: 6)
!859 = distinct !DILexicalBlock(scope: !854, file: !69, line: 750, column: 2)
!860 = !DILocation(line: 751, column: 16, scope: !858)
!861 = !DILocation(line: 751, column: 6, scope: !859)
!862 = !DILocation(line: 753, column: 4, scope: !863)
!863 = distinct !DILexicalBlock(scope: !858, file: !69, line: 752, column: 3)
!864 = !DILocation(line: 757, column: 4, scope: !865)
!865 = distinct !DILexicalBlock(scope: !858, file: !69, line: 756, column: 3)
!866 = !DILocation(line: 762, column: 15, scope: !867)
!867 = distinct !DILexicalBlock(scope: !854, file: !69, line: 761, column: 2)
!868 = !DILocation(line: 762, column: 29, scope: !867)
!869 = !DILocation(line: 762, column: 39, scope: !867)
!870 = !DILocation(line: 762, column: 38, scope: !867)
!871 = !DILocation(line: 762, column: 54, scope: !867)
!872 = !DILocation(line: 762, column: 52, scope: !867)
!873 = !DILocation(line: 762, column: 25, scope: !867)
!874 = !DILocation(line: 762, column: 68, scope: !867)
!875 = !DILocation(line: 762, column: 12, scope: !867)
!876 = !DILocation(line: 763, column: 16, scope: !867)
!877 = !DILocation(line: 763, column: 25, scope: !867)
!878 = !DILocation(line: 763, column: 24, scope: !867)
!879 = !DILocation(line: 763, column: 41, scope: !867)
!880 = !DILocation(line: 763, column: 51, scope: !867)
!881 = !DILocation(line: 763, column: 50, scope: !867)
!882 = !DILocation(line: 763, column: 38, scope: !867)
!883 = !DILocation(line: 763, column: 13, scope: !867)
!884 = !DILocation(line: 764, column: 6, scope: !885)
!885 = distinct !DILexicalBlock(scope: !867, file: !69, line: 764, column: 6)
!886 = !DILocation(line: 764, column: 16, scope: !885)
!887 = !DILocation(line: 764, column: 6, scope: !867)
!888 = !DILocation(line: 766, column: 7, scope: !889)
!889 = distinct !DILexicalBlock(scope: !890, file: !69, line: 766, column: 7)
!890 = distinct !DILexicalBlock(scope: !885, file: !69, line: 765, column: 3)
!891 = !DILocation(line: 766, column: 17, scope: !889)
!892 = !DILocation(line: 766, column: 7, scope: !890)
!893 = !DILocation(line: 768, column: 17, scope: !894)
!894 = distinct !DILexicalBlock(scope: !889, file: !69, line: 767, column: 4)
!895 = !DILocation(line: 768, column: 12, scope: !894)
!896 = !DILocation(line: 768, column: 5, scope: !894)
!897 = !DILocation(line: 772, column: 5, scope: !898)
!898 = distinct !DILexicalBlock(scope: !889, file: !69, line: 771, column: 4)
!899 = !DILocation(line: 777, column: 4, scope: !900)
!900 = distinct !DILexicalBlock(scope: !885, file: !69, line: 776, column: 3)
!901 = !DILocation(line: 780, column: 1, scope: !832)
!902 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 799, type: !903, scopeLine: 800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!903 = !DISubroutineType(types: !904)
!904 = !{!28, !6, !28, !28}
!905 = !DILocalVariable(name: "factor1", arg: 1, scope: !902, file: !69, line: 799, type: !6)
!906 = !DILocation(line: 799, column: 33, scope: !902)
!907 = !DILocalVariable(name: "factor2", arg: 2, scope: !902, file: !69, line: 799, type: !28)
!908 = !DILocation(line: 799, column: 46, scope: !902)
!909 = !DILocalVariable(name: "denominator", arg: 3, scope: !902, file: !69, line: 799, type: !28)
!910 = !DILocation(line: 799, column: 59, scope: !902)
!911 = !DILocalVariable(name: "s32Result", scope: !902, file: !69, line: 801, type: !21)
!912 = !DILocation(line: 801, column: 6, scope: !902)
!913 = !DILocalVariable(name: "s32Temp1", scope: !902, file: !69, line: 801, type: !21)
!914 = !DILocation(line: 801, column: 21, scope: !902)
!915 = !DILocation(line: 802, column: 14, scope: !902)
!916 = !DILocation(line: 802, column: 24, scope: !902)
!917 = !DILocation(line: 802, column: 22, scope: !902)
!918 = !DILocation(line: 802, column: 12, scope: !902)
!919 = !DILocation(line: 804, column: 5, scope: !920)
!920 = distinct !DILexicalBlock(scope: !902, file: !69, line: 804, column: 5)
!921 = !DILocation(line: 804, column: 17, scope: !920)
!922 = !DILocation(line: 804, column: 5, scope: !902)
!923 = !DILocation(line: 806, column: 6, scope: !924)
!924 = distinct !DILexicalBlock(scope: !925, file: !69, line: 806, column: 6)
!925 = distinct !DILexicalBlock(scope: !920, file: !69, line: 805, column: 2)
!926 = !DILocation(line: 806, column: 16, scope: !924)
!927 = !DILocation(line: 806, column: 6, scope: !925)
!928 = !DILocation(line: 808, column: 4, scope: !929)
!929 = distinct !DILexicalBlock(scope: !924, file: !69, line: 807, column: 3)
!930 = !DILocation(line: 812, column: 4, scope: !931)
!931 = distinct !DILexicalBlock(scope: !924, file: !69, line: 811, column: 3)
!932 = !DILocation(line: 817, column: 15, scope: !933)
!933 = distinct !DILexicalBlock(scope: !920, file: !69, line: 816, column: 2)
!934 = !DILocation(line: 817, column: 29, scope: !933)
!935 = !DILocation(line: 817, column: 39, scope: !933)
!936 = !DILocation(line: 817, column: 38, scope: !933)
!937 = !DILocation(line: 817, column: 54, scope: !933)
!938 = !DILocation(line: 817, column: 52, scope: !933)
!939 = !DILocation(line: 817, column: 25, scope: !933)
!940 = !DILocation(line: 817, column: 68, scope: !933)
!941 = !DILocation(line: 817, column: 12, scope: !933)
!942 = !DILocation(line: 818, column: 16, scope: !933)
!943 = !DILocation(line: 818, column: 25, scope: !933)
!944 = !DILocation(line: 818, column: 24, scope: !933)
!945 = !DILocation(line: 818, column: 41, scope: !933)
!946 = !DILocation(line: 818, column: 51, scope: !933)
!947 = !DILocation(line: 818, column: 50, scope: !933)
!948 = !DILocation(line: 818, column: 38, scope: !933)
!949 = !DILocation(line: 818, column: 13, scope: !933)
!950 = !DILocation(line: 819, column: 6, scope: !951)
!951 = distinct !DILexicalBlock(scope: !933, file: !69, line: 819, column: 6)
!952 = !DILocation(line: 819, column: 16, scope: !951)
!953 = !DILocation(line: 819, column: 6, scope: !933)
!954 = !DILocation(line: 821, column: 7, scope: !955)
!955 = distinct !DILexicalBlock(scope: !956, file: !69, line: 821, column: 7)
!956 = distinct !DILexicalBlock(scope: !951, file: !69, line: 820, column: 3)
!957 = !DILocation(line: 821, column: 17, scope: !955)
!958 = !DILocation(line: 821, column: 7, scope: !956)
!959 = !DILocation(line: 823, column: 17, scope: !960)
!960 = distinct !DILexicalBlock(scope: !955, file: !69, line: 822, column: 4)
!961 = !DILocation(line: 823, column: 12, scope: !960)
!962 = !DILocation(line: 823, column: 5, scope: !960)
!963 = !DILocation(line: 827, column: 5, scope: !964)
!964 = distinct !DILexicalBlock(scope: !955, file: !69, line: 826, column: 4)
!965 = !DILocation(line: 832, column: 4, scope: !966)
!966 = distinct !DILexicalBlock(scope: !951, file: !69, line: 831, column: 3)
!967 = !DILocation(line: 836, column: 1, scope: !902)
!968 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 854, type: !969, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!969 = !DISubroutineType(types: !970)
!970 = !{!28, !28, !28, !28}
!971 = !DILocalVariable(name: "factor1", arg: 1, scope: !968, file: !69, line: 854, type: !28)
!972 = !DILocation(line: 854, column: 33, scope: !968)
!973 = !DILocalVariable(name: "factor2", arg: 2, scope: !968, file: !69, line: 854, type: !28)
!974 = !DILocation(line: 854, column: 46, scope: !968)
!975 = !DILocalVariable(name: "denominator", arg: 3, scope: !968, file: !69, line: 854, type: !28)
!976 = !DILocation(line: 854, column: 59, scope: !968)
!977 = !DILocalVariable(name: "u32Temp1", scope: !968, file: !69, line: 856, type: !428)
!978 = !DILocation(line: 856, column: 6, scope: !968)
!979 = !DILocalVariable(name: "u16TempDenom", scope: !968, file: !69, line: 857, type: !28)
!980 = !DILocation(line: 857, column: 6, scope: !968)
!981 = !DILocation(line: 859, column: 5, scope: !982)
!982 = distinct !DILexicalBlock(scope: !968, file: !69, line: 859, column: 5)
!983 = !DILocation(line: 859, column: 17, scope: !982)
!984 = !DILocation(line: 859, column: 5, scope: !968)
!985 = !DILocation(line: 861, column: 3, scope: !986)
!986 = distinct !DILexicalBlock(scope: !982, file: !69, line: 860, column: 2)
!987 = !DILocation(line: 865, column: 14, scope: !988)
!988 = distinct !DILexicalBlock(scope: !982, file: !69, line: 864, column: 2)
!989 = !DILocation(line: 865, column: 24, scope: !988)
!990 = !DILocation(line: 865, column: 22, scope: !988)
!991 = !DILocation(line: 865, column: 12, scope: !988)
!992 = !DILocation(line: 866, column: 18, scope: !988)
!993 = !DILocation(line: 866, column: 30, scope: !988)
!994 = !DILocation(line: 866, column: 16, scope: !988)
!995 = !DILocation(line: 867, column: 14, scope: !988)
!996 = !DILocation(line: 867, column: 25, scope: !988)
!997 = !DILocation(line: 867, column: 23, scope: !988)
!998 = !DILocation(line: 867, column: 12, scope: !988)
!999 = !DILocation(line: 868, column: 14, scope: !988)
!1000 = !DILocation(line: 868, column: 25, scope: !988)
!1001 = !DILocation(line: 868, column: 23, scope: !988)
!1002 = !DILocation(line: 868, column: 12, scope: !988)
!1003 = !DILocation(line: 869, column: 6, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !988, file: !69, line: 869, column: 6)
!1005 = !DILocation(line: 869, column: 15, scope: !1004)
!1006 = !DILocation(line: 869, column: 6, scope: !988)
!1007 = !DILocation(line: 871, column: 12, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1004, file: !69, line: 870, column: 3)
!1009 = !DILocation(line: 871, column: 21, scope: !1008)
!1010 = !DILocation(line: 871, column: 11, scope: !1008)
!1011 = !DILocation(line: 871, column: 4, scope: !1008)
!1012 = !DILocation(line: 876, column: 4, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1004, file: !69, line: 875, column: 3)
!1014 = !DILocation(line: 881, column: 1, scope: !968)
!1015 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 898, type: !1016, scopeLine: 899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!28, !28, !28, !428}
!1018 = !DILocalVariable(name: "factor1", arg: 1, scope: !1015, file: !69, line: 898, type: !28)
!1019 = !DILocation(line: 898, column: 33, scope: !1015)
!1020 = !DILocalVariable(name: "factor2", arg: 2, scope: !1015, file: !69, line: 898, type: !28)
!1021 = !DILocation(line: 898, column: 46, scope: !1015)
!1022 = !DILocalVariable(name: "denominator", arg: 3, scope: !1015, file: !69, line: 898, type: !428)
!1023 = !DILocation(line: 898, column: 59, scope: !1015)
!1024 = !DILocalVariable(name: "u32Temp1", scope: !1015, file: !69, line: 900, type: !428)
!1025 = !DILocation(line: 900, column: 6, scope: !1015)
!1026 = !DILocation(line: 901, column: 5, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 901, column: 5)
!1028 = !DILocation(line: 901, column: 17, scope: !1027)
!1029 = !DILocation(line: 901, column: 5, scope: !1015)
!1030 = !DILocation(line: 903, column: 3, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1027, file: !69, line: 902, column: 2)
!1032 = !DILocation(line: 907, column: 15, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1027, file: !69, line: 906, column: 2)
!1034 = !DILocation(line: 907, column: 25, scope: !1033)
!1035 = !DILocation(line: 907, column: 23, scope: !1033)
!1036 = !DILocation(line: 907, column: 36, scope: !1033)
!1037 = !DILocation(line: 907, column: 34, scope: !1033)
!1038 = !DILocation(line: 907, column: 12, scope: !1033)
!1039 = !DILocation(line: 908, column: 8, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1033, file: !69, line: 908, column: 6)
!1041 = !DILocation(line: 908, column: 18, scope: !1040)
!1042 = !DILocation(line: 908, column: 16, scope: !1040)
!1043 = !DILocation(line: 908, column: 28, scope: !1040)
!1044 = !DILocation(line: 908, column: 40, scope: !1040)
!1045 = !DILocation(line: 908, column: 39, scope: !1040)
!1046 = !DILocation(line: 908, column: 26, scope: !1040)
!1047 = !DILocation(line: 908, column: 53, scope: !1040)
!1048 = !DILocation(line: 908, column: 64, scope: !1040)
!1049 = !DILocation(line: 908, column: 50, scope: !1040)
!1050 = !DILocation(line: 908, column: 6, scope: !1033)
!1051 = !DILocation(line: 910, column: 12, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1040, file: !69, line: 909, column: 3)
!1053 = !DILocation(line: 911, column: 3, scope: !1052)
!1054 = !DILocation(line: 912, column: 6, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1033, file: !69, line: 912, column: 6)
!1056 = !DILocation(line: 912, column: 15, scope: !1055)
!1057 = !DILocation(line: 912, column: 6, scope: !1033)
!1058 = !DILocation(line: 914, column: 12, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1055, file: !69, line: 913, column: 3)
!1060 = !DILocation(line: 914, column: 21, scope: !1059)
!1061 = !DILocation(line: 914, column: 11, scope: !1059)
!1062 = !DILocation(line: 914, column: 4, scope: !1059)
!1063 = !DILocation(line: 918, column: 4, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1055, file: !69, line: 917, column: 3)
!1065 = !DILocation(line: 921, column: 1, scope: !1015)
!1066 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 938, type: !1067, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!428, !428, !28}
!1069 = !DILocalVariable(name: "x_value", arg: 1, scope: !1066, file: !69, line: 938, type: !428)
!1070 = !DILocation(line: 938, column: 25, scope: !1066)
!1071 = !DILocalVariable(name: "y_value", arg: 2, scope: !1066, file: !69, line: 938, type: !28)
!1072 = !DILocation(line: 938, column: 38, scope: !1066)
!1073 = !DILocalVariable(name: "u32Temp1", scope: !1066, file: !69, line: 940, type: !428)
!1074 = !DILocation(line: 940, column: 6, scope: !1066)
!1075 = !DILocation(line: 941, column: 5, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 941, column: 5)
!1077 = !DILocation(line: 941, column: 13, scope: !1076)
!1078 = !DILocation(line: 941, column: 5, scope: !1066)
!1079 = !DILocation(line: 943, column: 3, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1076, file: !69, line: 942, column: 2)
!1081 = !DILocation(line: 947, column: 15, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1076, file: !69, line: 946, column: 2)
!1083 = !DILocation(line: 947, column: 26, scope: !1082)
!1084 = !DILocation(line: 947, column: 34, scope: !1082)
!1085 = !DILocation(line: 947, column: 33, scope: !1082)
!1086 = !DILocation(line: 947, column: 45, scope: !1082)
!1087 = !DILocation(line: 947, column: 43, scope: !1082)
!1088 = !DILocation(line: 947, column: 23, scope: !1082)
!1089 = !DILocation(line: 947, column: 54, scope: !1082)
!1090 = !DILocation(line: 947, column: 12, scope: !1082)
!1091 = !DILocation(line: 948, column: 15, scope: !1082)
!1092 = !DILocation(line: 948, column: 23, scope: !1082)
!1093 = !DILocation(line: 948, column: 22, scope: !1082)
!1094 = !DILocation(line: 948, column: 35, scope: !1082)
!1095 = !DILocation(line: 948, column: 44, scope: !1082)
!1096 = !DILocation(line: 948, column: 43, scope: !1082)
!1097 = !DILocation(line: 948, column: 32, scope: !1082)
!1098 = !DILocation(line: 948, column: 12, scope: !1082)
!1099 = !DILocation(line: 949, column: 10, scope: !1082)
!1100 = !DILocation(line: 949, column: 3, scope: !1082)
!1101 = !DILocation(line: 951, column: 1, scope: !1066)
!1102 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 969, type: !1103, scopeLine: 970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!6, !6, !6, !6}
!1105 = !DILocalVariable(name: "fak1", arg: 1, scope: !1102, file: !69, line: 969, type: !6)
!1106 = !DILocation(line: 969, column: 33, scope: !1102)
!1107 = !DILocalVariable(name: "fak2", arg: 2, scope: !1102, file: !69, line: 969, type: !6)
!1108 = !DILocation(line: 969, column: 43, scope: !1102)
!1109 = !DILocalVariable(name: "div", arg: 3, scope: !1102, file: !69, line: 969, type: !6)
!1110 = !DILocation(line: 969, column: 53, scope: !1102)
!1111 = !DILocalVariable(name: "s32Temp1", scope: !1102, file: !69, line: 971, type: !21)
!1112 = !DILocation(line: 971, column: 6, scope: !1102)
!1113 = !DILocalVariable(name: "s32Temp2", scope: !1102, file: !69, line: 971, type: !21)
!1114 = !DILocation(line: 971, column: 20, scope: !1102)
!1115 = !DILocalVariable(name: "s32Temp3", scope: !1102, file: !69, line: 971, type: !21)
!1116 = !DILocation(line: 971, column: 34, scope: !1102)
!1117 = !DILocation(line: 972, column: 13, scope: !1102)
!1118 = !DILocation(line: 972, column: 20, scope: !1102)
!1119 = !DILocation(line: 972, column: 18, scope: !1102)
!1120 = !DILocation(line: 972, column: 11, scope: !1102)
!1121 = !DILocation(line: 973, column: 5, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1102, file: !69, line: 973, column: 5)
!1123 = !DILocation(line: 973, column: 9, scope: !1122)
!1124 = !DILocation(line: 973, column: 5, scope: !1102)
!1125 = !DILocation(line: 975, column: 6, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1127, file: !69, line: 975, column: 6)
!1127 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 974, column: 2)
!1128 = !DILocation(line: 975, column: 15, scope: !1126)
!1129 = !DILocation(line: 975, column: 6, scope: !1127)
!1130 = !DILocation(line: 977, column: 4, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1126, file: !69, line: 976, column: 3)
!1132 = !DILocation(line: 981, column: 4, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1126, file: !69, line: 980, column: 3)
!1134 = !DILocation(line: 986, column: 15, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 985, column: 2)
!1136 = !DILocation(line: 986, column: 28, scope: !1135)
!1137 = !DILocation(line: 986, column: 39, scope: !1135)
!1138 = !DILocation(line: 986, column: 37, scope: !1135)
!1139 = !DILocation(line: 986, column: 46, scope: !1135)
!1140 = !DILocation(line: 986, column: 44, scope: !1135)
!1141 = !DILocation(line: 986, column: 24, scope: !1135)
!1142 = !DILocation(line: 986, column: 52, scope: !1135)
!1143 = !DILocation(line: 986, column: 12, scope: !1135)
!1144 = !DILocation(line: 987, column: 15, scope: !1135)
!1145 = !DILocation(line: 987, column: 24, scope: !1135)
!1146 = !DILocation(line: 987, column: 23, scope: !1135)
!1147 = !DILocation(line: 987, column: 32, scope: !1135)
!1148 = !DILocation(line: 987, column: 41, scope: !1135)
!1149 = !DILocation(line: 987, column: 40, scope: !1135)
!1150 = !DILocation(line: 987, column: 29, scope: !1135)
!1151 = !DILocation(line: 987, column: 12, scope: !1135)
!1152 = !DILocation(line: 988, column: 6, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1135, file: !69, line: 988, column: 6)
!1154 = !DILocation(line: 988, column: 15, scope: !1153)
!1155 = !DILocation(line: 988, column: 6, scope: !1135)
!1156 = !DILocation(line: 990, column: 7, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1158, file: !69, line: 990, column: 7)
!1158 = distinct !DILexicalBlock(scope: !1153, file: !69, line: 989, column: 3)
!1159 = !DILocation(line: 990, column: 16, scope: !1157)
!1160 = !DILocation(line: 990, column: 7, scope: !1158)
!1161 = !DILocation(line: 992, column: 17, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 991, column: 4)
!1163 = !DILocation(line: 992, column: 12, scope: !1162)
!1164 = !DILocation(line: 992, column: 5, scope: !1162)
!1165 = !DILocation(line: 996, column: 5, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 995, column: 4)
!1167 = !DILocation(line: 1001, column: 4, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1153, file: !69, line: 1000, column: 3)
!1169 = !DILocation(line: 1004, column: 1, scope: !1102)
!1170 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1022, type: !1171, scopeLine: 1023, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{!6, !6, !6, !28}
!1173 = !DILocalVariable(name: "data1", arg: 1, scope: !1170, file: !69, line: 1022, type: !6)
!1174 = !DILocation(line: 1022, column: 33, scope: !1170)
!1175 = !DILocalVariable(name: "data2", arg: 2, scope: !1170, file: !69, line: 1022, type: !6)
!1176 = !DILocation(line: 1022, column: 43, scope: !1170)
!1177 = !DILocalVariable(name: "denominator", arg: 3, scope: !1170, file: !69, line: 1022, type: !28)
!1178 = !DILocation(line: 1022, column: 53, scope: !1170)
!1179 = !DILocalVariable(name: "s32Result", scope: !1170, file: !69, line: 1024, type: !21)
!1180 = !DILocation(line: 1024, column: 6, scope: !1170)
!1181 = !DILocalVariable(name: "s32Temp1", scope: !1170, file: !69, line: 1024, type: !21)
!1182 = !DILocation(line: 1024, column: 21, scope: !1170)
!1183 = !DILocation(line: 1025, column: 14, scope: !1170)
!1184 = !DILocation(line: 1025, column: 22, scope: !1170)
!1185 = !DILocation(line: 1025, column: 20, scope: !1170)
!1186 = !DILocation(line: 1025, column: 12, scope: !1170)
!1187 = !DILocation(line: 1027, column: 5, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1170, file: !69, line: 1027, column: 5)
!1189 = !DILocation(line: 1027, column: 17, scope: !1188)
!1190 = !DILocation(line: 1027, column: 5, scope: !1170)
!1191 = !DILocation(line: 1029, column: 6, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1193, file: !69, line: 1029, column: 6)
!1193 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 1028, column: 2)
!1194 = !DILocation(line: 1029, column: 16, scope: !1192)
!1195 = !DILocation(line: 1029, column: 6, scope: !1193)
!1196 = !DILocation(line: 1031, column: 4, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1192, file: !69, line: 1030, column: 3)
!1198 = !DILocation(line: 1033, column: 11, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1192, file: !69, line: 1033, column: 11)
!1200 = !DILocation(line: 1033, column: 21, scope: !1199)
!1201 = !DILocation(line: 1033, column: 11, scope: !1192)
!1202 = !DILocation(line: 1035, column: 4, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 1034, column: 3)
!1204 = !DILocation(line: 1039, column: 4, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 1038, column: 3)
!1206 = !DILocation(line: 1044, column: 15, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 1043, column: 2)
!1208 = !DILocation(line: 1044, column: 28, scope: !1207)
!1209 = !DILocation(line: 1044, column: 38, scope: !1207)
!1210 = !DILocation(line: 1044, column: 37, scope: !1207)
!1211 = !DILocation(line: 1044, column: 51, scope: !1207)
!1212 = !DILocation(line: 1044, column: 50, scope: !1207)
!1213 = !DILocation(line: 1044, column: 25, scope: !1207)
!1214 = !DILocation(line: 1044, column: 64, scope: !1207)
!1215 = !DILocation(line: 1044, column: 12, scope: !1207)
!1216 = !DILocation(line: 1045, column: 16, scope: !1207)
!1217 = !DILocation(line: 1045, column: 25, scope: !1207)
!1218 = !DILocation(line: 1045, column: 24, scope: !1207)
!1219 = !DILocation(line: 1045, column: 41, scope: !1207)
!1220 = !DILocation(line: 1045, column: 51, scope: !1207)
!1221 = !DILocation(line: 1045, column: 50, scope: !1207)
!1222 = !DILocation(line: 1045, column: 38, scope: !1207)
!1223 = !DILocation(line: 1045, column: 13, scope: !1207)
!1224 = !DILocation(line: 1046, column: 6, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1207, file: !69, line: 1046, column: 6)
!1226 = !DILocation(line: 1046, column: 16, scope: !1225)
!1227 = !DILocation(line: 1046, column: 6, scope: !1207)
!1228 = !DILocation(line: 1048, column: 7, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1230, file: !69, line: 1048, column: 7)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1047, column: 3)
!1231 = !DILocation(line: 1048, column: 17, scope: !1229)
!1232 = !DILocation(line: 1048, column: 7, scope: !1230)
!1233 = !DILocation(line: 1050, column: 17, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1229, file: !69, line: 1049, column: 4)
!1235 = !DILocation(line: 1050, column: 12, scope: !1234)
!1236 = !DILocation(line: 1050, column: 5, scope: !1234)
!1237 = !DILocation(line: 1054, column: 5, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1229, file: !69, line: 1053, column: 4)
!1239 = !DILocation(line: 1059, column: 4, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1058, column: 3)
!1241 = !DILocation(line: 1063, column: 1, scope: !1170)
!1242 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1080, type: !1243, scopeLine: 1081, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!428, !428, !21}
!1245 = !DILocalVariable(name: "numerator", arg: 1, scope: !1242, file: !69, line: 1080, type: !428)
!1246 = !DILocation(line: 1080, column: 25, scope: !1242)
!1247 = !DILocalVariable(name: "denominator", arg: 2, scope: !1242, file: !69, line: 1080, type: !21)
!1248 = !DILocation(line: 1080, column: 40, scope: !1242)
!1249 = !DILocalVariable(name: "u32Temp1", scope: !1242, file: !69, line: 1082, type: !428)
!1250 = !DILocation(line: 1082, column: 6, scope: !1242)
!1251 = !DILocation(line: 1083, column: 5, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 1083, column: 5)
!1253 = !DILocation(line: 1083, column: 17, scope: !1252)
!1254 = !DILocation(line: 1083, column: 5, scope: !1242)
!1255 = !DILocation(line: 1085, column: 3, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1252, file: !69, line: 1084, column: 2)
!1257 = !DILocation(line: 1089, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1259, file: !69, line: 1089, column: 6)
!1259 = distinct !DILexicalBlock(scope: !1252, file: !69, line: 1088, column: 2)
!1260 = !DILocation(line: 1089, column: 18, scope: !1258)
!1261 = !DILocation(line: 1089, column: 6, scope: !1259)
!1262 = !DILocation(line: 1091, column: 4, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !69, line: 1090, column: 3)
!1264 = !DILocation(line: 1095, column: 16, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1258, file: !69, line: 1094, column: 3)
!1266 = !DILocation(line: 1095, column: 30, scope: !1265)
!1267 = !DILocation(line: 1095, column: 40, scope: !1265)
!1268 = !DILocation(line: 1095, column: 39, scope: !1265)
!1269 = !DILocation(line: 1095, column: 55, scope: !1265)
!1270 = !DILocation(line: 1095, column: 53, scope: !1265)
!1271 = !DILocation(line: 1095, column: 26, scope: !1265)
!1272 = !DILocation(line: 1095, column: 68, scope: !1265)
!1273 = !DILocation(line: 1095, column: 13, scope: !1265)
!1274 = !DILocation(line: 1096, column: 16, scope: !1265)
!1275 = !DILocation(line: 1096, column: 25, scope: !1265)
!1276 = !DILocation(line: 1096, column: 24, scope: !1265)
!1277 = !DILocation(line: 1096, column: 41, scope: !1265)
!1278 = !DILocation(line: 1096, column: 51, scope: !1265)
!1279 = !DILocation(line: 1096, column: 50, scope: !1265)
!1280 = !DILocation(line: 1096, column: 38, scope: !1265)
!1281 = !DILocation(line: 1096, column: 13, scope: !1265)
!1282 = !DILocation(line: 1097, column: 11, scope: !1265)
!1283 = !DILocation(line: 1097, column: 4, scope: !1265)
!1284 = !DILocation(line: 1100, column: 1, scope: !1242)
!1285 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1117, type: !1286, scopeLine: 1118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!428, !21, !428}
!1288 = !DILocalVariable(name: "numerator", arg: 1, scope: !1285, file: !69, line: 1117, type: !21)
!1289 = !DILocation(line: 1117, column: 25, scope: !1285)
!1290 = !DILocalVariable(name: "denominator", arg: 2, scope: !1285, file: !69, line: 1117, type: !428)
!1291 = !DILocation(line: 1117, column: 40, scope: !1285)
!1292 = !DILocalVariable(name: "s32Temp1", scope: !1285, file: !69, line: 1119, type: !21)
!1293 = !DILocation(line: 1119, column: 6, scope: !1285)
!1294 = !DILocation(line: 1120, column: 5, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1120, column: 5)
!1296 = !DILocation(line: 1120, column: 17, scope: !1295)
!1297 = !DILocation(line: 1120, column: 5, scope: !1285)
!1298 = !DILocation(line: 1122, column: 6, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1300, file: !69, line: 1122, column: 6)
!1300 = distinct !DILexicalBlock(scope: !1295, file: !69, line: 1121, column: 2)
!1301 = !DILocation(line: 1122, column: 16, scope: !1299)
!1302 = !DILocation(line: 1122, column: 6, scope: !1300)
!1303 = !DILocation(line: 1124, column: 4, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1299, file: !69, line: 1123, column: 3)
!1305 = !DILocation(line: 1128, column: 4, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1299, file: !69, line: 1127, column: 3)
!1307 = !DILocation(line: 1133, column: 6, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1309, file: !69, line: 1133, column: 6)
!1309 = distinct !DILexicalBlock(scope: !1295, file: !69, line: 1132, column: 2)
!1310 = !DILocation(line: 1133, column: 16, scope: !1308)
!1311 = !DILocation(line: 1133, column: 6, scope: !1309)
!1312 = !DILocation(line: 1135, column: 17, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !69, line: 1134, column: 3)
!1314 = !DILocation(line: 1135, column: 31, scope: !1313)
!1315 = !DILocation(line: 1135, column: 41, scope: !1313)
!1316 = !DILocation(line: 1135, column: 40, scope: !1313)
!1317 = !DILocation(line: 1135, column: 56, scope: !1313)
!1318 = !DILocation(line: 1135, column: 54, scope: !1313)
!1319 = !DILocation(line: 1135, column: 27, scope: !1313)
!1320 = !DILocation(line: 1135, column: 69, scope: !1313)
!1321 = !DILocation(line: 1135, column: 13, scope: !1313)
!1322 = !DILocation(line: 1136, column: 13, scope: !1313)
!1323 = !DILocation(line: 1136, column: 23, scope: !1313)
!1324 = !DILocation(line: 1136, column: 22, scope: !1313)
!1325 = !DILocation(line: 1136, column: 39, scope: !1313)
!1326 = !DILocation(line: 1136, column: 48, scope: !1313)
!1327 = !DILocation(line: 1136, column: 47, scope: !1313)
!1328 = !DILocation(line: 1136, column: 36, scope: !1313)
!1329 = !DILocation(line: 1136, column: 4, scope: !1313)
!1330 = !DILocation(line: 1140, column: 4, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1308, file: !69, line: 1139, column: 3)
!1332 = !DILocation(line: 1143, column: 1, scope: !1285)
!1333 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1160, type: !1334, scopeLine: 1161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1334 = !DISubroutineType(types: !1335)
!1335 = !{!428, !21, !21}
!1336 = !DILocalVariable(name: "numerator", arg: 1, scope: !1333, file: !69, line: 1160, type: !21)
!1337 = !DILocation(line: 1160, column: 25, scope: !1333)
!1338 = !DILocalVariable(name: "denominator", arg: 2, scope: !1333, file: !69, line: 1160, type: !21)
!1339 = !DILocation(line: 1160, column: 40, scope: !1333)
!1340 = !DILocalVariable(name: "u32Temp1", scope: !1333, file: !69, line: 1162, type: !428)
!1341 = !DILocation(line: 1162, column: 6, scope: !1333)
!1342 = !DILocalVariable(name: "u32Temp2", scope: !1333, file: !69, line: 1162, type: !428)
!1343 = !DILocation(line: 1162, column: 20, scope: !1333)
!1344 = !DILocation(line: 1163, column: 5, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1163, column: 5)
!1346 = !DILocation(line: 1163, column: 17, scope: !1345)
!1347 = !DILocation(line: 1163, column: 5, scope: !1333)
!1348 = !DILocation(line: 1165, column: 6, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1350, file: !69, line: 1165, column: 6)
!1350 = distinct !DILexicalBlock(scope: !1345, file: !69, line: 1164, column: 2)
!1351 = !DILocation(line: 1165, column: 16, scope: !1349)
!1352 = !DILocation(line: 1165, column: 6, scope: !1350)
!1353 = !DILocation(line: 1167, column: 4, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1166, column: 3)
!1355 = !DILocation(line: 1171, column: 4, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1170, column: 3)
!1357 = !DILocation(line: 1176, column: 6, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1359, file: !69, line: 1176, column: 6)
!1359 = distinct !DILexicalBlock(scope: !1345, file: !69, line: 1175, column: 2)
!1360 = !DILocation(line: 1176, column: 16, scope: !1358)
!1361 = !DILocation(line: 1176, column: 6, scope: !1359)
!1362 = !DILocation(line: 1178, column: 7, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1178, column: 7)
!1364 = distinct !DILexicalBlock(scope: !1358, file: !69, line: 1177, column: 3)
!1365 = !DILocation(line: 1178, column: 17, scope: !1363)
!1366 = !DILocation(line: 1178, column: 7, scope: !1364)
!1367 = !DILocation(line: 1180, column: 5, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1363, file: !69, line: 1179, column: 4)
!1369 = !DILocation(line: 1184, column: 8, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1371, file: !69, line: 1184, column: 8)
!1371 = distinct !DILexicalBlock(scope: !1363, file: !69, line: 1183, column: 4)
!1372 = !DILocation(line: 1184, column: 20, scope: !1370)
!1373 = !DILocation(line: 1184, column: 8, scope: !1371)
!1374 = !DILocation(line: 1186, column: 6, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1370, file: !69, line: 1185, column: 5)
!1376 = !DILocation(line: 1190, column: 18, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1370, file: !69, line: 1189, column: 5)
!1378 = !DILocation(line: 1190, column: 32, scope: !1377)
!1379 = !DILocation(line: 1190, column: 42, scope: !1377)
!1380 = !DILocation(line: 1190, column: 41, scope: !1377)
!1381 = !DILocation(line: 1190, column: 57, scope: !1377)
!1382 = !DILocation(line: 1190, column: 55, scope: !1377)
!1383 = !DILocation(line: 1190, column: 28, scope: !1377)
!1384 = !DILocation(line: 1190, column: 71, scope: !1377)
!1385 = !DILocation(line: 1190, column: 15, scope: !1377)
!1386 = !DILocation(line: 1191, column: 18, scope: !1377)
!1387 = !DILocation(line: 1191, column: 29, scope: !1377)
!1388 = !DILocation(line: 1191, column: 27, scope: !1377)
!1389 = !DILocation(line: 1191, column: 45, scope: !1377)
!1390 = !DILocation(line: 1191, column: 57, scope: !1377)
!1391 = !DILocation(line: 1191, column: 55, scope: !1377)
!1392 = !DILocation(line: 1191, column: 42, scope: !1377)
!1393 = !DILocation(line: 1191, column: 15, scope: !1377)
!1394 = !DILocation(line: 1192, column: 13, scope: !1377)
!1395 = !DILocation(line: 1192, column: 6, scope: !1377)
!1396 = !DILocation(line: 1198, column: 7, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1398, file: !69, line: 1198, column: 7)
!1398 = distinct !DILexicalBlock(scope: !1358, file: !69, line: 1197, column: 3)
!1399 = !DILocation(line: 1198, column: 19, scope: !1397)
!1400 = !DILocation(line: 1198, column: 7, scope: !1398)
!1401 = !DILocation(line: 1200, column: 5, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1199, column: 4)
!1403 = !DILocation(line: 1204, column: 18, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1203, column: 4)
!1405 = !DILocation(line: 1204, column: 17, scope: !1404)
!1406 = !DILocation(line: 1204, column: 15, scope: !1404)
!1407 = !DILocation(line: 1205, column: 20, scope: !1404)
!1408 = !DILocation(line: 1205, column: 19, scope: !1404)
!1409 = !DILocation(line: 1205, column: 17, scope: !1404)
!1410 = !DILocation(line: 1206, column: 17, scope: !1404)
!1411 = !DILocation(line: 1206, column: 31, scope: !1404)
!1412 = !DILocation(line: 1206, column: 41, scope: !1404)
!1413 = !DILocation(line: 1206, column: 40, scope: !1404)
!1414 = !DILocation(line: 1206, column: 56, scope: !1404)
!1415 = !DILocation(line: 1206, column: 54, scope: !1404)
!1416 = !DILocation(line: 1206, column: 27, scope: !1404)
!1417 = !DILocation(line: 1206, column: 70, scope: !1404)
!1418 = !DILocation(line: 1206, column: 14, scope: !1404)
!1419 = !DILocation(line: 1207, column: 17, scope: !1404)
!1420 = !DILocation(line: 1207, column: 28, scope: !1404)
!1421 = !DILocation(line: 1207, column: 26, scope: !1404)
!1422 = !DILocation(line: 1207, column: 44, scope: !1404)
!1423 = !DILocation(line: 1207, column: 56, scope: !1404)
!1424 = !DILocation(line: 1207, column: 54, scope: !1404)
!1425 = !DILocation(line: 1207, column: 41, scope: !1404)
!1426 = !DILocation(line: 1207, column: 14, scope: !1404)
!1427 = !DILocation(line: 1208, column: 12, scope: !1404)
!1428 = !DILocation(line: 1208, column: 5, scope: !1404)
!1429 = !DILocation(line: 1213, column: 1, scope: !1333)
!1430 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1230, type: !1431, scopeLine: 1231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!428, !428, !428}
!1433 = !DILocalVariable(name: "numerator", arg: 1, scope: !1430, file: !69, line: 1230, type: !428)
!1434 = !DILocation(line: 1230, column: 25, scope: !1430)
!1435 = !DILocalVariable(name: "denominator", arg: 2, scope: !1430, file: !69, line: 1230, type: !428)
!1436 = !DILocation(line: 1230, column: 40, scope: !1430)
!1437 = !DILocalVariable(name: "u32Temp1", scope: !1430, file: !69, line: 1233, type: !428)
!1438 = !DILocation(line: 1233, column: 6, scope: !1430)
!1439 = !DILocalVariable(name: "u32Temp2", scope: !1430, file: !69, line: 1233, type: !428)
!1440 = !DILocation(line: 1233, column: 20, scope: !1430)
!1441 = !DILocalVariable(name: "u32Temp3", scope: !1430, file: !69, line: 1233, type: !428)
!1442 = !DILocation(line: 1233, column: 34, scope: !1430)
!1443 = !DILocalVariable(name: "numerator_old", scope: !1430, file: !69, line: 1233, type: !428)
!1444 = !DILocation(line: 1233, column: 48, scope: !1430)
!1445 = !DILocation(line: 1234, column: 5, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1234, column: 5)
!1447 = !DILocation(line: 1234, column: 16, scope: !1446)
!1448 = !DILocation(line: 1234, column: 5, scope: !1430)
!1449 = !DILocation(line: 1236, column: 3, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1235, column: 2)
!1451 = !DILocation(line: 1240, column: 14, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1239, column: 2)
!1453 = !DILocation(line: 1240, column: 26, scope: !1452)
!1454 = !DILocation(line: 1240, column: 41, scope: !1452)
!1455 = !DILocation(line: 1240, column: 51, scope: !1452)
!1456 = !DILocation(line: 1240, column: 50, scope: !1452)
!1457 = !DILocation(line: 1240, column: 38, scope: !1452)
!1458 = !DILocation(line: 1240, column: 24, scope: !1452)
!1459 = !DILocation(line: 1240, column: 12, scope: !1452)
!1460 = !DILocation(line: 1241, column: 7, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1452, file: !69, line: 1241, column: 6)
!1462 = !DILocation(line: 1241, column: 16, scope: !1461)
!1463 = !DILocation(line: 1241, column: 24, scope: !1461)
!1464 = !DILocation(line: 1241, column: 6, scope: !1452)
!1465 = !DILocation(line: 1243, column: 16, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1242, column: 3)
!1467 = !DILocation(line: 1243, column: 27, scope: !1466)
!1468 = !DILocation(line: 1243, column: 13, scope: !1466)
!1469 = !DILocation(line: 1244, column: 3, scope: !1466)
!1470 = !DILocation(line: 1247, column: 16, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1246, column: 3)
!1472 = !DILocation(line: 1247, column: 27, scope: !1471)
!1473 = !DILocation(line: 1247, column: 32, scope: !1471)
!1474 = !DILocation(line: 1247, column: 13, scope: !1471)
!1475 = !DILocation(line: 1250, column: 6, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1452, file: !69, line: 1250, column: 6)
!1477 = !DILocation(line: 1250, column: 17, scope: !1476)
!1478 = !DILocation(line: 1250, column: 15, scope: !1476)
!1479 = !DILocation(line: 1250, column: 6, scope: !1452)
!1480 = !DILocation(line: 1252, column: 12, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1476, file: !69, line: 1251, column: 3)
!1482 = !DILocation(line: 1252, column: 22, scope: !1481)
!1483 = !DILocation(line: 1252, column: 21, scope: !1481)
!1484 = !DILocation(line: 1252, column: 4, scope: !1481)
!1485 = !DILocation(line: 1256, column: 13, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1476, file: !69, line: 1255, column: 3)
!1487 = !DILocation(line: 1256, column: 23, scope: !1486)
!1488 = !DILocation(line: 1256, column: 22, scope: !1486)
!1489 = !DILocation(line: 1256, column: 36, scope: !1486)
!1490 = !DILocation(line: 1256, column: 4, scope: !1486)
!1491 = !DILocation(line: 1261, column: 1, scope: !1430)
!1492 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1278, type: !1493, scopeLine: 1279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1493 = !DISubroutineType(types: !1494)
!1494 = !{!21, !428, !21}
!1495 = !DILocalVariable(name: "numerator", arg: 1, scope: !1492, file: !69, line: 1278, type: !428)
!1496 = !DILocation(line: 1278, column: 25, scope: !1492)
!1497 = !DILocalVariable(name: "denominator", arg: 2, scope: !1492, file: !69, line: 1278, type: !21)
!1498 = !DILocation(line: 1278, column: 40, scope: !1492)
!1499 = !DILocalVariable(name: "u32Temp1", scope: !1492, file: !69, line: 1280, type: !428)
!1500 = !DILocation(line: 1280, column: 6, scope: !1492)
!1501 = !DILocalVariable(name: "u32Temp2", scope: !1492, file: !69, line: 1280, type: !428)
!1502 = !DILocation(line: 1280, column: 20, scope: !1492)
!1503 = !DILocation(line: 1281, column: 5, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1281, column: 5)
!1505 = !DILocation(line: 1281, column: 17, scope: !1504)
!1506 = !DILocation(line: 1281, column: 5, scope: !1492)
!1507 = !DILocation(line: 1283, column: 6, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1509, file: !69, line: 1283, column: 6)
!1509 = distinct !DILexicalBlock(scope: !1504, file: !69, line: 1282, column: 2)
!1510 = !DILocation(line: 1283, column: 18, scope: !1508)
!1511 = !DILocation(line: 1283, column: 6, scope: !1509)
!1512 = !DILocation(line: 1285, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1284, column: 3)
!1514 = !DILocation(line: 1289, column: 19, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1288, column: 3)
!1516 = !DILocation(line: 1289, column: 18, scope: !1515)
!1517 = !DILocation(line: 1289, column: 16, scope: !1515)
!1518 = !DILocation(line: 1290, column: 16, scope: !1515)
!1519 = !DILocation(line: 1290, column: 30, scope: !1515)
!1520 = !DILocation(line: 1290, column: 40, scope: !1515)
!1521 = !DILocation(line: 1290, column: 39, scope: !1515)
!1522 = !DILocation(line: 1290, column: 55, scope: !1515)
!1523 = !DILocation(line: 1290, column: 53, scope: !1515)
!1524 = !DILocation(line: 1290, column: 26, scope: !1515)
!1525 = !DILocation(line: 1290, column: 69, scope: !1515)
!1526 = !DILocation(line: 1290, column: 13, scope: !1515)
!1527 = !DILocation(line: 1291, column: 16, scope: !1515)
!1528 = !DILocation(line: 1291, column: 25, scope: !1515)
!1529 = !DILocation(line: 1291, column: 24, scope: !1515)
!1530 = !DILocation(line: 1291, column: 41, scope: !1515)
!1531 = !DILocation(line: 1291, column: 51, scope: !1515)
!1532 = !DILocation(line: 1291, column: 50, scope: !1515)
!1533 = !DILocation(line: 1291, column: 38, scope: !1515)
!1534 = !DILocation(line: 1291, column: 13, scope: !1515)
!1535 = !DILocation(line: 1292, column: 7, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1292, column: 7)
!1537 = !DILocation(line: 1292, column: 16, scope: !1536)
!1538 = !DILocation(line: 1292, column: 7, scope: !1515)
!1539 = !DILocation(line: 1294, column: 13, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1536, file: !69, line: 1293, column: 4)
!1541 = !DILocation(line: 1294, column: 12, scope: !1540)
!1542 = !DILocation(line: 1294, column: 5, scope: !1540)
!1543 = !DILocation(line: 1298, column: 5, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1536, file: !69, line: 1297, column: 4)
!1545 = !DILocation(line: 1304, column: 15, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1504, file: !69, line: 1303, column: 2)
!1547 = !DILocation(line: 1304, column: 29, scope: !1546)
!1548 = !DILocation(line: 1304, column: 39, scope: !1546)
!1549 = !DILocation(line: 1304, column: 38, scope: !1546)
!1550 = !DILocation(line: 1304, column: 54, scope: !1546)
!1551 = !DILocation(line: 1304, column: 52, scope: !1546)
!1552 = !DILocation(line: 1304, column: 25, scope: !1546)
!1553 = !DILocation(line: 1304, column: 68, scope: !1546)
!1554 = !DILocation(line: 1304, column: 12, scope: !1546)
!1555 = !DILocation(line: 1305, column: 15, scope: !1546)
!1556 = !DILocation(line: 1305, column: 24, scope: !1546)
!1557 = !DILocation(line: 1305, column: 23, scope: !1546)
!1558 = !DILocation(line: 1305, column: 40, scope: !1546)
!1559 = !DILocation(line: 1305, column: 50, scope: !1546)
!1560 = !DILocation(line: 1305, column: 49, scope: !1546)
!1561 = !DILocation(line: 1305, column: 37, scope: !1546)
!1562 = !DILocation(line: 1305, column: 12, scope: !1546)
!1563 = !DILocation(line: 1306, column: 6, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1306, column: 6)
!1565 = !DILocation(line: 1306, column: 15, scope: !1564)
!1566 = !DILocation(line: 1306, column: 6, scope: !1546)
!1567 = !DILocation(line: 1308, column: 11, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1564, file: !69, line: 1307, column: 3)
!1569 = !DILocation(line: 1308, column: 4, scope: !1568)
!1570 = !DILocation(line: 1312, column: 4, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1564, file: !69, line: 1311, column: 3)
!1572 = !DILocation(line: 1315, column: 1, scope: !1492)
!1573 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1333, type: !1574, scopeLine: 1334, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1574 = !DISubroutineType(types: !1575)
!1575 = !{!21, !21, !428}
!1576 = !DILocalVariable(name: "numerator", arg: 1, scope: !1573, file: !69, line: 1333, type: !21)
!1577 = !DILocation(line: 1333, column: 25, scope: !1573)
!1578 = !DILocalVariable(name: "denominator", arg: 2, scope: !1573, file: !69, line: 1333, type: !428)
!1579 = !DILocation(line: 1333, column: 40, scope: !1573)
!1580 = !DILocalVariable(name: "s32Temp1", scope: !1573, file: !69, line: 1335, type: !21)
!1581 = !DILocation(line: 1335, column: 6, scope: !1573)
!1582 = !DILocalVariable(name: "s32Temp2", scope: !1573, file: !69, line: 1335, type: !21)
!1583 = !DILocation(line: 1335, column: 20, scope: !1573)
!1584 = !DILocalVariable(name: "u32Temp0", scope: !1573, file: !69, line: 1336, type: !428)
!1585 = !DILocation(line: 1336, column: 6, scope: !1573)
!1586 = !DILocalVariable(name: "u32Temp1", scope: !1573, file: !69, line: 1336, type: !428)
!1587 = !DILocation(line: 1336, column: 20, scope: !1573)
!1588 = !DILocalVariable(name: "u32Temp2", scope: !1573, file: !69, line: 1336, type: !428)
!1589 = !DILocation(line: 1336, column: 34, scope: !1573)
!1590 = !DILocation(line: 1337, column: 5, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1337, column: 5)
!1592 = !DILocation(line: 1337, column: 17, scope: !1591)
!1593 = !DILocation(line: 1337, column: 5, scope: !1573)
!1594 = !DILocation(line: 1339, column: 6, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1596, file: !69, line: 1339, column: 6)
!1596 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1338, column: 2)
!1597 = !DILocation(line: 1339, column: 16, scope: !1595)
!1598 = !DILocation(line: 1339, column: 6, scope: !1596)
!1599 = !DILocation(line: 1341, column: 4, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1340, column: 3)
!1601 = !DILocation(line: 1345, column: 4, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1344, column: 3)
!1603 = !DILocation(line: 1350, column: 6, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1605, file: !69, line: 1350, column: 6)
!1605 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1349, column: 2)
!1606 = !DILocation(line: 1350, column: 16, scope: !1604)
!1607 = !DILocation(line: 1350, column: 6, scope: !1605)
!1608 = !DILocation(line: 1352, column: 16, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1351, column: 3)
!1610 = !DILocation(line: 1352, column: 15, scope: !1609)
!1611 = !DILocation(line: 1352, column: 13, scope: !1609)
!1612 = !DILocation(line: 1353, column: 16, scope: !1609)
!1613 = !DILocation(line: 1353, column: 25, scope: !1609)
!1614 = !DILocation(line: 1353, column: 24, scope: !1609)
!1615 = !DILocation(line: 1353, column: 13, scope: !1609)
!1616 = !DILocation(line: 1354, column: 15, scope: !1609)
!1617 = !DILocation(line: 1354, column: 28, scope: !1609)
!1618 = !DILocation(line: 1354, column: 37, scope: !1609)
!1619 = !DILocation(line: 1354, column: 36, scope: !1609)
!1620 = !DILocation(line: 1354, column: 52, scope: !1609)
!1621 = !DILocation(line: 1354, column: 50, scope: !1609)
!1622 = !DILocation(line: 1354, column: 24, scope: !1609)
!1623 = !DILocation(line: 1354, column: 13, scope: !1609)
!1624 = !DILocation(line: 1356, column: 8, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1356, column: 7)
!1626 = !DILocation(line: 1356, column: 20, scope: !1625)
!1627 = !DILocation(line: 1356, column: 27, scope: !1625)
!1628 = !DILocation(line: 1356, column: 7, scope: !1609)
!1629 = !DILocation(line: 1358, column: 20, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1625, file: !69, line: 1357, column: 4)
!1631 = !DILocation(line: 1358, column: 32, scope: !1630)
!1632 = !DILocation(line: 1358, column: 17, scope: !1630)
!1633 = !DILocation(line: 1359, column: 4, scope: !1630)
!1634 = !DILocation(line: 1362, column: 20, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1625, file: !69, line: 1361, column: 4)
!1636 = !DILocation(line: 1362, column: 32, scope: !1635)
!1637 = !DILocation(line: 1362, column: 38, scope: !1635)
!1638 = !DILocation(line: 1362, column: 17, scope: !1635)
!1639 = !DILocation(line: 1366, column: 7, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1366, column: 7)
!1641 = !DILocation(line: 1366, column: 18, scope: !1640)
!1642 = !DILocation(line: 1366, column: 16, scope: !1640)
!1643 = !DILocation(line: 1366, column: 7, scope: !1609)
!1644 = !DILocation(line: 1368, column: 14, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1367, column: 4)
!1646 = !DILocation(line: 1368, column: 13, scope: !1645)
!1647 = !DILocation(line: 1368, column: 23, scope: !1645)
!1648 = !DILocation(line: 1368, column: 5, scope: !1645)
!1649 = !DILocation(line: 1372, column: 14, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1371, column: 4)
!1651 = !DILocation(line: 1372, column: 23, scope: !1650)
!1652 = !DILocation(line: 1372, column: 12, scope: !1650)
!1653 = !DILocation(line: 1372, column: 27, scope: !1650)
!1654 = !DILocation(line: 1372, column: 5, scope: !1650)
!1655 = !DILocation(line: 1379, column: 16, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1378, column: 3)
!1657 = !DILocation(line: 1379, column: 30, scope: !1656)
!1658 = !DILocation(line: 1379, column: 40, scope: !1656)
!1659 = !DILocation(line: 1379, column: 39, scope: !1656)
!1660 = !DILocation(line: 1379, column: 55, scope: !1656)
!1661 = !DILocation(line: 1379, column: 53, scope: !1656)
!1662 = !DILocation(line: 1379, column: 26, scope: !1656)
!1663 = !DILocation(line: 1379, column: 69, scope: !1656)
!1664 = !DILocation(line: 1379, column: 13, scope: !1656)
!1665 = !DILocation(line: 1380, column: 16, scope: !1656)
!1666 = !DILocation(line: 1380, column: 26, scope: !1656)
!1667 = !DILocation(line: 1380, column: 25, scope: !1656)
!1668 = !DILocation(line: 1380, column: 42, scope: !1656)
!1669 = !DILocation(line: 1380, column: 51, scope: !1656)
!1670 = !DILocation(line: 1380, column: 50, scope: !1656)
!1671 = !DILocation(line: 1380, column: 39, scope: !1656)
!1672 = !DILocation(line: 1380, column: 13, scope: !1656)
!1673 = !DILocation(line: 1381, column: 11, scope: !1656)
!1674 = !DILocation(line: 1381, column: 4, scope: !1656)
!1675 = !DILocation(line: 1384, column: 1, scope: !1573)
!1676 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1401, type: !1677, scopeLine: 1402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!21, !21, !21}
!1679 = !DILocalVariable(name: "numerator", arg: 1, scope: !1676, file: !69, line: 1401, type: !21)
!1680 = !DILocation(line: 1401, column: 25, scope: !1676)
!1681 = !DILocalVariable(name: "denominator", arg: 2, scope: !1676, file: !69, line: 1401, type: !21)
!1682 = !DILocation(line: 1401, column: 40, scope: !1676)
!1683 = !DILocalVariable(name: "s32Temp1", scope: !1676, file: !69, line: 1403, type: !21)
!1684 = !DILocation(line: 1403, column: 6, scope: !1676)
!1685 = !DILocalVariable(name: "s32Temp2", scope: !1676, file: !69, line: 1403, type: !21)
!1686 = !DILocation(line: 1403, column: 20, scope: !1676)
!1687 = !DILocalVariable(name: "denominator_prime", scope: !1676, file: !69, line: 1404, type: !428)
!1688 = !DILocation(line: 1404, column: 6, scope: !1676)
!1689 = !DILocalVariable(name: "u32Temp1", scope: !1676, file: !69, line: 1404, type: !428)
!1690 = !DILocation(line: 1404, column: 29, scope: !1676)
!1691 = !DILocalVariable(name: "u32Temp2", scope: !1676, file: !69, line: 1404, type: !428)
!1692 = !DILocation(line: 1404, column: 43, scope: !1676)
!1693 = !DILocalVariable(name: "u32numerator", scope: !1676, file: !69, line: 1405, type: !428)
!1694 = !DILocation(line: 1405, column: 6, scope: !1676)
!1695 = !DILocalVariable(name: "u32denominator", scope: !1676, file: !69, line: 1405, type: !428)
!1696 = !DILocation(line: 1405, column: 23, scope: !1676)
!1697 = !DILocation(line: 1406, column: 5, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1406, column: 5)
!1699 = !DILocation(line: 1406, column: 15, scope: !1698)
!1700 = !DILocation(line: 1406, column: 5, scope: !1676)
!1701 = !DILocation(line: 1408, column: 6, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1703, file: !69, line: 1408, column: 6)
!1703 = distinct !DILexicalBlock(scope: !1698, file: !69, line: 1407, column: 2)
!1704 = !DILocation(line: 1408, column: 18, scope: !1702)
!1705 = !DILocation(line: 1408, column: 6, scope: !1703)
!1706 = !DILocation(line: 1410, column: 7, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1410, column: 7)
!1708 = distinct !DILexicalBlock(scope: !1702, file: !69, line: 1409, column: 3)
!1709 = !DILocation(line: 1410, column: 19, scope: !1707)
!1710 = !DILocation(line: 1410, column: 7, scope: !1708)
!1711 = !DILocation(line: 1412, column: 5, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1411, column: 4)
!1713 = !DILocation(line: 1416, column: 21, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1415, column: 4)
!1715 = !DILocation(line: 1416, column: 20, scope: !1714)
!1716 = !DILocation(line: 1416, column: 18, scope: !1714)
!1717 = !DILocation(line: 1417, column: 23, scope: !1714)
!1718 = !DILocation(line: 1417, column: 22, scope: !1714)
!1719 = !DILocation(line: 1417, column: 20, scope: !1714)
!1720 = !DILocation(line: 1418, column: 16, scope: !1714)
!1721 = !DILocation(line: 1418, column: 33, scope: !1714)
!1722 = !DILocation(line: 1418, column: 46, scope: !1714)
!1723 = !DILocation(line: 1418, column: 45, scope: !1714)
!1724 = !DILocation(line: 1418, column: 64, scope: !1714)
!1725 = !DILocation(line: 1418, column: 62, scope: !1714)
!1726 = !DILocation(line: 1418, column: 29, scope: !1714)
!1727 = !DILocation(line: 1418, column: 81, scope: !1714)
!1728 = !DILocation(line: 1418, column: 14, scope: !1714)
!1729 = !DILocation(line: 1419, column: 17, scope: !1714)
!1730 = !DILocation(line: 1419, column: 30, scope: !1714)
!1731 = !DILocation(line: 1419, column: 29, scope: !1714)
!1732 = !DILocation(line: 1419, column: 49, scope: !1714)
!1733 = !DILocation(line: 1419, column: 58, scope: !1714)
!1734 = !DILocation(line: 1419, column: 57, scope: !1714)
!1735 = !DILocation(line: 1419, column: 46, scope: !1714)
!1736 = !DILocation(line: 1419, column: 14, scope: !1714)
!1737 = !DILocation(line: 1420, column: 8, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1714, file: !69, line: 1420, column: 8)
!1739 = !DILocation(line: 1420, column: 17, scope: !1738)
!1740 = !DILocation(line: 1420, column: 8, scope: !1714)
!1741 = !DILocation(line: 1422, column: 13, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1738, file: !69, line: 1421, column: 5)
!1743 = !DILocation(line: 1422, column: 6, scope: !1742)
!1744 = !DILocation(line: 1426, column: 6, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1738, file: !69, line: 1425, column: 5)
!1746 = !DILocation(line: 1432, column: 20, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1702, file: !69, line: 1431, column: 3)
!1748 = !DILocation(line: 1432, column: 19, scope: !1747)
!1749 = !DILocation(line: 1432, column: 29, scope: !1747)
!1750 = !DILocation(line: 1432, column: 17, scope: !1747)
!1751 = !DILocation(line: 1433, column: 16, scope: !1747)
!1752 = !DILocation(line: 1433, column: 33, scope: !1747)
!1753 = !DILocation(line: 1433, column: 46, scope: !1747)
!1754 = !DILocation(line: 1433, column: 45, scope: !1747)
!1755 = !DILocation(line: 1433, column: 61, scope: !1747)
!1756 = !DILocation(line: 1433, column: 59, scope: !1747)
!1757 = !DILocation(line: 1433, column: 29, scope: !1747)
!1758 = !DILocation(line: 1433, column: 75, scope: !1747)
!1759 = !DILocation(line: 1433, column: 13, scope: !1747)
!1760 = !DILocation(line: 1434, column: 16, scope: !1747)
!1761 = !DILocation(line: 1434, column: 29, scope: !1747)
!1762 = !DILocation(line: 1434, column: 28, scope: !1747)
!1763 = !DILocation(line: 1434, column: 45, scope: !1747)
!1764 = !DILocation(line: 1434, column: 54, scope: !1747)
!1765 = !DILocation(line: 1434, column: 53, scope: !1747)
!1766 = !DILocation(line: 1434, column: 42, scope: !1747)
!1767 = !DILocation(line: 1434, column: 13, scope: !1747)
!1768 = !DILocation(line: 1435, column: 13, scope: !1747)
!1769 = !DILocation(line: 1435, column: 12, scope: !1747)
!1770 = !DILocation(line: 1435, column: 22, scope: !1747)
!1771 = !DILocation(line: 1435, column: 4, scope: !1747)
!1772 = !DILocation(line: 1440, column: 6, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1774, file: !69, line: 1440, column: 6)
!1774 = distinct !DILexicalBlock(scope: !1698, file: !69, line: 1439, column: 2)
!1775 = !DILocation(line: 1440, column: 18, scope: !1773)
!1776 = !DILocation(line: 1440, column: 6, scope: !1774)
!1777 = !DILocation(line: 1442, column: 7, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1779, file: !69, line: 1442, column: 7)
!1779 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1441, column: 3)
!1780 = !DILocation(line: 1442, column: 19, scope: !1778)
!1781 = !DILocation(line: 1442, column: 7, scope: !1779)
!1782 = !DILocation(line: 1444, column: 5, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1778, file: !69, line: 1443, column: 4)
!1784 = !DILocation(line: 1448, column: 23, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1778, file: !69, line: 1447, column: 4)
!1786 = !DILocation(line: 1448, column: 22, scope: !1785)
!1787 = !DILocation(line: 1448, column: 35, scope: !1785)
!1788 = !DILocation(line: 1448, column: 20, scope: !1785)
!1789 = !DILocation(line: 1449, column: 17, scope: !1785)
!1790 = !DILocation(line: 1449, column: 31, scope: !1785)
!1791 = !DILocation(line: 1449, column: 41, scope: !1785)
!1792 = !DILocation(line: 1449, column: 40, scope: !1785)
!1793 = !DILocation(line: 1449, column: 59, scope: !1785)
!1794 = !DILocation(line: 1449, column: 57, scope: !1785)
!1795 = !DILocation(line: 1449, column: 27, scope: !1785)
!1796 = !DILocation(line: 1449, column: 76, scope: !1785)
!1797 = !DILocation(line: 1449, column: 14, scope: !1785)
!1798 = !DILocation(line: 1450, column: 17, scope: !1785)
!1799 = !DILocation(line: 1450, column: 27, scope: !1785)
!1800 = !DILocation(line: 1450, column: 26, scope: !1785)
!1801 = !DILocation(line: 1450, column: 46, scope: !1785)
!1802 = !DILocation(line: 1450, column: 55, scope: !1785)
!1803 = !DILocation(line: 1450, column: 54, scope: !1785)
!1804 = !DILocation(line: 1450, column: 43, scope: !1785)
!1805 = !DILocation(line: 1450, column: 14, scope: !1785)
!1806 = !DILocation(line: 1451, column: 14, scope: !1785)
!1807 = !DILocation(line: 1451, column: 13, scope: !1785)
!1808 = !DILocation(line: 1451, column: 23, scope: !1785)
!1809 = !DILocation(line: 1451, column: 5, scope: !1785)
!1810 = !DILocation(line: 1456, column: 16, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1455, column: 3)
!1812 = !DILocation(line: 1456, column: 30, scope: !1811)
!1813 = !DILocation(line: 1456, column: 40, scope: !1811)
!1814 = !DILocation(line: 1456, column: 39, scope: !1811)
!1815 = !DILocation(line: 1456, column: 55, scope: !1811)
!1816 = !DILocation(line: 1456, column: 53, scope: !1811)
!1817 = !DILocation(line: 1456, column: 26, scope: !1811)
!1818 = !DILocation(line: 1456, column: 69, scope: !1811)
!1819 = !DILocation(line: 1456, column: 13, scope: !1811)
!1820 = !DILocation(line: 1457, column: 16, scope: !1811)
!1821 = !DILocation(line: 1457, column: 26, scope: !1811)
!1822 = !DILocation(line: 1457, column: 25, scope: !1811)
!1823 = !DILocation(line: 1457, column: 42, scope: !1811)
!1824 = !DILocation(line: 1457, column: 51, scope: !1811)
!1825 = !DILocation(line: 1457, column: 50, scope: !1811)
!1826 = !DILocation(line: 1457, column: 39, scope: !1811)
!1827 = !DILocation(line: 1457, column: 13, scope: !1811)
!1828 = !DILocation(line: 1458, column: 11, scope: !1811)
!1829 = !DILocation(line: 1458, column: 4, scope: !1811)
!1830 = !DILocation(line: 1461, column: 1, scope: !1676)
!1831 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1479, type: !1832, scopeLine: 1480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1832 = !DISubroutineType(types: !1833)
!1833 = !{!6, !21, !428}
!1834 = !DILocalVariable(name: "numerator", arg: 1, scope: !1831, file: !69, line: 1479, type: !21)
!1835 = !DILocation(line: 1479, column: 25, scope: !1831)
!1836 = !DILocalVariable(name: "denominator", arg: 2, scope: !1831, file: !69, line: 1479, type: !428)
!1837 = !DILocation(line: 1479, column: 40, scope: !1831)
!1838 = !DILocalVariable(name: "numerator_prime", scope: !1831, file: !69, line: 1482, type: !428)
!1839 = !DILocation(line: 1482, column: 6, scope: !1831)
!1840 = !DILocalVariable(name: "u32Temp1", scope: !1831, file: !69, line: 1482, type: !428)
!1841 = !DILocation(line: 1482, column: 27, scope: !1831)
!1842 = !DILocalVariable(name: "u32Temp2", scope: !1831, file: !69, line: 1482, type: !428)
!1843 = !DILocation(line: 1482, column: 41, scope: !1831)
!1844 = !DILocalVariable(name: "u32Temp3", scope: !1831, file: !69, line: 1482, type: !428)
!1845 = !DILocation(line: 1482, column: 55, scope: !1831)
!1846 = !DILocalVariable(name: "s32Temp1", scope: !1831, file: !69, line: 1483, type: !21)
!1847 = !DILocation(line: 1483, column: 6, scope: !1831)
!1848 = !DILocalVariable(name: "s32Temp2", scope: !1831, file: !69, line: 1483, type: !21)
!1849 = !DILocation(line: 1483, column: 20, scope: !1831)
!1850 = !DILocalVariable(name: "s32Temp3", scope: !1831, file: !69, line: 1483, type: !21)
!1851 = !DILocation(line: 1483, column: 34, scope: !1831)
!1852 = !DILocation(line: 1484, column: 5, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1831, file: !69, line: 1484, column: 5)
!1854 = !DILocation(line: 1484, column: 17, scope: !1853)
!1855 = !DILocation(line: 1484, column: 5, scope: !1831)
!1856 = !DILocation(line: 1486, column: 6, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1858, file: !69, line: 1486, column: 6)
!1858 = distinct !DILexicalBlock(scope: !1853, file: !69, line: 1485, column: 2)
!1859 = !DILocation(line: 1486, column: 15, scope: !1857)
!1860 = !DILocation(line: 1486, column: 6, scope: !1858)
!1861 = !DILocation(line: 1488, column: 4, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1487, column: 3)
!1863 = !DILocation(line: 1492, column: 4, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1491, column: 3)
!1865 = !DILocation(line: 1497, column: 6, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1867, file: !69, line: 1497, column: 6)
!1867 = distinct !DILexicalBlock(scope: !1853, file: !69, line: 1496, column: 2)
!1868 = !DILocation(line: 1497, column: 16, scope: !1866)
!1869 = !DILocation(line: 1497, column: 6, scope: !1867)
!1870 = !DILocation(line: 1499, column: 23, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1866, file: !69, line: 1498, column: 3)
!1872 = !DILocation(line: 1499, column: 22, scope: !1871)
!1873 = !DILocation(line: 1499, column: 20, scope: !1871)
!1874 = !DILocation(line: 1500, column: 16, scope: !1871)
!1875 = !DILocation(line: 1500, column: 32, scope: !1871)
!1876 = !DILocation(line: 1500, column: 31, scope: !1871)
!1877 = !DILocation(line: 1500, column: 13, scope: !1871)
!1878 = !DILocation(line: 1501, column: 15, scope: !1871)
!1879 = !DILocation(line: 1501, column: 34, scope: !1871)
!1880 = !DILocation(line: 1501, column: 45, scope: !1871)
!1881 = !DILocation(line: 1501, column: 43, scope: !1871)
!1882 = !DILocation(line: 1501, column: 31, scope: !1871)
!1883 = !DILocation(line: 1501, column: 13, scope: !1871)
!1884 = !DILocation(line: 1503, column: 8, scope: !1885)
!1885 = distinct !DILexicalBlock(scope: !1871, file: !69, line: 1503, column: 7)
!1886 = !DILocation(line: 1503, column: 20, scope: !1885)
!1887 = !DILocation(line: 1503, column: 27, scope: !1885)
!1888 = !DILocation(line: 1503, column: 7, scope: !1871)
!1889 = !DILocation(line: 1505, column: 19, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1885, file: !69, line: 1504, column: 4)
!1891 = !DILocation(line: 1505, column: 31, scope: !1890)
!1892 = !DILocation(line: 1505, column: 17, scope: !1890)
!1893 = !DILocation(line: 1506, column: 4, scope: !1890)
!1894 = !DILocation(line: 1509, column: 20, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1885, file: !69, line: 1508, column: 4)
!1896 = !DILocation(line: 1509, column: 32, scope: !1895)
!1897 = !DILocation(line: 1509, column: 38, scope: !1895)
!1898 = !DILocation(line: 1509, column: 17, scope: !1895)
!1899 = !DILocation(line: 1512, column: 7, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1871, file: !69, line: 1512, column: 7)
!1901 = !DILocation(line: 1512, column: 18, scope: !1900)
!1902 = !DILocation(line: 1512, column: 16, scope: !1900)
!1903 = !DILocation(line: 1512, column: 7, scope: !1871)
!1904 = !DILocation(line: 1514, column: 18, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1900, file: !69, line: 1513, column: 4)
!1906 = !DILocation(line: 1514, column: 16, scope: !1905)
!1907 = !DILocation(line: 1514, column: 28, scope: !1905)
!1908 = !DILocation(line: 1514, column: 14, scope: !1905)
!1909 = !DILocation(line: 1515, column: 4, scope: !1905)
!1910 = !DILocation(line: 1518, column: 18, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1900, file: !69, line: 1517, column: 4)
!1912 = !DILocation(line: 1518, column: 26, scope: !1911)
!1913 = !DILocation(line: 1518, column: 16, scope: !1911)
!1914 = !DILocation(line: 1518, column: 30, scope: !1911)
!1915 = !DILocation(line: 1518, column: 14, scope: !1911)
!1916 = !DILocation(line: 1520, column: 8, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1871, file: !69, line: 1520, column: 7)
!1918 = !DILocation(line: 1520, column: 18, scope: !1917)
!1919 = !DILocation(line: 1520, column: 7, scope: !1871)
!1920 = !DILocation(line: 1522, column: 18, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1917, file: !69, line: 1521, column: 4)
!1922 = !DILocation(line: 1522, column: 12, scope: !1921)
!1923 = !DILocation(line: 1522, column: 5, scope: !1921)
!1924 = !DILocation(line: 1526, column: 5, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1917, file: !69, line: 1525, column: 4)
!1926 = !DILocation(line: 1531, column: 16, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1866, file: !69, line: 1530, column: 3)
!1928 = !DILocation(line: 1531, column: 26, scope: !1927)
!1929 = !DILocation(line: 1531, column: 25, scope: !1927)
!1930 = !DILocation(line: 1531, column: 41, scope: !1927)
!1931 = !DILocation(line: 1531, column: 39, scope: !1927)
!1932 = !DILocation(line: 1531, column: 13, scope: !1927)
!1933 = !DILocation(line: 1532, column: 16, scope: !1927)
!1934 = !DILocation(line: 1532, column: 30, scope: !1927)
!1935 = !DILocation(line: 1532, column: 40, scope: !1927)
!1936 = !DILocation(line: 1532, column: 39, scope: !1927)
!1937 = !DILocation(line: 1532, column: 55, scope: !1927)
!1938 = !DILocation(line: 1532, column: 53, scope: !1927)
!1939 = !DILocation(line: 1532, column: 26, scope: !1927)
!1940 = !DILocation(line: 1532, column: 68, scope: !1927)
!1941 = !DILocation(line: 1532, column: 13, scope: !1927)
!1942 = !DILocation(line: 1533, column: 16, scope: !1927)
!1943 = !DILocation(line: 1533, column: 25, scope: !1927)
!1944 = !DILocation(line: 1533, column: 24, scope: !1927)
!1945 = !DILocation(line: 1533, column: 41, scope: !1927)
!1946 = !DILocation(line: 1533, column: 51, scope: !1927)
!1947 = !DILocation(line: 1533, column: 50, scope: !1927)
!1948 = !DILocation(line: 1533, column: 38, scope: !1927)
!1949 = !DILocation(line: 1533, column: 13, scope: !1927)
!1950 = !DILocation(line: 1534, column: 7, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1927, file: !69, line: 1534, column: 7)
!1952 = !DILocation(line: 1534, column: 16, scope: !1951)
!1953 = !DILocation(line: 1534, column: 7, scope: !1927)
!1954 = !DILocation(line: 1536, column: 17, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1951, file: !69, line: 1535, column: 4)
!1956 = !DILocation(line: 1536, column: 12, scope: !1955)
!1957 = !DILocation(line: 1536, column: 5, scope: !1955)
!1958 = !DILocation(line: 1540, column: 5, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1951, file: !69, line: 1539, column: 4)
!1960 = !DILocation(line: 1544, column: 1, scope: !1831)
!1961 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1962, file: !1962, line: 12, type: !1963, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1966)
!1962 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1963 = !DISubroutineType(types: !1964)
!1964 = !{null, !1965}
!1965 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1966 = !{!1967}
!1967 = !DILocalVariable(name: "z", arg: 1, scope: !1961, file: !1962, line: 12, type: !1965)
!1968 = !DILocation(line: 0, scope: !1961)
!1969 = !DILocation(line: 13, column: 9, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1961, file: !1962, line: 13, column: 7)
!1971 = !DILocation(line: 13, column: 7, scope: !1961)
!1972 = !DILocation(line: 14, column: 5, scope: !1970)
!1973 = !DILocation(line: 15, column: 1, scope: !1961)
!1974 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1975, file: !1975, line: 20, type: !1976, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1979)
!1975 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1976 = !DISubroutineType(types: !1977)
!1977 = !{null, !1978, !1978}
!1978 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1979 = !{!1980, !1981}
!1980 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1974, file: !1975, line: 20, type: !1978)
!1981 = !DILocalVariable(name: "shift", arg: 2, scope: !1974, file: !1975, line: 20, type: !1978)
!1982 = !DILocation(line: 0, scope: !1974)
!1983 = !DILocation(line: 21, column: 13, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1974, file: !1975, line: 21, column: 7)
!1985 = !DILocation(line: 21, column: 7, scope: !1974)
!1986 = !DILocation(line: 27, column: 5, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1984, file: !1975, line: 21, column: 26)
!1988 = !DILocation(line: 29, column: 1, scope: !1974)
