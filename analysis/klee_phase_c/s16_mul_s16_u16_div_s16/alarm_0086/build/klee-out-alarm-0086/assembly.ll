; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086/build/s16_mul_s16_u16_div_s16_alarm_0086.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0086: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0086.err\00", align 1
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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 654, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !712
  unreachable, !dbg !712

if.end45:                                         ; preds = %if.end40
  %19 = load i32, i32* %s32Result, align 4, !dbg !714
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !715
  %conv46 = sext i16 %20 to i32, !dbg !715
  %int_cast_to_i643 = zext i32 %conv46 to i64, !dbg !716
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !716
  %div47 = sdiv i32 %19, %conv46, !dbg !716, !klee.check.div !111
  %conv48 = sext i32 %div47 to i64, !dbg !717
  store volatile i64 %conv48, i64* @klee_alarm_sink_s64, align 8, !dbg !718
  store i16 0, i16* %retval, align 2, !dbg !719
  br label %return, !dbg !719

return:                                           ; preds = %if.end45, %if.then39, %if.then34, %if.then25, %if.then16, %if.then9, %if.else, %if.then6
  %21 = load i16, i16* %retval, align 2, !dbg !720
  ret i16 %21, !dbg !720
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !721 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !724, metadata !DIExpression()), !dbg !725
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !726
  %cmp = icmp ne i64 %0, 0, !dbg !727
  %conv = zext i1 %cmp to i32, !dbg !727
  ret i32 %conv, !dbg !728
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !729 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !732, metadata !DIExpression()), !dbg !733
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !734, metadata !DIExpression()), !dbg !735
  %0 = load i64, i64* %left.addr, align 8, !dbg !736
  %1 = load i64, i64* %right.addr, align 8, !dbg !737
  %mul = mul nsw i64 %0, %1, !dbg !738
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !739
  %conv = zext i1 %cmp to i32, !dbg !739
  ret i32 %conv, !dbg !740
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !741 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !742, metadata !DIExpression()), !dbg !743
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !744, metadata !DIExpression()), !dbg !745
  %0 = load i64, i64* %left.addr, align 8, !dbg !746
  %1 = load i64, i64* %right.addr, align 8, !dbg !747
  %mul = mul nsw i64 %0, %1, !dbg !748
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !749
  %conv = zext i1 %cmp to i32, !dbg !749
  ret i32 %conv, !dbg !750
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !751 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !752, metadata !DIExpression()), !dbg !753
  %0 = load i64, i64* %left.addr, align 8, !dbg !754
  %cmp = icmp sge i64 %0, 0, !dbg !755
  %conv = zext i1 %cmp to i32, !dbg !755
  ret i32 %conv, !dbg !756
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !757 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !760, metadata !DIExpression()), !dbg !761
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !762, metadata !DIExpression()), !dbg !763
  %0 = load i32, i32* %count.addr, align 4, !dbg !764
  %cmp = icmp uge i32 %0, 63, !dbg !766
  br i1 %cmp, label %if.then, label %if.end, !dbg !767

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !768
  br label %return, !dbg !768

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !770
  %2 = load i32, i32* %count.addr, align 4, !dbg !771
  %sh_prom = zext i32 %2 to i64, !dbg !772
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !772
  %shl = shl i64 1, %sh_prom, !dbg !772, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !773
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !774
  %conv = zext i1 %cmp1 to i32, !dbg !774
  store i32 %conv, i32* %retval, align 4, !dbg !775
  br label %return, !dbg !775

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !776
  ret i32 %3, !dbg !776
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !777 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !780, metadata !DIExpression()), !dbg !781
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !782, metadata !DIExpression()), !dbg !783
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !784, metadata !DIExpression()), !dbg !785
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !786, metadata !DIExpression()), !dbg !787
  store i32 0, i32* %s32Result, align 4, !dbg !787
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !788, metadata !DIExpression()), !dbg !789
  store i32 0, i32* %s32Temp1, align 4, !dbg !789
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !790
  %conv = zext i16 %0 to i32, !dbg !790
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !791
  %conv1 = sext i16 %1 to i32, !dbg !791
  %mul = mul nsw i32 %conv, %conv1, !dbg !792
  store i32 %mul, i32* %s32Result, align 4, !dbg !793
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !794
  %conv2 = zext i16 %2 to i32, !dbg !794
  %cmp = icmp eq i32 %conv2, 0, !dbg !796
  br i1 %cmp, label %if.then, label %if.else7, !dbg !797

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !798
  %cmp4 = icmp slt i32 %3, 0, !dbg !801
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !802

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !803
  br label %return, !dbg !803

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !805
  br label %return, !dbg !805

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !807
  %5 = load i32, i32* %s32Result, align 4, !dbg !809
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !810
  %conv8 = zext i16 %6 to i32, !dbg !810
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !811
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !811
  %div = sdiv i32 %5, %conv8, !dbg !811, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !812
  %conv9 = zext i16 %7 to i32, !dbg !812
  %mul10 = mul nsw i32 %div, %conv9, !dbg !813
  %sub = sub nsw i32 %4, %mul10, !dbg !814
  %shl = shl i32 %sub, 1, !dbg !815
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !816
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !817
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !818
  %conv11 = zext i16 %9 to i32, !dbg !818
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !819
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !819
  %div12 = sdiv i32 %8, %conv11, !dbg !819, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !820
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !821
  %conv13 = zext i16 %11 to i32, !dbg !821
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !822
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !822
  %div14 = sdiv i32 %10, %conv13, !dbg !822, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !823
  store i32 %add, i32* %s32Result, align 4, !dbg !824
  %12 = load i32, i32* %s32Result, align 4, !dbg !825
  %cmp15 = icmp slt i32 %12, 32767, !dbg !827
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !828

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !829
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !832
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !833

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !834
  %conv21 = trunc i32 %14 to i16, !dbg !836
  store i16 %conv21, i16* %retval, align 2, !dbg !837
  br label %return, !dbg !837

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !838
  br label %return, !dbg !838

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !840
  br label %return, !dbg !840

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !842
  ret i16 %15, !dbg !842
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !843 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !846, metadata !DIExpression()), !dbg !847
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !848, metadata !DIExpression()), !dbg !849
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !850, metadata !DIExpression()), !dbg !851
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !852, metadata !DIExpression()), !dbg !853
  store i32 0, i32* %u32Result, align 4, !dbg !853
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !854, metadata !DIExpression()), !dbg !855
  store i32 0, i32* %u32Temp1, align 4, !dbg !855
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !856, metadata !DIExpression()), !dbg !857
  store i32 0, i32* %s32Result, align 4, !dbg !857
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !858, metadata !DIExpression()), !dbg !859
  store i32 0, i32* %s32Temp1, align 4, !dbg !859
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !860
  %conv = sext i16 %0 to i32, !dbg !860
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !861
  %conv1 = zext i16 %1 to i32, !dbg !861
  %mul = mul nsw i32 %conv, %conv1, !dbg !862
  store i32 %mul, i32* %s32Result, align 4, !dbg !863
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !864
  %conv2 = sext i16 %2 to i32, !dbg !864
  %cmp = icmp eq i32 %conv2, 0, !dbg !866
  br i1 %cmp, label %if.then, label %if.else7, !dbg !867

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !868
  %cmp4 = icmp sge i32 %3, 0, !dbg !871
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !872

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !873
  br label %return, !dbg !873

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !875
  br label %return, !dbg !875

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !877
  %5 = load i32, i32* %s32Result, align 4, !dbg !879
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !880
  %conv8 = sext i16 %6 to i32, !dbg !880
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !881
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !881
  %div = sdiv i32 %5, %conv8, !dbg !881, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !882
  %conv9 = sext i16 %7 to i32, !dbg !882
  %mul10 = mul nsw i32 %div, %conv9, !dbg !883
  %sub = sub nsw i32 %4, %mul10, !dbg !884
  %shl = shl i32 %sub, 1, !dbg !885
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !886
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !887
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !888
  %conv11 = sext i16 %9 to i32, !dbg !888
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !889
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !889
  %div12 = sdiv i32 %8, %conv11, !dbg !889, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !890
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !891
  %conv13 = sext i16 %11 to i32, !dbg !891
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !892
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !892
  %div14 = sdiv i32 %10, %conv13, !dbg !892, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !893
  store i32 %add, i32* %s32Result, align 4, !dbg !894
  %12 = load i32, i32* %s32Result, align 4, !dbg !895
  %cmp15 = icmp slt i32 %12, 65535, !dbg !897
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !898

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !899
  %cmp18 = icmp sgt i32 %13, 0, !dbg !902
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !903

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !904
  %conv21 = trunc i32 %14 to i16, !dbg !906
  store i16 %conv21, i16* %retval, align 2, !dbg !907
  br label %return, !dbg !907

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !908
  br label %return, !dbg !908

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !910
  br label %return, !dbg !910

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !912
  ret i16 %15, !dbg !912
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !913 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !916, metadata !DIExpression()), !dbg !917
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !918, metadata !DIExpression()), !dbg !919
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !920, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !922, metadata !DIExpression()), !dbg !923
  store i32 0, i32* %s32Result, align 4, !dbg !923
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !924, metadata !DIExpression()), !dbg !925
  store i32 0, i32* %s32Temp1, align 4, !dbg !925
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !926
  %conv = sext i16 %0 to i32, !dbg !926
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !927
  %conv1 = zext i16 %1 to i32, !dbg !927
  %mul = mul nsw i32 %conv, %conv1, !dbg !928
  store i32 %mul, i32* %s32Result, align 4, !dbg !929
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !930
  %conv2 = zext i16 %2 to i32, !dbg !930
  %cmp = icmp eq i32 %conv2, 0, !dbg !932
  br i1 %cmp, label %if.then, label %if.else7, !dbg !933

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !934
  %cmp4 = icmp sge i32 %3, 0, !dbg !937
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !938

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !939
  br label %return, !dbg !939

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !941
  br label %return, !dbg !941

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !943
  %5 = load i32, i32* %s32Result, align 4, !dbg !945
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !946
  %conv8 = zext i16 %6 to i32, !dbg !946
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !947
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !947
  %div = sdiv i32 %5, %conv8, !dbg !947, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !948
  %conv9 = zext i16 %7 to i32, !dbg !948
  %mul10 = mul nsw i32 %div, %conv9, !dbg !949
  %sub = sub nsw i32 %4, %mul10, !dbg !950
  %shl = shl i32 %sub, 1, !dbg !951
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !952
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !953
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !954
  %conv11 = zext i16 %9 to i32, !dbg !954
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !955
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !955
  %div12 = sdiv i32 %8, %conv11, !dbg !955, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !956
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !957
  %conv13 = zext i16 %11 to i32, !dbg !957
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !958
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !958
  %div14 = sdiv i32 %10, %conv13, !dbg !958, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !959
  store i32 %add, i32* %s32Result, align 4, !dbg !960
  %12 = load i32, i32* %s32Result, align 4, !dbg !961
  %cmp15 = icmp slt i32 %12, 65535, !dbg !963
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !964

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !965
  %cmp18 = icmp sgt i32 %13, 0, !dbg !968
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !969

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !970
  %conv21 = trunc i32 %14 to i16, !dbg !972
  store i16 %conv21, i16* %retval, align 2, !dbg !973
  br label %return, !dbg !973

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !974
  br label %return, !dbg !974

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !976
  br label %return, !dbg !976

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !978
  ret i16 %15, !dbg !978
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !979 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !982, metadata !DIExpression()), !dbg !983
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !984, metadata !DIExpression()), !dbg !985
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !986, metadata !DIExpression()), !dbg !987
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !988, metadata !DIExpression()), !dbg !989
  store i32 0, i32* %u32Temp1, align 4, !dbg !989
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !990, metadata !DIExpression()), !dbg !991
  store i16 0, i16* %u16TempDenom, align 2, !dbg !991
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !992
  %conv = zext i16 %0 to i32, !dbg !992
  %cmp = icmp eq i32 %conv, 0, !dbg !994
  br i1 %cmp, label %if.then, label %if.else, !dbg !995

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !998
  %conv2 = zext i16 %1 to i32, !dbg !998
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1000
  %conv3 = zext i16 %2 to i32, !dbg !1000
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1001
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1002
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1003
  %conv4 = zext i16 %3 to i32, !dbg !1003
  %shr = ashr i32 %conv4, 1, !dbg !1004
  %conv5 = trunc i32 %shr to i16, !dbg !1003
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1005
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1006
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1007
  %conv6 = zext i16 %5 to i32, !dbg !1007
  %add = add i32 %4, %conv6, !dbg !1008
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1009
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1010
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1011
  %conv7 = zext i16 %7 to i32, !dbg !1011
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1012
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1012
  %div = udiv i32 %6, %conv7, !dbg !1012, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1013
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1014
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1016
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1017

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1018
  %and = and i32 %9, 65535, !dbg !1020
  %conv11 = trunc i32 %and to i16, !dbg !1021
  store i16 %conv11, i16* %retval, align 2, !dbg !1022
  br label %return, !dbg !1022

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1023
  br label %return, !dbg !1023

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1025
  ret i16 %10, !dbg !1025
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1026 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1029, metadata !DIExpression()), !dbg !1030
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1031, metadata !DIExpression()), !dbg !1032
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1033, metadata !DIExpression()), !dbg !1034
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1035, metadata !DIExpression()), !dbg !1036
  store i32 0, i32* %u32Temp1, align 4, !dbg !1036
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1037
  %cmp = icmp eq i32 %0, 0, !dbg !1039
  br i1 %cmp, label %if.then, label %if.else, !dbg !1040

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1041
  br label %return, !dbg !1041

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1043
  %conv = zext i16 %1 to i32, !dbg !1043
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1045
  %conv1 = zext i16 %2 to i32, !dbg !1045
  %mul = mul nsw i32 %conv, %conv1, !dbg !1046
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1047
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1048
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1048
  %div = udiv i32 %mul, %3, !dbg !1048, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1049
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1050
  %conv2 = zext i16 %4 to i32, !dbg !1050
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1052
  %conv3 = zext i16 %5 to i32, !dbg !1052
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1053
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1054
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1055
  %mul5 = mul i32 %6, %7, !dbg !1056
  %sub = sub i32 %mul4, %mul5, !dbg !1057
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1058
  %div6 = udiv i32 %8, 2, !dbg !1059
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1060
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1061

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1062
  %inc = add i32 %9, 1, !dbg !1062
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1062
  br label %if.end, !dbg !1064

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1065
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1067
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1068

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1069
  %and = and i32 %11, 65535, !dbg !1071
  %conv13 = trunc i32 %and to i16, !dbg !1072
  store i16 %conv13, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1074
  br label %return, !dbg !1074

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1076
  ret i16 %12, !dbg !1076
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1077 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1080, metadata !DIExpression()), !dbg !1081
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1082, metadata !DIExpression()), !dbg !1083
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1084, metadata !DIExpression()), !dbg !1085
  store i32 0, i32* %u32Temp1, align 4, !dbg !1085
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1086
  %conv = zext i16 %0 to i32, !dbg !1086
  %cmp = icmp eq i32 %conv, 0, !dbg !1088
  br i1 %cmp, label %if.then, label %if.else, !dbg !1089

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1090
  br label %return, !dbg !1090

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1092
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1094
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv2 = zext i16 %3 to i32, !dbg !1095
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1096
  %div = udiv i32 %2, %conv2, !dbg !1096, !klee.check.div !111
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1097
  %conv3 = zext i16 %4 to i32, !dbg !1097
  %mul = mul i32 %div, %conv3, !dbg !1098
  %sub = sub i32 %1, %mul, !dbg !1099
  %shl = shl i32 %sub, 1, !dbg !1100
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1101
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1102
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1103
  %conv4 = zext i16 %6 to i32, !dbg !1103
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1104
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1104
  %div5 = udiv i32 %5, %conv4, !dbg !1104, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1105
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1106
  %conv6 = zext i16 %8 to i32, !dbg !1106
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1107
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1107
  %div7 = udiv i32 %7, %conv6, !dbg !1107, !klee.check.div !111
  %add = add i32 %div5, %div7, !dbg !1108
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1109
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1110
  store i32 %9, i32* %retval, align 4, !dbg !1111
  br label %return, !dbg !1111

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1112
  ret i32 %10, !dbg !1112
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1113 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1120, metadata !DIExpression()), !dbg !1121
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i32 0, i32* %s32Temp1, align 4, !dbg !1123
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1124, metadata !DIExpression()), !dbg !1125
  store i32 0, i32* %s32Temp2, align 4, !dbg !1125
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1126, metadata !DIExpression()), !dbg !1127
  store i32 0, i32* %s32Temp3, align 4, !dbg !1127
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1128
  %conv = sext i16 %0 to i32, !dbg !1128
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1129
  %conv1 = sext i16 %1 to i32, !dbg !1129
  %mul = mul nsw i32 %conv, %conv1, !dbg !1130
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1131
  %2 = load i16, i16* %div.addr, align 2, !dbg !1132
  %conv2 = sext i16 %2 to i32, !dbg !1132
  %cmp = icmp eq i32 %conv2, 0, !dbg !1134
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1135

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1136
  %cmp4 = icmp slt i32 %3, 0, !dbg !1139
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1140

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1141
  br label %return, !dbg !1141

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1143
  br label %return, !dbg !1143

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1145
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1147
  %6 = load i16, i16* %div.addr, align 2, !dbg !1148
  %conv8 = sext i16 %6 to i32, !dbg !1148
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1149
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1149
  %div9 = sdiv i32 %5, %conv8, !dbg !1149, !klee.check.div !111
  %7 = load i16, i16* %div.addr, align 2, !dbg !1150
  %conv10 = sext i16 %7 to i32, !dbg !1150
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1151
  %sub = sub nsw i32 %4, %mul11, !dbg !1152
  %shl = shl i32 %sub, 1, !dbg !1153
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1154
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1155
  %9 = load i16, i16* %div.addr, align 2, !dbg !1156
  %conv12 = sext i16 %9 to i32, !dbg !1156
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1157
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1157
  %div13 = sdiv i32 %8, %conv12, !dbg !1157, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1158
  %11 = load i16, i16* %div.addr, align 2, !dbg !1159
  %conv14 = sext i16 %11 to i32, !dbg !1159
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1160
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1160
  %div15 = sdiv i32 %10, %conv14, !dbg !1160, !klee.check.div !111
  %add = add nsw i32 %div13, %div15, !dbg !1161
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1162
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1163
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1165
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1166

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1167
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1170
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1171

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1172
  %conv22 = trunc i32 %14 to i16, !dbg !1174
  store i16 %conv22, i16* %retval, align 2, !dbg !1175
  br label %return, !dbg !1175

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1176
  br label %return, !dbg !1176

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1178
  br label %return, !dbg !1178

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1180
  ret i16 %15, !dbg !1180
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1181 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1184, metadata !DIExpression()), !dbg !1185
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1186, metadata !DIExpression()), !dbg !1187
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1188, metadata !DIExpression()), !dbg !1189
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1190, metadata !DIExpression()), !dbg !1191
  store i32 0, i32* %s32Result, align 4, !dbg !1191
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i32 0, i32* %s32Temp1, align 4, !dbg !1193
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1194
  %conv = sext i16 %0 to i32, !dbg !1194
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1195
  %conv1 = sext i16 %1 to i32, !dbg !1195
  %mul = mul nsw i32 %conv, %conv1, !dbg !1196
  store i32 %mul, i32* %s32Result, align 4, !dbg !1197
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1198
  %conv2 = zext i16 %2 to i32, !dbg !1198
  %cmp = icmp eq i32 %conv2, 0, !dbg !1200
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1201

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1202
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1205
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1206

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1207
  br label %return, !dbg !1207

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1209
  %cmp7 = icmp eq i32 %4, 0, !dbg !1211
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1212

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1213
  br label %return, !dbg !1213

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1215
  br label %return, !dbg !1215

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1217
  %6 = load i32, i32* %s32Result, align 4, !dbg !1219
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1220
  %conv12 = zext i16 %7 to i32, !dbg !1220
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1221
  %div = sdiv i32 %6, %conv12, !dbg !1221, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1222
  %conv13 = zext i16 %8 to i32, !dbg !1222
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1223
  %sub = sub nsw i32 %5, %mul14, !dbg !1224
  %shl = shl i32 %sub, 1, !dbg !1225
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1226
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1227
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1228
  %conv15 = zext i16 %10 to i32, !dbg !1228
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1229
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1229
  %div16 = sdiv i32 %9, %conv15, !dbg !1229, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1230
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1231
  %conv17 = zext i16 %12 to i32, !dbg !1231
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1232
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1232
  %div18 = sdiv i32 %11, %conv17, !dbg !1232, !klee.check.div !111
  %add = add nsw i32 %div16, %div18, !dbg !1233
  store i32 %add, i32* %s32Result, align 4, !dbg !1234
  %13 = load i32, i32* %s32Result, align 4, !dbg !1235
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1237
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1238

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1239
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1242
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1243

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1244
  %conv25 = trunc i32 %15 to i16, !dbg !1246
  store i16 %conv25, i16* %retval, align 2, !dbg !1247
  br label %return, !dbg !1247

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1248
  br label %return, !dbg !1248

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1250
  br label %return, !dbg !1250

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1252
  ret i16 %16, !dbg !1252
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1253 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1258, metadata !DIExpression()), !dbg !1259
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1260, metadata !DIExpression()), !dbg !1261
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1262
  %cmp = icmp eq i32 %0, 0, !dbg !1264
  br i1 %cmp, label %if.then, label %if.else, !dbg !1265

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1266
  br label %return, !dbg !1266

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1268
  %cmp1 = icmp sle i32 %1, 0, !dbg !1271
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1272

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1273
  br label %return, !dbg !1273

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1275
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1277
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1279
  %div = udiv i32 %3, %4, !dbg !1279, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1280
  %mul = mul i32 %div, %5, !dbg !1281
  %sub = sub i32 %2, %mul, !dbg !1282
  %shl = shl i32 %sub, 1, !dbg !1283
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1284
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1285
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1286
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1287
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1287
  %div4 = udiv i32 %6, %7, !dbg !1287, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1288
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1289
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1290
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1290
  %div5 = udiv i32 %8, %9, !dbg !1290, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1291
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1292
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1293
  store i32 %10, i32* %retval, align 4, !dbg !1294
  br label %return, !dbg !1294

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1295
  ret i32 %11, !dbg !1295
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1296 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1299, metadata !DIExpression()), !dbg !1300
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1301, metadata !DIExpression()), !dbg !1302
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1303, metadata !DIExpression()), !dbg !1304
  store i32 0, i32* %s32Temp1, align 4, !dbg !1304
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1305
  %cmp = icmp eq i32 %0, 0, !dbg !1307
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1308

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1309
  %cmp1 = icmp sge i32 %1, 0, !dbg !1312
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1313

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1316
  br label %return, !dbg !1316

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %cmp4 = icmp sge i32 %2, 0, !dbg !1321
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1322

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1323
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1325
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1326
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1327
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1327
  %div = udiv i32 %4, %5, !dbg !1327, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1328
  %mul = mul i32 %div, %6, !dbg !1329
  %sub = sub i32 %3, %mul, !dbg !1330
  %shl = shl i32 %sub, 1, !dbg !1331
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1332
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1333
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1335
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1335
  %div6 = udiv i32 %7, %8, !dbg !1335, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1336
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1338
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1338
  %div7 = udiv i32 %9, %10, !dbg !1338, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1339
  store i32 %add, i32* %retval, align 4, !dbg !1340
  br label %return, !dbg !1340

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1341
  br label %return, !dbg !1341

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1343
  ret i32 %11, !dbg !1343
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1344 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1347, metadata !DIExpression()), !dbg !1348
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1349, metadata !DIExpression()), !dbg !1350
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1351, metadata !DIExpression()), !dbg !1352
  store i32 0, i32* %u32Temp1, align 4, !dbg !1352
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1353, metadata !DIExpression()), !dbg !1354
  store i32 0, i32* %u32Temp2, align 4, !dbg !1354
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1355
  %cmp = icmp eq i32 %0, 0, !dbg !1357
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1358

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1359
  %cmp1 = icmp slt i32 %1, 0, !dbg !1362
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1363

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1364
  br label %return, !dbg !1364

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1368
  %cmp4 = icmp sge i32 %2, 0, !dbg !1371
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1372

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1373
  %cmp6 = icmp eq i32 %3, 0, !dbg !1376
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1377

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1378
  br label %return, !dbg !1378

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %cmp9 = icmp sle i32 %4, 0, !dbg !1383
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1384

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1385
  br label %return, !dbg !1385

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1387
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1389
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1391
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1391
  %div = sdiv i32 %6, %7, !dbg !1391, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %mul = mul nsw i32 %div, %8, !dbg !1393
  %sub = sub nsw i32 %5, %mul, !dbg !1394
  %shl = shl i32 %sub, 1, !dbg !1395
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1396
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1397
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1399
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1399
  %div12 = udiv i32 %9, %10, !dbg !1399, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1401
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1402
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1402
  %div13 = sdiv i32 %11, %12, !dbg !1402, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1403
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1404
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1405
  store i32 %13, i32* %retval, align 4, !dbg !1406
  br label %return, !dbg !1406

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1410
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1411

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1414
  %sub18 = sub nsw i32 0, %15, !dbg !1416
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1417
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %sub19 = sub nsw i32 0, %16, !dbg !1419
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1420
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1421
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1424
  %div20 = sdiv i32 %18, %19, !dbg !1424, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1425
  %mul21 = mul nsw i32 %div20, %20, !dbg !1426
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1427
  %shl23 = shl i32 %sub22, 1, !dbg !1428
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1429
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1430
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1431
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1432
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1432
  %div24 = udiv i32 %21, %22, !dbg !1432, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1433
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1435
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1435
  %div25 = sdiv i32 %23, %24, !dbg !1435, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1436
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1437
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1438
  store i32 %25, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1440
  ret i32 %26, !dbg !1440
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1441 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1444, metadata !DIExpression()), !dbg !1445
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1446, metadata !DIExpression()), !dbg !1447
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1448, metadata !DIExpression()), !dbg !1449
  store i32 0, i32* %u32Temp1, align 4, !dbg !1449
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1450, metadata !DIExpression()), !dbg !1451
  store i32 0, i32* %u32Temp2, align 4, !dbg !1451
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1452, metadata !DIExpression()), !dbg !1453
  store i32 0, i32* %u32Temp3, align 4, !dbg !1453
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1454, metadata !DIExpression()), !dbg !1455
  store i32 0, i32* %numerator_old, align 4, !dbg !1455
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %cmp = icmp eq i32 %0, 0, !dbg !1458
  br i1 %cmp, label %if.then, label %if.else, !dbg !1459

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1460
  br label %return, !dbg !1460

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1462
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1465
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1467
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1467
  %div = udiv i32 %3, %4, !dbg !1467, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1468
  %sub = sub i32 %1, %mul, !dbg !1469
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1470
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1471
  %and = and i32 %5, 1, !dbg !1473
  %cmp1 = icmp eq i32 %and, 0, !dbg !1474
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1475

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %shr = lshr i32 %6, 1, !dbg !1478
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1479
  br label %if.end, !dbg !1480

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1481
  %shr4 = lshr i32 %7, 1, !dbg !1483
  %add = add i32 %shr4, 1, !dbg !1484
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1485
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1486
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1489
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1490

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1491
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1493
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1494
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1494
  %div7 = udiv i32 %10, %11, !dbg !1494, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1495
  br label %return, !dbg !1495

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1496
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1499
  %div9 = udiv i32 %12, %13, !dbg !1499, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1500
  store i32 %add10, i32* %retval, align 4, !dbg !1501
  br label %return, !dbg !1501

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1502
  ret i32 %14, !dbg !1502
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1503 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1508, metadata !DIExpression()), !dbg !1509
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1510, metadata !DIExpression()), !dbg !1511
  store i32 0, i32* %u32Temp1, align 4, !dbg !1511
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1512, metadata !DIExpression()), !dbg !1513
  store i32 0, i32* %u32Temp2, align 4, !dbg !1513
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1514
  %cmp = icmp sle i32 %0, 0, !dbg !1516
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1517

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %cmp1 = icmp sge i32 %1, 0, !dbg !1521
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1522

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1523
  br label %return, !dbg !1523

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %sub = sub nsw i32 0, %2, !dbg !1527
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1528
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1529
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1532
  %div = udiv i32 %4, %5, !dbg !1532, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %mul = mul i32 %div, %6, !dbg !1534
  %sub3 = sub i32 %3, %mul, !dbg !1535
  %shl = shl i32 %sub3, 1, !dbg !1536
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1537
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1538
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1540
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1540
  %div4 = udiv i32 %7, %8, !dbg !1540, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1541
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1543
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1543
  %div5 = udiv i32 %9, %10, !dbg !1543, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1544
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1545
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1546
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1548
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1549

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1550
  %sub8 = sub i32 0, %12, !dbg !1552
  store i32 %sub8, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1554
  br label %return, !dbg !1554

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1556
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1560
  %div11 = udiv i32 %14, %15, !dbg !1560, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1561
  %mul12 = mul i32 %div11, %16, !dbg !1562
  %sub13 = sub i32 %13, %mul12, !dbg !1563
  %shl14 = shl i32 %sub13, 1, !dbg !1564
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1565
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1566
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1567
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1568
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1568
  %div15 = udiv i32 %17, %18, !dbg !1568, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1569
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1571
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1571
  %div16 = udiv i32 %19, %20, !dbg !1571, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1572
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1573
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1574
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1576
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1577

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1578
  store i32 %22, i32* %retval, align 4, !dbg !1580
  br label %return, !dbg !1580

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1581
  br label %return, !dbg !1581

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1583
  ret i32 %23, !dbg !1583
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1584 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1587, metadata !DIExpression()), !dbg !1588
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1589, metadata !DIExpression()), !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %s32Temp1, align 4, !dbg !1592
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i32 0, i32* %s32Temp2, align 4, !dbg !1594
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1595, metadata !DIExpression()), !dbg !1596
  store i32 0, i32* %u32Temp0, align 4, !dbg !1596
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1597, metadata !DIExpression()), !dbg !1598
  store i32 0, i32* %u32Temp1, align 4, !dbg !1598
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1599, metadata !DIExpression()), !dbg !1600
  store i32 0, i32* %u32Temp2, align 4, !dbg !1600
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1601
  %cmp = icmp eq i32 %0, 0, !dbg !1603
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1604

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1605
  %cmp1 = icmp slt i32 %1, 0, !dbg !1608
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1609

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1610
  br label %return, !dbg !1610

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1612
  br label %return, !dbg !1612

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1614
  %cmp4 = icmp sle i32 %2, 0, !dbg !1617
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1618

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1619
  %sub = sub nsw i32 0, %3, !dbg !1621
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1622
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1623
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1625
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1625
  %div = udiv i32 %4, %5, !dbg !1625, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1626
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1627
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1628
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1630
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1630
  %div6 = udiv i32 %7, %8, !dbg !1630, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %mul = mul i32 %div6, %9, !dbg !1632
  %sub7 = sub i32 %6, %mul, !dbg !1633
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1634
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1635
  %and = and i32 %10, 1, !dbg !1637
  %cmp8 = icmp eq i32 %and, 0, !dbg !1638
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1639

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1640
  %shr = lshr i32 %11, 1, !dbg !1642
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1643
  br label %if.end, !dbg !1644

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1645
  %shr11 = lshr i32 %12, 1, !dbg !1647
  %add = add i32 %shr11, 1, !dbg !1648
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1649
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1650
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1652
  %cmp12 = icmp ult i32 %13, %14, !dbg !1653
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1654

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1655
  %neg = xor i32 %15, -1, !dbg !1657
  %add14 = add i32 %neg, 1, !dbg !1658
  store i32 %add14, i32* %retval, align 4, !dbg !1659
  br label %return, !dbg !1659

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1660
  %add16 = add i32 %16, 1, !dbg !1662
  %neg17 = xor i32 %add16, -1, !dbg !1663
  %add18 = add i32 %neg17, 1, !dbg !1664
  store i32 %add18, i32* %retval, align 4, !dbg !1665
  br label %return, !dbg !1665

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1666
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1668
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1670
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1670
  %div20 = udiv i32 %18, %19, !dbg !1670, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1671
  %mul21 = mul i32 %div20, %20, !dbg !1672
  %sub22 = sub i32 %17, %mul21, !dbg !1673
  %shl = shl i32 %sub22, 1, !dbg !1674
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1675
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1676
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1677
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1678
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1678
  %div23 = udiv i32 %21, %22, !dbg !1678, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1679
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1680
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1681
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1681
  %div24 = udiv i32 %23, %24, !dbg !1681, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1682
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1683
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1684
  store i32 %25, i32* %retval, align 4, !dbg !1685
  br label %return, !dbg !1685

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1686
  ret i32 %26, !dbg !1686
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1687 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1690, metadata !DIExpression()), !dbg !1691
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1692, metadata !DIExpression()), !dbg !1693
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1694, metadata !DIExpression()), !dbg !1695
  store i32 0, i32* %s32Temp1, align 4, !dbg !1695
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1696, metadata !DIExpression()), !dbg !1697
  store i32 0, i32* %s32Temp2, align 4, !dbg !1697
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1698, metadata !DIExpression()), !dbg !1699
  store i32 0, i32* %denominator_prime, align 4, !dbg !1699
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1700, metadata !DIExpression()), !dbg !1701
  store i32 0, i32* %u32Temp1, align 4, !dbg !1701
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1702, metadata !DIExpression()), !dbg !1703
  store i32 0, i32* %u32Temp2, align 4, !dbg !1703
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1704, metadata !DIExpression()), !dbg !1705
  store i32 0, i32* %u32numerator, align 4, !dbg !1705
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1706, metadata !DIExpression()), !dbg !1707
  store i32 0, i32* %u32denominator, align 4, !dbg !1707
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1708
  %cmp = icmp slt i32 %0, 0, !dbg !1710
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1711

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %cmp1 = icmp sle i32 %1, 0, !dbg !1715
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1716

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %cmp3 = icmp sge i32 %2, 0, !dbg !1720
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1721

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1722
  br label %return, !dbg !1722

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1724
  %sub = sub nsw i32 0, %3, !dbg !1726
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1727
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1728
  %sub5 = sub nsw i32 0, %4, !dbg !1729
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1730
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1731
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1732
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1734
  %div = udiv i32 %6, %7, !dbg !1734, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1735
  %mul = mul i32 %div, %8, !dbg !1736
  %sub6 = sub i32 %5, %mul, !dbg !1737
  %shl = shl i32 %sub6, 1, !dbg !1738
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1739
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1740
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1741
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1742
  %div7 = udiv i32 %9, %10, !dbg !1742, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1743
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1744
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1745
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1745
  %div8 = udiv i32 %11, %12, !dbg !1745, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1746
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1747
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1748
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1750
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1751

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1752
  store i32 %14, i32* %retval, align 4, !dbg !1754
  br label %return, !dbg !1754

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1755
  br label %return, !dbg !1755

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1757
  %neg = xor i32 %15, -1, !dbg !1759
  %add13 = add nsw i32 %neg, 1, !dbg !1760
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1761
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1762
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1763
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1765
  %div14 = udiv i32 %17, %18, !dbg !1765, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1766
  %mul15 = mul i32 %div14, %19, !dbg !1767
  %sub16 = sub i32 %16, %mul15, !dbg !1768
  %shl17 = shl i32 %sub16, 1, !dbg !1769
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1770
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1771
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1772
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1773
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1773
  %div18 = udiv i32 %20, %21, !dbg !1773, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1774
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1775
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1776
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1776
  %div19 = sdiv i32 %22, %23, !dbg !1776, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1777
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1778
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1779
  %neg21 = xor i32 %24, -1, !dbg !1780
  %add22 = add nsw i32 %neg21, 1, !dbg !1781
  store i32 %add22, i32* %retval, align 4, !dbg !1782
  br label %return, !dbg !1782

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1783
  %cmp24 = icmp sle i32 %25, 0, !dbg !1786
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1787

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %cmp26 = icmp sge i32 %26, 0, !dbg !1791
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1792

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1793
  br label %return, !dbg !1793

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1795
  %neg29 = xor i32 %27, -1, !dbg !1797
  %add30 = add nsw i32 %neg29, 1, !dbg !1798
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1799
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1800
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1801
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1803
  %div31 = udiv i32 %29, %30, !dbg !1803, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1804
  %mul32 = mul i32 %div31, %31, !dbg !1805
  %sub33 = sub i32 %28, %mul32, !dbg !1806
  %shl34 = shl i32 %sub33, 1, !dbg !1807
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1808
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1810
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1811
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1811
  %div35 = udiv i32 %32, %33, !dbg !1811, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1812
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1813
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1814
  %div36 = udiv i32 %34, %35, !dbg !1814, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1815
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1816
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1817
  %neg38 = xor i32 %36, -1, !dbg !1818
  %add39 = add nsw i32 %neg38, 1, !dbg !1819
  store i32 %add39, i32* %retval, align 4, !dbg !1820
  br label %return, !dbg !1820

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1821
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1823
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1825
  %div41 = sdiv i32 %38, %39, !dbg !1825, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1826
  %mul42 = mul nsw i32 %div41, %40, !dbg !1827
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1828
  %shl44 = shl i32 %sub43, 1, !dbg !1829
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1830
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1832
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1833
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1833
  %div45 = sdiv i32 %41, %42, !dbg !1833, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1834
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1836
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1836
  %div46 = udiv i32 %43, %44, !dbg !1836, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1837
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1838
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1839
  store i32 %45, i32* %retval, align 4, !dbg !1840
  br label %return, !dbg !1840

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1841
  ret i32 %46, !dbg !1841
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1842 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1845, metadata !DIExpression()), !dbg !1846
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1847, metadata !DIExpression()), !dbg !1848
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1849, metadata !DIExpression()), !dbg !1850
  store i32 0, i32* %numerator_prime, align 4, !dbg !1850
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1851, metadata !DIExpression()), !dbg !1852
  store i32 0, i32* %u32Temp1, align 4, !dbg !1852
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1853, metadata !DIExpression()), !dbg !1854
  store i32 0, i32* %u32Temp2, align 4, !dbg !1854
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1855, metadata !DIExpression()), !dbg !1856
  store i32 0, i32* %u32Temp3, align 4, !dbg !1856
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1857, metadata !DIExpression()), !dbg !1858
  store i32 0, i32* %s32Temp1, align 4, !dbg !1858
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1859, metadata !DIExpression()), !dbg !1860
  store i32 0, i32* %s32Temp2, align 4, !dbg !1860
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1861, metadata !DIExpression()), !dbg !1862
  store i32 0, i32* %s32Temp3, align 4, !dbg !1862
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1863
  %cmp = icmp eq i32 %0, 0, !dbg !1865
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1866

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1867
  %cmp1 = icmp slt i32 %1, 0, !dbg !1870
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1871

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1872
  br label %return, !dbg !1872

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1874
  br label %return, !dbg !1874

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1876
  %cmp4 = icmp slt i32 %2, 0, !dbg !1879
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1880

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %sub = sub nsw i32 0, %3, !dbg !1883
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1884
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1885
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1886
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1887
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1887
  %div = udiv i32 %4, %5, !dbg !1887, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1888
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1889
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1890
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1891
  %mul = mul i32 %7, %8, !dbg !1892
  %sub6 = sub i32 %6, %mul, !dbg !1893
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1894
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1895
  %and = and i32 %9, 1, !dbg !1897
  %cmp7 = icmp eq i32 %and, 0, !dbg !1898
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1899

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1900
  %shr = lshr i32 %10, 1, !dbg !1902
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1903
  br label %if.end, !dbg !1904

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1905
  %shr10 = lshr i32 %11, 1, !dbg !1907
  %add = add i32 %shr10, 1, !dbg !1908
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1909
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1910
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1912
  %cmp11 = icmp ult i32 %12, %13, !dbg !1913
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1914

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1915
  %neg = xor i32 %14, -1, !dbg !1917
  %add13 = add i32 %neg, 1, !dbg !1918
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1919
  br label %if.end18, !dbg !1920

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1921
  %add15 = add i32 %15, 1, !dbg !1923
  %neg16 = xor i32 %add15, -1, !dbg !1924
  %add17 = add i32 %neg16, 1, !dbg !1925
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1926
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1927
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1929
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1930

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1931
  %conv = trunc i32 %17 to i16, !dbg !1933
  store i16 %conv, i16* %retval, align 2, !dbg !1934
  br label %return, !dbg !1934

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1935
  br label %return, !dbg !1935

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1937
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1939
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1940
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1940
  %div23 = udiv i32 %18, %19, !dbg !1940, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1941
  %mul24 = mul i32 %div23, %20, !dbg !1942
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1943
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1944
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1945
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1947
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1947
  %div25 = udiv i32 %22, %23, !dbg !1947, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1948
  %mul26 = mul i32 %div25, %24, !dbg !1949
  %sub27 = sub i32 %21, %mul26, !dbg !1950
  %shl = shl i32 %sub27, 1, !dbg !1951
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1952
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1953
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1954
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1955
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1955
  %div28 = udiv i32 %25, %26, !dbg !1955, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1956
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1957
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1958
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1958
  %div29 = udiv i32 %27, %28, !dbg !1958, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !1959
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1960
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1961
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1963
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1964

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1965
  %conv34 = trunc i32 %30 to i16, !dbg !1967
  store i16 %conv34, i16* %retval, align 2, !dbg !1968
  br label %return, !dbg !1968

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1969
  br label %return, !dbg !1969

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1971
  ret i16 %31, !dbg !1971
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1972 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1978, metadata !DIExpression()), !dbg !1979
  %2 = icmp eq i64 %0, 0, !dbg !1980
  br i1 %2, label %3, label %4, !dbg !1982

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1983
  unreachable, !dbg !1983

