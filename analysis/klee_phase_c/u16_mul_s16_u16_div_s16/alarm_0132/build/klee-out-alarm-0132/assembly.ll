; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132/build/u16_mul_s16_u16_div_s16_alarm_0132.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0132: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0132.err\00", align 1
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
  %call = call zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %3, i16 zeroext %4, i16 signext %5), !dbg !69
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
  %4 = load i32, i32* %s32Result, align 4, !dbg !648
  %5 = load i32, i32* %s32Result, align 4, !dbg !650
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !651
  %conv8 = sext i16 %6 to i32, !dbg !651
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !652
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !652
  %div = sdiv i32 %5, %conv8, !dbg !652, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !653
  %conv9 = sext i16 %7 to i32, !dbg !653
  %mul10 = mul nsw i32 %div, %conv9, !dbg !654
  %sub = sub nsw i32 %4, %mul10, !dbg !655
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !656
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !657
  %shl = shl i32 %8, 1, !dbg !658
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !659
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !660
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !661
  %conv11 = sext i16 %10 to i32, !dbg !661
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !662
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !662
  %div12 = sdiv i32 %9, %conv11, !dbg !662, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !663
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !664
  %conv13 = sext i16 %12 to i32, !dbg !664
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !665
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !665
  %div14 = sdiv i32 %11, %conv13, !dbg !665, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !666
  store i32 %add, i32* %s32Result, align 4, !dbg !667
  %13 = load i32, i32* %s32Result, align 4, !dbg !668
  %cmp15 = icmp slt i32 %13, 32767, !dbg !670
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !671

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !672
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !675
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !676

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !677
  %conv21 = trunc i32 %15 to i16, !dbg !679
  store i16 %conv21, i16* %retval, align 2, !dbg !680
  br label %return, !dbg !680

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !681
  br label %return, !dbg !681

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !683
  br label %return, !dbg !683

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !685
  ret i16 %16, !dbg !685
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !686 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !689, metadata !DIExpression()), !dbg !690
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !691, metadata !DIExpression()), !dbg !692
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !693, metadata !DIExpression()), !dbg !694
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !695, metadata !DIExpression()), !dbg !696
  store i32 0, i32* %s32Result, align 4, !dbg !696
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !697, metadata !DIExpression()), !dbg !698
  store i32 0, i32* %s32Temp1, align 4, !dbg !698
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !699
  %conv = zext i16 %0 to i32, !dbg !699
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !700
  %conv1 = sext i16 %1 to i32, !dbg !700
  %mul = mul nsw i32 %conv, %conv1, !dbg !701
  store i32 %mul, i32* %s32Result, align 4, !dbg !702
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !703
  %conv2 = zext i16 %2 to i32, !dbg !703
  %cmp = icmp eq i32 %conv2, 0, !dbg !705
  br i1 %cmp, label %if.then, label %if.else7, !dbg !706

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !707
  %cmp4 = icmp slt i32 %3, 0, !dbg !710
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !711

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !712
  br label %return, !dbg !712

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !714
  br label %return, !dbg !714

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !716
  %5 = load i32, i32* %s32Result, align 4, !dbg !718
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !719
  %conv8 = zext i16 %6 to i32, !dbg !719
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !720
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !720
  %div = sdiv i32 %5, %conv8, !dbg !720, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !721
  %conv9 = zext i16 %7 to i32, !dbg !721
  %mul10 = mul nsw i32 %div, %conv9, !dbg !722
  %sub = sub nsw i32 %4, %mul10, !dbg !723
  %shl = shl i32 %sub, 1, !dbg !724
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !725
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !726
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !727
  %conv11 = zext i16 %9 to i32, !dbg !727
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !728
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !728
  %div12 = sdiv i32 %8, %conv11, !dbg !728, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !729
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !730
  %conv13 = zext i16 %11 to i32, !dbg !730
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !731
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !731
  %div14 = sdiv i32 %10, %conv13, !dbg !731, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !732
  store i32 %add, i32* %s32Result, align 4, !dbg !733
  %12 = load i32, i32* %s32Result, align 4, !dbg !734
  %cmp15 = icmp slt i32 %12, 32767, !dbg !736
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !737

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !738
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !741
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !742

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !743
  %conv21 = trunc i32 %14 to i16, !dbg !745
  store i16 %conv21, i16* %retval, align 2, !dbg !746
  br label %return, !dbg !746

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !747
  br label %return, !dbg !747

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !749
  br label %return, !dbg !749

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !751
  ret i16 %15, !dbg !751
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !752 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !755, metadata !DIExpression()), !dbg !756
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !757, metadata !DIExpression()), !dbg !758
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !759, metadata !DIExpression()), !dbg !760
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !761, metadata !DIExpression()), !dbg !762
  store i32 0, i32* %u32Result, align 4, !dbg !762
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !763, metadata !DIExpression()), !dbg !764
  store i32 0, i32* %u32Temp1, align 4, !dbg !764
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !765, metadata !DIExpression()), !dbg !766
  store i32 0, i32* %s32Result, align 4, !dbg !766
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !767, metadata !DIExpression()), !dbg !768
  store i32 0, i32* %s32Temp1, align 4, !dbg !768
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !769
  %conv = sext i16 %0 to i32, !dbg !769
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !770
  %conv1 = zext i16 %1 to i32, !dbg !770
  %mul = mul nsw i32 %conv, %conv1, !dbg !771
  store i32 %mul, i32* %s32Result, align 4, !dbg !772
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !773
  %conv2 = sext i16 %2 to i32, !dbg !773
  %cmp = icmp eq i32 %conv2, 0, !dbg !775
  br i1 %cmp, label %if.then, label %if.else7, !dbg !776

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !777
  %cmp4 = icmp sge i32 %3, 0, !dbg !780
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !781

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !782
  br label %return, !dbg !782

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !784
  br label %return, !dbg !784

if.else7:                                         ; preds = %entry
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !786
  %conv8 = sext i16 %4 to i64, !dbg !789
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv8), !dbg !790
  %tobool = icmp ne i32 %call, 0, !dbg !790
  br i1 %tobool, label %if.end, label %if.then9, !dbg !791

if.then9:                                         ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !792
  br label %return, !dbg !792

if.end:                                           ; preds = %if.else7
  %5 = load i32, i32* %s32Result, align 4, !dbg !794
  %6 = load i32, i32* %s32Result, align 4, !dbg !796
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !797
  %conv10 = sext i16 %7 to i32, !dbg !798
  %int_cast_to_i64 = zext i32 %conv10 to i64, !dbg !799
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !799
  %div = sdiv i32 %6, %conv10, !dbg !799, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !800
  %conv11 = sext i16 %8 to i32, !dbg !801
  %mul12 = mul nsw i32 %div, %conv11, !dbg !802
  %sub = sub nsw i32 %5, %mul12, !dbg !803
  %conv13 = sext i32 %sub to i64, !dbg !804
  %call14 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv13), !dbg !805
  %tobool15 = icmp ne i32 %call14, 0, !dbg !805
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !806

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !807
  br label %return, !dbg !807

if.end17:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Result, align 4, !dbg !809
  %10 = load i32, i32* %s32Result, align 4, !dbg !811
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !812
  %conv18 = sext i16 %11 to i32, !dbg !813
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !814
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !814
  %div19 = sdiv i32 %10, %conv18, !dbg !814, !klee.check.div !111
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !815
  %conv20 = sext i16 %12 to i32, !dbg !816
  %mul21 = mul nsw i32 %div19, %conv20, !dbg !817
  %sub22 = sub nsw i32 %9, %mul21, !dbg !818
  %conv23 = sext i32 %sub22 to i64, !dbg !819
  %call24 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv23, i32 1), !dbg !820
  %tobool25 = icmp ne i32 %call24, 0, !dbg !820
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !821

if.then26:                                        ; preds = %if.end17
  store i16 0, i16* %retval, align 2, !dbg !822
  br label %return, !dbg !822

if.end27:                                         ; preds = %if.end17
  %13 = load i32, i32* %s32Result, align 4, !dbg !824
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !826
  %conv28 = sext i16 %14 to i32, !dbg !827
  %int_cast_to_i642 = zext i32 %conv28 to i64, !dbg !828
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !828
  %div29 = sdiv i32 %13, %conv28, !dbg !828, !klee.check.div !111
  %conv30 = sext i32 %div29 to i64, !dbg !829
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !830
  %conv31 = sext i16 %15 to i32, !dbg !831
  %conv32 = sext i32 %conv31 to i64, !dbg !832
  %call33 = call i32 @klee_alarm_s32_mul_upper(i64 %conv30, i64 %conv32), !dbg !833
  %tobool34 = icmp ne i32 %call33, 0, !dbg !833
  br i1 %tobool34, label %if.end36, label %if.then35, !dbg !834

if.then35:                                        ; preds = %if.end27
  store i16 0, i16* %retval, align 2, !dbg !835
  br label %return, !dbg !835

if.end36:                                         ; preds = %if.end27
  %16 = load i32, i32* %s32Result, align 4, !dbg !837
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !839
  %conv37 = sext i16 %17 to i32, !dbg !840
  %int_cast_to_i643 = zext i32 %conv37 to i64, !dbg !841
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !841
  %div38 = sdiv i32 %16, %conv37, !dbg !841, !klee.check.div !111
  %conv39 = sext i32 %div38 to i64, !dbg !842
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !843
  %conv40 = sext i16 %18 to i32, !dbg !844
  %conv41 = sext i32 %conv40 to i64, !dbg !845
  %call42 = call i32 @klee_alarm_s32_mul_lower(i64 %conv39, i64 %conv41), !dbg !846
  %tobool43 = icmp ne i32 %call42, 0, !dbg !846
  br i1 %tobool43, label %if.end45, label %if.then44, !dbg !847

if.then44:                                        ; preds = %if.end36
  store i16 0, i16* %retval, align 2, !dbg !848
  br label %return, !dbg !848

if.end45:                                         ; preds = %if.end36
  %19 = load i32, i32* %s32Result, align 4, !dbg !850
  %conv46 = sext i32 %19 to i64, !dbg !852
  %20 = load i32, i32* %s32Result, align 4, !dbg !853
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !854
  %conv47 = sext i16 %21 to i32, !dbg !855
  %int_cast_to_i644 = zext i32 %conv47 to i64, !dbg !856
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !856
  %div48 = sdiv i32 %20, %conv47, !dbg !856, !klee.check.div !111
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !857
  %conv49 = sext i16 %22 to i32, !dbg !858
  %mul50 = mul nsw i32 %div48, %conv49, !dbg !859
  %conv51 = sext i32 %mul50 to i64, !dbg !860
  %call52 = call i32 @klee_alarm_s32_sub_lower(i64 %conv46, i64 %conv51), !dbg !861
  %tobool53 = icmp ne i32 %call52, 0, !dbg !861
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !862

if.then54:                                        ; preds = %if.end45
  store i16 0, i16* %retval, align 2, !dbg !863
  br label %return, !dbg !863

if.end55:                                         ; preds = %if.end45
  %23 = load i32, i32* %s32Result, align 4, !dbg !865
  %24 = load i32, i32* %s32Result, align 4, !dbg !866
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !867
  %conv56 = sext i16 %25 to i32, !dbg !867
  %int_cast_to_i645 = zext i32 %conv56 to i64, !dbg !868
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !868
  %div57 = sdiv i32 %24, %conv56, !dbg !868, !klee.check.div !111
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !869
  %conv58 = sext i16 %26 to i32, !dbg !869
  %mul59 = mul nsw i32 %div57, %conv58, !dbg !870
  %sub60 = sub nsw i32 %23, %mul59, !dbg !871
  %shl = shl i32 %sub60, 1, !dbg !872
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !873
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !874
  %conv61 = sext i16 %27 to i64, !dbg !876
  %call62 = call i32 @klee_alarm_divisor_nonzero(i64 %conv61), !dbg !877
  %tobool63 = icmp ne i32 %call62, 0, !dbg !877
  br i1 %tobool63, label %if.end65, label %if.then64, !dbg !878

if.then64:                                        ; preds = %if.end55
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 769, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !879
  unreachable, !dbg !879

if.end65:                                         ; preds = %if.end55
  %28 = load i32, i32* %s32Result, align 4, !dbg !881
  %29 = load i16, i16* %denominator.addr, align 2, !dbg !882
  %conv66 = sext i16 %29 to i32, !dbg !882
  %int_cast_to_i646 = zext i32 %conv66 to i64, !dbg !883
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !883
  %div67 = sdiv i32 %28, %conv66, !dbg !883, !klee.check.div !111
  %conv68 = sext i32 %div67 to i64, !dbg !884
  store volatile i64 %conv68, i64* @klee_alarm_sink_s64, align 8, !dbg !885
  store i16 0, i16* %retval, align 2, !dbg !886
  br label %return, !dbg !886

