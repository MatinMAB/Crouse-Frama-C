; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140/build/u16_mul_s16_u16_div_u16_alarm_0140.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [129 x i8] c"KLEE-ALARM-0140: signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0140.err\00", align 1
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
  %call = call zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %3, i16 zeroext %4, i16 zeroext %5), !dbg !69
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
  %4 = load i32, i32* %s32Result, align 4, !dbg !786
  %5 = load i32, i32* %s32Result, align 4, !dbg !788
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !789
  %conv8 = sext i16 %6 to i32, !dbg !789
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !790
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !790
  %div = sdiv i32 %5, %conv8, !dbg !790, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !791
  %conv9 = sext i16 %7 to i32, !dbg !791
  %mul10 = mul nsw i32 %div, %conv9, !dbg !792
  %sub = sub nsw i32 %4, %mul10, !dbg !793
  %shl = shl i32 %sub, 1, !dbg !794
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !795
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !796
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !797
  %conv11 = sext i16 %9 to i32, !dbg !797
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !798
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !798
  %div12 = sdiv i32 %8, %conv11, !dbg !798, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !799
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !800
  %conv13 = sext i16 %11 to i32, !dbg !800
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !801
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !801
  %div14 = sdiv i32 %10, %conv13, !dbg !801, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !802
  store i32 %add, i32* %s32Result, align 4, !dbg !803
  %12 = load i32, i32* %s32Result, align 4, !dbg !804
  %cmp15 = icmp slt i32 %12, 65535, !dbg !806
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !807

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !808
  %cmp18 = icmp sgt i32 %13, 0, !dbg !811
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !812

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !813
  %conv21 = trunc i32 %14 to i16, !dbg !815
  store i16 %conv21, i16* %retval, align 2, !dbg !816
  br label %return, !dbg !816

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !817
  br label %return, !dbg !817

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !819
  br label %return, !dbg !819

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !821
  ret i16 %15, !dbg !821
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !822 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !825, metadata !DIExpression()), !dbg !826
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !827, metadata !DIExpression()), !dbg !828
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !829, metadata !DIExpression()), !dbg !830
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !831, metadata !DIExpression()), !dbg !832
  store i32 0, i32* %s32Result, align 4, !dbg !832
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !833, metadata !DIExpression()), !dbg !834
  store i32 0, i32* %s32Temp1, align 4, !dbg !834
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !835
  %conv = sext i16 %0 to i32, !dbg !835
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !836
  %conv1 = zext i16 %1 to i32, !dbg !836
  %mul = mul nsw i32 %conv, %conv1, !dbg !837
  store i32 %mul, i32* %s32Result, align 4, !dbg !838
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !839
  %conv2 = zext i16 %2 to i32, !dbg !839
  %cmp = icmp eq i32 %conv2, 0, !dbg !841
  br i1 %cmp, label %if.then, label %if.else7, !dbg !842

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !843
  %cmp4 = icmp sge i32 %3, 0, !dbg !846
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !847

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !848
  br label %return, !dbg !848

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !850
  br label %return, !dbg !850

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !852
  %5 = load i32, i32* %s32Result, align 4, !dbg !855
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !856
  %conv8 = zext i16 %6 to i32, !dbg !857
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !858
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !858
  %div = sdiv i32 %5, %conv8, !dbg !858, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !859
  %conv9 = zext i16 %7 to i32, !dbg !860
  %mul10 = mul nsw i32 %div, %conv9, !dbg !861
  %sub = sub nsw i32 %4, %mul10, !dbg !862
  %conv11 = sext i32 %sub to i64, !dbg !863
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv11), !dbg !864
  %tobool = icmp ne i32 %call, 0, !dbg !864
  br i1 %tobool, label %if.end, label %if.then12, !dbg !865

if.then12:                                        ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !866
  br label %return, !dbg !866

if.end:                                           ; preds = %if.else7
  %8 = load i32, i32* %s32Result, align 4, !dbg !868
  %9 = load i32, i32* %s32Result, align 4, !dbg !870
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !871
  %conv13 = zext i16 %10 to i32, !dbg !872
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !873
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !873
  %div14 = sdiv i32 %9, %conv13, !dbg !873, !klee.check.div !111
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !874
  %conv15 = zext i16 %11 to i32, !dbg !875
  %mul16 = mul nsw i32 %div14, %conv15, !dbg !876
  %sub17 = sub nsw i32 %8, %mul16, !dbg !877
  %conv18 = sext i32 %sub17 to i64, !dbg !878
  %call19 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv18, i32 1), !dbg !879
  %tobool20 = icmp ne i32 %call19, 0, !dbg !879
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !880

if.then21:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !881
  br label %return, !dbg !881

if.end22:                                         ; preds = %if.end
  %12 = load i32, i32* %s32Result, align 4, !dbg !883
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !885
  %conv23 = zext i16 %13 to i32, !dbg !886
  %int_cast_to_i642 = zext i32 %conv23 to i64, !dbg !887
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !887
  %div24 = sdiv i32 %12, %conv23, !dbg !887, !klee.check.div !111
  %conv25 = sext i32 %div24 to i64, !dbg !888
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !889
  %conv26 = zext i16 %14 to i32, !dbg !890
  %conv27 = sext i32 %conv26 to i64, !dbg !891
  %call28 = call i32 @klee_alarm_s32_mul_upper(i64 %conv25, i64 %conv27), !dbg !892
  %tobool29 = icmp ne i32 %call28, 0, !dbg !892
  br i1 %tobool29, label %if.end31, label %if.then30, !dbg !893

if.then30:                                        ; preds = %if.end22
  store i16 0, i16* %retval, align 2, !dbg !894
  br label %return, !dbg !894

if.end31:                                         ; preds = %if.end22
  %15 = load i32, i32* %s32Result, align 4, !dbg !896
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !898
  %conv32 = zext i16 %16 to i32, !dbg !899
  %int_cast_to_i643 = zext i32 %conv32 to i64, !dbg !900
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !900
  %div33 = sdiv i32 %15, %conv32, !dbg !900, !klee.check.div !111
  %conv34 = sext i32 %div33 to i64, !dbg !901
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !902
  %conv35 = zext i16 %17 to i32, !dbg !903
  %conv36 = sext i32 %conv35 to i64, !dbg !904
  %call37 = call i32 @klee_alarm_s32_mul_lower(i64 %conv34, i64 %conv36), !dbg !905
  %tobool38 = icmp ne i32 %call37, 0, !dbg !905
  br i1 %tobool38, label %if.end40, label %if.then39, !dbg !906

if.then39:                                        ; preds = %if.end31
  store i16 0, i16* %retval, align 2, !dbg !907
  br label %return, !dbg !907

if.end40:                                         ; preds = %if.end31
  %18 = load i32, i32* %s32Result, align 4, !dbg !909
  %conv41 = sext i32 %18 to i64, !dbg !911
  %19 = load i32, i32* %s32Result, align 4, !dbg !912
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !913
  %conv42 = zext i16 %20 to i32, !dbg !914
  %int_cast_to_i644 = zext i32 %conv42 to i64, !dbg !915
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !915
  %div43 = sdiv i32 %19, %conv42, !dbg !915, !klee.check.div !111
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !916
  %conv44 = zext i16 %21 to i32, !dbg !917
  %mul45 = mul nsw i32 %div43, %conv44, !dbg !918
  %conv46 = sext i32 %mul45 to i64, !dbg !919
  %call47 = call i32 @klee_alarm_s32_sub_lower(i64 %conv41, i64 %conv46), !dbg !920
  %tobool48 = icmp ne i32 %call47, 0, !dbg !920
  br i1 %tobool48, label %if.end50, label %if.then49, !dbg !921

if.then49:                                        ; preds = %if.end40
  store i16 0, i16* %retval, align 2, !dbg !922
  br label %return, !dbg !922

if.end50:                                         ; preds = %if.end40
  %22 = load i32, i32* %s32Result, align 4, !dbg !924
  %23 = load i32, i32* %s32Result, align 4, !dbg !925
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !926
  %conv51 = zext i16 %24 to i32, !dbg !926
  %int_cast_to_i645 = zext i32 %conv51 to i64, !dbg !927
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !927
  %div52 = sdiv i32 %23, %conv51, !dbg !927, !klee.check.div !111
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !928
  %conv53 = zext i16 %25 to i32, !dbg !928
  %mul54 = mul nsw i32 %div52, %conv53, !dbg !929
  %sub55 = sub nsw i32 %22, %mul54, !dbg !930
  %shl = shl i32 %sub55, 1, !dbg !931
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !932
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !933
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !935
  %conv56 = zext i16 %27 to i32, !dbg !936
  %int_cast_to_i646 = zext i32 %conv56 to i64, !dbg !937
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !937
  %div57 = sdiv i32 %26, %conv56, !dbg !937, !klee.check.div !111
  %conv58 = sext i32 %div57 to i64, !dbg !938
  %28 = load i32, i32* %s32Result, align 4, !dbg !939
  %29 = load i16, i16* %denominator.addr, align 2, !dbg !940
  %conv59 = zext i16 %29 to i32, !dbg !941
  %int_cast_to_i647 = zext i32 %conv59 to i64, !dbg !942
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !942
  %div60 = sdiv i32 %28, %conv59, !dbg !942, !klee.check.div !111
  %conv61 = sext i32 %div60 to i64, !dbg !943
  %call62 = call i32 @klee_alarm_s32_add_upper(i64 %conv58, i64 %conv61), !dbg !944
  %tobool63 = icmp ne i32 %call62, 0, !dbg !944
  br i1 %tobool63, label %if.end65, label %if.then64, !dbg !945