4:                                                ; preds = %1
  ret void, !dbg !1984
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1985 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1991, metadata !DIExpression()), !dbg !1993
  call void @llvm.dbg.value(metadata i64 %1, metadata !1992, metadata !DIExpression()), !dbg !1993
  %3 = icmp ult i64 %1, %0, !dbg !1994
  br i1 %3, label %5, label %4, !dbg !1996

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1997
  unreachable, !dbg !1997

5:                                                ; preds = %2
  ret void, !dbg !1999
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086/div_Ccode_alarm_0086.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086")
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
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086")
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
!714 = !DILocation(line: 659, column: 35, scope: !650)
!715 = !DILocation(line: 659, column: 47, scope: !650)
!716 = !DILocation(line: 659, column: 45, scope: !650)
!717 = !DILocation(line: 659, column: 25, scope: !650)
!718 = !DILocation(line: 659, column: 23, scope: !650)
!719 = !DILocation(line: 660, column: 3, scope: !650)
!720 = !DILocation(line: 679, column: 1, scope: !618)
!721 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !722, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!722 = !DISubroutineType(types: !723)
!723 = !{!28, !22}
!724 = !DILocalVariable(name: "denominator", arg: 1, scope: !721, file: !33, line: 24, type: !22)
!725 = !DILocation(line: 24, column: 40, scope: !721)
!726 = !DILocation(line: 26, column: 12, scope: !721)
!727 = !DILocation(line: 26, column: 24, scope: !721)
!728 = !DILocation(line: 26, column: 5, scope: !721)
!729 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !730, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!730 = !DISubroutineType(types: !731)
!731 = !{!28, !22, !22}
!732 = !DILocalVariable(name: "left", arg: 1, scope: !729, file: !33, line: 78, type: !22)
!733 = !DILocation(line: 78, column: 38, scope: !729)
!734 = !DILocalVariable(name: "right", arg: 2, scope: !729, file: !33, line: 78, type: !22)
!735 = !DILocation(line: 78, column: 52, scope: !729)
!736 = !DILocation(line: 80, column: 12, scope: !729)
!737 = !DILocation(line: 80, column: 19, scope: !729)
!738 = !DILocation(line: 80, column: 17, scope: !729)
!739 = !DILocation(line: 80, column: 25, scope: !729)
!740 = !DILocation(line: 80, column: 5, scope: !729)
!741 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !730, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!742 = !DILocalVariable(name: "left", arg: 1, scope: !741, file: !33, line: 72, type: !22)
!743 = !DILocation(line: 72, column: 38, scope: !741)
!744 = !DILocalVariable(name: "right", arg: 2, scope: !741, file: !33, line: 72, type: !22)
!745 = !DILocation(line: 72, column: 52, scope: !741)
!746 = !DILocation(line: 74, column: 12, scope: !741)
!747 = !DILocation(line: 74, column: 19, scope: !741)
!748 = !DILocation(line: 74, column: 17, scope: !741)
!749 = !DILocation(line: 74, column: 25, scope: !741)
!750 = !DILocation(line: 74, column: 5, scope: !741)
!751 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !722, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!752 = !DILocalVariable(name: "left", arg: 1, scope: !751, file: !33, line: 84, type: !22)
!753 = !DILocation(line: 84, column: 51, scope: !751)
!754 = !DILocation(line: 86, column: 12, scope: !751)
!755 = !DILocation(line: 86, column: 17, scope: !751)
!756 = !DILocation(line: 86, column: 5, scope: !751)
!757 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !758, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!758 = !DISubroutineType(types: !759)
!759 = !{!28, !22, !29}
!760 = !DILocalVariable(name: "left", arg: 1, scope: !757, file: !33, line: 90, type: !22)
!761 = !DILocation(line: 90, column: 41, scope: !757)
!762 = !DILocalVariable(name: "count", arg: 2, scope: !757, file: !33, line: 90, type: !29)
!763 = !DILocation(line: 90, column: 56, scope: !757)
!764 = !DILocation(line: 92, column: 9, scope: !765)
!765 = distinct !DILexicalBlock(scope: !757, file: !33, line: 92, column: 9)
!766 = !DILocation(line: 92, column: 15, scope: !765)
!767 = !DILocation(line: 92, column: 9, scope: !757)
!768 = !DILocation(line: 93, column: 9, scope: !769)
!769 = distinct !DILexicalBlock(scope: !765, file: !33, line: 92, column: 32)
!770 = !DILocation(line: 95, column: 12, scope: !757)
!771 = !DILocation(line: 95, column: 34, scope: !757)
!772 = !DILocation(line: 95, column: 31, scope: !757)
!773 = !DILocation(line: 95, column: 17, scope: !757)
!774 = !DILocation(line: 95, column: 41, scope: !757)
!775 = !DILocation(line: 95, column: 5, scope: !757)
!776 = !DILocation(line: 96, column: 1, scope: !757)
!777 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !74, file: !74, line: 697, type: !778, scopeLine: 698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!778 = !DISubroutineType(types: !779)
!779 = !{!6, !18, !6, !18}
!780 = !DILocalVariable(name: "factor1", arg: 1, scope: !777, file: !74, line: 697, type: !18)
!781 = !DILocation(line: 697, column: 33, scope: !777)
!782 = !DILocalVariable(name: "factor2", arg: 2, scope: !777, file: !74, line: 697, type: !6)
!783 = !DILocation(line: 697, column: 46, scope: !777)
!784 = !DILocalVariable(name: "denominator", arg: 3, scope: !777, file: !74, line: 697, type: !18)
!785 = !DILocation(line: 697, column: 59, scope: !777)
!786 = !DILocalVariable(name: "s32Result", scope: !777, file: !74, line: 699, type: !25)
!787 = !DILocation(line: 699, column: 6, scope: !777)
!788 = !DILocalVariable(name: "s32Temp1", scope: !777, file: !74, line: 699, type: !25)
!789 = !DILocation(line: 699, column: 21, scope: !777)
!790 = !DILocation(line: 700, column: 14, scope: !777)
!791 = !DILocation(line: 700, column: 24, scope: !777)
!792 = !DILocation(line: 700, column: 22, scope: !777)
!793 = !DILocation(line: 700, column: 12, scope: !777)
!794 = !DILocation(line: 701, column: 5, scope: !795)
!795 = distinct !DILexicalBlock(scope: !777, file: !74, line: 701, column: 5)
!796 = !DILocation(line: 701, column: 16, scope: !795)
!797 = !DILocation(line: 701, column: 5, scope: !777)
!798 = !DILocation(line: 703, column: 6, scope: !799)
!799 = distinct !DILexicalBlock(scope: !800, file: !74, line: 703, column: 6)
!800 = distinct !DILexicalBlock(scope: !795, file: !74, line: 702, column: 2)
!801 = !DILocation(line: 703, column: 16, scope: !799)
!802 = !DILocation(line: 703, column: 6, scope: !800)
!803 = !DILocation(line: 705, column: 4, scope: !804)
!804 = distinct !DILexicalBlock(scope: !799, file: !74, line: 704, column: 3)
!805 = !DILocation(line: 709, column: 4, scope: !806)
!806 = distinct !DILexicalBlock(scope: !799, file: !74, line: 708, column: 3)
!807 = !DILocation(line: 714, column: 14, scope: !808)
!808 = distinct !DILexicalBlock(scope: !795, file: !74, line: 713, column: 2)
!809 = !DILocation(line: 714, column: 28, scope: !808)
!810 = !DILocation(line: 714, column: 38, scope: !808)
!811 = !DILocation(line: 714, column: 37, scope: !808)
!812 = !DILocation(line: 714, column: 53, scope: !808)
!813 = !DILocation(line: 714, column: 51, scope: !808)
!814 = !DILocation(line: 714, column: 24, scope: !808)
!815 = !DILocation(line: 714, column: 66, scope: !808)
!816 = !DILocation(line: 714, column: 12, scope: !808)
!817 = !DILocation(line: 715, column: 16, scope: !808)
!818 = !DILocation(line: 715, column: 25, scope: !808)
!819 = !DILocation(line: 715, column: 24, scope: !808)
!820 = !DILocation(line: 715, column: 41, scope: !808)
!821 = !DILocation(line: 715, column: 51, scope: !808)
!822 = !DILocation(line: 715, column: 50, scope: !808)
!823 = !DILocation(line: 715, column: 38, scope: !808)
!824 = !DILocation(line: 715, column: 13, scope: !808)
!825 = !DILocation(line: 716, column: 6, scope: !826)
!826 = distinct !DILexicalBlock(scope: !808, file: !74, line: 716, column: 6)
!827 = !DILocation(line: 716, column: 16, scope: !826)
!828 = !DILocation(line: 716, column: 6, scope: !808)
!829 = !DILocation(line: 718, column: 7, scope: !830)
!830 = distinct !DILexicalBlock(scope: !831, file: !74, line: 718, column: 7)
!831 = distinct !DILexicalBlock(scope: !826, file: !74, line: 717, column: 3)
!832 = !DILocation(line: 718, column: 17, scope: !830)
!833 = !DILocation(line: 718, column: 7, scope: !831)
!834 = !DILocation(line: 720, column: 17, scope: !835)
!835 = distinct !DILexicalBlock(scope: !830, file: !74, line: 719, column: 4)
!836 = !DILocation(line: 720, column: 12, scope: !835)
!837 = !DILocation(line: 720, column: 5, scope: !835)
!838 = !DILocation(line: 724, column: 5, scope: !839)
!839 = distinct !DILexicalBlock(scope: !830, file: !74, line: 723, column: 4)
!840 = !DILocation(line: 729, column: 4, scope: !841)
!841 = distinct !DILexicalBlock(scope: !826, file: !74, line: 728, column: 3)
!842 = !DILocation(line: 732, column: 1, scope: !777)
!843 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !74, file: !74, line: 751, type: !844, scopeLine: 752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!844 = !DISubroutineType(types: !845)
!845 = !{!18, !6, !18, !6}
!846 = !DILocalVariable(name: "factor1", arg: 1, scope: !843, file: !74, line: 751, type: !6)
!847 = !DILocation(line: 751, column: 33, scope: !843)
!848 = !DILocalVariable(name: "factor2", arg: 2, scope: !843, file: !74, line: 751, type: !18)
!849 = !DILocation(line: 751, column: 46, scope: !843)
!850 = !DILocalVariable(name: "denominator", arg: 3, scope: !843, file: !74, line: 751, type: !6)
!851 = !DILocation(line: 751, column: 59, scope: !843)
!852 = !DILocalVariable(name: "u32Result", scope: !843, file: !74, line: 753, type: !433)
!853 = !DILocation(line: 753, column: 6, scope: !843)
!854 = !DILocalVariable(name: "u32Temp1", scope: !843, file: !74, line: 753, type: !433)
!855 = !DILocation(line: 753, column: 21, scope: !843)
!856 = !DILocalVariable(name: "s32Result", scope: !843, file: !74, line: 754, type: !25)
!857 = !DILocation(line: 754, column: 6, scope: !843)
!858 = !DILocalVariable(name: "s32Temp1", scope: !843, file: !74, line: 754, type: !25)
!859 = !DILocation(line: 754, column: 21, scope: !843)
!860 = !DILocation(line: 755, column: 14, scope: !843)
!861 = !DILocation(line: 755, column: 24, scope: !843)
!862 = !DILocation(line: 755, column: 22, scope: !843)
!863 = !DILocation(line: 755, column: 12, scope: !843)
!864 = !DILocation(line: 757, column: 5, scope: !865)
!865 = distinct !DILexicalBlock(scope: !843, file: !74, line: 757, column: 5)
!866 = !DILocation(line: 757, column: 17, scope: !865)
!867 = !DILocation(line: 757, column: 5, scope: !843)
!868 = !DILocation(line: 759, column: 6, scope: !869)
!869 = distinct !DILexicalBlock(scope: !870, file: !74, line: 759, column: 6)
!870 = distinct !DILexicalBlock(scope: !865, file: !74, line: 758, column: 2)
!871 = !DILocation(line: 759, column: 16, scope: !869)
!872 = !DILocation(line: 759, column: 6, scope: !870)
!873 = !DILocation(line: 761, column: 4, scope: !874)
!874 = distinct !DILexicalBlock(scope: !869, file: !74, line: 760, column: 3)
!875 = !DILocation(line: 765, column: 4, scope: !876)
!876 = distinct !DILexicalBlock(scope: !869, file: !74, line: 764, column: 3)
!877 = !DILocation(line: 770, column: 15, scope: !878)
!878 = distinct !DILexicalBlock(scope: !865, file: !74, line: 769, column: 2)
!879 = !DILocation(line: 770, column: 29, scope: !878)
!880 = !DILocation(line: 770, column: 39, scope: !878)
!881 = !DILocation(line: 770, column: 38, scope: !878)
!882 = !DILocation(line: 770, column: 54, scope: !878)
!883 = !DILocation(line: 770, column: 52, scope: !878)
!884 = !DILocation(line: 770, column: 25, scope: !878)
!885 = !DILocation(line: 770, column: 68, scope: !878)
!886 = !DILocation(line: 770, column: 12, scope: !878)
!887 = !DILocation(line: 771, column: 16, scope: !878)
!888 = !DILocation(line: 771, column: 25, scope: !878)
!889 = !DILocation(line: 771, column: 24, scope: !878)
!890 = !DILocation(line: 771, column: 41, scope: !878)
!891 = !DILocation(line: 771, column: 51, scope: !878)
!892 = !DILocation(line: 771, column: 50, scope: !878)
!893 = !DILocation(line: 771, column: 38, scope: !878)
!894 = !DILocation(line: 771, column: 13, scope: !878)
!895 = !DILocation(line: 772, column: 6, scope: !896)
!896 = distinct !DILexicalBlock(scope: !878, file: !74, line: 772, column: 6)
!897 = !DILocation(line: 772, column: 16, scope: !896)
!898 = !DILocation(line: 772, column: 6, scope: !878)
!899 = !DILocation(line: 774, column: 7, scope: !900)
!900 = distinct !DILexicalBlock(scope: !901, file: !74, line: 774, column: 7)
!901 = distinct !DILexicalBlock(scope: !896, file: !74, line: 773, column: 3)
!902 = !DILocation(line: 774, column: 17, scope: !900)
!903 = !DILocation(line: 774, column: 7, scope: !901)
!904 = !DILocation(line: 776, column: 17, scope: !905)
!905 = distinct !DILexicalBlock(scope: !900, file: !74, line: 775, column: 4)
!906 = !DILocation(line: 776, column: 12, scope: !905)
!907 = !DILocation(line: 776, column: 5, scope: !905)
!908 = !DILocation(line: 780, column: 5, scope: !909)
!909 = distinct !DILexicalBlock(scope: !900, file: !74, line: 779, column: 4)
!910 = !DILocation(line: 785, column: 4, scope: !911)
!911 = distinct !DILexicalBlock(scope: !896, file: !74, line: 784, column: 3)
!912 = !DILocation(line: 788, column: 1, scope: !843)
!913 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !74, file: !74, line: 807, type: !914, scopeLine: 808, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!914 = !DISubroutineType(types: !915)
!915 = !{!18, !6, !18, !18}
!916 = !DILocalVariable(name: "factor1", arg: 1, scope: !913, file: !74, line: 807, type: !6)
!917 = !DILocation(line: 807, column: 33, scope: !913)
!918 = !DILocalVariable(name: "factor2", arg: 2, scope: !913, file: !74, line: 807, type: !18)
!919 = !DILocation(line: 807, column: 46, scope: !913)
!920 = !DILocalVariable(name: "denominator", arg: 3, scope: !913, file: !74, line: 807, type: !18)
!921 = !DILocation(line: 807, column: 59, scope: !913)
!922 = !DILocalVariable(name: "s32Result", scope: !913, file: !74, line: 809, type: !25)
!923 = !DILocation(line: 809, column: 6, scope: !913)
!924 = !DILocalVariable(name: "s32Temp1", scope: !913, file: !74, line: 809, type: !25)
!925 = !DILocation(line: 809, column: 21, scope: !913)
!926 = !DILocation(line: 810, column: 14, scope: !913)
!927 = !DILocation(line: 810, column: 24, scope: !913)
!928 = !DILocation(line: 810, column: 22, scope: !913)
!929 = !DILocation(line: 810, column: 12, scope: !913)
!930 = !DILocation(line: 812, column: 5, scope: !931)
!931 = distinct !DILexicalBlock(scope: !913, file: !74, line: 812, column: 5)
!932 = !DILocation(line: 812, column: 17, scope: !931)
!933 = !DILocation(line: 812, column: 5, scope: !913)
!934 = !DILocation(line: 814, column: 6, scope: !935)
!935 = distinct !DILexicalBlock(scope: !936, file: !74, line: 814, column: 6)
!936 = distinct !DILexicalBlock(scope: !931, file: !74, line: 813, column: 2)
!937 = !DILocation(line: 814, column: 16, scope: !935)
!938 = !DILocation(line: 814, column: 6, scope: !936)
!939 = !DILocation(line: 816, column: 4, scope: !940)
!940 = distinct !DILexicalBlock(scope: !935, file: !74, line: 815, column: 3)
!941 = !DILocation(line: 820, column: 4, scope: !942)
!942 = distinct !DILexicalBlock(scope: !935, file: !74, line: 819, column: 3)
!943 = !DILocation(line: 825, column: 15, scope: !944)
!944 = distinct !DILexicalBlock(scope: !931, file: !74, line: 824, column: 2)
!945 = !DILocation(line: 825, column: 29, scope: !944)
!946 = !DILocation(line: 825, column: 39, scope: !944)
!947 = !DILocation(line: 825, column: 38, scope: !944)
!948 = !DILocation(line: 825, column: 54, scope: !944)
!949 = !DILocation(line: 825, column: 52, scope: !944)
!950 = !DILocation(line: 825, column: 25, scope: !944)
!951 = !DILocation(line: 825, column: 68, scope: !944)
!952 = !DILocation(line: 825, column: 12, scope: !944)
!953 = !DILocation(line: 826, column: 16, scope: !944)
!954 = !DILocation(line: 826, column: 25, scope: !944)
!955 = !DILocation(line: 826, column: 24, scope: !944)
!956 = !DILocation(line: 826, column: 41, scope: !944)
!957 = !DILocation(line: 826, column: 51, scope: !944)
!958 = !DILocation(line: 826, column: 50, scope: !944)
!959 = !DILocation(line: 826, column: 38, scope: !944)
!960 = !DILocation(line: 826, column: 13, scope: !944)
!961 = !DILocation(line: 827, column: 6, scope: !962)
!962 = distinct !DILexicalBlock(scope: !944, file: !74, line: 827, column: 6)
!963 = !DILocation(line: 827, column: 16, scope: !962)
!964 = !DILocation(line: 827, column: 6, scope: !944)
!965 = !DILocation(line: 829, column: 7, scope: !966)
!966 = distinct !DILexicalBlock(scope: !967, file: !74, line: 829, column: 7)
!967 = distinct !DILexicalBlock(scope: !962, file: !74, line: 828, column: 3)
!968 = !DILocation(line: 829, column: 17, scope: !966)
!969 = !DILocation(line: 829, column: 7, scope: !967)
!970 = !DILocation(line: 831, column: 17, scope: !971)
!971 = distinct !DILexicalBlock(scope: !966, file: !74, line: 830, column: 4)
!972 = !DILocation(line: 831, column: 12, scope: !971)
!973 = !DILocation(line: 831, column: 5, scope: !971)
!974 = !DILocation(line: 835, column: 5, scope: !975)
!975 = distinct !DILexicalBlock(scope: !966, file: !74, line: 834, column: 4)
!976 = !DILocation(line: 840, column: 4, scope: !977)
!977 = distinct !DILexicalBlock(scope: !962, file: !74, line: 839, column: 3)
!978 = !DILocation(line: 844, column: 1, scope: !913)
!979 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 862, type: !980, scopeLine: 863, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!980 = !DISubroutineType(types: !981)
!981 = !{!18, !18, !18, !18}
!982 = !DILocalVariable(name: "factor1", arg: 1, scope: !979, file: !74, line: 862, type: !18)
!983 = !DILocation(line: 862, column: 33, scope: !979)
!984 = !DILocalVariable(name: "factor2", arg: 2, scope: !979, file: !74, line: 862, type: !18)
!985 = !DILocation(line: 862, column: 46, scope: !979)
!986 = !DILocalVariable(name: "denominator", arg: 3, scope: !979, file: !74, line: 862, type: !18)
!987 = !DILocation(line: 862, column: 59, scope: !979)
!988 = !DILocalVariable(name: "u32Temp1", scope: !979, file: !74, line: 864, type: !433)
!989 = !DILocation(line: 864, column: 6, scope: !979)
!990 = !DILocalVariable(name: "u16TempDenom", scope: !979, file: !74, line: 865, type: !18)
!991 = !DILocation(line: 865, column: 6, scope: !979)
!992 = !DILocation(line: 867, column: 5, scope: !993)
!993 = distinct !DILexicalBlock(scope: !979, file: !74, line: 867, column: 5)
!994 = !DILocation(line: 867, column: 17, scope: !993)
!995 = !DILocation(line: 867, column: 5, scope: !979)
!996 = !DILocation(line: 869, column: 3, scope: !997)
!997 = distinct !DILexicalBlock(scope: !993, file: !74, line: 868, column: 2)
!998 = !DILocation(line: 873, column: 14, scope: !999)
!999 = distinct !DILexicalBlock(scope: !993, file: !74, line: 872, column: 2)
!1000 = !DILocation(line: 873, column: 24, scope: !999)
!1001 = !DILocation(line: 873, column: 22, scope: !999)
!1002 = !DILocation(line: 873, column: 12, scope: !999)
!1003 = !DILocation(line: 874, column: 18, scope: !999)
!1004 = !DILocation(line: 874, column: 30, scope: !999)
!1005 = !DILocation(line: 874, column: 16, scope: !999)
!1006 = !DILocation(line: 875, column: 14, scope: !999)
!1007 = !DILocation(line: 875, column: 25, scope: !999)
!1008 = !DILocation(line: 875, column: 23, scope: !999)
!1009 = !DILocation(line: 875, column: 12, scope: !999)
!1010 = !DILocation(line: 876, column: 14, scope: !999)
!1011 = !DILocation(line: 876, column: 25, scope: !999)
!1012 = !DILocation(line: 876, column: 23, scope: !999)
!1013 = !DILocation(line: 876, column: 12, scope: !999)
!1014 = !DILocation(line: 877, column: 6, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !999, file: !74, line: 877, column: 6)
!1016 = !DILocation(line: 877, column: 15, scope: !1015)
!1017 = !DILocation(line: 877, column: 6, scope: !999)
!1018 = !DILocation(line: 879, column: 12, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1015, file: !74, line: 878, column: 3)
!1020 = !DILocation(line: 879, column: 21, scope: !1019)
!1021 = !DILocation(line: 879, column: 11, scope: !1019)
!1022 = !DILocation(line: 879, column: 4, scope: !1019)
!1023 = !DILocation(line: 884, column: 4, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1015, file: !74, line: 883, column: 3)
!1025 = !DILocation(line: 889, column: 1, scope: !979)
!1026 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 906, type: !1027, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!18, !18, !18, !433}
!1029 = !DILocalVariable(name: "factor1", arg: 1, scope: !1026, file: !74, line: 906, type: !18)
!1030 = !DILocation(line: 906, column: 33, scope: !1026)
!1031 = !DILocalVariable(name: "factor2", arg: 2, scope: !1026, file: !74, line: 906, type: !18)
!1032 = !DILocation(line: 906, column: 46, scope: !1026)
!1033 = !DILocalVariable(name: "denominator", arg: 3, scope: !1026, file: !74, line: 906, type: !433)
!1034 = !DILocation(line: 906, column: 59, scope: !1026)
!1035 = !DILocalVariable(name: "u32Temp1", scope: !1026, file: !74, line: 908, type: !433)
!1036 = !DILocation(line: 908, column: 6, scope: !1026)
!1037 = !DILocation(line: 909, column: 5, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1026, file: !74, line: 909, column: 5)
!1039 = !DILocation(line: 909, column: 17, scope: !1038)
!1040 = !DILocation(line: 909, column: 5, scope: !1026)
!1041 = !DILocation(line: 911, column: 3, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1038, file: !74, line: 910, column: 2)
!1043 = !DILocation(line: 915, column: 15, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1038, file: !74, line: 914, column: 2)
!1045 = !DILocation(line: 915, column: 25, scope: !1044)
!1046 = !DILocation(line: 915, column: 23, scope: !1044)
!1047 = !DILocation(line: 915, column: 36, scope: !1044)
!1048 = !DILocation(line: 915, column: 34, scope: !1044)
!1049 = !DILocation(line: 915, column: 12, scope: !1044)
!1050 = !DILocation(line: 916, column: 8, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1044, file: !74, line: 916, column: 6)
!1052 = !DILocation(line: 916, column: 18, scope: !1051)
!1053 = !DILocation(line: 916, column: 16, scope: !1051)
!1054 = !DILocation(line: 916, column: 28, scope: !1051)
!1055 = !DILocation(line: 916, column: 40, scope: !1051)
!1056 = !DILocation(line: 916, column: 39, scope: !1051)
!1057 = !DILocation(line: 916, column: 26, scope: !1051)
!1058 = !DILocation(line: 916, column: 53, scope: !1051)
!1059 = !DILocation(line: 916, column: 64, scope: !1051)
!1060 = !DILocation(line: 916, column: 50, scope: !1051)
!1061 = !DILocation(line: 916, column: 6, scope: !1044)
!1062 = !DILocation(line: 918, column: 12, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1051, file: !74, line: 917, column: 3)
!1064 = !DILocation(line: 919, column: 3, scope: !1063)
!1065 = !DILocation(line: 920, column: 6, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1044, file: !74, line: 920, column: 6)
!1067 = !DILocation(line: 920, column: 15, scope: !1066)
!1068 = !DILocation(line: 920, column: 6, scope: !1044)
!1069 = !DILocation(line: 922, column: 12, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1066, file: !74, line: 921, column: 3)
!1071 = !DILocation(line: 922, column: 21, scope: !1070)
!1072 = !DILocation(line: 922, column: 11, scope: !1070)
!1073 = !DILocation(line: 922, column: 4, scope: !1070)
!1074 = !DILocation(line: 926, column: 4, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1066, file: !74, line: 925, column: 3)
!1076 = !DILocation(line: 929, column: 1, scope: !1026)
!1077 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 946, type: !1078, scopeLine: 947, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!433, !433, !18}
!1080 = !DILocalVariable(name: "x_value", arg: 1, scope: !1077, file: !74, line: 946, type: !433)
!1081 = !DILocation(line: 946, column: 25, scope: !1077)
!1082 = !DILocalVariable(name: "y_value", arg: 2, scope: !1077, file: !74, line: 946, type: !18)
!1083 = !DILocation(line: 946, column: 38, scope: !1077)
!1084 = !DILocalVariable(name: "u32Temp1", scope: !1077, file: !74, line: 948, type: !433)
!1085 = !DILocation(line: 948, column: 6, scope: !1077)
!1086 = !DILocation(line: 949, column: 5, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1077, file: !74, line: 949, column: 5)
!1088 = !DILocation(line: 949, column: 13, scope: !1087)
!1089 = !DILocation(line: 949, column: 5, scope: !1077)
!1090 = !DILocation(line: 951, column: 3, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1087, file: !74, line: 950, column: 2)
!1092 = !DILocation(line: 955, column: 15, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1087, file: !74, line: 954, column: 2)
!1094 = !DILocation(line: 955, column: 26, scope: !1093)
!1095 = !DILocation(line: 955, column: 34, scope: !1093)
!1096 = !DILocation(line: 955, column: 33, scope: !1093)
!1097 = !DILocation(line: 955, column: 45, scope: !1093)
!1098 = !DILocation(line: 955, column: 43, scope: !1093)
!1099 = !DILocation(line: 955, column: 23, scope: !1093)
!1100 = !DILocation(line: 955, column: 54, scope: !1093)
!1101 = !DILocation(line: 955, column: 12, scope: !1093)
!1102 = !DILocation(line: 956, column: 15, scope: !1093)
!1103 = !DILocation(line: 956, column: 23, scope: !1093)
!1104 = !DILocation(line: 956, column: 22, scope: !1093)
!1105 = !DILocation(line: 956, column: 35, scope: !1093)
!1106 = !DILocation(line: 956, column: 44, scope: !1093)
!1107 = !DILocation(line: 956, column: 43, scope: !1093)
!1108 = !DILocation(line: 956, column: 32, scope: !1093)
!1109 = !DILocation(line: 956, column: 12, scope: !1093)
!1110 = !DILocation(line: 957, column: 10, scope: !1093)
!1111 = !DILocation(line: 957, column: 3, scope: !1093)
!1112 = !DILocation(line: 959, column: 1, scope: !1077)
!1113 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 977, type: !1114, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!6, !6, !6, !6}
!1116 = !DILocalVariable(name: "fak1", arg: 1, scope: !1113, file: !74, line: 977, type: !6)
!1117 = !DILocation(line: 977, column: 33, scope: !1113)
!1118 = !DILocalVariable(name: "fak2", arg: 2, scope: !1113, file: !74, line: 977, type: !6)
!1119 = !DILocation(line: 977, column: 43, scope: !1113)
!1120 = !DILocalVariable(name: "div", arg: 3, scope: !1113, file: !74, line: 977, type: !6)
!1121 = !DILocation(line: 977, column: 53, scope: !1113)
!1122 = !DILocalVariable(name: "s32Temp1", scope: !1113, file: !74, line: 979, type: !25)
!1123 = !DILocation(line: 979, column: 6, scope: !1113)
!1124 = !DILocalVariable(name: "s32Temp2", scope: !1113, file: !74, line: 979, type: !25)
!1125 = !DILocation(line: 979, column: 20, scope: !1113)
!1126 = !DILocalVariable(name: "s32Temp3", scope: !1113, file: !74, line: 979, type: !25)
!1127 = !DILocation(line: 979, column: 34, scope: !1113)
!1128 = !DILocation(line: 980, column: 13, scope: !1113)
!1129 = !DILocation(line: 980, column: 20, scope: !1113)
!1130 = !DILocation(line: 980, column: 18, scope: !1113)
!1131 = !DILocation(line: 980, column: 11, scope: !1113)
!1132 = !DILocation(line: 981, column: 5, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1113, file: !74, line: 981, column: 5)
!1134 = !DILocation(line: 981, column: 9, scope: !1133)
!1135 = !DILocation(line: 981, column: 5, scope: !1113)
!1136 = !DILocation(line: 983, column: 6, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1138, file: !74, line: 983, column: 6)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !74, line: 982, column: 2)
!1139 = !DILocation(line: 983, column: 15, scope: !1137)
!1140 = !DILocation(line: 983, column: 6, scope: !1138)
!1141 = !DILocation(line: 985, column: 4, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1137, file: !74, line: 984, column: 3)
!1143 = !DILocation(line: 989, column: 4, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1137, file: !74, line: 988, column: 3)
!1145 = !DILocation(line: 994, column: 15, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1133, file: !74, line: 993, column: 2)
!1147 = !DILocation(line: 994, column: 28, scope: !1146)
!1148 = !DILocation(line: 994, column: 39, scope: !1146)
!1149 = !DILocation(line: 994, column: 37, scope: !1146)
!1150 = !DILocation(line: 994, column: 46, scope: !1146)
!1151 = !DILocation(line: 994, column: 44, scope: !1146)
!1152 = !DILocation(line: 994, column: 24, scope: !1146)
!1153 = !DILocation(line: 994, column: 52, scope: !1146)
!1154 = !DILocation(line: 994, column: 12, scope: !1146)
!1155 = !DILocation(line: 995, column: 15, scope: !1146)
!1156 = !DILocation(line: 995, column: 24, scope: !1146)
!1157 = !DILocation(line: 995, column: 23, scope: !1146)
!1158 = !DILocation(line: 995, column: 32, scope: !1146)
!1159 = !DILocation(line: 995, column: 41, scope: !1146)
!1160 = !DILocation(line: 995, column: 40, scope: !1146)
!1161 = !DILocation(line: 995, column: 29, scope: !1146)
!1162 = !DILocation(line: 995, column: 12, scope: !1146)
!1163 = !DILocation(line: 996, column: 6, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1146, file: !74, line: 996, column: 6)
!1165 = !DILocation(line: 996, column: 15, scope: !1164)
!1166 = !DILocation(line: 996, column: 6, scope: !1146)
!1167 = !DILocation(line: 998, column: 7, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1169, file: !74, line: 998, column: 7)
!1169 = distinct !DILexicalBlock(scope: !1164, file: !74, line: 997, column: 3)
!1170 = !DILocation(line: 998, column: 16, scope: !1168)
!1171 = !DILocation(line: 998, column: 7, scope: !1169)
!1172 = !DILocation(line: 1000, column: 17, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1168, file: !74, line: 999, column: 4)
!1174 = !DILocation(line: 1000, column: 12, scope: !1173)
!1175 = !DILocation(line: 1000, column: 5, scope: !1173)
!1176 = !DILocation(line: 1004, column: 5, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1168, file: !74, line: 1003, column: 4)
!1178 = !DILocation(line: 1009, column: 4, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1164, file: !74, line: 1008, column: 3)
!1180 = !DILocation(line: 1012, column: 1, scope: !1113)
!1181 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1030, type: !1182, scopeLine: 1031, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1182 = !DISubroutineType(types: !1183)
!1183 = !{!6, !6, !6, !18}
!1184 = !DILocalVariable(name: "data1", arg: 1, scope: !1181, file: !74, line: 1030, type: !6)
!1185 = !DILocation(line: 1030, column: 33, scope: !1181)
!1186 = !DILocalVariable(name: "data2", arg: 2, scope: !1181, file: !74, line: 1030, type: !6)
!1187 = !DILocation(line: 1030, column: 43, scope: !1181)
!1188 = !DILocalVariable(name: "denominator", arg: 3, scope: !1181, file: !74, line: 1030, type: !18)
!1189 = !DILocation(line: 1030, column: 53, scope: !1181)
!1190 = !DILocalVariable(name: "s32Result", scope: !1181, file: !74, line: 1032, type: !25)
!1191 = !DILocation(line: 1032, column: 6, scope: !1181)
!1192 = !DILocalVariable(name: "s32Temp1", scope: !1181, file: !74, line: 1032, type: !25)
!1193 = !DILocation(line: 1032, column: 21, scope: !1181)
!1194 = !DILocation(line: 1033, column: 14, scope: !1181)
!1195 = !DILocation(line: 1033, column: 22, scope: !1181)
!1196 = !DILocation(line: 1033, column: 20, scope: !1181)
!1197 = !DILocation(line: 1033, column: 12, scope: !1181)
!1198 = !DILocation(line: 1035, column: 5, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1181, file: !74, line: 1035, column: 5)
!1200 = !DILocation(line: 1035, column: 17, scope: !1199)
!1201 = !DILocation(line: 1035, column: 5, scope: !1181)
!1202 = !DILocation(line: 1037, column: 6, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1204, file: !74, line: 1037, column: 6)
!1204 = distinct !DILexicalBlock(scope: !1199, file: !74, line: 1036, column: 2)
!1205 = !DILocation(line: 1037, column: 16, scope: !1203)
!1206 = !DILocation(line: 1037, column: 6, scope: !1204)
!1207 = !DILocation(line: 1039, column: 4, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1203, file: !74, line: 1038, column: 3)
!1209 = !DILocation(line: 1041, column: 11, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1203, file: !74, line: 1041, column: 11)
!1211 = !DILocation(line: 1041, column: 21, scope: !1210)
!1212 = !DILocation(line: 1041, column: 11, scope: !1203)
!1213 = !DILocation(line: 1043, column: 4, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1210, file: !74, line: 1042, column: 3)
!1215 = !DILocation(line: 1047, column: 4, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1210, file: !74, line: 1046, column: 3)
!1217 = !DILocation(line: 1052, column: 15, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1199, file: !74, line: 1051, column: 2)
!1219 = !DILocation(line: 1052, column: 28, scope: !1218)
!1220 = !DILocation(line: 1052, column: 38, scope: !1218)
!1221 = !DILocation(line: 1052, column: 37, scope: !1218)
!1222 = !DILocation(line: 1052, column: 51, scope: !1218)
!1223 = !DILocation(line: 1052, column: 50, scope: !1218)
!1224 = !DILocation(line: 1052, column: 25, scope: !1218)
!1225 = !DILocation(line: 1052, column: 64, scope: !1218)
!1226 = !DILocation(line: 1052, column: 12, scope: !1218)
!1227 = !DILocation(line: 1053, column: 16, scope: !1218)
!1228 = !DILocation(line: 1053, column: 25, scope: !1218)
!1229 = !DILocation(line: 1053, column: 24, scope: !1218)
!1230 = !DILocation(line: 1053, column: 41, scope: !1218)
!1231 = !DILocation(line: 1053, column: 51, scope: !1218)
!1232 = !DILocation(line: 1053, column: 50, scope: !1218)
!1233 = !DILocation(line: 1053, column: 38, scope: !1218)
!1234 = !DILocation(line: 1053, column: 13, scope: !1218)
!1235 = !DILocation(line: 1054, column: 6, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1218, file: !74, line: 1054, column: 6)
!1237 = !DILocation(line: 1054, column: 16, scope: !1236)
!1238 = !DILocation(line: 1054, column: 6, scope: !1218)
!1239 = !DILocation(line: 1056, column: 7, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1241, file: !74, line: 1056, column: 7)
!1241 = distinct !DILexicalBlock(scope: !1236, file: !74, line: 1055, column: 3)
!1242 = !DILocation(line: 1056, column: 17, scope: !1240)
!1243 = !DILocation(line: 1056, column: 7, scope: !1241)
!1244 = !DILocation(line: 1058, column: 17, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1240, file: !74, line: 1057, column: 4)
!1246 = !DILocation(line: 1058, column: 12, scope: !1245)
!1247 = !DILocation(line: 1058, column: 5, scope: !1245)
!1248 = !DILocation(line: 1062, column: 5, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1240, file: !74, line: 1061, column: 4)
!1250 = !DILocation(line: 1067, column: 4, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1236, file: !74, line: 1066, column: 3)
!1252 = !DILocation(line: 1071, column: 1, scope: !1181)
!1253 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1088, type: !1254, scopeLine: 1089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!433, !433, !25}
!1256 = !DILocalVariable(name: "numerator", arg: 1, scope: !1253, file: !74, line: 1088, type: !433)
!1257 = !DILocation(line: 1088, column: 25, scope: !1253)
!1258 = !DILocalVariable(name: "denominator", arg: 2, scope: !1253, file: !74, line: 1088, type: !25)
!1259 = !DILocation(line: 1088, column: 40, scope: !1253)
!1260 = !DILocalVariable(name: "u32Temp1", scope: !1253, file: !74, line: 1090, type: !433)
!1261 = !DILocation(line: 1090, column: 6, scope: !1253)
!1262 = !DILocation(line: 1091, column: 5, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1253, file: !74, line: 1091, column: 5)
!1264 = !DILocation(line: 1091, column: 17, scope: !1263)
!1265 = !DILocation(line: 1091, column: 5, scope: !1253)
!1266 = !DILocation(line: 1093, column: 3, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1263, file: !74, line: 1092, column: 2)
!1268 = !DILocation(line: 1097, column: 6, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1270, file: !74, line: 1097, column: 6)
!1270 = distinct !DILexicalBlock(scope: !1263, file: !74, line: 1096, column: 2)
!1271 = !DILocation(line: 1097, column: 18, scope: !1269)
!1272 = !DILocation(line: 1097, column: 6, scope: !1270)
!1273 = !DILocation(line: 1099, column: 4, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1269, file: !74, line: 1098, column: 3)
!1275 = !DILocation(line: 1103, column: 16, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1269, file: !74, line: 1102, column: 3)
!1277 = !DILocation(line: 1103, column: 30, scope: !1276)
!1278 = !DILocation(line: 1103, column: 40, scope: !1276)
!1279 = !DILocation(line: 1103, column: 39, scope: !1276)
!1280 = !DILocation(line: 1103, column: 55, scope: !1276)
!1281 = !DILocation(line: 1103, column: 53, scope: !1276)
!1282 = !DILocation(line: 1103, column: 26, scope: !1276)
!1283 = !DILocation(line: 1103, column: 68, scope: !1276)
!1284 = !DILocation(line: 1103, column: 13, scope: !1276)
!1285 = !DILocation(line: 1104, column: 16, scope: !1276)
!1286 = !DILocation(line: 1104, column: 25, scope: !1276)
!1287 = !DILocation(line: 1104, column: 24, scope: !1276)
!1288 = !DILocation(line: 1104, column: 41, scope: !1276)
!1289 = !DILocation(line: 1104, column: 51, scope: !1276)
!1290 = !DILocation(line: 1104, column: 50, scope: !1276)
!1291 = !DILocation(line: 1104, column: 38, scope: !1276)
!1292 = !DILocation(line: 1104, column: 13, scope: !1276)
!1293 = !DILocation(line: 1105, column: 11, scope: !1276)
!1294 = !DILocation(line: 1105, column: 4, scope: !1276)
!1295 = !DILocation(line: 1108, column: 1, scope: !1253)
!1296 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1125, type: !1297, scopeLine: 1126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1297 = !DISubroutineType(types: !1298)
!1298 = !{!433, !25, !433}
!1299 = !DILocalVariable(name: "numerator", arg: 1, scope: !1296, file: !74, line: 1125, type: !25)
!1300 = !DILocation(line: 1125, column: 25, scope: !1296)
!1301 = !DILocalVariable(name: "denominator", arg: 2, scope: !1296, file: !74, line: 1125, type: !433)
!1302 = !DILocation(line: 1125, column: 40, scope: !1296)
!1303 = !DILocalVariable(name: "s32Temp1", scope: !1296, file: !74, line: 1127, type: !25)
!1304 = !DILocation(line: 1127, column: 6, scope: !1296)
!1305 = !DILocation(line: 1128, column: 5, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1296, file: !74, line: 1128, column: 5)
!1307 = !DILocation(line: 1128, column: 17, scope: !1306)
!1308 = !DILocation(line: 1128, column: 5, scope: !1296)
!1309 = !DILocation(line: 1130, column: 6, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1311, file: !74, line: 1130, column: 6)
!1311 = distinct !DILexicalBlock(scope: !1306, file: !74, line: 1129, column: 2)
!1312 = !DILocation(line: 1130, column: 16, scope: !1310)
!1313 = !DILocation(line: 1130, column: 6, scope: !1311)
!1314 = !DILocation(line: 1132, column: 4, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1310, file: !74, line: 1131, column: 3)
!1316 = !DILocation(line: 1136, column: 4, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1310, file: !74, line: 1135, column: 3)
!1318 = !DILocation(line: 1141, column: 6, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1320, file: !74, line: 1141, column: 6)
!1320 = distinct !DILexicalBlock(scope: !1306, file: !74, line: 1140, column: 2)
!1321 = !DILocation(line: 1141, column: 16, scope: !1319)
!1322 = !DILocation(line: 1141, column: 6, scope: !1320)
!1323 = !DILocation(line: 1143, column: 17, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1319, file: !74, line: 1142, column: 3)
!1325 = !DILocation(line: 1143, column: 31, scope: !1324)
!1326 = !DILocation(line: 1143, column: 41, scope: !1324)
!1327 = !DILocation(line: 1143, column: 40, scope: !1324)
!1328 = !DILocation(line: 1143, column: 56, scope: !1324)
!1329 = !DILocation(line: 1143, column: 54, scope: !1324)
!1330 = !DILocation(line: 1143, column: 27, scope: !1324)
!1331 = !DILocation(line: 1143, column: 69, scope: !1324)
!1332 = !DILocation(line: 1143, column: 13, scope: !1324)
!1333 = !DILocation(line: 1144, column: 13, scope: !1324)
!1334 = !DILocation(line: 1144, column: 23, scope: !1324)
!1335 = !DILocation(line: 1144, column: 22, scope: !1324)
!1336 = !DILocation(line: 1144, column: 39, scope: !1324)
!1337 = !DILocation(line: 1144, column: 48, scope: !1324)
!1338 = !DILocation(line: 1144, column: 47, scope: !1324)
!1339 = !DILocation(line: 1144, column: 36, scope: !1324)
!1340 = !DILocation(line: 1144, column: 4, scope: !1324)
!1341 = !DILocation(line: 1148, column: 4, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1319, file: !74, line: 1147, column: 3)
!1343 = !DILocation(line: 1151, column: 1, scope: !1296)
!1344 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1168, type: !1345, scopeLine: 1169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!433, !25, !25}
!1347 = !DILocalVariable(name: "numerator", arg: 1, scope: !1344, file: !74, line: 1168, type: !25)
!1348 = !DILocation(line: 1168, column: 25, scope: !1344)
!1349 = !DILocalVariable(name: "denominator", arg: 2, scope: !1344, file: !74, line: 1168, type: !25)
!1350 = !DILocation(line: 1168, column: 40, scope: !1344)
!1351 = !DILocalVariable(name: "u32Temp1", scope: !1344, file: !74, line: 1170, type: !433)
!1352 = !DILocation(line: 1170, column: 6, scope: !1344)
!1353 = !DILocalVariable(name: "u32Temp2", scope: !1344, file: !74, line: 1170, type: !433)
!1354 = !DILocation(line: 1170, column: 20, scope: !1344)
!1355 = !DILocation(line: 1171, column: 5, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1344, file: !74, line: 1171, column: 5)
!1357 = !DILocation(line: 1171, column: 17, scope: !1356)
!1358 = !DILocation(line: 1171, column: 5, scope: !1344)
!1359 = !DILocation(line: 1173, column: 6, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1361, file: !74, line: 1173, column: 6)
!1361 = distinct !DILexicalBlock(scope: !1356, file: !74, line: 1172, column: 2)
!1362 = !DILocation(line: 1173, column: 16, scope: !1360)
!1363 = !DILocation(line: 1173, column: 6, scope: !1361)
!1364 = !DILocation(line: 1175, column: 4, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1360, file: !74, line: 1174, column: 3)
!1366 = !DILocation(line: 1179, column: 4, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1360, file: !74, line: 1178, column: 3)
!1368 = !DILocation(line: 1184, column: 6, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1370, file: !74, line: 1184, column: 6)
!1370 = distinct !DILexicalBlock(scope: !1356, file: !74, line: 1183, column: 2)
!1371 = !DILocation(line: 1184, column: 16, scope: !1369)
!1372 = !DILocation(line: 1184, column: 6, scope: !1370)
!1373 = !DILocation(line: 1186, column: 7, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1375, file: !74, line: 1186, column: 7)
!1375 = distinct !DILexicalBlock(scope: !1369, file: !74, line: 1185, column: 3)
!1376 = !DILocation(line: 1186, column: 17, scope: !1374)
!1377 = !DILocation(line: 1186, column: 7, scope: !1375)
!1378 = !DILocation(line: 1188, column: 5, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !74, line: 1187, column: 4)
!1380 = !DILocation(line: 1192, column: 8, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !74, line: 1192, column: 8)
!1382 = distinct !DILexicalBlock(scope: !1374, file: !74, line: 1191, column: 4)
!1383 = !DILocation(line: 1192, column: 20, scope: !1381)
!1384 = !DILocation(line: 1192, column: 8, scope: !1382)
!1385 = !DILocation(line: 1194, column: 6, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1381, file: !74, line: 1193, column: 5)
!1387 = !DILocation(line: 1198, column: 18, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1381, file: !74, line: 1197, column: 5)
!1389 = !DILocation(line: 1198, column: 32, scope: !1388)
!1390 = !DILocation(line: 1198, column: 42, scope: !1388)
!1391 = !DILocation(line: 1198, column: 41, scope: !1388)
!1392 = !DILocation(line: 1198, column: 57, scope: !1388)
!1393 = !DILocation(line: 1198, column: 55, scope: !1388)
!1394 = !DILocation(line: 1198, column: 28, scope: !1388)
!1395 = !DILocation(line: 1198, column: 71, scope: !1388)
!1396 = !DILocation(line: 1198, column: 15, scope: !1388)
!1397 = !DILocation(line: 1199, column: 18, scope: !1388)
!1398 = !DILocation(line: 1199, column: 29, scope: !1388)
!1399 = !DILocation(line: 1199, column: 27, scope: !1388)
!1400 = !DILocation(line: 1199, column: 45, scope: !1388)
!1401 = !DILocation(line: 1199, column: 57, scope: !1388)
!1402 = !DILocation(line: 1199, column: 55, scope: !1388)
!1403 = !DILocation(line: 1199, column: 42, scope: !1388)
!1404 = !DILocation(line: 1199, column: 15, scope: !1388)
!1405 = !DILocation(line: 1200, column: 13, scope: !1388)
!1406 = !DILocation(line: 1200, column: 6, scope: !1388)
!1407 = !DILocation(line: 1206, column: 7, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1409, file: !74, line: 1206, column: 7)
!1409 = distinct !DILexicalBlock(scope: !1369, file: !74, line: 1205, column: 3)
!1410 = !DILocation(line: 1206, column: 19, scope: !1408)
!1411 = !DILocation(line: 1206, column: 7, scope: !1409)
!1412 = !DILocation(line: 1208, column: 5, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1408, file: !74, line: 1207, column: 4)
!1414 = !DILocation(line: 1212, column: 18, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1408, file: !74, line: 1211, column: 4)
!1416 = !DILocation(line: 1212, column: 17, scope: !1415)
!1417 = !DILocation(line: 1212, column: 15, scope: !1415)
!1418 = !DILocation(line: 1213, column: 20, scope: !1415)
!1419 = !DILocation(line: 1213, column: 19, scope: !1415)
!1420 = !DILocation(line: 1213, column: 17, scope: !1415)
!1421 = !DILocation(line: 1214, column: 17, scope: !1415)
!1422 = !DILocation(line: 1214, column: 31, scope: !1415)
!1423 = !DILocation(line: 1214, column: 41, scope: !1415)
!1424 = !DILocation(line: 1214, column: 40, scope: !1415)
!1425 = !DILocation(line: 1214, column: 56, scope: !1415)
!1426 = !DILocation(line: 1214, column: 54, scope: !1415)
!1427 = !DILocation(line: 1214, column: 27, scope: !1415)
!1428 = !DILocation(line: 1214, column: 70, scope: !1415)
!1429 = !DILocation(line: 1214, column: 14, scope: !1415)
!1430 = !DILocation(line: 1215, column: 17, scope: !1415)
!1431 = !DILocation(line: 1215, column: 28, scope: !1415)
!1432 = !DILocation(line: 1215, column: 26, scope: !1415)
!1433 = !DILocation(line: 1215, column: 44, scope: !1415)
!1434 = !DILocation(line: 1215, column: 56, scope: !1415)
!1435 = !DILocation(line: 1215, column: 54, scope: !1415)
!1436 = !DILocation(line: 1215, column: 41, scope: !1415)
!1437 = !DILocation(line: 1215, column: 14, scope: !1415)
!1438 = !DILocation(line: 1216, column: 12, scope: !1415)
!1439 = !DILocation(line: 1216, column: 5, scope: !1415)
!1440 = !DILocation(line: 1221, column: 1, scope: !1344)
!1441 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1238, type: !1442, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{!433, !433, !433}
!1444 = !DILocalVariable(name: "numerator", arg: 1, scope: !1441, file: !74, line: 1238, type: !433)
!1445 = !DILocation(line: 1238, column: 25, scope: !1441)
!1446 = !DILocalVariable(name: "denominator", arg: 2, scope: !1441, file: !74, line: 1238, type: !433)
!1447 = !DILocation(line: 1238, column: 40, scope: !1441)
!1448 = !DILocalVariable(name: "u32Temp1", scope: !1441, file: !74, line: 1241, type: !433)
!1449 = !DILocation(line: 1241, column: 6, scope: !1441)
!1450 = !DILocalVariable(name: "u32Temp2", scope: !1441, file: !74, line: 1241, type: !433)
!1451 = !DILocation(line: 1241, column: 20, scope: !1441)
!1452 = !DILocalVariable(name: "u32Temp3", scope: !1441, file: !74, line: 1241, type: !433)
!1453 = !DILocation(line: 1241, column: 34, scope: !1441)
!1454 = !DILocalVariable(name: "numerator_old", scope: !1441, file: !74, line: 1241, type: !433)
!1455 = !DILocation(line: 1241, column: 48, scope: !1441)
!1456 = !DILocation(line: 1242, column: 5, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1441, file: !74, line: 1242, column: 5)
!1458 = !DILocation(line: 1242, column: 16, scope: !1457)
!1459 = !DILocation(line: 1242, column: 5, scope: !1441)
!1460 = !DILocation(line: 1244, column: 3, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1457, file: !74, line: 1243, column: 2)
!1462 = !DILocation(line: 1248, column: 14, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1457, file: !74, line: 1247, column: 2)
!1464 = !DILocation(line: 1248, column: 26, scope: !1463)
!1465 = !DILocation(line: 1248, column: 41, scope: !1463)
!1466 = !DILocation(line: 1248, column: 51, scope: !1463)
!1467 = !DILocation(line: 1248, column: 50, scope: !1463)
!1468 = !DILocation(line: 1248, column: 38, scope: !1463)
!1469 = !DILocation(line: 1248, column: 24, scope: !1463)
!1470 = !DILocation(line: 1248, column: 12, scope: !1463)
!1471 = !DILocation(line: 1249, column: 7, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1463, file: !74, line: 1249, column: 6)
!1473 = !DILocation(line: 1249, column: 16, scope: !1472)
!1474 = !DILocation(line: 1249, column: 24, scope: !1472)
!1475 = !DILocation(line: 1249, column: 6, scope: !1463)
!1476 = !DILocation(line: 1251, column: 16, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1472, file: !74, line: 1250, column: 3)
!1478 = !DILocation(line: 1251, column: 27, scope: !1477)
!1479 = !DILocation(line: 1251, column: 13, scope: !1477)
!1480 = !DILocation(line: 1252, column: 3, scope: !1477)
!1481 = !DILocation(line: 1255, column: 16, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1472, file: !74, line: 1254, column: 3)
!1483 = !DILocation(line: 1255, column: 27, scope: !1482)
!1484 = !DILocation(line: 1255, column: 32, scope: !1482)
!1485 = !DILocation(line: 1255, column: 13, scope: !1482)
!1486 = !DILocation(line: 1258, column: 6, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1463, file: !74, line: 1258, column: 6)
!1488 = !DILocation(line: 1258, column: 17, scope: !1487)
!1489 = !DILocation(line: 1258, column: 15, scope: !1487)
!1490 = !DILocation(line: 1258, column: 6, scope: !1463)
!1491 = !DILocation(line: 1260, column: 12, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1487, file: !74, line: 1259, column: 3)
!1493 = !DILocation(line: 1260, column: 22, scope: !1492)
!1494 = !DILocation(line: 1260, column: 21, scope: !1492)
!1495 = !DILocation(line: 1260, column: 4, scope: !1492)
!1496 = !DILocation(line: 1264, column: 13, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1487, file: !74, line: 1263, column: 3)
!1498 = !DILocation(line: 1264, column: 23, scope: !1497)
!1499 = !DILocation(line: 1264, column: 22, scope: !1497)
!1500 = !DILocation(line: 1264, column: 36, scope: !1497)
!1501 = !DILocation(line: 1264, column: 4, scope: !1497)
!1502 = !DILocation(line: 1269, column: 1, scope: !1441)
!1503 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1286, type: !1504, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!25, !433, !25}
!1506 = !DILocalVariable(name: "numerator", arg: 1, scope: !1503, file: !74, line: 1286, type: !433)
!1507 = !DILocation(line: 1286, column: 25, scope: !1503)
!1508 = !DILocalVariable(name: "denominator", arg: 2, scope: !1503, file: !74, line: 1286, type: !25)
!1509 = !DILocation(line: 1286, column: 40, scope: !1503)
!1510 = !DILocalVariable(name: "u32Temp1", scope: !1503, file: !74, line: 1288, type: !433)
!1511 = !DILocation(line: 1288, column: 6, scope: !1503)
!1512 = !DILocalVariable(name: "u32Temp2", scope: !1503, file: !74, line: 1288, type: !433)
!1513 = !DILocation(line: 1288, column: 20, scope: !1503)
!1514 = !DILocation(line: 1289, column: 5, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1503, file: !74, line: 1289, column: 5)
!1516 = !DILocation(line: 1289, column: 17, scope: !1515)
!1517 = !DILocation(line: 1289, column: 5, scope: !1503)
!1518 = !DILocation(line: 1291, column: 6, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1520, file: !74, line: 1291, column: 6)
!1520 = distinct !DILexicalBlock(scope: !1515, file: !74, line: 1290, column: 2)
!1521 = !DILocation(line: 1291, column: 18, scope: !1519)
!1522 = !DILocation(line: 1291, column: 6, scope: !1520)
!1523 = !DILocation(line: 1293, column: 4, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1519, file: !74, line: 1292, column: 3)
!1525 = !DILocation(line: 1297, column: 19, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1519, file: !74, line: 1296, column: 3)
!1527 = !DILocation(line: 1297, column: 18, scope: !1526)
!1528 = !DILocation(line: 1297, column: 16, scope: !1526)
!1529 = !DILocation(line: 1298, column: 16, scope: !1526)
!1530 = !DILocation(line: 1298, column: 30, scope: !1526)
!1531 = !DILocation(line: 1298, column: 40, scope: !1526)
!1532 = !DILocation(line: 1298, column: 39, scope: !1526)
!1533 = !DILocation(line: 1298, column: 55, scope: !1526)
!1534 = !DILocation(line: 1298, column: 53, scope: !1526)
!1535 = !DILocation(line: 1298, column: 26, scope: !1526)
!1536 = !DILocation(line: 1298, column: 69, scope: !1526)
!1537 = !DILocation(line: 1298, column: 13, scope: !1526)
!1538 = !DILocation(line: 1299, column: 16, scope: !1526)
!1539 = !DILocation(line: 1299, column: 25, scope: !1526)
!1540 = !DILocation(line: 1299, column: 24, scope: !1526)
!1541 = !DILocation(line: 1299, column: 41, scope: !1526)
!1542 = !DILocation(line: 1299, column: 51, scope: !1526)
!1543 = !DILocation(line: 1299, column: 50, scope: !1526)
!1544 = !DILocation(line: 1299, column: 38, scope: !1526)
!1545 = !DILocation(line: 1299, column: 13, scope: !1526)
!1546 = !DILocation(line: 1300, column: 7, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1526, file: !74, line: 1300, column: 7)
!1548 = !DILocation(line: 1300, column: 16, scope: !1547)
!1549 = !DILocation(line: 1300, column: 7, scope: !1526)
!1550 = !DILocation(line: 1302, column: 13, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1547, file: !74, line: 1301, column: 4)
!1552 = !DILocation(line: 1302, column: 12, scope: !1551)
!1553 = !DILocation(line: 1302, column: 5, scope: !1551)
!1554 = !DILocation(line: 1306, column: 5, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1547, file: !74, line: 1305, column: 4)
!1556 = !DILocation(line: 1312, column: 15, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1515, file: !74, line: 1311, column: 2)
!1558 = !DILocation(line: 1312, column: 29, scope: !1557)
!1559 = !DILocation(line: 1312, column: 39, scope: !1557)
!1560 = !DILocation(line: 1312, column: 38, scope: !1557)
!1561 = !DILocation(line: 1312, column: 54, scope: !1557)
!1562 = !DILocation(line: 1312, column: 52, scope: !1557)
!1563 = !DILocation(line: 1312, column: 25, scope: !1557)
!1564 = !DILocation(line: 1312, column: 68, scope: !1557)
!1565 = !DILocation(line: 1312, column: 12, scope: !1557)
!1566 = !DILocation(line: 1313, column: 15, scope: !1557)
!1567 = !DILocation(line: 1313, column: 24, scope: !1557)
!1568 = !DILocation(line: 1313, column: 23, scope: !1557)
!1569 = !DILocation(line: 1313, column: 40, scope: !1557)
!1570 = !DILocation(line: 1313, column: 50, scope: !1557)
!1571 = !DILocation(line: 1313, column: 49, scope: !1557)
!1572 = !DILocation(line: 1313, column: 37, scope: !1557)
!1573 = !DILocation(line: 1313, column: 12, scope: !1557)
!1574 = !DILocation(line: 1314, column: 6, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1557, file: !74, line: 1314, column: 6)
!1576 = !DILocation(line: 1314, column: 15, scope: !1575)
!1577 = !DILocation(line: 1314, column: 6, scope: !1557)
!1578 = !DILocation(line: 1316, column: 11, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1575, file: !74, line: 1315, column: 3)
!1580 = !DILocation(line: 1316, column: 4, scope: !1579)
!1581 = !DILocation(line: 1320, column: 4, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1575, file: !74, line: 1319, column: 3)
!1583 = !DILocation(line: 1323, column: 1, scope: !1503)
!1584 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1341, type: !1585, scopeLine: 1342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!25, !25, !433}
!1587 = !DILocalVariable(name: "numerator", arg: 1, scope: !1584, file: !74, line: 1341, type: !25)
!1588 = !DILocation(line: 1341, column: 25, scope: !1584)
!1589 = !DILocalVariable(name: "denominator", arg: 2, scope: !1584, file: !74, line: 1341, type: !433)
!1590 = !DILocation(line: 1341, column: 40, scope: !1584)
!1591 = !DILocalVariable(name: "s32Temp1", scope: !1584, file: !74, line: 1343, type: !25)
!1592 = !DILocation(line: 1343, column: 6, scope: !1584)
!1593 = !DILocalVariable(name: "s32Temp2", scope: !1584, file: !74, line: 1343, type: !25)
!1594 = !DILocation(line: 1343, column: 20, scope: !1584)
!1595 = !DILocalVariable(name: "u32Temp0", scope: !1584, file: !74, line: 1344, type: !433)
!1596 = !DILocation(line: 1344, column: 6, scope: !1584)
!1597 = !DILocalVariable(name: "u32Temp1", scope: !1584, file: !74, line: 1344, type: !433)
!1598 = !DILocation(line: 1344, column: 20, scope: !1584)
!1599 = !DILocalVariable(name: "u32Temp2", scope: !1584, file: !74, line: 1344, type: !433)
!1600 = !DILocation(line: 1344, column: 34, scope: !1584)
!1601 = !DILocation(line: 1345, column: 5, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1584, file: !74, line: 1345, column: 5)
!1603 = !DILocation(line: 1345, column: 17, scope: !1602)
!1604 = !DILocation(line: 1345, column: 5, scope: !1584)
!1605 = !DILocation(line: 1347, column: 6, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1607, file: !74, line: 1347, column: 6)
!1607 = distinct !DILexicalBlock(scope: !1602, file: !74, line: 1346, column: 2)
!1608 = !DILocation(line: 1347, column: 16, scope: !1606)
!1609 = !DILocation(line: 1347, column: 6, scope: !1607)
!1610 = !DILocation(line: 1349, column: 4, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1606, file: !74, line: 1348, column: 3)
!1612 = !DILocation(line: 1353, column: 4, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1606, file: !74, line: 1352, column: 3)
!1614 = !DILocation(line: 1358, column: 6, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1616, file: !74, line: 1358, column: 6)
!1616 = distinct !DILexicalBlock(scope: !1602, file: !74, line: 1357, column: 2)
!1617 = !DILocation(line: 1358, column: 16, scope: !1615)
!1618 = !DILocation(line: 1358, column: 6, scope: !1616)
!1619 = !DILocation(line: 1360, column: 16, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1615, file: !74, line: 1359, column: 3)
!1621 = !DILocation(line: 1360, column: 15, scope: !1620)
!1622 = !DILocation(line: 1360, column: 13, scope: !1620)
!1623 = !DILocation(line: 1361, column: 16, scope: !1620)
!1624 = !DILocation(line: 1361, column: 25, scope: !1620)
!1625 = !DILocation(line: 1361, column: 24, scope: !1620)
!1626 = !DILocation(line: 1361, column: 13, scope: !1620)
!1627 = !DILocation(line: 1362, column: 15, scope: !1620)
!1628 = !DILocation(line: 1362, column: 28, scope: !1620)
!1629 = !DILocation(line: 1362, column: 37, scope: !1620)
!1630 = !DILocation(line: 1362, column: 36, scope: !1620)
!1631 = !DILocation(line: 1362, column: 52, scope: !1620)
!1632 = !DILocation(line: 1362, column: 50, scope: !1620)
!1633 = !DILocation(line: 1362, column: 24, scope: !1620)
!1634 = !DILocation(line: 1362, column: 13, scope: !1620)
!1635 = !DILocation(line: 1364, column: 8, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !1620, file: !74, line: 1364, column: 7)
!1637 = !DILocation(line: 1364, column: 20, scope: !1636)
!1638 = !DILocation(line: 1364, column: 27, scope: !1636)
!1639 = !DILocation(line: 1364, column: 7, scope: !1620)
!1640 = !DILocation(line: 1366, column: 20, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1636, file: !74, line: 1365, column: 4)
!1642 = !DILocation(line: 1366, column: 32, scope: !1641)
!1643 = !DILocation(line: 1366, column: 17, scope: !1641)
!1644 = !DILocation(line: 1367, column: 4, scope: !1641)
!1645 = !DILocation(line: 1370, column: 20, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1636, file: !74, line: 1369, column: 4)
!1647 = !DILocation(line: 1370, column: 32, scope: !1646)
!1648 = !DILocation(line: 1370, column: 38, scope: !1646)
!1649 = !DILocation(line: 1370, column: 17, scope: !1646)
!1650 = !DILocation(line: 1374, column: 7, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1620, file: !74, line: 1374, column: 7)
!1652 = !DILocation(line: 1374, column: 18, scope: !1651)
!1653 = !DILocation(line: 1374, column: 16, scope: !1651)
!1654 = !DILocation(line: 1374, column: 7, scope: !1620)
!1655 = !DILocation(line: 1376, column: 14, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1651, file: !74, line: 1375, column: 4)
!1657 = !DILocation(line: 1376, column: 13, scope: !1656)
!1658 = !DILocation(line: 1376, column: 23, scope: !1656)
!1659 = !DILocation(line: 1376, column: 5, scope: !1656)
!1660 = !DILocation(line: 1380, column: 14, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1651, file: !74, line: 1379, column: 4)
!1662 = !DILocation(line: 1380, column: 23, scope: !1661)
!1663 = !DILocation(line: 1380, column: 12, scope: !1661)
!1664 = !DILocation(line: 1380, column: 27, scope: !1661)
!1665 = !DILocation(line: 1380, column: 5, scope: !1661)
!1666 = !DILocation(line: 1387, column: 16, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1615, file: !74, line: 1386, column: 3)
!1668 = !DILocation(line: 1387, column: 30, scope: !1667)
!1669 = !DILocation(line: 1387, column: 40, scope: !1667)
!1670 = !DILocation(line: 1387, column: 39, scope: !1667)
!1671 = !DILocation(line: 1387, column: 55, scope: !1667)
!1672 = !DILocation(line: 1387, column: 53, scope: !1667)
!1673 = !DILocation(line: 1387, column: 26, scope: !1667)
!1674 = !DILocation(line: 1387, column: 69, scope: !1667)
!1675 = !DILocation(line: 1387, column: 13, scope: !1667)
!1676 = !DILocation(line: 1388, column: 16, scope: !1667)
!1677 = !DILocation(line: 1388, column: 26, scope: !1667)
!1678 = !DILocation(line: 1388, column: 25, scope: !1667)
!1679 = !DILocation(line: 1388, column: 42, scope: !1667)
!1680 = !DILocation(line: 1388, column: 51, scope: !1667)
!1681 = !DILocation(line: 1388, column: 50, scope: !1667)
!1682 = !DILocation(line: 1388, column: 39, scope: !1667)
!1683 = !DILocation(line: 1388, column: 13, scope: !1667)
!1684 = !DILocation(line: 1389, column: 11, scope: !1667)
!1685 = !DILocation(line: 1389, column: 4, scope: !1667)
!1686 = !DILocation(line: 1392, column: 1, scope: !1584)
!1687 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1409, type: !1688, scopeLine: 1410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1688 = !DISubroutineType(types: !1689)
!1689 = !{!25, !25, !25}
!1690 = !DILocalVariable(name: "numerator", arg: 1, scope: !1687, file: !74, line: 1409, type: !25)
!1691 = !DILocation(line: 1409, column: 25, scope: !1687)
!1692 = !DILocalVariable(name: "denominator", arg: 2, scope: !1687, file: !74, line: 1409, type: !25)
!1693 = !DILocation(line: 1409, column: 40, scope: !1687)
!1694 = !DILocalVariable(name: "s32Temp1", scope: !1687, file: !74, line: 1411, type: !25)
!1695 = !DILocation(line: 1411, column: 6, scope: !1687)
!1696 = !DILocalVariable(name: "s32Temp2", scope: !1687, file: !74, line: 1411, type: !25)
!1697 = !DILocation(line: 1411, column: 20, scope: !1687)
!1698 = !DILocalVariable(name: "denominator_prime", scope: !1687, file: !74, line: 1412, type: !433)
!1699 = !DILocation(line: 1412, column: 6, scope: !1687)
!1700 = !DILocalVariable(name: "u32Temp1", scope: !1687, file: !74, line: 1412, type: !433)
!1701 = !DILocation(line: 1412, column: 29, scope: !1687)
!1702 = !DILocalVariable(name: "u32Temp2", scope: !1687, file: !74, line: 1412, type: !433)
!1703 = !DILocation(line: 1412, column: 43, scope: !1687)
!1704 = !DILocalVariable(name: "u32numerator", scope: !1687, file: !74, line: 1413, type: !433)
!1705 = !DILocation(line: 1413, column: 6, scope: !1687)
!1706 = !DILocalVariable(name: "u32denominator", scope: !1687, file: !74, line: 1413, type: !433)
!1707 = !DILocation(line: 1413, column: 23, scope: !1687)
!1708 = !DILocation(line: 1414, column: 5, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1687, file: !74, line: 1414, column: 5)
!1710 = !DILocation(line: 1414, column: 15, scope: !1709)
!1711 = !DILocation(line: 1414, column: 5, scope: !1687)
!1712 = !DILocation(line: 1416, column: 6, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1714, file: !74, line: 1416, column: 6)
!1714 = distinct !DILexicalBlock(scope: !1709, file: !74, line: 1415, column: 2)
!1715 = !DILocation(line: 1416, column: 18, scope: !1713)
!1716 = !DILocation(line: 1416, column: 6, scope: !1714)
!1717 = !DILocation(line: 1418, column: 7, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1719, file: !74, line: 1418, column: 7)
!1719 = distinct !DILexicalBlock(scope: !1713, file: !74, line: 1417, column: 3)
!1720 = !DILocation(line: 1418, column: 19, scope: !1718)
!1721 = !DILocation(line: 1418, column: 7, scope: !1719)
!1722 = !DILocation(line: 1420, column: 5, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !74, line: 1419, column: 4)
!1724 = !DILocation(line: 1424, column: 21, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1718, file: !74, line: 1423, column: 4)
!1726 = !DILocation(line: 1424, column: 20, scope: !1725)
!1727 = !DILocation(line: 1424, column: 18, scope: !1725)
!1728 = !DILocation(line: 1425, column: 23, scope: !1725)
!1729 = !DILocation(line: 1425, column: 22, scope: !1725)
!1730 = !DILocation(line: 1425, column: 20, scope: !1725)
!1731 = !DILocation(line: 1426, column: 16, scope: !1725)
!1732 = !DILocation(line: 1426, column: 33, scope: !1725)
!1733 = !DILocation(line: 1426, column: 46, scope: !1725)
!1734 = !DILocation(line: 1426, column: 45, scope: !1725)
!1735 = !DILocation(line: 1426, column: 64, scope: !1725)
!1736 = !DILocation(line: 1426, column: 62, scope: !1725)
!1737 = !DILocation(line: 1426, column: 29, scope: !1725)
!1738 = !DILocation(line: 1426, column: 81, scope: !1725)
!1739 = !DILocation(line: 1426, column: 14, scope: !1725)
!1740 = !DILocation(line: 1427, column: 17, scope: !1725)
!1741 = !DILocation(line: 1427, column: 30, scope: !1725)
!1742 = !DILocation(line: 1427, column: 29, scope: !1725)
!1743 = !DILocation(line: 1427, column: 49, scope: !1725)
!1744 = !DILocation(line: 1427, column: 58, scope: !1725)
!1745 = !DILocation(line: 1427, column: 57, scope: !1725)
!1746 = !DILocation(line: 1427, column: 46, scope: !1725)
!1747 = !DILocation(line: 1427, column: 14, scope: !1725)
!1748 = !DILocation(line: 1428, column: 8, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1725, file: !74, line: 1428, column: 8)
!1750 = !DILocation(line: 1428, column: 17, scope: !1749)
!1751 = !DILocation(line: 1428, column: 8, scope: !1725)
!1752 = !DILocation(line: 1430, column: 13, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1749, file: !74, line: 1429, column: 5)
!1754 = !DILocation(line: 1430, column: 6, scope: !1753)
!1755 = !DILocation(line: 1434, column: 6, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1749, file: !74, line: 1433, column: 5)
!1757 = !DILocation(line: 1440, column: 20, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1713, file: !74, line: 1439, column: 3)
!1759 = !DILocation(line: 1440, column: 19, scope: !1758)
!1760 = !DILocation(line: 1440, column: 29, scope: !1758)
!1761 = !DILocation(line: 1440, column: 17, scope: !1758)
!1762 = !DILocation(line: 1441, column: 16, scope: !1758)
!1763 = !DILocation(line: 1441, column: 33, scope: !1758)
!1764 = !DILocation(line: 1441, column: 46, scope: !1758)
!1765 = !DILocation(line: 1441, column: 45, scope: !1758)
!1766 = !DILocation(line: 1441, column: 61, scope: !1758)
!1767 = !DILocation(line: 1441, column: 59, scope: !1758)
!1768 = !DILocation(line: 1441, column: 29, scope: !1758)
!1769 = !DILocation(line: 1441, column: 75, scope: !1758)
!1770 = !DILocation(line: 1441, column: 13, scope: !1758)
!1771 = !DILocation(line: 1442, column: 16, scope: !1758)
!1772 = !DILocation(line: 1442, column: 29, scope: !1758)
!1773 = !DILocation(line: 1442, column: 28, scope: !1758)
!1774 = !DILocation(line: 1442, column: 45, scope: !1758)
!1775 = !DILocation(line: 1442, column: 54, scope: !1758)
!1776 = !DILocation(line: 1442, column: 53, scope: !1758)
!1777 = !DILocation(line: 1442, column: 42, scope: !1758)
!1778 = !DILocation(line: 1442, column: 13, scope: !1758)
!1779 = !DILocation(line: 1443, column: 13, scope: !1758)
!1780 = !DILocation(line: 1443, column: 12, scope: !1758)
!1781 = !DILocation(line: 1443, column: 22, scope: !1758)
!1782 = !DILocation(line: 1443, column: 4, scope: !1758)
!1783 = !DILocation(line: 1448, column: 6, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1785, file: !74, line: 1448, column: 6)
!1785 = distinct !DILexicalBlock(scope: !1709, file: !74, line: 1447, column: 2)
!1786 = !DILocation(line: 1448, column: 18, scope: !1784)
!1787 = !DILocation(line: 1448, column: 6, scope: !1785)
!1788 = !DILocation(line: 1450, column: 7, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1790, file: !74, line: 1450, column: 7)
!1790 = distinct !DILexicalBlock(scope: !1784, file: !74, line: 1449, column: 3)
!1791 = !DILocation(line: 1450, column: 19, scope: !1789)
!1792 = !DILocation(line: 1450, column: 7, scope: !1790)
!1793 = !DILocation(line: 1452, column: 5, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1789, file: !74, line: 1451, column: 4)
!1795 = !DILocation(line: 1456, column: 23, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1789, file: !74, line: 1455, column: 4)
!1797 = !DILocation(line: 1456, column: 22, scope: !1796)
!1798 = !DILocation(line: 1456, column: 35, scope: !1796)
!1799 = !DILocation(line: 1456, column: 20, scope: !1796)
!1800 = !DILocation(line: 1457, column: 17, scope: !1796)
!1801 = !DILocation(line: 1457, column: 31, scope: !1796)
!1802 = !DILocation(line: 1457, column: 41, scope: !1796)
!1803 = !DILocation(line: 1457, column: 40, scope: !1796)
!1804 = !DILocation(line: 1457, column: 59, scope: !1796)
!1805 = !DILocation(line: 1457, column: 57, scope: !1796)
!1806 = !DILocation(line: 1457, column: 27, scope: !1796)
!1807 = !DILocation(line: 1457, column: 76, scope: !1796)
!1808 = !DILocation(line: 1457, column: 14, scope: !1796)
!1809 = !DILocation(line: 1458, column: 17, scope: !1796)
!1810 = !DILocation(line: 1458, column: 27, scope: !1796)
!1811 = !DILocation(line: 1458, column: 26, scope: !1796)
!1812 = !DILocation(line: 1458, column: 46, scope: !1796)
!1813 = !DILocation(line: 1458, column: 55, scope: !1796)
!1814 = !DILocation(line: 1458, column: 54, scope: !1796)
!1815 = !DILocation(line: 1458, column: 43, scope: !1796)
!1816 = !DILocation(line: 1458, column: 14, scope: !1796)
!1817 = !DILocation(line: 1459, column: 14, scope: !1796)
!1818 = !DILocation(line: 1459, column: 13, scope: !1796)
!1819 = !DILocation(line: 1459, column: 23, scope: !1796)
!1820 = !DILocation(line: 1459, column: 5, scope: !1796)
!1821 = !DILocation(line: 1464, column: 16, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1784, file: !74, line: 1463, column: 3)
!1823 = !DILocation(line: 1464, column: 30, scope: !1822)
!1824 = !DILocation(line: 1464, column: 40, scope: !1822)
!1825 = !DILocation(line: 1464, column: 39, scope: !1822)
!1826 = !DILocation(line: 1464, column: 55, scope: !1822)
!1827 = !DILocation(line: 1464, column: 53, scope: !1822)
!1828 = !DILocation(line: 1464, column: 26, scope: !1822)
!1829 = !DILocation(line: 1464, column: 69, scope: !1822)
!1830 = !DILocation(line: 1464, column: 13, scope: !1822)
!1831 = !DILocation(line: 1465, column: 16, scope: !1822)
!1832 = !DILocation(line: 1465, column: 26, scope: !1822)
!1833 = !DILocation(line: 1465, column: 25, scope: !1822)
!1834 = !DILocation(line: 1465, column: 42, scope: !1822)
!1835 = !DILocation(line: 1465, column: 51, scope: !1822)
!1836 = !DILocation(line: 1465, column: 50, scope: !1822)
!1837 = !DILocation(line: 1465, column: 39, scope: !1822)
!1838 = !DILocation(line: 1465, column: 13, scope: !1822)
!1839 = !DILocation(line: 1466, column: 11, scope: !1822)
!1840 = !DILocation(line: 1466, column: 4, scope: !1822)
!1841 = !DILocation(line: 1469, column: 1, scope: !1687)
!1842 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1487, type: !1843, scopeLine: 1488, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1843 = !DISubroutineType(types: !1844)
!1844 = !{!6, !25, !433}
!1845 = !DILocalVariable(name: "numerator", arg: 1, scope: !1842, file: !74, line: 1487, type: !25)
!1846 = !DILocation(line: 1487, column: 25, scope: !1842)
!1847 = !DILocalVariable(name: "denominator", arg: 2, scope: !1842, file: !74, line: 1487, type: !433)
!1848 = !DILocation(line: 1487, column: 40, scope: !1842)
!1849 = !DILocalVariable(name: "numerator_prime", scope: !1842, file: !74, line: 1490, type: !433)
!1850 = !DILocation(line: 1490, column: 6, scope: !1842)
!1851 = !DILocalVariable(name: "u32Temp1", scope: !1842, file: !74, line: 1490, type: !433)
!1852 = !DILocation(line: 1490, column: 27, scope: !1842)
!1853 = !DILocalVariable(name: "u32Temp2", scope: !1842, file: !74, line: 1490, type: !433)
!1854 = !DILocation(line: 1490, column: 41, scope: !1842)
!1855 = !DILocalVariable(name: "u32Temp3", scope: !1842, file: !74, line: 1490, type: !433)
!1856 = !DILocation(line: 1490, column: 55, scope: !1842)
!1857 = !DILocalVariable(name: "s32Temp1", scope: !1842, file: !74, line: 1491, type: !25)
!1858 = !DILocation(line: 1491, column: 6, scope: !1842)
!1859 = !DILocalVariable(name: "s32Temp2", scope: !1842, file: !74, line: 1491, type: !25)
!1860 = !DILocation(line: 1491, column: 20, scope: !1842)
!1861 = !DILocalVariable(name: "s32Temp3", scope: !1842, file: !74, line: 1491, type: !25)
!1862 = !DILocation(line: 1491, column: 34, scope: !1842)
!1863 = !DILocation(line: 1492, column: 5, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1842, file: !74, line: 1492, column: 5)
!1865 = !DILocation(line: 1492, column: 17, scope: !1864)
!1866 = !DILocation(line: 1492, column: 5, scope: !1842)
!1867 = !DILocation(line: 1494, column: 6, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1869, file: !74, line: 1494, column: 6)
!1869 = distinct !DILexicalBlock(scope: !1864, file: !74, line: 1493, column: 2)
!1870 = !DILocation(line: 1494, column: 15, scope: !1868)
!1871 = !DILocation(line: 1494, column: 6, scope: !1869)
!1872 = !DILocation(line: 1496, column: 4, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1868, file: !74, line: 1495, column: 3)
!1874 = !DILocation(line: 1500, column: 4, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1868, file: !74, line: 1499, column: 3)
!1876 = !DILocation(line: 1505, column: 6, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1878, file: !74, line: 1505, column: 6)
!1878 = distinct !DILexicalBlock(scope: !1864, file: !74, line: 1504, column: 2)
!1879 = !DILocation(line: 1505, column: 16, scope: !1877)
!1880 = !DILocation(line: 1505, column: 6, scope: !1878)
!1881 = !DILocation(line: 1507, column: 23, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1877, file: !74, line: 1506, column: 3)
!1883 = !DILocation(line: 1507, column: 22, scope: !1882)
!1884 = !DILocation(line: 1507, column: 20, scope: !1882)
!1885 = !DILocation(line: 1508, column: 16, scope: !1882)
!1886 = !DILocation(line: 1508, column: 32, scope: !1882)
!1887 = !DILocation(line: 1508, column: 31, scope: !1882)
!1888 = !DILocation(line: 1508, column: 13, scope: !1882)
!1889 = !DILocation(line: 1509, column: 15, scope: !1882)
!1890 = !DILocation(line: 1509, column: 34, scope: !1882)
!1891 = !DILocation(line: 1509, column: 45, scope: !1882)
!1892 = !DILocation(line: 1509, column: 43, scope: !1882)
!1893 = !DILocation(line: 1509, column: 31, scope: !1882)
!1894 = !DILocation(line: 1509, column: 13, scope: !1882)
!1895 = !DILocation(line: 1511, column: 8, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1882, file: !74, line: 1511, column: 7)
!1897 = !DILocation(line: 1511, column: 20, scope: !1896)
!1898 = !DILocation(line: 1511, column: 27, scope: !1896)
!1899 = !DILocation(line: 1511, column: 7, scope: !1882)
!1900 = !DILocation(line: 1513, column: 19, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1896, file: !74, line: 1512, column: 4)
!1902 = !DILocation(line: 1513, column: 31, scope: !1901)
!1903 = !DILocation(line: 1513, column: 17, scope: !1901)
!1904 = !DILocation(line: 1514, column: 4, scope: !1901)
!1905 = !DILocation(line: 1517, column: 20, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1896, file: !74, line: 1516, column: 4)
!1907 = !DILocation(line: 1517, column: 32, scope: !1906)
!1908 = !DILocation(line: 1517, column: 38, scope: !1906)
!1909 = !DILocation(line: 1517, column: 17, scope: !1906)
!1910 = !DILocation(line: 1520, column: 7, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1882, file: !74, line: 1520, column: 7)
!1912 = !DILocation(line: 1520, column: 18, scope: !1911)
!1913 = !DILocation(line: 1520, column: 16, scope: !1911)
!1914 = !DILocation(line: 1520, column: 7, scope: !1882)
!1915 = !DILocation(line: 1522, column: 18, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1911, file: !74, line: 1521, column: 4)
!1917 = !DILocation(line: 1522, column: 16, scope: !1916)
!1918 = !DILocation(line: 1522, column: 28, scope: !1916)
!1919 = !DILocation(line: 1522, column: 14, scope: !1916)
!1920 = !DILocation(line: 1523, column: 4, scope: !1916)
!1921 = !DILocation(line: 1526, column: 18, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1911, file: !74, line: 1525, column: 4)
!1923 = !DILocation(line: 1526, column: 26, scope: !1922)
!1924 = !DILocation(line: 1526, column: 16, scope: !1922)
!1925 = !DILocation(line: 1526, column: 30, scope: !1922)
!1926 = !DILocation(line: 1526, column: 14, scope: !1922)
!1927 = !DILocation(line: 1528, column: 8, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1882, file: !74, line: 1528, column: 7)
!1929 = !DILocation(line: 1528, column: 18, scope: !1928)
!1930 = !DILocation(line: 1528, column: 7, scope: !1882)
!1931 = !DILocation(line: 1530, column: 18, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1928, file: !74, line: 1529, column: 4)
!1933 = !DILocation(line: 1530, column: 12, scope: !1932)
!1934 = !DILocation(line: 1530, column: 5, scope: !1932)
!1935 = !DILocation(line: 1534, column: 5, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1928, file: !74, line: 1533, column: 4)
!1937 = !DILocation(line: 1539, column: 16, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1877, file: !74, line: 1538, column: 3)
!1939 = !DILocation(line: 1539, column: 26, scope: !1938)
!1940 = !DILocation(line: 1539, column: 25, scope: !1938)
!1941 = !DILocation(line: 1539, column: 41, scope: !1938)
!1942 = !DILocation(line: 1539, column: 39, scope: !1938)
!1943 = !DILocation(line: 1539, column: 13, scope: !1938)
!1944 = !DILocation(line: 1540, column: 16, scope: !1938)
!1945 = !DILocation(line: 1540, column: 30, scope: !1938)
!1946 = !DILocation(line: 1540, column: 40, scope: !1938)
!1947 = !DILocation(line: 1540, column: 39, scope: !1938)
!1948 = !DILocation(line: 1540, column: 55, scope: !1938)
!1949 = !DILocation(line: 1540, column: 53, scope: !1938)
!1950 = !DILocation(line: 1540, column: 26, scope: !1938)
!1951 = !DILocation(line: 1540, column: 68, scope: !1938)
!1952 = !DILocation(line: 1540, column: 13, scope: !1938)
!1953 = !DILocation(line: 1541, column: 16, scope: !1938)
!1954 = !DILocation(line: 1541, column: 25, scope: !1938)
!1955 = !DILocation(line: 1541, column: 24, scope: !1938)
!1956 = !DILocation(line: 1541, column: 41, scope: !1938)
!1957 = !DILocation(line: 1541, column: 51, scope: !1938)
!1958 = !DILocation(line: 1541, column: 50, scope: !1938)
!1959 = !DILocation(line: 1541, column: 38, scope: !1938)
!1960 = !DILocation(line: 1541, column: 13, scope: !1938)
!1961 = !DILocation(line: 1542, column: 7, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1938, file: !74, line: 1542, column: 7)
!1963 = !DILocation(line: 1542, column: 16, scope: !1962)
!1964 = !DILocation(line: 1542, column: 7, scope: !1938)
!1965 = !DILocation(line: 1544, column: 17, scope: !1966)
!1966 = distinct !DILexicalBlock(scope: !1962, file: !74, line: 1543, column: 4)
!1967 = !DILocation(line: 1544, column: 12, scope: !1966)
!1968 = !DILocation(line: 1544, column: 5, scope: !1966)
!1969 = !DILocation(line: 1548, column: 5, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1962, file: !74, line: 1547, column: 4)
!1971 = !DILocation(line: 1552, column: 1, scope: !1842)
!1972 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1973, file: !1973, line: 12, type: !1974, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1977)
!1973 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1974 = !DISubroutineType(types: !1975)
!1975 = !{null, !1976}
!1976 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1977 = !{!1978}
!1978 = !DILocalVariable(name: "z", arg: 1, scope: !1972, file: !1973, line: 12, type: !1976)
!1979 = !DILocation(line: 0, scope: !1972)
!1980 = !DILocation(line: 13, column: 9, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1972, file: !1973, line: 13, column: 7)
!1982 = !DILocation(line: 13, column: 7, scope: !1972)
!1983 = !DILocation(line: 14, column: 5, scope: !1981)
!1984 = !DILocation(line: 15, column: 1, scope: !1972)
!1985 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1986, file: !1986, line: 20, type: !1987, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1990)
!1986 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1987 = !DISubroutineType(types: !1988)
!1988 = !{null, !1989, !1989}
!1989 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1990 = !{!1991, !1992}
!1991 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1985, file: !1986, line: 20, type: !1989)
!1992 = !DILocalVariable(name: "shift", arg: 2, scope: !1985, file: !1986, line: 20, type: !1989)
!1993 = !DILocation(line: 0, scope: !1985)
!1994 = !DILocation(line: 21, column: 13, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1985, file: !1986, line: 21, column: 7)
!1996 = !DILocation(line: 21, column: 7, scope: !1985)
!1997 = !DILocation(line: 27, column: 5, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1995, file: !1986, line: 21, column: 26)
!1999 = !DILocation(line: 29, column: 1, scope: !1985)
