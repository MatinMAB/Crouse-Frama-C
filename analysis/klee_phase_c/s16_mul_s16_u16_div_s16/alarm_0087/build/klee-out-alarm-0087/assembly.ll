; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087/build/s16_mul_s16_u16_div_s16_alarm_0087.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [129 x i8] c"KLEE-ALARM-0087: signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0087.err\00", align 1
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
  %factor1 = alloca i16, align 2
  %factor2 = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %factor1, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %factor2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i16* %result, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = bitcast i16* %factor1 to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !61
  %1 = bitcast i16* %factor2 to i8*, !dbg !62
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  %2 = bitcast i16* %denominator to i8*, !dbg !64
  call void @klee_make_symbolic(i8* %2, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  %3 = load i16, i16* %factor1, align 2, !dbg !66
  %4 = load i16, i16* %factor2, align 2, !dbg !67
  %5 = load i16, i16* %denominator, align 2, !dbg !68
  %call = call signext i16 @s16_mul_s16_u16_div_s16(i16 signext %3, i16 zeroext %4, i16 signext %5), !dbg !69
  store i16 %call, i16* %result, align 2, !dbg !70
  %6 = load i16, i16* %result, align 2, !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !73 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !85
  %conv = sext i16 %0 to i32, !dbg !85
  %shl = shl i32 %conv, 16, !dbg !86
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !87
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !88
  %conv1 = sext i16 %1 to i32, !dbg !88
  %cmp = icmp eq i32 %conv1, 0, !dbg !90
  br i1 %cmp, label %if.then, label %if.else7, !dbg !91

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !92
  %conv3 = sext i16 %2 to i32, !dbg !92
  %cmp4 = icmp slt i32 %conv3, 0, !dbg !95
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !96

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !97
  br label %return, !dbg !97

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !99
  br label %return, !dbg !99

if.else7:                                         ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !101
  %cmp8 = icmp ne i32 %3, -2147483648, !dbg !104
  br i1 %cmp8, label %if.then10, label %if.else29, !dbg !105

if.then10:                                        ; preds = %if.else7
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !106
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !108
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !109
  %conv11 = sext i16 %6 to i32, !dbg !109
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !110
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !110
  %div = sdiv i32 %5, %conv11, !dbg !110, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !112
  %conv12 = sext i16 %7 to i32, !dbg !112
  %mul = mul nsw i32 %div, %conv12, !dbg !113
  %sub = sub nsw i32 %4, %mul, !dbg !114
  %shl13 = shl i32 %sub, 1, !dbg !115
  store i32 %shl13, i32* %s32Temp2, align 4, !dbg !116
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !117
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !118
  %conv14 = sext i16 %9 to i32, !dbg !118
  %int_cast_to_i641 = zext i32 %conv14 to i64, !dbg !119
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !119
  %div15 = sdiv i32 %8, %conv14, !dbg !119, !klee.check.div !111
  store i32 %div15, i32* %s32Temp1, align 4, !dbg !120
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !121
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !122
  %conv16 = sext i16 %11 to i32, !dbg !122
  %shl17 = shl i32 %conv16, 16, !dbg !123
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !124
  %conv18 = sext i16 %12 to i32, !dbg !124
  %int_cast_to_i642 = zext i32 %conv18 to i64, !dbg !125
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !125
  %div19 = sdiv i32 %shl17, %conv18, !dbg !125, !klee.check.div !111
  %add = add nsw i32 %10, %div19, !dbg !126
  store i32 %add, i32* %s32Temp1, align 4, !dbg !127
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !128
  %cmp20 = icmp slt i32 %13, 32767, !dbg !130
  br i1 %cmp20, label %if.then22, label %if.else28, !dbg !131

if.then22:                                        ; preds = %if.then10
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !132
  %cmp23 = icmp sgt i32 %14, -32768, !dbg !135
  br i1 %cmp23, label %if.then25, label %if.else27, !dbg !136

if.then25:                                        ; preds = %if.then22
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !137
  %conv26 = trunc i32 %15 to i16, !dbg !139
  store i16 %conv26, i16* %retval, align 2, !dbg !140
  br label %return, !dbg !140

if.else27:                                        ; preds = %if.then22
  store i16 -32768, i16* %retval, align 2, !dbg !141
  br label %return, !dbg !141

if.else28:                                        ; preds = %if.then10
  store i16 32767, i16* %retval, align 2, !dbg !143
  br label %return, !dbg !143

if.else29:                                        ; preds = %if.else7
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !145
  %conv30 = sext i16 %16 to i32, !dbg !145
  %cmp31 = icmp ne i32 %conv30, -1, !dbg !148
  br i1 %cmp31, label %if.then33, label %if.else56, !dbg !149

if.then33:                                        ; preds = %if.else29
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !150
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !152
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !153
  %conv34 = sext i16 %19 to i32, !dbg !153
  %int_cast_to_i643 = zext i32 %conv34 to i64, !dbg !154
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !154
  %div35 = sdiv i32 %18, %conv34, !dbg !154, !klee.check.div !111
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !155
  %conv36 = sext i16 %20 to i32, !dbg !155
  %mul37 = mul nsw i32 %div35, %conv36, !dbg !156
  %sub38 = sub nsw i32 %17, %mul37, !dbg !157
  %shl39 = shl i32 %sub38, 1, !dbg !158
  store i32 %shl39, i32* %s32Temp2, align 4, !dbg !159
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !160
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !161
  %conv40 = sext i16 %22 to i32, !dbg !161
  %int_cast_to_i644 = zext i32 %conv40 to i64, !dbg !162
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !162
  %div41 = sdiv i32 %21, %conv40, !dbg !162, !klee.check.div !111
  store i32 %div41, i32* %s32Temp1, align 4, !dbg !163
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !164
  %24 = load i16, i16* %numerator.addr, align 2, !dbg !165
  %conv42 = sext i16 %24 to i32, !dbg !165
  %shl43 = shl i32 %conv42, 16, !dbg !166
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !167
  %conv44 = sext i16 %25 to i32, !dbg !167
  %int_cast_to_i645 = zext i32 %conv44 to i64, !dbg !168
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !168
  %div45 = sdiv i32 %shl43, %conv44, !dbg !168, !klee.check.div !111
  %add46 = add nsw i32 %23, %div45, !dbg !169
  store i32 %add46, i32* %s32Temp1, align 4, !dbg !170
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !171
  %cmp47 = icmp slt i32 %26, 32767, !dbg !173
  br i1 %cmp47, label %if.then49, label %if.else55, !dbg !174

if.then49:                                        ; preds = %if.then33
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !175
  %cmp50 = icmp sgt i32 %27, -32768, !dbg !178
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !179

if.then52:                                        ; preds = %if.then49
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !180
  %conv53 = trunc i32 %28 to i16, !dbg !182
  store i16 %conv53, i16* %retval, align 2, !dbg !183
  br label %return, !dbg !183

if.else54:                                        ; preds = %if.then49
  store i16 -32768, i16* %retval, align 2, !dbg !184
  br label %return, !dbg !184

if.else55:                                        ; preds = %if.then33
  store i16 32767, i16* %retval, align 2, !dbg !186
  br label %return, !dbg !186

if.else56:                                        ; preds = %if.else29
  store i16 32767, i16* %retval, align 2, !dbg !188
  br label %return, !dbg !188

return:                                           ; preds = %if.else56, %if.else55, %if.else54, %if.then52, %if.else28, %if.else27, %if.then25, %if.else, %if.then6
  %29 = load i16, i16* %retval, align 2, !dbg !190
  ret i16 %29, !dbg !190
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !191 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 0, i32* %s32Temp1, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 0, i32* %s32Temp2, align 4, !dbg !201
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !202
  store i32 %0, i32* %s32Temp1, align 4, !dbg !203
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !204
  %conv = sext i16 %1 to i32, !dbg !204
  %cmp = icmp eq i32 %conv, 0, !dbg !206
  br i1 %cmp, label %if.then, label %if.else5, !dbg !207

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !208
  %cmp2 = icmp slt i32 %2, 0, !dbg !211
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !212

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !213
  br label %return, !dbg !213

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !215
  br label %return, !dbg !215

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !217
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !220
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !221

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !222
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !224
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !225
  %conv9 = sext i16 %6 to i32, !dbg !225
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !226
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !226
  %div = sdiv i32 %5, %conv9, !dbg !226, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !227
  %conv10 = sext i16 %7 to i32, !dbg !227
  %mul = mul nsw i32 %div, %conv10, !dbg !228
  %sub = sub nsw i32 %4, %mul, !dbg !229
  %shl = shl i32 %sub, 1, !dbg !230
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !231
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !232
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !233
  %conv11 = sext i16 %9 to i32, !dbg !233
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !234
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !234
  %div12 = sdiv i32 %8, %conv11, !dbg !234, !klee.check.div !111
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !235
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !236
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !237
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !238
  %conv13 = sext i16 %12 to i32, !dbg !238
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !239
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !239
  %div14 = sdiv i32 %11, %conv13, !dbg !239, !klee.check.div !111
  %add = add nsw i32 %10, %div14, !dbg !240
  store i32 %add, i32* %s32Temp1, align 4, !dbg !241
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !242
  %cmp15 = icmp slt i32 %13, 32767, !dbg !244
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !245

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !246
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !249
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !250

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !251
  %conv21 = trunc i32 %15 to i16, !dbg !253
  store i16 %conv21, i16* %retval, align 2, !dbg !254
  br label %return, !dbg !254

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !255
  br label %return, !dbg !255

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !257
  br label %return, !dbg !257

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !259
  %conv25 = sext i16 %16 to i32, !dbg !259
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !262
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !263

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !264
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !266
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !267
  %conv29 = sext i16 %19 to i32, !dbg !267
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !268
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !268
  %div30 = sdiv i32 %18, %conv29, !dbg !268, !klee.check.div !111
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !269
  %conv31 = sext i16 %20 to i32, !dbg !269
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !270
  %sub33 = sub nsw i32 %17, %mul32, !dbg !271
  %shl34 = shl i32 %sub33, 1, !dbg !272
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !273
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !274
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !275
  %conv35 = sext i16 %22 to i32, !dbg !275
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !276
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !276
  %div36 = sdiv i32 %21, %conv35, !dbg !276, !klee.check.div !111
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !277
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !278
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !279
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !280
  %conv37 = sext i16 %25 to i32, !dbg !280
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !281
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !281
  %div38 = sdiv i32 %24, %conv37, !dbg !281, !klee.check.div !111
  %add39 = add nsw i32 %23, %div38, !dbg !282
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !283
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !284
  %cmp40 = icmp slt i32 %26, 32767, !dbg !286
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !287

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !288
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !291
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !292

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !293
  %conv46 = trunc i32 %28 to i16, !dbg !295
  store i16 %conv46, i16* %retval, align 2, !dbg !296
  br label %return, !dbg !296

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !297
  br label %return, !dbg !297

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !299
  br label %return, !dbg !299

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !301
  br label %return, !dbg !301

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !303
  ret i16 %29, !dbg !303
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !304 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !307, metadata !DIExpression()), !dbg !308
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !309, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !311, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !313, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !315, metadata !DIExpression()), !dbg !316
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !317
  %conv = zext i16 %0 to i32, !dbg !317
  %and = and i32 %conv, 65535, !dbg !318
  %conv1 = trunc i32 %and to i16, !dbg !317
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !319
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !320
  %conv2 = sext i16 %1 to i32, !dbg !320
  %shl = shl i32 %conv2, 16, !dbg !321
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !322
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !323
  %conv3 = zext i16 %2 to i32, !dbg !323
  %cmp = icmp eq i32 %conv3, 0, !dbg !325
  br i1 %cmp, label %if.then, label %if.else9, !dbg !326

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !327
  %conv5 = sext i16 %3 to i32, !dbg !327
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !330
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !331

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !332
  br label %return, !dbg !332

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !334
  br label %return, !dbg !334

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !336
  %conv10 = sext i16 %4 to i32, !dbg !336
  %shl11 = shl i32 %conv10, 16, !dbg !338
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !339
  %conv12 = sext i16 %5 to i32, !dbg !339
  %shl13 = shl i32 %conv12, 16, !dbg !340
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !341
  %conv14 = zext i16 %6 to i32, !dbg !341
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !342
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !342
  %div = sdiv i32 %shl13, %conv14, !dbg !342, !klee.check.div !111
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !343
  %conv15 = zext i16 %7 to i32, !dbg !343
  %mul = mul nsw i32 %div, %conv15, !dbg !344
  %sub = sub nsw i32 %shl11, %mul, !dbg !345
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !346
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !347
  %shl16 = shl i32 %8, 1, !dbg !348
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !349
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !350
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !351
  %conv17 = zext i16 %10 to i32, !dbg !351
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !352
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !352
  %div18 = sdiv i32 %9, %conv17, !dbg !352, !klee.check.div !111
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !353
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !354
  %conv19 = sext i16 %11 to i32, !dbg !354
  %shl20 = shl i32 %conv19, 16, !dbg !355
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !356
  %conv21 = zext i16 %12 to i32, !dbg !356
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !357
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !357
  %div22 = sdiv i32 %shl20, %conv21, !dbg !357, !klee.check.div !111
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !358
  %add = add nsw i32 %div22, %13, !dbg !359
  store i32 %add, i32* %s32Temp1, align 4, !dbg !360
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !361
  %cmp23 = icmp slt i32 %14, 32767, !dbg !363
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !364

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !365
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !368
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !369

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !370
  %conv29 = trunc i32 %16 to i16, !dbg !372
  store i16 %conv29, i16* %retval, align 2, !dbg !373
  br label %return, !dbg !373

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !374
  br label %return, !dbg !374

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !376
  br label %return, !dbg !376

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !378
  ret i16 %17, !dbg !378
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !379 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !380, metadata !DIExpression()), !dbg !381
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !382, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !384, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !386, metadata !DIExpression()), !dbg !387
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !388
  %conv = zext i16 %0 to i32, !dbg !388
  %and = and i32 %conv, 65535, !dbg !389
  %conv1 = trunc i32 %and to i16, !dbg !388
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !390
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !391
  %conv2 = zext i16 %1 to i32, !dbg !391
  %cmp = icmp eq i32 %conv2, 0, !dbg !393
  br i1 %cmp, label %if.then, label %if.else8, !dbg !394

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !395
  %conv4 = sext i16 %2 to i32, !dbg !395
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !398
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !399

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !400
  br label %return, !dbg !400

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !402
  br label %return, !dbg !402

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !404
  %conv9 = sext i16 %3 to i32, !dbg !404
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !406
  %conv10 = sext i16 %4 to i32, !dbg !406
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !407
  %conv11 = zext i16 %5 to i32, !dbg !407
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !408
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !408
  %div = sdiv i32 %conv10, %conv11, !dbg !408, !klee.check.div !111
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !409
  %conv12 = zext i16 %6 to i32, !dbg !409
  %mul = mul nsw i32 %div, %conv12, !dbg !410
  %sub = sub nsw i32 %conv9, %mul, !dbg !411
  %shl = shl i32 %sub, 1, !dbg !412
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !413
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !414
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !415
  %conv13 = zext i16 %8 to i32, !dbg !415
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !416
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !416
  %div14 = sdiv i32 %7, %conv13, !dbg !416, !klee.check.div !111
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !417
  %conv15 = sext i16 %9 to i32, !dbg !417
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !418
  %conv16 = zext i16 %10 to i32, !dbg !418
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !419
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !419
  %div17 = sdiv i32 %conv15, %conv16, !dbg !419, !klee.check.div !111
  %add = add nsw i32 %div14, %div17, !dbg !420
  store i32 %add, i32* %s32Temp1, align 4, !dbg !421
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !422
  %conv18 = trunc i32 %11 to i16, !dbg !422
  store i16 %conv18, i16* %retval, align 2, !dbg !423
  br label %return, !dbg !423

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !424
  ret i16 %12, !dbg !424
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !425 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !428, metadata !DIExpression()), !dbg !429
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !430, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !432, metadata !DIExpression()), !dbg !434
  store i32 0, i32* %u32Temp1, align 4, !dbg !434
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !435, metadata !DIExpression()), !dbg !436
  store i32 0, i32* %u32Temp2, align 4, !dbg !436
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !437, metadata !DIExpression()), !dbg !438
  store i32 0, i32* %u32Temp3, align 4, !dbg !438
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !439
  %conv = zext i16 %0 to i32, !dbg !439
  %cmp = icmp eq i32 %conv, 0, !dbg !441
  br i1 %cmp, label %if.then, label %if.else, !dbg !442

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !443
  br label %return, !dbg !443

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !445
  %conv2 = zext i16 %1 to i32, !dbg !445
  %shl = shl i32 %conv2, 16, !dbg !447
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !448
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !449
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !450
  %conv3 = zext i16 %3 to i32, !dbg !450
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !451
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !451
  %div = udiv i32 %2, %conv3, !dbg !451, !klee.check.div !111
  store i32 %div, i32* %u32Temp2, align 4, !dbg !452
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !453
  %add = add i32 %4, 128, !dbg !454
  %shr = lshr i32 %add, 8, !dbg !455
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !456
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !457
  %cmp4 = icmp ult i32 %5, 255, !dbg !459
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !460

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !461
  %conv7 = trunc i32 %6 to i8, !dbg !463
  store i8 %conv7, i8* %retval, align 1, !dbg !464
  br label %return, !dbg !464

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !465
  br label %return, !dbg !465

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !467
  ret i8 %7, !dbg !467
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !468 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !471, metadata !DIExpression()), !dbg !472
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !473, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !475, metadata !DIExpression()), !dbg !476
  store i32 0, i32* %s32Temp1, align 4, !dbg !476
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !477
  %conv = zext i16 %0 to i32, !dbg !477
  %and = and i32 %conv, 65535, !dbg !478
  %conv1 = trunc i32 %and to i16, !dbg !477
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !479
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !480
  %conv2 = zext i16 %1 to i32, !dbg !480
  %and3 = and i32 %conv2, 65535, !dbg !482
  %cmp = icmp eq i32 %and3, 0, !dbg !483
  br i1 %cmp, label %if.then, label %if.else8, !dbg !484

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !485
  %cmp5 = icmp sge i32 %2, 0, !dbg !488
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !489

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !490
  br label %return, !dbg !490

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !492
  br label %return, !dbg !492

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !494
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !496
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !497
  %conv9 = zext i16 %5 to i32, !dbg !497
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !498
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !498
  %div = sdiv i32 %4, %conv9, !dbg !498, !klee.check.div !111
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !499
  %conv10 = zext i16 %6 to i32, !dbg !499
  %mul = mul nsw i32 %div, %conv10, !dbg !500
  %sub = sub nsw i32 %3, %mul, !dbg !501
  %shl = shl i32 %sub, 1, !dbg !502
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !503
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !504
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !505
  %conv11 = zext i16 %8 to i32, !dbg !505
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !506
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !506
  %div12 = sdiv i32 %7, %conv11, !dbg !506, !klee.check.div !111
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !507
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !508
  %conv13 = zext i16 %10 to i32, !dbg !508
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !509
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !509
  %div14 = sdiv i32 %9, %conv13, !dbg !509, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !510
  store i32 %add, i32* %s32Temp1, align 4, !dbg !511
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !512
  %cmp15 = icmp slt i32 %11, 65535, !dbg !514
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !515

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !516
  %cmp18 = icmp sgt i32 %12, 0, !dbg !519
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !520

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !521
  %conv21 = trunc i32 %13 to i16, !dbg !523
  store i16 %conv21, i16* %retval, align 2, !dbg !524
  br label %return, !dbg !524

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !525
  br label %return, !dbg !525

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !527
  br label %return, !dbg !527

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !529
  ret i16 %14, !dbg !529
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !530 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !533, metadata !DIExpression()), !dbg !534
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !535, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !537, metadata !DIExpression()), !dbg !538
  store i32 0, i32* %u32Temp, align 4, !dbg !538
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !539
  %conv = zext i16 %0 to i32, !dbg !539
  %cmp = icmp eq i32 %conv, 0, !dbg !541
  br i1 %cmp, label %if.then, label %if.else, !dbg !542

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !543
  br label %return, !dbg !543

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !545
  %conv2 = zext i16 %1 to i32, !dbg !545
  %shl = shl i32 %conv2, 16, !dbg !547
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !548
  %conv3 = zext i16 %2 to i32, !dbg !548
  %shr = ashr i32 %conv3, 1, !dbg !549
  %add = add nsw i32 %shl, %shr, !dbg !550
  store i32 %add, i32* %u32Temp, align 4, !dbg !551
  %3 = load i32, i32* %u32Temp, align 4, !dbg !552
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !553
  %conv4 = zext i16 %4 to i32, !dbg !553
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !554
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !554
  %div = udiv i32 %3, %conv4, !dbg !554, !klee.check.div !111
  store i32 %div, i32* %u32Temp, align 4, !dbg !555
  %5 = load i32, i32* %u32Temp, align 4, !dbg !556
  %cmp5 = icmp ult i32 %5, 65535, !dbg !558
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !559

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !560
  %and = and i32 %6, 65535, !dbg !562
  %conv8 = trunc i32 %and to i16, !dbg !560
  store i16 %conv8, i16* %retval, align 2, !dbg !563
  br label %return, !dbg !563

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !564
  br label %return, !dbg !564

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !566
  ret i16 %7, !dbg !566
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !567 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !570, metadata !DIExpression()), !dbg !571
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !572, metadata !DIExpression()), !dbg !573
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !574, metadata !DIExpression()), !dbg !575
  store i32 0, i32* %u32Temp1, align 4, !dbg !575
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !576, metadata !DIExpression()), !dbg !577
  store i32 0, i32* %u32Temp2, align 4, !dbg !577
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !578
  %conv = zext i16 %0 to i32, !dbg !578
  %and = and i32 %conv, 65535, !dbg !579
  %conv1 = trunc i32 %and to i16, !dbg !578
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !580
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !581
  %conv2 = zext i16 %1 to i32, !dbg !581
  %cmp = icmp eq i32 %conv2, 0, !dbg !583
  br i1 %cmp, label %if.then, label %if.else, !dbg !584

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !585
  br label %return, !dbg !585

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !587
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !589
  %conv4 = zext i16 %3 to i32, !dbg !589
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !590
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !590
  %div = udiv i32 %2, %conv4, !dbg !590, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !591
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !592
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !593
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !594
  %conv5 = zext i16 %6 to i32, !dbg !594
  %mul = mul i32 %5, %conv5, !dbg !595
  %sub = sub i32 %4, %mul, !dbg !596
  %shl = shl i32 %sub, 1, !dbg !597
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !598
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !599
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !600
  %conv6 = zext i16 %8 to i32, !dbg !600
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !601
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !601
  %div7 = udiv i32 %7, %conv6, !dbg !601, !klee.check.div !111
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !602
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !603
  %conv8 = zext i16 %10 to i32, !dbg !603
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !604
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !604
  %div9 = udiv i32 %9, %conv8, !dbg !604, !klee.check.div !111
  %add = add i32 %div7, %div9, !dbg !605
  store i32 %add, i32* %u32Temp2, align 4, !dbg !606
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !607
  %cmp10 = icmp ult i32 %11, 65535, !dbg !609
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !610

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !611
  %and13 = and i32 %12, 65535, !dbg !613
  %conv14 = trunc i32 %and13 to i16, !dbg !611
  store i16 %conv14, i16* %retval, align 2, !dbg !614
  br label %return, !dbg !614

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !615
  br label %return, !dbg !615

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !617
  ret i16 %13, !dbg !617
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !618 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !621, metadata !DIExpression()), !dbg !622
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !623, metadata !DIExpression()), !dbg !624
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !625, metadata !DIExpression()), !dbg !626
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !627, metadata !DIExpression()), !dbg !628
  store i32 0, i32* %s32Result, align 4, !dbg !628
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !629, metadata !DIExpression()), !dbg !630
  store i32 0, i32* %s32Temp1, align 4, !dbg !630
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !631
  %conv = sext i16 %0 to i32, !dbg !631
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !632
  %conv1 = zext i16 %1 to i32, !dbg !632
  %mul = mul nsw i32 %conv, %conv1, !dbg !633
  store i32 %mul, i32* %s32Result, align 4, !dbg !634
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !635
  %conv2 = sext i16 %2 to i32, !dbg !635
  %cmp = icmp eq i32 %conv2, 0, !dbg !637
  br i1 %cmp, label %if.then, label %if.else7, !dbg !638

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !639
  %cmp4 = icmp slt i32 %3, 0, !dbg !642
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !643

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !644
  br label %return, !dbg !644

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !646
  br label %return, !dbg !646

if.else7:                                         ; preds = %entry
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !648
  %conv8 = sext i16 %4 to i64, !dbg !651
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv8), !dbg !652
  %tobool = icmp ne i32 %call, 0, !dbg !652
  br i1 %tobool, label %if.end, label %if.then9, !dbg !653

if.then9:                                         ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !654
  br label %return, !dbg !654

if.end:                                           ; preds = %if.else7
  %5 = load i32, i32* %s32Result, align 4, !dbg !656
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !658
  %conv10 = sext i16 %6 to i32, !dbg !659
  %int_cast_to_i64 = zext i32 %conv10 to i64, !dbg !660
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !660
  %div = sdiv i32 %5, %conv10, !dbg !660, !klee.check.div !111
  %conv11 = sext i32 %div to i64, !dbg !661
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !662
  %conv12 = sext i16 %7 to i32, !dbg !663
  %conv13 = sext i32 %conv12 to i64, !dbg !664
  %call14 = call i32 @klee_alarm_s32_mul_upper(i64 %conv11, i64 %conv13), !dbg !665
  %tobool15 = icmp ne i32 %call14, 0, !dbg !665
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !666

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !667
  br label %return, !dbg !667

if.end17:                                         ; preds = %if.end
  %8 = load i32, i32* %s32Result, align 4, !dbg !669
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !671
  %conv18 = sext i16 %9 to i32, !dbg !672
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !673
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !673
  %div19 = sdiv i32 %8, %conv18, !dbg !673, !klee.check.div !111
  %conv20 = sext i32 %div19 to i64, !dbg !674
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !675
  %conv21 = sext i16 %10 to i32, !dbg !676
  %conv22 = sext i32 %conv21 to i64, !dbg !677
  %call23 = call i32 @klee_alarm_s32_mul_lower(i64 %conv20, i64 %conv22), !dbg !678
  %tobool24 = icmp ne i32 %call23, 0, !dbg !678
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !679

if.then25:                                        ; preds = %if.end17
  store i16 0, i16* %retval, align 2, !dbg !680
  br label %return, !dbg !680