if.then64:                                        ; preds = %if.end50
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 820, i8* getelementptr inbounds ([129 x i8], [129 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !946
  unreachable, !dbg !946

if.end65:                                         ; preds = %if.end50
  %30 = load i32, i32* %s32Temp1, align 4, !dbg !948
  %31 = load i16, i16* %denominator.addr, align 2, !dbg !949
  %conv66 = zext i16 %31 to i32, !dbg !950
  %int_cast_to_i648 = zext i32 %conv66 to i64, !dbg !951
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !951
  %div67 = sdiv i32 %30, %conv66, !dbg !951, !klee.check.div !111
  %32 = load i32, i32* %s32Result, align 4, !dbg !952
  %33 = load i16, i16* %denominator.addr, align 2, !dbg !953
  %conv68 = zext i16 %33 to i32, !dbg !954
  %int_cast_to_i649 = zext i32 %conv68 to i64, !dbg !955
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !955
  %div69 = sdiv i32 %32, %conv68, !dbg !955, !klee.check.div !111
  %add = add nsw i32 %div67, %div69, !dbg !956
  %conv70 = sext i32 %add to i64, !dbg !957
  store volatile i64 %conv70, i64* @klee_alarm_sink_s64, align 8, !dbg !958
  store i16 0, i16* %retval, align 2, !dbg !959
  br label %return, !dbg !959

return:                                           ; preds = %if.end65, %if.then49, %if.then39, %if.then30, %if.then21, %if.then12, %if.else, %if.then6
  %34 = load i16, i16* %retval, align 2, !dbg !960
  ret i16 %34, !dbg !960
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !961 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !964, metadata !DIExpression()), !dbg !965
  %0 = load i64, i64* %left.addr, align 8, !dbg !966
  %cmp = icmp sge i64 %0, 0, !dbg !967
  %conv = zext i1 %cmp to i32, !dbg !967
  ret i32 %conv, !dbg !968
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !969 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !972, metadata !DIExpression()), !dbg !973
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !974, metadata !DIExpression()), !dbg !975
  %0 = load i32, i32* %count.addr, align 4, !dbg !976
  %cmp = icmp uge i32 %0, 63, !dbg !978
  br i1 %cmp, label %if.then, label %if.end, !dbg !979

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !980
  br label %return, !dbg !980

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !982
  %2 = load i32, i32* %count.addr, align 4, !dbg !983
  %sh_prom = zext i32 %2 to i64, !dbg !984
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !984
  %shl = shl i64 1, %sh_prom, !dbg !984, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !985
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !986
  %conv = zext i1 %cmp1 to i32, !dbg !986
  store i32 %conv, i32* %retval, align 4, !dbg !987
  br label %return, !dbg !987

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !988
  ret i32 %3, !dbg !988
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !989 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !992, metadata !DIExpression()), !dbg !993
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !994, metadata !DIExpression()), !dbg !995
  %0 = load i64, i64* %left.addr, align 8, !dbg !996
  %1 = load i64, i64* %right.addr, align 8, !dbg !997
  %mul = mul nsw i64 %0, %1, !dbg !998
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !999
  %conv = zext i1 %cmp to i32, !dbg !999
  ret i32 %conv, !dbg !1000
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !1001 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1004, metadata !DIExpression()), !dbg !1005
  %0 = load i64, i64* %left.addr, align 8, !dbg !1006
  %1 = load i64, i64* %right.addr, align 8, !dbg !1007
  %mul = mul nsw i64 %0, %1, !dbg !1008
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !1009
  %conv = zext i1 %cmp to i32, !dbg !1009
  ret i32 %conv, !dbg !1010
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !1011 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1012, metadata !DIExpression()), !dbg !1013
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1014, metadata !DIExpression()), !dbg !1015
  %0 = load i64, i64* %left.addr, align 8, !dbg !1016
  %1 = load i64, i64* %right.addr, align 8, !dbg !1017
  %sub = sub nsw i64 %0, %1, !dbg !1018
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !1019
  %conv = zext i1 %cmp to i32, !dbg !1019
  ret i32 %conv, !dbg !1020
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !1021 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  %0 = load i64, i64* %left.addr, align 8, !dbg !1026
  %1 = load i64, i64* %right.addr, align 8, !dbg !1027
  %add = add nsw i64 %0, %1, !dbg !1028
  %cmp = icmp sle i64 %add, 2147483647, !dbg !1029
  %conv = zext i1 %cmp to i32, !dbg !1029
  ret i32 %conv, !dbg !1030
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1031 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1034, metadata !DIExpression()), !dbg !1035
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1036, metadata !DIExpression()), !dbg !1037
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1038, metadata !DIExpression()), !dbg !1039
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1040, metadata !DIExpression()), !dbg !1041
  store i32 0, i32* %u32Temp1, align 4, !dbg !1041
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1043
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1044
  %conv = zext i16 %0 to i32, !dbg !1044
  %cmp = icmp eq i32 %conv, 0, !dbg !1046
  br i1 %cmp, label %if.then, label %if.else, !dbg !1047

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1048
  br label %return, !dbg !1048

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1050
  %conv2 = zext i16 %1 to i32, !dbg !1050
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1052
  %conv3 = zext i16 %2 to i32, !dbg !1052
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1053
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1054
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1055
  %conv4 = zext i16 %3 to i32, !dbg !1055
  %shr = ashr i32 %conv4, 1, !dbg !1056
  %conv5 = trunc i32 %shr to i16, !dbg !1055
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1057
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1058
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1059
  %conv6 = zext i16 %5 to i32, !dbg !1059
  %add = add i32 %4, %conv6, !dbg !1060
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1061
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1062
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1063
  %conv7 = zext i16 %7 to i32, !dbg !1063
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1064
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1064
  %div = udiv i32 %6, %conv7, !dbg !1064, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1065
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1066
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1068
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1069

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1070
  %and = and i32 %9, 65535, !dbg !1072
  %conv11 = trunc i32 %and to i16, !dbg !1073
  store i16 %conv11, i16* %retval, align 2, !dbg !1074
  br label %return, !dbg !1074

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1075
  br label %return, !dbg !1075

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1077
  ret i16 %10, !dbg !1077
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1078 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1081, metadata !DIExpression()), !dbg !1082
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1083, metadata !DIExpression()), !dbg !1084
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1087, metadata !DIExpression()), !dbg !1088
  store i32 0, i32* %u32Temp1, align 4, !dbg !1088
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1089
  %cmp = icmp eq i32 %0, 0, !dbg !1091
  br i1 %cmp, label %if.then, label %if.else, !dbg !1092

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1093
  br label %return, !dbg !1093

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1095
  %conv = zext i16 %1 to i32, !dbg !1095
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1097
  %conv1 = zext i16 %2 to i32, !dbg !1097
  %mul = mul nsw i32 %conv, %conv1, !dbg !1098
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1099
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1100
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1100
  %div = udiv i32 %mul, %3, !dbg !1100, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1101
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1102
  %conv2 = zext i16 %4 to i32, !dbg !1102
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1104
  %conv3 = zext i16 %5 to i32, !dbg !1104
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1105
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1107
  %mul5 = mul i32 %6, %7, !dbg !1108
  %sub = sub i32 %mul4, %mul5, !dbg !1109
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1110
  %div6 = udiv i32 %8, 2, !dbg !1111
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1112
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1113

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1114
  %inc = add i32 %9, 1, !dbg !1114
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1114
  br label %if.end, !dbg !1116

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1117
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1119
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1120

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1121
  %and = and i32 %11, 65535, !dbg !1123
  %conv13 = trunc i32 %and to i16, !dbg !1124
  store i16 %conv13, i16* %retval, align 2, !dbg !1125
  br label %return, !dbg !1125

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1126
  br label %return, !dbg !1126

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1128
  ret i16 %12, !dbg !1128
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1129 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1132, metadata !DIExpression()), !dbg !1133
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1134, metadata !DIExpression()), !dbg !1135
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1136, metadata !DIExpression()), !dbg !1137
  store i32 0, i32* %u32Temp1, align 4, !dbg !1137
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1138
  %conv = zext i16 %0 to i32, !dbg !1138
  %cmp = icmp eq i32 %conv, 0, !dbg !1140
  br i1 %cmp, label %if.then, label %if.else, !dbg !1141

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1142
  br label %return, !dbg !1142

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1144
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1146
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1147
  %conv2 = zext i16 %3 to i32, !dbg !1147
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1148
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1148
  %div = udiv i32 %2, %conv2, !dbg !1148, !klee.check.div !111
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1149
  %conv3 = zext i16 %4 to i32, !dbg !1149
  %mul = mul i32 %div, %conv3, !dbg !1150
  %sub = sub i32 %1, %mul, !dbg !1151
  %shl = shl i32 %sub, 1, !dbg !1152
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1153
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1154
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1155
  %conv4 = zext i16 %6 to i32, !dbg !1155
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1156
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1156
  %div5 = udiv i32 %5, %conv4, !dbg !1156, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1157
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1158
  %conv6 = zext i16 %8 to i32, !dbg !1158
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1159
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1159
  %div7 = udiv i32 %7, %conv6, !dbg !1159, !klee.check.div !111
  %add = add i32 %div5, %div7, !dbg !1160
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1161
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1162
  store i32 %9, i32* %retval, align 4, !dbg !1163
  br label %return, !dbg !1163

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1164
  ret i32 %10, !dbg !1164
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1165 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1168, metadata !DIExpression()), !dbg !1169
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1170, metadata !DIExpression()), !dbg !1171
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1172, metadata !DIExpression()), !dbg !1173
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1174, metadata !DIExpression()), !dbg !1175
  store i32 0, i32* %s32Temp1, align 4, !dbg !1175
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1176, metadata !DIExpression()), !dbg !1177
  store i32 0, i32* %s32Temp2, align 4, !dbg !1177
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1178, metadata !DIExpression()), !dbg !1179
  store i32 0, i32* %s32Temp3, align 4, !dbg !1179
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1180
  %conv = sext i16 %0 to i32, !dbg !1180
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1181
  %conv1 = sext i16 %1 to i32, !dbg !1181
  %mul = mul nsw i32 %conv, %conv1, !dbg !1182
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1183
  %2 = load i16, i16* %div.addr, align 2, !dbg !1184
  %conv2 = sext i16 %2 to i32, !dbg !1184
  %cmp = icmp eq i32 %conv2, 0, !dbg !1186
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1187

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1188
  %cmp4 = icmp slt i32 %3, 0, !dbg !1191
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1192

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1193
  br label %return, !dbg !1193

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1195
  br label %return, !dbg !1195

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1197
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1199
  %6 = load i16, i16* %div.addr, align 2, !dbg !1200
  %conv8 = sext i16 %6 to i32, !dbg !1200
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1201
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1201
  %div9 = sdiv i32 %5, %conv8, !dbg !1201, !klee.check.div !111
  %7 = load i16, i16* %div.addr, align 2, !dbg !1202
  %conv10 = sext i16 %7 to i32, !dbg !1202
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1203
  %sub = sub nsw i32 %4, %mul11, !dbg !1204
  %shl = shl i32 %sub, 1, !dbg !1205
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1206
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1207
  %9 = load i16, i16* %div.addr, align 2, !dbg !1208
  %conv12 = sext i16 %9 to i32, !dbg !1208
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1209
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1209
  %div13 = sdiv i32 %8, %conv12, !dbg !1209, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1210
  %11 = load i16, i16* %div.addr, align 2, !dbg !1211
  %conv14 = sext i16 %11 to i32, !dbg !1211
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1212
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1212
  %div15 = sdiv i32 %10, %conv14, !dbg !1212, !klee.check.div !111
  %add = add nsw i32 %div13, %div15, !dbg !1213
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1214
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1215
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1217
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1218

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1219
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1222
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1223

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1224
  %conv22 = trunc i32 %14 to i16, !dbg !1226
  store i16 %conv22, i16* %retval, align 2, !dbg !1227
  br label %return, !dbg !1227

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1228
  br label %return, !dbg !1228

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1230
  br label %return, !dbg !1230

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1232
  ret i16 %15, !dbg !1232
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1233 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1236, metadata !DIExpression()), !dbg !1237
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1238, metadata !DIExpression()), !dbg !1239
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1240, metadata !DIExpression()), !dbg !1241
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1242, metadata !DIExpression()), !dbg !1243
  store i32 0, i32* %s32Result, align 4, !dbg !1243
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1244, metadata !DIExpression()), !dbg !1245
  store i32 0, i32* %s32Temp1, align 4, !dbg !1245
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1246
  %conv = sext i16 %0 to i32, !dbg !1246
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1247
  %conv1 = sext i16 %1 to i32, !dbg !1247
  %mul = mul nsw i32 %conv, %conv1, !dbg !1248
  store i32 %mul, i32* %s32Result, align 4, !dbg !1249
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1250
  %conv2 = zext i16 %2 to i32, !dbg !1250
  %cmp = icmp eq i32 %conv2, 0, !dbg !1252
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1253

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1254
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1257
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1258

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1259
  br label %return, !dbg !1259

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1261
  %cmp7 = icmp eq i32 %4, 0, !dbg !1263
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1264

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1265
  br label %return, !dbg !1265

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1267
  br label %return, !dbg !1267

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1269
  %6 = load i32, i32* %s32Result, align 4, !dbg !1271
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1272
  %conv12 = zext i16 %7 to i32, !dbg !1272
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1273
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1273
  %div = sdiv i32 %6, %conv12, !dbg !1273, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1274
  %conv13 = zext i16 %8 to i32, !dbg !1274
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1275
  %sub = sub nsw i32 %5, %mul14, !dbg !1276
  %shl = shl i32 %sub, 1, !dbg !1277
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1278
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1279
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1280
  %conv15 = zext i16 %10 to i32, !dbg !1280
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1281
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1281
  %div16 = sdiv i32 %9, %conv15, !dbg !1281, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1282
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1283
  %conv17 = zext i16 %12 to i32, !dbg !1283
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1284
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1284
  %div18 = sdiv i32 %11, %conv17, !dbg !1284, !klee.check.div !111
  %add = add nsw i32 %div16, %div18, !dbg !1285
  store i32 %add, i32* %s32Result, align 4, !dbg !1286
  %13 = load i32, i32* %s32Result, align 4, !dbg !1287
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1289
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1290

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1291
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1294
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1295

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1296
  %conv25 = trunc i32 %15 to i16, !dbg !1298
  store i16 %conv25, i16* %retval, align 2, !dbg !1299
  br label %return, !dbg !1299

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1300
  br label %return, !dbg !1300

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1302
  br label %return, !dbg !1302

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1304
  ret i16 %16, !dbg !1304
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1305 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1310, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1312, metadata !DIExpression()), !dbg !1313
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1314
  %cmp = icmp eq i32 %0, 0, !dbg !1316
  br i1 %cmp, label %if.then, label %if.else, !dbg !1317

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1318
  br label %return, !dbg !1318

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1320
  %cmp1 = icmp sle i32 %1, 0, !dbg !1323
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1324

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1325
  br label %return, !dbg !1325

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1327
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1329
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1330
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1331
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1331
  %div = udiv i32 %3, %4, !dbg !1331, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1332
  %mul = mul i32 %div, %5, !dbg !1333
  %sub = sub i32 %2, %mul, !dbg !1334
  %shl = shl i32 %sub, 1, !dbg !1335
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1336
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1337
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1338
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1339
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1339
  %div4 = udiv i32 %6, %7, !dbg !1339, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1340
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1341
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1342
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1342
  %div5 = udiv i32 %8, %9, !dbg !1342, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1343
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1344
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1345
  store i32 %10, i32* %retval, align 4, !dbg !1346
  br label %return, !dbg !1346

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1347
  ret i32 %11, !dbg !1347
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1348 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1351, metadata !DIExpression()), !dbg !1352
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1353, metadata !DIExpression()), !dbg !1354
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1355, metadata !DIExpression()), !dbg !1356
  store i32 0, i32* %s32Temp1, align 4, !dbg !1356
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1357
  %cmp = icmp eq i32 %0, 0, !dbg !1359
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1360

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1361
  %cmp1 = icmp sge i32 %1, 0, !dbg !1364
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1365

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1368
  br label %return, !dbg !1368

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1370
  %cmp4 = icmp sge i32 %2, 0, !dbg !1373
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1374

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1375
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1377
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1378
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1379
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1379
  %div = udiv i32 %4, %5, !dbg !1379, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %mul = mul i32 %div, %6, !dbg !1381
  %sub = sub i32 %3, %mul, !dbg !1382
  %shl = shl i32 %sub, 1, !dbg !1383
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1384
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1385
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1386
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1387
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1387
  %div6 = udiv i32 %7, %8, !dbg !1387, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1388
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1389
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1390
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1390
  %div7 = udiv i32 %9, %10, !dbg !1390, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1391
  store i32 %add, i32* %retval, align 4, !dbg !1392
  br label %return, !dbg !1392

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1393
  br label %return, !dbg !1393

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1395
  ret i32 %11, !dbg !1395
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1396 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1399, metadata !DIExpression()), !dbg !1400
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1401, metadata !DIExpression()), !dbg !1402
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1403, metadata !DIExpression()), !dbg !1404
  store i32 0, i32* %u32Temp1, align 4, !dbg !1404
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1405, metadata !DIExpression()), !dbg !1406
  store i32 0, i32* %u32Temp2, align 4, !dbg !1406
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %cmp = icmp eq i32 %0, 0, !dbg !1409
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1410

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1411
  %cmp1 = icmp slt i32 %1, 0, !dbg !1414
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1415

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1416
  br label %return, !dbg !1416

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1418
  br label %return, !dbg !1418

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1420
  %cmp4 = icmp sge i32 %2, 0, !dbg !1423
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1424

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1425
  %cmp6 = icmp eq i32 %3, 0, !dbg !1428
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1429

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1430
  br label %return, !dbg !1430

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1432
  %cmp9 = icmp sle i32 %4, 0, !dbg !1435
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1436

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1437
  br label %return, !dbg !1437

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1439
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1441
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1442
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1443
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1443
  %div = sdiv i32 %6, %7, !dbg !1443, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1444
  %mul = mul nsw i32 %div, %8, !dbg !1445
  %sub = sub nsw i32 %5, %mul, !dbg !1446
  %shl = shl i32 %sub, 1, !dbg !1447
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1448
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1449
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1451
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1451
  %div12 = udiv i32 %9, %10, !dbg !1451, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1452
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1453
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1454
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1454
  %div13 = sdiv i32 %11, %12, !dbg !1454, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1455
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1456
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1457
  store i32 %13, i32* %retval, align 4, !dbg !1458
  br label %return, !dbg !1458

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1462
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1463

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1464
  br label %return, !dbg !1464

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1466
  %sub18 = sub nsw i32 0, %15, !dbg !1468
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1469
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %sub19 = sub nsw i32 0, %16, !dbg !1471
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1472
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1473
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1476
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1476
  %div20 = sdiv i32 %18, %19, !dbg !1476, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1477
  %mul21 = mul nsw i32 %div20, %20, !dbg !1478
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1479
  %shl23 = shl i32 %sub22, 1, !dbg !1480
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1481
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1482
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1483
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1484
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1484
  %div24 = udiv i32 %21, %22, !dbg !1484, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1487
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1487
  %div25 = sdiv i32 %23, %24, !dbg !1487, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1488
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1489
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1490
  store i32 %25, i32* %retval, align 4, !dbg !1491
  br label %return, !dbg !1491

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1492
  ret i32 %26, !dbg !1492
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1493 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1496, metadata !DIExpression()), !dbg !1497
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1498, metadata !DIExpression()), !dbg !1499
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1500, metadata !DIExpression()), !dbg !1501
  store i32 0, i32* %u32Temp1, align 4, !dbg !1501
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1502, metadata !DIExpression()), !dbg !1503
  store i32 0, i32* %u32Temp2, align 4, !dbg !1503
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1504, metadata !DIExpression()), !dbg !1505
  store i32 0, i32* %u32Temp3, align 4, !dbg !1505
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 0, i32* %numerator_old, align 4, !dbg !1507
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1508
  %cmp = icmp eq i32 %0, 0, !dbg !1510
  br i1 %cmp, label %if.then, label %if.else, !dbg !1511

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1514
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1516
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1517
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1519
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1519
  %div = udiv i32 %3, %4, !dbg !1519, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1520
  %sub = sub i32 %1, %mul, !dbg !1521
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1522
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1523
  %and = and i32 %5, 1, !dbg !1525
  %cmp1 = icmp eq i32 %and, 0, !dbg !1526
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1527

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %shr = lshr i32 %6, 1, !dbg !1530
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1531
  br label %if.end, !dbg !1532

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %shr4 = lshr i32 %7, 1, !dbg !1535
  %add = add i32 %shr4, 1, !dbg !1536
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1537
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1538
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1540
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1541
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1542

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1543
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1546
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1546
  %div7 = udiv i32 %10, %11, !dbg !1546, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1547
  br label %return, !dbg !1547

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1548
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1550
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1551
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1551
  %div9 = udiv i32 %12, %13, !dbg !1551, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1552
  store i32 %add10, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1554
  ret i32 %14, !dbg !1554
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1555 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1558, metadata !DIExpression()), !dbg !1559
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1560, metadata !DIExpression()), !dbg !1561
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1562, metadata !DIExpression()), !dbg !1563
  store i32 0, i32* %u32Temp1, align 4, !dbg !1563
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1564, metadata !DIExpression()), !dbg !1565
  store i32 0, i32* %u32Temp2, align 4, !dbg !1565
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %cmp = icmp sle i32 %0, 0, !dbg !1568
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1569

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %cmp1 = icmp sge i32 %1, 0, !dbg !1573
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1574

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1575
  br label %return, !dbg !1575

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1577
  %sub = sub nsw i32 0, %2, !dbg !1579
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1580
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1581
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1582
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1584
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1584
  %div = udiv i32 %4, %5, !dbg !1584, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1585
  %mul = mul i32 %div, %6, !dbg !1586
  %sub3 = sub i32 %3, %mul, !dbg !1587
  %shl = shl i32 %sub3, 1, !dbg !1588
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1589
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1590
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1591
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1592
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1592
  %div4 = udiv i32 %7, %8, !dbg !1592, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1593
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1594
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1595
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1595
  %div5 = udiv i32 %9, %10, !dbg !1595, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1596
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1597
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1598
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1600
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1601

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1602
  %sub8 = sub i32 0, %12, !dbg !1604
  store i32 %sub8, i32* %retval, align 4, !dbg !1605
  br label %return, !dbg !1605

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1606
  br label %return, !dbg !1606

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1608
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1610
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1611
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1612
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1612
  %div11 = udiv i32 %14, %15, !dbg !1612, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1613
  %mul12 = mul i32 %div11, %16, !dbg !1614
  %sub13 = sub i32 %13, %mul12, !dbg !1615
  %shl14 = shl i32 %sub13, 1, !dbg !1616
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1617
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1618
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1619
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1620
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1620
  %div15 = udiv i32 %17, %18, !dbg !1620, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1621
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1622
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1623
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1623
  %div16 = udiv i32 %19, %20, !dbg !1623, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1624
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1625
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1626
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1628
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1629

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1630
  store i32 %22, i32* %retval, align 4, !dbg !1632
  br label %return, !dbg !1632

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1633
  br label %return, !dbg !1633

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1635
  ret i32 %23, !dbg !1635
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1636 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1639, metadata !DIExpression()), !dbg !1640
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1641, metadata !DIExpression()), !dbg !1642
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1643, metadata !DIExpression()), !dbg !1644
  store i32 0, i32* %s32Temp1, align 4, !dbg !1644
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1645, metadata !DIExpression()), !dbg !1646
  store i32 0, i32* %s32Temp2, align 4, !dbg !1646
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1647, metadata !DIExpression()), !dbg !1648
  store i32 0, i32* %u32Temp0, align 4, !dbg !1648
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1649, metadata !DIExpression()), !dbg !1650
  store i32 0, i32* %u32Temp1, align 4, !dbg !1650
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1651, metadata !DIExpression()), !dbg !1652
  store i32 0, i32* %u32Temp2, align 4, !dbg !1652
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1653
  %cmp = icmp eq i32 %0, 0, !dbg !1655
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1656

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1657
  %cmp1 = icmp slt i32 %1, 0, !dbg !1660
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1661

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1662
  br label %return, !dbg !1662

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1664
  br label %return, !dbg !1664

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1666
  %cmp4 = icmp sle i32 %2, 0, !dbg !1669
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1670

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1671
  %sub = sub nsw i32 0, %3, !dbg !1673
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1674
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1675
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1676
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1677
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1677
  %div = udiv i32 %4, %5, !dbg !1677, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1678
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1679
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1680
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1681
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1682
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1682
  %div6 = udiv i32 %7, %8, !dbg !1682, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1683
  %mul = mul i32 %div6, %9, !dbg !1684
  %sub7 = sub i32 %6, %mul, !dbg !1685
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1686
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1687
  %and = and i32 %10, 1, !dbg !1689
  %cmp8 = icmp eq i32 %and, 0, !dbg !1690
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1691

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1692
  %shr = lshr i32 %11, 1, !dbg !1694
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1695
  br label %if.end, !dbg !1696

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1697
  %shr11 = lshr i32 %12, 1, !dbg !1699
  %add = add i32 %shr11, 1, !dbg !1700
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1701
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1702
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1704
  %cmp12 = icmp ult i32 %13, %14, !dbg !1705
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1706

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1707
  %neg = xor i32 %15, -1, !dbg !1709
  %add14 = add i32 %neg, 1, !dbg !1710
  store i32 %add14, i32* %retval, align 4, !dbg !1711
  br label %return, !dbg !1711

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1712
  %add16 = add i32 %16, 1, !dbg !1714
  %neg17 = xor i32 %add16, -1, !dbg !1715
  %add18 = add i32 %neg17, 1, !dbg !1716
  store i32 %add18, i32* %retval, align 4, !dbg !1717
  br label %return, !dbg !1717

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1718
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1720
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1721
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1722
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1722
  %div20 = udiv i32 %18, %19, !dbg !1722, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1723
  %mul21 = mul i32 %div20, %20, !dbg !1724
  %sub22 = sub i32 %17, %mul21, !dbg !1725
  %shl = shl i32 %sub22, 1, !dbg !1726
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1727
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1728
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1729
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1730
  %div23 = udiv i32 %21, %22, !dbg !1730, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1731
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1732
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1733
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1733
  %div24 = udiv i32 %23, %24, !dbg !1733, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1734
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1735
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1736
  store i32 %25, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1738
  ret i32 %26, !dbg !1738
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1739 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1742, metadata !DIExpression()), !dbg !1743
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1746, metadata !DIExpression()), !dbg !1747
  store i32 0, i32* %s32Temp1, align 4, !dbg !1747
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1748, metadata !DIExpression()), !dbg !1749
  store i32 0, i32* %s32Temp2, align 4, !dbg !1749
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1750, metadata !DIExpression()), !dbg !1751
  store i32 0, i32* %denominator_prime, align 4, !dbg !1751
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1752, metadata !DIExpression()), !dbg !1753
  store i32 0, i32* %u32Temp1, align 4, !dbg !1753
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1754, metadata !DIExpression()), !dbg !1755
  store i32 0, i32* %u32Temp2, align 4, !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1756, metadata !DIExpression()), !dbg !1757
  store i32 0, i32* %u32numerator, align 4, !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i32 0, i32* %u32denominator, align 4, !dbg !1759
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1760
  %cmp = icmp slt i32 %0, 0, !dbg !1762
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1763

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %cmp1 = icmp sle i32 %1, 0, !dbg !1767
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1768

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1769
  %cmp3 = icmp sge i32 %2, 0, !dbg !1772
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1773

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1774
  br label %return, !dbg !1774

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1776
  %sub = sub nsw i32 0, %3, !dbg !1778
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1779
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1780
  %sub5 = sub nsw i32 0, %4, !dbg !1781
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1782
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1783
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1784
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1785
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1786
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1786
  %div = udiv i32 %6, %7, !dbg !1786, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1787
  %mul = mul i32 %div, %8, !dbg !1788
  %sub6 = sub i32 %5, %mul, !dbg !1789
  %shl = shl i32 %sub6, 1, !dbg !1790
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1791
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1792
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1793
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1794
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1794
  %div7 = udiv i32 %9, %10, !dbg !1794, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1795
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1796
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1797
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1797
  %div8 = udiv i32 %11, %12, !dbg !1797, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1798
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1799
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1800
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1802
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1803

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1804
  store i32 %14, i32* %retval, align 4, !dbg !1806
  br label %return, !dbg !1806

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1807
  br label %return, !dbg !1807

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %neg = xor i32 %15, -1, !dbg !1811
  %add13 = add nsw i32 %neg, 1, !dbg !1812
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1813
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1814
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1815
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1817
  %div14 = udiv i32 %17, %18, !dbg !1817, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1818
  %mul15 = mul i32 %div14, %19, !dbg !1819
  %sub16 = sub i32 %16, %mul15, !dbg !1820
  %shl17 = shl i32 %sub16, 1, !dbg !1821
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1822
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1823
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1825
  %div18 = udiv i32 %20, %21, !dbg !1825, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1826
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1827
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1828
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1828
  %div19 = sdiv i32 %22, %23, !dbg !1828, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1829
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1830
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1831
  %neg21 = xor i32 %24, -1, !dbg !1832
  %add22 = add nsw i32 %neg21, 1, !dbg !1833
  store i32 %add22, i32* %retval, align 4, !dbg !1834
  br label %return, !dbg !1834

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %cmp24 = icmp sle i32 %25, 0, !dbg !1838
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1839

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1840
  %cmp26 = icmp sge i32 %26, 0, !dbg !1843
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1844

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1845
  br label %return, !dbg !1845

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1847
  %neg29 = xor i32 %27, -1, !dbg !1849
  %add30 = add nsw i32 %neg29, 1, !dbg !1850
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1851
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1852
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1853
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1854
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1855
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1855
  %div31 = udiv i32 %29, %30, !dbg !1855, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1856
  %mul32 = mul i32 %div31, %31, !dbg !1857
  %sub33 = sub i32 %28, %mul32, !dbg !1858
  %shl34 = shl i32 %sub33, 1, !dbg !1859
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1860
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1861
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1862
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1863
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1863
  %div35 = udiv i32 %32, %33, !dbg !1863, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1864
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1865
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1866
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1866
  %div36 = udiv i32 %34, %35, !dbg !1866, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1867
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1868
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1869
  %neg38 = xor i32 %36, -1, !dbg !1870
  %add39 = add nsw i32 %neg38, 1, !dbg !1871
  store i32 %add39, i32* %retval, align 4, !dbg !1872
  br label %return, !dbg !1872

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1873
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1875
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1876
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1877
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1877
  %div41 = sdiv i32 %38, %39, !dbg !1877, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %mul42 = mul nsw i32 %div41, %40, !dbg !1879
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1880
  %shl44 = shl i32 %sub43, 1, !dbg !1881
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1882
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1883
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1884
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1885
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1885
  %div45 = sdiv i32 %41, %42, !dbg !1885, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1886
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1887
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1888
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1888
  %div46 = udiv i32 %43, %44, !dbg !1888, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1889
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1890
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1891
  store i32 %45, i32* %retval, align 4, !dbg !1892
  br label %return, !dbg !1892

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1893
  ret i32 %46, !dbg !1893
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1894 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1897, metadata !DIExpression()), !dbg !1898
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1899, metadata !DIExpression()), !dbg !1900
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1901, metadata !DIExpression()), !dbg !1902
  store i32 0, i32* %numerator_prime, align 4, !dbg !1902
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1903, metadata !DIExpression()), !dbg !1904
  store i32 0, i32* %u32Temp1, align 4, !dbg !1904
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1905, metadata !DIExpression()), !dbg !1906
  store i32 0, i32* %u32Temp2, align 4, !dbg !1906
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1907, metadata !DIExpression()), !dbg !1908
  store i32 0, i32* %u32Temp3, align 4, !dbg !1908
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1909, metadata !DIExpression()), !dbg !1910
  store i32 0, i32* %s32Temp1, align 4, !dbg !1910
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1911, metadata !DIExpression()), !dbg !1912
  store i32 0, i32* %s32Temp2, align 4, !dbg !1912
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1913, metadata !DIExpression()), !dbg !1914
  store i32 0, i32* %s32Temp3, align 4, !dbg !1914
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1915
  %cmp = icmp eq i32 %0, 0, !dbg !1917
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1918

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1919
  %cmp1 = icmp slt i32 %1, 0, !dbg !1922
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1923

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1924
  br label %return, !dbg !1924

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1926
  br label %return, !dbg !1926

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1928
  %cmp4 = icmp slt i32 %2, 0, !dbg !1931
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1932

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1933
  %sub = sub nsw i32 0, %3, !dbg !1935
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1936
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1937
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1938
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1939
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1939
  %div = udiv i32 %4, %5, !dbg !1939, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1940
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1941
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1942
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1943
  %mul = mul i32 %7, %8, !dbg !1944
  %sub6 = sub i32 %6, %mul, !dbg !1945
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1946
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1947
  %and = and i32 %9, 1, !dbg !1949
  %cmp7 = icmp eq i32 %and, 0, !dbg !1950
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1951

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1952
  %shr = lshr i32 %10, 1, !dbg !1954
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1955
  br label %if.end, !dbg !1956

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1957
  %shr10 = lshr i32 %11, 1, !dbg !1959
  %add = add i32 %shr10, 1, !dbg !1960
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1961
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1962
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1964
  %cmp11 = icmp ult i32 %12, %13, !dbg !1965
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1966

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1967
  %neg = xor i32 %14, -1, !dbg !1969
  %add13 = add i32 %neg, 1, !dbg !1970
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1971
  br label %if.end18, !dbg !1972

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1973
  %add15 = add i32 %15, 1, !dbg !1975
  %neg16 = xor i32 %add15, -1, !dbg !1976
  %add17 = add i32 %neg16, 1, !dbg !1977
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1978
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1979
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1981
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1982

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1983
  %conv = trunc i32 %17 to i16, !dbg !1985
  store i16 %conv, i16* %retval, align 2, !dbg !1986
  br label %return, !dbg !1986

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1987
  br label %return, !dbg !1987

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1989
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1991
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1992
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1992
  %div23 = udiv i32 %18, %19, !dbg !1992, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1993
  %mul24 = mul i32 %div23, %20, !dbg !1994
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1995
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1996
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1997
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1998
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1999
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1999
  %div25 = udiv i32 %22, %23, !dbg !1999, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2000
  %mul26 = mul i32 %div25, %24, !dbg !2001
  %sub27 = sub i32 %21, %mul26, !dbg !2002
  %shl = shl i32 %sub27, 1, !dbg !2003
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2004
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2005
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2006
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2007
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2007
  %div28 = udiv i32 %25, %26, !dbg !2007, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2008
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2009
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2010
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2010
  %div29 = udiv i32 %27, %28, !dbg !2010, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !2011
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2012
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2013
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2015
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2016

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2017
  %conv34 = trunc i32 %30 to i16, !dbg !2019
  store i16 %conv34, i16* %retval, align 2, !dbg !2020
  br label %return, !dbg !2020

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2021
  br label %return, !dbg !2021

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2023
  ret i16 %31, !dbg !2023
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2024 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2030, metadata !DIExpression()), !dbg !2031
  %2 = icmp eq i64 %0, 0, !dbg !2032
  br i1 %2, label %3, label %4, !dbg !2034

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2035
  unreachable, !dbg !2035