return:                                           ; preds = %if.end65, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then9, %if.else, %if.then6
  %30 = load i16, i16* %retval, align 2, !dbg !887
  ret i16 %30, !dbg !887
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !888 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !891, metadata !DIExpression()), !dbg !892
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !893
  %cmp = icmp ne i64 %0, 0, !dbg !894
  %conv = zext i1 %cmp to i32, !dbg !894
  ret i32 %conv, !dbg !895
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !896 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !897, metadata !DIExpression()), !dbg !898
  %0 = load i64, i64* %left.addr, align 8, !dbg !899
  %cmp = icmp sge i64 %0, 0, !dbg !900
  %conv = zext i1 %cmp to i32, !dbg !900
  ret i32 %conv, !dbg !901
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !902 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !905, metadata !DIExpression()), !dbg !906
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !907, metadata !DIExpression()), !dbg !908
  %0 = load i32, i32* %count.addr, align 4, !dbg !909
  %cmp = icmp uge i32 %0, 63, !dbg !911
  br i1 %cmp, label %if.then, label %if.end, !dbg !912

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !913
  br label %return, !dbg !913

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !915
  %2 = load i32, i32* %count.addr, align 4, !dbg !916
  %sh_prom = zext i32 %2 to i64, !dbg !917
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !917
  %shl = shl i64 1, %sh_prom, !dbg !917, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !918
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !919
  %conv = zext i1 %cmp1 to i32, !dbg !919
  store i32 %conv, i32* %retval, align 4, !dbg !920
  br label %return, !dbg !920

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !921
  ret i32 %3, !dbg !921
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !922 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !925, metadata !DIExpression()), !dbg !926
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !927, metadata !DIExpression()), !dbg !928
  %0 = load i64, i64* %left.addr, align 8, !dbg !929
  %1 = load i64, i64* %right.addr, align 8, !dbg !930
  %mul = mul nsw i64 %0, %1, !dbg !931
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !932
  %conv = zext i1 %cmp to i32, !dbg !932
  ret i32 %conv, !dbg !933
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !934 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !935, metadata !DIExpression()), !dbg !936
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !937, metadata !DIExpression()), !dbg !938
  %0 = load i64, i64* %left.addr, align 8, !dbg !939
  %1 = load i64, i64* %right.addr, align 8, !dbg !940
  %mul = mul nsw i64 %0, %1, !dbg !941
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !942
  %conv = zext i1 %cmp to i32, !dbg !942
  ret i32 %conv, !dbg !943
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !944 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !945, metadata !DIExpression()), !dbg !946
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !947, metadata !DIExpression()), !dbg !948
  %0 = load i64, i64* %left.addr, align 8, !dbg !949
  %1 = load i64, i64* %right.addr, align 8, !dbg !950
  %sub = sub nsw i64 %0, %1, !dbg !951
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !952
  %conv = zext i1 %cmp to i32, !dbg !952
  ret i32 %conv, !dbg !953
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !954 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !957, metadata !DIExpression()), !dbg !958
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !959, metadata !DIExpression()), !dbg !960
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !961, metadata !DIExpression()), !dbg !962
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !963, metadata !DIExpression()), !dbg !964
  store i32 0, i32* %s32Result, align 4, !dbg !964
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !965, metadata !DIExpression()), !dbg !966
  store i32 0, i32* %s32Temp1, align 4, !dbg !966
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !967
  %conv = sext i16 %0 to i32, !dbg !967
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !968
  %conv1 = zext i16 %1 to i32, !dbg !968
  %mul = mul nsw i32 %conv, %conv1, !dbg !969
  store i32 %mul, i32* %s32Result, align 4, !dbg !970
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !971
  %conv2 = zext i16 %2 to i32, !dbg !971
  %cmp = icmp eq i32 %conv2, 0, !dbg !973
  br i1 %cmp, label %if.then, label %if.else7, !dbg !974

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !975
  %cmp4 = icmp sge i32 %3, 0, !dbg !978
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !979

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !980
  br label %return, !dbg !980

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !982
  br label %return, !dbg !982

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !984
  %5 = load i32, i32* %s32Result, align 4, !dbg !986
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !987
  %conv8 = zext i16 %6 to i32, !dbg !987
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !988
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !988
  %div = sdiv i32 %5, %conv8, !dbg !988, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !989
  %conv9 = zext i16 %7 to i32, !dbg !989
  %mul10 = mul nsw i32 %div, %conv9, !dbg !990
  %sub = sub nsw i32 %4, %mul10, !dbg !991
  %shl = shl i32 %sub, 1, !dbg !992
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !993
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !994
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !995
  %conv11 = zext i16 %9 to i32, !dbg !995
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !996
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !996
  %div12 = sdiv i32 %8, %conv11, !dbg !996, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !997
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !998
  %conv13 = zext i16 %11 to i32, !dbg !998
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !999
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !999
  %div14 = sdiv i32 %10, %conv13, !dbg !999, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !1000
  store i32 %add, i32* %s32Result, align 4, !dbg !1001
  %12 = load i32, i32* %s32Result, align 4, !dbg !1002
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1004
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1005

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1006
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1009
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1010

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1011
  %conv21 = trunc i32 %14 to i16, !dbg !1013
  store i16 %conv21, i16* %retval, align 2, !dbg !1014
  br label %return, !dbg !1014

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1015
  br label %return, !dbg !1015

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1017
  br label %return, !dbg !1017

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1019
  ret i16 %15, !dbg !1019
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1020 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1023, metadata !DIExpression()), !dbg !1024
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1025, metadata !DIExpression()), !dbg !1026
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1027, metadata !DIExpression()), !dbg !1028
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1029, metadata !DIExpression()), !dbg !1030
  store i32 0, i32* %u32Temp1, align 4, !dbg !1030
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1031, metadata !DIExpression()), !dbg !1032
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1032
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1033
  %conv = zext i16 %0 to i32, !dbg !1033
  %cmp = icmp eq i32 %conv, 0, !dbg !1035
  br i1 %cmp, label %if.then, label %if.else, !dbg !1036

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1037
  br label %return, !dbg !1037

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1039
  %conv2 = zext i16 %1 to i32, !dbg !1039
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1041
  %conv3 = zext i16 %2 to i32, !dbg !1041
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1042
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1043
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1044
  %conv4 = zext i16 %3 to i32, !dbg !1044
  %shr = ashr i32 %conv4, 1, !dbg !1045
  %conv5 = trunc i32 %shr to i16, !dbg !1044
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1046
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1047
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1048
  %conv6 = zext i16 %5 to i32, !dbg !1048
  %add = add i32 %4, %conv6, !dbg !1049
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1050
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1051
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1052
  %conv7 = zext i16 %7 to i32, !dbg !1052
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1053
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1053
  %div = udiv i32 %6, %conv7, !dbg !1053, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1054
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1055
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1057
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1058

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1059
  %and = and i32 %9, 65535, !dbg !1061
  %conv11 = trunc i32 %and to i16, !dbg !1062
  store i16 %conv11, i16* %retval, align 2, !dbg !1063
  br label %return, !dbg !1063

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1064
  br label %return, !dbg !1064

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1066
  ret i16 %10, !dbg !1066
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1067 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1070, metadata !DIExpression()), !dbg !1071
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1072, metadata !DIExpression()), !dbg !1073
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1074, metadata !DIExpression()), !dbg !1075
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1076, metadata !DIExpression()), !dbg !1077
  store i32 0, i32* %u32Temp1, align 4, !dbg !1077
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1078
  %cmp = icmp eq i32 %0, 0, !dbg !1080
  br i1 %cmp, label %if.then, label %if.else, !dbg !1081

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1082
  br label %return, !dbg !1082

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1084
  %conv = zext i16 %1 to i32, !dbg !1084
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1086
  %conv1 = zext i16 %2 to i32, !dbg !1086
  %mul = mul nsw i32 %conv, %conv1, !dbg !1087
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1088
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1089
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1089
  %div = udiv i32 %mul, %3, !dbg !1089, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1090
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1091
  %conv2 = zext i16 %4 to i32, !dbg !1091
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1093
  %conv3 = zext i16 %5 to i32, !dbg !1093
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1094
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1095
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1096
  %mul5 = mul i32 %6, %7, !dbg !1097
  %sub = sub i32 %mul4, %mul5, !dbg !1098
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1099
  %div6 = udiv i32 %8, 2, !dbg !1100
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1101
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1102

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1103
  %inc = add i32 %9, 1, !dbg !1103
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1103
  br label %if.end, !dbg !1105

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1106
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1108
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1109

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1110
  %and = and i32 %11, 65535, !dbg !1112
  %conv13 = trunc i32 %and to i16, !dbg !1113
  store i16 %conv13, i16* %retval, align 2, !dbg !1114
  br label %return, !dbg !1114

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1117
  ret i16 %12, !dbg !1117
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1118 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1125, metadata !DIExpression()), !dbg !1126
  store i32 0, i32* %u32Temp1, align 4, !dbg !1126
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1127
  %conv = zext i16 %0 to i32, !dbg !1127
  %cmp = icmp eq i32 %conv, 0, !dbg !1129
  br i1 %cmp, label %if.then, label %if.else, !dbg !1130

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1131
  br label %return, !dbg !1131

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1133
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1135
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1136
  %conv2 = zext i16 %3 to i32, !dbg !1136
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1137
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1137
  %div = udiv i32 %2, %conv2, !dbg !1137, !klee.check.div !111
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1138
  %conv3 = zext i16 %4 to i32, !dbg !1138
  %mul = mul i32 %div, %conv3, !dbg !1139
  %sub = sub i32 %1, %mul, !dbg !1140
  %shl = shl i32 %sub, 1, !dbg !1141
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1142
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1143
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1144
  %conv4 = zext i16 %6 to i32, !dbg !1144
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1145
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1145
  %div5 = udiv i32 %5, %conv4, !dbg !1145, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1146
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1147
  %conv6 = zext i16 %8 to i32, !dbg !1147
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1148
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1148
  %div7 = udiv i32 %7, %conv6, !dbg !1148, !klee.check.div !111
  %add = add i32 %div5, %div7, !dbg !1149
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1150
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1151
  store i32 %9, i32* %retval, align 4, !dbg !1152
  br label %return, !dbg !1152

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1153
  ret i32 %10, !dbg !1153
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1154 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1157, metadata !DIExpression()), !dbg !1158
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1159, metadata !DIExpression()), !dbg !1160
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1161, metadata !DIExpression()), !dbg !1162
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1163, metadata !DIExpression()), !dbg !1164
  store i32 0, i32* %s32Temp1, align 4, !dbg !1164
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1165, metadata !DIExpression()), !dbg !1166
  store i32 0, i32* %s32Temp2, align 4, !dbg !1166
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1167, metadata !DIExpression()), !dbg !1168
  store i32 0, i32* %s32Temp3, align 4, !dbg !1168
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1169
  %conv = sext i16 %0 to i32, !dbg !1169
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1170
  %conv1 = sext i16 %1 to i32, !dbg !1170
  %mul = mul nsw i32 %conv, %conv1, !dbg !1171
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1172
  %2 = load i16, i16* %div.addr, align 2, !dbg !1173
  %conv2 = sext i16 %2 to i32, !dbg !1173
  %cmp = icmp eq i32 %conv2, 0, !dbg !1175
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1176

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1177
  %cmp4 = icmp slt i32 %3, 0, !dbg !1180
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1181

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1182
  br label %return, !dbg !1182

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1184
  br label %return, !dbg !1184

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1186
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1188
  %6 = load i16, i16* %div.addr, align 2, !dbg !1189
  %conv8 = sext i16 %6 to i32, !dbg !1189
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1190
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1190
  %div9 = sdiv i32 %5, %conv8, !dbg !1190, !klee.check.div !111
  %7 = load i16, i16* %div.addr, align 2, !dbg !1191
  %conv10 = sext i16 %7 to i32, !dbg !1191
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1192
  %sub = sub nsw i32 %4, %mul11, !dbg !1193
  %shl = shl i32 %sub, 1, !dbg !1194
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1195
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1196
  %9 = load i16, i16* %div.addr, align 2, !dbg !1197
  %conv12 = sext i16 %9 to i32, !dbg !1197
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1198
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1198
  %div13 = sdiv i32 %8, %conv12, !dbg !1198, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1199
  %11 = load i16, i16* %div.addr, align 2, !dbg !1200
  %conv14 = sext i16 %11 to i32, !dbg !1200
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1201
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1201
  %div15 = sdiv i32 %10, %conv14, !dbg !1201, !klee.check.div !111
  %add = add nsw i32 %div13, %div15, !dbg !1202
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1203
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1204
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1206
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1207

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1208
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1211
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1212

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1213
  %conv22 = trunc i32 %14 to i16, !dbg !1215
  store i16 %conv22, i16* %retval, align 2, !dbg !1216
  br label %return, !dbg !1216

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1217
  br label %return, !dbg !1217

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1219
  br label %return, !dbg !1219

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1221
  ret i16 %15, !dbg !1221
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1222 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1225, metadata !DIExpression()), !dbg !1226
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1227, metadata !DIExpression()), !dbg !1228
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1229, metadata !DIExpression()), !dbg !1230
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1231, metadata !DIExpression()), !dbg !1232
  store i32 0, i32* %s32Result, align 4, !dbg !1232
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1233, metadata !DIExpression()), !dbg !1234
  store i32 0, i32* %s32Temp1, align 4, !dbg !1234
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1235
  %conv = sext i16 %0 to i32, !dbg !1235
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1236
  %conv1 = sext i16 %1 to i32, !dbg !1236
  %mul = mul nsw i32 %conv, %conv1, !dbg !1237
  store i32 %mul, i32* %s32Result, align 4, !dbg !1238
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1239
  %conv2 = zext i16 %2 to i32, !dbg !1239
  %cmp = icmp eq i32 %conv2, 0, !dbg !1241
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1242

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1243
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1246
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1247

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1248
  br label %return, !dbg !1248

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1250
  %cmp7 = icmp eq i32 %4, 0, !dbg !1252
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1253

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1254
  br label %return, !dbg !1254

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1256
  br label %return, !dbg !1256

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1258
  %6 = load i32, i32* %s32Result, align 4, !dbg !1260
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1261
  %conv12 = zext i16 %7 to i32, !dbg !1261
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1262
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1262
  %div = sdiv i32 %6, %conv12, !dbg !1262, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1263
  %conv13 = zext i16 %8 to i32, !dbg !1263
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1264
  %sub = sub nsw i32 %5, %mul14, !dbg !1265
  %shl = shl i32 %sub, 1, !dbg !1266
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1267
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1268
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1269
  %conv15 = zext i16 %10 to i32, !dbg !1269
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1270
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1270
  %div16 = sdiv i32 %9, %conv15, !dbg !1270, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1271
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1272
  %conv17 = zext i16 %12 to i32, !dbg !1272
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1273
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1273
  %div18 = sdiv i32 %11, %conv17, !dbg !1273, !klee.check.div !111
  %add = add nsw i32 %div16, %div18, !dbg !1274
  store i32 %add, i32* %s32Result, align 4, !dbg !1275
  %13 = load i32, i32* %s32Result, align 4, !dbg !1276
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1278
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1279

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1280
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1283
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1284

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1285
  %conv25 = trunc i32 %15 to i16, !dbg !1287
  store i16 %conv25, i16* %retval, align 2, !dbg !1288
  br label %return, !dbg !1288

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1289
  br label %return, !dbg !1289

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1291
  br label %return, !dbg !1291

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1293
  ret i16 %16, !dbg !1293
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1294 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1297, metadata !DIExpression()), !dbg !1298
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1299, metadata !DIExpression()), !dbg !1300
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1301, metadata !DIExpression()), !dbg !1302
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1303
  %cmp = icmp eq i32 %0, 0, !dbg !1305
  br i1 %cmp, label %if.then, label %if.else, !dbg !1306

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1307
  br label %return, !dbg !1307

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1309
  %cmp1 = icmp sle i32 %1, 0, !dbg !1312
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1313

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1320
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1320
  %div = udiv i32 %3, %4, !dbg !1320, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %mul = mul i32 %div, %5, !dbg !1322
  %sub = sub i32 %2, %mul, !dbg !1323
  %shl = shl i32 %sub, 1, !dbg !1324
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1325
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1326
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1328
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1328
  %div4 = udiv i32 %6, %7, !dbg !1328, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1329
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1330
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1331
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1331
  %div5 = udiv i32 %8, %9, !dbg !1331, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1332
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1333
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1334
  store i32 %10, i32* %retval, align 4, !dbg !1335
  br label %return, !dbg !1335

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1336
  ret i32 %11, !dbg !1336
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1337 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1340, metadata !DIExpression()), !dbg !1341
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1342, metadata !DIExpression()), !dbg !1343
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1344, metadata !DIExpression()), !dbg !1345
  store i32 0, i32* %s32Temp1, align 4, !dbg !1345
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1346
  %cmp = icmp eq i32 %0, 0, !dbg !1348
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1349

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1350
  %cmp1 = icmp sge i32 %1, 0, !dbg !1353
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1354

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1355
  br label %return, !dbg !1355

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1357
  br label %return, !dbg !1357

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1359
  %cmp4 = icmp sge i32 %2, 0, !dbg !1362
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1363

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1364
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1366
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1367
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1368
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1368
  %div = udiv i32 %4, %5, !dbg !1368, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1369
  %mul = mul i32 %div, %6, !dbg !1370
  %sub = sub i32 %3, %mul, !dbg !1371
  %shl = shl i32 %sub, 1, !dbg !1372
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1373
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1374
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1375
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1376
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1376
  %div6 = udiv i32 %7, %8, !dbg !1376, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1377
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1378
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1379
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1379
  %div7 = udiv i32 %9, %10, !dbg !1379, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1380
  store i32 %add, i32* %retval, align 4, !dbg !1381
  br label %return, !dbg !1381

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1382
  br label %return, !dbg !1382

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1384
  ret i32 %11, !dbg !1384
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1385 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1388, metadata !DIExpression()), !dbg !1389
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1390, metadata !DIExpression()), !dbg !1391
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1392, metadata !DIExpression()), !dbg !1393
  store i32 0, i32* %u32Temp1, align 4, !dbg !1393
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1394, metadata !DIExpression()), !dbg !1395
  store i32 0, i32* %u32Temp2, align 4, !dbg !1395
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1396
  %cmp = icmp eq i32 %0, 0, !dbg !1398
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1399

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %cmp1 = icmp slt i32 %1, 0, !dbg !1403
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1404

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1407
  br label %return, !dbg !1407

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1409
  %cmp4 = icmp sge i32 %2, 0, !dbg !1412
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1413

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1414
  %cmp6 = icmp eq i32 %3, 0, !dbg !1417
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1418

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1419
  br label %return, !dbg !1419

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1421
  %cmp9 = icmp sle i32 %4, 0, !dbg !1424
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1425

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1426
  br label %return, !dbg !1426

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1428
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1430
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1431
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1432
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1432
  %div = sdiv i32 %6, %7, !dbg !1432, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1433
  %mul = mul nsw i32 %div, %8, !dbg !1434
  %sub = sub nsw i32 %5, %mul, !dbg !1435
  %shl = shl i32 %sub, 1, !dbg !1436
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1437
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1438
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1440
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1440
  %div12 = udiv i32 %9, %10, !dbg !1440, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1441
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1442
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1443
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1443
  %div13 = sdiv i32 %11, %12, !dbg !1443, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1444
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1445
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1446
  store i32 %13, i32* %retval, align 4, !dbg !1447
  br label %return, !dbg !1447

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1451
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1452

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1453
  br label %return, !dbg !1453

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1455
  %sub18 = sub nsw i32 0, %15, !dbg !1457
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1458
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %sub19 = sub nsw i32 0, %16, !dbg !1460
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1461
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1462
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1463
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1465
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1465
  %div20 = sdiv i32 %18, %19, !dbg !1465, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %mul21 = mul nsw i32 %div20, %20, !dbg !1467
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1468
  %shl23 = shl i32 %sub22, 1, !dbg !1469
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1470
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1471
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1472
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1473
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1473
  %div24 = udiv i32 %21, %22, !dbg !1473, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1476
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1476
  %div25 = sdiv i32 %23, %24, !dbg !1476, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1477
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1478
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1479
  store i32 %25, i32* %retval, align 4, !dbg !1480
  br label %return, !dbg !1480

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1481
  ret i32 %26, !dbg !1481
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1482 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1485, metadata !DIExpression()), !dbg !1486
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1487, metadata !DIExpression()), !dbg !1488
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1489, metadata !DIExpression()), !dbg !1490
  store i32 0, i32* %u32Temp1, align 4, !dbg !1490
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1491, metadata !DIExpression()), !dbg !1492
  store i32 0, i32* %u32Temp2, align 4, !dbg !1492
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1493, metadata !DIExpression()), !dbg !1494
  store i32 0, i32* %u32Temp3, align 4, !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 0, i32* %numerator_old, align 4, !dbg !1496
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1497
  %cmp = icmp eq i32 %0, 0, !dbg !1499
  br i1 %cmp, label %if.then, label %if.else, !dbg !1500

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1501
  br label %return, !dbg !1501

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1503
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1505
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1506
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1507
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1508
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1508
  %div = udiv i32 %3, %4, !dbg !1508, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1509
  %sub = sub i32 %1, %mul, !dbg !1510
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1511
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1512
  %and = and i32 %5, 1, !dbg !1514
  %cmp1 = icmp eq i32 %and, 0, !dbg !1515
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1516

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1517
  %shr = lshr i32 %6, 1, !dbg !1519
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1520
  br label %if.end, !dbg !1521

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %shr4 = lshr i32 %7, 1, !dbg !1524
  %add = add i32 %shr4, 1, !dbg !1525
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1526
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1527
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1530
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1531

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1532
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1535
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1535
  %div7 = udiv i32 %10, %11, !dbg !1535, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1536
  br label %return, !dbg !1536

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1537
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1540
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1540
  %div9 = udiv i32 %12, %13, !dbg !1540, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1541
  store i32 %add10, i32* %retval, align 4, !dbg !1542
  br label %return, !dbg !1542

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1543
  ret i32 %14, !dbg !1543
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1544 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1547, metadata !DIExpression()), !dbg !1548
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1549, metadata !DIExpression()), !dbg !1550
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1551, metadata !DIExpression()), !dbg !1552
  store i32 0, i32* %u32Temp1, align 4, !dbg !1552
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1553, metadata !DIExpression()), !dbg !1554
  store i32 0, i32* %u32Temp2, align 4, !dbg !1554
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1555
  %cmp = icmp sle i32 %0, 0, !dbg !1557
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1558

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %cmp1 = icmp sge i32 %1, 0, !dbg !1562
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1563

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1564
  br label %return, !dbg !1564

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %sub = sub nsw i32 0, %2, !dbg !1568
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1569
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1570
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1571
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1572
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1573
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1573
  %div = udiv i32 %4, %5, !dbg !1573, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %mul = mul i32 %div, %6, !dbg !1575
  %sub3 = sub i32 %3, %mul, !dbg !1576
  %shl = shl i32 %sub3, 1, !dbg !1577
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1578
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1579
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1580
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1581
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1581
  %div4 = udiv i32 %7, %8, !dbg !1581, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1582
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1584
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1584
  %div5 = udiv i32 %9, %10, !dbg !1584, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1585
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1586
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1587
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1589
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1590

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1591
  %sub8 = sub i32 0, %12, !dbg !1593
  store i32 %sub8, i32* %retval, align 4, !dbg !1594
  br label %return, !dbg !1594

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1595
  br label %return, !dbg !1595

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1597
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1599
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1600
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1601
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1601
  %div11 = udiv i32 %14, %15, !dbg !1601, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1602
  %mul12 = mul i32 %div11, %16, !dbg !1603
  %sub13 = sub i32 %13, %mul12, !dbg !1604
  %shl14 = shl i32 %sub13, 1, !dbg !1605
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1606
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1607
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1608
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1609
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1609
  %div15 = udiv i32 %17, %18, !dbg !1609, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1610
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1611
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1612
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1612
  %div16 = udiv i32 %19, %20, !dbg !1612, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1613
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1614
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1615
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1617
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1618

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1619
  store i32 %22, i32* %retval, align 4, !dbg !1621
  br label %return, !dbg !1621

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1622
  br label %return, !dbg !1622

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1624
  ret i32 %23, !dbg !1624
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1625 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1628, metadata !DIExpression()), !dbg !1629
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1630, metadata !DIExpression()), !dbg !1631
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1632, metadata !DIExpression()), !dbg !1633
  store i32 0, i32* %s32Temp1, align 4, !dbg !1633
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1634, metadata !DIExpression()), !dbg !1635
  store i32 0, i32* %s32Temp2, align 4, !dbg !1635
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1636, metadata !DIExpression()), !dbg !1637
  store i32 0, i32* %u32Temp0, align 4, !dbg !1637
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1638, metadata !DIExpression()), !dbg !1639
  store i32 0, i32* %u32Temp1, align 4, !dbg !1639
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1640, metadata !DIExpression()), !dbg !1641
  store i32 0, i32* %u32Temp2, align 4, !dbg !1641
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1642
  %cmp = icmp eq i32 %0, 0, !dbg !1644
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1645

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1646
  %cmp1 = icmp slt i32 %1, 0, !dbg !1649
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1650

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1651
  br label %return, !dbg !1651

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1653
  br label %return, !dbg !1653

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1655
  %cmp4 = icmp sle i32 %2, 0, !dbg !1658
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1659

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1660
  %sub = sub nsw i32 0, %3, !dbg !1662
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1663
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1664
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1665
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1666
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1666
  %div = udiv i32 %4, %5, !dbg !1666, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1667
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1668
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1669
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1670
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1671
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1671
  %div6 = udiv i32 %7, %8, !dbg !1671, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %mul = mul i32 %div6, %9, !dbg !1673
  %sub7 = sub i32 %6, %mul, !dbg !1674
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1675
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1676
  %and = and i32 %10, 1, !dbg !1678
  %cmp8 = icmp eq i32 %and, 0, !dbg !1679
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1680

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1681
  %shr = lshr i32 %11, 1, !dbg !1683
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1684
  br label %if.end, !dbg !1685

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1686
  %shr11 = lshr i32 %12, 1, !dbg !1688
  %add = add i32 %shr11, 1, !dbg !1689
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1690
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1691
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1693
  %cmp12 = icmp ult i32 %13, %14, !dbg !1694
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1695

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1696
  %neg = xor i32 %15, -1, !dbg !1698
  %add14 = add i32 %neg, 1, !dbg !1699
  store i32 %add14, i32* %retval, align 4, !dbg !1700
  br label %return, !dbg !1700

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1701
  %add16 = add i32 %16, 1, !dbg !1703
  %neg17 = xor i32 %add16, -1, !dbg !1704
  %add18 = add i32 %neg17, 1, !dbg !1705
  store i32 %add18, i32* %retval, align 4, !dbg !1706
  br label %return, !dbg !1706

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1707
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1709
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1710
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1711
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1711
  %div20 = udiv i32 %18, %19, !dbg !1711, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %mul21 = mul i32 %div20, %20, !dbg !1713
  %sub22 = sub i32 %17, %mul21, !dbg !1714
  %shl = shl i32 %sub22, 1, !dbg !1715
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1716
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1717
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1718
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1719
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1719
  %div23 = udiv i32 %21, %22, !dbg !1719, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1720
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1721
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1722
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1722
  %div24 = udiv i32 %23, %24, !dbg !1722, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1723
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1724
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1725
  store i32 %25, i32* %retval, align 4, !dbg !1726
  br label %return, !dbg !1726

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1727
  ret i32 %26, !dbg !1727
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1728 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1731, metadata !DIExpression()), !dbg !1732
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1733, metadata !DIExpression()), !dbg !1734
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1735, metadata !DIExpression()), !dbg !1736
  store i32 0, i32* %s32Temp1, align 4, !dbg !1736
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1737, metadata !DIExpression()), !dbg !1738
  store i32 0, i32* %s32Temp2, align 4, !dbg !1738
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1739, metadata !DIExpression()), !dbg !1740
  store i32 0, i32* %denominator_prime, align 4, !dbg !1740
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1741, metadata !DIExpression()), !dbg !1742
  store i32 0, i32* %u32Temp1, align 4, !dbg !1742
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1743, metadata !DIExpression()), !dbg !1744
  store i32 0, i32* %u32Temp2, align 4, !dbg !1744
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1745, metadata !DIExpression()), !dbg !1746
  store i32 0, i32* %u32numerator, align 4, !dbg !1746
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1747, metadata !DIExpression()), !dbg !1748
  store i32 0, i32* %u32denominator, align 4, !dbg !1748
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1749
  %cmp = icmp slt i32 %0, 0, !dbg !1751
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1752

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1753
  %cmp1 = icmp sle i32 %1, 0, !dbg !1756
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1757

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1758
  %cmp3 = icmp sge i32 %2, 0, !dbg !1761
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1762

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1763
  br label %return, !dbg !1763

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1765
  %sub = sub nsw i32 0, %3, !dbg !1767
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1768
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1769
  %sub5 = sub nsw i32 0, %4, !dbg !1770
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1771
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1772
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1773
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1774
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1775
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1775
  %div = udiv i32 %6, %7, !dbg !1775, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1776
  %mul = mul i32 %div, %8, !dbg !1777
  %sub6 = sub i32 %5, %mul, !dbg !1778
  %shl = shl i32 %sub6, 1, !dbg !1779
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1780
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1781
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1782
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1783
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1783
  %div7 = udiv i32 %9, %10, !dbg !1783, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1784
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1785
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1786
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1786
  %div8 = udiv i32 %11, %12, !dbg !1786, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1787
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1788
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1789
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1791
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1792

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1793
  store i32 %14, i32* %retval, align 4, !dbg !1795
  br label %return, !dbg !1795

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1796
  br label %return, !dbg !1796

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1798
  %neg = xor i32 %15, -1, !dbg !1800
  %add13 = add nsw i32 %neg, 1, !dbg !1801
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1802
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1803
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1804
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1805
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1806
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1806
  %div14 = udiv i32 %17, %18, !dbg !1806, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1807
  %mul15 = mul i32 %div14, %19, !dbg !1808
  %sub16 = sub i32 %16, %mul15, !dbg !1809
  %shl17 = shl i32 %sub16, 1, !dbg !1810
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1811
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1812
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1813
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1814
  %div18 = udiv i32 %20, %21, !dbg !1814, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1815
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1817
  %div19 = sdiv i32 %22, %23, !dbg !1817, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1818
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1819
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1820
  %neg21 = xor i32 %24, -1, !dbg !1821
  %add22 = add nsw i32 %neg21, 1, !dbg !1822
  store i32 %add22, i32* %retval, align 4, !dbg !1823
  br label %return, !dbg !1823

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %cmp24 = icmp sle i32 %25, 0, !dbg !1827
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1828

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1829
  %cmp26 = icmp sge i32 %26, 0, !dbg !1832
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1833

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1834
  br label %return, !dbg !1834

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %neg29 = xor i32 %27, -1, !dbg !1838
  %add30 = add nsw i32 %neg29, 1, !dbg !1839
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1840
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1841
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1842
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1843
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1844
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1844
  %div31 = udiv i32 %29, %30, !dbg !1844, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1845
  %mul32 = mul i32 %div31, %31, !dbg !1846
  %sub33 = sub i32 %28, %mul32, !dbg !1847
  %shl34 = shl i32 %sub33, 1, !dbg !1848
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1849
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1850
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1851
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1852
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1852
  %div35 = udiv i32 %32, %33, !dbg !1852, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1853
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1854
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1855
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1855
  %div36 = udiv i32 %34, %35, !dbg !1855, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1856
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1857
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1858
  %neg38 = xor i32 %36, -1, !dbg !1859
  %add39 = add nsw i32 %neg38, 1, !dbg !1860
  store i32 %add39, i32* %retval, align 4, !dbg !1861
  br label %return, !dbg !1861

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1862
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1864
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1865
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1866
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1866
  %div41 = sdiv i32 %38, %39, !dbg !1866, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %mul42 = mul nsw i32 %div41, %40, !dbg !1868
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1869
  %shl44 = shl i32 %sub43, 1, !dbg !1870
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1871
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1872
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1873
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1874
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1874
  %div45 = sdiv i32 %41, %42, !dbg !1874, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1875
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1876
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1877
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1877
  %div46 = udiv i32 %43, %44, !dbg !1877, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1878
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1879
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1880
  store i32 %45, i32* %retval, align 4, !dbg !1881
  br label %return, !dbg !1881

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1882
  ret i32 %46, !dbg !1882
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1883 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1886, metadata !DIExpression()), !dbg !1887
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1888, metadata !DIExpression()), !dbg !1889
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1890, metadata !DIExpression()), !dbg !1891
  store i32 0, i32* %numerator_prime, align 4, !dbg !1891
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1892, metadata !DIExpression()), !dbg !1893
  store i32 0, i32* %u32Temp1, align 4, !dbg !1893
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1894, metadata !DIExpression()), !dbg !1895
  store i32 0, i32* %u32Temp2, align 4, !dbg !1895
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1896, metadata !DIExpression()), !dbg !1897
  store i32 0, i32* %u32Temp3, align 4, !dbg !1897
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1898, metadata !DIExpression()), !dbg !1899
  store i32 0, i32* %s32Temp1, align 4, !dbg !1899
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1900, metadata !DIExpression()), !dbg !1901
  store i32 0, i32* %s32Temp2, align 4, !dbg !1901
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1902, metadata !DIExpression()), !dbg !1903
  store i32 0, i32* %s32Temp3, align 4, !dbg !1903
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1904
  %cmp = icmp eq i32 %0, 0, !dbg !1906
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1907

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1908
  %cmp1 = icmp slt i32 %1, 0, !dbg !1911
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1912

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1913
  br label %return, !dbg !1913

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1915
  br label %return, !dbg !1915

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1917
  %cmp4 = icmp slt i32 %2, 0, !dbg !1920
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1921

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1922
  %sub = sub nsw i32 0, %3, !dbg !1924
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1925
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1926
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1927
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1928
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1928
  %div = udiv i32 %4, %5, !dbg !1928, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1929
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1930
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1931
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %mul = mul i32 %7, %8, !dbg !1933
  %sub6 = sub i32 %6, %mul, !dbg !1934
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1935
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1936
  %and = and i32 %9, 1, !dbg !1938
  %cmp7 = icmp eq i32 %and, 0, !dbg !1939
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1940

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1941
  %shr = lshr i32 %10, 1, !dbg !1943
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1944
  br label %if.end, !dbg !1945

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %shr10 = lshr i32 %11, 1, !dbg !1948
  %add = add i32 %shr10, 1, !dbg !1949
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1950
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1951
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1953
  %cmp11 = icmp ult i32 %12, %13, !dbg !1954
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1955

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1956
  %neg = xor i32 %14, -1, !dbg !1958
  %add13 = add i32 %neg, 1, !dbg !1959
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1960
  br label %if.end18, !dbg !1961

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1962
  %add15 = add i32 %15, 1, !dbg !1964
  %neg16 = xor i32 %add15, -1, !dbg !1965
  %add17 = add i32 %neg16, 1, !dbg !1966
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1967
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1968
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1970
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1971

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1972
  %conv = trunc i32 %17 to i16, !dbg !1974
  store i16 %conv, i16* %retval, align 2, !dbg !1975
  br label %return, !dbg !1975

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1976
  br label %return, !dbg !1976

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1978
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1980
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1981
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1981
  %div23 = udiv i32 %18, %19, !dbg !1981, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1982
  %mul24 = mul i32 %div23, %20, !dbg !1983
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1984
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1985
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1986
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1987
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1988
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1988
  %div25 = udiv i32 %22, %23, !dbg !1988, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1989
  %mul26 = mul i32 %div25, %24, !dbg !1990
  %sub27 = sub i32 %21, %mul26, !dbg !1991
  %shl = shl i32 %sub27, 1, !dbg !1992
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1993
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1994
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1995
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1996
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1996
  %div28 = udiv i32 %25, %26, !dbg !1996, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1997
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1998
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1999
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1999
  %div29 = udiv i32 %27, %28, !dbg !1999, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !2000
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2001
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2002
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2004
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2005

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2006
  %conv34 = trunc i32 %30 to i16, !dbg !2008
  store i16 %conv34, i16* %retval, align 2, !dbg !2009
  br label %return, !dbg !2009

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2010
  br label %return, !dbg !2010

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2012
  ret i16 %31, !dbg !2012
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2013 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2019, metadata !DIExpression()), !dbg !2020
  %2 = icmp eq i64 %0, 0, !dbg !2021
  br i1 %2, label %3, label %4, !dbg !2023

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2024
  unreachable, !dbg !2024