if.end26:                                         ; preds = %if.end17
  %11 = load i32, i32* %s32Result, align 4, !dbg !682
  %12 = load i32, i32* %s32Result, align 4, !dbg !683
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !684
  %conv27 = sext i16 %13 to i32, !dbg !684
  %int_cast_to_i642 = zext i32 %conv27 to i64, !dbg !685
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !685
  %div28 = sdiv i32 %12, %conv27, !dbg !685, !klee.check.div !111
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !686
  %conv29 = sext i16 %14 to i32, !dbg !686
  %mul30 = mul nsw i32 %div28, %conv29, !dbg !687
  %sub = sub nsw i32 %11, %mul30, !dbg !688
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !689
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !690
  %conv31 = sext i32 %15 to i64, !dbg !692
  %call32 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv31), !dbg !693
  %tobool33 = icmp ne i32 %call32, 0, !dbg !693
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !694

if.then34:                                        ; preds = %if.end26
  store i16 0, i16* %retval, align 2, !dbg !695
  br label %return, !dbg !695

if.end35:                                         ; preds = %if.end26
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !697
  %conv36 = sext i32 %16 to i64, !dbg !699
  %call37 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv36, i32 1), !dbg !700
  %tobool38 = icmp ne i32 %call37, 0, !dbg !700
  br i1 %tobool38, label %if.end40, label %if.then39, !dbg !701

if.then39:                                        ; preds = %if.end35
  store i16 0, i16* %retval, align 2, !dbg !702
  br label %return, !dbg !702

if.end40:                                         ; preds = %if.end35
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !704
  %shl = shl i32 %17, 1, !dbg !705
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !706
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !707
  %conv41 = sext i16 %18 to i64, !dbg !709
  %call42 = call i32 @klee_alarm_divisor_nonzero(i64 %conv41), !dbg !710
  %tobool43 = icmp ne i32 %call42, 0, !dbg !710
  br i1 %tobool43, label %if.end45, label %if.then44, !dbg !711

if.then44:                                        ; preds = %if.end40
  store i16 0, i16* %retval, align 2, !dbg !712
  br label %return, !dbg !712

if.end45:                                         ; preds = %if.end40
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !714
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !716
  %conv46 = sext i16 %20 to i32, !dbg !717
  %int_cast_to_i643 = zext i32 %conv46 to i64, !dbg !718
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !718
  %div47 = sdiv i32 %19, %conv46, !dbg !718, !klee.check.div !111
  %conv48 = sext i32 %div47 to i64, !dbg !719
  %21 = load i32, i32* %s32Result, align 4, !dbg !720
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !721
  %conv49 = sext i16 %22 to i32, !dbg !722
  %int_cast_to_i644 = zext i32 %conv49 to i64, !dbg !723
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !723
  %div50 = sdiv i32 %21, %conv49, !dbg !723, !klee.check.div !111
  %conv51 = sext i32 %div50 to i64, !dbg !724
  %call52 = call i32 @klee_alarm_s32_add_lower(i64 %conv48, i64 %conv51), !dbg !725
  %tobool53 = icmp ne i32 %call52, 0, !dbg !725
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !726

if.then54:                                        ; preds = %if.end45
  store i16 0, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

if.end55:                                         ; preds = %if.end45
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !729
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !731
  %conv56 = sext i16 %24 to i32, !dbg !732
  %int_cast_to_i645 = zext i32 %conv56 to i64, !dbg !733
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !733
  %div57 = sdiv i32 %23, %conv56, !dbg !733, !klee.check.div !111
  %conv58 = sext i32 %div57 to i64, !dbg !734
  %25 = load i32, i32* %s32Result, align 4, !dbg !735
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !736
  %conv59 = sext i16 %26 to i32, !dbg !737
  %int_cast_to_i646 = zext i32 %conv59 to i64, !dbg !738
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !738
  %div60 = sdiv i32 %25, %conv59, !dbg !738, !klee.check.div !111
  %conv61 = sext i32 %div60 to i64, !dbg !739
  %call62 = call i32 @klee_alarm_s32_add_upper(i64 %conv58, i64 %conv61), !dbg !740
  %tobool63 = icmp ne i32 %call62, 0, !dbg !740
  br i1 %tobool63, label %if.end65, label %if.then64, !dbg !741

if.then64:                                        ; preds = %if.end55
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 662, i8* getelementptr inbounds ([129 x i8], [129 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !742
  unreachable, !dbg !742

if.end65:                                         ; preds = %if.end55
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !744
  %28 = load i16, i16* %denominator.addr, align 2, !dbg !745
  %conv66 = sext i16 %28 to i32, !dbg !746
  %int_cast_to_i647 = zext i32 %conv66 to i64, !dbg !747
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !747
  %div67 = sdiv i32 %27, %conv66, !dbg !747, !klee.check.div !111
  %29 = load i32, i32* %s32Result, align 4, !dbg !748
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !749
  %conv68 = sext i16 %30 to i32, !dbg !750
  %int_cast_to_i648 = zext i32 %conv68 to i64, !dbg !751
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !751
  %div69 = sdiv i32 %29, %conv68, !dbg !751, !klee.check.div !111
  %add = add nsw i32 %div67, %div69, !dbg !752
  %conv70 = sext i32 %add to i64, !dbg !753
  store volatile i64 %conv70, i64* @klee_alarm_sink_s64, align 8, !dbg !754
  store i16 0, i16* %retval, align 2, !dbg !755
  br label %return, !dbg !755

return:                                           ; preds = %if.end65, %if.then54, %if.then44, %if.then39, %if.then34, %if.then25, %if.then16, %if.then9, %if.else, %if.then6
  %31 = load i16, i16* %retval, align 2, !dbg !756
  ret i16 %31, !dbg !756
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !757 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !760, metadata !DIExpression()), !dbg !761
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !762
  %cmp = icmp ne i64 %0, 0, !dbg !763
  %conv = zext i1 %cmp to i32, !dbg !763
  ret i32 %conv, !dbg !764
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !765 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !768, metadata !DIExpression()), !dbg !769
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !770, metadata !DIExpression()), !dbg !771
  %0 = load i64, i64* %left.addr, align 8, !dbg !772
  %1 = load i64, i64* %right.addr, align 8, !dbg !773
  %mul = mul nsw i64 %0, %1, !dbg !774
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !775
  %conv = zext i1 %cmp to i32, !dbg !775
  ret i32 %conv, !dbg !776
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !777 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !778, metadata !DIExpression()), !dbg !779
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !780, metadata !DIExpression()), !dbg !781
  %0 = load i64, i64* %left.addr, align 8, !dbg !782
  %1 = load i64, i64* %right.addr, align 8, !dbg !783
  %mul = mul nsw i64 %0, %1, !dbg !784
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !785
  %conv = zext i1 %cmp to i32, !dbg !785
  ret i32 %conv, !dbg !786
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !787 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !788, metadata !DIExpression()), !dbg !789
  %0 = load i64, i64* %left.addr, align 8, !dbg !790
  %cmp = icmp sge i64 %0, 0, !dbg !791
  %conv = zext i1 %cmp to i32, !dbg !791
  ret i32 %conv, !dbg !792
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !793 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !796, metadata !DIExpression()), !dbg !797
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !798, metadata !DIExpression()), !dbg !799
  %0 = load i32, i32* %count.addr, align 4, !dbg !800
  %cmp = icmp uge i32 %0, 63, !dbg !802
  br i1 %cmp, label %if.then, label %if.end, !dbg !803

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !804
  br label %return, !dbg !804

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !806
  %2 = load i32, i32* %count.addr, align 4, !dbg !807
  %sh_prom = zext i32 %2 to i64, !dbg !808
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !808
  %shl = shl i64 1, %sh_prom, !dbg !808, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !809
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !810
  %conv = zext i1 %cmp1 to i32, !dbg !810
  store i32 %conv, i32* %retval, align 4, !dbg !811
  br label %return, !dbg !811

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !812
  ret i32 %3, !dbg !812
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !813 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !814, metadata !DIExpression()), !dbg !815
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !816, metadata !DIExpression()), !dbg !817
  %0 = load i64, i64* %left.addr, align 8, !dbg !818
  %1 = load i64, i64* %right.addr, align 8, !dbg !819
  %add = add nsw i64 %0, %1, !dbg !820
  %cmp = icmp sge i64 %add, -2147483648, !dbg !821
  %conv = zext i1 %cmp to i32, !dbg !821
  ret i32 %conv, !dbg !822
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !823 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !824, metadata !DIExpression()), !dbg !825
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !826, metadata !DIExpression()), !dbg !827
  %0 = load i64, i64* %left.addr, align 8, !dbg !828
  %1 = load i64, i64* %right.addr, align 8, !dbg !829
  %add = add nsw i64 %0, %1, !dbg !830
  %cmp = icmp sle i64 %add, 2147483647, !dbg !831
  %conv = zext i1 %cmp to i32, !dbg !831
  ret i32 %conv, !dbg !832
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !833 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !836, metadata !DIExpression()), !dbg !837
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !838, metadata !DIExpression()), !dbg !839
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !840, metadata !DIExpression()), !dbg !841
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !842, metadata !DIExpression()), !dbg !843
  store i32 0, i32* %s32Result, align 4, !dbg !843
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !844, metadata !DIExpression()), !dbg !845
  store i32 0, i32* %s32Temp1, align 4, !dbg !845
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !846
  %conv = zext i16 %0 to i32, !dbg !846
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !847
  %conv1 = sext i16 %1 to i32, !dbg !847
  %mul = mul nsw i32 %conv, %conv1, !dbg !848
  store i32 %mul, i32* %s32Result, align 4, !dbg !849
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !850
  %conv2 = zext i16 %2 to i32, !dbg !850
  %cmp = icmp eq i32 %conv2, 0, !dbg !852
  br i1 %cmp, label %if.then, label %if.else7, !dbg !853

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !854
  %cmp4 = icmp slt i32 %3, 0, !dbg !857
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !858

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !859
  br label %return, !dbg !859

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !861
  br label %return, !dbg !861

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !863
  %5 = load i32, i32* %s32Result, align 4, !dbg !865
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !866
  %conv8 = zext i16 %6 to i32, !dbg !866
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !867
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !867
  %div = sdiv i32 %5, %conv8, !dbg !867, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !868
  %conv9 = zext i16 %7 to i32, !dbg !868
  %mul10 = mul nsw i32 %div, %conv9, !dbg !869
  %sub = sub nsw i32 %4, %mul10, !dbg !870
  %shl = shl i32 %sub, 1, !dbg !871
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !872
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !873
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !874
  %conv11 = zext i16 %9 to i32, !dbg !874
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !875
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !875
  %div12 = sdiv i32 %8, %conv11, !dbg !875, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !876
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !877
  %conv13 = zext i16 %11 to i32, !dbg !877
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !878
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !878
  %div14 = sdiv i32 %10, %conv13, !dbg !878, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !879
  store i32 %add, i32* %s32Result, align 4, !dbg !880
  %12 = load i32, i32* %s32Result, align 4, !dbg !881
  %cmp15 = icmp slt i32 %12, 32767, !dbg !883
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !884

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !885
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !888
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !889

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !890
  %conv21 = trunc i32 %14 to i16, !dbg !892
  store i16 %conv21, i16* %retval, align 2, !dbg !893
  br label %return, !dbg !893

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !894
  br label %return, !dbg !894

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !898
  ret i16 %15, !dbg !898
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !899 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !902, metadata !DIExpression()), !dbg !903
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !904, metadata !DIExpression()), !dbg !905
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !906, metadata !DIExpression()), !dbg !907
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !908, metadata !DIExpression()), !dbg !909
  store i32 0, i32* %u32Result, align 4, !dbg !909
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !910, metadata !DIExpression()), !dbg !911
  store i32 0, i32* %u32Temp1, align 4, !dbg !911
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !912, metadata !DIExpression()), !dbg !913
  store i32 0, i32* %s32Result, align 4, !dbg !913
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !914, metadata !DIExpression()), !dbg !915
  store i32 0, i32* %s32Temp1, align 4, !dbg !915
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !916
  %conv = sext i16 %0 to i32, !dbg !916
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !917
  %conv1 = zext i16 %1 to i32, !dbg !917
  %mul = mul nsw i32 %conv, %conv1, !dbg !918
  store i32 %mul, i32* %s32Result, align 4, !dbg !919
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !920
  %conv2 = sext i16 %2 to i32, !dbg !920
  %cmp = icmp eq i32 %conv2, 0, !dbg !922
  br i1 %cmp, label %if.then, label %if.else7, !dbg !923

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !924
  %cmp4 = icmp sge i32 %3, 0, !dbg !927
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !928

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !929
  br label %return, !dbg !929

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !931
  br label %return, !dbg !931

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !933
  %5 = load i32, i32* %s32Result, align 4, !dbg !935
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !936
  %conv8 = sext i16 %6 to i32, !dbg !936
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !937
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !937
  %div = sdiv i32 %5, %conv8, !dbg !937, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !938
  %conv9 = sext i16 %7 to i32, !dbg !938
  %mul10 = mul nsw i32 %div, %conv9, !dbg !939
  %sub = sub nsw i32 %4, %mul10, !dbg !940
  %shl = shl i32 %sub, 1, !dbg !941
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !942
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !943
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !944
  %conv11 = sext i16 %9 to i32, !dbg !944
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !945
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !945
  %div12 = sdiv i32 %8, %conv11, !dbg !945, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !946
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !947
  %conv13 = sext i16 %11 to i32, !dbg !947
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !948
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !948
  %div14 = sdiv i32 %10, %conv13, !dbg !948, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !949
  store i32 %add, i32* %s32Result, align 4, !dbg !950
  %12 = load i32, i32* %s32Result, align 4, !dbg !951
  %cmp15 = icmp slt i32 %12, 65535, !dbg !953
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !954

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !955
  %cmp18 = icmp sgt i32 %13, 0, !dbg !958
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !959

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !960
  %conv21 = trunc i32 %14 to i16, !dbg !962
  store i16 %conv21, i16* %retval, align 2, !dbg !963
  br label %return, !dbg !963

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !964
  br label %return, !dbg !964

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !968
  ret i16 %15, !dbg !968
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !969 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !972, metadata !DIExpression()), !dbg !973
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !974, metadata !DIExpression()), !dbg !975
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !976, metadata !DIExpression()), !dbg !977
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !978, metadata !DIExpression()), !dbg !979
  store i32 0, i32* %s32Result, align 4, !dbg !979
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !980, metadata !DIExpression()), !dbg !981
  store i32 0, i32* %s32Temp1, align 4, !dbg !981
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !982
  %conv = sext i16 %0 to i32, !dbg !982
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !983
  %conv1 = zext i16 %1 to i32, !dbg !983
  %mul = mul nsw i32 %conv, %conv1, !dbg !984
  store i32 %mul, i32* %s32Result, align 4, !dbg !985
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !986
  %conv2 = zext i16 %2 to i32, !dbg !986
  %cmp = icmp eq i32 %conv2, 0, !dbg !988
  br i1 %cmp, label %if.then, label %if.else7, !dbg !989

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !990
  %cmp4 = icmp sge i32 %3, 0, !dbg !993
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !994

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !995
  br label %return, !dbg !995

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !997
  br label %return, !dbg !997

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !999
  %5 = load i32, i32* %s32Result, align 4, !dbg !1001
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1002
  %conv8 = zext i16 %6 to i32, !dbg !1002
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1003
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1003
  %div = sdiv i32 %5, %conv8, !dbg !1003, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1004
  %conv9 = zext i16 %7 to i32, !dbg !1004
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1005
  %sub = sub nsw i32 %4, %mul10, !dbg !1006
  %shl = shl i32 %sub, 1, !dbg !1007
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1008
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1009
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1010
  %conv11 = zext i16 %9 to i32, !dbg !1010
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1011
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1011
  %div12 = sdiv i32 %8, %conv11, !dbg !1011, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !1012
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1013
  %conv13 = zext i16 %11 to i32, !dbg !1013
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1014
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1014
  %div14 = sdiv i32 %10, %conv13, !dbg !1014, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !1015
  store i32 %add, i32* %s32Result, align 4, !dbg !1016
  %12 = load i32, i32* %s32Result, align 4, !dbg !1017
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1019
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1020

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1021
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1024
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1025

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1026
  %conv21 = trunc i32 %14 to i16, !dbg !1028
  store i16 %conv21, i16* %retval, align 2, !dbg !1029
  br label %return, !dbg !1029

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1030
  br label %return, !dbg !1030

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1032
  br label %return, !dbg !1032

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1034
  ret i16 %15, !dbg !1034
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1035 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1038, metadata !DIExpression()), !dbg !1039
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1040, metadata !DIExpression()), !dbg !1041
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1044, metadata !DIExpression()), !dbg !1045
  store i32 0, i32* %u32Temp1, align 4, !dbg !1045
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1046, metadata !DIExpression()), !dbg !1047
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1047
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1048
  %conv = zext i16 %0 to i32, !dbg !1048
  %cmp = icmp eq i32 %conv, 0, !dbg !1050
  br i1 %cmp, label %if.then, label %if.else, !dbg !1051

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1052
  br label %return, !dbg !1052

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1054
  %conv2 = zext i16 %1 to i32, !dbg !1054
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1056
  %conv3 = zext i16 %2 to i32, !dbg !1056
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1057
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1058
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1059
  %conv4 = zext i16 %3 to i32, !dbg !1059
  %shr = ashr i32 %conv4, 1, !dbg !1060
  %conv5 = trunc i32 %shr to i16, !dbg !1059
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1061
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1062
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1063
  %conv6 = zext i16 %5 to i32, !dbg !1063
  %add = add i32 %4, %conv6, !dbg !1064
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1065
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1066
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1067
  %conv7 = zext i16 %7 to i32, !dbg !1067
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1068
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1068
  %div = udiv i32 %6, %conv7, !dbg !1068, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1069
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1070
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1072
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1073

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1074
  %and = and i32 %9, 65535, !dbg !1076
  %conv11 = trunc i32 %and to i16, !dbg !1077
  store i16 %conv11, i16* %retval, align 2, !dbg !1078
  br label %return, !dbg !1078

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1079
  br label %return, !dbg !1079

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1081
  ret i16 %10, !dbg !1081
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1082 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1087, metadata !DIExpression()), !dbg !1088
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1089, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1091, metadata !DIExpression()), !dbg !1092
  store i32 0, i32* %u32Temp1, align 4, !dbg !1092
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1093
  %cmp = icmp eq i32 %0, 0, !dbg !1095
  br i1 %cmp, label %if.then, label %if.else, !dbg !1096

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1097
  br label %return, !dbg !1097

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1099
  %conv = zext i16 %1 to i32, !dbg !1099
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1101
  %conv1 = zext i16 %2 to i32, !dbg !1101
  %mul = mul nsw i32 %conv, %conv1, !dbg !1102
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1103
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1104
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1104
  %div = udiv i32 %mul, %3, !dbg !1104, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1105
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1106
  %conv2 = zext i16 %4 to i32, !dbg !1106
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1108
  %conv3 = zext i16 %5 to i32, !dbg !1108
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1109
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1110
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1111
  %mul5 = mul i32 %6, %7, !dbg !1112
  %sub = sub i32 %mul4, %mul5, !dbg !1113
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1114
  %div6 = udiv i32 %8, 2, !dbg !1115
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1116
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1117

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1118
  %inc = add i32 %9, 1, !dbg !1118
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1118
  br label %if.end, !dbg !1120

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1121
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1123
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1124

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1125
  %and = and i32 %11, 65535, !dbg !1127
  %conv13 = trunc i32 %and to i16, !dbg !1128
  store i16 %conv13, i16* %retval, align 2, !dbg !1129
  br label %return, !dbg !1129

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1130
  br label %return, !dbg !1130

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1132
  ret i16 %12, !dbg !1132
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1133 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1136, metadata !DIExpression()), !dbg !1137
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1140, metadata !DIExpression()), !dbg !1141
  store i32 0, i32* %u32Temp1, align 4, !dbg !1141
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1142
  %conv = zext i16 %0 to i32, !dbg !1142
  %cmp = icmp eq i32 %conv, 0, !dbg !1144
  br i1 %cmp, label %if.then, label %if.else, !dbg !1145

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1146
  br label %return, !dbg !1146

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1148
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1150
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1151
  %conv2 = zext i16 %3 to i32, !dbg !1151
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1152
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1152
  %div = udiv i32 %2, %conv2, !dbg !1152, !klee.check.div !111
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1153
  %conv3 = zext i16 %4 to i32, !dbg !1153
  %mul = mul i32 %div, %conv3, !dbg !1154
  %sub = sub i32 %1, %mul, !dbg !1155
  %shl = shl i32 %sub, 1, !dbg !1156
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1157
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1158
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1159
  %conv4 = zext i16 %6 to i32, !dbg !1159
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1160
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1160
  %div5 = udiv i32 %5, %conv4, !dbg !1160, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1161
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1162
  %conv6 = zext i16 %8 to i32, !dbg !1162
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1163
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1163
  %div7 = udiv i32 %7, %conv6, !dbg !1163, !klee.check.div !111
  %add = add i32 %div5, %div7, !dbg !1164
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1165
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1166
  store i32 %9, i32* %retval, align 4, !dbg !1167
  br label %return, !dbg !1167

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1168
  ret i32 %10, !dbg !1168
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1169 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1172, metadata !DIExpression()), !dbg !1173
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1174, metadata !DIExpression()), !dbg !1175
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1176, metadata !DIExpression()), !dbg !1177
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1178, metadata !DIExpression()), !dbg !1179
  store i32 0, i32* %s32Temp1, align 4, !dbg !1179
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1180, metadata !DIExpression()), !dbg !1181
  store i32 0, i32* %s32Temp2, align 4, !dbg !1181
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1182, metadata !DIExpression()), !dbg !1183
  store i32 0, i32* %s32Temp3, align 4, !dbg !1183
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1184
  %conv = sext i16 %0 to i32, !dbg !1184
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1185
  %conv1 = sext i16 %1 to i32, !dbg !1185
  %mul = mul nsw i32 %conv, %conv1, !dbg !1186
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1187
  %2 = load i16, i16* %div.addr, align 2, !dbg !1188
  %conv2 = sext i16 %2 to i32, !dbg !1188
  %cmp = icmp eq i32 %conv2, 0, !dbg !1190
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1191

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1192
  %cmp4 = icmp slt i32 %3, 0, !dbg !1195
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1196

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1197
  br label %return, !dbg !1197

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1199
  br label %return, !dbg !1199

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1201
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1203
  %6 = load i16, i16* %div.addr, align 2, !dbg !1204
  %conv8 = sext i16 %6 to i32, !dbg !1204
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1205
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1205
  %div9 = sdiv i32 %5, %conv8, !dbg !1205, !klee.check.div !111
  %7 = load i16, i16* %div.addr, align 2, !dbg !1206
  %conv10 = sext i16 %7 to i32, !dbg !1206
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1207
  %sub = sub nsw i32 %4, %mul11, !dbg !1208
  %shl = shl i32 %sub, 1, !dbg !1209
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1210
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1211
  %9 = load i16, i16* %div.addr, align 2, !dbg !1212
  %conv12 = sext i16 %9 to i32, !dbg !1212
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1213
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1213
  %div13 = sdiv i32 %8, %conv12, !dbg !1213, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1214
  %11 = load i16, i16* %div.addr, align 2, !dbg !1215
  %conv14 = sext i16 %11 to i32, !dbg !1215
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1216
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1216
  %div15 = sdiv i32 %10, %conv14, !dbg !1216, !klee.check.div !111
  %add = add nsw i32 %div13, %div15, !dbg !1217
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1218
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1219
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1221
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1222

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1223
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1226
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1227

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1228
  %conv22 = trunc i32 %14 to i16, !dbg !1230
  store i16 %conv22, i16* %retval, align 2, !dbg !1231
  br label %return, !dbg !1231

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1232
  br label %return, !dbg !1232

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1234
  br label %return, !dbg !1234

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1236
  ret i16 %15, !dbg !1236
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1237 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1240, metadata !DIExpression()), !dbg !1241
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1242, metadata !DIExpression()), !dbg !1243
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1244, metadata !DIExpression()), !dbg !1245
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1246, metadata !DIExpression()), !dbg !1247
  store i32 0, i32* %s32Result, align 4, !dbg !1247
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1248, metadata !DIExpression()), !dbg !1249
  store i32 0, i32* %s32Temp1, align 4, !dbg !1249
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1250
  %conv = sext i16 %0 to i32, !dbg !1250
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1251
  %conv1 = sext i16 %1 to i32, !dbg !1251
  %mul = mul nsw i32 %conv, %conv1, !dbg !1252
  store i32 %mul, i32* %s32Result, align 4, !dbg !1253
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1254
  %conv2 = zext i16 %2 to i32, !dbg !1254
  %cmp = icmp eq i32 %conv2, 0, !dbg !1256
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1257

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1258
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1261
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1262

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1263
  br label %return, !dbg !1263

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1265
  %cmp7 = icmp eq i32 %4, 0, !dbg !1267
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1268

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1269
  br label %return, !dbg !1269

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1271
  br label %return, !dbg !1271

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1273
  %6 = load i32, i32* %s32Result, align 4, !dbg !1275
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1276
  %conv12 = zext i16 %7 to i32, !dbg !1276
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1277
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1277
  %div = sdiv i32 %6, %conv12, !dbg !1277, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1278
  %conv13 = zext i16 %8 to i32, !dbg !1278
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1279
  %sub = sub nsw i32 %5, %mul14, !dbg !1280
  %shl = shl i32 %sub, 1, !dbg !1281
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1282
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1283
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1284
  %conv15 = zext i16 %10 to i32, !dbg !1284
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1285
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1285
  %div16 = sdiv i32 %9, %conv15, !dbg !1285, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1286
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1287
  %conv17 = zext i16 %12 to i32, !dbg !1287
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1288
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1288
  %div18 = sdiv i32 %11, %conv17, !dbg !1288, !klee.check.div !111
  %add = add nsw i32 %div16, %div18, !dbg !1289
  store i32 %add, i32* %s32Result, align 4, !dbg !1290
  %13 = load i32, i32* %s32Result, align 4, !dbg !1291
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1293
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1294

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1295
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1298
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1299

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1300
  %conv25 = trunc i32 %15 to i16, !dbg !1302
  store i16 %conv25, i16* %retval, align 2, !dbg !1303
  br label %return, !dbg !1303

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1304
  br label %return, !dbg !1304

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1306
  br label %return, !dbg !1306

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1308
  ret i16 %16, !dbg !1308
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1309 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1312, metadata !DIExpression()), !dbg !1313
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1314, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1316, metadata !DIExpression()), !dbg !1317
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %cmp = icmp eq i32 %0, 0, !dbg !1320
  br i1 %cmp, label %if.then, label %if.else, !dbg !1321

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1322
  br label %return, !dbg !1322

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1324
  %cmp1 = icmp sle i32 %1, 0, !dbg !1327
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1328

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1329
  br label %return, !dbg !1329

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1331
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1333
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1335
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1335
  %div = udiv i32 %3, %4, !dbg !1335, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1336
  %mul = mul i32 %div, %5, !dbg !1337
  %sub = sub i32 %2, %mul, !dbg !1338
  %shl = shl i32 %sub, 1, !dbg !1339
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1340
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1341
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1342
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1343
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1343
  %div4 = udiv i32 %6, %7, !dbg !1343, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1344
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1345
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1346
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1346
  %div5 = udiv i32 %8, %9, !dbg !1346, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1347
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1348
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1349
  store i32 %10, i32* %retval, align 4, !dbg !1350
  br label %return, !dbg !1350

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1351
  ret i32 %11, !dbg !1351
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1352 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1355, metadata !DIExpression()), !dbg !1356
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1357, metadata !DIExpression()), !dbg !1358
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1359, metadata !DIExpression()), !dbg !1360
  store i32 0, i32* %s32Temp1, align 4, !dbg !1360
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1361
  %cmp = icmp eq i32 %0, 0, !dbg !1363
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1364

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1365
  %cmp1 = icmp sge i32 %1, 0, !dbg !1368
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1369

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1370
  br label %return, !dbg !1370

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1372
  br label %return, !dbg !1372

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1374
  %cmp4 = icmp sge i32 %2, 0, !dbg !1377
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1378

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1379
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1382
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1383
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1383
  %div = udiv i32 %4, %5, !dbg !1383, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1384
  %mul = mul i32 %div, %6, !dbg !1385
  %sub = sub i32 %3, %mul, !dbg !1386
  %shl = shl i32 %sub, 1, !dbg !1387
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1388
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1389
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1391
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1391
  %div6 = udiv i32 %7, %8, !dbg !1391, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1392
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1393
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1394
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1394
  %div7 = udiv i32 %9, %10, !dbg !1394, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1395
  store i32 %add, i32* %retval, align 4, !dbg !1396
  br label %return, !dbg !1396

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1397
  br label %return, !dbg !1397

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1399
  ret i32 %11, !dbg !1399
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1400 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1403, metadata !DIExpression()), !dbg !1404
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1405, metadata !DIExpression()), !dbg !1406
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1407, metadata !DIExpression()), !dbg !1408
  store i32 0, i32* %u32Temp1, align 4, !dbg !1408
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1409, metadata !DIExpression()), !dbg !1410
  store i32 0, i32* %u32Temp2, align 4, !dbg !1410
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1411
  %cmp = icmp eq i32 %0, 0, !dbg !1413
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1414

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1415
  %cmp1 = icmp slt i32 %1, 0, !dbg !1418
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1419

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1420
  br label %return, !dbg !1420

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1422
  br label %return, !dbg !1422

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1424
  %cmp4 = icmp sge i32 %2, 0, !dbg !1427
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1428

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1429
  %cmp6 = icmp eq i32 %3, 0, !dbg !1432
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1433

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1434
  br label %return, !dbg !1434

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1436
  %cmp9 = icmp sle i32 %4, 0, !dbg !1439
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1440

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1441
  br label %return, !dbg !1441

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1443
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1446
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1447
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1447
  %div = sdiv i32 %6, %7, !dbg !1447, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %mul = mul nsw i32 %div, %8, !dbg !1449
  %sub = sub nsw i32 %5, %mul, !dbg !1450
  %shl = shl i32 %sub, 1, !dbg !1451
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1452
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1453
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1455
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1455
  %div12 = udiv i32 %9, %10, !dbg !1455, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1456
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1458
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1458
  %div13 = sdiv i32 %11, %12, !dbg !1458, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1459
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1460
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1461
  store i32 %13, i32* %retval, align 4, !dbg !1462
  br label %return, !dbg !1462

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1463
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1466
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1467

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1468
  br label %return, !dbg !1468

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1470
  %sub18 = sub nsw i32 0, %15, !dbg !1472
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1473
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1474
  %sub19 = sub nsw i32 0, %16, !dbg !1475
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1476
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1477
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1478
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1479
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1480
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1480
  %div20 = sdiv i32 %18, %19, !dbg !1480, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1481
  %mul21 = mul nsw i32 %div20, %20, !dbg !1482
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1483
  %shl23 = shl i32 %sub22, 1, !dbg !1484
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1485
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1486
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1488
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1488
  %div24 = udiv i32 %21, %22, !dbg !1488, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1489
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1491
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1491
  %div25 = sdiv i32 %23, %24, !dbg !1491, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1492
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1493
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1494
  store i32 %25, i32* %retval, align 4, !dbg !1495
  br label %return, !dbg !1495

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1496
  ret i32 %26, !dbg !1496
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1497 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1500, metadata !DIExpression()), !dbg !1501
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1502, metadata !DIExpression()), !dbg !1503
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1504, metadata !DIExpression()), !dbg !1505
  store i32 0, i32* %u32Temp1, align 4, !dbg !1505
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 0, i32* %u32Temp2, align 4, !dbg !1507
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1508, metadata !DIExpression()), !dbg !1509
  store i32 0, i32* %u32Temp3, align 4, !dbg !1509
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1510, metadata !DIExpression()), !dbg !1511
  store i32 0, i32* %numerator_old, align 4, !dbg !1511
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1512
  %cmp = icmp eq i32 %0, 0, !dbg !1514
  br i1 %cmp, label %if.then, label %if.else, !dbg !1515

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1516
  br label %return, !dbg !1516

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1518
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1520
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1521
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1523
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1523
  %div = udiv i32 %3, %4, !dbg !1523, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1524
  %sub = sub i32 %1, %mul, !dbg !1525
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1526
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1527
  %and = and i32 %5, 1, !dbg !1529
  %cmp1 = icmp eq i32 %and, 0, !dbg !1530
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1531

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1532
  %shr = lshr i32 %6, 1, !dbg !1534
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1535
  br label %if.end, !dbg !1536

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1537
  %shr4 = lshr i32 %7, 1, !dbg !1539
  %add = add i32 %shr4, 1, !dbg !1540
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1541
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1542
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1544
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1545
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1546

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1547
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1549
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1550
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1550
  %div7 = udiv i32 %10, %11, !dbg !1550, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1551
  br label %return, !dbg !1551

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1552
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1554
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1555
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1555
  %div9 = udiv i32 %12, %13, !dbg !1555, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1556
  store i32 %add10, i32* %retval, align 4, !dbg !1557
  br label %return, !dbg !1557

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1558
  ret i32 %14, !dbg !1558
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1559 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1562, metadata !DIExpression()), !dbg !1563
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1564, metadata !DIExpression()), !dbg !1565
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1566, metadata !DIExpression()), !dbg !1567
  store i32 0, i32* %u32Temp1, align 4, !dbg !1567
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1568, metadata !DIExpression()), !dbg !1569
  store i32 0, i32* %u32Temp2, align 4, !dbg !1569
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %cmp = icmp sle i32 %0, 0, !dbg !1572
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1573

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %cmp1 = icmp sge i32 %1, 0, !dbg !1577
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1578

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1579
  br label %return, !dbg !1579

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %sub = sub nsw i32 0, %2, !dbg !1583
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1584
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1585
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1586
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1587
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1588
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1588
  %div = udiv i32 %4, %5, !dbg !1588, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1589
  %mul = mul i32 %div, %6, !dbg !1590
  %sub3 = sub i32 %3, %mul, !dbg !1591
  %shl = shl i32 %sub3, 1, !dbg !1592
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1593
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1594
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1595
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1596
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1596
  %div4 = udiv i32 %7, %8, !dbg !1596, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1597
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1598
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1599
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1599
  %div5 = udiv i32 %9, %10, !dbg !1599, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1600
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1601
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1602
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1604
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1605

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1606
  %sub8 = sub i32 0, %12, !dbg !1608
  store i32 %sub8, i32* %retval, align 4, !dbg !1609
  br label %return, !dbg !1609

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1610
  br label %return, !dbg !1610

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1612
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1614
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1615
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1616
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1616
  %div11 = udiv i32 %14, %15, !dbg !1616, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1617
  %mul12 = mul i32 %div11, %16, !dbg !1618
  %sub13 = sub i32 %13, %mul12, !dbg !1619
  %shl14 = shl i32 %sub13, 1, !dbg !1620
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1621
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1622
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1623
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1624
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1624
  %div15 = udiv i32 %17, %18, !dbg !1624, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1625
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1626
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1627
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1627
  %div16 = udiv i32 %19, %20, !dbg !1627, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1628
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1629
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1630
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1632
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1633

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1634
  store i32 %22, i32* %retval, align 4, !dbg !1636
  br label %return, !dbg !1636

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1637
  br label %return, !dbg !1637

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1639
  ret i32 %23, !dbg !1639
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1640 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1643, metadata !DIExpression()), !dbg !1644
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1645, metadata !DIExpression()), !dbg !1646
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1647, metadata !DIExpression()), !dbg !1648
  store i32 0, i32* %s32Temp1, align 4, !dbg !1648
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1649, metadata !DIExpression()), !dbg !1650
  store i32 0, i32* %s32Temp2, align 4, !dbg !1650
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1651, metadata !DIExpression()), !dbg !1652
  store i32 0, i32* %u32Temp0, align 4, !dbg !1652
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1653, metadata !DIExpression()), !dbg !1654
  store i32 0, i32* %u32Temp1, align 4, !dbg !1654
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1655, metadata !DIExpression()), !dbg !1656
  store i32 0, i32* %u32Temp2, align 4, !dbg !1656
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1657
  %cmp = icmp eq i32 %0, 0, !dbg !1659
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1660

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1661
  %cmp1 = icmp slt i32 %1, 0, !dbg !1664
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1665

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1666
  br label %return, !dbg !1666

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1668
  br label %return, !dbg !1668

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1670
  %cmp4 = icmp sle i32 %2, 0, !dbg !1673
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1674

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1675
  %sub = sub nsw i32 0, %3, !dbg !1677
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1678
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1679
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1680
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1681
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1681
  %div = udiv i32 %4, %5, !dbg !1681, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1682
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1683
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1684
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1685
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1686
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1686
  %div6 = udiv i32 %7, %8, !dbg !1686, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1687
  %mul = mul i32 %div6, %9, !dbg !1688
  %sub7 = sub i32 %6, %mul, !dbg !1689
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1690
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %and = and i32 %10, 1, !dbg !1693
  %cmp8 = icmp eq i32 %and, 0, !dbg !1694
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1695

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %shr = lshr i32 %11, 1, !dbg !1698
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1699
  br label %if.end, !dbg !1700

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %shr11 = lshr i32 %12, 1, !dbg !1703
  %add = add i32 %shr11, 1, !dbg !1704
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1705
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1706
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1708
  %cmp12 = icmp ult i32 %13, %14, !dbg !1709
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1710

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1711
  %neg = xor i32 %15, -1, !dbg !1713
  %add14 = add i32 %neg, 1, !dbg !1714
  store i32 %add14, i32* %retval, align 4, !dbg !1715
  br label %return, !dbg !1715

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1716
  %add16 = add i32 %16, 1, !dbg !1718
  %neg17 = xor i32 %add16, -1, !dbg !1719
  %add18 = add i32 %neg17, 1, !dbg !1720
  store i32 %add18, i32* %retval, align 4, !dbg !1721
  br label %return, !dbg !1721

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1722
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1724
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1725
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1726
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1726
  %div20 = udiv i32 %18, %19, !dbg !1726, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1727
  %mul21 = mul i32 %div20, %20, !dbg !1728
  %sub22 = sub i32 %17, %mul21, !dbg !1729
  %shl = shl i32 %sub22, 1, !dbg !1730
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1731
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1732
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1733
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1734
  %div23 = udiv i32 %21, %22, !dbg !1734, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1735
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1736
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1737
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1737
  %div24 = udiv i32 %23, %24, !dbg !1737, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1738
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1739
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1740
  store i32 %25, i32* %retval, align 4, !dbg !1741
  br label %return, !dbg !1741

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1742
  ret i32 %26, !dbg !1742
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1743 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1746, metadata !DIExpression()), !dbg !1747
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1748, metadata !DIExpression()), !dbg !1749
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1750, metadata !DIExpression()), !dbg !1751
  store i32 0, i32* %s32Temp1, align 4, !dbg !1751
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1752, metadata !DIExpression()), !dbg !1753
  store i32 0, i32* %s32Temp2, align 4, !dbg !1753
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1754, metadata !DIExpression()), !dbg !1755
  store i32 0, i32* %denominator_prime, align 4, !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1756, metadata !DIExpression()), !dbg !1757
  store i32 0, i32* %u32Temp1, align 4, !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i32 0, i32* %u32Temp2, align 4, !dbg !1759
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1760, metadata !DIExpression()), !dbg !1761
  store i32 0, i32* %u32numerator, align 4, !dbg !1761
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1762, metadata !DIExpression()), !dbg !1763
  store i32 0, i32* %u32denominator, align 4, !dbg !1763
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1764
  %cmp = icmp slt i32 %0, 0, !dbg !1766
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1767

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1768
  %cmp1 = icmp sle i32 %1, 0, !dbg !1771
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1772

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1773
  %cmp3 = icmp sge i32 %2, 0, !dbg !1776
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1777

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1778
  br label %return, !dbg !1778

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1780
  %sub = sub nsw i32 0, %3, !dbg !1782
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1783
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %sub5 = sub nsw i32 0, %4, !dbg !1785
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1786
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1787
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1788
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1789
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1790
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1790
  %div = udiv i32 %6, %7, !dbg !1790, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1791
  %mul = mul i32 %div, %8, !dbg !1792
  %sub6 = sub i32 %5, %mul, !dbg !1793
  %shl = shl i32 %sub6, 1, !dbg !1794
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1795
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1796
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1797
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1798
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1798
  %div7 = udiv i32 %9, %10, !dbg !1798, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1799
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1800
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1801
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1801
  %div8 = udiv i32 %11, %12, !dbg !1801, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1802
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1803
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1804
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1806
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1807

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1808
  store i32 %14, i32* %retval, align 4, !dbg !1810
  br label %return, !dbg !1810

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1811
  br label %return, !dbg !1811

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1813
  %neg = xor i32 %15, -1, !dbg !1815
  %add13 = add nsw i32 %neg, 1, !dbg !1816
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1817
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1818
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1819
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1820
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1821
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1821
  %div14 = udiv i32 %17, %18, !dbg !1821, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1822
  %mul15 = mul i32 %div14, %19, !dbg !1823
  %sub16 = sub i32 %16, %mul15, !dbg !1824
  %shl17 = shl i32 %sub16, 1, !dbg !1825
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1826
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1827
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1828
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1829
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1829
  %div18 = udiv i32 %20, %21, !dbg !1829, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1830
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1831
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1832
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1832
  %div19 = sdiv i32 %22, %23, !dbg !1832, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1833
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1834
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1835
  %neg21 = xor i32 %24, -1, !dbg !1836
  %add22 = add nsw i32 %neg21, 1, !dbg !1837
  store i32 %add22, i32* %retval, align 4, !dbg !1838
  br label %return, !dbg !1838

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1839
  %cmp24 = icmp sle i32 %25, 0, !dbg !1842
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1843

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %cmp26 = icmp sge i32 %26, 0, !dbg !1847
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1848

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1849
  br label %return, !dbg !1849

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1851
  %neg29 = xor i32 %27, -1, !dbg !1853
  %add30 = add nsw i32 %neg29, 1, !dbg !1854
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1855
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1856
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1857
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1858
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1859
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1859
  %div31 = udiv i32 %29, %30, !dbg !1859, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1860
  %mul32 = mul i32 %div31, %31, !dbg !1861
  %sub33 = sub i32 %28, %mul32, !dbg !1862
  %shl34 = shl i32 %sub33, 1, !dbg !1863
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1864
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1865
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1866
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1867
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1867
  %div35 = udiv i32 %32, %33, !dbg !1867, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1868
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1869
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1870
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1870
  %div36 = udiv i32 %34, %35, !dbg !1870, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1871
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1872
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1873
  %neg38 = xor i32 %36, -1, !dbg !1874
  %add39 = add nsw i32 %neg38, 1, !dbg !1875
  store i32 %add39, i32* %retval, align 4, !dbg !1876
  br label %return, !dbg !1876

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1877
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1879
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1880
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1881
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1881
  %div41 = sdiv i32 %38, %39, !dbg !1881, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1882
  %mul42 = mul nsw i32 %div41, %40, !dbg !1883
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1884
  %shl44 = shl i32 %sub43, 1, !dbg !1885
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1886
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1887
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1888
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1889
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1889
  %div45 = sdiv i32 %41, %42, !dbg !1889, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1890
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1891
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1892
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1892
  %div46 = udiv i32 %43, %44, !dbg !1892, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1893
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1894
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1895
  store i32 %45, i32* %retval, align 4, !dbg !1896
  br label %return, !dbg !1896

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1897
  ret i32 %46, !dbg !1897
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1898 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1901, metadata !DIExpression()), !dbg !1902
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1903, metadata !DIExpression()), !dbg !1904
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1905, metadata !DIExpression()), !dbg !1906
  store i32 0, i32* %numerator_prime, align 4, !dbg !1906
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1907, metadata !DIExpression()), !dbg !1908
  store i32 0, i32* %u32Temp1, align 4, !dbg !1908
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1909, metadata !DIExpression()), !dbg !1910
  store i32 0, i32* %u32Temp2, align 4, !dbg !1910
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1911, metadata !DIExpression()), !dbg !1912
  store i32 0, i32* %u32Temp3, align 4, !dbg !1912
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1913, metadata !DIExpression()), !dbg !1914
  store i32 0, i32* %s32Temp1, align 4, !dbg !1914
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1915, metadata !DIExpression()), !dbg !1916
  store i32 0, i32* %s32Temp2, align 4, !dbg !1916
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1917, metadata !DIExpression()), !dbg !1918
  store i32 0, i32* %s32Temp3, align 4, !dbg !1918
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1919
  %cmp = icmp eq i32 %0, 0, !dbg !1921
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1922

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1923
  %cmp1 = icmp slt i32 %1, 0, !dbg !1926
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1927

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1928
  br label %return, !dbg !1928

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1930
  br label %return, !dbg !1930

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1932
  %cmp4 = icmp slt i32 %2, 0, !dbg !1935
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1936

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1937
  %sub = sub nsw i32 0, %3, !dbg !1939
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1940
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1941
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1942
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1943
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1943
  %div = udiv i32 %4, %5, !dbg !1943, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1944
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1945
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1946
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1947
  %mul = mul i32 %7, %8, !dbg !1948
  %sub6 = sub i32 %6, %mul, !dbg !1949
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1950
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1951
  %and = and i32 %9, 1, !dbg !1953
  %cmp7 = icmp eq i32 %and, 0, !dbg !1954
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1955

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1956
  %shr = lshr i32 %10, 1, !dbg !1958
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1959
  br label %if.end, !dbg !1960

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1961
  %shr10 = lshr i32 %11, 1, !dbg !1963
  %add = add i32 %shr10, 1, !dbg !1964
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1965
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1966
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1968
  %cmp11 = icmp ult i32 %12, %13, !dbg !1969
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1970

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1971
  %neg = xor i32 %14, -1, !dbg !1973
  %add13 = add i32 %neg, 1, !dbg !1974
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1975
  br label %if.end18, !dbg !1976

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1977
  %add15 = add i32 %15, 1, !dbg !1979
  %neg16 = xor i32 %add15, -1, !dbg !1980
  %add17 = add i32 %neg16, 1, !dbg !1981
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1982
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1983
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1985
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1986

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1987
  %conv = trunc i32 %17 to i16, !dbg !1989
  store i16 %conv, i16* %retval, align 2, !dbg !1990
  br label %return, !dbg !1990

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1991
  br label %return, !dbg !1991

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1993
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1995
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1996
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1996
  %div23 = udiv i32 %18, %19, !dbg !1996, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1997
  %mul24 = mul i32 %div23, %20, !dbg !1998
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1999
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2000
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2001
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2002
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2003
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2003
  %div25 = udiv i32 %22, %23, !dbg !2003, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2004
  %mul26 = mul i32 %div25, %24, !dbg !2005
  %sub27 = sub i32 %21, %mul26, !dbg !2006
  %shl = shl i32 %sub27, 1, !dbg !2007
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2008
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2009
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2010
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2011
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2011
  %div28 = udiv i32 %25, %26, !dbg !2011, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2012
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2013
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2014
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2014
  %div29 = udiv i32 %27, %28, !dbg !2014, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !2015
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2016
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2017
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2019
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2020

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2021
  %conv34 = trunc i32 %30 to i16, !dbg !2023
  store i16 %conv34, i16* %retval, align 2, !dbg !2024
  br label %return, !dbg !2024

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2025
  br label %return, !dbg !2025

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2027
  ret i16 %31, !dbg !2027
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2028 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2034, metadata !DIExpression()), !dbg !2035
  %2 = icmp eq i64 %0, 0, !dbg !2036
  br i1 %2, label %3, label %4, !dbg !2038

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2039
  unreachable, !dbg !2039