4:                                                ; preds = %1
  ret void, !dbg !2036
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2037 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2043, metadata !DIExpression()), !dbg !2045
  call void @llvm.dbg.value(metadata i64 %1, metadata !2044, metadata !DIExpression()), !dbg !2045
  %3 = icmp ult i64 %1, %0, !dbg !2046
  br i1 %3, label %5, label %4, !dbg !2048

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2049
  unreachable, !dbg !2049

5:                                                ; preds = %2
  ret void, !dbg !2051
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140/div_Ccode_alarm_0140.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "factor1", scope: !48, file: !49, line: 9, type: !8)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "factor2", scope: !48, file: !49, line: 10, type: !19)
!55 = !DILocation(line: 10, column: 14, scope: !48)
!56 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 11, type: !19)
!57 = !DILocation(line: 11, column: 14, scope: !48)
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
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140")
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
!786 = !DILocation(line: 740, column: 15, scope: !787)
!787 = distinct !DILexicalBlock(scope: !774, file: !74, line: 739, column: 2)
!788 = !DILocation(line: 740, column: 29, scope: !787)
!789 = !DILocation(line: 740, column: 39, scope: !787)
!790 = !DILocation(line: 740, column: 38, scope: !787)
!791 = !DILocation(line: 740, column: 54, scope: !787)
!792 = !DILocation(line: 740, column: 52, scope: !787)
!793 = !DILocation(line: 740, column: 25, scope: !787)
!794 = !DILocation(line: 740, column: 68, scope: !787)
!795 = !DILocation(line: 740, column: 12, scope: !787)
!796 = !DILocation(line: 741, column: 16, scope: !787)
!797 = !DILocation(line: 741, column: 25, scope: !787)
!798 = !DILocation(line: 741, column: 24, scope: !787)
!799 = !DILocation(line: 741, column: 41, scope: !787)
!800 = !DILocation(line: 741, column: 51, scope: !787)
!801 = !DILocation(line: 741, column: 50, scope: !787)
!802 = !DILocation(line: 741, column: 38, scope: !787)
!803 = !DILocation(line: 741, column: 13, scope: !787)
!804 = !DILocation(line: 742, column: 6, scope: !805)
!805 = distinct !DILexicalBlock(scope: !787, file: !74, line: 742, column: 6)
!806 = !DILocation(line: 742, column: 16, scope: !805)
!807 = !DILocation(line: 742, column: 6, scope: !787)
!808 = !DILocation(line: 744, column: 7, scope: !809)
!809 = distinct !DILexicalBlock(scope: !810, file: !74, line: 744, column: 7)
!810 = distinct !DILexicalBlock(scope: !805, file: !74, line: 743, column: 3)
!811 = !DILocation(line: 744, column: 17, scope: !809)
!812 = !DILocation(line: 744, column: 7, scope: !810)
!813 = !DILocation(line: 746, column: 17, scope: !814)
!814 = distinct !DILexicalBlock(scope: !809, file: !74, line: 745, column: 4)
!815 = !DILocation(line: 746, column: 12, scope: !814)
!816 = !DILocation(line: 746, column: 5, scope: !814)
!817 = !DILocation(line: 750, column: 5, scope: !818)
!818 = distinct !DILexicalBlock(scope: !809, file: !74, line: 749, column: 4)
!819 = !DILocation(line: 755, column: 4, scope: !820)
!820 = distinct !DILexicalBlock(scope: !805, file: !74, line: 754, column: 3)
!821 = !DILocation(line: 758, column: 1, scope: !752)
!822 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !74, file: !74, line: 777, type: !823, scopeLine: 778, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!823 = !DISubroutineType(types: !824)
!824 = !{!18, !6, !18, !18}
!825 = !DILocalVariable(name: "factor1", arg: 1, scope: !822, file: !74, line: 777, type: !6)
!826 = !DILocation(line: 777, column: 33, scope: !822)
!827 = !DILocalVariable(name: "factor2", arg: 2, scope: !822, file: !74, line: 777, type: !18)
!828 = !DILocation(line: 777, column: 46, scope: !822)
!829 = !DILocalVariable(name: "denominator", arg: 3, scope: !822, file: !74, line: 777, type: !18)
!830 = !DILocation(line: 777, column: 59, scope: !822)
!831 = !DILocalVariable(name: "s32Result", scope: !822, file: !74, line: 779, type: !25)
!832 = !DILocation(line: 779, column: 6, scope: !822)
!833 = !DILocalVariable(name: "s32Temp1", scope: !822, file: !74, line: 779, type: !25)
!834 = !DILocation(line: 779, column: 21, scope: !822)
!835 = !DILocation(line: 780, column: 14, scope: !822)
!836 = !DILocation(line: 780, column: 24, scope: !822)
!837 = !DILocation(line: 780, column: 22, scope: !822)
!838 = !DILocation(line: 780, column: 12, scope: !822)
!839 = !DILocation(line: 782, column: 5, scope: !840)
!840 = distinct !DILexicalBlock(scope: !822, file: !74, line: 782, column: 5)
!841 = !DILocation(line: 782, column: 17, scope: !840)
!842 = !DILocation(line: 782, column: 5, scope: !822)
!843 = !DILocation(line: 784, column: 6, scope: !844)
!844 = distinct !DILexicalBlock(scope: !845, file: !74, line: 784, column: 6)
!845 = distinct !DILexicalBlock(scope: !840, file: !74, line: 783, column: 2)
!846 = !DILocation(line: 784, column: 16, scope: !844)
!847 = !DILocation(line: 784, column: 6, scope: !845)
!848 = !DILocation(line: 786, column: 4, scope: !849)
!849 = distinct !DILexicalBlock(scope: !844, file: !74, line: 785, column: 3)
!850 = !DILocation(line: 790, column: 4, scope: !851)
!851 = distinct !DILexicalBlock(scope: !844, file: !74, line: 789, column: 3)
!852 = !DILocation(line: 796, column: 63, scope: !853)
!853 = distinct !DILexicalBlock(scope: !854, file: !74, line: 796, column: 7)
!854 = distinct !DILexicalBlock(scope: !840, file: !74, line: 794, column: 2)
!855 = !DILocation(line: 796, column: 87, scope: !853)
!856 = !DILocation(line: 796, column: 104, scope: !853)
!857 = !DILocation(line: 796, column: 99, scope: !853)
!858 = !DILocation(line: 796, column: 97, scope: !853)
!859 = !DILocation(line: 796, column: 124, scope: !853)
!860 = !DILocation(line: 796, column: 119, scope: !853)
!861 = !DILocation(line: 796, column: 117, scope: !853)
!862 = !DILocation(line: 796, column: 73, scope: !853)
!863 = !DILocation(line: 796, column: 47, scope: !853)
!864 = !DILocation(line: 796, column: 9, scope: !853)
!865 = !DILocation(line: 796, column: 7, scope: !854)
!866 = !DILocation(line: 797, column: 7, scope: !867)
!867 = distinct !DILexicalBlock(scope: !853, file: !74, line: 796, column: 142)
!868 = !DILocation(line: 800, column: 53, scope: !869)
!869 = distinct !DILexicalBlock(scope: !854, file: !74, line: 800, column: 7)
!870 = !DILocation(line: 800, column: 77, scope: !869)
!871 = !DILocation(line: 800, column: 94, scope: !869)
!872 = !DILocation(line: 800, column: 89, scope: !869)
!873 = !DILocation(line: 800, column: 87, scope: !869)
!874 = !DILocation(line: 800, column: 114, scope: !869)
!875 = !DILocation(line: 800, column: 109, scope: !869)
!876 = !DILocation(line: 800, column: 107, scope: !869)
!877 = !DILocation(line: 800, column: 63, scope: !869)
!878 = !DILocation(line: 800, column: 37, scope: !869)
!879 = !DILocation(line: 800, column: 9, scope: !869)
!880 = !DILocation(line: 800, column: 7, scope: !854)
!881 = !DILocation(line: 801, column: 7, scope: !882)
!882 = distinct !DILexicalBlock(scope: !869, file: !74, line: 800, column: 147)
!883 = !DILocation(line: 804, column: 50, scope: !884)
!884 = distinct !DILexicalBlock(scope: !854, file: !74, line: 804, column: 7)
!885 = !DILocation(line: 804, column: 67, scope: !884)
!886 = !DILocation(line: 804, column: 62, scope: !884)
!887 = !DILocation(line: 804, column: 60, scope: !884)
!888 = !DILocation(line: 804, column: 34, scope: !884)
!889 = !DILocation(line: 804, column: 97, scope: !884)
!890 = !DILocation(line: 804, column: 92, scope: !884)
!891 = !DILocation(line: 804, column: 82, scope: !884)
!892 = !DILocation(line: 804, column: 9, scope: !884)
!893 = !DILocation(line: 804, column: 7, scope: !854)
!894 = !DILocation(line: 805, column: 7, scope: !895)
!895 = distinct !DILexicalBlock(scope: !884, file: !74, line: 804, column: 113)
!896 = !DILocation(line: 808, column: 50, scope: !897)
!897 = distinct !DILexicalBlock(scope: !854, file: !74, line: 808, column: 7)
!898 = !DILocation(line: 808, column: 67, scope: !897)
!899 = !DILocation(line: 808, column: 62, scope: !897)
!900 = !DILocation(line: 808, column: 60, scope: !897)
!901 = !DILocation(line: 808, column: 34, scope: !897)
!902 = !DILocation(line: 808, column: 97, scope: !897)
!903 = !DILocation(line: 808, column: 92, scope: !897)
!904 = !DILocation(line: 808, column: 82, scope: !897)
!905 = !DILocation(line: 808, column: 9, scope: !897)
!906 = !DILocation(line: 808, column: 7, scope: !854)
!907 = !DILocation(line: 809, column: 7, scope: !908)
!908 = distinct !DILexicalBlock(scope: !897, file: !74, line: 808, column: 113)
!909 = !DILocation(line: 812, column: 44, scope: !910)
!910 = distinct !DILexicalBlock(scope: !854, file: !74, line: 812, column: 7)
!911 = !DILocation(line: 812, column: 34, scope: !910)
!912 = !DILocation(line: 812, column: 78, scope: !910)
!913 = !DILocation(line: 812, column: 95, scope: !910)
!914 = !DILocation(line: 812, column: 90, scope: !910)
!915 = !DILocation(line: 812, column: 88, scope: !910)
!916 = !DILocation(line: 812, column: 115, scope: !910)
!917 = !DILocation(line: 812, column: 110, scope: !910)
!918 = !DILocation(line: 812, column: 108, scope: !910)
!919 = !DILocation(line: 812, column: 56, scope: !910)
!920 = !DILocation(line: 812, column: 9, scope: !910)
!921 = !DILocation(line: 812, column: 7, scope: !854)
!922 = !DILocation(line: 813, column: 7, scope: !923)
!923 = distinct !DILexicalBlock(scope: !910, file: !74, line: 812, column: 132)
!924 = !DILocation(line: 815, column: 15, scope: !854)
!925 = !DILocation(line: 815, column: 29, scope: !854)
!926 = !DILocation(line: 815, column: 39, scope: !854)
!927 = !DILocation(line: 815, column: 38, scope: !854)
!928 = !DILocation(line: 815, column: 54, scope: !854)
!929 = !DILocation(line: 815, column: 52, scope: !854)
!930 = !DILocation(line: 815, column: 25, scope: !854)
!931 = !DILocation(line: 815, column: 68, scope: !854)
!932 = !DILocation(line: 815, column: 12, scope: !854)
!933 = !DILocation(line: 817, column: 50, scope: !934)
!934 = distinct !DILexicalBlock(scope: !854, file: !74, line: 817, column: 7)
!935 = !DILocation(line: 817, column: 66, scope: !934)
!936 = !DILocation(line: 817, column: 61, scope: !934)
!937 = !DILocation(line: 817, column: 59, scope: !934)
!938 = !DILocation(line: 817, column: 34, scope: !934)
!939 = !DILocation(line: 817, column: 97, scope: !934)
!940 = !DILocation(line: 817, column: 114, scope: !934)
!941 = !DILocation(line: 817, column: 109, scope: !934)
!942 = !DILocation(line: 817, column: 107, scope: !934)
!943 = !DILocation(line: 817, column: 81, scope: !934)
!944 = !DILocation(line: 817, column: 9, scope: !934)
!945 = !DILocation(line: 817, column: 7, scope: !854)
!946 = !DILocation(line: 818, column: 7, scope: !947)
!947 = distinct !DILexicalBlock(scope: !934, file: !74, line: 817, column: 131)
!948 = !DILocation(line: 825, column: 41, scope: !854)
!949 = !DILocation(line: 825, column: 57, scope: !854)
!950 = !DILocation(line: 825, column: 52, scope: !854)
!951 = !DILocation(line: 825, column: 50, scope: !854)
!952 = !DILocation(line: 825, column: 78, scope: !854)
!953 = !DILocation(line: 825, column: 95, scope: !854)
!954 = !DILocation(line: 825, column: 90, scope: !854)
!955 = !DILocation(line: 825, column: 88, scope: !854)
!956 = !DILocation(line: 825, column: 70, scope: !854)
!957 = !DILocation(line: 825, column: 25, scope: !854)
!958 = !DILocation(line: 825, column: 23, scope: !854)
!959 = !DILocation(line: 826, column: 3, scope: !854)
!960 = !DILocation(line: 844, column: 1, scope: !822)
!961 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !962, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!962 = !DISubroutineType(types: !963)
!963 = !{!28, !22}
!964 = !DILocalVariable(name: "left", arg: 1, scope: !961, file: !33, line: 84, type: !22)
!965 = !DILocation(line: 84, column: 51, scope: !961)
!966 = !DILocation(line: 86, column: 12, scope: !961)
!967 = !DILocation(line: 86, column: 17, scope: !961)
!968 = !DILocation(line: 86, column: 5, scope: !961)
!969 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !970, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!970 = !DISubroutineType(types: !971)
!971 = !{!28, !22, !29}
!972 = !DILocalVariable(name: "left", arg: 1, scope: !969, file: !33, line: 90, type: !22)
!973 = !DILocation(line: 90, column: 41, scope: !969)
!974 = !DILocalVariable(name: "count", arg: 2, scope: !969, file: !33, line: 90, type: !29)
!975 = !DILocation(line: 90, column: 56, scope: !969)
!976 = !DILocation(line: 92, column: 9, scope: !977)
!977 = distinct !DILexicalBlock(scope: !969, file: !33, line: 92, column: 9)
!978 = !DILocation(line: 92, column: 15, scope: !977)
!979 = !DILocation(line: 92, column: 9, scope: !969)
!980 = !DILocation(line: 93, column: 9, scope: !981)
!981 = distinct !DILexicalBlock(scope: !977, file: !33, line: 92, column: 32)
!982 = !DILocation(line: 95, column: 12, scope: !969)
!983 = !DILocation(line: 95, column: 34, scope: !969)
!984 = !DILocation(line: 95, column: 31, scope: !969)
!985 = !DILocation(line: 95, column: 17, scope: !969)
!986 = !DILocation(line: 95, column: 41, scope: !969)
!987 = !DILocation(line: 95, column: 5, scope: !969)
!988 = !DILocation(line: 96, column: 1, scope: !969)
!989 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !990, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!990 = !DISubroutineType(types: !991)
!991 = !{!28, !22, !22}
!992 = !DILocalVariable(name: "left", arg: 1, scope: !989, file: !33, line: 78, type: !22)
!993 = !DILocation(line: 78, column: 38, scope: !989)
!994 = !DILocalVariable(name: "right", arg: 2, scope: !989, file: !33, line: 78, type: !22)
!995 = !DILocation(line: 78, column: 52, scope: !989)
!996 = !DILocation(line: 80, column: 12, scope: !989)
!997 = !DILocation(line: 80, column: 19, scope: !989)
!998 = !DILocation(line: 80, column: 17, scope: !989)
!999 = !DILocation(line: 80, column: 25, scope: !989)
!1000 = !DILocation(line: 80, column: 5, scope: !989)
!1001 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !990, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1002 = !DILocalVariable(name: "left", arg: 1, scope: !1001, file: !33, line: 72, type: !22)
!1003 = !DILocation(line: 72, column: 38, scope: !1001)
!1004 = !DILocalVariable(name: "right", arg: 2, scope: !1001, file: !33, line: 72, type: !22)
!1005 = !DILocation(line: 72, column: 52, scope: !1001)
!1006 = !DILocation(line: 74, column: 12, scope: !1001)
!1007 = !DILocation(line: 74, column: 19, scope: !1001)
!1008 = !DILocation(line: 74, column: 17, scope: !1001)
!1009 = !DILocation(line: 74, column: 25, scope: !1001)
!1010 = !DILocation(line: 74, column: 5, scope: !1001)
!1011 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !33, file: !33, line: 60, type: !990, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1012 = !DILocalVariable(name: "left", arg: 1, scope: !1011, file: !33, line: 60, type: !22)
!1013 = !DILocation(line: 60, column: 38, scope: !1011)
!1014 = !DILocalVariable(name: "right", arg: 2, scope: !1011, file: !33, line: 60, type: !22)
!1015 = !DILocation(line: 60, column: 52, scope: !1011)
!1016 = !DILocation(line: 62, column: 12, scope: !1011)
!1017 = !DILocation(line: 62, column: 19, scope: !1011)
!1018 = !DILocation(line: 62, column: 17, scope: !1011)
!1019 = !DILocation(line: 62, column: 25, scope: !1011)
!1020 = !DILocation(line: 62, column: 5, scope: !1011)
!1021 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !990, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1022 = !DILocalVariable(name: "left", arg: 1, scope: !1021, file: !33, line: 54, type: !22)
!1023 = !DILocation(line: 54, column: 38, scope: !1021)
!1024 = !DILocalVariable(name: "right", arg: 2, scope: !1021, file: !33, line: 54, type: !22)
!1025 = !DILocation(line: 54, column: 52, scope: !1021)
!1026 = !DILocation(line: 56, column: 12, scope: !1021)
!1027 = !DILocation(line: 56, column: 19, scope: !1021)
!1028 = !DILocation(line: 56, column: 17, scope: !1021)
!1029 = !DILocation(line: 56, column: 25, scope: !1021)
!1030 = !DILocation(line: 56, column: 5, scope: !1021)
!1031 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 862, type: !1032, scopeLine: 863, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!18, !18, !18, !18}
!1034 = !DILocalVariable(name: "factor1", arg: 1, scope: !1031, file: !74, line: 862, type: !18)
!1035 = !DILocation(line: 862, column: 33, scope: !1031)
!1036 = !DILocalVariable(name: "factor2", arg: 2, scope: !1031, file: !74, line: 862, type: !18)
!1037 = !DILocation(line: 862, column: 46, scope: !1031)
!1038 = !DILocalVariable(name: "denominator", arg: 3, scope: !1031, file: !74, line: 862, type: !18)
!1039 = !DILocation(line: 862, column: 59, scope: !1031)
!1040 = !DILocalVariable(name: "u32Temp1", scope: !1031, file: !74, line: 864, type: !433)
!1041 = !DILocation(line: 864, column: 6, scope: !1031)
!1042 = !DILocalVariable(name: "u16TempDenom", scope: !1031, file: !74, line: 865, type: !18)
!1043 = !DILocation(line: 865, column: 6, scope: !1031)
!1044 = !DILocation(line: 867, column: 5, scope: !1045)
!1045 = distinct !DILexicalBlock(scope: !1031, file: !74, line: 867, column: 5)
!1046 = !DILocation(line: 867, column: 17, scope: !1045)
!1047 = !DILocation(line: 867, column: 5, scope: !1031)
!1048 = !DILocation(line: 869, column: 3, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1045, file: !74, line: 868, column: 2)
!1050 = !DILocation(line: 873, column: 14, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1045, file: !74, line: 872, column: 2)
!1052 = !DILocation(line: 873, column: 24, scope: !1051)
!1053 = !DILocation(line: 873, column: 22, scope: !1051)
!1054 = !DILocation(line: 873, column: 12, scope: !1051)
!1055 = !DILocation(line: 874, column: 18, scope: !1051)
!1056 = !DILocation(line: 874, column: 30, scope: !1051)
!1057 = !DILocation(line: 874, column: 16, scope: !1051)
!1058 = !DILocation(line: 875, column: 14, scope: !1051)
!1059 = !DILocation(line: 875, column: 25, scope: !1051)
!1060 = !DILocation(line: 875, column: 23, scope: !1051)
!1061 = !DILocation(line: 875, column: 12, scope: !1051)
!1062 = !DILocation(line: 876, column: 14, scope: !1051)
!1063 = !DILocation(line: 876, column: 25, scope: !1051)
!1064 = !DILocation(line: 876, column: 23, scope: !1051)
!1065 = !DILocation(line: 876, column: 12, scope: !1051)
!1066 = !DILocation(line: 877, column: 6, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1051, file: !74, line: 877, column: 6)
!1068 = !DILocation(line: 877, column: 15, scope: !1067)
!1069 = !DILocation(line: 877, column: 6, scope: !1051)
!1070 = !DILocation(line: 879, column: 12, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1067, file: !74, line: 878, column: 3)
!1072 = !DILocation(line: 879, column: 21, scope: !1071)
!1073 = !DILocation(line: 879, column: 11, scope: !1071)
!1074 = !DILocation(line: 879, column: 4, scope: !1071)
!1075 = !DILocation(line: 884, column: 4, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1067, file: !74, line: 883, column: 3)
!1077 = !DILocation(line: 889, column: 1, scope: !1031)
!1078 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 906, type: !1079, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!18, !18, !18, !433}
!1081 = !DILocalVariable(name: "factor1", arg: 1, scope: !1078, file: !74, line: 906, type: !18)
!1082 = !DILocation(line: 906, column: 33, scope: !1078)
!1083 = !DILocalVariable(name: "factor2", arg: 2, scope: !1078, file: !74, line: 906, type: !18)
!1084 = !DILocation(line: 906, column: 46, scope: !1078)
!1085 = !DILocalVariable(name: "denominator", arg: 3, scope: !1078, file: !74, line: 906, type: !433)
!1086 = !DILocation(line: 906, column: 59, scope: !1078)
!1087 = !DILocalVariable(name: "u32Temp1", scope: !1078, file: !74, line: 908, type: !433)
!1088 = !DILocation(line: 908, column: 6, scope: !1078)
!1089 = !DILocation(line: 909, column: 5, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1078, file: !74, line: 909, column: 5)
!1091 = !DILocation(line: 909, column: 17, scope: !1090)
!1092 = !DILocation(line: 909, column: 5, scope: !1078)
!1093 = !DILocation(line: 911, column: 3, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1090, file: !74, line: 910, column: 2)
!1095 = !DILocation(line: 915, column: 15, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1090, file: !74, line: 914, column: 2)
!1097 = !DILocation(line: 915, column: 25, scope: !1096)
!1098 = !DILocation(line: 915, column: 23, scope: !1096)
!1099 = !DILocation(line: 915, column: 36, scope: !1096)
!1100 = !DILocation(line: 915, column: 34, scope: !1096)
!1101 = !DILocation(line: 915, column: 12, scope: !1096)
!1102 = !DILocation(line: 916, column: 8, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1096, file: !74, line: 916, column: 6)
!1104 = !DILocation(line: 916, column: 18, scope: !1103)
!1105 = !DILocation(line: 916, column: 16, scope: !1103)
!1106 = !DILocation(line: 916, column: 28, scope: !1103)
!1107 = !DILocation(line: 916, column: 40, scope: !1103)
!1108 = !DILocation(line: 916, column: 39, scope: !1103)
!1109 = !DILocation(line: 916, column: 26, scope: !1103)
!1110 = !DILocation(line: 916, column: 53, scope: !1103)
!1111 = !DILocation(line: 916, column: 64, scope: !1103)
!1112 = !DILocation(line: 916, column: 50, scope: !1103)
!1113 = !DILocation(line: 916, column: 6, scope: !1096)
!1114 = !DILocation(line: 918, column: 12, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1103, file: !74, line: 917, column: 3)
!1116 = !DILocation(line: 919, column: 3, scope: !1115)
!1117 = !DILocation(line: 920, column: 6, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1096, file: !74, line: 920, column: 6)
!1119 = !DILocation(line: 920, column: 15, scope: !1118)
!1120 = !DILocation(line: 920, column: 6, scope: !1096)
!1121 = !DILocation(line: 922, column: 12, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1118, file: !74, line: 921, column: 3)
!1123 = !DILocation(line: 922, column: 21, scope: !1122)
!1124 = !DILocation(line: 922, column: 11, scope: !1122)
!1125 = !DILocation(line: 922, column: 4, scope: !1122)
!1126 = !DILocation(line: 926, column: 4, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1118, file: !74, line: 925, column: 3)
!1128 = !DILocation(line: 929, column: 1, scope: !1078)
!1129 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 946, type: !1130, scopeLine: 947, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!433, !433, !18}
!1132 = !DILocalVariable(name: "x_value", arg: 1, scope: !1129, file: !74, line: 946, type: !433)
!1133 = !DILocation(line: 946, column: 25, scope: !1129)
!1134 = !DILocalVariable(name: "y_value", arg: 2, scope: !1129, file: !74, line: 946, type: !18)
!1135 = !DILocation(line: 946, column: 38, scope: !1129)
!1136 = !DILocalVariable(name: "u32Temp1", scope: !1129, file: !74, line: 948, type: !433)
!1137 = !DILocation(line: 948, column: 6, scope: !1129)
!1138 = !DILocation(line: 949, column: 5, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1129, file: !74, line: 949, column: 5)
!1140 = !DILocation(line: 949, column: 13, scope: !1139)
!1141 = !DILocation(line: 949, column: 5, scope: !1129)
!1142 = !DILocation(line: 951, column: 3, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1139, file: !74, line: 950, column: 2)
!1144 = !DILocation(line: 955, column: 15, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1139, file: !74, line: 954, column: 2)
!1146 = !DILocation(line: 955, column: 26, scope: !1145)
!1147 = !DILocation(line: 955, column: 34, scope: !1145)
!1148 = !DILocation(line: 955, column: 33, scope: !1145)
!1149 = !DILocation(line: 955, column: 45, scope: !1145)
!1150 = !DILocation(line: 955, column: 43, scope: !1145)
!1151 = !DILocation(line: 955, column: 23, scope: !1145)
!1152 = !DILocation(line: 955, column: 54, scope: !1145)
!1153 = !DILocation(line: 955, column: 12, scope: !1145)
!1154 = !DILocation(line: 956, column: 15, scope: !1145)
!1155 = !DILocation(line: 956, column: 23, scope: !1145)
!1156 = !DILocation(line: 956, column: 22, scope: !1145)
!1157 = !DILocation(line: 956, column: 35, scope: !1145)
!1158 = !DILocation(line: 956, column: 44, scope: !1145)
!1159 = !DILocation(line: 956, column: 43, scope: !1145)
!1160 = !DILocation(line: 956, column: 32, scope: !1145)
!1161 = !DILocation(line: 956, column: 12, scope: !1145)
!1162 = !DILocation(line: 957, column: 10, scope: !1145)
!1163 = !DILocation(line: 957, column: 3, scope: !1145)
!1164 = !DILocation(line: 959, column: 1, scope: !1129)
!1165 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 977, type: !1166, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!6, !6, !6, !6}
!1168 = !DILocalVariable(name: "fak1", arg: 1, scope: !1165, file: !74, line: 977, type: !6)
!1169 = !DILocation(line: 977, column: 33, scope: !1165)
!1170 = !DILocalVariable(name: "fak2", arg: 2, scope: !1165, file: !74, line: 977, type: !6)
!1171 = !DILocation(line: 977, column: 43, scope: !1165)
!1172 = !DILocalVariable(name: "div", arg: 3, scope: !1165, file: !74, line: 977, type: !6)
!1173 = !DILocation(line: 977, column: 53, scope: !1165)
!1174 = !DILocalVariable(name: "s32Temp1", scope: !1165, file: !74, line: 979, type: !25)
!1175 = !DILocation(line: 979, column: 6, scope: !1165)
!1176 = !DILocalVariable(name: "s32Temp2", scope: !1165, file: !74, line: 979, type: !25)
!1177 = !DILocation(line: 979, column: 20, scope: !1165)
!1178 = !DILocalVariable(name: "s32Temp3", scope: !1165, file: !74, line: 979, type: !25)
!1179 = !DILocation(line: 979, column: 34, scope: !1165)
!1180 = !DILocation(line: 980, column: 13, scope: !1165)
!1181 = !DILocation(line: 980, column: 20, scope: !1165)
!1182 = !DILocation(line: 980, column: 18, scope: !1165)
!1183 = !DILocation(line: 980, column: 11, scope: !1165)
!1184 = !DILocation(line: 981, column: 5, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1165, file: !74, line: 981, column: 5)
!1186 = !DILocation(line: 981, column: 9, scope: !1185)
!1187 = !DILocation(line: 981, column: 5, scope: !1165)
!1188 = !DILocation(line: 983, column: 6, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1190, file: !74, line: 983, column: 6)
!1190 = distinct !DILexicalBlock(scope: !1185, file: !74, line: 982, column: 2)
!1191 = !DILocation(line: 983, column: 15, scope: !1189)
!1192 = !DILocation(line: 983, column: 6, scope: !1190)
!1193 = !DILocation(line: 985, column: 4, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1189, file: !74, line: 984, column: 3)
!1195 = !DILocation(line: 989, column: 4, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1189, file: !74, line: 988, column: 3)
!1197 = !DILocation(line: 994, column: 15, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1185, file: !74, line: 993, column: 2)
!1199 = !DILocation(line: 994, column: 28, scope: !1198)
!1200 = !DILocation(line: 994, column: 39, scope: !1198)
!1201 = !DILocation(line: 994, column: 37, scope: !1198)
!1202 = !DILocation(line: 994, column: 46, scope: !1198)
!1203 = !DILocation(line: 994, column: 44, scope: !1198)
!1204 = !DILocation(line: 994, column: 24, scope: !1198)
!1205 = !DILocation(line: 994, column: 52, scope: !1198)
!1206 = !DILocation(line: 994, column: 12, scope: !1198)
!1207 = !DILocation(line: 995, column: 15, scope: !1198)
!1208 = !DILocation(line: 995, column: 24, scope: !1198)
!1209 = !DILocation(line: 995, column: 23, scope: !1198)
!1210 = !DILocation(line: 995, column: 32, scope: !1198)
!1211 = !DILocation(line: 995, column: 41, scope: !1198)
!1212 = !DILocation(line: 995, column: 40, scope: !1198)
!1213 = !DILocation(line: 995, column: 29, scope: !1198)
!1214 = !DILocation(line: 995, column: 12, scope: !1198)
!1215 = !DILocation(line: 996, column: 6, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1198, file: !74, line: 996, column: 6)
!1217 = !DILocation(line: 996, column: 15, scope: !1216)
!1218 = !DILocation(line: 996, column: 6, scope: !1198)
!1219 = !DILocation(line: 998, column: 7, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1221, file: !74, line: 998, column: 7)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !74, line: 997, column: 3)
!1222 = !DILocation(line: 998, column: 16, scope: !1220)
!1223 = !DILocation(line: 998, column: 7, scope: !1221)
!1224 = !DILocation(line: 1000, column: 17, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !74, line: 999, column: 4)
!1226 = !DILocation(line: 1000, column: 12, scope: !1225)
!1227 = !DILocation(line: 1000, column: 5, scope: !1225)
!1228 = !DILocation(line: 1004, column: 5, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1220, file: !74, line: 1003, column: 4)
!1230 = !DILocation(line: 1009, column: 4, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1216, file: !74, line: 1008, column: 3)
!1232 = !DILocation(line: 1012, column: 1, scope: !1165)
!1233 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1030, type: !1234, scopeLine: 1031, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!6, !6, !6, !18}
!1236 = !DILocalVariable(name: "data1", arg: 1, scope: !1233, file: !74, line: 1030, type: !6)
!1237 = !DILocation(line: 1030, column: 33, scope: !1233)
!1238 = !DILocalVariable(name: "data2", arg: 2, scope: !1233, file: !74, line: 1030, type: !6)
!1239 = !DILocation(line: 1030, column: 43, scope: !1233)
!1240 = !DILocalVariable(name: "denominator", arg: 3, scope: !1233, file: !74, line: 1030, type: !18)
!1241 = !DILocation(line: 1030, column: 53, scope: !1233)
!1242 = !DILocalVariable(name: "s32Result", scope: !1233, file: !74, line: 1032, type: !25)
!1243 = !DILocation(line: 1032, column: 6, scope: !1233)
!1244 = !DILocalVariable(name: "s32Temp1", scope: !1233, file: !74, line: 1032, type: !25)
!1245 = !DILocation(line: 1032, column: 21, scope: !1233)
!1246 = !DILocation(line: 1033, column: 14, scope: !1233)
!1247 = !DILocation(line: 1033, column: 22, scope: !1233)
!1248 = !DILocation(line: 1033, column: 20, scope: !1233)
!1249 = !DILocation(line: 1033, column: 12, scope: !1233)
!1250 = !DILocation(line: 1035, column: 5, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1233, file: !74, line: 1035, column: 5)
!1252 = !DILocation(line: 1035, column: 17, scope: !1251)
!1253 = !DILocation(line: 1035, column: 5, scope: !1233)
!1254 = !DILocation(line: 1037, column: 6, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1256, file: !74, line: 1037, column: 6)
!1256 = distinct !DILexicalBlock(scope: !1251, file: !74, line: 1036, column: 2)
!1257 = !DILocation(line: 1037, column: 16, scope: !1255)
!1258 = !DILocation(line: 1037, column: 6, scope: !1256)
!1259 = !DILocation(line: 1039, column: 4, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1255, file: !74, line: 1038, column: 3)
!1261 = !DILocation(line: 1041, column: 11, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1255, file: !74, line: 1041, column: 11)
!1263 = !DILocation(line: 1041, column: 21, scope: !1262)
!1264 = !DILocation(line: 1041, column: 11, scope: !1255)
!1265 = !DILocation(line: 1043, column: 4, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1262, file: !74, line: 1042, column: 3)
!1267 = !DILocation(line: 1047, column: 4, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1262, file: !74, line: 1046, column: 3)
!1269 = !DILocation(line: 1052, column: 15, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1251, file: !74, line: 1051, column: 2)
!1271 = !DILocation(line: 1052, column: 28, scope: !1270)
!1272 = !DILocation(line: 1052, column: 38, scope: !1270)
!1273 = !DILocation(line: 1052, column: 37, scope: !1270)
!1274 = !DILocation(line: 1052, column: 51, scope: !1270)
!1275 = !DILocation(line: 1052, column: 50, scope: !1270)
!1276 = !DILocation(line: 1052, column: 25, scope: !1270)
!1277 = !DILocation(line: 1052, column: 64, scope: !1270)
!1278 = !DILocation(line: 1052, column: 12, scope: !1270)
!1279 = !DILocation(line: 1053, column: 16, scope: !1270)
!1280 = !DILocation(line: 1053, column: 25, scope: !1270)
!1281 = !DILocation(line: 1053, column: 24, scope: !1270)
!1282 = !DILocation(line: 1053, column: 41, scope: !1270)
!1283 = !DILocation(line: 1053, column: 51, scope: !1270)
!1284 = !DILocation(line: 1053, column: 50, scope: !1270)
!1285 = !DILocation(line: 1053, column: 38, scope: !1270)
!1286 = !DILocation(line: 1053, column: 13, scope: !1270)
!1287 = !DILocation(line: 1054, column: 6, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1270, file: !74, line: 1054, column: 6)
!1289 = !DILocation(line: 1054, column: 16, scope: !1288)
!1290 = !DILocation(line: 1054, column: 6, scope: !1270)
!1291 = !DILocation(line: 1056, column: 7, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1293, file: !74, line: 1056, column: 7)
!1293 = distinct !DILexicalBlock(scope: !1288, file: !74, line: 1055, column: 3)
!1294 = !DILocation(line: 1056, column: 17, scope: !1292)
!1295 = !DILocation(line: 1056, column: 7, scope: !1293)
!1296 = !DILocation(line: 1058, column: 17, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !74, line: 1057, column: 4)
!1298 = !DILocation(line: 1058, column: 12, scope: !1297)
!1299 = !DILocation(line: 1058, column: 5, scope: !1297)
!1300 = !DILocation(line: 1062, column: 5, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1292, file: !74, line: 1061, column: 4)
!1302 = !DILocation(line: 1067, column: 4, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1288, file: !74, line: 1066, column: 3)
!1304 = !DILocation(line: 1071, column: 1, scope: !1233)
!1305 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1088, type: !1306, scopeLine: 1089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!433, !433, !25}
!1308 = !DILocalVariable(name: "numerator", arg: 1, scope: !1305, file: !74, line: 1088, type: !433)
!1309 = !DILocation(line: 1088, column: 25, scope: !1305)
!1310 = !DILocalVariable(name: "denominator", arg: 2, scope: !1305, file: !74, line: 1088, type: !25)
!1311 = !DILocation(line: 1088, column: 40, scope: !1305)
!1312 = !DILocalVariable(name: "u32Temp1", scope: !1305, file: !74, line: 1090, type: !433)
!1313 = !DILocation(line: 1090, column: 6, scope: !1305)
!1314 = !DILocation(line: 1091, column: 5, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1305, file: !74, line: 1091, column: 5)
!1316 = !DILocation(line: 1091, column: 17, scope: !1315)
!1317 = !DILocation(line: 1091, column: 5, scope: !1305)
!1318 = !DILocation(line: 1093, column: 3, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1315, file: !74, line: 1092, column: 2)
!1320 = !DILocation(line: 1097, column: 6, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1322, file: !74, line: 1097, column: 6)
!1322 = distinct !DILexicalBlock(scope: !1315, file: !74, line: 1096, column: 2)
!1323 = !DILocation(line: 1097, column: 18, scope: !1321)
!1324 = !DILocation(line: 1097, column: 6, scope: !1322)
!1325 = !DILocation(line: 1099, column: 4, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1321, file: !74, line: 1098, column: 3)
!1327 = !DILocation(line: 1103, column: 16, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1321, file: !74, line: 1102, column: 3)
!1329 = !DILocation(line: 1103, column: 30, scope: !1328)
!1330 = !DILocation(line: 1103, column: 40, scope: !1328)
!1331 = !DILocation(line: 1103, column: 39, scope: !1328)
!1332 = !DILocation(line: 1103, column: 55, scope: !1328)
!1333 = !DILocation(line: 1103, column: 53, scope: !1328)
!1334 = !DILocation(line: 1103, column: 26, scope: !1328)
!1335 = !DILocation(line: 1103, column: 68, scope: !1328)
!1336 = !DILocation(line: 1103, column: 13, scope: !1328)
!1337 = !DILocation(line: 1104, column: 16, scope: !1328)
!1338 = !DILocation(line: 1104, column: 25, scope: !1328)
!1339 = !DILocation(line: 1104, column: 24, scope: !1328)
!1340 = !DILocation(line: 1104, column: 41, scope: !1328)
!1341 = !DILocation(line: 1104, column: 51, scope: !1328)
!1342 = !DILocation(line: 1104, column: 50, scope: !1328)
!1343 = !DILocation(line: 1104, column: 38, scope: !1328)
!1344 = !DILocation(line: 1104, column: 13, scope: !1328)
!1345 = !DILocation(line: 1105, column: 11, scope: !1328)
!1346 = !DILocation(line: 1105, column: 4, scope: !1328)
!1347 = !DILocation(line: 1108, column: 1, scope: !1305)
!1348 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1125, type: !1349, scopeLine: 1126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!433, !25, !433}
!1351 = !DILocalVariable(name: "numerator", arg: 1, scope: !1348, file: !74, line: 1125, type: !25)
!1352 = !DILocation(line: 1125, column: 25, scope: !1348)
!1353 = !DILocalVariable(name: "denominator", arg: 2, scope: !1348, file: !74, line: 1125, type: !433)
!1354 = !DILocation(line: 1125, column: 40, scope: !1348)
!1355 = !DILocalVariable(name: "s32Temp1", scope: !1348, file: !74, line: 1127, type: !25)
!1356 = !DILocation(line: 1127, column: 6, scope: !1348)
!1357 = !DILocation(line: 1128, column: 5, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1348, file: !74, line: 1128, column: 5)
!1359 = !DILocation(line: 1128, column: 17, scope: !1358)
!1360 = !DILocation(line: 1128, column: 5, scope: !1348)
!1361 = !DILocation(line: 1130, column: 6, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1363, file: !74, line: 1130, column: 6)
!1363 = distinct !DILexicalBlock(scope: !1358, file: !74, line: 1129, column: 2)
!1364 = !DILocation(line: 1130, column: 16, scope: !1362)
!1365 = !DILocation(line: 1130, column: 6, scope: !1363)
!1366 = !DILocation(line: 1132, column: 4, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1362, file: !74, line: 1131, column: 3)
!1368 = !DILocation(line: 1136, column: 4, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1362, file: !74, line: 1135, column: 3)
!1370 = !DILocation(line: 1141, column: 6, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1372, file: !74, line: 1141, column: 6)
!1372 = distinct !DILexicalBlock(scope: !1358, file: !74, line: 1140, column: 2)
!1373 = !DILocation(line: 1141, column: 16, scope: !1371)
!1374 = !DILocation(line: 1141, column: 6, scope: !1372)
!1375 = !DILocation(line: 1143, column: 17, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1371, file: !74, line: 1142, column: 3)
!1377 = !DILocation(line: 1143, column: 31, scope: !1376)
!1378 = !DILocation(line: 1143, column: 41, scope: !1376)
!1379 = !DILocation(line: 1143, column: 40, scope: !1376)
!1380 = !DILocation(line: 1143, column: 56, scope: !1376)
!1381 = !DILocation(line: 1143, column: 54, scope: !1376)
!1382 = !DILocation(line: 1143, column: 27, scope: !1376)
!1383 = !DILocation(line: 1143, column: 69, scope: !1376)
!1384 = !DILocation(line: 1143, column: 13, scope: !1376)
!1385 = !DILocation(line: 1144, column: 13, scope: !1376)
!1386 = !DILocation(line: 1144, column: 23, scope: !1376)
!1387 = !DILocation(line: 1144, column: 22, scope: !1376)
!1388 = !DILocation(line: 1144, column: 39, scope: !1376)
!1389 = !DILocation(line: 1144, column: 48, scope: !1376)
!1390 = !DILocation(line: 1144, column: 47, scope: !1376)
!1391 = !DILocation(line: 1144, column: 36, scope: !1376)
!1392 = !DILocation(line: 1144, column: 4, scope: !1376)
!1393 = !DILocation(line: 1148, column: 4, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1371, file: !74, line: 1147, column: 3)
!1395 = !DILocation(line: 1151, column: 1, scope: !1348)
!1396 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1168, type: !1397, scopeLine: 1169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1397 = !DISubroutineType(types: !1398)
!1398 = !{!433, !25, !25}
!1399 = !DILocalVariable(name: "numerator", arg: 1, scope: !1396, file: !74, line: 1168, type: !25)
!1400 = !DILocation(line: 1168, column: 25, scope: !1396)
!1401 = !DILocalVariable(name: "denominator", arg: 2, scope: !1396, file: !74, line: 1168, type: !25)
!1402 = !DILocation(line: 1168, column: 40, scope: !1396)
!1403 = !DILocalVariable(name: "u32Temp1", scope: !1396, file: !74, line: 1170, type: !433)
!1404 = !DILocation(line: 1170, column: 6, scope: !1396)
!1405 = !DILocalVariable(name: "u32Temp2", scope: !1396, file: !74, line: 1170, type: !433)
!1406 = !DILocation(line: 1170, column: 20, scope: !1396)
!1407 = !DILocation(line: 1171, column: 5, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1396, file: !74, line: 1171, column: 5)
!1409 = !DILocation(line: 1171, column: 17, scope: !1408)
!1410 = !DILocation(line: 1171, column: 5, scope: !1396)
!1411 = !DILocation(line: 1173, column: 6, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1413, file: !74, line: 1173, column: 6)
!1413 = distinct !DILexicalBlock(scope: !1408, file: !74, line: 1172, column: 2)
!1414 = !DILocation(line: 1173, column: 16, scope: !1412)
!1415 = !DILocation(line: 1173, column: 6, scope: !1413)
!1416 = !DILocation(line: 1175, column: 4, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1412, file: !74, line: 1174, column: 3)
!1418 = !DILocation(line: 1179, column: 4, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1412, file: !74, line: 1178, column: 3)
!1420 = !DILocation(line: 1184, column: 6, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1422, file: !74, line: 1184, column: 6)
!1422 = distinct !DILexicalBlock(scope: !1408, file: !74, line: 1183, column: 2)
!1423 = !DILocation(line: 1184, column: 16, scope: !1421)
!1424 = !DILocation(line: 1184, column: 6, scope: !1422)
!1425 = !DILocation(line: 1186, column: 7, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1427, file: !74, line: 1186, column: 7)
!1427 = distinct !DILexicalBlock(scope: !1421, file: !74, line: 1185, column: 3)
!1428 = !DILocation(line: 1186, column: 17, scope: !1426)
!1429 = !DILocation(line: 1186, column: 7, scope: !1427)
!1430 = !DILocation(line: 1188, column: 5, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1426, file: !74, line: 1187, column: 4)
!1432 = !DILocation(line: 1192, column: 8, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1434, file: !74, line: 1192, column: 8)
!1434 = distinct !DILexicalBlock(scope: !1426, file: !74, line: 1191, column: 4)
!1435 = !DILocation(line: 1192, column: 20, scope: !1433)
!1436 = !DILocation(line: 1192, column: 8, scope: !1434)
!1437 = !DILocation(line: 1194, column: 6, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1433, file: !74, line: 1193, column: 5)
!1439 = !DILocation(line: 1198, column: 18, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1433, file: !74, line: 1197, column: 5)
!1441 = !DILocation(line: 1198, column: 32, scope: !1440)
!1442 = !DILocation(line: 1198, column: 42, scope: !1440)
!1443 = !DILocation(line: 1198, column: 41, scope: !1440)
!1444 = !DILocation(line: 1198, column: 57, scope: !1440)
!1445 = !DILocation(line: 1198, column: 55, scope: !1440)
!1446 = !DILocation(line: 1198, column: 28, scope: !1440)
!1447 = !DILocation(line: 1198, column: 71, scope: !1440)
!1448 = !DILocation(line: 1198, column: 15, scope: !1440)
!1449 = !DILocation(line: 1199, column: 18, scope: !1440)
!1450 = !DILocation(line: 1199, column: 29, scope: !1440)
!1451 = !DILocation(line: 1199, column: 27, scope: !1440)
!1452 = !DILocation(line: 1199, column: 45, scope: !1440)
!1453 = !DILocation(line: 1199, column: 57, scope: !1440)
!1454 = !DILocation(line: 1199, column: 55, scope: !1440)
!1455 = !DILocation(line: 1199, column: 42, scope: !1440)
!1456 = !DILocation(line: 1199, column: 15, scope: !1440)
!1457 = !DILocation(line: 1200, column: 13, scope: !1440)
!1458 = !DILocation(line: 1200, column: 6, scope: !1440)
!1459 = !DILocation(line: 1206, column: 7, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1461, file: !74, line: 1206, column: 7)
!1461 = distinct !DILexicalBlock(scope: !1421, file: !74, line: 1205, column: 3)
!1462 = !DILocation(line: 1206, column: 19, scope: !1460)
!1463 = !DILocation(line: 1206, column: 7, scope: !1461)
!1464 = !DILocation(line: 1208, column: 5, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1460, file: !74, line: 1207, column: 4)
!1466 = !DILocation(line: 1212, column: 18, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1460, file: !74, line: 1211, column: 4)
!1468 = !DILocation(line: 1212, column: 17, scope: !1467)
!1469 = !DILocation(line: 1212, column: 15, scope: !1467)
!1470 = !DILocation(line: 1213, column: 20, scope: !1467)
!1471 = !DILocation(line: 1213, column: 19, scope: !1467)
!1472 = !DILocation(line: 1213, column: 17, scope: !1467)
!1473 = !DILocation(line: 1214, column: 17, scope: !1467)
!1474 = !DILocation(line: 1214, column: 31, scope: !1467)
!1475 = !DILocation(line: 1214, column: 41, scope: !1467)
!1476 = !DILocation(line: 1214, column: 40, scope: !1467)
!1477 = !DILocation(line: 1214, column: 56, scope: !1467)
!1478 = !DILocation(line: 1214, column: 54, scope: !1467)
!1479 = !DILocation(line: 1214, column: 27, scope: !1467)
!1480 = !DILocation(line: 1214, column: 70, scope: !1467)
!1481 = !DILocation(line: 1214, column: 14, scope: !1467)
!1482 = !DILocation(line: 1215, column: 17, scope: !1467)
!1483 = !DILocation(line: 1215, column: 28, scope: !1467)
!1484 = !DILocation(line: 1215, column: 26, scope: !1467)
!1485 = !DILocation(line: 1215, column: 44, scope: !1467)
!1486 = !DILocation(line: 1215, column: 56, scope: !1467)
!1487 = !DILocation(line: 1215, column: 54, scope: !1467)
!1488 = !DILocation(line: 1215, column: 41, scope: !1467)
!1489 = !DILocation(line: 1215, column: 14, scope: !1467)
!1490 = !DILocation(line: 1216, column: 12, scope: !1467)
!1491 = !DILocation(line: 1216, column: 5, scope: !1467)
!1492 = !DILocation(line: 1221, column: 1, scope: !1396)
!1493 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1238, type: !1494, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1494 = !DISubroutineType(types: !1495)
!1495 = !{!433, !433, !433}
!1496 = !DILocalVariable(name: "numerator", arg: 1, scope: !1493, file: !74, line: 1238, type: !433)
!1497 = !DILocation(line: 1238, column: 25, scope: !1493)
!1498 = !DILocalVariable(name: "denominator", arg: 2, scope: !1493, file: !74, line: 1238, type: !433)
!1499 = !DILocation(line: 1238, column: 40, scope: !1493)
!1500 = !DILocalVariable(name: "u32Temp1", scope: !1493, file: !74, line: 1241, type: !433)
!1501 = !DILocation(line: 1241, column: 6, scope: !1493)
!1502 = !DILocalVariable(name: "u32Temp2", scope: !1493, file: !74, line: 1241, type: !433)
!1503 = !DILocation(line: 1241, column: 20, scope: !1493)
!1504 = !DILocalVariable(name: "u32Temp3", scope: !1493, file: !74, line: 1241, type: !433)
!1505 = !DILocation(line: 1241, column: 34, scope: !1493)
!1506 = !DILocalVariable(name: "numerator_old", scope: !1493, file: !74, line: 1241, type: !433)
!1507 = !DILocation(line: 1241, column: 48, scope: !1493)
!1508 = !DILocation(line: 1242, column: 5, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1493, file: !74, line: 1242, column: 5)
!1510 = !DILocation(line: 1242, column: 16, scope: !1509)
!1511 = !DILocation(line: 1242, column: 5, scope: !1493)
!1512 = !DILocation(line: 1244, column: 3, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1509, file: !74, line: 1243, column: 2)
!1514 = !DILocation(line: 1248, column: 14, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1509, file: !74, line: 1247, column: 2)
!1516 = !DILocation(line: 1248, column: 26, scope: !1515)
!1517 = !DILocation(line: 1248, column: 41, scope: !1515)
!1518 = !DILocation(line: 1248, column: 51, scope: !1515)
!1519 = !DILocation(line: 1248, column: 50, scope: !1515)
!1520 = !DILocation(line: 1248, column: 38, scope: !1515)
!1521 = !DILocation(line: 1248, column: 24, scope: !1515)
!1522 = !DILocation(line: 1248, column: 12, scope: !1515)
!1523 = !DILocation(line: 1249, column: 7, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1515, file: !74, line: 1249, column: 6)
!1525 = !DILocation(line: 1249, column: 16, scope: !1524)
!1526 = !DILocation(line: 1249, column: 24, scope: !1524)
!1527 = !DILocation(line: 1249, column: 6, scope: !1515)
!1528 = !DILocation(line: 1251, column: 16, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1524, file: !74, line: 1250, column: 3)
!1530 = !DILocation(line: 1251, column: 27, scope: !1529)
!1531 = !DILocation(line: 1251, column: 13, scope: !1529)
!1532 = !DILocation(line: 1252, column: 3, scope: !1529)
!1533 = !DILocation(line: 1255, column: 16, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1524, file: !74, line: 1254, column: 3)
!1535 = !DILocation(line: 1255, column: 27, scope: !1534)
!1536 = !DILocation(line: 1255, column: 32, scope: !1534)
!1537 = !DILocation(line: 1255, column: 13, scope: !1534)
!1538 = !DILocation(line: 1258, column: 6, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1515, file: !74, line: 1258, column: 6)
!1540 = !DILocation(line: 1258, column: 17, scope: !1539)
!1541 = !DILocation(line: 1258, column: 15, scope: !1539)
!1542 = !DILocation(line: 1258, column: 6, scope: !1515)
!1543 = !DILocation(line: 1260, column: 12, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1539, file: !74, line: 1259, column: 3)
!1545 = !DILocation(line: 1260, column: 22, scope: !1544)
!1546 = !DILocation(line: 1260, column: 21, scope: !1544)
!1547 = !DILocation(line: 1260, column: 4, scope: !1544)
!1548 = !DILocation(line: 1264, column: 13, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1539, file: !74, line: 1263, column: 3)
!1550 = !DILocation(line: 1264, column: 23, scope: !1549)
!1551 = !DILocation(line: 1264, column: 22, scope: !1549)
!1552 = !DILocation(line: 1264, column: 36, scope: !1549)
!1553 = !DILocation(line: 1264, column: 4, scope: !1549)
!1554 = !DILocation(line: 1269, column: 1, scope: !1493)
!1555 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1286, type: !1556, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1556 = !DISubroutineType(types: !1557)
!1557 = !{!25, !433, !25}
!1558 = !DILocalVariable(name: "numerator", arg: 1, scope: !1555, file: !74, line: 1286, type: !433)
!1559 = !DILocation(line: 1286, column: 25, scope: !1555)
!1560 = !DILocalVariable(name: "denominator", arg: 2, scope: !1555, file: !74, line: 1286, type: !25)
!1561 = !DILocation(line: 1286, column: 40, scope: !1555)
!1562 = !DILocalVariable(name: "u32Temp1", scope: !1555, file: !74, line: 1288, type: !433)
!1563 = !DILocation(line: 1288, column: 6, scope: !1555)
!1564 = !DILocalVariable(name: "u32Temp2", scope: !1555, file: !74, line: 1288, type: !433)
!1565 = !DILocation(line: 1288, column: 20, scope: !1555)
!1566 = !DILocation(line: 1289, column: 5, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1555, file: !74, line: 1289, column: 5)
!1568 = !DILocation(line: 1289, column: 17, scope: !1567)
!1569 = !DILocation(line: 1289, column: 5, scope: !1555)
!1570 = !DILocation(line: 1291, column: 6, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1572, file: !74, line: 1291, column: 6)
!1572 = distinct !DILexicalBlock(scope: !1567, file: !74, line: 1290, column: 2)
!1573 = !DILocation(line: 1291, column: 18, scope: !1571)
!1574 = !DILocation(line: 1291, column: 6, scope: !1572)
!1575 = !DILocation(line: 1293, column: 4, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1571, file: !74, line: 1292, column: 3)
!1577 = !DILocation(line: 1297, column: 19, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1571, file: !74, line: 1296, column: 3)
!1579 = !DILocation(line: 1297, column: 18, scope: !1578)
!1580 = !DILocation(line: 1297, column: 16, scope: !1578)
!1581 = !DILocation(line: 1298, column: 16, scope: !1578)
!1582 = !DILocation(line: 1298, column: 30, scope: !1578)
!1583 = !DILocation(line: 1298, column: 40, scope: !1578)
!1584 = !DILocation(line: 1298, column: 39, scope: !1578)
!1585 = !DILocation(line: 1298, column: 55, scope: !1578)
!1586 = !DILocation(line: 1298, column: 53, scope: !1578)
!1587 = !DILocation(line: 1298, column: 26, scope: !1578)
!1588 = !DILocation(line: 1298, column: 69, scope: !1578)
!1589 = !DILocation(line: 1298, column: 13, scope: !1578)
!1590 = !DILocation(line: 1299, column: 16, scope: !1578)
!1591 = !DILocation(line: 1299, column: 25, scope: !1578)
!1592 = !DILocation(line: 1299, column: 24, scope: !1578)
!1593 = !DILocation(line: 1299, column: 41, scope: !1578)
!1594 = !DILocation(line: 1299, column: 51, scope: !1578)
!1595 = !DILocation(line: 1299, column: 50, scope: !1578)
!1596 = !DILocation(line: 1299, column: 38, scope: !1578)
!1597 = !DILocation(line: 1299, column: 13, scope: !1578)
!1598 = !DILocation(line: 1300, column: 7, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1578, file: !74, line: 1300, column: 7)
!1600 = !DILocation(line: 1300, column: 16, scope: !1599)
!1601 = !DILocation(line: 1300, column: 7, scope: !1578)
!1602 = !DILocation(line: 1302, column: 13, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1599, file: !74, line: 1301, column: 4)
!1604 = !DILocation(line: 1302, column: 12, scope: !1603)
!1605 = !DILocation(line: 1302, column: 5, scope: !1603)
!1606 = !DILocation(line: 1306, column: 5, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1599, file: !74, line: 1305, column: 4)
!1608 = !DILocation(line: 1312, column: 15, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1567, file: !74, line: 1311, column: 2)
!1610 = !DILocation(line: 1312, column: 29, scope: !1609)
!1611 = !DILocation(line: 1312, column: 39, scope: !1609)
!1612 = !DILocation(line: 1312, column: 38, scope: !1609)
!1613 = !DILocation(line: 1312, column: 54, scope: !1609)
!1614 = !DILocation(line: 1312, column: 52, scope: !1609)
!1615 = !DILocation(line: 1312, column: 25, scope: !1609)
!1616 = !DILocation(line: 1312, column: 68, scope: !1609)
!1617 = !DILocation(line: 1312, column: 12, scope: !1609)
!1618 = !DILocation(line: 1313, column: 15, scope: !1609)
!1619 = !DILocation(line: 1313, column: 24, scope: !1609)
!1620 = !DILocation(line: 1313, column: 23, scope: !1609)
!1621 = !DILocation(line: 1313, column: 40, scope: !1609)
!1622 = !DILocation(line: 1313, column: 50, scope: !1609)
!1623 = !DILocation(line: 1313, column: 49, scope: !1609)
!1624 = !DILocation(line: 1313, column: 37, scope: !1609)
!1625 = !DILocation(line: 1313, column: 12, scope: !1609)
!1626 = !DILocation(line: 1314, column: 6, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1609, file: !74, line: 1314, column: 6)
!1628 = !DILocation(line: 1314, column: 15, scope: !1627)
!1629 = !DILocation(line: 1314, column: 6, scope: !1609)
!1630 = !DILocation(line: 1316, column: 11, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1627, file: !74, line: 1315, column: 3)
!1632 = !DILocation(line: 1316, column: 4, scope: !1631)
!1633 = !DILocation(line: 1320, column: 4, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1627, file: !74, line: 1319, column: 3)
!1635 = !DILocation(line: 1323, column: 1, scope: !1555)
!1636 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1341, type: !1637, scopeLine: 1342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1637 = !DISubroutineType(types: !1638)
!1638 = !{!25, !25, !433}
!1639 = !DILocalVariable(name: "numerator", arg: 1, scope: !1636, file: !74, line: 1341, type: !25)
!1640 = !DILocation(line: 1341, column: 25, scope: !1636)
!1641 = !DILocalVariable(name: "denominator", arg: 2, scope: !1636, file: !74, line: 1341, type: !433)
!1642 = !DILocation(line: 1341, column: 40, scope: !1636)
!1643 = !DILocalVariable(name: "s32Temp1", scope: !1636, file: !74, line: 1343, type: !25)
!1644 = !DILocation(line: 1343, column: 6, scope: !1636)
!1645 = !DILocalVariable(name: "s32Temp2", scope: !1636, file: !74, line: 1343, type: !25)
!1646 = !DILocation(line: 1343, column: 20, scope: !1636)
!1647 = !DILocalVariable(name: "u32Temp0", scope: !1636, file: !74, line: 1344, type: !433)
!1648 = !DILocation(line: 1344, column: 6, scope: !1636)
!1649 = !DILocalVariable(name: "u32Temp1", scope: !1636, file: !74, line: 1344, type: !433)
!1650 = !DILocation(line: 1344, column: 20, scope: !1636)
!1651 = !DILocalVariable(name: "u32Temp2", scope: !1636, file: !74, line: 1344, type: !433)
!1652 = !DILocation(line: 1344, column: 34, scope: !1636)
!1653 = !DILocation(line: 1345, column: 5, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1636, file: !74, line: 1345, column: 5)
!1655 = !DILocation(line: 1345, column: 17, scope: !1654)
!1656 = !DILocation(line: 1345, column: 5, scope: !1636)
!1657 = !DILocation(line: 1347, column: 6, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1659, file: !74, line: 1347, column: 6)
!1659 = distinct !DILexicalBlock(scope: !1654, file: !74, line: 1346, column: 2)
!1660 = !DILocation(line: 1347, column: 16, scope: !1658)
!1661 = !DILocation(line: 1347, column: 6, scope: !1659)
!1662 = !DILocation(line: 1349, column: 4, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1658, file: !74, line: 1348, column: 3)
!1664 = !DILocation(line: 1353, column: 4, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1658, file: !74, line: 1352, column: 3)
!1666 = !DILocation(line: 1358, column: 6, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1668, file: !74, line: 1358, column: 6)
!1668 = distinct !DILexicalBlock(scope: !1654, file: !74, line: 1357, column: 2)
!1669 = !DILocation(line: 1358, column: 16, scope: !1667)
!1670 = !DILocation(line: 1358, column: 6, scope: !1668)
!1671 = !DILocation(line: 1360, column: 16, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1667, file: !74, line: 1359, column: 3)
!1673 = !DILocation(line: 1360, column: 15, scope: !1672)
!1674 = !DILocation(line: 1360, column: 13, scope: !1672)
!1675 = !DILocation(line: 1361, column: 16, scope: !1672)
!1676 = !DILocation(line: 1361, column: 25, scope: !1672)
!1677 = !DILocation(line: 1361, column: 24, scope: !1672)
!1678 = !DILocation(line: 1361, column: 13, scope: !1672)
!1679 = !DILocation(line: 1362, column: 15, scope: !1672)
!1680 = !DILocation(line: 1362, column: 28, scope: !1672)
!1681 = !DILocation(line: 1362, column: 37, scope: !1672)
!1682 = !DILocation(line: 1362, column: 36, scope: !1672)
!1683 = !DILocation(line: 1362, column: 52, scope: !1672)
!1684 = !DILocation(line: 1362, column: 50, scope: !1672)
!1685 = !DILocation(line: 1362, column: 24, scope: !1672)
!1686 = !DILocation(line: 1362, column: 13, scope: !1672)
!1687 = !DILocation(line: 1364, column: 8, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1672, file: !74, line: 1364, column: 7)
!1689 = !DILocation(line: 1364, column: 20, scope: !1688)
!1690 = !DILocation(line: 1364, column: 27, scope: !1688)
!1691 = !DILocation(line: 1364, column: 7, scope: !1672)
!1692 = !DILocation(line: 1366, column: 20, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1688, file: !74, line: 1365, column: 4)
!1694 = !DILocation(line: 1366, column: 32, scope: !1693)
!1695 = !DILocation(line: 1366, column: 17, scope: !1693)
!1696 = !DILocation(line: 1367, column: 4, scope: !1693)
!1697 = !DILocation(line: 1370, column: 20, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1688, file: !74, line: 1369, column: 4)
!1699 = !DILocation(line: 1370, column: 32, scope: !1698)
!1700 = !DILocation(line: 1370, column: 38, scope: !1698)
!1701 = !DILocation(line: 1370, column: 17, scope: !1698)
!1702 = !DILocation(line: 1374, column: 7, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1672, file: !74, line: 1374, column: 7)
!1704 = !DILocation(line: 1374, column: 18, scope: !1703)
!1705 = !DILocation(line: 1374, column: 16, scope: !1703)
!1706 = !DILocation(line: 1374, column: 7, scope: !1672)
!1707 = !DILocation(line: 1376, column: 14, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1703, file: !74, line: 1375, column: 4)
!1709 = !DILocation(line: 1376, column: 13, scope: !1708)
!1710 = !DILocation(line: 1376, column: 23, scope: !1708)
!1711 = !DILocation(line: 1376, column: 5, scope: !1708)
!1712 = !DILocation(line: 1380, column: 14, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1703, file: !74, line: 1379, column: 4)
!1714 = !DILocation(line: 1380, column: 23, scope: !1713)
!1715 = !DILocation(line: 1380, column: 12, scope: !1713)
!1716 = !DILocation(line: 1380, column: 27, scope: !1713)
!1717 = !DILocation(line: 1380, column: 5, scope: !1713)
!1718 = !DILocation(line: 1387, column: 16, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1667, file: !74, line: 1386, column: 3)
!1720 = !DILocation(line: 1387, column: 30, scope: !1719)
!1721 = !DILocation(line: 1387, column: 40, scope: !1719)
!1722 = !DILocation(line: 1387, column: 39, scope: !1719)
!1723 = !DILocation(line: 1387, column: 55, scope: !1719)
!1724 = !DILocation(line: 1387, column: 53, scope: !1719)
!1725 = !DILocation(line: 1387, column: 26, scope: !1719)
!1726 = !DILocation(line: 1387, column: 69, scope: !1719)
!1727 = !DILocation(line: 1387, column: 13, scope: !1719)
!1728 = !DILocation(line: 1388, column: 16, scope: !1719)
!1729 = !DILocation(line: 1388, column: 26, scope: !1719)
!1730 = !DILocation(line: 1388, column: 25, scope: !1719)
!1731 = !DILocation(line: 1388, column: 42, scope: !1719)
!1732 = !DILocation(line: 1388, column: 51, scope: !1719)
!1733 = !DILocation(line: 1388, column: 50, scope: !1719)
!1734 = !DILocation(line: 1388, column: 39, scope: !1719)
!1735 = !DILocation(line: 1388, column: 13, scope: !1719)
!1736 = !DILocation(line: 1389, column: 11, scope: !1719)
!1737 = !DILocation(line: 1389, column: 4, scope: !1719)
!1738 = !DILocation(line: 1392, column: 1, scope: !1636)
!1739 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1409, type: !1740, scopeLine: 1410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1740 = !DISubroutineType(types: !1741)
!1741 = !{!25, !25, !25}
!1742 = !DILocalVariable(name: "numerator", arg: 1, scope: !1739, file: !74, line: 1409, type: !25)
!1743 = !DILocation(line: 1409, column: 25, scope: !1739)
!1744 = !DILocalVariable(name: "denominator", arg: 2, scope: !1739, file: !74, line: 1409, type: !25)
!1745 = !DILocation(line: 1409, column: 40, scope: !1739)
!1746 = !DILocalVariable(name: "s32Temp1", scope: !1739, file: !74, line: 1411, type: !25)
!1747 = !DILocation(line: 1411, column: 6, scope: !1739)
!1748 = !DILocalVariable(name: "s32Temp2", scope: !1739, file: !74, line: 1411, type: !25)
!1749 = !DILocation(line: 1411, column: 20, scope: !1739)
!1750 = !DILocalVariable(name: "denominator_prime", scope: !1739, file: !74, line: 1412, type: !433)
!1751 = !DILocation(line: 1412, column: 6, scope: !1739)
!1752 = !DILocalVariable(name: "u32Temp1", scope: !1739, file: !74, line: 1412, type: !433)
!1753 = !DILocation(line: 1412, column: 29, scope: !1739)
!1754 = !DILocalVariable(name: "u32Temp2", scope: !1739, file: !74, line: 1412, type: !433)
!1755 = !DILocation(line: 1412, column: 43, scope: !1739)
!1756 = !DILocalVariable(name: "u32numerator", scope: !1739, file: !74, line: 1413, type: !433)
!1757 = !DILocation(line: 1413, column: 6, scope: !1739)
!1758 = !DILocalVariable(name: "u32denominator", scope: !1739, file: !74, line: 1413, type: !433)
!1759 = !DILocation(line: 1413, column: 23, scope: !1739)
!1760 = !DILocation(line: 1414, column: 5, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1739, file: !74, line: 1414, column: 5)
!1762 = !DILocation(line: 1414, column: 15, scope: !1761)
!1763 = !DILocation(line: 1414, column: 5, scope: !1739)
!1764 = !DILocation(line: 1416, column: 6, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1766, file: !74, line: 1416, column: 6)
!1766 = distinct !DILexicalBlock(scope: !1761, file: !74, line: 1415, column: 2)
!1767 = !DILocation(line: 1416, column: 18, scope: !1765)
!1768 = !DILocation(line: 1416, column: 6, scope: !1766)
!1769 = !DILocation(line: 1418, column: 7, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1771, file: !74, line: 1418, column: 7)
!1771 = distinct !DILexicalBlock(scope: !1765, file: !74, line: 1417, column: 3)
!1772 = !DILocation(line: 1418, column: 19, scope: !1770)
!1773 = !DILocation(line: 1418, column: 7, scope: !1771)
!1774 = !DILocation(line: 1420, column: 5, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1770, file: !74, line: 1419, column: 4)
!1776 = !DILocation(line: 1424, column: 21, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1770, file: !74, line: 1423, column: 4)
!1778 = !DILocation(line: 1424, column: 20, scope: !1777)
!1779 = !DILocation(line: 1424, column: 18, scope: !1777)
!1780 = !DILocation(line: 1425, column: 23, scope: !1777)
!1781 = !DILocation(line: 1425, column: 22, scope: !1777)
!1782 = !DILocation(line: 1425, column: 20, scope: !1777)
!1783 = !DILocation(line: 1426, column: 16, scope: !1777)
!1784 = !DILocation(line: 1426, column: 33, scope: !1777)
!1785 = !DILocation(line: 1426, column: 46, scope: !1777)
!1786 = !DILocation(line: 1426, column: 45, scope: !1777)
!1787 = !DILocation(line: 1426, column: 64, scope: !1777)
!1788 = !DILocation(line: 1426, column: 62, scope: !1777)
!1789 = !DILocation(line: 1426, column: 29, scope: !1777)
!1790 = !DILocation(line: 1426, column: 81, scope: !1777)
!1791 = !DILocation(line: 1426, column: 14, scope: !1777)
!1792 = !DILocation(line: 1427, column: 17, scope: !1777)
!1793 = !DILocation(line: 1427, column: 30, scope: !1777)
!1794 = !DILocation(line: 1427, column: 29, scope: !1777)
!1795 = !DILocation(line: 1427, column: 49, scope: !1777)
!1796 = !DILocation(line: 1427, column: 58, scope: !1777)
!1797 = !DILocation(line: 1427, column: 57, scope: !1777)
!1798 = !DILocation(line: 1427, column: 46, scope: !1777)
!1799 = !DILocation(line: 1427, column: 14, scope: !1777)
!1800 = !DILocation(line: 1428, column: 8, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1777, file: !74, line: 1428, column: 8)
!1802 = !DILocation(line: 1428, column: 17, scope: !1801)
!1803 = !DILocation(line: 1428, column: 8, scope: !1777)
!1804 = !DILocation(line: 1430, column: 13, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1801, file: !74, line: 1429, column: 5)
!1806 = !DILocation(line: 1430, column: 6, scope: !1805)
!1807 = !DILocation(line: 1434, column: 6, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1801, file: !74, line: 1433, column: 5)
!1809 = !DILocation(line: 1440, column: 20, scope: !1810)
!1810 = distinct !DILexicalBlock(scope: !1765, file: !74, line: 1439, column: 3)
!1811 = !DILocation(line: 1440, column: 19, scope: !1810)
!1812 = !DILocation(line: 1440, column: 29, scope: !1810)
!1813 = !DILocation(line: 1440, column: 17, scope: !1810)
!1814 = !DILocation(line: 1441, column: 16, scope: !1810)
!1815 = !DILocation(line: 1441, column: 33, scope: !1810)
!1816 = !DILocation(line: 1441, column: 46, scope: !1810)
!1817 = !DILocation(line: 1441, column: 45, scope: !1810)
!1818 = !DILocation(line: 1441, column: 61, scope: !1810)
!1819 = !DILocation(line: 1441, column: 59, scope: !1810)
!1820 = !DILocation(line: 1441, column: 29, scope: !1810)
!1821 = !DILocation(line: 1441, column: 75, scope: !1810)
!1822 = !DILocation(line: 1441, column: 13, scope: !1810)
!1823 = !DILocation(line: 1442, column: 16, scope: !1810)
!1824 = !DILocation(line: 1442, column: 29, scope: !1810)
!1825 = !DILocation(line: 1442, column: 28, scope: !1810)
!1826 = !DILocation(line: 1442, column: 45, scope: !1810)
!1827 = !DILocation(line: 1442, column: 54, scope: !1810)
!1828 = !DILocation(line: 1442, column: 53, scope: !1810)
!1829 = !DILocation(line: 1442, column: 42, scope: !1810)
!1830 = !DILocation(line: 1442, column: 13, scope: !1810)
!1831 = !DILocation(line: 1443, column: 13, scope: !1810)
!1832 = !DILocation(line: 1443, column: 12, scope: !1810)
!1833 = !DILocation(line: 1443, column: 22, scope: !1810)
!1834 = !DILocation(line: 1443, column: 4, scope: !1810)
!1835 = !DILocation(line: 1448, column: 6, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1837, file: !74, line: 1448, column: 6)
!1837 = distinct !DILexicalBlock(scope: !1761, file: !74, line: 1447, column: 2)
!1838 = !DILocation(line: 1448, column: 18, scope: !1836)
!1839 = !DILocation(line: 1448, column: 6, scope: !1837)
!1840 = !DILocation(line: 1450, column: 7, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1842, file: !74, line: 1450, column: 7)
!1842 = distinct !DILexicalBlock(scope: !1836, file: !74, line: 1449, column: 3)
!1843 = !DILocation(line: 1450, column: 19, scope: !1841)
!1844 = !DILocation(line: 1450, column: 7, scope: !1842)
!1845 = !DILocation(line: 1452, column: 5, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1841, file: !74, line: 1451, column: 4)
!1847 = !DILocation(line: 1456, column: 23, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1841, file: !74, line: 1455, column: 4)
!1849 = !DILocation(line: 1456, column: 22, scope: !1848)
!1850 = !DILocation(line: 1456, column: 35, scope: !1848)
!1851 = !DILocation(line: 1456, column: 20, scope: !1848)
!1852 = !DILocation(line: 1457, column: 17, scope: !1848)
!1853 = !DILocation(line: 1457, column: 31, scope: !1848)
!1854 = !DILocation(line: 1457, column: 41, scope: !1848)
!1855 = !DILocation(line: 1457, column: 40, scope: !1848)
!1856 = !DILocation(line: 1457, column: 59, scope: !1848)
!1857 = !DILocation(line: 1457, column: 57, scope: !1848)
!1858 = !DILocation(line: 1457, column: 27, scope: !1848)
!1859 = !DILocation(line: 1457, column: 76, scope: !1848)
!1860 = !DILocation(line: 1457, column: 14, scope: !1848)
!1861 = !DILocation(line: 1458, column: 17, scope: !1848)
!1862 = !DILocation(line: 1458, column: 27, scope: !1848)
!1863 = !DILocation(line: 1458, column: 26, scope: !1848)
!1864 = !DILocation(line: 1458, column: 46, scope: !1848)
!1865 = !DILocation(line: 1458, column: 55, scope: !1848)
!1866 = !DILocation(line: 1458, column: 54, scope: !1848)
!1867 = !DILocation(line: 1458, column: 43, scope: !1848)
!1868 = !DILocation(line: 1458, column: 14, scope: !1848)
!1869 = !DILocation(line: 1459, column: 14, scope: !1848)
!1870 = !DILocation(line: 1459, column: 13, scope: !1848)
!1871 = !DILocation(line: 1459, column: 23, scope: !1848)
!1872 = !DILocation(line: 1459, column: 5, scope: !1848)
!1873 = !DILocation(line: 1464, column: 16, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1836, file: !74, line: 1463, column: 3)
!1875 = !DILocation(line: 1464, column: 30, scope: !1874)
!1876 = !DILocation(line: 1464, column: 40, scope: !1874)
!1877 = !DILocation(line: 1464, column: 39, scope: !1874)
!1878 = !DILocation(line: 1464, column: 55, scope: !1874)
!1879 = !DILocation(line: 1464, column: 53, scope: !1874)
!1880 = !DILocation(line: 1464, column: 26, scope: !1874)
!1881 = !DILocation(line: 1464, column: 69, scope: !1874)
!1882 = !DILocation(line: 1464, column: 13, scope: !1874)
!1883 = !DILocation(line: 1465, column: 16, scope: !1874)
!1884 = !DILocation(line: 1465, column: 26, scope: !1874)
!1885 = !DILocation(line: 1465, column: 25, scope: !1874)
!1886 = !DILocation(line: 1465, column: 42, scope: !1874)
!1887 = !DILocation(line: 1465, column: 51, scope: !1874)
!1888 = !DILocation(line: 1465, column: 50, scope: !1874)
!1889 = !DILocation(line: 1465, column: 39, scope: !1874)
!1890 = !DILocation(line: 1465, column: 13, scope: !1874)
!1891 = !DILocation(line: 1466, column: 11, scope: !1874)
!1892 = !DILocation(line: 1466, column: 4, scope: !1874)
!1893 = !DILocation(line: 1469, column: 1, scope: !1739)
!1894 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1487, type: !1895, scopeLine: 1488, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1895 = !DISubroutineType(types: !1896)
!1896 = !{!6, !25, !433}
!1897 = !DILocalVariable(name: "numerator", arg: 1, scope: !1894, file: !74, line: 1487, type: !25)
!1898 = !DILocation(line: 1487, column: 25, scope: !1894)
!1899 = !DILocalVariable(name: "denominator", arg: 2, scope: !1894, file: !74, line: 1487, type: !433)
!1900 = !DILocation(line: 1487, column: 40, scope: !1894)
!1901 = !DILocalVariable(name: "numerator_prime", scope: !1894, file: !74, line: 1490, type: !433)
!1902 = !DILocation(line: 1490, column: 6, scope: !1894)
!1903 = !DILocalVariable(name: "u32Temp1", scope: !1894, file: !74, line: 1490, type: !433)
!1904 = !DILocation(line: 1490, column: 27, scope: !1894)
!1905 = !DILocalVariable(name: "u32Temp2", scope: !1894, file: !74, line: 1490, type: !433)
!1906 = !DILocation(line: 1490, column: 41, scope: !1894)
!1907 = !DILocalVariable(name: "u32Temp3", scope: !1894, file: !74, line: 1490, type: !433)
!1908 = !DILocation(line: 1490, column: 55, scope: !1894)
!1909 = !DILocalVariable(name: "s32Temp1", scope: !1894, file: !74, line: 1491, type: !25)
!1910 = !DILocation(line: 1491, column: 6, scope: !1894)
!1911 = !DILocalVariable(name: "s32Temp2", scope: !1894, file: !74, line: 1491, type: !25)
!1912 = !DILocation(line: 1491, column: 20, scope: !1894)
!1913 = !DILocalVariable(name: "s32Temp3", scope: !1894, file: !74, line: 1491, type: !25)
!1914 = !DILocation(line: 1491, column: 34, scope: !1894)
!1915 = !DILocation(line: 1492, column: 5, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1894, file: !74, line: 1492, column: 5)
!1917 = !DILocation(line: 1492, column: 17, scope: !1916)
!1918 = !DILocation(line: 1492, column: 5, scope: !1894)
!1919 = !DILocation(line: 1494, column: 6, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1921, file: !74, line: 1494, column: 6)
!1921 = distinct !DILexicalBlock(scope: !1916, file: !74, line: 1493, column: 2)
!1922 = !DILocation(line: 1494, column: 15, scope: !1920)
!1923 = !DILocation(line: 1494, column: 6, scope: !1921)
!1924 = !DILocation(line: 1496, column: 4, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1920, file: !74, line: 1495, column: 3)
!1926 = !DILocation(line: 1500, column: 4, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1920, file: !74, line: 1499, column: 3)
!1928 = !DILocation(line: 1505, column: 6, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1930, file: !74, line: 1505, column: 6)
!1930 = distinct !DILexicalBlock(scope: !1916, file: !74, line: 1504, column: 2)
!1931 = !DILocation(line: 1505, column: 16, scope: !1929)
!1932 = !DILocation(line: 1505, column: 6, scope: !1930)
!1933 = !DILocation(line: 1507, column: 23, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1929, file: !74, line: 1506, column: 3)
!1935 = !DILocation(line: 1507, column: 22, scope: !1934)
!1936 = !DILocation(line: 1507, column: 20, scope: !1934)
!1937 = !DILocation(line: 1508, column: 16, scope: !1934)
!1938 = !DILocation(line: 1508, column: 32, scope: !1934)
!1939 = !DILocation(line: 1508, column: 31, scope: !1934)
!1940 = !DILocation(line: 1508, column: 13, scope: !1934)
!1941 = !DILocation(line: 1509, column: 15, scope: !1934)
!1942 = !DILocation(line: 1509, column: 34, scope: !1934)
!1943 = !DILocation(line: 1509, column: 45, scope: !1934)
!1944 = !DILocation(line: 1509, column: 43, scope: !1934)
!1945 = !DILocation(line: 1509, column: 31, scope: !1934)
!1946 = !DILocation(line: 1509, column: 13, scope: !1934)
!1947 = !DILocation(line: 1511, column: 8, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1934, file: !74, line: 1511, column: 7)
!1949 = !DILocation(line: 1511, column: 20, scope: !1948)
!1950 = !DILocation(line: 1511, column: 27, scope: !1948)
!1951 = !DILocation(line: 1511, column: 7, scope: !1934)
!1952 = !DILocation(line: 1513, column: 19, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1948, file: !74, line: 1512, column: 4)
!1954 = !DILocation(line: 1513, column: 31, scope: !1953)
!1955 = !DILocation(line: 1513, column: 17, scope: !1953)
!1956 = !DILocation(line: 1514, column: 4, scope: !1953)
!1957 = !DILocation(line: 1517, column: 20, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1948, file: !74, line: 1516, column: 4)
!1959 = !DILocation(line: 1517, column: 32, scope: !1958)
!1960 = !DILocation(line: 1517, column: 38, scope: !1958)
!1961 = !DILocation(line: 1517, column: 17, scope: !1958)
!1962 = !DILocation(line: 1520, column: 7, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1934, file: !74, line: 1520, column: 7)
!1964 = !DILocation(line: 1520, column: 18, scope: !1963)
!1965 = !DILocation(line: 1520, column: 16, scope: !1963)
!1966 = !DILocation(line: 1520, column: 7, scope: !1934)
!1967 = !DILocation(line: 1522, column: 18, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1963, file: !74, line: 1521, column: 4)
!1969 = !DILocation(line: 1522, column: 16, scope: !1968)
!1970 = !DILocation(line: 1522, column: 28, scope: !1968)
!1971 = !DILocation(line: 1522, column: 14, scope: !1968)
!1972 = !DILocation(line: 1523, column: 4, scope: !1968)
!1973 = !DILocation(line: 1526, column: 18, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1963, file: !74, line: 1525, column: 4)
!1975 = !DILocation(line: 1526, column: 26, scope: !1974)
!1976 = !DILocation(line: 1526, column: 16, scope: !1974)
!1977 = !DILocation(line: 1526, column: 30, scope: !1974)
!1978 = !DILocation(line: 1526, column: 14, scope: !1974)
!1979 = !DILocation(line: 1528, column: 8, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1934, file: !74, line: 1528, column: 7)
!1981 = !DILocation(line: 1528, column: 18, scope: !1980)
!1982 = !DILocation(line: 1528, column: 7, scope: !1934)
!1983 = !DILocation(line: 1530, column: 18, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1980, file: !74, line: 1529, column: 4)
!1985 = !DILocation(line: 1530, column: 12, scope: !1984)
!1986 = !DILocation(line: 1530, column: 5, scope: !1984)
!1987 = !DILocation(line: 1534, column: 5, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1980, file: !74, line: 1533, column: 4)
!1989 = !DILocation(line: 1539, column: 16, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1929, file: !74, line: 1538, column: 3)
!1991 = !DILocation(line: 1539, column: 26, scope: !1990)
!1992 = !DILocation(line: 1539, column: 25, scope: !1990)
!1993 = !DILocation(line: 1539, column: 41, scope: !1990)
!1994 = !DILocation(line: 1539, column: 39, scope: !1990)
!1995 = !DILocation(line: 1539, column: 13, scope: !1990)
!1996 = !DILocation(line: 1540, column: 16, scope: !1990)
!1997 = !DILocation(line: 1540, column: 30, scope: !1990)
!1998 = !DILocation(line: 1540, column: 40, scope: !1990)
!1999 = !DILocation(line: 1540, column: 39, scope: !1990)
!2000 = !DILocation(line: 1540, column: 55, scope: !1990)
!2001 = !DILocation(line: 1540, column: 53, scope: !1990)
!2002 = !DILocation(line: 1540, column: 26, scope: !1990)
!2003 = !DILocation(line: 1540, column: 68, scope: !1990)
!2004 = !DILocation(line: 1540, column: 13, scope: !1990)
!2005 = !DILocation(line: 1541, column: 16, scope: !1990)
!2006 = !DILocation(line: 1541, column: 25, scope: !1990)
!2007 = !DILocation(line: 1541, column: 24, scope: !1990)
!2008 = !DILocation(line: 1541, column: 41, scope: !1990)
!2009 = !DILocation(line: 1541, column: 51, scope: !1990)
!2010 = !DILocation(line: 1541, column: 50, scope: !1990)
!2011 = !DILocation(line: 1541, column: 38, scope: !1990)
!2012 = !DILocation(line: 1541, column: 13, scope: !1990)
!2013 = !DILocation(line: 1542, column: 7, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !1990, file: !74, line: 1542, column: 7)
!2015 = !DILocation(line: 1542, column: 16, scope: !2014)
!2016 = !DILocation(line: 1542, column: 7, scope: !1990)
!2017 = !DILocation(line: 1544, column: 17, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2014, file: !74, line: 1543, column: 4)
!2019 = !DILocation(line: 1544, column: 12, scope: !2018)
!2020 = !DILocation(line: 1544, column: 5, scope: !2018)
!2021 = !DILocation(line: 1548, column: 5, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2014, file: !74, line: 1547, column: 4)
!2023 = !DILocation(line: 1552, column: 1, scope: !1894)
!2024 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2025, file: !2025, line: 12, type: !2026, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2029)
!2025 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2026 = !DISubroutineType(types: !2027)
!2027 = !{null, !2028}
!2028 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2029 = !{!2030}
!2030 = !DILocalVariable(name: "z", arg: 1, scope: !2024, file: !2025, line: 12, type: !2028)
!2031 = !DILocation(line: 0, scope: !2024)
!2032 = !DILocation(line: 13, column: 9, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2024, file: !2025, line: 13, column: 7)
!2034 = !DILocation(line: 13, column: 7, scope: !2024)
!2035 = !DILocation(line: 14, column: 5, scope: !2033)
!2036 = !DILocation(line: 15, column: 1, scope: !2024)
!2037 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2038, file: !2038, line: 20, type: !2039, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2042)
!2038 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2039 = !DISubroutineType(types: !2040)
!2040 = !{null, !2041, !2041}
!2041 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2042 = !{!2043, !2044}
!2043 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2037, file: !2038, line: 20, type: !2041)
!2044 = !DILocalVariable(name: "shift", arg: 2, scope: !2037, file: !2038, line: 20, type: !2041)
!2045 = !DILocation(line: 0, scope: !2037)
!2046 = !DILocation(line: 21, column: 13, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2037, file: !2038, line: 21, column: 7)
!2048 = !DILocation(line: 21, column: 7, scope: !2037)
!2049 = !DILocation(line: 27, column: 5, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !2047, file: !2038, line: 21, column: 26)
!2051 = !DILocation(line: 29, column: 1, scope: !2037)