4:                                                ; preds = %1
  ret void, !dbg !2025
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2026 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2032, metadata !DIExpression()), !dbg !2034
  call void @llvm.dbg.value(metadata i64 %1, metadata !2033, metadata !DIExpression()), !dbg !2034
  %3 = icmp ult i64 %1, %0, !dbg !2035
  br i1 %3, label %5, label %4, !dbg !2037

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2038
  unreachable, !dbg !2038

5:                                                ; preds = %2
  ret void, !dbg !2040
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132/div_Ccode_alarm_0132.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "factor1", scope: !48, file: !49, line: 9, type: !8)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "factor2", scope: !48, file: !49, line: 10, type: !19)
!55 = !DILocation(line: 10, column: 14, scope: !48)
!56 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 11, type: !8)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 12, type: !19)
!59 = !DILocation(line: 12, column: 14, scope: !48)
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
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132")
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
!648 = !DILocation(line: 628, column: 14, scope: !649)
!649 = distinct !DILexicalBlock(scope: !636, file: !74, line: 627, column: 2)
!650 = !DILocation(line: 628, column: 27, scope: !649)
!651 = !DILocation(line: 628, column: 37, scope: !649)
!652 = !DILocation(line: 628, column: 36, scope: !649)
!653 = !DILocation(line: 628, column: 50, scope: !649)
!654 = !DILocation(line: 628, column: 49, scope: !649)
!655 = !DILocation(line: 628, column: 24, scope: !649)
!656 = !DILocation(line: 628, column: 12, scope: !649)
!657 = !DILocation(line: 629, column: 14, scope: !649)
!658 = !DILocation(line: 629, column: 23, scope: !649)
!659 = !DILocation(line: 629, column: 12, scope: !649)
!660 = !DILocation(line: 630, column: 16, scope: !649)
!661 = !DILocation(line: 630, column: 25, scope: !649)
!662 = !DILocation(line: 630, column: 24, scope: !649)
!663 = !DILocation(line: 630, column: 41, scope: !649)
!664 = !DILocation(line: 630, column: 51, scope: !649)
!665 = !DILocation(line: 630, column: 50, scope: !649)
!666 = !DILocation(line: 630, column: 38, scope: !649)
!667 = !DILocation(line: 630, column: 13, scope: !649)
!668 = !DILocation(line: 631, column: 6, scope: !669)
!669 = distinct !DILexicalBlock(scope: !649, file: !74, line: 631, column: 6)
!670 = !DILocation(line: 631, column: 16, scope: !669)
!671 = !DILocation(line: 631, column: 6, scope: !649)
!672 = !DILocation(line: 633, column: 7, scope: !673)
!673 = distinct !DILexicalBlock(scope: !674, file: !74, line: 633, column: 7)
!674 = distinct !DILexicalBlock(scope: !669, file: !74, line: 632, column: 3)
!675 = !DILocation(line: 633, column: 17, scope: !673)
!676 = !DILocation(line: 633, column: 7, scope: !674)
!677 = !DILocation(line: 635, column: 17, scope: !678)
!678 = distinct !DILexicalBlock(scope: !673, file: !74, line: 634, column: 4)
!679 = !DILocation(line: 635, column: 12, scope: !678)
!680 = !DILocation(line: 635, column: 5, scope: !678)
!681 = !DILocation(line: 640, column: 5, scope: !682)
!682 = distinct !DILexicalBlock(scope: !673, file: !74, line: 639, column: 4)
!683 = !DILocation(line: 645, column: 4, scope: !684)
!684 = distinct !DILexicalBlock(scope: !669, file: !74, line: 644, column: 3)
!685 = !DILocation(line: 649, column: 1, scope: !618)
!686 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !74, file: !74, line: 667, type: !687, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!687 = !DISubroutineType(types: !688)
!688 = !{!6, !18, !6, !18}
!689 = !DILocalVariable(name: "factor1", arg: 1, scope: !686, file: !74, line: 667, type: !18)
!690 = !DILocation(line: 667, column: 33, scope: !686)
!691 = !DILocalVariable(name: "factor2", arg: 2, scope: !686, file: !74, line: 667, type: !6)
!692 = !DILocation(line: 667, column: 46, scope: !686)
!693 = !DILocalVariable(name: "denominator", arg: 3, scope: !686, file: !74, line: 667, type: !18)
!694 = !DILocation(line: 667, column: 59, scope: !686)
!695 = !DILocalVariable(name: "s32Result", scope: !686, file: !74, line: 669, type: !25)
!696 = !DILocation(line: 669, column: 6, scope: !686)
!697 = !DILocalVariable(name: "s32Temp1", scope: !686, file: !74, line: 669, type: !25)
!698 = !DILocation(line: 669, column: 21, scope: !686)
!699 = !DILocation(line: 670, column: 14, scope: !686)
!700 = !DILocation(line: 670, column: 24, scope: !686)
!701 = !DILocation(line: 670, column: 22, scope: !686)
!702 = !DILocation(line: 670, column: 12, scope: !686)
!703 = !DILocation(line: 671, column: 5, scope: !704)
!704 = distinct !DILexicalBlock(scope: !686, file: !74, line: 671, column: 5)
!705 = !DILocation(line: 671, column: 16, scope: !704)
!706 = !DILocation(line: 671, column: 5, scope: !686)
!707 = !DILocation(line: 673, column: 6, scope: !708)
!708 = distinct !DILexicalBlock(scope: !709, file: !74, line: 673, column: 6)
!709 = distinct !DILexicalBlock(scope: !704, file: !74, line: 672, column: 2)
!710 = !DILocation(line: 673, column: 16, scope: !708)
!711 = !DILocation(line: 673, column: 6, scope: !709)
!712 = !DILocation(line: 675, column: 4, scope: !713)
!713 = distinct !DILexicalBlock(scope: !708, file: !74, line: 674, column: 3)
!714 = !DILocation(line: 679, column: 4, scope: !715)
!715 = distinct !DILexicalBlock(scope: !708, file: !74, line: 678, column: 3)
!716 = !DILocation(line: 684, column: 14, scope: !717)
!717 = distinct !DILexicalBlock(scope: !704, file: !74, line: 683, column: 2)
!718 = !DILocation(line: 684, column: 28, scope: !717)
!719 = !DILocation(line: 684, column: 38, scope: !717)
!720 = !DILocation(line: 684, column: 37, scope: !717)
!721 = !DILocation(line: 684, column: 53, scope: !717)
!722 = !DILocation(line: 684, column: 51, scope: !717)
!723 = !DILocation(line: 684, column: 24, scope: !717)
!724 = !DILocation(line: 684, column: 66, scope: !717)
!725 = !DILocation(line: 684, column: 12, scope: !717)
!726 = !DILocation(line: 685, column: 16, scope: !717)
!727 = !DILocation(line: 685, column: 25, scope: !717)
!728 = !DILocation(line: 685, column: 24, scope: !717)
!729 = !DILocation(line: 685, column: 41, scope: !717)
!730 = !DILocation(line: 685, column: 51, scope: !717)
!731 = !DILocation(line: 685, column: 50, scope: !717)
!732 = !DILocation(line: 685, column: 38, scope: !717)
!733 = !DILocation(line: 685, column: 13, scope: !717)
!734 = !DILocation(line: 686, column: 6, scope: !735)
!735 = distinct !DILexicalBlock(scope: !717, file: !74, line: 686, column: 6)
!736 = !DILocation(line: 686, column: 16, scope: !735)
!737 = !DILocation(line: 686, column: 6, scope: !717)
!738 = !DILocation(line: 688, column: 7, scope: !739)
!739 = distinct !DILexicalBlock(scope: !740, file: !74, line: 688, column: 7)
!740 = distinct !DILexicalBlock(scope: !735, file: !74, line: 687, column: 3)
!741 = !DILocation(line: 688, column: 17, scope: !739)
!742 = !DILocation(line: 688, column: 7, scope: !740)
!743 = !DILocation(line: 690, column: 17, scope: !744)
!744 = distinct !DILexicalBlock(scope: !739, file: !74, line: 689, column: 4)
!745 = !DILocation(line: 690, column: 12, scope: !744)
!746 = !DILocation(line: 690, column: 5, scope: !744)
!747 = !DILocation(line: 694, column: 5, scope: !748)
!748 = distinct !DILexicalBlock(scope: !739, file: !74, line: 693, column: 4)
!749 = !DILocation(line: 699, column: 4, scope: !750)
!750 = distinct !DILexicalBlock(scope: !735, file: !74, line: 698, column: 3)
!751 = !DILocation(line: 702, column: 1, scope: !686)
!752 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !74, file: !74, line: 721, type: !753, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!753 = !DISubroutineType(types: !754)
!754 = !{!18, !6, !18, !6}
!755 = !DILocalVariable(name: "factor1", arg: 1, scope: !752, file: !74, line: 721, type: !6)
!756 = !DILocation(line: 721, column: 33, scope: !752)
!757 = !DILocalVariable(name: "factor2", arg: 2, scope: !752, file: !74, line: 721, type: !18)
!758 = !DILocation(line: 721, column: 46, scope: !752)
!759 = !DILocalVariable(name: "denominator", arg: 3, scope: !752, file: !74, line: 721, type: !6)
!760 = !DILocation(line: 721, column: 59, scope: !752)
!761 = !DILocalVariable(name: "u32Result", scope: !752, file: !74, line: 723, type: !433)
!762 = !DILocation(line: 723, column: 6, scope: !752)
!763 = !DILocalVariable(name: "u32Temp1", scope: !752, file: !74, line: 723, type: !433)
!764 = !DILocation(line: 723, column: 21, scope: !752)
!765 = !DILocalVariable(name: "s32Result", scope: !752, file: !74, line: 724, type: !25)
!766 = !DILocation(line: 724, column: 6, scope: !752)
!767 = !DILocalVariable(name: "s32Temp1", scope: !752, file: !74, line: 724, type: !25)
!768 = !DILocation(line: 724, column: 21, scope: !752)
!769 = !DILocation(line: 725, column: 14, scope: !752)
!770 = !DILocation(line: 725, column: 24, scope: !752)
!771 = !DILocation(line: 725, column: 22, scope: !752)
!772 = !DILocation(line: 725, column: 12, scope: !752)
!773 = !DILocation(line: 727, column: 5, scope: !774)
!774 = distinct !DILexicalBlock(scope: !752, file: !74, line: 727, column: 5)
!775 = !DILocation(line: 727, column: 17, scope: !774)
!776 = !DILocation(line: 727, column: 5, scope: !752)
!777 = !DILocation(line: 729, column: 6, scope: !778)
!778 = distinct !DILexicalBlock(scope: !779, file: !74, line: 729, column: 6)
!779 = distinct !DILexicalBlock(scope: !774, file: !74, line: 728, column: 2)
!780 = !DILocation(line: 729, column: 16, scope: !778)
!781 = !DILocation(line: 729, column: 6, scope: !779)
!782 = !DILocation(line: 731, column: 4, scope: !783)
!783 = distinct !DILexicalBlock(scope: !778, file: !74, line: 730, column: 3)
!784 = !DILocation(line: 735, column: 4, scope: !785)
!785 = distinct !DILexicalBlock(scope: !778, file: !74, line: 734, column: 3)
!786 = !DILocation(line: 741, column: 46, scope: !787)
!787 = distinct !DILexicalBlock(scope: !788, file: !74, line: 741, column: 7)
!788 = distinct !DILexicalBlock(scope: !774, file: !74, line: 739, column: 2)
!789 = !DILocation(line: 741, column: 36, scope: !787)
!790 = !DILocation(line: 741, column: 9, scope: !787)
!791 = !DILocation(line: 741, column: 7, scope: !788)
!792 = !DILocation(line: 742, column: 7, scope: !793)
!793 = distinct !DILexicalBlock(scope: !787, file: !74, line: 741, column: 62)
!794 = !DILocation(line: 745, column: 63, scope: !795)
!795 = distinct !DILexicalBlock(scope: !788, file: !74, line: 745, column: 7)
!796 = !DILocation(line: 745, column: 87, scope: !795)
!797 = !DILocation(line: 745, column: 104, scope: !795)
!798 = !DILocation(line: 745, column: 99, scope: !795)
!799 = !DILocation(line: 745, column: 97, scope: !795)
!800 = !DILocation(line: 745, column: 124, scope: !795)
!801 = !DILocation(line: 745, column: 119, scope: !795)
!802 = !DILocation(line: 745, column: 117, scope: !795)
!803 = !DILocation(line: 745, column: 73, scope: !795)
!804 = !DILocation(line: 745, column: 47, scope: !795)
!805 = !DILocation(line: 745, column: 9, scope: !795)
!806 = !DILocation(line: 745, column: 7, scope: !788)
!807 = !DILocation(line: 746, column: 7, scope: !808)
!808 = distinct !DILexicalBlock(scope: !795, file: !74, line: 745, column: 142)
!809 = !DILocation(line: 749, column: 53, scope: !810)
!810 = distinct !DILexicalBlock(scope: !788, file: !74, line: 749, column: 7)
!811 = !DILocation(line: 749, column: 77, scope: !810)
!812 = !DILocation(line: 749, column: 94, scope: !810)
!813 = !DILocation(line: 749, column: 89, scope: !810)
!814 = !DILocation(line: 749, column: 87, scope: !810)
!815 = !DILocation(line: 749, column: 114, scope: !810)
!816 = !DILocation(line: 749, column: 109, scope: !810)
!817 = !DILocation(line: 749, column: 107, scope: !810)
!818 = !DILocation(line: 749, column: 63, scope: !810)
!819 = !DILocation(line: 749, column: 37, scope: !810)
!820 = !DILocation(line: 749, column: 9, scope: !810)
!821 = !DILocation(line: 749, column: 7, scope: !788)
!822 = !DILocation(line: 750, column: 7, scope: !823)
!823 = distinct !DILexicalBlock(scope: !810, file: !74, line: 749, column: 147)
!824 = !DILocation(line: 753, column: 50, scope: !825)
!825 = distinct !DILexicalBlock(scope: !788, file: !74, line: 753, column: 7)
!826 = !DILocation(line: 753, column: 67, scope: !825)
!827 = !DILocation(line: 753, column: 62, scope: !825)
!828 = !DILocation(line: 753, column: 60, scope: !825)
!829 = !DILocation(line: 753, column: 34, scope: !825)
!830 = !DILocation(line: 753, column: 97, scope: !825)
!831 = !DILocation(line: 753, column: 92, scope: !825)
!832 = !DILocation(line: 753, column: 82, scope: !825)
!833 = !DILocation(line: 753, column: 9, scope: !825)
!834 = !DILocation(line: 753, column: 7, scope: !788)
!835 = !DILocation(line: 754, column: 7, scope: !836)
!836 = distinct !DILexicalBlock(scope: !825, file: !74, line: 753, column: 113)
!837 = !DILocation(line: 757, column: 50, scope: !838)
!838 = distinct !DILexicalBlock(scope: !788, file: !74, line: 757, column: 7)
!839 = !DILocation(line: 757, column: 67, scope: !838)
!840 = !DILocation(line: 757, column: 62, scope: !838)
!841 = !DILocation(line: 757, column: 60, scope: !838)
!842 = !DILocation(line: 757, column: 34, scope: !838)
!843 = !DILocation(line: 757, column: 97, scope: !838)
!844 = !DILocation(line: 757, column: 92, scope: !838)
!845 = !DILocation(line: 757, column: 82, scope: !838)
!846 = !DILocation(line: 757, column: 9, scope: !838)
!847 = !DILocation(line: 757, column: 7, scope: !788)
!848 = !DILocation(line: 758, column: 7, scope: !849)
!849 = distinct !DILexicalBlock(scope: !838, file: !74, line: 757, column: 113)
!850 = !DILocation(line: 761, column: 44, scope: !851)
!851 = distinct !DILexicalBlock(scope: !788, file: !74, line: 761, column: 7)
!852 = !DILocation(line: 761, column: 34, scope: !851)
!853 = !DILocation(line: 761, column: 78, scope: !851)
!854 = !DILocation(line: 761, column: 95, scope: !851)
!855 = !DILocation(line: 761, column: 90, scope: !851)
!856 = !DILocation(line: 761, column: 88, scope: !851)
!857 = !DILocation(line: 761, column: 115, scope: !851)
!858 = !DILocation(line: 761, column: 110, scope: !851)
!859 = !DILocation(line: 761, column: 108, scope: !851)
!860 = !DILocation(line: 761, column: 56, scope: !851)
!861 = !DILocation(line: 761, column: 9, scope: !851)
!862 = !DILocation(line: 761, column: 7, scope: !788)
!863 = !DILocation(line: 762, column: 7, scope: !864)
!864 = distinct !DILexicalBlock(scope: !851, file: !74, line: 761, column: 132)
!865 = !DILocation(line: 764, column: 15, scope: !788)
!866 = !DILocation(line: 764, column: 29, scope: !788)
!867 = !DILocation(line: 764, column: 39, scope: !788)
!868 = !DILocation(line: 764, column: 38, scope: !788)
!869 = !DILocation(line: 764, column: 54, scope: !788)
!870 = !DILocation(line: 764, column: 52, scope: !788)
!871 = !DILocation(line: 764, column: 25, scope: !788)
!872 = !DILocation(line: 764, column: 68, scope: !788)
!873 = !DILocation(line: 764, column: 12, scope: !788)
!874 = !DILocation(line: 766, column: 46, scope: !875)
!875 = distinct !DILexicalBlock(scope: !788, file: !74, line: 766, column: 7)
!876 = !DILocation(line: 766, column: 36, scope: !875)
!877 = !DILocation(line: 766, column: 9, scope: !875)
!878 = !DILocation(line: 766, column: 7, scope: !788)
!879 = !DILocation(line: 767, column: 7, scope: !880)
!880 = distinct !DILexicalBlock(scope: !875, file: !74, line: 766, column: 62)
!881 = !DILocation(line: 774, column: 35, scope: !788)
!882 = !DILocation(line: 774, column: 47, scope: !788)
!883 = !DILocation(line: 774, column: 45, scope: !788)
!884 = !DILocation(line: 774, column: 25, scope: !788)
!885 = !DILocation(line: 774, column: 23, scope: !788)
!886 = !DILocation(line: 775, column: 3, scope: !788)
!887 = !DILocation(line: 792, column: 1, scope: !752)
!888 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !889, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!889 = !DISubroutineType(types: !890)
!890 = !{!28, !22}
!891 = !DILocalVariable(name: "denominator", arg: 1, scope: !888, file: !33, line: 24, type: !22)
!892 = !DILocation(line: 24, column: 40, scope: !888)
!893 = !DILocation(line: 26, column: 12, scope: !888)
!894 = !DILocation(line: 26, column: 24, scope: !888)
!895 = !DILocation(line: 26, column: 5, scope: !888)
!896 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !889, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!897 = !DILocalVariable(name: "left", arg: 1, scope: !896, file: !33, line: 84, type: !22)
!898 = !DILocation(line: 84, column: 51, scope: !896)
!899 = !DILocation(line: 86, column: 12, scope: !896)
!900 = !DILocation(line: 86, column: 17, scope: !896)
!901 = !DILocation(line: 86, column: 5, scope: !896)
!902 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !903, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!903 = !DISubroutineType(types: !904)
!904 = !{!28, !22, !29}
!905 = !DILocalVariable(name: "left", arg: 1, scope: !902, file: !33, line: 90, type: !22)
!906 = !DILocation(line: 90, column: 41, scope: !902)
!907 = !DILocalVariable(name: "count", arg: 2, scope: !902, file: !33, line: 90, type: !29)
!908 = !DILocation(line: 90, column: 56, scope: !902)
!909 = !DILocation(line: 92, column: 9, scope: !910)
!910 = distinct !DILexicalBlock(scope: !902, file: !33, line: 92, column: 9)
!911 = !DILocation(line: 92, column: 15, scope: !910)
!912 = !DILocation(line: 92, column: 9, scope: !902)
!913 = !DILocation(line: 93, column: 9, scope: !914)
!914 = distinct !DILexicalBlock(scope: !910, file: !33, line: 92, column: 32)
!915 = !DILocation(line: 95, column: 12, scope: !902)
!916 = !DILocation(line: 95, column: 34, scope: !902)
!917 = !DILocation(line: 95, column: 31, scope: !902)
!918 = !DILocation(line: 95, column: 17, scope: !902)
!919 = !DILocation(line: 95, column: 41, scope: !902)
!920 = !DILocation(line: 95, column: 5, scope: !902)
!921 = !DILocation(line: 96, column: 1, scope: !902)
!922 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !923, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!923 = !DISubroutineType(types: !924)
!924 = !{!28, !22, !22}
!925 = !DILocalVariable(name: "left", arg: 1, scope: !922, file: !33, line: 78, type: !22)
!926 = !DILocation(line: 78, column: 38, scope: !922)
!927 = !DILocalVariable(name: "right", arg: 2, scope: !922, file: !33, line: 78, type: !22)
!928 = !DILocation(line: 78, column: 52, scope: !922)
!929 = !DILocation(line: 80, column: 12, scope: !922)
!930 = !DILocation(line: 80, column: 19, scope: !922)
!931 = !DILocation(line: 80, column: 17, scope: !922)
!932 = !DILocation(line: 80, column: 25, scope: !922)
!933 = !DILocation(line: 80, column: 5, scope: !922)
!934 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !923, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!935 = !DILocalVariable(name: "left", arg: 1, scope: !934, file: !33, line: 72, type: !22)
!936 = !DILocation(line: 72, column: 38, scope: !934)
!937 = !DILocalVariable(name: "right", arg: 2, scope: !934, file: !33, line: 72, type: !22)
!938 = !DILocation(line: 72, column: 52, scope: !934)
!939 = !DILocation(line: 74, column: 12, scope: !934)
!940 = !DILocation(line: 74, column: 19, scope: !934)
!941 = !DILocation(line: 74, column: 17, scope: !934)
!942 = !DILocation(line: 74, column: 25, scope: !934)
!943 = !DILocation(line: 74, column: 5, scope: !934)
!944 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !33, file: !33, line: 60, type: !923, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!945 = !DILocalVariable(name: "left", arg: 1, scope: !944, file: !33, line: 60, type: !22)
!946 = !DILocation(line: 60, column: 38, scope: !944)
!947 = !DILocalVariable(name: "right", arg: 2, scope: !944, file: !33, line: 60, type: !22)
!948 = !DILocation(line: 60, column: 52, scope: !944)
!949 = !DILocation(line: 62, column: 12, scope: !944)
!950 = !DILocation(line: 62, column: 19, scope: !944)
!951 = !DILocation(line: 62, column: 17, scope: !944)
!952 = !DILocation(line: 62, column: 25, scope: !944)
!953 = !DILocation(line: 62, column: 5, scope: !944)
!954 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !74, file: !74, line: 811, type: !955, scopeLine: 812, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!955 = !DISubroutineType(types: !956)
!956 = !{!18, !6, !18, !18}
!957 = !DILocalVariable(name: "factor1", arg: 1, scope: !954, file: !74, line: 811, type: !6)
!958 = !DILocation(line: 811, column: 33, scope: !954)
!959 = !DILocalVariable(name: "factor2", arg: 2, scope: !954, file: !74, line: 811, type: !18)
!960 = !DILocation(line: 811, column: 46, scope: !954)
!961 = !DILocalVariable(name: "denominator", arg: 3, scope: !954, file: !74, line: 811, type: !18)
!962 = !DILocation(line: 811, column: 59, scope: !954)
!963 = !DILocalVariable(name: "s32Result", scope: !954, file: !74, line: 813, type: !25)
!964 = !DILocation(line: 813, column: 6, scope: !954)
!965 = !DILocalVariable(name: "s32Temp1", scope: !954, file: !74, line: 813, type: !25)
!966 = !DILocation(line: 813, column: 21, scope: !954)
!967 = !DILocation(line: 814, column: 14, scope: !954)
!968 = !DILocation(line: 814, column: 24, scope: !954)
!969 = !DILocation(line: 814, column: 22, scope: !954)
!970 = !DILocation(line: 814, column: 12, scope: !954)
!971 = !DILocation(line: 816, column: 5, scope: !972)
!972 = distinct !DILexicalBlock(scope: !954, file: !74, line: 816, column: 5)
!973 = !DILocation(line: 816, column: 17, scope: !972)
!974 = !DILocation(line: 816, column: 5, scope: !954)
!975 = !DILocation(line: 818, column: 6, scope: !976)
!976 = distinct !DILexicalBlock(scope: !977, file: !74, line: 818, column: 6)
!977 = distinct !DILexicalBlock(scope: !972, file: !74, line: 817, column: 2)
!978 = !DILocation(line: 818, column: 16, scope: !976)
!979 = !DILocation(line: 818, column: 6, scope: !977)
!980 = !DILocation(line: 820, column: 4, scope: !981)
!981 = distinct !DILexicalBlock(scope: !976, file: !74, line: 819, column: 3)
!982 = !DILocation(line: 824, column: 4, scope: !983)
!983 = distinct !DILexicalBlock(scope: !976, file: !74, line: 823, column: 3)
!984 = !DILocation(line: 829, column: 15, scope: !985)
!985 = distinct !DILexicalBlock(scope: !972, file: !74, line: 828, column: 2)
!986 = !DILocation(line: 829, column: 29, scope: !985)
!987 = !DILocation(line: 829, column: 39, scope: !985)
!988 = !DILocation(line: 829, column: 38, scope: !985)
!989 = !DILocation(line: 829, column: 54, scope: !985)
!990 = !DILocation(line: 829, column: 52, scope: !985)
!991 = !DILocation(line: 829, column: 25, scope: !985)
!992 = !DILocation(line: 829, column: 68, scope: !985)
!993 = !DILocation(line: 829, column: 12, scope: !985)
!994 = !DILocation(line: 830, column: 16, scope: !985)
!995 = !DILocation(line: 830, column: 25, scope: !985)
!996 = !DILocation(line: 830, column: 24, scope: !985)
!997 = !DILocation(line: 830, column: 41, scope: !985)
!998 = !DILocation(line: 830, column: 51, scope: !985)
!999 = !DILocation(line: 830, column: 50, scope: !985)
!1000 = !DILocation(line: 830, column: 38, scope: !985)
!1001 = !DILocation(line: 830, column: 13, scope: !985)
!1002 = !DILocation(line: 831, column: 6, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !985, file: !74, line: 831, column: 6)
!1004 = !DILocation(line: 831, column: 16, scope: !1003)
!1005 = !DILocation(line: 831, column: 6, scope: !985)
!1006 = !DILocation(line: 833, column: 7, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1008, file: !74, line: 833, column: 7)
!1008 = distinct !DILexicalBlock(scope: !1003, file: !74, line: 832, column: 3)
!1009 = !DILocation(line: 833, column: 17, scope: !1007)
!1010 = !DILocation(line: 833, column: 7, scope: !1008)
!1011 = !DILocation(line: 835, column: 17, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1007, file: !74, line: 834, column: 4)
!1013 = !DILocation(line: 835, column: 12, scope: !1012)
!1014 = !DILocation(line: 835, column: 5, scope: !1012)
!1015 = !DILocation(line: 839, column: 5, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1007, file: !74, line: 838, column: 4)
!1017 = !DILocation(line: 844, column: 4, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1003, file: !74, line: 843, column: 3)
!1019 = !DILocation(line: 848, column: 1, scope: !954)
!1020 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 866, type: !1021, scopeLine: 867, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!18, !18, !18, !18}
!1023 = !DILocalVariable(name: "factor1", arg: 1, scope: !1020, file: !74, line: 866, type: !18)
!1024 = !DILocation(line: 866, column: 33, scope: !1020)
!1025 = !DILocalVariable(name: "factor2", arg: 2, scope: !1020, file: !74, line: 866, type: !18)
!1026 = !DILocation(line: 866, column: 46, scope: !1020)
!1027 = !DILocalVariable(name: "denominator", arg: 3, scope: !1020, file: !74, line: 866, type: !18)
!1028 = !DILocation(line: 866, column: 59, scope: !1020)
!1029 = !DILocalVariable(name: "u32Temp1", scope: !1020, file: !74, line: 868, type: !433)
!1030 = !DILocation(line: 868, column: 6, scope: !1020)
!1031 = !DILocalVariable(name: "u16TempDenom", scope: !1020, file: !74, line: 869, type: !18)
!1032 = !DILocation(line: 869, column: 6, scope: !1020)
!1033 = !DILocation(line: 871, column: 5, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1020, file: !74, line: 871, column: 5)
!1035 = !DILocation(line: 871, column: 17, scope: !1034)
!1036 = !DILocation(line: 871, column: 5, scope: !1020)
!1037 = !DILocation(line: 873, column: 3, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1034, file: !74, line: 872, column: 2)
!1039 = !DILocation(line: 877, column: 14, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1034, file: !74, line: 876, column: 2)
!1041 = !DILocation(line: 877, column: 24, scope: !1040)
!1042 = !DILocation(line: 877, column: 22, scope: !1040)
!1043 = !DILocation(line: 877, column: 12, scope: !1040)
!1044 = !DILocation(line: 878, column: 18, scope: !1040)
!1045 = !DILocation(line: 878, column: 30, scope: !1040)
!1046 = !DILocation(line: 878, column: 16, scope: !1040)
!1047 = !DILocation(line: 879, column: 14, scope: !1040)
!1048 = !DILocation(line: 879, column: 25, scope: !1040)
!1049 = !DILocation(line: 879, column: 23, scope: !1040)
!1050 = !DILocation(line: 879, column: 12, scope: !1040)
!1051 = !DILocation(line: 880, column: 14, scope: !1040)
!1052 = !DILocation(line: 880, column: 25, scope: !1040)
!1053 = !DILocation(line: 880, column: 23, scope: !1040)
!1054 = !DILocation(line: 880, column: 12, scope: !1040)
!1055 = !DILocation(line: 881, column: 6, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1040, file: !74, line: 881, column: 6)
!1057 = !DILocation(line: 881, column: 15, scope: !1056)
!1058 = !DILocation(line: 881, column: 6, scope: !1040)
!1059 = !DILocation(line: 883, column: 12, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 882, column: 3)
!1061 = !DILocation(line: 883, column: 21, scope: !1060)
!1062 = !DILocation(line: 883, column: 11, scope: !1060)
!1063 = !DILocation(line: 883, column: 4, scope: !1060)
!1064 = !DILocation(line: 888, column: 4, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 887, column: 3)
!1066 = !DILocation(line: 893, column: 1, scope: !1020)
!1067 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 910, type: !1068, scopeLine: 911, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!18, !18, !18, !433}
!1070 = !DILocalVariable(name: "factor1", arg: 1, scope: !1067, file: !74, line: 910, type: !18)
!1071 = !DILocation(line: 910, column: 33, scope: !1067)
!1072 = !DILocalVariable(name: "factor2", arg: 2, scope: !1067, file: !74, line: 910, type: !18)
!1073 = !DILocation(line: 910, column: 46, scope: !1067)
!1074 = !DILocalVariable(name: "denominator", arg: 3, scope: !1067, file: !74, line: 910, type: !433)
!1075 = !DILocation(line: 910, column: 59, scope: !1067)
!1076 = !DILocalVariable(name: "u32Temp1", scope: !1067, file: !74, line: 912, type: !433)
!1077 = !DILocation(line: 912, column: 6, scope: !1067)
!1078 = !DILocation(line: 913, column: 5, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1067, file: !74, line: 913, column: 5)
!1080 = !DILocation(line: 913, column: 17, scope: !1079)
!1081 = !DILocation(line: 913, column: 5, scope: !1067)
!1082 = !DILocation(line: 915, column: 3, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1079, file: !74, line: 914, column: 2)
!1084 = !DILocation(line: 919, column: 15, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1079, file: !74, line: 918, column: 2)
!1086 = !DILocation(line: 919, column: 25, scope: !1085)
!1087 = !DILocation(line: 919, column: 23, scope: !1085)
!1088 = !DILocation(line: 919, column: 36, scope: !1085)
!1089 = !DILocation(line: 919, column: 34, scope: !1085)
!1090 = !DILocation(line: 919, column: 12, scope: !1085)
!1091 = !DILocation(line: 920, column: 8, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1085, file: !74, line: 920, column: 6)
!1093 = !DILocation(line: 920, column: 18, scope: !1092)
!1094 = !DILocation(line: 920, column: 16, scope: !1092)
!1095 = !DILocation(line: 920, column: 28, scope: !1092)
!1096 = !DILocation(line: 920, column: 40, scope: !1092)
!1097 = !DILocation(line: 920, column: 39, scope: !1092)
!1098 = !DILocation(line: 920, column: 26, scope: !1092)
!1099 = !DILocation(line: 920, column: 53, scope: !1092)
!1100 = !DILocation(line: 920, column: 64, scope: !1092)
!1101 = !DILocation(line: 920, column: 50, scope: !1092)
!1102 = !DILocation(line: 920, column: 6, scope: !1085)
!1103 = !DILocation(line: 922, column: 12, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1092, file: !74, line: 921, column: 3)
!1105 = !DILocation(line: 923, column: 3, scope: !1104)
!1106 = !DILocation(line: 924, column: 6, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1085, file: !74, line: 924, column: 6)
!1108 = !DILocation(line: 924, column: 15, scope: !1107)
!1109 = !DILocation(line: 924, column: 6, scope: !1085)
!1110 = !DILocation(line: 926, column: 12, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1107, file: !74, line: 925, column: 3)
!1112 = !DILocation(line: 926, column: 21, scope: !1111)
!1113 = !DILocation(line: 926, column: 11, scope: !1111)
!1114 = !DILocation(line: 926, column: 4, scope: !1111)
!1115 = !DILocation(line: 930, column: 4, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1107, file: !74, line: 929, column: 3)
!1117 = !DILocation(line: 933, column: 1, scope: !1067)
!1118 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 950, type: !1119, scopeLine: 951, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!433, !433, !18}
!1121 = !DILocalVariable(name: "x_value", arg: 1, scope: !1118, file: !74, line: 950, type: !433)
!1122 = !DILocation(line: 950, column: 25, scope: !1118)
!1123 = !DILocalVariable(name: "y_value", arg: 2, scope: !1118, file: !74, line: 950, type: !18)
!1124 = !DILocation(line: 950, column: 38, scope: !1118)
!1125 = !DILocalVariable(name: "u32Temp1", scope: !1118, file: !74, line: 952, type: !433)
!1126 = !DILocation(line: 952, column: 6, scope: !1118)
!1127 = !DILocation(line: 953, column: 5, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1118, file: !74, line: 953, column: 5)
!1129 = !DILocation(line: 953, column: 13, scope: !1128)
!1130 = !DILocation(line: 953, column: 5, scope: !1118)
!1131 = !DILocation(line: 955, column: 3, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 954, column: 2)
!1133 = !DILocation(line: 959, column: 15, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 958, column: 2)
!1135 = !DILocation(line: 959, column: 26, scope: !1134)
!1136 = !DILocation(line: 959, column: 34, scope: !1134)
!1137 = !DILocation(line: 959, column: 33, scope: !1134)
!1138 = !DILocation(line: 959, column: 45, scope: !1134)
!1139 = !DILocation(line: 959, column: 43, scope: !1134)
!1140 = !DILocation(line: 959, column: 23, scope: !1134)
!1141 = !DILocation(line: 959, column: 54, scope: !1134)
!1142 = !DILocation(line: 959, column: 12, scope: !1134)
!1143 = !DILocation(line: 960, column: 15, scope: !1134)
!1144 = !DILocation(line: 960, column: 23, scope: !1134)
!1145 = !DILocation(line: 960, column: 22, scope: !1134)
!1146 = !DILocation(line: 960, column: 35, scope: !1134)
!1147 = !DILocation(line: 960, column: 44, scope: !1134)
!1148 = !DILocation(line: 960, column: 43, scope: !1134)
!1149 = !DILocation(line: 960, column: 32, scope: !1134)
!1150 = !DILocation(line: 960, column: 12, scope: !1134)
!1151 = !DILocation(line: 961, column: 10, scope: !1134)
!1152 = !DILocation(line: 961, column: 3, scope: !1134)
!1153 = !DILocation(line: 963, column: 1, scope: !1118)
!1154 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 981, type: !1155, scopeLine: 982, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!6, !6, !6, !6}
!1157 = !DILocalVariable(name: "fak1", arg: 1, scope: !1154, file: !74, line: 981, type: !6)
!1158 = !DILocation(line: 981, column: 33, scope: !1154)
!1159 = !DILocalVariable(name: "fak2", arg: 2, scope: !1154, file: !74, line: 981, type: !6)
!1160 = !DILocation(line: 981, column: 43, scope: !1154)
!1161 = !DILocalVariable(name: "div", arg: 3, scope: !1154, file: !74, line: 981, type: !6)
!1162 = !DILocation(line: 981, column: 53, scope: !1154)
!1163 = !DILocalVariable(name: "s32Temp1", scope: !1154, file: !74, line: 983, type: !25)
!1164 = !DILocation(line: 983, column: 6, scope: !1154)
!1165 = !DILocalVariable(name: "s32Temp2", scope: !1154, file: !74, line: 983, type: !25)
!1166 = !DILocation(line: 983, column: 20, scope: !1154)
!1167 = !DILocalVariable(name: "s32Temp3", scope: !1154, file: !74, line: 983, type: !25)
!1168 = !DILocation(line: 983, column: 34, scope: !1154)
!1169 = !DILocation(line: 984, column: 13, scope: !1154)
!1170 = !DILocation(line: 984, column: 20, scope: !1154)
!1171 = !DILocation(line: 984, column: 18, scope: !1154)
!1172 = !DILocation(line: 984, column: 11, scope: !1154)
!1173 = !DILocation(line: 985, column: 5, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1154, file: !74, line: 985, column: 5)
!1175 = !DILocation(line: 985, column: 9, scope: !1174)
!1176 = !DILocation(line: 985, column: 5, scope: !1154)
!1177 = !DILocation(line: 987, column: 6, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1179, file: !74, line: 987, column: 6)
!1179 = distinct !DILexicalBlock(scope: !1174, file: !74, line: 986, column: 2)
!1180 = !DILocation(line: 987, column: 15, scope: !1178)
!1181 = !DILocation(line: 987, column: 6, scope: !1179)
!1182 = !DILocation(line: 989, column: 4, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1178, file: !74, line: 988, column: 3)
!1184 = !DILocation(line: 993, column: 4, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1178, file: !74, line: 992, column: 3)
!1186 = !DILocation(line: 998, column: 15, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1174, file: !74, line: 997, column: 2)
!1188 = !DILocation(line: 998, column: 28, scope: !1187)
!1189 = !DILocation(line: 998, column: 39, scope: !1187)
!1190 = !DILocation(line: 998, column: 37, scope: !1187)
!1191 = !DILocation(line: 998, column: 46, scope: !1187)
!1192 = !DILocation(line: 998, column: 44, scope: !1187)
!1193 = !DILocation(line: 998, column: 24, scope: !1187)
!1194 = !DILocation(line: 998, column: 52, scope: !1187)
!1195 = !DILocation(line: 998, column: 12, scope: !1187)
!1196 = !DILocation(line: 999, column: 15, scope: !1187)
!1197 = !DILocation(line: 999, column: 24, scope: !1187)
!1198 = !DILocation(line: 999, column: 23, scope: !1187)
!1199 = !DILocation(line: 999, column: 32, scope: !1187)
!1200 = !DILocation(line: 999, column: 41, scope: !1187)
!1201 = !DILocation(line: 999, column: 40, scope: !1187)
!1202 = !DILocation(line: 999, column: 29, scope: !1187)
!1203 = !DILocation(line: 999, column: 12, scope: !1187)
!1204 = !DILocation(line: 1000, column: 6, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1187, file: !74, line: 1000, column: 6)
!1206 = !DILocation(line: 1000, column: 15, scope: !1205)
!1207 = !DILocation(line: 1000, column: 6, scope: !1187)
!1208 = !DILocation(line: 1002, column: 7, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1210, file: !74, line: 1002, column: 7)
!1210 = distinct !DILexicalBlock(scope: !1205, file: !74, line: 1001, column: 3)
!1211 = !DILocation(line: 1002, column: 16, scope: !1209)
!1212 = !DILocation(line: 1002, column: 7, scope: !1210)
!1213 = !DILocation(line: 1004, column: 17, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1209, file: !74, line: 1003, column: 4)
!1215 = !DILocation(line: 1004, column: 12, scope: !1214)
!1216 = !DILocation(line: 1004, column: 5, scope: !1214)
!1217 = !DILocation(line: 1008, column: 5, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1209, file: !74, line: 1007, column: 4)
!1219 = !DILocation(line: 1013, column: 4, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1205, file: !74, line: 1012, column: 3)
!1221 = !DILocation(line: 1016, column: 1, scope: !1154)
!1222 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1034, type: !1223, scopeLine: 1035, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!6, !6, !6, !18}
!1225 = !DILocalVariable(name: "data1", arg: 1, scope: !1222, file: !74, line: 1034, type: !6)
!1226 = !DILocation(line: 1034, column: 33, scope: !1222)
!1227 = !DILocalVariable(name: "data2", arg: 2, scope: !1222, file: !74, line: 1034, type: !6)
!1228 = !DILocation(line: 1034, column: 43, scope: !1222)
!1229 = !DILocalVariable(name: "denominator", arg: 3, scope: !1222, file: !74, line: 1034, type: !18)
!1230 = !DILocation(line: 1034, column: 53, scope: !1222)
!1231 = !DILocalVariable(name: "s32Result", scope: !1222, file: !74, line: 1036, type: !25)
!1232 = !DILocation(line: 1036, column: 6, scope: !1222)
!1233 = !DILocalVariable(name: "s32Temp1", scope: !1222, file: !74, line: 1036, type: !25)
!1234 = !DILocation(line: 1036, column: 21, scope: !1222)
!1235 = !DILocation(line: 1037, column: 14, scope: !1222)
!1236 = !DILocation(line: 1037, column: 22, scope: !1222)
!1237 = !DILocation(line: 1037, column: 20, scope: !1222)
!1238 = !DILocation(line: 1037, column: 12, scope: !1222)
!1239 = !DILocation(line: 1039, column: 5, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1222, file: !74, line: 1039, column: 5)
!1241 = !DILocation(line: 1039, column: 17, scope: !1240)
!1242 = !DILocation(line: 1039, column: 5, scope: !1222)
!1243 = !DILocation(line: 1041, column: 6, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1245, file: !74, line: 1041, column: 6)
!1245 = distinct !DILexicalBlock(scope: !1240, file: !74, line: 1040, column: 2)
!1246 = !DILocation(line: 1041, column: 16, scope: !1244)
!1247 = !DILocation(line: 1041, column: 6, scope: !1245)
!1248 = !DILocation(line: 1043, column: 4, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1244, file: !74, line: 1042, column: 3)
!1250 = !DILocation(line: 1045, column: 11, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1244, file: !74, line: 1045, column: 11)
!1252 = !DILocation(line: 1045, column: 21, scope: !1251)
!1253 = !DILocation(line: 1045, column: 11, scope: !1244)
!1254 = !DILocation(line: 1047, column: 4, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1251, file: !74, line: 1046, column: 3)
!1256 = !DILocation(line: 1051, column: 4, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1251, file: !74, line: 1050, column: 3)
!1258 = !DILocation(line: 1056, column: 15, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1240, file: !74, line: 1055, column: 2)
!1260 = !DILocation(line: 1056, column: 28, scope: !1259)
!1261 = !DILocation(line: 1056, column: 38, scope: !1259)
!1262 = !DILocation(line: 1056, column: 37, scope: !1259)
!1263 = !DILocation(line: 1056, column: 51, scope: !1259)
!1264 = !DILocation(line: 1056, column: 50, scope: !1259)
!1265 = !DILocation(line: 1056, column: 25, scope: !1259)
!1266 = !DILocation(line: 1056, column: 64, scope: !1259)
!1267 = !DILocation(line: 1056, column: 12, scope: !1259)
!1268 = !DILocation(line: 1057, column: 16, scope: !1259)
!1269 = !DILocation(line: 1057, column: 25, scope: !1259)
!1270 = !DILocation(line: 1057, column: 24, scope: !1259)
!1271 = !DILocation(line: 1057, column: 41, scope: !1259)
!1272 = !DILocation(line: 1057, column: 51, scope: !1259)
!1273 = !DILocation(line: 1057, column: 50, scope: !1259)
!1274 = !DILocation(line: 1057, column: 38, scope: !1259)
!1275 = !DILocation(line: 1057, column: 13, scope: !1259)
!1276 = !DILocation(line: 1058, column: 6, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1259, file: !74, line: 1058, column: 6)
!1278 = !DILocation(line: 1058, column: 16, scope: !1277)
!1279 = !DILocation(line: 1058, column: 6, scope: !1259)
!1280 = !DILocation(line: 1060, column: 7, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1282, file: !74, line: 1060, column: 7)
!1282 = distinct !DILexicalBlock(scope: !1277, file: !74, line: 1059, column: 3)
!1283 = !DILocation(line: 1060, column: 17, scope: !1281)
!1284 = !DILocation(line: 1060, column: 7, scope: !1282)
!1285 = !DILocation(line: 1062, column: 17, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1281, file: !74, line: 1061, column: 4)
!1287 = !DILocation(line: 1062, column: 12, scope: !1286)
!1288 = !DILocation(line: 1062, column: 5, scope: !1286)
!1289 = !DILocation(line: 1066, column: 5, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1281, file: !74, line: 1065, column: 4)
!1291 = !DILocation(line: 1071, column: 4, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1277, file: !74, line: 1070, column: 3)
!1293 = !DILocation(line: 1075, column: 1, scope: !1222)
!1294 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1092, type: !1295, scopeLine: 1093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!433, !433, !25}
!1297 = !DILocalVariable(name: "numerator", arg: 1, scope: !1294, file: !74, line: 1092, type: !433)
!1298 = !DILocation(line: 1092, column: 25, scope: !1294)
!1299 = !DILocalVariable(name: "denominator", arg: 2, scope: !1294, file: !74, line: 1092, type: !25)
!1300 = !DILocation(line: 1092, column: 40, scope: !1294)
!1301 = !DILocalVariable(name: "u32Temp1", scope: !1294, file: !74, line: 1094, type: !433)
!1302 = !DILocation(line: 1094, column: 6, scope: !1294)
!1303 = !DILocation(line: 1095, column: 5, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1294, file: !74, line: 1095, column: 5)
!1305 = !DILocation(line: 1095, column: 17, scope: !1304)
!1306 = !DILocation(line: 1095, column: 5, scope: !1294)
!1307 = !DILocation(line: 1097, column: 3, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1304, file: !74, line: 1096, column: 2)
!1309 = !DILocation(line: 1101, column: 6, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1311, file: !74, line: 1101, column: 6)
!1311 = distinct !DILexicalBlock(scope: !1304, file: !74, line: 1100, column: 2)
!1312 = !DILocation(line: 1101, column: 18, scope: !1310)
!1313 = !DILocation(line: 1101, column: 6, scope: !1311)
!1314 = !DILocation(line: 1103, column: 4, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1310, file: !74, line: 1102, column: 3)
!1316 = !DILocation(line: 1107, column: 16, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1310, file: !74, line: 1106, column: 3)
!1318 = !DILocation(line: 1107, column: 30, scope: !1317)
!1319 = !DILocation(line: 1107, column: 40, scope: !1317)
!1320 = !DILocation(line: 1107, column: 39, scope: !1317)
!1321 = !DILocation(line: 1107, column: 55, scope: !1317)
!1322 = !DILocation(line: 1107, column: 53, scope: !1317)
!1323 = !DILocation(line: 1107, column: 26, scope: !1317)
!1324 = !DILocation(line: 1107, column: 68, scope: !1317)
!1325 = !DILocation(line: 1107, column: 13, scope: !1317)
!1326 = !DILocation(line: 1108, column: 16, scope: !1317)
!1327 = !DILocation(line: 1108, column: 25, scope: !1317)
!1328 = !DILocation(line: 1108, column: 24, scope: !1317)
!1329 = !DILocation(line: 1108, column: 41, scope: !1317)
!1330 = !DILocation(line: 1108, column: 51, scope: !1317)
!1331 = !DILocation(line: 1108, column: 50, scope: !1317)
!1332 = !DILocation(line: 1108, column: 38, scope: !1317)
!1333 = !DILocation(line: 1108, column: 13, scope: !1317)
!1334 = !DILocation(line: 1109, column: 11, scope: !1317)
!1335 = !DILocation(line: 1109, column: 4, scope: !1317)
!1336 = !DILocation(line: 1112, column: 1, scope: !1294)
!1337 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1129, type: !1338, scopeLine: 1130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{!433, !25, !433}
!1340 = !DILocalVariable(name: "numerator", arg: 1, scope: !1337, file: !74, line: 1129, type: !25)
!1341 = !DILocation(line: 1129, column: 25, scope: !1337)
!1342 = !DILocalVariable(name: "denominator", arg: 2, scope: !1337, file: !74, line: 1129, type: !433)
!1343 = !DILocation(line: 1129, column: 40, scope: !1337)
!1344 = !DILocalVariable(name: "s32Temp1", scope: !1337, file: !74, line: 1131, type: !25)
!1345 = !DILocation(line: 1131, column: 6, scope: !1337)
!1346 = !DILocation(line: 1132, column: 5, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1337, file: !74, line: 1132, column: 5)
!1348 = !DILocation(line: 1132, column: 17, scope: !1347)
!1349 = !DILocation(line: 1132, column: 5, scope: !1337)
!1350 = !DILocation(line: 1134, column: 6, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1352, file: !74, line: 1134, column: 6)
!1352 = distinct !DILexicalBlock(scope: !1347, file: !74, line: 1133, column: 2)
!1353 = !DILocation(line: 1134, column: 16, scope: !1351)
!1354 = !DILocation(line: 1134, column: 6, scope: !1352)
!1355 = !DILocation(line: 1136, column: 4, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1351, file: !74, line: 1135, column: 3)
!1357 = !DILocation(line: 1140, column: 4, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1351, file: !74, line: 1139, column: 3)
!1359 = !DILocation(line: 1145, column: 6, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1361, file: !74, line: 1145, column: 6)
!1361 = distinct !DILexicalBlock(scope: !1347, file: !74, line: 1144, column: 2)
!1362 = !DILocation(line: 1145, column: 16, scope: !1360)
!1363 = !DILocation(line: 1145, column: 6, scope: !1361)
!1364 = !DILocation(line: 1147, column: 17, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1360, file: !74, line: 1146, column: 3)
!1366 = !DILocation(line: 1147, column: 31, scope: !1365)
!1367 = !DILocation(line: 1147, column: 41, scope: !1365)
!1368 = !DILocation(line: 1147, column: 40, scope: !1365)
!1369 = !DILocation(line: 1147, column: 56, scope: !1365)
!1370 = !DILocation(line: 1147, column: 54, scope: !1365)
!1371 = !DILocation(line: 1147, column: 27, scope: !1365)
!1372 = !DILocation(line: 1147, column: 69, scope: !1365)
!1373 = !DILocation(line: 1147, column: 13, scope: !1365)
!1374 = !DILocation(line: 1148, column: 13, scope: !1365)
!1375 = !DILocation(line: 1148, column: 23, scope: !1365)
!1376 = !DILocation(line: 1148, column: 22, scope: !1365)
!1377 = !DILocation(line: 1148, column: 39, scope: !1365)
!1378 = !DILocation(line: 1148, column: 48, scope: !1365)
!1379 = !DILocation(line: 1148, column: 47, scope: !1365)
!1380 = !DILocation(line: 1148, column: 36, scope: !1365)
!1381 = !DILocation(line: 1148, column: 4, scope: !1365)
!1382 = !DILocation(line: 1152, column: 4, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1360, file: !74, line: 1151, column: 3)
!1384 = !DILocation(line: 1155, column: 1, scope: !1337)
!1385 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1172, type: !1386, scopeLine: 1173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!433, !25, !25}
!1388 = !DILocalVariable(name: "numerator", arg: 1, scope: !1385, file: !74, line: 1172, type: !25)
!1389 = !DILocation(line: 1172, column: 25, scope: !1385)
!1390 = !DILocalVariable(name: "denominator", arg: 2, scope: !1385, file: !74, line: 1172, type: !25)
!1391 = !DILocation(line: 1172, column: 40, scope: !1385)
!1392 = !DILocalVariable(name: "u32Temp1", scope: !1385, file: !74, line: 1174, type: !433)
!1393 = !DILocation(line: 1174, column: 6, scope: !1385)
!1394 = !DILocalVariable(name: "u32Temp2", scope: !1385, file: !74, line: 1174, type: !433)
!1395 = !DILocation(line: 1174, column: 20, scope: !1385)
!1396 = !DILocation(line: 1175, column: 5, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1385, file: !74, line: 1175, column: 5)
!1398 = !DILocation(line: 1175, column: 17, scope: !1397)
!1399 = !DILocation(line: 1175, column: 5, scope: !1385)
!1400 = !DILocation(line: 1177, column: 6, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !74, line: 1177, column: 6)
!1402 = distinct !DILexicalBlock(scope: !1397, file: !74, line: 1176, column: 2)
!1403 = !DILocation(line: 1177, column: 16, scope: !1401)
!1404 = !DILocation(line: 1177, column: 6, scope: !1402)
!1405 = !DILocation(line: 1179, column: 4, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !74, line: 1178, column: 3)
!1407 = !DILocation(line: 1183, column: 4, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1401, file: !74, line: 1182, column: 3)
!1409 = !DILocation(line: 1188, column: 6, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1411, file: !74, line: 1188, column: 6)
!1411 = distinct !DILexicalBlock(scope: !1397, file: !74, line: 1187, column: 2)
!1412 = !DILocation(line: 1188, column: 16, scope: !1410)
!1413 = !DILocation(line: 1188, column: 6, scope: !1411)
!1414 = !DILocation(line: 1190, column: 7, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1416, file: !74, line: 1190, column: 7)
!1416 = distinct !DILexicalBlock(scope: !1410, file: !74, line: 1189, column: 3)
!1417 = !DILocation(line: 1190, column: 17, scope: !1415)
!1418 = !DILocation(line: 1190, column: 7, scope: !1416)
!1419 = !DILocation(line: 1192, column: 5, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1415, file: !74, line: 1191, column: 4)
!1421 = !DILocation(line: 1196, column: 8, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1423, file: !74, line: 1196, column: 8)
!1423 = distinct !DILexicalBlock(scope: !1415, file: !74, line: 1195, column: 4)
!1424 = !DILocation(line: 1196, column: 20, scope: !1422)
!1425 = !DILocation(line: 1196, column: 8, scope: !1423)
!1426 = !DILocation(line: 1198, column: 6, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1422, file: !74, line: 1197, column: 5)
!1428 = !DILocation(line: 1202, column: 18, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1422, file: !74, line: 1201, column: 5)
!1430 = !DILocation(line: 1202, column: 32, scope: !1429)
!1431 = !DILocation(line: 1202, column: 42, scope: !1429)
!1432 = !DILocation(line: 1202, column: 41, scope: !1429)
!1433 = !DILocation(line: 1202, column: 57, scope: !1429)
!1434 = !DILocation(line: 1202, column: 55, scope: !1429)
!1435 = !DILocation(line: 1202, column: 28, scope: !1429)
!1436 = !DILocation(line: 1202, column: 71, scope: !1429)
!1437 = !DILocation(line: 1202, column: 15, scope: !1429)
!1438 = !DILocation(line: 1203, column: 18, scope: !1429)
!1439 = !DILocation(line: 1203, column: 29, scope: !1429)
!1440 = !DILocation(line: 1203, column: 27, scope: !1429)
!1441 = !DILocation(line: 1203, column: 45, scope: !1429)
!1442 = !DILocation(line: 1203, column: 57, scope: !1429)
!1443 = !DILocation(line: 1203, column: 55, scope: !1429)
!1444 = !DILocation(line: 1203, column: 42, scope: !1429)
!1445 = !DILocation(line: 1203, column: 15, scope: !1429)
!1446 = !DILocation(line: 1204, column: 13, scope: !1429)
!1447 = !DILocation(line: 1204, column: 6, scope: !1429)
!1448 = !DILocation(line: 1210, column: 7, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1450, file: !74, line: 1210, column: 7)
!1450 = distinct !DILexicalBlock(scope: !1410, file: !74, line: 1209, column: 3)
!1451 = !DILocation(line: 1210, column: 19, scope: !1449)
!1452 = !DILocation(line: 1210, column: 7, scope: !1450)
!1453 = !DILocation(line: 1212, column: 5, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1449, file: !74, line: 1211, column: 4)
!1455 = !DILocation(line: 1216, column: 18, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1449, file: !74, line: 1215, column: 4)
!1457 = !DILocation(line: 1216, column: 17, scope: !1456)
!1458 = !DILocation(line: 1216, column: 15, scope: !1456)
!1459 = !DILocation(line: 1217, column: 20, scope: !1456)
!1460 = !DILocation(line: 1217, column: 19, scope: !1456)
!1461 = !DILocation(line: 1217, column: 17, scope: !1456)
!1462 = !DILocation(line: 1218, column: 17, scope: !1456)
!1463 = !DILocation(line: 1218, column: 31, scope: !1456)
!1464 = !DILocation(line: 1218, column: 41, scope: !1456)
!1465 = !DILocation(line: 1218, column: 40, scope: !1456)
!1466 = !DILocation(line: 1218, column: 56, scope: !1456)
!1467 = !DILocation(line: 1218, column: 54, scope: !1456)
!1468 = !DILocation(line: 1218, column: 27, scope: !1456)
!1469 = !DILocation(line: 1218, column: 70, scope: !1456)
!1470 = !DILocation(line: 1218, column: 14, scope: !1456)
!1471 = !DILocation(line: 1219, column: 17, scope: !1456)
!1472 = !DILocation(line: 1219, column: 28, scope: !1456)
!1473 = !DILocation(line: 1219, column: 26, scope: !1456)
!1474 = !DILocation(line: 1219, column: 44, scope: !1456)
!1475 = !DILocation(line: 1219, column: 56, scope: !1456)
!1476 = !DILocation(line: 1219, column: 54, scope: !1456)
!1477 = !DILocation(line: 1219, column: 41, scope: !1456)
!1478 = !DILocation(line: 1219, column: 14, scope: !1456)
!1479 = !DILocation(line: 1220, column: 12, scope: !1456)
!1480 = !DILocation(line: 1220, column: 5, scope: !1456)
!1481 = !DILocation(line: 1225, column: 1, scope: !1385)
!1482 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1242, type: !1483, scopeLine: 1243, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1483 = !DISubroutineType(types: !1484)
!1484 = !{!433, !433, !433}
!1485 = !DILocalVariable(name: "numerator", arg: 1, scope: !1482, file: !74, line: 1242, type: !433)
!1486 = !DILocation(line: 1242, column: 25, scope: !1482)
!1487 = !DILocalVariable(name: "denominator", arg: 2, scope: !1482, file: !74, line: 1242, type: !433)
!1488 = !DILocation(line: 1242, column: 40, scope: !1482)
!1489 = !DILocalVariable(name: "u32Temp1", scope: !1482, file: !74, line: 1245, type: !433)
!1490 = !DILocation(line: 1245, column: 6, scope: !1482)
!1491 = !DILocalVariable(name: "u32Temp2", scope: !1482, file: !74, line: 1245, type: !433)
!1492 = !DILocation(line: 1245, column: 20, scope: !1482)
!1493 = !DILocalVariable(name: "u32Temp3", scope: !1482, file: !74, line: 1245, type: !433)
!1494 = !DILocation(line: 1245, column: 34, scope: !1482)
!1495 = !DILocalVariable(name: "numerator_old", scope: !1482, file: !74, line: 1245, type: !433)
!1496 = !DILocation(line: 1245, column: 48, scope: !1482)
!1497 = !DILocation(line: 1246, column: 5, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1482, file: !74, line: 1246, column: 5)
!1499 = !DILocation(line: 1246, column: 16, scope: !1498)
!1500 = !DILocation(line: 1246, column: 5, scope: !1482)
!1501 = !DILocation(line: 1248, column: 3, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1498, file: !74, line: 1247, column: 2)
!1503 = !DILocation(line: 1252, column: 14, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1498, file: !74, line: 1251, column: 2)
!1505 = !DILocation(line: 1252, column: 26, scope: !1504)
!1506 = !DILocation(line: 1252, column: 41, scope: !1504)
!1507 = !DILocation(line: 1252, column: 51, scope: !1504)
!1508 = !DILocation(line: 1252, column: 50, scope: !1504)
!1509 = !DILocation(line: 1252, column: 38, scope: !1504)
!1510 = !DILocation(line: 1252, column: 24, scope: !1504)
!1511 = !DILocation(line: 1252, column: 12, scope: !1504)
!1512 = !DILocation(line: 1253, column: 7, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1504, file: !74, line: 1253, column: 6)
!1514 = !DILocation(line: 1253, column: 16, scope: !1513)
!1515 = !DILocation(line: 1253, column: 24, scope: !1513)
!1516 = !DILocation(line: 1253, column: 6, scope: !1504)
!1517 = !DILocation(line: 1255, column: 16, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1513, file: !74, line: 1254, column: 3)
!1519 = !DILocation(line: 1255, column: 27, scope: !1518)
!1520 = !DILocation(line: 1255, column: 13, scope: !1518)
!1521 = !DILocation(line: 1256, column: 3, scope: !1518)
!1522 = !DILocation(line: 1259, column: 16, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1513, file: !74, line: 1258, column: 3)
!1524 = !DILocation(line: 1259, column: 27, scope: !1523)
!1525 = !DILocation(line: 1259, column: 32, scope: !1523)
!1526 = !DILocation(line: 1259, column: 13, scope: !1523)
!1527 = !DILocation(line: 1262, column: 6, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1504, file: !74, line: 1262, column: 6)
!1529 = !DILocation(line: 1262, column: 17, scope: !1528)
!1530 = !DILocation(line: 1262, column: 15, scope: !1528)
!1531 = !DILocation(line: 1262, column: 6, scope: !1504)
!1532 = !DILocation(line: 1264, column: 12, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1528, file: !74, line: 1263, column: 3)
!1534 = !DILocation(line: 1264, column: 22, scope: !1533)
!1535 = !DILocation(line: 1264, column: 21, scope: !1533)
!1536 = !DILocation(line: 1264, column: 4, scope: !1533)
!1537 = !DILocation(line: 1268, column: 13, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1528, file: !74, line: 1267, column: 3)
!1539 = !DILocation(line: 1268, column: 23, scope: !1538)
!1540 = !DILocation(line: 1268, column: 22, scope: !1538)
!1541 = !DILocation(line: 1268, column: 36, scope: !1538)
!1542 = !DILocation(line: 1268, column: 4, scope: !1538)
!1543 = !DILocation(line: 1273, column: 1, scope: !1482)
!1544 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1290, type: !1545, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!25, !433, !25}
!1547 = !DILocalVariable(name: "numerator", arg: 1, scope: !1544, file: !74, line: 1290, type: !433)
!1548 = !DILocation(line: 1290, column: 25, scope: !1544)
!1549 = !DILocalVariable(name: "denominator", arg: 2, scope: !1544, file: !74, line: 1290, type: !25)
!1550 = !DILocation(line: 1290, column: 40, scope: !1544)
!1551 = !DILocalVariable(name: "u32Temp1", scope: !1544, file: !74, line: 1292, type: !433)
!1552 = !DILocation(line: 1292, column: 6, scope: !1544)
!1553 = !DILocalVariable(name: "u32Temp2", scope: !1544, file: !74, line: 1292, type: !433)
!1554 = !DILocation(line: 1292, column: 20, scope: !1544)
!1555 = !DILocation(line: 1293, column: 5, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1544, file: !74, line: 1293, column: 5)
!1557 = !DILocation(line: 1293, column: 17, scope: !1556)
!1558 = !DILocation(line: 1293, column: 5, scope: !1544)
!1559 = !DILocation(line: 1295, column: 6, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1561, file: !74, line: 1295, column: 6)
!1561 = distinct !DILexicalBlock(scope: !1556, file: !74, line: 1294, column: 2)
!1562 = !DILocation(line: 1295, column: 18, scope: !1560)
!1563 = !DILocation(line: 1295, column: 6, scope: !1561)
!1564 = !DILocation(line: 1297, column: 4, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1560, file: !74, line: 1296, column: 3)
!1566 = !DILocation(line: 1301, column: 19, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1560, file: !74, line: 1300, column: 3)
!1568 = !DILocation(line: 1301, column: 18, scope: !1567)
!1569 = !DILocation(line: 1301, column: 16, scope: !1567)
!1570 = !DILocation(line: 1302, column: 16, scope: !1567)
!1571 = !DILocation(line: 1302, column: 30, scope: !1567)
!1572 = !DILocation(line: 1302, column: 40, scope: !1567)
!1573 = !DILocation(line: 1302, column: 39, scope: !1567)
!1574 = !DILocation(line: 1302, column: 55, scope: !1567)
!1575 = !DILocation(line: 1302, column: 53, scope: !1567)
!1576 = !DILocation(line: 1302, column: 26, scope: !1567)
!1577 = !DILocation(line: 1302, column: 69, scope: !1567)
!1578 = !DILocation(line: 1302, column: 13, scope: !1567)
!1579 = !DILocation(line: 1303, column: 16, scope: !1567)
!1580 = !DILocation(line: 1303, column: 25, scope: !1567)
!1581 = !DILocation(line: 1303, column: 24, scope: !1567)
!1582 = !DILocation(line: 1303, column: 41, scope: !1567)
!1583 = !DILocation(line: 1303, column: 51, scope: !1567)
!1584 = !DILocation(line: 1303, column: 50, scope: !1567)
!1585 = !DILocation(line: 1303, column: 38, scope: !1567)
!1586 = !DILocation(line: 1303, column: 13, scope: !1567)
!1587 = !DILocation(line: 1304, column: 7, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1567, file: !74, line: 1304, column: 7)
!1589 = !DILocation(line: 1304, column: 16, scope: !1588)
!1590 = !DILocation(line: 1304, column: 7, scope: !1567)
!1591 = !DILocation(line: 1306, column: 13, scope: !1592)
!1592 = distinct !DILexicalBlock(scope: !1588, file: !74, line: 1305, column: 4)
!1593 = !DILocation(line: 1306, column: 12, scope: !1592)
!1594 = !DILocation(line: 1306, column: 5, scope: !1592)
!1595 = !DILocation(line: 1310, column: 5, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1588, file: !74, line: 1309, column: 4)
!1597 = !DILocation(line: 1316, column: 15, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1556, file: !74, line: 1315, column: 2)
!1599 = !DILocation(line: 1316, column: 29, scope: !1598)
!1600 = !DILocation(line: 1316, column: 39, scope: !1598)
!1601 = !DILocation(line: 1316, column: 38, scope: !1598)
!1602 = !DILocation(line: 1316, column: 54, scope: !1598)
!1603 = !DILocation(line: 1316, column: 52, scope: !1598)
!1604 = !DILocation(line: 1316, column: 25, scope: !1598)
!1605 = !DILocation(line: 1316, column: 68, scope: !1598)
!1606 = !DILocation(line: 1316, column: 12, scope: !1598)
!1607 = !DILocation(line: 1317, column: 15, scope: !1598)
!1608 = !DILocation(line: 1317, column: 24, scope: !1598)
!1609 = !DILocation(line: 1317, column: 23, scope: !1598)
!1610 = !DILocation(line: 1317, column: 40, scope: !1598)
!1611 = !DILocation(line: 1317, column: 50, scope: !1598)
!1612 = !DILocation(line: 1317, column: 49, scope: !1598)
!1613 = !DILocation(line: 1317, column: 37, scope: !1598)
!1614 = !DILocation(line: 1317, column: 12, scope: !1598)
!1615 = !DILocation(line: 1318, column: 6, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1598, file: !74, line: 1318, column: 6)
!1617 = !DILocation(line: 1318, column: 15, scope: !1616)
!1618 = !DILocation(line: 1318, column: 6, scope: !1598)
!1619 = !DILocation(line: 1320, column: 11, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1616, file: !74, line: 1319, column: 3)
!1621 = !DILocation(line: 1320, column: 4, scope: !1620)
!1622 = !DILocation(line: 1324, column: 4, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1616, file: !74, line: 1323, column: 3)
!1624 = !DILocation(line: 1327, column: 1, scope: !1544)
!1625 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1345, type: !1626, scopeLine: 1346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!25, !25, !433}
!1628 = !DILocalVariable(name: "numerator", arg: 1, scope: !1625, file: !74, line: 1345, type: !25)
!1629 = !DILocation(line: 1345, column: 25, scope: !1625)
!1630 = !DILocalVariable(name: "denominator", arg: 2, scope: !1625, file: !74, line: 1345, type: !433)
!1631 = !DILocation(line: 1345, column: 40, scope: !1625)
!1632 = !DILocalVariable(name: "s32Temp1", scope: !1625, file: !74, line: 1347, type: !25)
!1633 = !DILocation(line: 1347, column: 6, scope: !1625)
!1634 = !DILocalVariable(name: "s32Temp2", scope: !1625, file: !74, line: 1347, type: !25)
!1635 = !DILocation(line: 1347, column: 20, scope: !1625)
!1636 = !DILocalVariable(name: "u32Temp0", scope: !1625, file: !74, line: 1348, type: !433)
!1637 = !DILocation(line: 1348, column: 6, scope: !1625)
!1638 = !DILocalVariable(name: "u32Temp1", scope: !1625, file: !74, line: 1348, type: !433)
!1639 = !DILocation(line: 1348, column: 20, scope: !1625)
!1640 = !DILocalVariable(name: "u32Temp2", scope: !1625, file: !74, line: 1348, type: !433)
!1641 = !DILocation(line: 1348, column: 34, scope: !1625)
!1642 = !DILocation(line: 1349, column: 5, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1625, file: !74, line: 1349, column: 5)
!1644 = !DILocation(line: 1349, column: 17, scope: !1643)
!1645 = !DILocation(line: 1349, column: 5, scope: !1625)
!1646 = !DILocation(line: 1351, column: 6, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1648, file: !74, line: 1351, column: 6)
!1648 = distinct !DILexicalBlock(scope: !1643, file: !74, line: 1350, column: 2)
!1649 = !DILocation(line: 1351, column: 16, scope: !1647)
!1650 = !DILocation(line: 1351, column: 6, scope: !1648)
!1651 = !DILocation(line: 1353, column: 4, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1352, column: 3)
!1653 = !DILocation(line: 1357, column: 4, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1356, column: 3)
!1655 = !DILocation(line: 1362, column: 6, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1657, file: !74, line: 1362, column: 6)
!1657 = distinct !DILexicalBlock(scope: !1643, file: !74, line: 1361, column: 2)
!1658 = !DILocation(line: 1362, column: 16, scope: !1656)
!1659 = !DILocation(line: 1362, column: 6, scope: !1657)
!1660 = !DILocation(line: 1364, column: 16, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1656, file: !74, line: 1363, column: 3)
!1662 = !DILocation(line: 1364, column: 15, scope: !1661)
!1663 = !DILocation(line: 1364, column: 13, scope: !1661)
!1664 = !DILocation(line: 1365, column: 16, scope: !1661)
!1665 = !DILocation(line: 1365, column: 25, scope: !1661)
!1666 = !DILocation(line: 1365, column: 24, scope: !1661)
!1667 = !DILocation(line: 1365, column: 13, scope: !1661)
!1668 = !DILocation(line: 1366, column: 15, scope: !1661)
!1669 = !DILocation(line: 1366, column: 28, scope: !1661)
!1670 = !DILocation(line: 1366, column: 37, scope: !1661)
!1671 = !DILocation(line: 1366, column: 36, scope: !1661)
!1672 = !DILocation(line: 1366, column: 52, scope: !1661)
!1673 = !DILocation(line: 1366, column: 50, scope: !1661)
!1674 = !DILocation(line: 1366, column: 24, scope: !1661)
!1675 = !DILocation(line: 1366, column: 13, scope: !1661)
!1676 = !DILocation(line: 1368, column: 8, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1661, file: !74, line: 1368, column: 7)
!1678 = !DILocation(line: 1368, column: 20, scope: !1677)
!1679 = !DILocation(line: 1368, column: 27, scope: !1677)
!1680 = !DILocation(line: 1368, column: 7, scope: !1661)
!1681 = !DILocation(line: 1370, column: 20, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1677, file: !74, line: 1369, column: 4)
!1683 = !DILocation(line: 1370, column: 32, scope: !1682)
!1684 = !DILocation(line: 1370, column: 17, scope: !1682)
!1685 = !DILocation(line: 1371, column: 4, scope: !1682)
!1686 = !DILocation(line: 1374, column: 20, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1677, file: !74, line: 1373, column: 4)
!1688 = !DILocation(line: 1374, column: 32, scope: !1687)
!1689 = !DILocation(line: 1374, column: 38, scope: !1687)
!1690 = !DILocation(line: 1374, column: 17, scope: !1687)
!1691 = !DILocation(line: 1378, column: 7, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1661, file: !74, line: 1378, column: 7)
!1693 = !DILocation(line: 1378, column: 18, scope: !1692)
!1694 = !DILocation(line: 1378, column: 16, scope: !1692)
!1695 = !DILocation(line: 1378, column: 7, scope: !1661)
!1696 = !DILocation(line: 1380, column: 14, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1692, file: !74, line: 1379, column: 4)
!1698 = !DILocation(line: 1380, column: 13, scope: !1697)
!1699 = !DILocation(line: 1380, column: 23, scope: !1697)
!1700 = !DILocation(line: 1380, column: 5, scope: !1697)
!1701 = !DILocation(line: 1384, column: 14, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1692, file: !74, line: 1383, column: 4)
!1703 = !DILocation(line: 1384, column: 23, scope: !1702)
!1704 = !DILocation(line: 1384, column: 12, scope: !1702)
!1705 = !DILocation(line: 1384, column: 27, scope: !1702)
!1706 = !DILocation(line: 1384, column: 5, scope: !1702)
!1707 = !DILocation(line: 1391, column: 16, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1656, file: !74, line: 1390, column: 3)
!1709 = !DILocation(line: 1391, column: 30, scope: !1708)
!1710 = !DILocation(line: 1391, column: 40, scope: !1708)
!1711 = !DILocation(line: 1391, column: 39, scope: !1708)
!1712 = !DILocation(line: 1391, column: 55, scope: !1708)
!1713 = !DILocation(line: 1391, column: 53, scope: !1708)
!1714 = !DILocation(line: 1391, column: 26, scope: !1708)
!1715 = !DILocation(line: 1391, column: 69, scope: !1708)
!1716 = !DILocation(line: 1391, column: 13, scope: !1708)
!1717 = !DILocation(line: 1392, column: 16, scope: !1708)
!1718 = !DILocation(line: 1392, column: 26, scope: !1708)
!1719 = !DILocation(line: 1392, column: 25, scope: !1708)
!1720 = !DILocation(line: 1392, column: 42, scope: !1708)
!1721 = !DILocation(line: 1392, column: 51, scope: !1708)
!1722 = !DILocation(line: 1392, column: 50, scope: !1708)
!1723 = !DILocation(line: 1392, column: 39, scope: !1708)
!1724 = !DILocation(line: 1392, column: 13, scope: !1708)
!1725 = !DILocation(line: 1393, column: 11, scope: !1708)
!1726 = !DILocation(line: 1393, column: 4, scope: !1708)
!1727 = !DILocation(line: 1396, column: 1, scope: !1625)
!1728 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1413, type: !1729, scopeLine: 1414, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1729 = !DISubroutineType(types: !1730)
!1730 = !{!25, !25, !25}
!1731 = !DILocalVariable(name: "numerator", arg: 1, scope: !1728, file: !74, line: 1413, type: !25)
!1732 = !DILocation(line: 1413, column: 25, scope: !1728)
!1733 = !DILocalVariable(name: "denominator", arg: 2, scope: !1728, file: !74, line: 1413, type: !25)
!1734 = !DILocation(line: 1413, column: 40, scope: !1728)
!1735 = !DILocalVariable(name: "s32Temp1", scope: !1728, file: !74, line: 1415, type: !25)
!1736 = !DILocation(line: 1415, column: 6, scope: !1728)
!1737 = !DILocalVariable(name: "s32Temp2", scope: !1728, file: !74, line: 1415, type: !25)
!1738 = !DILocation(line: 1415, column: 20, scope: !1728)
!1739 = !DILocalVariable(name: "denominator_prime", scope: !1728, file: !74, line: 1416, type: !433)
!1740 = !DILocation(line: 1416, column: 6, scope: !1728)
!1741 = !DILocalVariable(name: "u32Temp1", scope: !1728, file: !74, line: 1416, type: !433)
!1742 = !DILocation(line: 1416, column: 29, scope: !1728)
!1743 = !DILocalVariable(name: "u32Temp2", scope: !1728, file: !74, line: 1416, type: !433)
!1744 = !DILocation(line: 1416, column: 43, scope: !1728)
!1745 = !DILocalVariable(name: "u32numerator", scope: !1728, file: !74, line: 1417, type: !433)
!1746 = !DILocation(line: 1417, column: 6, scope: !1728)
!1747 = !DILocalVariable(name: "u32denominator", scope: !1728, file: !74, line: 1417, type: !433)
!1748 = !DILocation(line: 1417, column: 23, scope: !1728)
!1749 = !DILocation(line: 1418, column: 5, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1728, file: !74, line: 1418, column: 5)
!1751 = !DILocation(line: 1418, column: 15, scope: !1750)
!1752 = !DILocation(line: 1418, column: 5, scope: !1728)
!1753 = !DILocation(line: 1420, column: 6, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1755, file: !74, line: 1420, column: 6)
!1755 = distinct !DILexicalBlock(scope: !1750, file: !74, line: 1419, column: 2)
!1756 = !DILocation(line: 1420, column: 18, scope: !1754)
!1757 = !DILocation(line: 1420, column: 6, scope: !1755)
!1758 = !DILocation(line: 1422, column: 7, scope: !1759)
!1759 = distinct !DILexicalBlock(scope: !1760, file: !74, line: 1422, column: 7)
!1760 = distinct !DILexicalBlock(scope: !1754, file: !74, line: 1421, column: 3)
!1761 = !DILocation(line: 1422, column: 19, scope: !1759)
!1762 = !DILocation(line: 1422, column: 7, scope: !1760)
!1763 = !DILocation(line: 1424, column: 5, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1759, file: !74, line: 1423, column: 4)
!1765 = !DILocation(line: 1428, column: 21, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1759, file: !74, line: 1427, column: 4)
!1767 = !DILocation(line: 1428, column: 20, scope: !1766)
!1768 = !DILocation(line: 1428, column: 18, scope: !1766)
!1769 = !DILocation(line: 1429, column: 23, scope: !1766)
!1770 = !DILocation(line: 1429, column: 22, scope: !1766)
!1771 = !DILocation(line: 1429, column: 20, scope: !1766)
!1772 = !DILocation(line: 1430, column: 16, scope: !1766)
!1773 = !DILocation(line: 1430, column: 33, scope: !1766)
!1774 = !DILocation(line: 1430, column: 46, scope: !1766)
!1775 = !DILocation(line: 1430, column: 45, scope: !1766)
!1776 = !DILocation(line: 1430, column: 64, scope: !1766)
!1777 = !DILocation(line: 1430, column: 62, scope: !1766)
!1778 = !DILocation(line: 1430, column: 29, scope: !1766)
!1779 = !DILocation(line: 1430, column: 81, scope: !1766)
!1780 = !DILocation(line: 1430, column: 14, scope: !1766)
!1781 = !DILocation(line: 1431, column: 17, scope: !1766)
!1782 = !DILocation(line: 1431, column: 30, scope: !1766)
!1783 = !DILocation(line: 1431, column: 29, scope: !1766)
!1784 = !DILocation(line: 1431, column: 49, scope: !1766)
!1785 = !DILocation(line: 1431, column: 58, scope: !1766)
!1786 = !DILocation(line: 1431, column: 57, scope: !1766)
!1787 = !DILocation(line: 1431, column: 46, scope: !1766)
!1788 = !DILocation(line: 1431, column: 14, scope: !1766)
!1789 = !DILocation(line: 1432, column: 8, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1766, file: !74, line: 1432, column: 8)
!1791 = !DILocation(line: 1432, column: 17, scope: !1790)
!1792 = !DILocation(line: 1432, column: 8, scope: !1766)
!1793 = !DILocation(line: 1434, column: 13, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1790, file: !74, line: 1433, column: 5)
!1795 = !DILocation(line: 1434, column: 6, scope: !1794)
!1796 = !DILocation(line: 1438, column: 6, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1790, file: !74, line: 1437, column: 5)
!1798 = !DILocation(line: 1444, column: 20, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1754, file: !74, line: 1443, column: 3)
!1800 = !DILocation(line: 1444, column: 19, scope: !1799)
!1801 = !DILocation(line: 1444, column: 29, scope: !1799)
!1802 = !DILocation(line: 1444, column: 17, scope: !1799)
!1803 = !DILocation(line: 1445, column: 16, scope: !1799)
!1804 = !DILocation(line: 1445, column: 33, scope: !1799)
!1805 = !DILocation(line: 1445, column: 46, scope: !1799)
!1806 = !DILocation(line: 1445, column: 45, scope: !1799)
!1807 = !DILocation(line: 1445, column: 61, scope: !1799)
!1808 = !DILocation(line: 1445, column: 59, scope: !1799)
!1809 = !DILocation(line: 1445, column: 29, scope: !1799)
!1810 = !DILocation(line: 1445, column: 75, scope: !1799)
!1811 = !DILocation(line: 1445, column: 13, scope: !1799)
!1812 = !DILocation(line: 1446, column: 16, scope: !1799)
!1813 = !DILocation(line: 1446, column: 29, scope: !1799)
!1814 = !DILocation(line: 1446, column: 28, scope: !1799)
!1815 = !DILocation(line: 1446, column: 45, scope: !1799)
!1816 = !DILocation(line: 1446, column: 54, scope: !1799)
!1817 = !DILocation(line: 1446, column: 53, scope: !1799)
!1818 = !DILocation(line: 1446, column: 42, scope: !1799)
!1819 = !DILocation(line: 1446, column: 13, scope: !1799)
!1820 = !DILocation(line: 1447, column: 13, scope: !1799)
!1821 = !DILocation(line: 1447, column: 12, scope: !1799)
!1822 = !DILocation(line: 1447, column: 22, scope: !1799)
!1823 = !DILocation(line: 1447, column: 4, scope: !1799)
!1824 = !DILocation(line: 1452, column: 6, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1826, file: !74, line: 1452, column: 6)
!1826 = distinct !DILexicalBlock(scope: !1750, file: !74, line: 1451, column: 2)
!1827 = !DILocation(line: 1452, column: 18, scope: !1825)
!1828 = !DILocation(line: 1452, column: 6, scope: !1826)
!1829 = !DILocation(line: 1454, column: 7, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1831, file: !74, line: 1454, column: 7)
!1831 = distinct !DILexicalBlock(scope: !1825, file: !74, line: 1453, column: 3)
!1832 = !DILocation(line: 1454, column: 19, scope: !1830)
!1833 = !DILocation(line: 1454, column: 7, scope: !1831)
!1834 = !DILocation(line: 1456, column: 5, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1830, file: !74, line: 1455, column: 4)
!1836 = !DILocation(line: 1460, column: 23, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1830, file: !74, line: 1459, column: 4)
!1838 = !DILocation(line: 1460, column: 22, scope: !1837)
!1839 = !DILocation(line: 1460, column: 35, scope: !1837)
!1840 = !DILocation(line: 1460, column: 20, scope: !1837)
!1841 = !DILocation(line: 1461, column: 17, scope: !1837)
!1842 = !DILocation(line: 1461, column: 31, scope: !1837)
!1843 = !DILocation(line: 1461, column: 41, scope: !1837)
!1844 = !DILocation(line: 1461, column: 40, scope: !1837)
!1845 = !DILocation(line: 1461, column: 59, scope: !1837)
!1846 = !DILocation(line: 1461, column: 57, scope: !1837)
!1847 = !DILocation(line: 1461, column: 27, scope: !1837)
!1848 = !DILocation(line: 1461, column: 76, scope: !1837)
!1849 = !DILocation(line: 1461, column: 14, scope: !1837)
!1850 = !DILocation(line: 1462, column: 17, scope: !1837)
!1851 = !DILocation(line: 1462, column: 27, scope: !1837)
!1852 = !DILocation(line: 1462, column: 26, scope: !1837)
!1853 = !DILocation(line: 1462, column: 46, scope: !1837)
!1854 = !DILocation(line: 1462, column: 55, scope: !1837)
!1855 = !DILocation(line: 1462, column: 54, scope: !1837)
!1856 = !DILocation(line: 1462, column: 43, scope: !1837)
!1857 = !DILocation(line: 1462, column: 14, scope: !1837)
!1858 = !DILocation(line: 1463, column: 14, scope: !1837)
!1859 = !DILocation(line: 1463, column: 13, scope: !1837)
!1860 = !DILocation(line: 1463, column: 23, scope: !1837)
!1861 = !DILocation(line: 1463, column: 5, scope: !1837)
!1862 = !DILocation(line: 1468, column: 16, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1825, file: !74, line: 1467, column: 3)
!1864 = !DILocation(line: 1468, column: 30, scope: !1863)
!1865 = !DILocation(line: 1468, column: 40, scope: !1863)
!1866 = !DILocation(line: 1468, column: 39, scope: !1863)
!1867 = !DILocation(line: 1468, column: 55, scope: !1863)
!1868 = !DILocation(line: 1468, column: 53, scope: !1863)
!1869 = !DILocation(line: 1468, column: 26, scope: !1863)
!1870 = !DILocation(line: 1468, column: 69, scope: !1863)
!1871 = !DILocation(line: 1468, column: 13, scope: !1863)
!1872 = !DILocation(line: 1469, column: 16, scope: !1863)
!1873 = !DILocation(line: 1469, column: 26, scope: !1863)
!1874 = !DILocation(line: 1469, column: 25, scope: !1863)
!1875 = !DILocation(line: 1469, column: 42, scope: !1863)
!1876 = !DILocation(line: 1469, column: 51, scope: !1863)
!1877 = !DILocation(line: 1469, column: 50, scope: !1863)
!1878 = !DILocation(line: 1469, column: 39, scope: !1863)
!1879 = !DILocation(line: 1469, column: 13, scope: !1863)
!1880 = !DILocation(line: 1470, column: 11, scope: !1863)
!1881 = !DILocation(line: 1470, column: 4, scope: !1863)
!1882 = !DILocation(line: 1473, column: 1, scope: !1728)
!1883 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1491, type: !1884, scopeLine: 1492, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1884 = !DISubroutineType(types: !1885)
!1885 = !{!6, !25, !433}
!1886 = !DILocalVariable(name: "numerator", arg: 1, scope: !1883, file: !74, line: 1491, type: !25)
!1887 = !DILocation(line: 1491, column: 25, scope: !1883)
!1888 = !DILocalVariable(name: "denominator", arg: 2, scope: !1883, file: !74, line: 1491, type: !433)
!1889 = !DILocation(line: 1491, column: 40, scope: !1883)
!1890 = !DILocalVariable(name: "numerator_prime", scope: !1883, file: !74, line: 1494, type: !433)
!1891 = !DILocation(line: 1494, column: 6, scope: !1883)
!1892 = !DILocalVariable(name: "u32Temp1", scope: !1883, file: !74, line: 1494, type: !433)
!1893 = !DILocation(line: 1494, column: 27, scope: !1883)
!1894 = !DILocalVariable(name: "u32Temp2", scope: !1883, file: !74, line: 1494, type: !433)
!1895 = !DILocation(line: 1494, column: 41, scope: !1883)
!1896 = !DILocalVariable(name: "u32Temp3", scope: !1883, file: !74, line: 1494, type: !433)
!1897 = !DILocation(line: 1494, column: 55, scope: !1883)
!1898 = !DILocalVariable(name: "s32Temp1", scope: !1883, file: !74, line: 1495, type: !25)
!1899 = !DILocation(line: 1495, column: 6, scope: !1883)
!1900 = !DILocalVariable(name: "s32Temp2", scope: !1883, file: !74, line: 1495, type: !25)
!1901 = !DILocation(line: 1495, column: 20, scope: !1883)
!1902 = !DILocalVariable(name: "s32Temp3", scope: !1883, file: !74, line: 1495, type: !25)
!1903 = !DILocation(line: 1495, column: 34, scope: !1883)
!1904 = !DILocation(line: 1496, column: 5, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1883, file: !74, line: 1496, column: 5)
!1906 = !DILocation(line: 1496, column: 17, scope: !1905)
!1907 = !DILocation(line: 1496, column: 5, scope: !1883)
!1908 = !DILocation(line: 1498, column: 6, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1910, file: !74, line: 1498, column: 6)
!1910 = distinct !DILexicalBlock(scope: !1905, file: !74, line: 1497, column: 2)
!1911 = !DILocation(line: 1498, column: 15, scope: !1909)
!1912 = !DILocation(line: 1498, column: 6, scope: !1910)
!1913 = !DILocation(line: 1500, column: 4, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1499, column: 3)
!1915 = !DILocation(line: 1504, column: 4, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1503, column: 3)
!1917 = !DILocation(line: 1509, column: 6, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1919, file: !74, line: 1509, column: 6)
!1919 = distinct !DILexicalBlock(scope: !1905, file: !74, line: 1508, column: 2)
!1920 = !DILocation(line: 1509, column: 16, scope: !1918)
!1921 = !DILocation(line: 1509, column: 6, scope: !1919)
!1922 = !DILocation(line: 1511, column: 23, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1918, file: !74, line: 1510, column: 3)
!1924 = !DILocation(line: 1511, column: 22, scope: !1923)
!1925 = !DILocation(line: 1511, column: 20, scope: !1923)
!1926 = !DILocation(line: 1512, column: 16, scope: !1923)
!1927 = !DILocation(line: 1512, column: 32, scope: !1923)
!1928 = !DILocation(line: 1512, column: 31, scope: !1923)
!1929 = !DILocation(line: 1512, column: 13, scope: !1923)
!1930 = !DILocation(line: 1513, column: 15, scope: !1923)
!1931 = !DILocation(line: 1513, column: 34, scope: !1923)
!1932 = !DILocation(line: 1513, column: 45, scope: !1923)
!1933 = !DILocation(line: 1513, column: 43, scope: !1923)
!1934 = !DILocation(line: 1513, column: 31, scope: !1923)
!1935 = !DILocation(line: 1513, column: 13, scope: !1923)
!1936 = !DILocation(line: 1515, column: 8, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1923, file: !74, line: 1515, column: 7)
!1938 = !DILocation(line: 1515, column: 20, scope: !1937)
!1939 = !DILocation(line: 1515, column: 27, scope: !1937)
!1940 = !DILocation(line: 1515, column: 7, scope: !1923)
!1941 = !DILocation(line: 1517, column: 19, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1937, file: !74, line: 1516, column: 4)
!1943 = !DILocation(line: 1517, column: 31, scope: !1942)
!1944 = !DILocation(line: 1517, column: 17, scope: !1942)
!1945 = !DILocation(line: 1518, column: 4, scope: !1942)
!1946 = !DILocation(line: 1521, column: 20, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1937, file: !74, line: 1520, column: 4)
!1948 = !DILocation(line: 1521, column: 32, scope: !1947)
!1949 = !DILocation(line: 1521, column: 38, scope: !1947)
!1950 = !DILocation(line: 1521, column: 17, scope: !1947)
!1951 = !DILocation(line: 1524, column: 7, scope: !1952)
!1952 = distinct !DILexicalBlock(scope: !1923, file: !74, line: 1524, column: 7)
!1953 = !DILocation(line: 1524, column: 18, scope: !1952)
!1954 = !DILocation(line: 1524, column: 16, scope: !1952)
!1955 = !DILocation(line: 1524, column: 7, scope: !1923)
!1956 = !DILocation(line: 1526, column: 18, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1952, file: !74, line: 1525, column: 4)
!1958 = !DILocation(line: 1526, column: 16, scope: !1957)
!1959 = !DILocation(line: 1526, column: 28, scope: !1957)
!1960 = !DILocation(line: 1526, column: 14, scope: !1957)
!1961 = !DILocation(line: 1527, column: 4, scope: !1957)
!1962 = !DILocation(line: 1530, column: 18, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1952, file: !74, line: 1529, column: 4)
!1964 = !DILocation(line: 1530, column: 26, scope: !1963)
!1965 = !DILocation(line: 1530, column: 16, scope: !1963)
!1966 = !DILocation(line: 1530, column: 30, scope: !1963)
!1967 = !DILocation(line: 1530, column: 14, scope: !1963)
!1968 = !DILocation(line: 1532, column: 8, scope: !1969)
!1969 = distinct !DILexicalBlock(scope: !1923, file: !74, line: 1532, column: 7)
!1970 = !DILocation(line: 1532, column: 18, scope: !1969)
!1971 = !DILocation(line: 1532, column: 7, scope: !1923)
!1972 = !DILocation(line: 1534, column: 18, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1969, file: !74, line: 1533, column: 4)
!1974 = !DILocation(line: 1534, column: 12, scope: !1973)
!1975 = !DILocation(line: 1534, column: 5, scope: !1973)
!1976 = !DILocation(line: 1538, column: 5, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1969, file: !74, line: 1537, column: 4)
!1978 = !DILocation(line: 1543, column: 16, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1918, file: !74, line: 1542, column: 3)
!1980 = !DILocation(line: 1543, column: 26, scope: !1979)
!1981 = !DILocation(line: 1543, column: 25, scope: !1979)
!1982 = !DILocation(line: 1543, column: 41, scope: !1979)
!1983 = !DILocation(line: 1543, column: 39, scope: !1979)
!1984 = !DILocation(line: 1543, column: 13, scope: !1979)
!1985 = !DILocation(line: 1544, column: 16, scope: !1979)
!1986 = !DILocation(line: 1544, column: 30, scope: !1979)
!1987 = !DILocation(line: 1544, column: 40, scope: !1979)
!1988 = !DILocation(line: 1544, column: 39, scope: !1979)
!1989 = !DILocation(line: 1544, column: 55, scope: !1979)
!1990 = !DILocation(line: 1544, column: 53, scope: !1979)
!1991 = !DILocation(line: 1544, column: 26, scope: !1979)
!1992 = !DILocation(line: 1544, column: 68, scope: !1979)
!1993 = !DILocation(line: 1544, column: 13, scope: !1979)
!1994 = !DILocation(line: 1545, column: 16, scope: !1979)
!1995 = !DILocation(line: 1545, column: 25, scope: !1979)
!1996 = !DILocation(line: 1545, column: 24, scope: !1979)
!1997 = !DILocation(line: 1545, column: 41, scope: !1979)
!1998 = !DILocation(line: 1545, column: 51, scope: !1979)
!1999 = !DILocation(line: 1545, column: 50, scope: !1979)
!2000 = !DILocation(line: 1545, column: 38, scope: !1979)
!2001 = !DILocation(line: 1545, column: 13, scope: !1979)
!2002 = !DILocation(line: 1546, column: 7, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !1979, file: !74, line: 1546, column: 7)
!2004 = !DILocation(line: 1546, column: 16, scope: !2003)
!2005 = !DILocation(line: 1546, column: 7, scope: !1979)
!2006 = !DILocation(line: 1548, column: 17, scope: !2007)
!2007 = distinct !DILexicalBlock(scope: !2003, file: !74, line: 1547, column: 4)
!2008 = !DILocation(line: 1548, column: 12, scope: !2007)
!2009 = !DILocation(line: 1548, column: 5, scope: !2007)
!2010 = !DILocation(line: 1552, column: 5, scope: !2011)
!2011 = distinct !DILexicalBlock(scope: !2003, file: !74, line: 1551, column: 4)
!2012 = !DILocation(line: 1556, column: 1, scope: !1883)
!2013 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2014, file: !2014, line: 12, type: !2015, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2018)
!2014 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2015 = !DISubroutineType(types: !2016)
!2016 = !{null, !2017}
!2017 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2018 = !{!2019}
!2019 = !DILocalVariable(name: "z", arg: 1, scope: !2013, file: !2014, line: 12, type: !2017)
!2020 = !DILocation(line: 0, scope: !2013)
!2021 = !DILocation(line: 13, column: 9, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2013, file: !2014, line: 13, column: 7)
!2023 = !DILocation(line: 13, column: 7, scope: !2013)
!2024 = !DILocation(line: 14, column: 5, scope: !2022)
!2025 = !DILocation(line: 15, column: 1, scope: !2013)
!2026 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2027, file: !2027, line: 20, type: !2028, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2031)
!2027 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2028 = !DISubroutineType(types: !2029)
!2029 = !{null, !2030, !2030}
!2030 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2031 = !{!2032, !2033}
!2032 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2026, file: !2027, line: 20, type: !2030)
!2033 = !DILocalVariable(name: "shift", arg: 2, scope: !2026, file: !2027, line: 20, type: !2030)
!2034 = !DILocation(line: 0, scope: !2026)
!2035 = !DILocation(line: 21, column: 13, scope: !2036)
!2036 = distinct !DILexicalBlock(scope: !2026, file: !2027, line: 21, column: 7)
!2037 = !DILocation(line: 21, column: 7, scope: !2026)
!2038 = !DILocation(line: 27, column: 5, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2036, file: !2027, line: 21, column: 26)
!2040 = !DILocation(line: 29, column: 1, scope: !2026)