4:                                                ; preds = %1
  ret void, !dbg !2040
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2041 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2047, metadata !DIExpression()), !dbg !2049
  call void @llvm.dbg.value(metadata i64 %1, metadata !2048, metadata !DIExpression()), !dbg !2049
  %3 = icmp ult i64 %1, %0, !dbg !2050
  br i1 %3, label %5, label %4, !dbg !2052

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2053
  unreachable, !dbg !2053

5:                                                ; preds = %2
  ret void, !dbg !2055
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087/div_Ccode_alarm_0087.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "factor1", scope: !48, file: !49, line: 9, type: !8)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "factor2", scope: !48, file: !49, line: 10, type: !19)
!55 = !DILocation(line: 10, column: 14, scope: !48)
!56 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 11, type: !8)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 12, type: !8)
!59 = !DILocation(line: 12, column: 13, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 15, column: 24, scope: !48)
!63 = !DILocation(line: 15, column: 5, scope: !48)
!64 = !DILocation(line: 16, column: 24, scope: !48)
!65 = !DILocation(line: 16, column: 5, scope: !48)
!66 = !DILocation(line: 18, column: 38, scope: !48)
!67 = !DILocation(line: 18, column: 47, scope: !48)
!68 = !DILocation(line: 18, column: 56, scope: !48)
!69 = !DILocation(line: 18, column: 14, scope: !48)
!70 = !DILocation(line: 18, column: 12, scope: !48)
!71 = !DILocation(line: 20, column: 11, scope: !48)
!72 = !DILocation(line: 21, column: 5, scope: !48)
!73 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !74, file: !74, line: 170, type: !75, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087")
!75 = !DISubroutineType(types: !76)
!76 = !{!6, !6, !6}
!77 = !DILocalVariable(name: "numerator", arg: 1, scope: !73, file: !74, line: 170, type: !6)
!78 = !DILocation(line: 170, column: 31, scope: !73)
!79 = !DILocalVariable(name: "denominator", arg: 2, scope: !73, file: !74, line: 170, type: !6)
!80 = !DILocation(line: 170, column: 47, scope: !73)
!81 = !DILocalVariable(name: "s32Temp1", scope: !73, file: !74, line: 172, type: !25)
!82 = !DILocation(line: 172, column: 6, scope: !73)
!83 = !DILocalVariable(name: "s32Temp2", scope: !73, file: !74, line: 172, type: !25)
!84 = !DILocation(line: 172, column: 15, scope: !73)
!85 = !DILocation(line: 173, column: 13, scope: !73)
!86 = !DILocation(line: 173, column: 22, scope: !73)
!87 = !DILocation(line: 173, column: 11, scope: !73)
!88 = !DILocation(line: 175, column: 6, scope: !89)
!89 = distinct !DILexicalBlock(scope: !73, file: !74, line: 175, column: 6)
!90 = !DILocation(line: 175, column: 18, scope: !89)
!91 = !DILocation(line: 175, column: 6, scope: !73)
!92 = !DILocation(line: 177, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !74, line: 177, column: 7)
!94 = distinct !DILexicalBlock(scope: !89, file: !74, line: 176, column: 2)
!95 = !DILocation(line: 177, column: 17, scope: !93)
!96 = !DILocation(line: 177, column: 7, scope: !94)
!97 = !DILocation(line: 179, column: 4, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !74, line: 178, column: 3)
!99 = !DILocation(line: 183, column: 4, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !74, line: 182, column: 3)
!101 = !DILocation(line: 188, column: 7, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !74, line: 188, column: 7)
!103 = distinct !DILexicalBlock(scope: !89, file: !74, line: 187, column: 2)
!104 = !DILocation(line: 188, column: 16, scope: !102)
!105 = !DILocation(line: 188, column: 7, scope: !103)
!106 = !DILocation(line: 190, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !74, line: 189, column: 3)
!108 = !DILocation(line: 190, column: 28, scope: !107)
!109 = !DILocation(line: 190, column: 37, scope: !107)
!110 = !DILocation(line: 190, column: 36, scope: !107)
!111 = !{!"True"}
!112 = !DILocation(line: 190, column: 52, scope: !107)
!113 = !DILocation(line: 190, column: 50, scope: !107)
!114 = !DILocation(line: 190, column: 25, scope: !107)
!115 = !DILocation(line: 190, column: 65, scope: !107)
!116 = !DILocation(line: 190, column: 13, scope: !107)
!117 = !DILocation(line: 191, column: 15, scope: !107)
!118 = !DILocation(line: 191, column: 24, scope: !107)
!119 = !DILocation(line: 191, column: 23, scope: !107)
!120 = !DILocation(line: 191, column: 13, scope: !107)
!121 = !DILocation(line: 192, column: 15, scope: !107)
!122 = !DILocation(line: 192, column: 27, scope: !107)
!123 = !DILocation(line: 192, column: 36, scope: !107)
!124 = !DILocation(line: 192, column: 42, scope: !107)
!125 = !DILocation(line: 192, column: 41, scope: !107)
!126 = !DILocation(line: 192, column: 24, scope: !107)
!127 = !DILocation(line: 192, column: 13, scope: !107)
!128 = !DILocation(line: 193, column: 7, scope: !129)
!129 = distinct !DILexicalBlock(scope: !107, file: !74, line: 193, column: 7)
!130 = !DILocation(line: 193, column: 16, scope: !129)
!131 = !DILocation(line: 193, column: 7, scope: !107)
!132 = !DILocation(line: 195, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !134, file: !74, line: 195, column: 8)
!134 = distinct !DILexicalBlock(scope: !129, file: !74, line: 194, column: 4)
!135 = !DILocation(line: 195, column: 17, scope: !133)
!136 = !DILocation(line: 195, column: 8, scope: !134)
!137 = !DILocation(line: 197, column: 18, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !74, line: 196, column: 5)
!139 = !DILocation(line: 197, column: 13, scope: !138)
!140 = !DILocation(line: 197, column: 6, scope: !138)
!141 = !DILocation(line: 201, column: 6, scope: !142)
!142 = distinct !DILexicalBlock(scope: !133, file: !74, line: 200, column: 5)
!143 = !DILocation(line: 206, column: 5, scope: !144)
!144 = distinct !DILexicalBlock(scope: !129, file: !74, line: 205, column: 4)
!145 = !DILocation(line: 211, column: 7, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !74, line: 211, column: 7)
!147 = distinct !DILexicalBlock(scope: !102, file: !74, line: 210, column: 3)
!148 = !DILocation(line: 211, column: 19, scope: !146)
!149 = !DILocation(line: 211, column: 7, scope: !147)
!150 = !DILocation(line: 213, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !74, line: 212, column: 4)
!152 = !DILocation(line: 213, column: 29, scope: !151)
!153 = !DILocation(line: 213, column: 38, scope: !151)
!154 = !DILocation(line: 213, column: 37, scope: !151)
!155 = !DILocation(line: 213, column: 53, scope: !151)
!156 = !DILocation(line: 213, column: 51, scope: !151)
!157 = !DILocation(line: 213, column: 26, scope: !151)
!158 = !DILocation(line: 213, column: 66, scope: !151)
!159 = !DILocation(line: 213, column: 14, scope: !151)
!160 = !DILocation(line: 214, column: 16, scope: !151)
!161 = !DILocation(line: 214, column: 25, scope: !151)
!162 = !DILocation(line: 214, column: 24, scope: !151)
!163 = !DILocation(line: 214, column: 14, scope: !151)
!164 = !DILocation(line: 215, column: 16, scope: !151)
!165 = !DILocation(line: 215, column: 28, scope: !151)
!166 = !DILocation(line: 215, column: 37, scope: !151)
!167 = !DILocation(line: 215, column: 43, scope: !151)
!168 = !DILocation(line: 215, column: 42, scope: !151)
!169 = !DILocation(line: 215, column: 25, scope: !151)
!170 = !DILocation(line: 215, column: 14, scope: !151)
!171 = !DILocation(line: 216, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !151, file: !74, line: 216, column: 8)
!173 = !DILocation(line: 216, column: 17, scope: !172)
!174 = !DILocation(line: 216, column: 8, scope: !151)
!175 = !DILocation(line: 218, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !177, file: !74, line: 218, column: 9)
!177 = distinct !DILexicalBlock(scope: !172, file: !74, line: 217, column: 5)
!178 = !DILocation(line: 218, column: 18, scope: !176)
!179 = !DILocation(line: 218, column: 9, scope: !177)
!180 = !DILocation(line: 220, column: 19, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !74, line: 219, column: 6)
!182 = !DILocation(line: 220, column: 14, scope: !181)
!183 = !DILocation(line: 220, column: 7, scope: !181)
!184 = !DILocation(line: 224, column: 7, scope: !185)
!185 = distinct !DILexicalBlock(scope: !176, file: !74, line: 223, column: 6)
!186 = !DILocation(line: 229, column: 6, scope: !187)
!187 = distinct !DILexicalBlock(scope: !172, file: !74, line: 228, column: 5)
!188 = !DILocation(line: 234, column: 5, scope: !189)
!189 = distinct !DILexicalBlock(scope: !146, file: !74, line: 233, column: 4)
!190 = !DILocation(line: 238, column: 1, scope: !73)
!191 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !74, file: !74, line: 255, type: !192, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!192 = !DISubroutineType(types: !193)
!193 = !{!6, !25, !6}
!194 = !DILocalVariable(name: "numerator", arg: 1, scope: !191, file: !74, line: 255, type: !25)
!195 = !DILocation(line: 255, column: 25, scope: !191)
!196 = !DILocalVariable(name: "denominator", arg: 2, scope: !191, file: !74, line: 255, type: !6)
!197 = !DILocation(line: 255, column: 41, scope: !191)
!198 = !DILocalVariable(name: "s32Temp1", scope: !191, file: !74, line: 257, type: !25)
!199 = !DILocation(line: 257, column: 6, scope: !191)
!200 = !DILocalVariable(name: "s32Temp2", scope: !191, file: !74, line: 257, type: !25)
!201 = !DILocation(line: 257, column: 17, scope: !191)
!202 = !DILocation(line: 258, column: 13, scope: !191)
!203 = !DILocation(line: 258, column: 11, scope: !191)
!204 = !DILocation(line: 259, column: 5, scope: !205)
!205 = distinct !DILexicalBlock(scope: !191, file: !74, line: 259, column: 5)
!206 = !DILocation(line: 259, column: 17, scope: !205)
!207 = !DILocation(line: 259, column: 5, scope: !191)
!208 = !DILocation(line: 261, column: 7, scope: !209)
!209 = distinct !DILexicalBlock(scope: !210, file: !74, line: 261, column: 7)
!210 = distinct !DILexicalBlock(scope: !205, file: !74, line: 260, column: 2)
!211 = !DILocation(line: 261, column: 17, scope: !209)
!212 = !DILocation(line: 261, column: 7, scope: !210)
!213 = !DILocation(line: 263, column: 4, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !74, line: 262, column: 3)
!215 = !DILocation(line: 267, column: 4, scope: !216)
!216 = distinct !DILexicalBlock(scope: !209, file: !74, line: 266, column: 3)
!217 = !DILocation(line: 272, column: 6, scope: !218)
!218 = distinct !DILexicalBlock(scope: !219, file: !74, line: 272, column: 6)
!219 = distinct !DILexicalBlock(scope: !205, file: !74, line: 271, column: 2)
!220 = !DILocation(line: 272, column: 16, scope: !218)
!221 = !DILocation(line: 272, column: 6, scope: !219)
!222 = !DILocation(line: 274, column: 16, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !74, line: 273, column: 3)
!224 = !DILocation(line: 274, column: 28, scope: !223)
!225 = !DILocation(line: 274, column: 37, scope: !223)
!226 = !DILocation(line: 274, column: 36, scope: !223)
!227 = !DILocation(line: 274, column: 52, scope: !223)
!228 = !DILocation(line: 274, column: 50, scope: !223)
!229 = !DILocation(line: 274, column: 25, scope: !223)
!230 = !DILocation(line: 274, column: 65, scope: !223)
!231 = !DILocation(line: 274, column: 13, scope: !223)
!232 = !DILocation(line: 275, column: 15, scope: !223)
!233 = !DILocation(line: 275, column: 24, scope: !223)
!234 = !DILocation(line: 275, column: 23, scope: !223)
!235 = !DILocation(line: 275, column: 13, scope: !223)
!236 = !DILocation(line: 276, column: 15, scope: !223)
!237 = !DILocation(line: 276, column: 27, scope: !223)
!238 = !DILocation(line: 276, column: 38, scope: !223)
!239 = !DILocation(line: 276, column: 37, scope: !223)
!240 = !DILocation(line: 276, column: 24, scope: !223)
!241 = !DILocation(line: 276, column: 13, scope: !223)
!242 = !DILocation(line: 277, column: 7, scope: !243)
!243 = distinct !DILexicalBlock(scope: !223, file: !74, line: 277, column: 7)
!244 = !DILocation(line: 277, column: 16, scope: !243)
!245 = !DILocation(line: 277, column: 7, scope: !223)
!246 = !DILocation(line: 279, column: 8, scope: !247)
!247 = distinct !DILexicalBlock(scope: !248, file: !74, line: 279, column: 8)
!248 = distinct !DILexicalBlock(scope: !243, file: !74, line: 278, column: 4)
!249 = !DILocation(line: 279, column: 17, scope: !247)
!250 = !DILocation(line: 279, column: 8, scope: !248)
!251 = !DILocation(line: 281, column: 18, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !74, line: 280, column: 5)
!253 = !DILocation(line: 281, column: 13, scope: !252)
!254 = !DILocation(line: 281, column: 6, scope: !252)
!255 = !DILocation(line: 285, column: 6, scope: !256)
!256 = distinct !DILexicalBlock(scope: !247, file: !74, line: 284, column: 5)
!257 = !DILocation(line: 290, column: 5, scope: !258)
!258 = distinct !DILexicalBlock(scope: !243, file: !74, line: 289, column: 4)
!259 = !DILocation(line: 295, column: 7, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !74, line: 295, column: 7)
!261 = distinct !DILexicalBlock(scope: !218, file: !74, line: 294, column: 3)
!262 = !DILocation(line: 295, column: 19, scope: !260)
!263 = !DILocation(line: 295, column: 7, scope: !261)
!264 = !DILocation(line: 297, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !74, line: 296, column: 4)
!266 = !DILocation(line: 297, column: 29, scope: !265)
!267 = !DILocation(line: 297, column: 38, scope: !265)
!268 = !DILocation(line: 297, column: 37, scope: !265)
!269 = !DILocation(line: 297, column: 53, scope: !265)
!270 = !DILocation(line: 297, column: 51, scope: !265)
!271 = !DILocation(line: 297, column: 26, scope: !265)
!272 = !DILocation(line: 297, column: 66, scope: !265)
!273 = !DILocation(line: 297, column: 14, scope: !265)
!274 = !DILocation(line: 298, column: 16, scope: !265)
!275 = !DILocation(line: 298, column: 25, scope: !265)
!276 = !DILocation(line: 298, column: 24, scope: !265)
!277 = !DILocation(line: 298, column: 14, scope: !265)
!278 = !DILocation(line: 299, column: 16, scope: !265)
!279 = !DILocation(line: 299, column: 28, scope: !265)
!280 = !DILocation(line: 299, column: 39, scope: !265)
!281 = !DILocation(line: 299, column: 38, scope: !265)
!282 = !DILocation(line: 299, column: 25, scope: !265)
!283 = !DILocation(line: 299, column: 14, scope: !265)
!284 = !DILocation(line: 300, column: 8, scope: !285)
!285 = distinct !DILexicalBlock(scope: !265, file: !74, line: 300, column: 8)
!286 = !DILocation(line: 300, column: 17, scope: !285)
!287 = !DILocation(line: 300, column: 8, scope: !265)
!288 = !DILocation(line: 302, column: 9, scope: !289)
!289 = distinct !DILexicalBlock(scope: !290, file: !74, line: 302, column: 9)
!290 = distinct !DILexicalBlock(scope: !285, file: !74, line: 301, column: 5)
!291 = !DILocation(line: 302, column: 18, scope: !289)
!292 = !DILocation(line: 302, column: 9, scope: !290)
!293 = !DILocation(line: 304, column: 19, scope: !294)
!294 = distinct !DILexicalBlock(scope: !289, file: !74, line: 303, column: 6)
!295 = !DILocation(line: 304, column: 14, scope: !294)
!296 = !DILocation(line: 304, column: 7, scope: !294)
!297 = !DILocation(line: 308, column: 7, scope: !298)
!298 = distinct !DILexicalBlock(scope: !289, file: !74, line: 307, column: 6)
!299 = !DILocation(line: 313, column: 6, scope: !300)
!300 = distinct !DILexicalBlock(scope: !285, file: !74, line: 312, column: 5)
!301 = !DILocation(line: 319, column: 5, scope: !302)
!302 = distinct !DILexicalBlock(scope: !260, file: !74, line: 318, column: 4)
!303 = !DILocation(line: 325, column: 1, scope: !191)
!304 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !74, file: !74, line: 343, type: !305, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!305 = !DISubroutineType(types: !306)
!306 = !{!6, !6, !18}
!307 = !DILocalVariable(name: "numerator", arg: 1, scope: !304, file: !74, line: 343, type: !6)
!308 = !DILocation(line: 343, column: 31, scope: !304)
!309 = !DILocalVariable(name: "denominator", arg: 2, scope: !304, file: !74, line: 343, type: !18)
!310 = !DILocation(line: 343, column: 47, scope: !304)
!311 = !DILocalVariable(name: "u16Temp1", scope: !304, file: !74, line: 345, type: !18)
!312 = !DILocation(line: 345, column: 6, scope: !304)
!313 = !DILocalVariable(name: "s32Temp1", scope: !304, file: !74, line: 346, type: !25)
!314 = !DILocation(line: 346, column: 6, scope: !304)
!315 = !DILocalVariable(name: "s32Temp2", scope: !304, file: !74, line: 346, type: !25)
!316 = !DILocation(line: 346, column: 15, scope: !304)
!317 = !DILocation(line: 347, column: 13, scope: !304)
!318 = !DILocation(line: 347, column: 25, scope: !304)
!319 = !DILocation(line: 347, column: 11, scope: !304)
!320 = !DILocation(line: 348, column: 13, scope: !304)
!321 = !DILocation(line: 348, column: 22, scope: !304)
!322 = !DILocation(line: 348, column: 11, scope: !304)
!323 = !DILocation(line: 349, column: 5, scope: !324)
!324 = distinct !DILexicalBlock(scope: !304, file: !74, line: 349, column: 5)
!325 = !DILocation(line: 349, column: 14, scope: !324)
!326 = !DILocation(line: 349, column: 5, scope: !304)
!327 = !DILocation(line: 351, column: 7, scope: !328)
!328 = distinct !DILexicalBlock(scope: !329, file: !74, line: 351, column: 7)
!329 = distinct !DILexicalBlock(scope: !324, file: !74, line: 350, column: 2)
!330 = !DILocation(line: 351, column: 17, scope: !328)
!331 = !DILocation(line: 351, column: 7, scope: !329)
!332 = !DILocation(line: 353, column: 4, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !74, line: 352, column: 3)
!334 = !DILocation(line: 357, column: 4, scope: !335)
!335 = distinct !DILexicalBlock(scope: !328, file: !74, line: 356, column: 3)
!336 = !DILocation(line: 362, column: 15, scope: !337)
!337 = distinct !DILexicalBlock(scope: !324, file: !74, line: 361, column: 2)
!338 = !DILocation(line: 362, column: 24, scope: !337)
!339 = !DILocation(line: 362, column: 32, scope: !337)
!340 = !DILocation(line: 362, column: 41, scope: !337)
!341 = !DILocation(line: 362, column: 47, scope: !337)
!342 = !DILocation(line: 362, column: 46, scope: !337)
!343 = !DILocation(line: 362, column: 57, scope: !337)
!344 = !DILocation(line: 362, column: 56, scope: !337)
!345 = !DILocation(line: 362, column: 29, scope: !337)
!346 = !DILocation(line: 362, column: 12, scope: !337)
!347 = !DILocation(line: 363, column: 14, scope: !337)
!348 = !DILocation(line: 363, column: 22, scope: !337)
!349 = !DILocation(line: 363, column: 12, scope: !337)
!350 = !DILocation(line: 364, column: 14, scope: !337)
!351 = !DILocation(line: 364, column: 23, scope: !337)
!352 = !DILocation(line: 364, column: 22, scope: !337)
!353 = !DILocation(line: 364, column: 12, scope: !337)
!354 = !DILocation(line: 365, column: 16, scope: !337)
!355 = !DILocation(line: 365, column: 25, scope: !337)
!356 = !DILocation(line: 365, column: 31, scope: !337)
!357 = !DILocation(line: 365, column: 30, scope: !337)
!358 = !DILocation(line: 365, column: 43, scope: !337)
!359 = !DILocation(line: 365, column: 41, scope: !337)
!360 = !DILocation(line: 365, column: 12, scope: !337)
!361 = !DILocation(line: 366, column: 6, scope: !362)
!362 = distinct !DILexicalBlock(scope: !337, file: !74, line: 366, column: 6)
!363 = !DILocation(line: 366, column: 15, scope: !362)
!364 = !DILocation(line: 366, column: 6, scope: !337)
!365 = !DILocation(line: 368, column: 7, scope: !366)
!366 = distinct !DILexicalBlock(scope: !367, file: !74, line: 368, column: 7)
!367 = distinct !DILexicalBlock(scope: !362, file: !74, line: 367, column: 3)
!368 = !DILocation(line: 368, column: 16, scope: !366)
!369 = !DILocation(line: 368, column: 7, scope: !367)
!370 = !DILocation(line: 370, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !74, line: 369, column: 4)
!372 = !DILocation(line: 370, column: 12, scope: !371)
!373 = !DILocation(line: 370, column: 5, scope: !371)
!374 = !DILocation(line: 374, column: 5, scope: !375)
!375 = distinct !DILexicalBlock(scope: !366, file: !74, line: 373, column: 4)
!376 = !DILocation(line: 379, column: 4, scope: !377)
!377 = distinct !DILexicalBlock(scope: !362, file: !74, line: 378, column: 3)
!378 = !DILocation(line: 382, column: 1, scope: !304)
!379 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !74, file: !74, line: 399, type: !305, scopeLine: 400, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!380 = !DILocalVariable(name: "numerator", arg: 1, scope: !379, file: !74, line: 399, type: !6)
!381 = !DILocation(line: 399, column: 30, scope: !379)
!382 = !DILocalVariable(name: "denominator", arg: 2, scope: !379, file: !74, line: 399, type: !18)
!383 = !DILocation(line: 399, column: 45, scope: !379)
!384 = !DILocalVariable(name: "u16Temp1", scope: !379, file: !74, line: 401, type: !18)
!385 = !DILocation(line: 401, column: 6, scope: !379)
!386 = !DILocalVariable(name: "s32Temp1", scope: !379, file: !74, line: 402, type: !25)
!387 = !DILocation(line: 402, column: 6, scope: !379)
!388 = !DILocation(line: 403, column: 13, scope: !379)
!389 = !DILocation(line: 403, column: 25, scope: !379)
!390 = !DILocation(line: 403, column: 11, scope: !379)
!391 = !DILocation(line: 404, column: 5, scope: !392)
!392 = distinct !DILexicalBlock(scope: !379, file: !74, line: 404, column: 5)
!393 = !DILocation(line: 404, column: 13, scope: !392)
!394 = !DILocation(line: 404, column: 5, scope: !379)
!395 = !DILocation(line: 406, column: 6, scope: !396)
!396 = distinct !DILexicalBlock(scope: !397, file: !74, line: 406, column: 6)
!397 = distinct !DILexicalBlock(scope: !392, file: !74, line: 405, column: 2)
!398 = !DILocation(line: 406, column: 15, scope: !396)
!399 = !DILocation(line: 406, column: 6, scope: !397)
!400 = !DILocation(line: 408, column: 4, scope: !401)
!401 = distinct !DILexicalBlock(scope: !396, file: !74, line: 407, column: 3)
!402 = !DILocation(line: 412, column: 4, scope: !403)
!403 = distinct !DILexicalBlock(scope: !396, file: !74, line: 411, column: 3)
!404 = !DILocation(line: 418, column: 15, scope: !405)
!405 = distinct !DILexicalBlock(scope: !392, file: !74, line: 417, column: 2)
!406 = !DILocation(line: 418, column: 27, scope: !405)
!407 = !DILocation(line: 418, column: 37, scope: !405)
!408 = !DILocation(line: 418, column: 36, scope: !405)
!409 = !DILocation(line: 418, column: 49, scope: !405)
!410 = !DILocation(line: 418, column: 47, scope: !405)
!411 = !DILocation(line: 418, column: 25, scope: !405)
!412 = !DILocation(line: 418, column: 59, scope: !405)
!413 = !DILocation(line: 418, column: 12, scope: !405)
!414 = !DILocation(line: 419, column: 15, scope: !405)
!415 = !DILocation(line: 419, column: 24, scope: !405)
!416 = !DILocation(line: 419, column: 23, scope: !405)
!417 = !DILocation(line: 419, column: 37, scope: !405)
!418 = !DILocation(line: 419, column: 47, scope: !405)
!419 = !DILocation(line: 419, column: 46, scope: !405)
!420 = !DILocation(line: 419, column: 34, scope: !405)
!421 = !DILocation(line: 419, column: 12, scope: !405)
!422 = !DILocation(line: 420, column: 10, scope: !405)
!423 = !DILocation(line: 420, column: 3, scope: !405)
!424 = !DILocation(line: 422, column: 1, scope: !379)
!425 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !74, file: !74, line: 440, type: !426, scopeLine: 441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!426 = !DISubroutineType(types: !427)
!427 = !{!13, !18, !18}
!428 = !DILocalVariable(name: "numerator", arg: 1, scope: !425, file: !74, line: 440, type: !18)
!429 = !DILocation(line: 440, column: 28, scope: !425)
!430 = !DILocalVariable(name: "denominator", arg: 2, scope: !425, file: !74, line: 440, type: !18)
!431 = !DILocation(line: 440, column: 43, scope: !425)
!432 = !DILocalVariable(name: "u32Temp1", scope: !425, file: !74, line: 442, type: !433)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !29)
!434 = !DILocation(line: 442, column: 6, scope: !425)
!435 = !DILocalVariable(name: "u32Temp2", scope: !425, file: !74, line: 442, type: !433)
!436 = !DILocation(line: 442, column: 20, scope: !425)
!437 = !DILocalVariable(name: "u32Temp3", scope: !425, file: !74, line: 442, type: !433)
!438 = !DILocation(line: 442, column: 33, scope: !425)
!439 = !DILocation(line: 443, column: 5, scope: !440)
!440 = distinct !DILexicalBlock(scope: !425, file: !74, line: 443, column: 5)
!441 = !DILocation(line: 443, column: 16, scope: !440)
!442 = !DILocation(line: 443, column: 5, scope: !425)
!443 = !DILocation(line: 445, column: 3, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !74, line: 444, column: 2)
!445 = !DILocation(line: 449, column: 15, scope: !446)
!446 = distinct !DILexicalBlock(scope: !440, file: !74, line: 448, column: 2)
!447 = !DILocation(line: 449, column: 24, scope: !446)
!448 = !DILocation(line: 449, column: 12, scope: !446)
!449 = !DILocation(line: 450, column: 14, scope: !446)
!450 = !DILocation(line: 450, column: 25, scope: !446)
!451 = !DILocation(line: 450, column: 23, scope: !446)
!452 = !DILocation(line: 450, column: 12, scope: !446)
!453 = !DILocation(line: 451, column: 15, scope: !446)
!454 = !DILocation(line: 451, column: 24, scope: !446)
!455 = !DILocation(line: 451, column: 32, scope: !446)
!456 = !DILocation(line: 451, column: 12, scope: !446)
!457 = !DILocation(line: 452, column: 6, scope: !458)
!458 = distinct !DILexicalBlock(scope: !446, file: !74, line: 452, column: 6)
!459 = !DILocation(line: 452, column: 15, scope: !458)
!460 = !DILocation(line: 452, column: 6, scope: !446)
!461 = !DILocation(line: 454, column: 15, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !74, line: 453, column: 3)
!463 = !DILocation(line: 454, column: 11, scope: !462)
!464 = !DILocation(line: 454, column: 4, scope: !462)
!465 = !DILocation(line: 458, column: 4, scope: !466)
!466 = distinct !DILexicalBlock(scope: !458, file: !74, line: 457, column: 3)
!467 = !DILocation(line: 461, column: 1, scope: !425)
!468 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !74, file: !74, line: 478, type: !469, scopeLine: 479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!469 = !DISubroutineType(types: !470)
!470 = !{!18, !25, !18}
!471 = !DILocalVariable(name: "x_value", arg: 1, scope: !468, file: !74, line: 478, type: !25)
!472 = !DILocation(line: 478, column: 25, scope: !468)
!473 = !DILocalVariable(name: "y_value", arg: 2, scope: !468, file: !74, line: 478, type: !18)
!474 = !DILocation(line: 478, column: 38, scope: !468)
!475 = !DILocalVariable(name: "s32Temp1", scope: !468, file: !74, line: 480, type: !25)
!476 = !DILocation(line: 480, column: 6, scope: !468)
!477 = !DILocation(line: 481, column: 12, scope: !468)
!478 = !DILocation(line: 481, column: 20, scope: !468)
!479 = !DILocation(line: 481, column: 10, scope: !468)
!480 = !DILocation(line: 482, column: 6, scope: !481)
!481 = distinct !DILexicalBlock(scope: !468, file: !74, line: 482, column: 5)
!482 = !DILocation(line: 482, column: 14, scope: !481)
!483 = !DILocation(line: 482, column: 24, scope: !481)
!484 = !DILocation(line: 482, column: 5, scope: !468)
!485 = !DILocation(line: 484, column: 6, scope: !486)
!486 = distinct !DILexicalBlock(scope: !487, file: !74, line: 484, column: 6)
!487 = distinct !DILexicalBlock(scope: !481, file: !74, line: 483, column: 2)
!488 = !DILocation(line: 484, column: 14, scope: !486)
!489 = !DILocation(line: 484, column: 6, scope: !487)
!490 = !DILocation(line: 486, column: 4, scope: !491)
!491 = distinct !DILexicalBlock(scope: !486, file: !74, line: 485, column: 3)
!492 = !DILocation(line: 490, column: 4, scope: !493)
!493 = distinct !DILexicalBlock(scope: !486, file: !74, line: 489, column: 3)
!494 = !DILocation(line: 495, column: 15, scope: !495)
!495 = distinct !DILexicalBlock(scope: !481, file: !74, line: 494, column: 2)
!496 = !DILocation(line: 495, column: 27, scope: !495)
!497 = !DILocation(line: 495, column: 35, scope: !495)
!498 = !DILocation(line: 495, column: 34, scope: !495)
!499 = !DILocation(line: 495, column: 46, scope: !495)
!500 = !DILocation(line: 495, column: 44, scope: !495)
!501 = !DILocation(line: 495, column: 23, scope: !495)
!502 = !DILocation(line: 495, column: 56, scope: !495)
!503 = !DILocation(line: 495, column: 12, scope: !495)
!504 = !DILocation(line: 496, column: 15, scope: !495)
!505 = !DILocation(line: 496, column: 24, scope: !495)
!506 = !DILocation(line: 496, column: 23, scope: !495)
!507 = !DILocation(line: 496, column: 36, scope: !495)
!508 = !DILocation(line: 496, column: 44, scope: !495)
!509 = !DILocation(line: 496, column: 43, scope: !495)
!510 = !DILocation(line: 496, column: 33, scope: !495)
!511 = !DILocation(line: 496, column: 12, scope: !495)
!512 = !DILocation(line: 497, column: 6, scope: !513)
!513 = distinct !DILexicalBlock(scope: !495, file: !74, line: 497, column: 6)
!514 = !DILocation(line: 497, column: 15, scope: !513)
!515 = !DILocation(line: 497, column: 6, scope: !495)
!516 = !DILocation(line: 499, column: 7, scope: !517)
!517 = distinct !DILexicalBlock(scope: !518, file: !74, line: 499, column: 7)
!518 = distinct !DILexicalBlock(scope: !513, file: !74, line: 498, column: 3)
!519 = !DILocation(line: 499, column: 16, scope: !517)
!520 = !DILocation(line: 499, column: 7, scope: !518)
!521 = !DILocation(line: 501, column: 17, scope: !522)
!522 = distinct !DILexicalBlock(scope: !517, file: !74, line: 500, column: 4)
!523 = !DILocation(line: 501, column: 12, scope: !522)
!524 = !DILocation(line: 501, column: 5, scope: !522)
!525 = !DILocation(line: 505, column: 5, scope: !526)
!526 = distinct !DILexicalBlock(scope: !517, file: !74, line: 504, column: 4)
!527 = !DILocation(line: 510, column: 4, scope: !528)
!528 = distinct !DILexicalBlock(scope: !513, file: !74, line: 509, column: 3)
!529 = !DILocation(line: 513, column: 1, scope: !468)
!530 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !74, file: !74, line: 531, type: !531, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!531 = !DISubroutineType(types: !532)
!532 = !{!18, !18, !18}
!533 = !DILocalVariable(name: "numerator", arg: 1, scope: !530, file: !74, line: 531, type: !18)
!534 = !DILocation(line: 531, column: 31, scope: !530)
!535 = !DILocalVariable(name: "denominator", arg: 2, scope: !530, file: !74, line: 531, type: !18)
!536 = !DILocation(line: 531, column: 46, scope: !530)
!537 = !DILocalVariable(name: "u32Temp", scope: !530, file: !74, line: 533, type: !433)
!538 = !DILocation(line: 533, column: 6, scope: !530)
!539 = !DILocation(line: 534, column: 5, scope: !540)
!540 = distinct !DILexicalBlock(scope: !530, file: !74, line: 534, column: 5)
!541 = !DILocation(line: 534, column: 17, scope: !540)
!542 = !DILocation(line: 534, column: 5, scope: !530)
!543 = !DILocation(line: 536, column: 3, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !74, line: 535, column: 2)
!545 = !DILocation(line: 540, column: 14, scope: !546)
!546 = distinct !DILexicalBlock(scope: !540, file: !74, line: 539, column: 2)
!547 = !DILocation(line: 540, column: 23, scope: !546)
!548 = !DILocation(line: 540, column: 32, scope: !546)
!549 = !DILocation(line: 540, column: 44, scope: !546)
!550 = !DILocation(line: 540, column: 29, scope: !546)
!551 = !DILocation(line: 540, column: 11, scope: !546)
!552 = !DILocation(line: 541, column: 13, scope: !546)
!553 = !DILocation(line: 541, column: 21, scope: !546)
!554 = !DILocation(line: 541, column: 20, scope: !546)
!555 = !DILocation(line: 541, column: 11, scope: !546)
!556 = !DILocation(line: 542, column: 6, scope: !557)
!557 = distinct !DILexicalBlock(scope: !546, file: !74, line: 542, column: 6)
!558 = !DILocation(line: 542, column: 14, scope: !557)
!559 = !DILocation(line: 542, column: 6, scope: !546)
!560 = !DILocation(line: 544, column: 11, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !74, line: 543, column: 3)
!562 = !DILocation(line: 544, column: 19, scope: !561)
!563 = !DILocation(line: 544, column: 4, scope: !561)
!564 = !DILocation(line: 548, column: 4, scope: !565)
!565 = distinct !DILexicalBlock(scope: !557, file: !74, line: 547, column: 3)
!566 = !DILocation(line: 552, column: 1, scope: !530)
!567 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !74, file: !74, line: 569, type: !568, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!568 = !DISubroutineType(types: !569)
!569 = !{!18, !433, !18}
!570 = !DILocalVariable(name: "x_value", arg: 1, scope: !567, file: !74, line: 569, type: !433)
!571 = !DILocation(line: 569, column: 25, scope: !567)
!572 = !DILocalVariable(name: "y_value", arg: 2, scope: !567, file: !74, line: 569, type: !18)
!573 = !DILocation(line: 569, column: 38, scope: !567)
!574 = !DILocalVariable(name: "u32Temp1", scope: !567, file: !74, line: 571, type: !433)
!575 = !DILocation(line: 571, column: 6, scope: !567)
!576 = !DILocalVariable(name: "u32Temp2", scope: !567, file: !74, line: 571, type: !433)
!577 = !DILocation(line: 571, column: 17, scope: !567)
!578 = !DILocation(line: 572, column: 12, scope: !567)
!579 = !DILocation(line: 572, column: 20, scope: !567)
!580 = !DILocation(line: 572, column: 10, scope: !567)
!581 = !DILocation(line: 573, column: 5, scope: !582)
!582 = distinct !DILexicalBlock(scope: !567, file: !74, line: 573, column: 5)
!583 = !DILocation(line: 573, column: 13, scope: !582)
!584 = !DILocation(line: 573, column: 5, scope: !567)
!585 = !DILocation(line: 575, column: 3, scope: !586)
!586 = distinct !DILexicalBlock(scope: !582, file: !74, line: 574, column: 2)
!587 = !DILocation(line: 579, column: 14, scope: !588)
!588 = distinct !DILexicalBlock(scope: !582, file: !74, line: 578, column: 2)
!589 = !DILocation(line: 579, column: 22, scope: !588)
!590 = !DILocation(line: 579, column: 21, scope: !588)
!591 = !DILocation(line: 579, column: 12, scope: !588)
!592 = !DILocation(line: 580, column: 14, scope: !588)
!593 = !DILocation(line: 580, column: 25, scope: !588)
!594 = !DILocation(line: 580, column: 36, scope: !588)
!595 = !DILocation(line: 580, column: 34, scope: !588)
!596 = !DILocation(line: 580, column: 22, scope: !588)
!597 = !DILocation(line: 580, column: 45, scope: !588)
!598 = !DILocation(line: 580, column: 12, scope: !588)
!599 = !DILocation(line: 581, column: 15, scope: !588)
!600 = !DILocation(line: 581, column: 24, scope: !588)
!601 = !DILocation(line: 581, column: 23, scope: !588)
!602 = !DILocation(line: 581, column: 36, scope: !588)
!603 = !DILocation(line: 581, column: 44, scope: !588)
!604 = !DILocation(line: 581, column: 43, scope: !588)
!605 = !DILocation(line: 581, column: 33, scope: !588)
!606 = !DILocation(line: 581, column: 12, scope: !588)
!607 = !DILocation(line: 582, column: 6, scope: !608)
!608 = distinct !DILexicalBlock(scope: !588, file: !74, line: 582, column: 6)
!609 = !DILocation(line: 582, column: 15, scope: !608)
!610 = !DILocation(line: 582, column: 6, scope: !588)
!611 = !DILocation(line: 584, column: 11, scope: !612)
!612 = distinct !DILexicalBlock(scope: !608, file: !74, line: 583, column: 3)
!613 = !DILocation(line: 584, column: 20, scope: !612)
!614 = !DILocation(line: 584, column: 4, scope: !612)
!615 = !DILocation(line: 588, column: 4, scope: !616)
!616 = distinct !DILexicalBlock(scope: !608, file: !74, line: 587, column: 3)
!617 = !DILocation(line: 592, column: 1, scope: !567)
!618 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !74, file: !74, line: 611, type: !619, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!619 = !DISubroutineType(types: !620)
!620 = !{!6, !6, !18, !6}
!621 = !DILocalVariable(name: "factor1", arg: 1, scope: !618, file: !74, line: 611, type: !6)
!622 = !DILocation(line: 611, column: 33, scope: !618)
!623 = !DILocalVariable(name: "factor2", arg: 2, scope: !618, file: !74, line: 611, type: !18)
!624 = !DILocation(line: 611, column: 46, scope: !618)
!625 = !DILocalVariable(name: "denominator", arg: 3, scope: !618, file: !74, line: 611, type: !6)
!626 = !DILocation(line: 611, column: 59, scope: !618)
!627 = !DILocalVariable(name: "s32Result", scope: !618, file: !74, line: 613, type: !25)
!628 = !DILocation(line: 613, column: 6, scope: !618)
!629 = !DILocalVariable(name: "s32Temp1", scope: !618, file: !74, line: 613, type: !25)
!630 = !DILocation(line: 613, column: 21, scope: !618)
!631 = !DILocation(line: 614, column: 14, scope: !618)
!632 = !DILocation(line: 614, column: 24, scope: !618)
!633 = !DILocation(line: 614, column: 22, scope: !618)
!634 = !DILocation(line: 614, column: 12, scope: !618)
!635 = !DILocation(line: 615, column: 5, scope: !636)
!636 = distinct !DILexicalBlock(scope: !618, file: !74, line: 615, column: 5)
!637 = !DILocation(line: 615, column: 17, scope: !636)
!638 = !DILocation(line: 615, column: 5, scope: !618)
!639 = !DILocation(line: 617, column: 6, scope: !640)
!640 = distinct !DILexicalBlock(scope: !641, file: !74, line: 617, column: 6)
!641 = distinct !DILexicalBlock(scope: !636, file: !74, line: 616, column: 2)
!642 = !DILocation(line: 617, column: 16, scope: !640)
!643 = !DILocation(line: 617, column: 6, scope: !641)
!644 = !DILocation(line: 619, column: 4, scope: !645)
!645 = distinct !DILexicalBlock(scope: !640, file: !74, line: 618, column: 3)
!646 = !DILocation(line: 623, column: 4, scope: !647)
!647 = distinct !DILexicalBlock(scope: !640, file: !74, line: 622, column: 3)
!648 = !DILocation(line: 629, column: 46, scope: !649)
!649 = distinct !DILexicalBlock(scope: !650, file: !74, line: 629, column: 7)
!650 = distinct !DILexicalBlock(scope: !636, file: !74, line: 627, column: 2)
!651 = !DILocation(line: 629, column: 36, scope: !649)
!652 = !DILocation(line: 629, column: 9, scope: !649)
!653 = !DILocation(line: 629, column: 7, scope: !650)
!654 = !DILocation(line: 630, column: 7, scope: !655)
!655 = distinct !DILexicalBlock(scope: !649, file: !74, line: 629, column: 62)
!656 = !DILocation(line: 633, column: 50, scope: !657)
!657 = distinct !DILexicalBlock(scope: !650, file: !74, line: 633, column: 7)
!658 = !DILocation(line: 633, column: 67, scope: !657)
!659 = !DILocation(line: 633, column: 62, scope: !657)
!660 = !DILocation(line: 633, column: 60, scope: !657)
!661 = !DILocation(line: 633, column: 34, scope: !657)
!662 = !DILocation(line: 633, column: 97, scope: !657)
!663 = !DILocation(line: 633, column: 92, scope: !657)
!664 = !DILocation(line: 633, column: 82, scope: !657)
!665 = !DILocation(line: 633, column: 9, scope: !657)
!666 = !DILocation(line: 633, column: 7, scope: !650)
!667 = !DILocation(line: 634, column: 7, scope: !668)
!668 = distinct !DILexicalBlock(scope: !657, file: !74, line: 633, column: 113)
!669 = !DILocation(line: 637, column: 50, scope: !670)
!670 = distinct !DILexicalBlock(scope: !650, file: !74, line: 637, column: 7)
!671 = !DILocation(line: 637, column: 67, scope: !670)
!672 = !DILocation(line: 637, column: 62, scope: !670)
!673 = !DILocation(line: 637, column: 60, scope: !670)
!674 = !DILocation(line: 637, column: 34, scope: !670)
!675 = !DILocation(line: 637, column: 97, scope: !670)
!676 = !DILocation(line: 637, column: 92, scope: !670)
!677 = !DILocation(line: 637, column: 82, scope: !670)
!678 = !DILocation(line: 637, column: 9, scope: !670)
!679 = !DILocation(line: 637, column: 7, scope: !650)
!680 = !DILocation(line: 638, column: 7, scope: !681)
!681 = distinct !DILexicalBlock(scope: !670, file: !74, line: 637, column: 113)
!682 = !DILocation(line: 640, column: 14, scope: !650)
!683 = !DILocation(line: 640, column: 27, scope: !650)
!684 = !DILocation(line: 640, column: 37, scope: !650)
!685 = !DILocation(line: 640, column: 36, scope: !650)
!686 = !DILocation(line: 640, column: 50, scope: !650)
!687 = !DILocation(line: 640, column: 49, scope: !650)
!688 = !DILocation(line: 640, column: 24, scope: !650)
!689 = !DILocation(line: 640, column: 12, scope: !650)
!690 = !DILocation(line: 642, column: 57, scope: !691)
!691 = distinct !DILexicalBlock(scope: !650, file: !74, line: 642, column: 7)
!692 = !DILocation(line: 642, column: 47, scope: !691)
!693 = !DILocation(line: 642, column: 9, scope: !691)
!694 = !DILocation(line: 642, column: 7, scope: !650)
!695 = !DILocation(line: 643, column: 7, scope: !696)
!696 = distinct !DILexicalBlock(scope: !691, file: !74, line: 642, column: 70)
!697 = !DILocation(line: 646, column: 47, scope: !698)
!698 = distinct !DILexicalBlock(scope: !650, file: !74, line: 646, column: 7)
!699 = !DILocation(line: 646, column: 37, scope: !698)
!700 = !DILocation(line: 646, column: 9, scope: !698)
!701 = !DILocation(line: 646, column: 7, scope: !650)
!702 = !DILocation(line: 647, column: 7, scope: !703)
!703 = distinct !DILexicalBlock(scope: !698, file: !74, line: 646, column: 75)
!704 = !DILocation(line: 649, column: 14, scope: !650)
!705 = !DILocation(line: 649, column: 23, scope: !650)
!706 = !DILocation(line: 649, column: 12, scope: !650)
!707 = !DILocation(line: 651, column: 46, scope: !708)
!708 = distinct !DILexicalBlock(scope: !650, file: !74, line: 651, column: 7)
!709 = !DILocation(line: 651, column: 36, scope: !708)
!710 = !DILocation(line: 651, column: 9, scope: !708)
!711 = !DILocation(line: 651, column: 7, scope: !650)
!712 = !DILocation(line: 652, column: 7, scope: !713)
!713 = distinct !DILexicalBlock(scope: !708, file: !74, line: 651, column: 62)
!714 = !DILocation(line: 655, column: 50, scope: !715)
!715 = distinct !DILexicalBlock(scope: !650, file: !74, line: 655, column: 7)
!716 = !DILocation(line: 655, column: 66, scope: !715)
!717 = !DILocation(line: 655, column: 61, scope: !715)
!718 = !DILocation(line: 655, column: 59, scope: !715)
!719 = !DILocation(line: 655, column: 34, scope: !715)
!720 = !DILocation(line: 655, column: 97, scope: !715)
!721 = !DILocation(line: 655, column: 114, scope: !715)
!722 = !DILocation(line: 655, column: 109, scope: !715)
!723 = !DILocation(line: 655, column: 107, scope: !715)
!724 = !DILocation(line: 655, column: 81, scope: !715)
!725 = !DILocation(line: 655, column: 9, scope: !715)
!726 = !DILocation(line: 655, column: 7, scope: !650)
!727 = !DILocation(line: 656, column: 7, scope: !728)
!728 = distinct !DILexicalBlock(scope: !715, file: !74, line: 655, column: 131)
!729 = !DILocation(line: 659, column: 50, scope: !730)
!730 = distinct !DILexicalBlock(scope: !650, file: !74, line: 659, column: 7)
!731 = !DILocation(line: 659, column: 66, scope: !730)
!732 = !DILocation(line: 659, column: 61, scope: !730)
!733 = !DILocation(line: 659, column: 59, scope: !730)
!734 = !DILocation(line: 659, column: 34, scope: !730)
!735 = !DILocation(line: 659, column: 97, scope: !730)
!736 = !DILocation(line: 659, column: 114, scope: !730)
!737 = !DILocation(line: 659, column: 109, scope: !730)
!738 = !DILocation(line: 659, column: 107, scope: !730)
!739 = !DILocation(line: 659, column: 81, scope: !730)
!740 = !DILocation(line: 659, column: 9, scope: !730)
!741 = !DILocation(line: 659, column: 7, scope: !650)
!742 = !DILocation(line: 660, column: 7, scope: !743)
!743 = distinct !DILexicalBlock(scope: !730, file: !74, line: 659, column: 131)
!744 = !DILocation(line: 667, column: 41, scope: !650)
!745 = !DILocation(line: 667, column: 57, scope: !650)
!746 = !DILocation(line: 667, column: 52, scope: !650)
!747 = !DILocation(line: 667, column: 50, scope: !650)
!748 = !DILocation(line: 667, column: 78, scope: !650)
!749 = !DILocation(line: 667, column: 95, scope: !650)
!750 = !DILocation(line: 667, column: 90, scope: !650)
!751 = !DILocation(line: 667, column: 88, scope: !650)
!752 = !DILocation(line: 667, column: 70, scope: !650)
!753 = !DILocation(line: 667, column: 25, scope: !650)
!754 = !DILocation(line: 667, column: 23, scope: !650)
!755 = !DILocation(line: 668, column: 3, scope: !650)
!756 = !DILocation(line: 687, column: 1, scope: !618)
!757 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !758, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!758 = !DISubroutineType(types: !759)
!759 = !{!28, !22}
!760 = !DILocalVariable(name: "denominator", arg: 1, scope: !757, file: !33, line: 24, type: !22)
!761 = !DILocation(line: 24, column: 40, scope: !757)
!762 = !DILocation(line: 26, column: 12, scope: !757)
!763 = !DILocation(line: 26, column: 24, scope: !757)
!764 = !DILocation(line: 26, column: 5, scope: !757)
!765 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !766, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!766 = !DISubroutineType(types: !767)
!767 = !{!28, !22, !22}
!768 = !DILocalVariable(name: "left", arg: 1, scope: !765, file: !33, line: 78, type: !22)
!769 = !DILocation(line: 78, column: 38, scope: !765)
!770 = !DILocalVariable(name: "right", arg: 2, scope: !765, file: !33, line: 78, type: !22)
!771 = !DILocation(line: 78, column: 52, scope: !765)
!772 = !DILocation(line: 80, column: 12, scope: !765)
!773 = !DILocation(line: 80, column: 19, scope: !765)
!774 = !DILocation(line: 80, column: 17, scope: !765)
!775 = !DILocation(line: 80, column: 25, scope: !765)
!776 = !DILocation(line: 80, column: 5, scope: !765)
!777 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !766, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!778 = !DILocalVariable(name: "left", arg: 1, scope: !777, file: !33, line: 72, type: !22)
!779 = !DILocation(line: 72, column: 38, scope: !777)
!780 = !DILocalVariable(name: "right", arg: 2, scope: !777, file: !33, line: 72, type: !22)
!781 = !DILocation(line: 72, column: 52, scope: !777)
!782 = !DILocation(line: 74, column: 12, scope: !777)
!783 = !DILocation(line: 74, column: 19, scope: !777)
!784 = !DILocation(line: 74, column: 17, scope: !777)
!785 = !DILocation(line: 74, column: 25, scope: !777)
!786 = !DILocation(line: 74, column: 5, scope: !777)
!787 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !758, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!788 = !DILocalVariable(name: "left", arg: 1, scope: !787, file: !33, line: 84, type: !22)
!789 = !DILocation(line: 84, column: 51, scope: !787)
!790 = !DILocation(line: 86, column: 12, scope: !787)
!791 = !DILocation(line: 86, column: 17, scope: !787)
!792 = !DILocation(line: 86, column: 5, scope: !787)
!793 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !794, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!794 = !DISubroutineType(types: !795)
!795 = !{!28, !22, !29}
!796 = !DILocalVariable(name: "left", arg: 1, scope: !793, file: !33, line: 90, type: !22)
!797 = !DILocation(line: 90, column: 41, scope: !793)
!798 = !DILocalVariable(name: "count", arg: 2, scope: !793, file: !33, line: 90, type: !29)
!799 = !DILocation(line: 90, column: 56, scope: !793)
!800 = !DILocation(line: 92, column: 9, scope: !801)
!801 = distinct !DILexicalBlock(scope: !793, file: !33, line: 92, column: 9)
!802 = !DILocation(line: 92, column: 15, scope: !801)
!803 = !DILocation(line: 92, column: 9, scope: !793)
!804 = !DILocation(line: 93, column: 9, scope: !805)
!805 = distinct !DILexicalBlock(scope: !801, file: !33, line: 92, column: 32)
!806 = !DILocation(line: 95, column: 12, scope: !793)
!807 = !DILocation(line: 95, column: 34, scope: !793)
!808 = !DILocation(line: 95, column: 31, scope: !793)
!809 = !DILocation(line: 95, column: 17, scope: !793)
!810 = !DILocation(line: 95, column: 41, scope: !793)
!811 = !DILocation(line: 95, column: 5, scope: !793)
!812 = !DILocation(line: 96, column: 1, scope: !793)
!813 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !766, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!814 = !DILocalVariable(name: "left", arg: 1, scope: !813, file: !33, line: 48, type: !22)
!815 = !DILocation(line: 48, column: 38, scope: !813)
!816 = !DILocalVariable(name: "right", arg: 2, scope: !813, file: !33, line: 48, type: !22)
!817 = !DILocation(line: 48, column: 52, scope: !813)
!818 = !DILocation(line: 50, column: 12, scope: !813)
!819 = !DILocation(line: 50, column: 19, scope: !813)
!820 = !DILocation(line: 50, column: 17, scope: !813)
!821 = !DILocation(line: 50, column: 25, scope: !813)
!822 = !DILocation(line: 50, column: 5, scope: !813)
!823 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !766, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!824 = !DILocalVariable(name: "left", arg: 1, scope: !823, file: !33, line: 54, type: !22)
!825 = !DILocation(line: 54, column: 38, scope: !823)
!826 = !DILocalVariable(name: "right", arg: 2, scope: !823, file: !33, line: 54, type: !22)
!827 = !DILocation(line: 54, column: 52, scope: !823)
!828 = !DILocation(line: 56, column: 12, scope: !823)
!829 = !DILocation(line: 56, column: 19, scope: !823)
!830 = !DILocation(line: 56, column: 17, scope: !823)
!831 = !DILocation(line: 56, column: 25, scope: !823)
!832 = !DILocation(line: 56, column: 5, scope: !823)
!833 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !74, file: !74, line: 705, type: !834, scopeLine: 706, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!834 = !DISubroutineType(types: !835)
!835 = !{!6, !18, !6, !18}
!836 = !DILocalVariable(name: "factor1", arg: 1, scope: !833, file: !74, line: 705, type: !18)
!837 = !DILocation(line: 705, column: 33, scope: !833)
!838 = !DILocalVariable(name: "factor2", arg: 2, scope: !833, file: !74, line: 705, type: !6)
!839 = !DILocation(line: 705, column: 46, scope: !833)
!840 = !DILocalVariable(name: "denominator", arg: 3, scope: !833, file: !74, line: 705, type: !18)
!841 = !DILocation(line: 705, column: 59, scope: !833)
!842 = !DILocalVariable(name: "s32Result", scope: !833, file: !74, line: 707, type: !25)
!843 = !DILocation(line: 707, column: 6, scope: !833)
!844 = !DILocalVariable(name: "s32Temp1", scope: !833, file: !74, line: 707, type: !25)
!845 = !DILocation(line: 707, column: 21, scope: !833)
!846 = !DILocation(line: 708, column: 14, scope: !833)
!847 = !DILocation(line: 708, column: 24, scope: !833)
!848 = !DILocation(line: 708, column: 22, scope: !833)
!849 = !DILocation(line: 708, column: 12, scope: !833)
!850 = !DILocation(line: 709, column: 5, scope: !851)
!851 = distinct !DILexicalBlock(scope: !833, file: !74, line: 709, column: 5)
!852 = !DILocation(line: 709, column: 16, scope: !851)
!853 = !DILocation(line: 709, column: 5, scope: !833)
!854 = !DILocation(line: 711, column: 6, scope: !855)
!855 = distinct !DILexicalBlock(scope: !856, file: !74, line: 711, column: 6)
!856 = distinct !DILexicalBlock(scope: !851, file: !74, line: 710, column: 2)
!857 = !DILocation(line: 711, column: 16, scope: !855)
!858 = !DILocation(line: 711, column: 6, scope: !856)
!859 = !DILocation(line: 713, column: 4, scope: !860)
!860 = distinct !DILexicalBlock(scope: !855, file: !74, line: 712, column: 3)
!861 = !DILocation(line: 717, column: 4, scope: !862)
!862 = distinct !DILexicalBlock(scope: !855, file: !74, line: 716, column: 3)
!863 = !DILocation(line: 722, column: 14, scope: !864)
!864 = distinct !DILexicalBlock(scope: !851, file: !74, line: 721, column: 2)
!865 = !DILocation(line: 722, column: 28, scope: !864)
!866 = !DILocation(line: 722, column: 38, scope: !864)
!867 = !DILocation(line: 722, column: 37, scope: !864)
!868 = !DILocation(line: 722, column: 53, scope: !864)
!869 = !DILocation(line: 722, column: 51, scope: !864)
!870 = !DILocation(line: 722, column: 24, scope: !864)
!871 = !DILocation(line: 722, column: 66, scope: !864)
!872 = !DILocation(line: 722, column: 12, scope: !864)
!873 = !DILocation(line: 723, column: 16, scope: !864)
!874 = !DILocation(line: 723, column: 25, scope: !864)
!875 = !DILocation(line: 723, column: 24, scope: !864)
!876 = !DILocation(line: 723, column: 41, scope: !864)
!877 = !DILocation(line: 723, column: 51, scope: !864)
!878 = !DILocation(line: 723, column: 50, scope: !864)
!879 = !DILocation(line: 723, column: 38, scope: !864)
!880 = !DILocation(line: 723, column: 13, scope: !864)
!881 = !DILocation(line: 724, column: 6, scope: !882)
!882 = distinct !DILexicalBlock(scope: !864, file: !74, line: 724, column: 6)
!883 = !DILocation(line: 724, column: 16, scope: !882)
!884 = !DILocation(line: 724, column: 6, scope: !864)
!885 = !DILocation(line: 726, column: 7, scope: !886)
!886 = distinct !DILexicalBlock(scope: !887, file: !74, line: 726, column: 7)
!887 = distinct !DILexicalBlock(scope: !882, file: !74, line: 725, column: 3)
!888 = !DILocation(line: 726, column: 17, scope: !886)
!889 = !DILocation(line: 726, column: 7, scope: !887)
!890 = !DILocation(line: 728, column: 17, scope: !891)
!891 = distinct !DILexicalBlock(scope: !886, file: !74, line: 727, column: 4)
!892 = !DILocation(line: 728, column: 12, scope: !891)
!893 = !DILocation(line: 728, column: 5, scope: !891)
!894 = !DILocation(line: 732, column: 5, scope: !895)
!895 = distinct !DILexicalBlock(scope: !886, file: !74, line: 731, column: 4)
!896 = !DILocation(line: 737, column: 4, scope: !897)
!897 = distinct !DILexicalBlock(scope: !882, file: !74, line: 736, column: 3)
!898 = !DILocation(line: 740, column: 1, scope: !833)
!899 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !74, file: !74, line: 759, type: !900, scopeLine: 760, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!900 = !DISubroutineType(types: !901)
!901 = !{!18, !6, !18, !6}
!902 = !DILocalVariable(name: "factor1", arg: 1, scope: !899, file: !74, line: 759, type: !6)
!903 = !DILocation(line: 759, column: 33, scope: !899)
!904 = !DILocalVariable(name: "factor2", arg: 2, scope: !899, file: !74, line: 759, type: !18)
!905 = !DILocation(line: 759, column: 46, scope: !899)
!906 = !DILocalVariable(name: "denominator", arg: 3, scope: !899, file: !74, line: 759, type: !6)
!907 = !DILocation(line: 759, column: 59, scope: !899)
!908 = !DILocalVariable(name: "u32Result", scope: !899, file: !74, line: 761, type: !433)
!909 = !DILocation(line: 761, column: 6, scope: !899)
!910 = !DILocalVariable(name: "u32Temp1", scope: !899, file: !74, line: 761, type: !433)
!911 = !DILocation(line: 761, column: 21, scope: !899)
!912 = !DILocalVariable(name: "s32Result", scope: !899, file: !74, line: 762, type: !25)
!913 = !DILocation(line: 762, column: 6, scope: !899)
!914 = !DILocalVariable(name: "s32Temp1", scope: !899, file: !74, line: 762, type: !25)
!915 = !DILocation(line: 762, column: 21, scope: !899)
!916 = !DILocation(line: 763, column: 14, scope: !899)
!917 = !DILocation(line: 763, column: 24, scope: !899)
!918 = !DILocation(line: 763, column: 22, scope: !899)
!919 = !DILocation(line: 763, column: 12, scope: !899)
!920 = !DILocation(line: 765, column: 5, scope: !921)
!921 = distinct !DILexicalBlock(scope: !899, file: !74, line: 765, column: 5)
!922 = !DILocation(line: 765, column: 17, scope: !921)
!923 = !DILocation(line: 765, column: 5, scope: !899)
!924 = !DILocation(line: 767, column: 6, scope: !925)
!925 = distinct !DILexicalBlock(scope: !926, file: !74, line: 767, column: 6)
!926 = distinct !DILexicalBlock(scope: !921, file: !74, line: 766, column: 2)
!927 = !DILocation(line: 767, column: 16, scope: !925)
!928 = !DILocation(line: 767, column: 6, scope: !926)
!929 = !DILocation(line: 769, column: 4, scope: !930)
!930 = distinct !DILexicalBlock(scope: !925, file: !74, line: 768, column: 3)
!931 = !DILocation(line: 773, column: 4, scope: !932)
!932 = distinct !DILexicalBlock(scope: !925, file: !74, line: 772, column: 3)
!933 = !DILocation(line: 778, column: 15, scope: !934)
!934 = distinct !DILexicalBlock(scope: !921, file: !74, line: 777, column: 2)
!935 = !DILocation(line: 778, column: 29, scope: !934)
!936 = !DILocation(line: 778, column: 39, scope: !934)
!937 = !DILocation(line: 778, column: 38, scope: !934)
!938 = !DILocation(line: 778, column: 54, scope: !934)
!939 = !DILocation(line: 778, column: 52, scope: !934)
!940 = !DILocation(line: 778, column: 25, scope: !934)
!941 = !DILocation(line: 778, column: 68, scope: !934)
!942 = !DILocation(line: 778, column: 12, scope: !934)
!943 = !DILocation(line: 779, column: 16, scope: !934)
!944 = !DILocation(line: 779, column: 25, scope: !934)
!945 = !DILocation(line: 779, column: 24, scope: !934)
!946 = !DILocation(line: 779, column: 41, scope: !934)
!947 = !DILocation(line: 779, column: 51, scope: !934)
!948 = !DILocation(line: 779, column: 50, scope: !934)
!949 = !DILocation(line: 779, column: 38, scope: !934)
!950 = !DILocation(line: 779, column: 13, scope: !934)
!951 = !DILocation(line: 780, column: 6, scope: !952)
!952 = distinct !DILexicalBlock(scope: !934, file: !74, line: 780, column: 6)
!953 = !DILocation(line: 780, column: 16, scope: !952)
!954 = !DILocation(line: 780, column: 6, scope: !934)
!955 = !DILocation(line: 782, column: 7, scope: !956)
!956 = distinct !DILexicalBlock(scope: !957, file: !74, line: 782, column: 7)
!957 = distinct !DILexicalBlock(scope: !952, file: !74, line: 781, column: 3)
!958 = !DILocation(line: 782, column: 17, scope: !956)
!959 = !DILocation(line: 782, column: 7, scope: !957)
!960 = !DILocation(line: 784, column: 17, scope: !961)
!961 = distinct !DILexicalBlock(scope: !956, file: !74, line: 783, column: 4)
!962 = !DILocation(line: 784, column: 12, scope: !961)
!963 = !DILocation(line: 784, column: 5, scope: !961)
!964 = !DILocation(line: 788, column: 5, scope: !965)
!965 = distinct !DILexicalBlock(scope: !956, file: !74, line: 787, column: 4)
!966 = !DILocation(line: 793, column: 4, scope: !967)
!967 = distinct !DILexicalBlock(scope: !952, file: !74, line: 792, column: 3)
!968 = !DILocation(line: 796, column: 1, scope: !899)
!969 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !74, file: !74, line: 815, type: !970, scopeLine: 816, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!970 = !DISubroutineType(types: !971)
!971 = !{!18, !6, !18, !18}
!972 = !DILocalVariable(name: "factor1", arg: 1, scope: !969, file: !74, line: 815, type: !6)
!973 = !DILocation(line: 815, column: 33, scope: !969)
!974 = !DILocalVariable(name: "factor2", arg: 2, scope: !969, file: !74, line: 815, type: !18)
!975 = !DILocation(line: 815, column: 46, scope: !969)
!976 = !DILocalVariable(name: "denominator", arg: 3, scope: !969, file: !74, line: 815, type: !18)
!977 = !DILocation(line: 815, column: 59, scope: !969)
!978 = !DILocalVariable(name: "s32Result", scope: !969, file: !74, line: 817, type: !25)
!979 = !DILocation(line: 817, column: 6, scope: !969)
!980 = !DILocalVariable(name: "s32Temp1", scope: !969, file: !74, line: 817, type: !25)
!981 = !DILocation(line: 817, column: 21, scope: !969)
!982 = !DILocation(line: 818, column: 14, scope: !969)
!983 = !DILocation(line: 818, column: 24, scope: !969)
!984 = !DILocation(line: 818, column: 22, scope: !969)
!985 = !DILocation(line: 818, column: 12, scope: !969)
!986 = !DILocation(line: 820, column: 5, scope: !987)
!987 = distinct !DILexicalBlock(scope: !969, file: !74, line: 820, column: 5)
!988 = !DILocation(line: 820, column: 17, scope: !987)
!989 = !DILocation(line: 820, column: 5, scope: !969)
!990 = !DILocation(line: 822, column: 6, scope: !991)
!991 = distinct !DILexicalBlock(scope: !992, file: !74, line: 822, column: 6)
!992 = distinct !DILexicalBlock(scope: !987, file: !74, line: 821, column: 2)
!993 = !DILocation(line: 822, column: 16, scope: !991)
!994 = !DILocation(line: 822, column: 6, scope: !992)
!995 = !DILocation(line: 824, column: 4, scope: !996)
!996 = distinct !DILexicalBlock(scope: !991, file: !74, line: 823, column: 3)
!997 = !DILocation(line: 828, column: 4, scope: !998)
!998 = distinct !DILexicalBlock(scope: !991, file: !74, line: 827, column: 3)
!999 = !DILocation(line: 833, column: 15, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !987, file: !74, line: 832, column: 2)
!1001 = !DILocation(line: 833, column: 29, scope: !1000)
!1002 = !DILocation(line: 833, column: 39, scope: !1000)
!1003 = !DILocation(line: 833, column: 38, scope: !1000)
!1004 = !DILocation(line: 833, column: 54, scope: !1000)
!1005 = !DILocation(line: 833, column: 52, scope: !1000)
!1006 = !DILocation(line: 833, column: 25, scope: !1000)
!1007 = !DILocation(line: 833, column: 68, scope: !1000)
!1008 = !DILocation(line: 833, column: 12, scope: !1000)
!1009 = !DILocation(line: 834, column: 16, scope: !1000)
!1010 = !DILocation(line: 834, column: 25, scope: !1000)
!1011 = !DILocation(line: 834, column: 24, scope: !1000)
!1012 = !DILocation(line: 834, column: 41, scope: !1000)
!1013 = !DILocation(line: 834, column: 51, scope: !1000)
!1014 = !DILocation(line: 834, column: 50, scope: !1000)
!1015 = !DILocation(line: 834, column: 38, scope: !1000)
!1016 = !DILocation(line: 834, column: 13, scope: !1000)
!1017 = !DILocation(line: 835, column: 6, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1000, file: !74, line: 835, column: 6)
!1019 = !DILocation(line: 835, column: 16, scope: !1018)
!1020 = !DILocation(line: 835, column: 6, scope: !1000)
!1021 = !DILocation(line: 837, column: 7, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1023, file: !74, line: 837, column: 7)
!1023 = distinct !DILexicalBlock(scope: !1018, file: !74, line: 836, column: 3)
!1024 = !DILocation(line: 837, column: 17, scope: !1022)
!1025 = !DILocation(line: 837, column: 7, scope: !1023)
!1026 = !DILocation(line: 839, column: 17, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1022, file: !74, line: 838, column: 4)
!1028 = !DILocation(line: 839, column: 12, scope: !1027)
!1029 = !DILocation(line: 839, column: 5, scope: !1027)
!1030 = !DILocation(line: 843, column: 5, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1022, file: !74, line: 842, column: 4)
!1032 = !DILocation(line: 848, column: 4, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1018, file: !74, line: 847, column: 3)
!1034 = !DILocation(line: 852, column: 1, scope: !969)
!1035 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 870, type: !1036, scopeLine: 871, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!18, !18, !18, !18}
!1038 = !DILocalVariable(name: "factor1", arg: 1, scope: !1035, file: !74, line: 870, type: !18)
!1039 = !DILocation(line: 870, column: 33, scope: !1035)
!1040 = !DILocalVariable(name: "factor2", arg: 2, scope: !1035, file: !74, line: 870, type: !18)
!1041 = !DILocation(line: 870, column: 46, scope: !1035)
!1042 = !DILocalVariable(name: "denominator", arg: 3, scope: !1035, file: !74, line: 870, type: !18)
!1043 = !DILocation(line: 870, column: 59, scope: !1035)
!1044 = !DILocalVariable(name: "u32Temp1", scope: !1035, file: !74, line: 872, type: !433)
!1045 = !DILocation(line: 872, column: 6, scope: !1035)
!1046 = !DILocalVariable(name: "u16TempDenom", scope: !1035, file: !74, line: 873, type: !18)
!1047 = !DILocation(line: 873, column: 6, scope: !1035)
!1048 = !DILocation(line: 875, column: 5, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1035, file: !74, line: 875, column: 5)
!1050 = !DILocation(line: 875, column: 17, scope: !1049)
!1051 = !DILocation(line: 875, column: 5, scope: !1035)
!1052 = !DILocation(line: 877, column: 3, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1049, file: !74, line: 876, column: 2)
!1054 = !DILocation(line: 881, column: 14, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1049, file: !74, line: 880, column: 2)
!1056 = !DILocation(line: 881, column: 24, scope: !1055)
!1057 = !DILocation(line: 881, column: 22, scope: !1055)
!1058 = !DILocation(line: 881, column: 12, scope: !1055)
!1059 = !DILocation(line: 882, column: 18, scope: !1055)
!1060 = !DILocation(line: 882, column: 30, scope: !1055)
!1061 = !DILocation(line: 882, column: 16, scope: !1055)
!1062 = !DILocation(line: 883, column: 14, scope: !1055)
!1063 = !DILocation(line: 883, column: 25, scope: !1055)
!1064 = !DILocation(line: 883, column: 23, scope: !1055)
!1065 = !DILocation(line: 883, column: 12, scope: !1055)
!1066 = !DILocation(line: 884, column: 14, scope: !1055)
!1067 = !DILocation(line: 884, column: 25, scope: !1055)
!1068 = !DILocation(line: 884, column: 23, scope: !1055)
!1069 = !DILocation(line: 884, column: 12, scope: !1055)
!1070 = !DILocation(line: 885, column: 6, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1055, file: !74, line: 885, column: 6)
!1072 = !DILocation(line: 885, column: 15, scope: !1071)
!1073 = !DILocation(line: 885, column: 6, scope: !1055)
!1074 = !DILocation(line: 887, column: 12, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1071, file: !74, line: 886, column: 3)
!1076 = !DILocation(line: 887, column: 21, scope: !1075)
!1077 = !DILocation(line: 887, column: 11, scope: !1075)
!1078 = !DILocation(line: 887, column: 4, scope: !1075)
!1079 = !DILocation(line: 892, column: 4, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1071, file: !74, line: 891, column: 3)
!1081 = !DILocation(line: 897, column: 1, scope: !1035)
!1082 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 914, type: !1083, scopeLine: 915, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!18, !18, !18, !433}
!1085 = !DILocalVariable(name: "factor1", arg: 1, scope: !1082, file: !74, line: 914, type: !18)
!1086 = !DILocation(line: 914, column: 33, scope: !1082)
!1087 = !DILocalVariable(name: "factor2", arg: 2, scope: !1082, file: !74, line: 914, type: !18)
!1088 = !DILocation(line: 914, column: 46, scope: !1082)
!1089 = !DILocalVariable(name: "denominator", arg: 3, scope: !1082, file: !74, line: 914, type: !433)
!1090 = !DILocation(line: 914, column: 59, scope: !1082)
!1091 = !DILocalVariable(name: "u32Temp1", scope: !1082, file: !74, line: 916, type: !433)
!1092 = !DILocation(line: 916, column: 6, scope: !1082)
!1093 = !DILocation(line: 917, column: 5, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1082, file: !74, line: 917, column: 5)
!1095 = !DILocation(line: 917, column: 17, scope: !1094)
!1096 = !DILocation(line: 917, column: 5, scope: !1082)
!1097 = !DILocation(line: 919, column: 3, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1094, file: !74, line: 918, column: 2)
!1099 = !DILocation(line: 923, column: 15, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1094, file: !74, line: 922, column: 2)
!1101 = !DILocation(line: 923, column: 25, scope: !1100)
!1102 = !DILocation(line: 923, column: 23, scope: !1100)
!1103 = !DILocation(line: 923, column: 36, scope: !1100)
!1104 = !DILocation(line: 923, column: 34, scope: !1100)
!1105 = !DILocation(line: 923, column: 12, scope: !1100)
!1106 = !DILocation(line: 924, column: 8, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1100, file: !74, line: 924, column: 6)
!1108 = !DILocation(line: 924, column: 18, scope: !1107)
!1109 = !DILocation(line: 924, column: 16, scope: !1107)
!1110 = !DILocation(line: 924, column: 28, scope: !1107)
!1111 = !DILocation(line: 924, column: 40, scope: !1107)
!1112 = !DILocation(line: 924, column: 39, scope: !1107)
!1113 = !DILocation(line: 924, column: 26, scope: !1107)
!1114 = !DILocation(line: 924, column: 53, scope: !1107)
!1115 = !DILocation(line: 924, column: 64, scope: !1107)
!1116 = !DILocation(line: 924, column: 50, scope: !1107)
!1117 = !DILocation(line: 924, column: 6, scope: !1100)
!1118 = !DILocation(line: 926, column: 12, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1107, file: !74, line: 925, column: 3)
!1120 = !DILocation(line: 927, column: 3, scope: !1119)
!1121 = !DILocation(line: 928, column: 6, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1100, file: !74, line: 928, column: 6)
!1123 = !DILocation(line: 928, column: 15, scope: !1122)
!1124 = !DILocation(line: 928, column: 6, scope: !1100)
!1125 = !DILocation(line: 930, column: 12, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1122, file: !74, line: 929, column: 3)
!1127 = !DILocation(line: 930, column: 21, scope: !1126)
!1128 = !DILocation(line: 930, column: 11, scope: !1126)
!1129 = !DILocation(line: 930, column: 4, scope: !1126)
!1130 = !DILocation(line: 934, column: 4, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1122, file: !74, line: 933, column: 3)
!1132 = !DILocation(line: 937, column: 1, scope: !1082)
!1133 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 954, type: !1134, scopeLine: 955, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!433, !433, !18}
!1136 = !DILocalVariable(name: "x_value", arg: 1, scope: !1133, file: !74, line: 954, type: !433)
!1137 = !DILocation(line: 954, column: 25, scope: !1133)
!1138 = !DILocalVariable(name: "y_value", arg: 2, scope: !1133, file: !74, line: 954, type: !18)
!1139 = !DILocation(line: 954, column: 38, scope: !1133)
!1140 = !DILocalVariable(name: "u32Temp1", scope: !1133, file: !74, line: 956, type: !433)
!1141 = !DILocation(line: 956, column: 6, scope: !1133)
!1142 = !DILocation(line: 957, column: 5, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1133, file: !74, line: 957, column: 5)
!1144 = !DILocation(line: 957, column: 13, scope: !1143)
!1145 = !DILocation(line: 957, column: 5, scope: !1133)
!1146 = !DILocation(line: 959, column: 3, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1143, file: !74, line: 958, column: 2)
!1148 = !DILocation(line: 963, column: 15, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1143, file: !74, line: 962, column: 2)
!1150 = !DILocation(line: 963, column: 26, scope: !1149)
!1151 = !DILocation(line: 963, column: 34, scope: !1149)
!1152 = !DILocation(line: 963, column: 33, scope: !1149)
!1153 = !DILocation(line: 963, column: 45, scope: !1149)
!1154 = !DILocation(line: 963, column: 43, scope: !1149)
!1155 = !DILocation(line: 963, column: 23, scope: !1149)
!1156 = !DILocation(line: 963, column: 54, scope: !1149)
!1157 = !DILocation(line: 963, column: 12, scope: !1149)
!1158 = !DILocation(line: 964, column: 15, scope: !1149)
!1159 = !DILocation(line: 964, column: 23, scope: !1149)
!1160 = !DILocation(line: 964, column: 22, scope: !1149)
!1161 = !DILocation(line: 964, column: 35, scope: !1149)
!1162 = !DILocation(line: 964, column: 44, scope: !1149)
!1163 = !DILocation(line: 964, column: 43, scope: !1149)
!1164 = !DILocation(line: 964, column: 32, scope: !1149)
!1165 = !DILocation(line: 964, column: 12, scope: !1149)
!1166 = !DILocation(line: 965, column: 10, scope: !1149)
!1167 = !DILocation(line: 965, column: 3, scope: !1149)
!1168 = !DILocation(line: 967, column: 1, scope: !1133)
!1169 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 985, type: !1170, scopeLine: 986, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!6, !6, !6, !6}
!1172 = !DILocalVariable(name: "fak1", arg: 1, scope: !1169, file: !74, line: 985, type: !6)
!1173 = !DILocation(line: 985, column: 33, scope: !1169)
!1174 = !DILocalVariable(name: "fak2", arg: 2, scope: !1169, file: !74, line: 985, type: !6)
!1175 = !DILocation(line: 985, column: 43, scope: !1169)
!1176 = !DILocalVariable(name: "div", arg: 3, scope: !1169, file: !74, line: 985, type: !6)
!1177 = !DILocation(line: 985, column: 53, scope: !1169)
!1178 = !DILocalVariable(name: "s32Temp1", scope: !1169, file: !74, line: 987, type: !25)
!1179 = !DILocation(line: 987, column: 6, scope: !1169)
!1180 = !DILocalVariable(name: "s32Temp2", scope: !1169, file: !74, line: 987, type: !25)
!1181 = !DILocation(line: 987, column: 20, scope: !1169)
!1182 = !DILocalVariable(name: "s32Temp3", scope: !1169, file: !74, line: 987, type: !25)
!1183 = !DILocation(line: 987, column: 34, scope: !1169)
!1184 = !DILocation(line: 988, column: 13, scope: !1169)
!1185 = !DILocation(line: 988, column: 20, scope: !1169)
!1186 = !DILocation(line: 988, column: 18, scope: !1169)
!1187 = !DILocation(line: 988, column: 11, scope: !1169)
!1188 = !DILocation(line: 989, column: 5, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1169, file: !74, line: 989, column: 5)
!1190 = !DILocation(line: 989, column: 9, scope: !1189)
!1191 = !DILocation(line: 989, column: 5, scope: !1169)
!1192 = !DILocation(line: 991, column: 6, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1194, file: !74, line: 991, column: 6)
!1194 = distinct !DILexicalBlock(scope: !1189, file: !74, line: 990, column: 2)
!1195 = !DILocation(line: 991, column: 15, scope: !1193)
!1196 = !DILocation(line: 991, column: 6, scope: !1194)
!1197 = !DILocation(line: 993, column: 4, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1193, file: !74, line: 992, column: 3)
!1199 = !DILocation(line: 997, column: 4, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1193, file: !74, line: 996, column: 3)
!1201 = !DILocation(line: 1002, column: 15, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1189, file: !74, line: 1001, column: 2)
!1203 = !DILocation(line: 1002, column: 28, scope: !1202)
!1204 = !DILocation(line: 1002, column: 39, scope: !1202)
!1205 = !DILocation(line: 1002, column: 37, scope: !1202)
!1206 = !DILocation(line: 1002, column: 46, scope: !1202)
!1207 = !DILocation(line: 1002, column: 44, scope: !1202)
!1208 = !DILocation(line: 1002, column: 24, scope: !1202)
!1209 = !DILocation(line: 1002, column: 52, scope: !1202)
!1210 = !DILocation(line: 1002, column: 12, scope: !1202)
!1211 = !DILocation(line: 1003, column: 15, scope: !1202)
!1212 = !DILocation(line: 1003, column: 24, scope: !1202)
!1213 = !DILocation(line: 1003, column: 23, scope: !1202)
!1214 = !DILocation(line: 1003, column: 32, scope: !1202)
!1215 = !DILocation(line: 1003, column: 41, scope: !1202)
!1216 = !DILocation(line: 1003, column: 40, scope: !1202)
!1217 = !DILocation(line: 1003, column: 29, scope: !1202)
!1218 = !DILocation(line: 1003, column: 12, scope: !1202)
!1219 = !DILocation(line: 1004, column: 6, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1202, file: !74, line: 1004, column: 6)
!1221 = !DILocation(line: 1004, column: 15, scope: !1220)
!1222 = !DILocation(line: 1004, column: 6, scope: !1202)
!1223 = !DILocation(line: 1006, column: 7, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1225, file: !74, line: 1006, column: 7)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !74, line: 1005, column: 3)
!1226 = !DILocation(line: 1006, column: 16, scope: !1224)
!1227 = !DILocation(line: 1006, column: 7, scope: !1225)
!1228 = !DILocation(line: 1008, column: 17, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1224, file: !74, line: 1007, column: 4)
!1230 = !DILocation(line: 1008, column: 12, scope: !1229)
!1231 = !DILocation(line: 1008, column: 5, scope: !1229)
!1232 = !DILocation(line: 1012, column: 5, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1224, file: !74, line: 1011, column: 4)
!1234 = !DILocation(line: 1017, column: 4, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1220, file: !74, line: 1016, column: 3)
!1236 = !DILocation(line: 1020, column: 1, scope: !1169)
!1237 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1038, type: !1238, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!6, !6, !6, !18}
!1240 = !DILocalVariable(name: "data1", arg: 1, scope: !1237, file: !74, line: 1038, type: !6)
!1241 = !DILocation(line: 1038, column: 33, scope: !1237)
!1242 = !DILocalVariable(name: "data2", arg: 2, scope: !1237, file: !74, line: 1038, type: !6)
!1243 = !DILocation(line: 1038, column: 43, scope: !1237)
!1244 = !DILocalVariable(name: "denominator", arg: 3, scope: !1237, file: !74, line: 1038, type: !18)
!1245 = !DILocation(line: 1038, column: 53, scope: !1237)
!1246 = !DILocalVariable(name: "s32Result", scope: !1237, file: !74, line: 1040, type: !25)
!1247 = !DILocation(line: 1040, column: 6, scope: !1237)
!1248 = !DILocalVariable(name: "s32Temp1", scope: !1237, file: !74, line: 1040, type: !25)
!1249 = !DILocation(line: 1040, column: 21, scope: !1237)
!1250 = !DILocation(line: 1041, column: 14, scope: !1237)
!1251 = !DILocation(line: 1041, column: 22, scope: !1237)
!1252 = !DILocation(line: 1041, column: 20, scope: !1237)
!1253 = !DILocation(line: 1041, column: 12, scope: !1237)
!1254 = !DILocation(line: 1043, column: 5, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1237, file: !74, line: 1043, column: 5)
!1256 = !DILocation(line: 1043, column: 17, scope: !1255)
!1257 = !DILocation(line: 1043, column: 5, scope: !1237)
!1258 = !DILocation(line: 1045, column: 6, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1260, file: !74, line: 1045, column: 6)
!1260 = distinct !DILexicalBlock(scope: !1255, file: !74, line: 1044, column: 2)
!1261 = !DILocation(line: 1045, column: 16, scope: !1259)
!1262 = !DILocation(line: 1045, column: 6, scope: !1260)
!1263 = !DILocation(line: 1047, column: 4, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1259, file: !74, line: 1046, column: 3)
!1265 = !DILocation(line: 1049, column: 11, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1259, file: !74, line: 1049, column: 11)
!1267 = !DILocation(line: 1049, column: 21, scope: !1266)
!1268 = !DILocation(line: 1049, column: 11, scope: !1259)
!1269 = !DILocation(line: 1051, column: 4, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1266, file: !74, line: 1050, column: 3)
!1271 = !DILocation(line: 1055, column: 4, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1266, file: !74, line: 1054, column: 3)
!1273 = !DILocation(line: 1060, column: 15, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1255, file: !74, line: 1059, column: 2)
!1275 = !DILocation(line: 1060, column: 28, scope: !1274)
!1276 = !DILocation(line: 1060, column: 38, scope: !1274)
!1277 = !DILocation(line: 1060, column: 37, scope: !1274)
!1278 = !DILocation(line: 1060, column: 51, scope: !1274)
!1279 = !DILocation(line: 1060, column: 50, scope: !1274)
!1280 = !DILocation(line: 1060, column: 25, scope: !1274)
!1281 = !DILocation(line: 1060, column: 64, scope: !1274)
!1282 = !DILocation(line: 1060, column: 12, scope: !1274)
!1283 = !DILocation(line: 1061, column: 16, scope: !1274)
!1284 = !DILocation(line: 1061, column: 25, scope: !1274)
!1285 = !DILocation(line: 1061, column: 24, scope: !1274)
!1286 = !DILocation(line: 1061, column: 41, scope: !1274)
!1287 = !DILocation(line: 1061, column: 51, scope: !1274)
!1288 = !DILocation(line: 1061, column: 50, scope: !1274)
!1289 = !DILocation(line: 1061, column: 38, scope: !1274)
!1290 = !DILocation(line: 1061, column: 13, scope: !1274)
!1291 = !DILocation(line: 1062, column: 6, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1274, file: !74, line: 1062, column: 6)
!1293 = !DILocation(line: 1062, column: 16, scope: !1292)
!1294 = !DILocation(line: 1062, column: 6, scope: !1274)
!1295 = !DILocation(line: 1064, column: 7, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1297, file: !74, line: 1064, column: 7)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !74, line: 1063, column: 3)
!1298 = !DILocation(line: 1064, column: 17, scope: !1296)
!1299 = !DILocation(line: 1064, column: 7, scope: !1297)
!1300 = !DILocation(line: 1066, column: 17, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1296, file: !74, line: 1065, column: 4)
!1302 = !DILocation(line: 1066, column: 12, scope: !1301)
!1303 = !DILocation(line: 1066, column: 5, scope: !1301)
!1304 = !DILocation(line: 1070, column: 5, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1296, file: !74, line: 1069, column: 4)
!1306 = !DILocation(line: 1075, column: 4, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1292, file: !74, line: 1074, column: 3)
!1308 = !DILocation(line: 1079, column: 1, scope: !1237)
!1309 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1096, type: !1310, scopeLine: 1097, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!433, !433, !25}
!1312 = !DILocalVariable(name: "numerator", arg: 1, scope: !1309, file: !74, line: 1096, type: !433)
!1313 = !DILocation(line: 1096, column: 25, scope: !1309)
!1314 = !DILocalVariable(name: "denominator", arg: 2, scope: !1309, file: !74, line: 1096, type: !25)
!1315 = !DILocation(line: 1096, column: 40, scope: !1309)
!1316 = !DILocalVariable(name: "u32Temp1", scope: !1309, file: !74, line: 1098, type: !433)
!1317 = !DILocation(line: 1098, column: 6, scope: !1309)
!1318 = !DILocation(line: 1099, column: 5, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1309, file: !74, line: 1099, column: 5)
!1320 = !DILocation(line: 1099, column: 17, scope: !1319)
!1321 = !DILocation(line: 1099, column: 5, scope: !1309)
!1322 = !DILocation(line: 1101, column: 3, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1319, file: !74, line: 1100, column: 2)
!1324 = !DILocation(line: 1105, column: 6, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1326, file: !74, line: 1105, column: 6)
!1326 = distinct !DILexicalBlock(scope: !1319, file: !74, line: 1104, column: 2)
!1327 = !DILocation(line: 1105, column: 18, scope: !1325)
!1328 = !DILocation(line: 1105, column: 6, scope: !1326)
!1329 = !DILocation(line: 1107, column: 4, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1325, file: !74, line: 1106, column: 3)
!1331 = !DILocation(line: 1111, column: 16, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1325, file: !74, line: 1110, column: 3)
!1333 = !DILocation(line: 1111, column: 30, scope: !1332)
!1334 = !DILocation(line: 1111, column: 40, scope: !1332)
!1335 = !DILocation(line: 1111, column: 39, scope: !1332)
!1336 = !DILocation(line: 1111, column: 55, scope: !1332)
!1337 = !DILocation(line: 1111, column: 53, scope: !1332)
!1338 = !DILocation(line: 1111, column: 26, scope: !1332)
!1339 = !DILocation(line: 1111, column: 68, scope: !1332)
!1340 = !DILocation(line: 1111, column: 13, scope: !1332)
!1341 = !DILocation(line: 1112, column: 16, scope: !1332)
!1342 = !DILocation(line: 1112, column: 25, scope: !1332)
!1343 = !DILocation(line: 1112, column: 24, scope: !1332)
!1344 = !DILocation(line: 1112, column: 41, scope: !1332)
!1345 = !DILocation(line: 1112, column: 51, scope: !1332)
!1346 = !DILocation(line: 1112, column: 50, scope: !1332)
!1347 = !DILocation(line: 1112, column: 38, scope: !1332)
!1348 = !DILocation(line: 1112, column: 13, scope: !1332)
!1349 = !DILocation(line: 1113, column: 11, scope: !1332)
!1350 = !DILocation(line: 1113, column: 4, scope: !1332)
!1351 = !DILocation(line: 1116, column: 1, scope: !1309)
!1352 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1133, type: !1353, scopeLine: 1134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!433, !25, !433}
!1355 = !DILocalVariable(name: "numerator", arg: 1, scope: !1352, file: !74, line: 1133, type: !25)
!1356 = !DILocation(line: 1133, column: 25, scope: !1352)
!1357 = !DILocalVariable(name: "denominator", arg: 2, scope: !1352, file: !74, line: 1133, type: !433)
!1358 = !DILocation(line: 1133, column: 40, scope: !1352)
!1359 = !DILocalVariable(name: "s32Temp1", scope: !1352, file: !74, line: 1135, type: !25)
!1360 = !DILocation(line: 1135, column: 6, scope: !1352)
!1361 = !DILocation(line: 1136, column: 5, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1352, file: !74, line: 1136, column: 5)
!1363 = !DILocation(line: 1136, column: 17, scope: !1362)
!1364 = !DILocation(line: 1136, column: 5, scope: !1352)
!1365 = !DILocation(line: 1138, column: 6, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1367, file: !74, line: 1138, column: 6)
!1367 = distinct !DILexicalBlock(scope: !1362, file: !74, line: 1137, column: 2)
!1368 = !DILocation(line: 1138, column: 16, scope: !1366)
!1369 = !DILocation(line: 1138, column: 6, scope: !1367)
!1370 = !DILocation(line: 1140, column: 4, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1366, file: !74, line: 1139, column: 3)
!1372 = !DILocation(line: 1144, column: 4, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1366, file: !74, line: 1143, column: 3)
!1374 = !DILocation(line: 1149, column: 6, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1376, file: !74, line: 1149, column: 6)
!1376 = distinct !DILexicalBlock(scope: !1362, file: !74, line: 1148, column: 2)
!1377 = !DILocation(line: 1149, column: 16, scope: !1375)
!1378 = !DILocation(line: 1149, column: 6, scope: !1376)
!1379 = !DILocation(line: 1151, column: 17, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1375, file: !74, line: 1150, column: 3)
!1381 = !DILocation(line: 1151, column: 31, scope: !1380)
!1382 = !DILocation(line: 1151, column: 41, scope: !1380)
!1383 = !DILocation(line: 1151, column: 40, scope: !1380)
!1384 = !DILocation(line: 1151, column: 56, scope: !1380)
!1385 = !DILocation(line: 1151, column: 54, scope: !1380)
!1386 = !DILocation(line: 1151, column: 27, scope: !1380)
!1387 = !DILocation(line: 1151, column: 69, scope: !1380)
!1388 = !DILocation(line: 1151, column: 13, scope: !1380)
!1389 = !DILocation(line: 1152, column: 13, scope: !1380)
!1390 = !DILocation(line: 1152, column: 23, scope: !1380)
!1391 = !DILocation(line: 1152, column: 22, scope: !1380)
!1392 = !DILocation(line: 1152, column: 39, scope: !1380)
!1393 = !DILocation(line: 1152, column: 48, scope: !1380)
!1394 = !DILocation(line: 1152, column: 47, scope: !1380)
!1395 = !DILocation(line: 1152, column: 36, scope: !1380)
!1396 = !DILocation(line: 1152, column: 4, scope: !1380)
!1397 = !DILocation(line: 1156, column: 4, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1375, file: !74, line: 1155, column: 3)
!1399 = !DILocation(line: 1159, column: 1, scope: !1352)
!1400 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1176, type: !1401, scopeLine: 1177, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!433, !25, !25}
!1403 = !DILocalVariable(name: "numerator", arg: 1, scope: !1400, file: !74, line: 1176, type: !25)
!1404 = !DILocation(line: 1176, column: 25, scope: !1400)
!1405 = !DILocalVariable(name: "denominator", arg: 2, scope: !1400, file: !74, line: 1176, type: !25)
!1406 = !DILocation(line: 1176, column: 40, scope: !1400)
!1407 = !DILocalVariable(name: "u32Temp1", scope: !1400, file: !74, line: 1178, type: !433)
!1408 = !DILocation(line: 1178, column: 6, scope: !1400)
!1409 = !DILocalVariable(name: "u32Temp2", scope: !1400, file: !74, line: 1178, type: !433)
!1410 = !DILocation(line: 1178, column: 20, scope: !1400)
!1411 = !DILocation(line: 1179, column: 5, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1400, file: !74, line: 1179, column: 5)
!1413 = !DILocation(line: 1179, column: 17, scope: !1412)
!1414 = !DILocation(line: 1179, column: 5, scope: !1400)
!1415 = !DILocation(line: 1181, column: 6, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1417, file: !74, line: 1181, column: 6)
!1417 = distinct !DILexicalBlock(scope: !1412, file: !74, line: 1180, column: 2)
!1418 = !DILocation(line: 1181, column: 16, scope: !1416)
!1419 = !DILocation(line: 1181, column: 6, scope: !1417)
!1420 = !DILocation(line: 1183, column: 4, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1416, file: !74, line: 1182, column: 3)
!1422 = !DILocation(line: 1187, column: 4, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1416, file: !74, line: 1186, column: 3)
!1424 = !DILocation(line: 1192, column: 6, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1426, file: !74, line: 1192, column: 6)
!1426 = distinct !DILexicalBlock(scope: !1412, file: !74, line: 1191, column: 2)
!1427 = !DILocation(line: 1192, column: 16, scope: !1425)
!1428 = !DILocation(line: 1192, column: 6, scope: !1426)
!1429 = !DILocation(line: 1194, column: 7, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1431, file: !74, line: 1194, column: 7)
!1431 = distinct !DILexicalBlock(scope: !1425, file: !74, line: 1193, column: 3)
!1432 = !DILocation(line: 1194, column: 17, scope: !1430)
!1433 = !DILocation(line: 1194, column: 7, scope: !1431)
!1434 = !DILocation(line: 1196, column: 5, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1430, file: !74, line: 1195, column: 4)
!1436 = !DILocation(line: 1200, column: 8, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1438, file: !74, line: 1200, column: 8)
!1438 = distinct !DILexicalBlock(scope: !1430, file: !74, line: 1199, column: 4)
!1439 = !DILocation(line: 1200, column: 20, scope: !1437)
!1440 = !DILocation(line: 1200, column: 8, scope: !1438)
!1441 = !DILocation(line: 1202, column: 6, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1437, file: !74, line: 1201, column: 5)
!1443 = !DILocation(line: 1206, column: 18, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1437, file: !74, line: 1205, column: 5)
!1445 = !DILocation(line: 1206, column: 32, scope: !1444)
!1446 = !DILocation(line: 1206, column: 42, scope: !1444)
!1447 = !DILocation(line: 1206, column: 41, scope: !1444)
!1448 = !DILocation(line: 1206, column: 57, scope: !1444)
!1449 = !DILocation(line: 1206, column: 55, scope: !1444)
!1450 = !DILocation(line: 1206, column: 28, scope: !1444)
!1451 = !DILocation(line: 1206, column: 71, scope: !1444)
!1452 = !DILocation(line: 1206, column: 15, scope: !1444)
!1453 = !DILocation(line: 1207, column: 18, scope: !1444)
!1454 = !DILocation(line: 1207, column: 29, scope: !1444)
!1455 = !DILocation(line: 1207, column: 27, scope: !1444)
!1456 = !DILocation(line: 1207, column: 45, scope: !1444)
!1457 = !DILocation(line: 1207, column: 57, scope: !1444)
!1458 = !DILocation(line: 1207, column: 55, scope: !1444)
!1459 = !DILocation(line: 1207, column: 42, scope: !1444)
!1460 = !DILocation(line: 1207, column: 15, scope: !1444)
!1461 = !DILocation(line: 1208, column: 13, scope: !1444)
!1462 = !DILocation(line: 1208, column: 6, scope: !1444)
!1463 = !DILocation(line: 1214, column: 7, scope: !1464)
!1464 = distinct !DILexicalBlock(scope: !1465, file: !74, line: 1214, column: 7)
!1465 = distinct !DILexicalBlock(scope: !1425, file: !74, line: 1213, column: 3)
!1466 = !DILocation(line: 1214, column: 19, scope: !1464)
!1467 = !DILocation(line: 1214, column: 7, scope: !1465)
!1468 = !DILocation(line: 1216, column: 5, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1464, file: !74, line: 1215, column: 4)
!1470 = !DILocation(line: 1220, column: 18, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1464, file: !74, line: 1219, column: 4)
!1472 = !DILocation(line: 1220, column: 17, scope: !1471)
!1473 = !DILocation(line: 1220, column: 15, scope: !1471)
!1474 = !DILocation(line: 1221, column: 20, scope: !1471)
!1475 = !DILocation(line: 1221, column: 19, scope: !1471)
!1476 = !DILocation(line: 1221, column: 17, scope: !1471)
!1477 = !DILocation(line: 1222, column: 17, scope: !1471)
!1478 = !DILocation(line: 1222, column: 31, scope: !1471)
!1479 = !DILocation(line: 1222, column: 41, scope: !1471)
!1480 = !DILocation(line: 1222, column: 40, scope: !1471)
!1481 = !DILocation(line: 1222, column: 56, scope: !1471)
!1482 = !DILocation(line: 1222, column: 54, scope: !1471)
!1483 = !DILocation(line: 1222, column: 27, scope: !1471)
!1484 = !DILocation(line: 1222, column: 70, scope: !1471)
!1485 = !DILocation(line: 1222, column: 14, scope: !1471)
!1486 = !DILocation(line: 1223, column: 17, scope: !1471)
!1487 = !DILocation(line: 1223, column: 28, scope: !1471)
!1488 = !DILocation(line: 1223, column: 26, scope: !1471)
!1489 = !DILocation(line: 1223, column: 44, scope: !1471)
!1490 = !DILocation(line: 1223, column: 56, scope: !1471)
!1491 = !DILocation(line: 1223, column: 54, scope: !1471)
!1492 = !DILocation(line: 1223, column: 41, scope: !1471)
!1493 = !DILocation(line: 1223, column: 14, scope: !1471)
!1494 = !DILocation(line: 1224, column: 12, scope: !1471)
!1495 = !DILocation(line: 1224, column: 5, scope: !1471)
!1496 = !DILocation(line: 1229, column: 1, scope: !1400)
!1497 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1246, type: !1498, scopeLine: 1247, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!433, !433, !433}
!1500 = !DILocalVariable(name: "numerator", arg: 1, scope: !1497, file: !74, line: 1246, type: !433)
!1501 = !DILocation(line: 1246, column: 25, scope: !1497)
!1502 = !DILocalVariable(name: "denominator", arg: 2, scope: !1497, file: !74, line: 1246, type: !433)
!1503 = !DILocation(line: 1246, column: 40, scope: !1497)
!1504 = !DILocalVariable(name: "u32Temp1", scope: !1497, file: !74, line: 1249, type: !433)
!1505 = !DILocation(line: 1249, column: 6, scope: !1497)
!1506 = !DILocalVariable(name: "u32Temp2", scope: !1497, file: !74, line: 1249, type: !433)
!1507 = !DILocation(line: 1249, column: 20, scope: !1497)
!1508 = !DILocalVariable(name: "u32Temp3", scope: !1497, file: !74, line: 1249, type: !433)
!1509 = !DILocation(line: 1249, column: 34, scope: !1497)
!1510 = !DILocalVariable(name: "numerator_old", scope: !1497, file: !74, line: 1249, type: !433)
!1511 = !DILocation(line: 1249, column: 48, scope: !1497)
!1512 = !DILocation(line: 1250, column: 5, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1497, file: !74, line: 1250, column: 5)
!1514 = !DILocation(line: 1250, column: 16, scope: !1513)
!1515 = !DILocation(line: 1250, column: 5, scope: !1497)
!1516 = !DILocation(line: 1252, column: 3, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1513, file: !74, line: 1251, column: 2)
!1518 = !DILocation(line: 1256, column: 14, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1513, file: !74, line: 1255, column: 2)
!1520 = !DILocation(line: 1256, column: 26, scope: !1519)
!1521 = !DILocation(line: 1256, column: 41, scope: !1519)
!1522 = !DILocation(line: 1256, column: 51, scope: !1519)
!1523 = !DILocation(line: 1256, column: 50, scope: !1519)
!1524 = !DILocation(line: 1256, column: 38, scope: !1519)
!1525 = !DILocation(line: 1256, column: 24, scope: !1519)
!1526 = !DILocation(line: 1256, column: 12, scope: !1519)
!1527 = !DILocation(line: 1257, column: 7, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1519, file: !74, line: 1257, column: 6)
!1529 = !DILocation(line: 1257, column: 16, scope: !1528)
!1530 = !DILocation(line: 1257, column: 24, scope: !1528)
!1531 = !DILocation(line: 1257, column: 6, scope: !1519)
!1532 = !DILocation(line: 1259, column: 16, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1528, file: !74, line: 1258, column: 3)
!1534 = !DILocation(line: 1259, column: 27, scope: !1533)
!1535 = !DILocation(line: 1259, column: 13, scope: !1533)
!1536 = !DILocation(line: 1260, column: 3, scope: !1533)
!1537 = !DILocation(line: 1263, column: 16, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1528, file: !74, line: 1262, column: 3)
!1539 = !DILocation(line: 1263, column: 27, scope: !1538)
!1540 = !DILocation(line: 1263, column: 32, scope: !1538)
!1541 = !DILocation(line: 1263, column: 13, scope: !1538)
!1542 = !DILocation(line: 1266, column: 6, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1519, file: !74, line: 1266, column: 6)
!1544 = !DILocation(line: 1266, column: 17, scope: !1543)
!1545 = !DILocation(line: 1266, column: 15, scope: !1543)
!1546 = !DILocation(line: 1266, column: 6, scope: !1519)
!1547 = !DILocation(line: 1268, column: 12, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1543, file: !74, line: 1267, column: 3)
!1549 = !DILocation(line: 1268, column: 22, scope: !1548)
!1550 = !DILocation(line: 1268, column: 21, scope: !1548)
!1551 = !DILocation(line: 1268, column: 4, scope: !1548)
!1552 = !DILocation(line: 1272, column: 13, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1543, file: !74, line: 1271, column: 3)
!1554 = !DILocation(line: 1272, column: 23, scope: !1553)
!1555 = !DILocation(line: 1272, column: 22, scope: !1553)
!1556 = !DILocation(line: 1272, column: 36, scope: !1553)
!1557 = !DILocation(line: 1272, column: 4, scope: !1553)
!1558 = !DILocation(line: 1277, column: 1, scope: !1497)
!1559 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1294, type: !1560, scopeLine: 1295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1560 = !DISubroutineType(types: !1561)
!1561 = !{!25, !433, !25}
!1562 = !DILocalVariable(name: "numerator", arg: 1, scope: !1559, file: !74, line: 1294, type: !433)
!1563 = !DILocation(line: 1294, column: 25, scope: !1559)
!1564 = !DILocalVariable(name: "denominator", arg: 2, scope: !1559, file: !74, line: 1294, type: !25)
!1565 = !DILocation(line: 1294, column: 40, scope: !1559)
!1566 = !DILocalVariable(name: "u32Temp1", scope: !1559, file: !74, line: 1296, type: !433)
!1567 = !DILocation(line: 1296, column: 6, scope: !1559)
!1568 = !DILocalVariable(name: "u32Temp2", scope: !1559, file: !74, line: 1296, type: !433)
!1569 = !DILocation(line: 1296, column: 20, scope: !1559)
!1570 = !DILocation(line: 1297, column: 5, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1559, file: !74, line: 1297, column: 5)
!1572 = !DILocation(line: 1297, column: 17, scope: !1571)
!1573 = !DILocation(line: 1297, column: 5, scope: !1559)
!1574 = !DILocation(line: 1299, column: 6, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1576, file: !74, line: 1299, column: 6)
!1576 = distinct !DILexicalBlock(scope: !1571, file: !74, line: 1298, column: 2)
!1577 = !DILocation(line: 1299, column: 18, scope: !1575)
!1578 = !DILocation(line: 1299, column: 6, scope: !1576)
!1579 = !DILocation(line: 1301, column: 4, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1575, file: !74, line: 1300, column: 3)
!1581 = !DILocation(line: 1305, column: 19, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1575, file: !74, line: 1304, column: 3)
!1583 = !DILocation(line: 1305, column: 18, scope: !1582)
!1584 = !DILocation(line: 1305, column: 16, scope: !1582)
!1585 = !DILocation(line: 1306, column: 16, scope: !1582)
!1586 = !DILocation(line: 1306, column: 30, scope: !1582)
!1587 = !DILocation(line: 1306, column: 40, scope: !1582)
!1588 = !DILocation(line: 1306, column: 39, scope: !1582)
!1589 = !DILocation(line: 1306, column: 55, scope: !1582)
!1590 = !DILocation(line: 1306, column: 53, scope: !1582)
!1591 = !DILocation(line: 1306, column: 26, scope: !1582)
!1592 = !DILocation(line: 1306, column: 69, scope: !1582)
!1593 = !DILocation(line: 1306, column: 13, scope: !1582)
!1594 = !DILocation(line: 1307, column: 16, scope: !1582)
!1595 = !DILocation(line: 1307, column: 25, scope: !1582)
!1596 = !DILocation(line: 1307, column: 24, scope: !1582)
!1597 = !DILocation(line: 1307, column: 41, scope: !1582)
!1598 = !DILocation(line: 1307, column: 51, scope: !1582)
!1599 = !DILocation(line: 1307, column: 50, scope: !1582)
!1600 = !DILocation(line: 1307, column: 38, scope: !1582)
!1601 = !DILocation(line: 1307, column: 13, scope: !1582)
!1602 = !DILocation(line: 1308, column: 7, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1582, file: !74, line: 1308, column: 7)
!1604 = !DILocation(line: 1308, column: 16, scope: !1603)
!1605 = !DILocation(line: 1308, column: 7, scope: !1582)
!1606 = !DILocation(line: 1310, column: 13, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1603, file: !74, line: 1309, column: 4)
!1608 = !DILocation(line: 1310, column: 12, scope: !1607)
!1609 = !DILocation(line: 1310, column: 5, scope: !1607)
!1610 = !DILocation(line: 1314, column: 5, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1603, file: !74, line: 1313, column: 4)
!1612 = !DILocation(line: 1320, column: 15, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1571, file: !74, line: 1319, column: 2)
!1614 = !DILocation(line: 1320, column: 29, scope: !1613)
!1615 = !DILocation(line: 1320, column: 39, scope: !1613)
!1616 = !DILocation(line: 1320, column: 38, scope: !1613)
!1617 = !DILocation(line: 1320, column: 54, scope: !1613)
!1618 = !DILocation(line: 1320, column: 52, scope: !1613)
!1619 = !DILocation(line: 1320, column: 25, scope: !1613)
!1620 = !DILocation(line: 1320, column: 68, scope: !1613)
!1621 = !DILocation(line: 1320, column: 12, scope: !1613)
!1622 = !DILocation(line: 1321, column: 15, scope: !1613)
!1623 = !DILocation(line: 1321, column: 24, scope: !1613)
!1624 = !DILocation(line: 1321, column: 23, scope: !1613)
!1625 = !DILocation(line: 1321, column: 40, scope: !1613)
!1626 = !DILocation(line: 1321, column: 50, scope: !1613)
!1627 = !DILocation(line: 1321, column: 49, scope: !1613)
!1628 = !DILocation(line: 1321, column: 37, scope: !1613)
!1629 = !DILocation(line: 1321, column: 12, scope: !1613)
!1630 = !DILocation(line: 1322, column: 6, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1613, file: !74, line: 1322, column: 6)
!1632 = !DILocation(line: 1322, column: 15, scope: !1631)
!1633 = !DILocation(line: 1322, column: 6, scope: !1613)
!1634 = !DILocation(line: 1324, column: 11, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1631, file: !74, line: 1323, column: 3)
!1636 = !DILocation(line: 1324, column: 4, scope: !1635)
!1637 = !DILocation(line: 1328, column: 4, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1631, file: !74, line: 1327, column: 3)
!1639 = !DILocation(line: 1331, column: 1, scope: !1559)
!1640 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1349, type: !1641, scopeLine: 1350, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1641 = !DISubroutineType(types: !1642)
!1642 = !{!25, !25, !433}
!1643 = !DILocalVariable(name: "numerator", arg: 1, scope: !1640, file: !74, line: 1349, type: !25)
!1644 = !DILocation(line: 1349, column: 25, scope: !1640)
!1645 = !DILocalVariable(name: "denominator", arg: 2, scope: !1640, file: !74, line: 1349, type: !433)
!1646 = !DILocation(line: 1349, column: 40, scope: !1640)
!1647 = !DILocalVariable(name: "s32Temp1", scope: !1640, file: !74, line: 1351, type: !25)
!1648 = !DILocation(line: 1351, column: 6, scope: !1640)
!1649 = !DILocalVariable(name: "s32Temp2", scope: !1640, file: !74, line: 1351, type: !25)
!1650 = !DILocation(line: 1351, column: 20, scope: !1640)
!1651 = !DILocalVariable(name: "u32Temp0", scope: !1640, file: !74, line: 1352, type: !433)
!1652 = !DILocation(line: 1352, column: 6, scope: !1640)
!1653 = !DILocalVariable(name: "u32Temp1", scope: !1640, file: !74, line: 1352, type: !433)
!1654 = !DILocation(line: 1352, column: 20, scope: !1640)
!1655 = !DILocalVariable(name: "u32Temp2", scope: !1640, file: !74, line: 1352, type: !433)
!1656 = !DILocation(line: 1352, column: 34, scope: !1640)
!1657 = !DILocation(line: 1353, column: 5, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1640, file: !74, line: 1353, column: 5)
!1659 = !DILocation(line: 1353, column: 17, scope: !1658)
!1660 = !DILocation(line: 1353, column: 5, scope: !1640)
!1661 = !DILocation(line: 1355, column: 6, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1663, file: !74, line: 1355, column: 6)
!1663 = distinct !DILexicalBlock(scope: !1658, file: !74, line: 1354, column: 2)
!1664 = !DILocation(line: 1355, column: 16, scope: !1662)
!1665 = !DILocation(line: 1355, column: 6, scope: !1663)
!1666 = !DILocation(line: 1357, column: 4, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1662, file: !74, line: 1356, column: 3)
!1668 = !DILocation(line: 1361, column: 4, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1662, file: !74, line: 1360, column: 3)
!1670 = !DILocation(line: 1366, column: 6, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1672, file: !74, line: 1366, column: 6)
!1672 = distinct !DILexicalBlock(scope: !1658, file: !74, line: 1365, column: 2)
!1673 = !DILocation(line: 1366, column: 16, scope: !1671)
!1674 = !DILocation(line: 1366, column: 6, scope: !1672)
!1675 = !DILocation(line: 1368, column: 16, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1671, file: !74, line: 1367, column: 3)
!1677 = !DILocation(line: 1368, column: 15, scope: !1676)
!1678 = !DILocation(line: 1368, column: 13, scope: !1676)
!1679 = !DILocation(line: 1369, column: 16, scope: !1676)
!1680 = !DILocation(line: 1369, column: 25, scope: !1676)
!1681 = !DILocation(line: 1369, column: 24, scope: !1676)
!1682 = !DILocation(line: 1369, column: 13, scope: !1676)
!1683 = !DILocation(line: 1370, column: 15, scope: !1676)
!1684 = !DILocation(line: 1370, column: 28, scope: !1676)
!1685 = !DILocation(line: 1370, column: 37, scope: !1676)
!1686 = !DILocation(line: 1370, column: 36, scope: !1676)
!1687 = !DILocation(line: 1370, column: 52, scope: !1676)
!1688 = !DILocation(line: 1370, column: 50, scope: !1676)
!1689 = !DILocation(line: 1370, column: 24, scope: !1676)
!1690 = !DILocation(line: 1370, column: 13, scope: !1676)
!1691 = !DILocation(line: 1372, column: 8, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1676, file: !74, line: 1372, column: 7)
!1693 = !DILocation(line: 1372, column: 20, scope: !1692)
!1694 = !DILocation(line: 1372, column: 27, scope: !1692)
!1695 = !DILocation(line: 1372, column: 7, scope: !1676)
!1696 = !DILocation(line: 1374, column: 20, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1692, file: !74, line: 1373, column: 4)
!1698 = !DILocation(line: 1374, column: 32, scope: !1697)
!1699 = !DILocation(line: 1374, column: 17, scope: !1697)
!1700 = !DILocation(line: 1375, column: 4, scope: !1697)
!1701 = !DILocation(line: 1378, column: 20, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1692, file: !74, line: 1377, column: 4)
!1703 = !DILocation(line: 1378, column: 32, scope: !1702)
!1704 = !DILocation(line: 1378, column: 38, scope: !1702)
!1705 = !DILocation(line: 1378, column: 17, scope: !1702)
!1706 = !DILocation(line: 1382, column: 7, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1676, file: !74, line: 1382, column: 7)
!1708 = !DILocation(line: 1382, column: 18, scope: !1707)
!1709 = !DILocation(line: 1382, column: 16, scope: !1707)
!1710 = !DILocation(line: 1382, column: 7, scope: !1676)
!1711 = !DILocation(line: 1384, column: 14, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1707, file: !74, line: 1383, column: 4)
!1713 = !DILocation(line: 1384, column: 13, scope: !1712)
!1714 = !DILocation(line: 1384, column: 23, scope: !1712)
!1715 = !DILocation(line: 1384, column: 5, scope: !1712)
!1716 = !DILocation(line: 1388, column: 14, scope: !1717)
!1717 = distinct !DILexicalBlock(scope: !1707, file: !74, line: 1387, column: 4)
!1718 = !DILocation(line: 1388, column: 23, scope: !1717)
!1719 = !DILocation(line: 1388, column: 12, scope: !1717)
!1720 = !DILocation(line: 1388, column: 27, scope: !1717)
!1721 = !DILocation(line: 1388, column: 5, scope: !1717)
!1722 = !DILocation(line: 1395, column: 16, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1671, file: !74, line: 1394, column: 3)
!1724 = !DILocation(line: 1395, column: 30, scope: !1723)
!1725 = !DILocation(line: 1395, column: 40, scope: !1723)
!1726 = !DILocation(line: 1395, column: 39, scope: !1723)
!1727 = !DILocation(line: 1395, column: 55, scope: !1723)
!1728 = !DILocation(line: 1395, column: 53, scope: !1723)
!1729 = !DILocation(line: 1395, column: 26, scope: !1723)
!1730 = !DILocation(line: 1395, column: 69, scope: !1723)
!1731 = !DILocation(line: 1395, column: 13, scope: !1723)
!1732 = !DILocation(line: 1396, column: 16, scope: !1723)
!1733 = !DILocation(line: 1396, column: 26, scope: !1723)
!1734 = !DILocation(line: 1396, column: 25, scope: !1723)
!1735 = !DILocation(line: 1396, column: 42, scope: !1723)
!1736 = !DILocation(line: 1396, column: 51, scope: !1723)
!1737 = !DILocation(line: 1396, column: 50, scope: !1723)
!1738 = !DILocation(line: 1396, column: 39, scope: !1723)
!1739 = !DILocation(line: 1396, column: 13, scope: !1723)
!1740 = !DILocation(line: 1397, column: 11, scope: !1723)
!1741 = !DILocation(line: 1397, column: 4, scope: !1723)
!1742 = !DILocation(line: 1400, column: 1, scope: !1640)
!1743 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1417, type: !1744, scopeLine: 1418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1744 = !DISubroutineType(types: !1745)
!1745 = !{!25, !25, !25}
!1746 = !DILocalVariable(name: "numerator", arg: 1, scope: !1743, file: !74, line: 1417, type: !25)
!1747 = !DILocation(line: 1417, column: 25, scope: !1743)
!1748 = !DILocalVariable(name: "denominator", arg: 2, scope: !1743, file: !74, line: 1417, type: !25)
!1749 = !DILocation(line: 1417, column: 40, scope: !1743)
!1750 = !DILocalVariable(name: "s32Temp1", scope: !1743, file: !74, line: 1419, type: !25)
!1751 = !DILocation(line: 1419, column: 6, scope: !1743)
!1752 = !DILocalVariable(name: "s32Temp2", scope: !1743, file: !74, line: 1419, type: !25)
!1753 = !DILocation(line: 1419, column: 20, scope: !1743)
!1754 = !DILocalVariable(name: "denominator_prime", scope: !1743, file: !74, line: 1420, type: !433)
!1755 = !DILocation(line: 1420, column: 6, scope: !1743)
!1756 = !DILocalVariable(name: "u32Temp1", scope: !1743, file: !74, line: 1420, type: !433)
!1757 = !DILocation(line: 1420, column: 29, scope: !1743)
!1758 = !DILocalVariable(name: "u32Temp2", scope: !1743, file: !74, line: 1420, type: !433)
!1759 = !DILocation(line: 1420, column: 43, scope: !1743)
!1760 = !DILocalVariable(name: "u32numerator", scope: !1743, file: !74, line: 1421, type: !433)
!1761 = !DILocation(line: 1421, column: 6, scope: !1743)
!1762 = !DILocalVariable(name: "u32denominator", scope: !1743, file: !74, line: 1421, type: !433)
!1763 = !DILocation(line: 1421, column: 23, scope: !1743)
!1764 = !DILocation(line: 1422, column: 5, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1743, file: !74, line: 1422, column: 5)
!1766 = !DILocation(line: 1422, column: 15, scope: !1765)
!1767 = !DILocation(line: 1422, column: 5, scope: !1743)
!1768 = !DILocation(line: 1424, column: 6, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1770, file: !74, line: 1424, column: 6)
!1770 = distinct !DILexicalBlock(scope: !1765, file: !74, line: 1423, column: 2)
!1771 = !DILocation(line: 1424, column: 18, scope: !1769)
!1772 = !DILocation(line: 1424, column: 6, scope: !1770)
!1773 = !DILocation(line: 1426, column: 7, scope: !1774)
!1774 = distinct !DILexicalBlock(scope: !1775, file: !74, line: 1426, column: 7)
!1775 = distinct !DILexicalBlock(scope: !1769, file: !74, line: 1425, column: 3)
!1776 = !DILocation(line: 1426, column: 19, scope: !1774)
!1777 = !DILocation(line: 1426, column: 7, scope: !1775)
!1778 = !DILocation(line: 1428, column: 5, scope: !1779)
!1779 = distinct !DILexicalBlock(scope: !1774, file: !74, line: 1427, column: 4)
!1780 = !DILocation(line: 1432, column: 21, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1774, file: !74, line: 1431, column: 4)
!1782 = !DILocation(line: 1432, column: 20, scope: !1781)
!1783 = !DILocation(line: 1432, column: 18, scope: !1781)
!1784 = !DILocation(line: 1433, column: 23, scope: !1781)
!1785 = !DILocation(line: 1433, column: 22, scope: !1781)
!1786 = !DILocation(line: 1433, column: 20, scope: !1781)
!1787 = !DILocation(line: 1434, column: 16, scope: !1781)
!1788 = !DILocation(line: 1434, column: 33, scope: !1781)
!1789 = !DILocation(line: 1434, column: 46, scope: !1781)
!1790 = !DILocation(line: 1434, column: 45, scope: !1781)
!1791 = !DILocation(line: 1434, column: 64, scope: !1781)
!1792 = !DILocation(line: 1434, column: 62, scope: !1781)
!1793 = !DILocation(line: 1434, column: 29, scope: !1781)
!1794 = !DILocation(line: 1434, column: 81, scope: !1781)
!1795 = !DILocation(line: 1434, column: 14, scope: !1781)
!1796 = !DILocation(line: 1435, column: 17, scope: !1781)
!1797 = !DILocation(line: 1435, column: 30, scope: !1781)
!1798 = !DILocation(line: 1435, column: 29, scope: !1781)
!1799 = !DILocation(line: 1435, column: 49, scope: !1781)
!1800 = !DILocation(line: 1435, column: 58, scope: !1781)
!1801 = !DILocation(line: 1435, column: 57, scope: !1781)
!1802 = !DILocation(line: 1435, column: 46, scope: !1781)
!1803 = !DILocation(line: 1435, column: 14, scope: !1781)
!1804 = !DILocation(line: 1436, column: 8, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1781, file: !74, line: 1436, column: 8)
!1806 = !DILocation(line: 1436, column: 17, scope: !1805)
!1807 = !DILocation(line: 1436, column: 8, scope: !1781)
!1808 = !DILocation(line: 1438, column: 13, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1805, file: !74, line: 1437, column: 5)
!1810 = !DILocation(line: 1438, column: 6, scope: !1809)
!1811 = !DILocation(line: 1442, column: 6, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1805, file: !74, line: 1441, column: 5)
!1813 = !DILocation(line: 1448, column: 20, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1769, file: !74, line: 1447, column: 3)
!1815 = !DILocation(line: 1448, column: 19, scope: !1814)
!1816 = !DILocation(line: 1448, column: 29, scope: !1814)
!1817 = !DILocation(line: 1448, column: 17, scope: !1814)
!1818 = !DILocation(line: 1449, column: 16, scope: !1814)
!1819 = !DILocation(line: 1449, column: 33, scope: !1814)
!1820 = !DILocation(line: 1449, column: 46, scope: !1814)
!1821 = !DILocation(line: 1449, column: 45, scope: !1814)
!1822 = !DILocation(line: 1449, column: 61, scope: !1814)
!1823 = !DILocation(line: 1449, column: 59, scope: !1814)
!1824 = !DILocation(line: 1449, column: 29, scope: !1814)
!1825 = !DILocation(line: 1449, column: 75, scope: !1814)
!1826 = !DILocation(line: 1449, column: 13, scope: !1814)
!1827 = !DILocation(line: 1450, column: 16, scope: !1814)
!1828 = !DILocation(line: 1450, column: 29, scope: !1814)
!1829 = !DILocation(line: 1450, column: 28, scope: !1814)
!1830 = !DILocation(line: 1450, column: 45, scope: !1814)
!1831 = !DILocation(line: 1450, column: 54, scope: !1814)
!1832 = !DILocation(line: 1450, column: 53, scope: !1814)
!1833 = !DILocation(line: 1450, column: 42, scope: !1814)
!1834 = !DILocation(line: 1450, column: 13, scope: !1814)
!1835 = !DILocation(line: 1451, column: 13, scope: !1814)
!1836 = !DILocation(line: 1451, column: 12, scope: !1814)
!1837 = !DILocation(line: 1451, column: 22, scope: !1814)
!1838 = !DILocation(line: 1451, column: 4, scope: !1814)
!1839 = !DILocation(line: 1456, column: 6, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1841, file: !74, line: 1456, column: 6)
!1841 = distinct !DILexicalBlock(scope: !1765, file: !74, line: 1455, column: 2)
!1842 = !DILocation(line: 1456, column: 18, scope: !1840)
!1843 = !DILocation(line: 1456, column: 6, scope: !1841)
!1844 = !DILocation(line: 1458, column: 7, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1846, file: !74, line: 1458, column: 7)
!1846 = distinct !DILexicalBlock(scope: !1840, file: !74, line: 1457, column: 3)
!1847 = !DILocation(line: 1458, column: 19, scope: !1845)
!1848 = !DILocation(line: 1458, column: 7, scope: !1846)
!1849 = !DILocation(line: 1460, column: 5, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1845, file: !74, line: 1459, column: 4)
!1851 = !DILocation(line: 1464, column: 23, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1845, file: !74, line: 1463, column: 4)
!1853 = !DILocation(line: 1464, column: 22, scope: !1852)
!1854 = !DILocation(line: 1464, column: 35, scope: !1852)
!1855 = !DILocation(line: 1464, column: 20, scope: !1852)
!1856 = !DILocation(line: 1465, column: 17, scope: !1852)
!1857 = !DILocation(line: 1465, column: 31, scope: !1852)
!1858 = !DILocation(line: 1465, column: 41, scope: !1852)
!1859 = !DILocation(line: 1465, column: 40, scope: !1852)
!1860 = !DILocation(line: 1465, column: 59, scope: !1852)
!1861 = !DILocation(line: 1465, column: 57, scope: !1852)
!1862 = !DILocation(line: 1465, column: 27, scope: !1852)
!1863 = !DILocation(line: 1465, column: 76, scope: !1852)
!1864 = !DILocation(line: 1465, column: 14, scope: !1852)
!1865 = !DILocation(line: 1466, column: 17, scope: !1852)
!1866 = !DILocation(line: 1466, column: 27, scope: !1852)
!1867 = !DILocation(line: 1466, column: 26, scope: !1852)
!1868 = !DILocation(line: 1466, column: 46, scope: !1852)
!1869 = !DILocation(line: 1466, column: 55, scope: !1852)
!1870 = !DILocation(line: 1466, column: 54, scope: !1852)
!1871 = !DILocation(line: 1466, column: 43, scope: !1852)
!1872 = !DILocation(line: 1466, column: 14, scope: !1852)
!1873 = !DILocation(line: 1467, column: 14, scope: !1852)
!1874 = !DILocation(line: 1467, column: 13, scope: !1852)
!1875 = !DILocation(line: 1467, column: 23, scope: !1852)
!1876 = !DILocation(line: 1467, column: 5, scope: !1852)
!1877 = !DILocation(line: 1472, column: 16, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1840, file: !74, line: 1471, column: 3)
!1879 = !DILocation(line: 1472, column: 30, scope: !1878)
!1880 = !DILocation(line: 1472, column: 40, scope: !1878)
!1881 = !DILocation(line: 1472, column: 39, scope: !1878)
!1882 = !DILocation(line: 1472, column: 55, scope: !1878)
!1883 = !DILocation(line: 1472, column: 53, scope: !1878)
!1884 = !DILocation(line: 1472, column: 26, scope: !1878)
!1885 = !DILocation(line: 1472, column: 69, scope: !1878)
!1886 = !DILocation(line: 1472, column: 13, scope: !1878)
!1887 = !DILocation(line: 1473, column: 16, scope: !1878)
!1888 = !DILocation(line: 1473, column: 26, scope: !1878)
!1889 = !DILocation(line: 1473, column: 25, scope: !1878)
!1890 = !DILocation(line: 1473, column: 42, scope: !1878)
!1891 = !DILocation(line: 1473, column: 51, scope: !1878)
!1892 = !DILocation(line: 1473, column: 50, scope: !1878)
!1893 = !DILocation(line: 1473, column: 39, scope: !1878)
!1894 = !DILocation(line: 1473, column: 13, scope: !1878)
!1895 = !DILocation(line: 1474, column: 11, scope: !1878)
!1896 = !DILocation(line: 1474, column: 4, scope: !1878)
!1897 = !DILocation(line: 1477, column: 1, scope: !1743)
!1898 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1495, type: !1899, scopeLine: 1496, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1899 = !DISubroutineType(types: !1900)
!1900 = !{!6, !25, !433}
!1901 = !DILocalVariable(name: "numerator", arg: 1, scope: !1898, file: !74, line: 1495, type: !25)
!1902 = !DILocation(line: 1495, column: 25, scope: !1898)
!1903 = !DILocalVariable(name: "denominator", arg: 2, scope: !1898, file: !74, line: 1495, type: !433)
!1904 = !DILocation(line: 1495, column: 40, scope: !1898)
!1905 = !DILocalVariable(name: "numerator_prime", scope: !1898, file: !74, line: 1498, type: !433)
!1906 = !DILocation(line: 1498, column: 6, scope: !1898)
!1907 = !DILocalVariable(name: "u32Temp1", scope: !1898, file: !74, line: 1498, type: !433)
!1908 = !DILocation(line: 1498, column: 27, scope: !1898)
!1909 = !DILocalVariable(name: "u32Temp2", scope: !1898, file: !74, line: 1498, type: !433)
!1910 = !DILocation(line: 1498, column: 41, scope: !1898)
!1911 = !DILocalVariable(name: "u32Temp3", scope: !1898, file: !74, line: 1498, type: !433)
!1912 = !DILocation(line: 1498, column: 55, scope: !1898)
!1913 = !DILocalVariable(name: "s32Temp1", scope: !1898, file: !74, line: 1499, type: !25)
!1914 = !DILocation(line: 1499, column: 6, scope: !1898)
!1915 = !DILocalVariable(name: "s32Temp2", scope: !1898, file: !74, line: 1499, type: !25)
!1916 = !DILocation(line: 1499, column: 20, scope: !1898)
!1917 = !DILocalVariable(name: "s32Temp3", scope: !1898, file: !74, line: 1499, type: !25)
!1918 = !DILocation(line: 1499, column: 34, scope: !1898)
!1919 = !DILocation(line: 1500, column: 5, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1898, file: !74, line: 1500, column: 5)
!1921 = !DILocation(line: 1500, column: 17, scope: !1920)
!1922 = !DILocation(line: 1500, column: 5, scope: !1898)
!1923 = !DILocation(line: 1502, column: 6, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1925, file: !74, line: 1502, column: 6)
!1925 = distinct !DILexicalBlock(scope: !1920, file: !74, line: 1501, column: 2)
!1926 = !DILocation(line: 1502, column: 15, scope: !1924)
!1927 = !DILocation(line: 1502, column: 6, scope: !1925)
!1928 = !DILocation(line: 1504, column: 4, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1924, file: !74, line: 1503, column: 3)
!1930 = !DILocation(line: 1508, column: 4, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1924, file: !74, line: 1507, column: 3)
!1932 = !DILocation(line: 1513, column: 6, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1934, file: !74, line: 1513, column: 6)
!1934 = distinct !DILexicalBlock(scope: !1920, file: !74, line: 1512, column: 2)
!1935 = !DILocation(line: 1513, column: 16, scope: !1933)
!1936 = !DILocation(line: 1513, column: 6, scope: !1934)
!1937 = !DILocation(line: 1515, column: 23, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1933, file: !74, line: 1514, column: 3)
!1939 = !DILocation(line: 1515, column: 22, scope: !1938)
!1940 = !DILocation(line: 1515, column: 20, scope: !1938)
!1941 = !DILocation(line: 1516, column: 16, scope: !1938)
!1942 = !DILocation(line: 1516, column: 32, scope: !1938)
!1943 = !DILocation(line: 1516, column: 31, scope: !1938)
!1944 = !DILocation(line: 1516, column: 13, scope: !1938)
!1945 = !DILocation(line: 1517, column: 15, scope: !1938)
!1946 = !DILocation(line: 1517, column: 34, scope: !1938)
!1947 = !DILocation(line: 1517, column: 45, scope: !1938)
!1948 = !DILocation(line: 1517, column: 43, scope: !1938)
!1949 = !DILocation(line: 1517, column: 31, scope: !1938)
!1950 = !DILocation(line: 1517, column: 13, scope: !1938)
!1951 = !DILocation(line: 1519, column: 8, scope: !1952)
!1952 = distinct !DILexicalBlock(scope: !1938, file: !74, line: 1519, column: 7)
!1953 = !DILocation(line: 1519, column: 20, scope: !1952)
!1954 = !DILocation(line: 1519, column: 27, scope: !1952)
!1955 = !DILocation(line: 1519, column: 7, scope: !1938)
!1956 = !DILocation(line: 1521, column: 19, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1952, file: !74, line: 1520, column: 4)
!1958 = !DILocation(line: 1521, column: 31, scope: !1957)
!1959 = !DILocation(line: 1521, column: 17, scope: !1957)
!1960 = !DILocation(line: 1522, column: 4, scope: !1957)
!1961 = !DILocation(line: 1525, column: 20, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1952, file: !74, line: 1524, column: 4)
!1963 = !DILocation(line: 1525, column: 32, scope: !1962)
!1964 = !DILocation(line: 1525, column: 38, scope: !1962)
!1965 = !DILocation(line: 1525, column: 17, scope: !1962)
!1966 = !DILocation(line: 1528, column: 7, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1938, file: !74, line: 1528, column: 7)
!1968 = !DILocation(line: 1528, column: 18, scope: !1967)
!1969 = !DILocation(line: 1528, column: 16, scope: !1967)
!1970 = !DILocation(line: 1528, column: 7, scope: !1938)
!1971 = !DILocation(line: 1530, column: 18, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1967, file: !74, line: 1529, column: 4)
!1973 = !DILocation(line: 1530, column: 16, scope: !1972)
!1974 = !DILocation(line: 1530, column: 28, scope: !1972)
!1975 = !DILocation(line: 1530, column: 14, scope: !1972)
!1976 = !DILocation(line: 1531, column: 4, scope: !1972)
!1977 = !DILocation(line: 1534, column: 18, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1967, file: !74, line: 1533, column: 4)
!1979 = !DILocation(line: 1534, column: 26, scope: !1978)
!1980 = !DILocation(line: 1534, column: 16, scope: !1978)
!1981 = !DILocation(line: 1534, column: 30, scope: !1978)
!1982 = !DILocation(line: 1534, column: 14, scope: !1978)
!1983 = !DILocation(line: 1536, column: 8, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1938, file: !74, line: 1536, column: 7)
!1985 = !DILocation(line: 1536, column: 18, scope: !1984)
!1986 = !DILocation(line: 1536, column: 7, scope: !1938)
!1987 = !DILocation(line: 1538, column: 18, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1984, file: !74, line: 1537, column: 4)
!1989 = !DILocation(line: 1538, column: 12, scope: !1988)
!1990 = !DILocation(line: 1538, column: 5, scope: !1988)
!1991 = !DILocation(line: 1542, column: 5, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1984, file: !74, line: 1541, column: 4)
!1993 = !DILocation(line: 1547, column: 16, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1933, file: !74, line: 1546, column: 3)
!1995 = !DILocation(line: 1547, column: 26, scope: !1994)
!1996 = !DILocation(line: 1547, column: 25, scope: !1994)
!1997 = !DILocation(line: 1547, column: 41, scope: !1994)
!1998 = !DILocation(line: 1547, column: 39, scope: !1994)
!1999 = !DILocation(line: 1547, column: 13, scope: !1994)
!2000 = !DILocation(line: 1548, column: 16, scope: !1994)
!2001 = !DILocation(line: 1548, column: 30, scope: !1994)
!2002 = !DILocation(line: 1548, column: 40, scope: !1994)
!2003 = !DILocation(line: 1548, column: 39, scope: !1994)
!2004 = !DILocation(line: 1548, column: 55, scope: !1994)
!2005 = !DILocation(line: 1548, column: 53, scope: !1994)
!2006 = !DILocation(line: 1548, column: 26, scope: !1994)
!2007 = !DILocation(line: 1548, column: 68, scope: !1994)
!2008 = !DILocation(line: 1548, column: 13, scope: !1994)
!2009 = !DILocation(line: 1549, column: 16, scope: !1994)
!2010 = !DILocation(line: 1549, column: 25, scope: !1994)
!2011 = !DILocation(line: 1549, column: 24, scope: !1994)
!2012 = !DILocation(line: 1549, column: 41, scope: !1994)
!2013 = !DILocation(line: 1549, column: 51, scope: !1994)
!2014 = !DILocation(line: 1549, column: 50, scope: !1994)
!2015 = !DILocation(line: 1549, column: 38, scope: !1994)
!2016 = !DILocation(line: 1549, column: 13, scope: !1994)
!2017 = !DILocation(line: 1550, column: 7, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !1994, file: !74, line: 1550, column: 7)
!2019 = !DILocation(line: 1550, column: 16, scope: !2018)
!2020 = !DILocation(line: 1550, column: 7, scope: !1994)
!2021 = !DILocation(line: 1552, column: 17, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2018, file: !74, line: 1551, column: 4)
!2023 = !DILocation(line: 1552, column: 12, scope: !2022)
!2024 = !DILocation(line: 1552, column: 5, scope: !2022)
!2025 = !DILocation(line: 1556, column: 5, scope: !2026)
!2026 = distinct !DILexicalBlock(scope: !2018, file: !74, line: 1555, column: 4)
!2027 = !DILocation(line: 1560, column: 1, scope: !1898)
!2028 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2029, file: !2029, line: 12, type: !2030, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2033)
!2029 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2030 = !DISubroutineType(types: !2031)
!2031 = !{null, !2032}
!2032 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2033 = !{!2034}
!2034 = !DILocalVariable(name: "z", arg: 1, scope: !2028, file: !2029, line: 12, type: !2032)
!2035 = !DILocation(line: 0, scope: !2028)
!2036 = !DILocation(line: 13, column: 9, scope: !2037)
!2037 = distinct !DILexicalBlock(scope: !2028, file: !2029, line: 13, column: 7)
!2038 = !DILocation(line: 13, column: 7, scope: !2028)
!2039 = !DILocation(line: 14, column: 5, scope: !2037)
!2040 = !DILocation(line: 15, column: 1, scope: !2028)
!2041 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2042, file: !2042, line: 20, type: !2043, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2046)
!2042 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2043 = !DISubroutineType(types: !2044)
!2044 = !{null, !2045, !2045}
!2045 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2046 = !{!2047, !2048}
!2047 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2041, file: !2042, line: 20, type: !2045)
!2048 = !DILocalVariable(name: "shift", arg: 2, scope: !2041, file: !2042, line: 20, type: !2045)
!2049 = !DILocation(line: 0, scope: !2041)
!2050 = !DILocation(line: 21, column: 13, scope: !2051)
!2051 = distinct !DILexicalBlock(scope: !2041, file: !2042, line: 21, column: 7)
!2052 = !DILocation(line: 21, column: 7, scope: !2041)
!2053 = !DILocation(line: 27, column: 5, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2051, file: !2042, line: 21, column: 26)
!2055 = !DILocation(line: 29, column: 1, scope: !2041)
