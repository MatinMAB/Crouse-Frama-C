; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085/build/s16_mul_s16_u16_div_s16_alarm_0085.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [70 x i8] c"KLEE-ALARM-0085: signed overflow. assert s32Temp1 << 1 <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0085.err\00", align 1
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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 649, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !702
  unreachable, !dbg !702

if.end40:                                         ; preds = %if.end35
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !704
  %shl = shl i32 %17, 1, !dbg !705
  %conv41 = sext i32 %shl to i64, !dbg !706
  store volatile i64 %conv41, i64* @klee_alarm_sink_s64, align 8, !dbg !707
  store i16 0, i16* %retval, align 2, !dbg !708
  br label %return, !dbg !708

return:                                           ; preds = %if.end40, %if.then34, %if.then25, %if.then16, %if.then9, %if.else, %if.then6
  %18 = load i16, i16* %retval, align 2, !dbg !709
  ret i16 %18, !dbg !709
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !710 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !713, metadata !DIExpression()), !dbg !714
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !715
  %cmp = icmp ne i64 %0, 0, !dbg !716
  %conv = zext i1 %cmp to i32, !dbg !716
  ret i32 %conv, !dbg !717
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !718 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !721, metadata !DIExpression()), !dbg !722
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !723, metadata !DIExpression()), !dbg !724
  %0 = load i64, i64* %left.addr, align 8, !dbg !725
  %1 = load i64, i64* %right.addr, align 8, !dbg !726
  %mul = mul nsw i64 %0, %1, !dbg !727
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !728
  %conv = zext i1 %cmp to i32, !dbg !728
  ret i32 %conv, !dbg !729
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !730 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !731, metadata !DIExpression()), !dbg !732
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !733, metadata !DIExpression()), !dbg !734
  %0 = load i64, i64* %left.addr, align 8, !dbg !735
  %1 = load i64, i64* %right.addr, align 8, !dbg !736
  %mul = mul nsw i64 %0, %1, !dbg !737
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !738
  %conv = zext i1 %cmp to i32, !dbg !738
  ret i32 %conv, !dbg !739
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !740 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !741, metadata !DIExpression()), !dbg !742
  %0 = load i64, i64* %left.addr, align 8, !dbg !743
  %cmp = icmp sge i64 %0, 0, !dbg !744
  %conv = zext i1 %cmp to i32, !dbg !744
  ret i32 %conv, !dbg !745
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !746 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !749, metadata !DIExpression()), !dbg !750
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !751, metadata !DIExpression()), !dbg !752
  %0 = load i32, i32* %count.addr, align 4, !dbg !753
  %cmp = icmp uge i32 %0, 63, !dbg !755
  br i1 %cmp, label %if.then, label %if.end, !dbg !756

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !757
  br label %return, !dbg !757

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !759
  %2 = load i32, i32* %count.addr, align 4, !dbg !760
  %sh_prom = zext i32 %2 to i64, !dbg !761
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !761
  %shl = shl i64 1, %sh_prom, !dbg !761, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !762
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !763
  %conv = zext i1 %cmp1 to i32, !dbg !763
  store i32 %conv, i32* %retval, align 4, !dbg !764
  br label %return, !dbg !764

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !765
  ret i32 %3, !dbg !765
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

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
  %div = sdiv i32 %5, %conv8, !dbg !800, !klee.check.div !111
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
  %div12 = sdiv i32 %8, %conv11, !dbg !808, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !809
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !810
  %conv13 = zext i16 %11 to i32, !dbg !810
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !811
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !811
  %div14 = sdiv i32 %10, %conv13, !dbg !811, !klee.check.div !111
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
  %div = sdiv i32 %5, %conv8, !dbg !870, !klee.check.div !111
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
  %div12 = sdiv i32 %8, %conv11, !dbg !878, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !879
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !880
  %conv13 = sext i16 %11 to i32, !dbg !880
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !881
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !881
  %div14 = sdiv i32 %10, %conv13, !dbg !881, !klee.check.div !111
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
  %div = sdiv i32 %5, %conv8, !dbg !936, !klee.check.div !111
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
  %div12 = sdiv i32 %8, %conv11, !dbg !944, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !945
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !946
  %conv13 = zext i16 %11 to i32, !dbg !946
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !947
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !947
  %div14 = sdiv i32 %10, %conv13, !dbg !947, !klee.check.div !111
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
  %div = udiv i32 %6, %conv7, !dbg !1001, !klee.check.div !111
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
  %div = udiv i32 %mul, %3, !dbg !1037, !klee.check.div !111
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
  %div = udiv i32 %2, %conv2, !dbg !1085, !klee.check.div !111
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
  %div5 = udiv i32 %5, %conv4, !dbg !1093, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1094
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv6 = zext i16 %8 to i32, !dbg !1095
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1096
  %div7 = udiv i32 %7, %conv6, !dbg !1096, !klee.check.div !111
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
  %div9 = sdiv i32 %5, %conv8, !dbg !1138, !klee.check.div !111
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
  %div13 = sdiv i32 %8, %conv12, !dbg !1146, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1147
  %11 = load i16, i16* %div.addr, align 2, !dbg !1148
  %conv14 = sext i16 %11 to i32, !dbg !1148
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1149
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1149
  %div15 = sdiv i32 %10, %conv14, !dbg !1149, !klee.check.div !111
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
  %div = sdiv i32 %6, %conv12, !dbg !1210, !klee.check.div !111
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
  %div16 = sdiv i32 %9, %conv15, !dbg !1218, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1219
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1220
  %conv17 = zext i16 %12 to i32, !dbg !1220
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1221
  %div18 = sdiv i32 %11, %conv17, !dbg !1221, !klee.check.div !111
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
  %div = udiv i32 %3, %4, !dbg !1268, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1269
  %mul = mul i32 %div, %5, !dbg !1270
  %sub = sub i32 %2, %mul, !dbg !1271
  %shl = shl i32 %sub, 1, !dbg !1272
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1273
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1274
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1275
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1276
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1276
  %div4 = udiv i32 %6, %7, !dbg !1276, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1277
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1279
  %div5 = udiv i32 %8, %9, !dbg !1279, !klee.check.div !111
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
  %div = udiv i32 %4, %5, !dbg !1316, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1317
  %mul = mul i32 %div, %6, !dbg !1318
  %sub = sub i32 %3, %mul, !dbg !1319
  %shl = shl i32 %sub, 1, !dbg !1320
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1321
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1322
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1323
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1324
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1324
  %div6 = udiv i32 %7, %8, !dbg !1324, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1325
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1326
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1327
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1327
  %div7 = udiv i32 %9, %10, !dbg !1327, !klee.check.div !111
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
  %div = sdiv i32 %6, %7, !dbg !1380, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1381
  %mul = mul nsw i32 %div, %8, !dbg !1382
  %sub = sub nsw i32 %5, %mul, !dbg !1383
  %shl = shl i32 %sub, 1, !dbg !1384
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1385
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1386
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1387
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1388
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1388
  %div12 = udiv i32 %9, %10, !dbg !1388, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1389
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1391
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1391
  %div13 = sdiv i32 %11, %12, !dbg !1391, !klee.check.div !111
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
  %div20 = sdiv i32 %18, %19, !dbg !1413, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1414
  %mul21 = mul nsw i32 %div20, %20, !dbg !1415
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1416
  %shl23 = shl i32 %sub22, 1, !dbg !1417
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1418
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1419
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1421
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1421
  %div24 = udiv i32 %21, %22, !dbg !1421, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1424
  %div25 = sdiv i32 %23, %24, !dbg !1424, !klee.check.div !111
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
  %div = udiv i32 %3, %4, !dbg !1456, !klee.check.div !111
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
  %div7 = udiv i32 %10, %11, !dbg !1483, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1488
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1488
  %div9 = udiv i32 %12, %13, !dbg !1488, !klee.check.div !111
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
  %div = udiv i32 %4, %5, !dbg !1521, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %mul = mul i32 %div, %6, !dbg !1523
  %sub3 = sub i32 %3, %mul, !dbg !1524
  %shl = shl i32 %sub3, 1, !dbg !1525
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1526
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1527
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1529
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1529
  %div4 = udiv i32 %7, %8, !dbg !1529, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1532
  %div5 = udiv i32 %9, %10, !dbg !1532, !klee.check.div !111
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
  %div11 = udiv i32 %14, %15, !dbg !1549, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1550
  %mul12 = mul i32 %div11, %16, !dbg !1551
  %sub13 = sub i32 %13, %mul12, !dbg !1552
  %shl14 = shl i32 %sub13, 1, !dbg !1553
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1554
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1555
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1557
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1557
  %div15 = udiv i32 %17, %18, !dbg !1557, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1560
  %div16 = udiv i32 %19, %20, !dbg !1560, !klee.check.div !111
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
  %div = udiv i32 %4, %5, !dbg !1614, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1615
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1616
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1617
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1618
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1619
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1619
  %div6 = udiv i32 %7, %8, !dbg !1619, !klee.check.div !111
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
  %div20 = udiv i32 %18, %19, !dbg !1659, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1660
  %mul21 = mul i32 %div20, %20, !dbg !1661
  %sub22 = sub i32 %17, %mul21, !dbg !1662
  %shl = shl i32 %sub22, 1, !dbg !1663
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1664
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1665
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1666
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1667
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1667
  %div23 = udiv i32 %21, %22, !dbg !1667, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1668
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1670
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1670
  %div24 = udiv i32 %23, %24, !dbg !1670, !klee.check.div !111
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
  %div = udiv i32 %6, %7, !dbg !1723, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1724
  %mul = mul i32 %div, %8, !dbg !1725
  %sub6 = sub i32 %5, %mul, !dbg !1726
  %shl = shl i32 %sub6, 1, !dbg !1727
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1728
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1729
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1730
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1731
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1731
  %div7 = udiv i32 %9, %10, !dbg !1731, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1732
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1734
  %div8 = udiv i32 %11, %12, !dbg !1734, !klee.check.div !111
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
  %div14 = udiv i32 %17, %18, !dbg !1754, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1755
  %mul15 = mul i32 %div14, %19, !dbg !1756
  %sub16 = sub i32 %16, %mul15, !dbg !1757
  %shl17 = shl i32 %sub16, 1, !dbg !1758
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1759
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1760
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1761
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1762
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1762
  %div18 = udiv i32 %20, %21, !dbg !1762, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1763
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1765
  %div19 = sdiv i32 %22, %23, !dbg !1765, !klee.check.div !111
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
  %div31 = udiv i32 %29, %30, !dbg !1792, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1793
  %mul32 = mul i32 %div31, %31, !dbg !1794
  %sub33 = sub i32 %28, %mul32, !dbg !1795
  %shl34 = shl i32 %sub33, 1, !dbg !1796
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1797
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1798
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1799
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1800
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1800
  %div35 = udiv i32 %32, %33, !dbg !1800, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1801
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1803
  %div36 = udiv i32 %34, %35, !dbg !1803, !klee.check.div !111
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
  %div41 = sdiv i32 %38, %39, !dbg !1814, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1815
  %mul42 = mul nsw i32 %div41, %40, !dbg !1816
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1817
  %shl44 = shl i32 %sub43, 1, !dbg !1818
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1819
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1820
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1822
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1822
  %div45 = sdiv i32 %41, %42, !dbg !1822, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1823
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1825
  %div46 = udiv i32 %43, %44, !dbg !1825, !klee.check.div !111
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
  %div = udiv i32 %4, %5, !dbg !1876, !klee.check.div !111
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
  %div23 = udiv i32 %18, %19, !dbg !1929, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1930
  %mul24 = mul i32 %div23, %20, !dbg !1931
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1932
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1933
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1934
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1935
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1936
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1936
  %div25 = udiv i32 %22, %23, !dbg !1936, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1937
  %mul26 = mul i32 %div25, %24, !dbg !1938
  %sub27 = sub i32 %21, %mul26, !dbg !1939
  %shl = shl i32 %sub27, 1, !dbg !1940
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1941
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1942
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1943
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1944
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1944
  %div28 = udiv i32 %25, %26, !dbg !1944, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1945
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1947
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1947
  %div29 = udiv i32 %27, %28, !dbg !1947, !klee.check.div !111
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085/div_Ccode_alarm_0085.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085")
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
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085")
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
!704 = !DILocation(line: 654, column: 35, scope: !650)
!705 = !DILocation(line: 654, column: 44, scope: !650)
!706 = !DILocation(line: 654, column: 25, scope: !650)
!707 = !DILocation(line: 654, column: 23, scope: !650)
!708 = !DILocation(line: 655, column: 3, scope: !650)
!709 = !DILocation(line: 675, column: 1, scope: !618)
!710 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !711, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!711 = !DISubroutineType(types: !712)
!712 = !{!28, !22}
!713 = !DILocalVariable(name: "denominator", arg: 1, scope: !710, file: !33, line: 24, type: !22)
!714 = !DILocation(line: 24, column: 40, scope: !710)
!715 = !DILocation(line: 26, column: 12, scope: !710)
!716 = !DILocation(line: 26, column: 24, scope: !710)
!717 = !DILocation(line: 26, column: 5, scope: !710)
!718 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !719, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!719 = !DISubroutineType(types: !720)
!720 = !{!28, !22, !22}
!721 = !DILocalVariable(name: "left", arg: 1, scope: !718, file: !33, line: 78, type: !22)
!722 = !DILocation(line: 78, column: 38, scope: !718)
!723 = !DILocalVariable(name: "right", arg: 2, scope: !718, file: !33, line: 78, type: !22)
!724 = !DILocation(line: 78, column: 52, scope: !718)
!725 = !DILocation(line: 80, column: 12, scope: !718)
!726 = !DILocation(line: 80, column: 19, scope: !718)
!727 = !DILocation(line: 80, column: 17, scope: !718)
!728 = !DILocation(line: 80, column: 25, scope: !718)
!729 = !DILocation(line: 80, column: 5, scope: !718)
!730 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !719, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!731 = !DILocalVariable(name: "left", arg: 1, scope: !730, file: !33, line: 72, type: !22)
!732 = !DILocation(line: 72, column: 38, scope: !730)
!733 = !DILocalVariable(name: "right", arg: 2, scope: !730, file: !33, line: 72, type: !22)
!734 = !DILocation(line: 72, column: 52, scope: !730)
!735 = !DILocation(line: 74, column: 12, scope: !730)
!736 = !DILocation(line: 74, column: 19, scope: !730)
!737 = !DILocation(line: 74, column: 17, scope: !730)
!738 = !DILocation(line: 74, column: 25, scope: !730)
!739 = !DILocation(line: 74, column: 5, scope: !730)
!740 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !711, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!741 = !DILocalVariable(name: "left", arg: 1, scope: !740, file: !33, line: 84, type: !22)
!742 = !DILocation(line: 84, column: 51, scope: !740)
!743 = !DILocation(line: 86, column: 12, scope: !740)
!744 = !DILocation(line: 86, column: 17, scope: !740)
!745 = !DILocation(line: 86, column: 5, scope: !740)
!746 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !747, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!747 = !DISubroutineType(types: !748)
!748 = !{!28, !22, !29}
!749 = !DILocalVariable(name: "left", arg: 1, scope: !746, file: !33, line: 90, type: !22)
!750 = !DILocation(line: 90, column: 41, scope: !746)
!751 = !DILocalVariable(name: "count", arg: 2, scope: !746, file: !33, line: 90, type: !29)
!752 = !DILocation(line: 90, column: 56, scope: !746)
!753 = !DILocation(line: 92, column: 9, scope: !754)
!754 = distinct !DILexicalBlock(scope: !746, file: !33, line: 92, column: 9)
!755 = !DILocation(line: 92, column: 15, scope: !754)
!756 = !DILocation(line: 92, column: 9, scope: !746)
!757 = !DILocation(line: 93, column: 9, scope: !758)
!758 = distinct !DILexicalBlock(scope: !754, file: !33, line: 92, column: 32)
!759 = !DILocation(line: 95, column: 12, scope: !746)
!760 = !DILocation(line: 95, column: 34, scope: !746)
!761 = !DILocation(line: 95, column: 31, scope: !746)
!762 = !DILocation(line: 95, column: 17, scope: !746)
!763 = !DILocation(line: 95, column: 41, scope: !746)
!764 = !DILocation(line: 95, column: 5, scope: !746)
!765 = !DILocation(line: 96, column: 1, scope: !746)
!766 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !74, file: !74, line: 693, type: !767, scopeLine: 694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!767 = !DISubroutineType(types: !768)
!768 = !{!6, !18, !6, !18}
!769 = !DILocalVariable(name: "factor1", arg: 1, scope: !766, file: !74, line: 693, type: !18)
!770 = !DILocation(line: 693, column: 33, scope: !766)
!771 = !DILocalVariable(name: "factor2", arg: 2, scope: !766, file: !74, line: 693, type: !6)
!772 = !DILocation(line: 693, column: 46, scope: !766)
!773 = !DILocalVariable(name: "denominator", arg: 3, scope: !766, file: !74, line: 693, type: !18)
!774 = !DILocation(line: 693, column: 59, scope: !766)
!775 = !DILocalVariable(name: "s32Result", scope: !766, file: !74, line: 695, type: !25)
!776 = !DILocation(line: 695, column: 6, scope: !766)
!777 = !DILocalVariable(name: "s32Temp1", scope: !766, file: !74, line: 695, type: !25)
!778 = !DILocation(line: 695, column: 21, scope: !766)
!779 = !DILocation(line: 696, column: 14, scope: !766)
!780 = !DILocation(line: 696, column: 24, scope: !766)
!781 = !DILocation(line: 696, column: 22, scope: !766)
!782 = !DILocation(line: 696, column: 12, scope: !766)
!783 = !DILocation(line: 697, column: 5, scope: !784)
!784 = distinct !DILexicalBlock(scope: !766, file: !74, line: 697, column: 5)
!785 = !DILocation(line: 697, column: 16, scope: !784)
!786 = !DILocation(line: 697, column: 5, scope: !766)
!787 = !DILocation(line: 699, column: 6, scope: !788)
!788 = distinct !DILexicalBlock(scope: !789, file: !74, line: 699, column: 6)
!789 = distinct !DILexicalBlock(scope: !784, file: !74, line: 698, column: 2)
!790 = !DILocation(line: 699, column: 16, scope: !788)
!791 = !DILocation(line: 699, column: 6, scope: !789)
!792 = !DILocation(line: 701, column: 4, scope: !793)
!793 = distinct !DILexicalBlock(scope: !788, file: !74, line: 700, column: 3)
!794 = !DILocation(line: 705, column: 4, scope: !795)
!795 = distinct !DILexicalBlock(scope: !788, file: !74, line: 704, column: 3)
!796 = !DILocation(line: 710, column: 14, scope: !797)
!797 = distinct !DILexicalBlock(scope: !784, file: !74, line: 709, column: 2)
!798 = !DILocation(line: 710, column: 28, scope: !797)
!799 = !DILocation(line: 710, column: 38, scope: !797)
!800 = !DILocation(line: 710, column: 37, scope: !797)
!801 = !DILocation(line: 710, column: 53, scope: !797)
!802 = !DILocation(line: 710, column: 51, scope: !797)
!803 = !DILocation(line: 710, column: 24, scope: !797)
!804 = !DILocation(line: 710, column: 66, scope: !797)
!805 = !DILocation(line: 710, column: 12, scope: !797)
!806 = !DILocation(line: 711, column: 16, scope: !797)
!807 = !DILocation(line: 711, column: 25, scope: !797)
!808 = !DILocation(line: 711, column: 24, scope: !797)
!809 = !DILocation(line: 711, column: 41, scope: !797)
!810 = !DILocation(line: 711, column: 51, scope: !797)
!811 = !DILocation(line: 711, column: 50, scope: !797)
!812 = !DILocation(line: 711, column: 38, scope: !797)
!813 = !DILocation(line: 711, column: 13, scope: !797)
!814 = !DILocation(line: 712, column: 6, scope: !815)
!815 = distinct !DILexicalBlock(scope: !797, file: !74, line: 712, column: 6)
!816 = !DILocation(line: 712, column: 16, scope: !815)
!817 = !DILocation(line: 712, column: 6, scope: !797)
!818 = !DILocation(line: 714, column: 7, scope: !819)
!819 = distinct !DILexicalBlock(scope: !820, file: !74, line: 714, column: 7)
!820 = distinct !DILexicalBlock(scope: !815, file: !74, line: 713, column: 3)
!821 = !DILocation(line: 714, column: 17, scope: !819)
!822 = !DILocation(line: 714, column: 7, scope: !820)
!823 = !DILocation(line: 716, column: 17, scope: !824)
!824 = distinct !DILexicalBlock(scope: !819, file: !74, line: 715, column: 4)
!825 = !DILocation(line: 716, column: 12, scope: !824)
!826 = !DILocation(line: 716, column: 5, scope: !824)
!827 = !DILocation(line: 720, column: 5, scope: !828)
!828 = distinct !DILexicalBlock(scope: !819, file: !74, line: 719, column: 4)
!829 = !DILocation(line: 725, column: 4, scope: !830)
!830 = distinct !DILexicalBlock(scope: !815, file: !74, line: 724, column: 3)
!831 = !DILocation(line: 728, column: 1, scope: !766)
!832 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !74, file: !74, line: 747, type: !833, scopeLine: 748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!833 = !DISubroutineType(types: !834)
!834 = !{!18, !6, !18, !6}
!835 = !DILocalVariable(name: "factor1", arg: 1, scope: !832, file: !74, line: 747, type: !6)
!836 = !DILocation(line: 747, column: 33, scope: !832)
!837 = !DILocalVariable(name: "factor2", arg: 2, scope: !832, file: !74, line: 747, type: !18)
!838 = !DILocation(line: 747, column: 46, scope: !832)
!839 = !DILocalVariable(name: "denominator", arg: 3, scope: !832, file: !74, line: 747, type: !6)
!840 = !DILocation(line: 747, column: 59, scope: !832)
!841 = !DILocalVariable(name: "u32Result", scope: !832, file: !74, line: 749, type: !433)
!842 = !DILocation(line: 749, column: 6, scope: !832)
!843 = !DILocalVariable(name: "u32Temp1", scope: !832, file: !74, line: 749, type: !433)
!844 = !DILocation(line: 749, column: 21, scope: !832)
!845 = !DILocalVariable(name: "s32Result", scope: !832, file: !74, line: 750, type: !25)
!846 = !DILocation(line: 750, column: 6, scope: !832)
!847 = !DILocalVariable(name: "s32Temp1", scope: !832, file: !74, line: 750, type: !25)
!848 = !DILocation(line: 750, column: 21, scope: !832)
!849 = !DILocation(line: 751, column: 14, scope: !832)
!850 = !DILocation(line: 751, column: 24, scope: !832)
!851 = !DILocation(line: 751, column: 22, scope: !832)
!852 = !DILocation(line: 751, column: 12, scope: !832)
!853 = !DILocation(line: 753, column: 5, scope: !854)
!854 = distinct !DILexicalBlock(scope: !832, file: !74, line: 753, column: 5)
!855 = !DILocation(line: 753, column: 17, scope: !854)
!856 = !DILocation(line: 753, column: 5, scope: !832)
!857 = !DILocation(line: 755, column: 6, scope: !858)
!858 = distinct !DILexicalBlock(scope: !859, file: !74, line: 755, column: 6)
!859 = distinct !DILexicalBlock(scope: !854, file: !74, line: 754, column: 2)
!860 = !DILocation(line: 755, column: 16, scope: !858)
!861 = !DILocation(line: 755, column: 6, scope: !859)
!862 = !DILocation(line: 757, column: 4, scope: !863)
!863 = distinct !DILexicalBlock(scope: !858, file: !74, line: 756, column: 3)
!864 = !DILocation(line: 761, column: 4, scope: !865)
!865 = distinct !DILexicalBlock(scope: !858, file: !74, line: 760, column: 3)
!866 = !DILocation(line: 766, column: 15, scope: !867)
!867 = distinct !DILexicalBlock(scope: !854, file: !74, line: 765, column: 2)
!868 = !DILocation(line: 766, column: 29, scope: !867)
!869 = !DILocation(line: 766, column: 39, scope: !867)
!870 = !DILocation(line: 766, column: 38, scope: !867)
!871 = !DILocation(line: 766, column: 54, scope: !867)
!872 = !DILocation(line: 766, column: 52, scope: !867)
!873 = !DILocation(line: 766, column: 25, scope: !867)
!874 = !DILocation(line: 766, column: 68, scope: !867)
!875 = !DILocation(line: 766, column: 12, scope: !867)
!876 = !DILocation(line: 767, column: 16, scope: !867)
!877 = !DILocation(line: 767, column: 25, scope: !867)
!878 = !DILocation(line: 767, column: 24, scope: !867)
!879 = !DILocation(line: 767, column: 41, scope: !867)
!880 = !DILocation(line: 767, column: 51, scope: !867)
!881 = !DILocation(line: 767, column: 50, scope: !867)
!882 = !DILocation(line: 767, column: 38, scope: !867)
!883 = !DILocation(line: 767, column: 13, scope: !867)
!884 = !DILocation(line: 768, column: 6, scope: !885)
!885 = distinct !DILexicalBlock(scope: !867, file: !74, line: 768, column: 6)
!886 = !DILocation(line: 768, column: 16, scope: !885)
!887 = !DILocation(line: 768, column: 6, scope: !867)
!888 = !DILocation(line: 770, column: 7, scope: !889)
!889 = distinct !DILexicalBlock(scope: !890, file: !74, line: 770, column: 7)
!890 = distinct !DILexicalBlock(scope: !885, file: !74, line: 769, column: 3)
!891 = !DILocation(line: 770, column: 17, scope: !889)
!892 = !DILocation(line: 770, column: 7, scope: !890)
!893 = !DILocation(line: 772, column: 17, scope: !894)
!894 = distinct !DILexicalBlock(scope: !889, file: !74, line: 771, column: 4)
!895 = !DILocation(line: 772, column: 12, scope: !894)
!896 = !DILocation(line: 772, column: 5, scope: !894)
!897 = !DILocation(line: 776, column: 5, scope: !898)
!898 = distinct !DILexicalBlock(scope: !889, file: !74, line: 775, column: 4)
!899 = !DILocation(line: 781, column: 4, scope: !900)
!900 = distinct !DILexicalBlock(scope: !885, file: !74, line: 780, column: 3)
!901 = !DILocation(line: 784, column: 1, scope: !832)
!902 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !74, file: !74, line: 803, type: !903, scopeLine: 804, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!903 = !DISubroutineType(types: !904)
!904 = !{!18, !6, !18, !18}
!905 = !DILocalVariable(name: "factor1", arg: 1, scope: !902, file: !74, line: 803, type: !6)
!906 = !DILocation(line: 803, column: 33, scope: !902)
!907 = !DILocalVariable(name: "factor2", arg: 2, scope: !902, file: !74, line: 803, type: !18)
!908 = !DILocation(line: 803, column: 46, scope: !902)
!909 = !DILocalVariable(name: "denominator", arg: 3, scope: !902, file: !74, line: 803, type: !18)
!910 = !DILocation(line: 803, column: 59, scope: !902)
!911 = !DILocalVariable(name: "s32Result", scope: !902, file: !74, line: 805, type: !25)
!912 = !DILocation(line: 805, column: 6, scope: !902)
!913 = !DILocalVariable(name: "s32Temp1", scope: !902, file: !74, line: 805, type: !25)
!914 = !DILocation(line: 805, column: 21, scope: !902)
!915 = !DILocation(line: 806, column: 14, scope: !902)
!916 = !DILocation(line: 806, column: 24, scope: !902)
!917 = !DILocation(line: 806, column: 22, scope: !902)
!918 = !DILocation(line: 806, column: 12, scope: !902)
!919 = !DILocation(line: 808, column: 5, scope: !920)
!920 = distinct !DILexicalBlock(scope: !902, file: !74, line: 808, column: 5)
!921 = !DILocation(line: 808, column: 17, scope: !920)
!922 = !DILocation(line: 808, column: 5, scope: !902)
!923 = !DILocation(line: 810, column: 6, scope: !924)
!924 = distinct !DILexicalBlock(scope: !925, file: !74, line: 810, column: 6)
!925 = distinct !DILexicalBlock(scope: !920, file: !74, line: 809, column: 2)
!926 = !DILocation(line: 810, column: 16, scope: !924)
!927 = !DILocation(line: 810, column: 6, scope: !925)
!928 = !DILocation(line: 812, column: 4, scope: !929)
!929 = distinct !DILexicalBlock(scope: !924, file: !74, line: 811, column: 3)
!930 = !DILocation(line: 816, column: 4, scope: !931)
!931 = distinct !DILexicalBlock(scope: !924, file: !74, line: 815, column: 3)
!932 = !DILocation(line: 821, column: 15, scope: !933)
!933 = distinct !DILexicalBlock(scope: !920, file: !74, line: 820, column: 2)
!934 = !DILocation(line: 821, column: 29, scope: !933)
!935 = !DILocation(line: 821, column: 39, scope: !933)
!936 = !DILocation(line: 821, column: 38, scope: !933)
!937 = !DILocation(line: 821, column: 54, scope: !933)
!938 = !DILocation(line: 821, column: 52, scope: !933)
!939 = !DILocation(line: 821, column: 25, scope: !933)
!940 = !DILocation(line: 821, column: 68, scope: !933)
!941 = !DILocation(line: 821, column: 12, scope: !933)
!942 = !DILocation(line: 822, column: 16, scope: !933)
!943 = !DILocation(line: 822, column: 25, scope: !933)
!944 = !DILocation(line: 822, column: 24, scope: !933)
!945 = !DILocation(line: 822, column: 41, scope: !933)
!946 = !DILocation(line: 822, column: 51, scope: !933)
!947 = !DILocation(line: 822, column: 50, scope: !933)
!948 = !DILocation(line: 822, column: 38, scope: !933)
!949 = !DILocation(line: 822, column: 13, scope: !933)
!950 = !DILocation(line: 823, column: 6, scope: !951)
!951 = distinct !DILexicalBlock(scope: !933, file: !74, line: 823, column: 6)
!952 = !DILocation(line: 823, column: 16, scope: !951)
!953 = !DILocation(line: 823, column: 6, scope: !933)
!954 = !DILocation(line: 825, column: 7, scope: !955)
!955 = distinct !DILexicalBlock(scope: !956, file: !74, line: 825, column: 7)
!956 = distinct !DILexicalBlock(scope: !951, file: !74, line: 824, column: 3)
!957 = !DILocation(line: 825, column: 17, scope: !955)
!958 = !DILocation(line: 825, column: 7, scope: !956)
!959 = !DILocation(line: 827, column: 17, scope: !960)
!960 = distinct !DILexicalBlock(scope: !955, file: !74, line: 826, column: 4)
!961 = !DILocation(line: 827, column: 12, scope: !960)
!962 = !DILocation(line: 827, column: 5, scope: !960)
!963 = !DILocation(line: 831, column: 5, scope: !964)
!964 = distinct !DILexicalBlock(scope: !955, file: !74, line: 830, column: 4)
!965 = !DILocation(line: 836, column: 4, scope: !966)
!966 = distinct !DILexicalBlock(scope: !951, file: !74, line: 835, column: 3)
!967 = !DILocation(line: 840, column: 1, scope: !902)
!968 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 858, type: !969, scopeLine: 859, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!969 = !DISubroutineType(types: !970)
!970 = !{!18, !18, !18, !18}
!971 = !DILocalVariable(name: "factor1", arg: 1, scope: !968, file: !74, line: 858, type: !18)
!972 = !DILocation(line: 858, column: 33, scope: !968)
!973 = !DILocalVariable(name: "factor2", arg: 2, scope: !968, file: !74, line: 858, type: !18)
!974 = !DILocation(line: 858, column: 46, scope: !968)
!975 = !DILocalVariable(name: "denominator", arg: 3, scope: !968, file: !74, line: 858, type: !18)
!976 = !DILocation(line: 858, column: 59, scope: !968)
!977 = !DILocalVariable(name: "u32Temp1", scope: !968, file: !74, line: 860, type: !433)
!978 = !DILocation(line: 860, column: 6, scope: !968)
!979 = !DILocalVariable(name: "u16TempDenom", scope: !968, file: !74, line: 861, type: !18)
!980 = !DILocation(line: 861, column: 6, scope: !968)
!981 = !DILocation(line: 863, column: 5, scope: !982)
!982 = distinct !DILexicalBlock(scope: !968, file: !74, line: 863, column: 5)
!983 = !DILocation(line: 863, column: 17, scope: !982)
!984 = !DILocation(line: 863, column: 5, scope: !968)
!985 = !DILocation(line: 865, column: 3, scope: !986)
!986 = distinct !DILexicalBlock(scope: !982, file: !74, line: 864, column: 2)
!987 = !DILocation(line: 869, column: 14, scope: !988)
!988 = distinct !DILexicalBlock(scope: !982, file: !74, line: 868, column: 2)
!989 = !DILocation(line: 869, column: 24, scope: !988)
!990 = !DILocation(line: 869, column: 22, scope: !988)
!991 = !DILocation(line: 869, column: 12, scope: !988)
!992 = !DILocation(line: 870, column: 18, scope: !988)
!993 = !DILocation(line: 870, column: 30, scope: !988)
!994 = !DILocation(line: 870, column: 16, scope: !988)
!995 = !DILocation(line: 871, column: 14, scope: !988)
!996 = !DILocation(line: 871, column: 25, scope: !988)
!997 = !DILocation(line: 871, column: 23, scope: !988)
!998 = !DILocation(line: 871, column: 12, scope: !988)
!999 = !DILocation(line: 872, column: 14, scope: !988)
!1000 = !DILocation(line: 872, column: 25, scope: !988)
!1001 = !DILocation(line: 872, column: 23, scope: !988)
!1002 = !DILocation(line: 872, column: 12, scope: !988)
!1003 = !DILocation(line: 873, column: 6, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !988, file: !74, line: 873, column: 6)
!1005 = !DILocation(line: 873, column: 15, scope: !1004)
!1006 = !DILocation(line: 873, column: 6, scope: !988)
!1007 = !DILocation(line: 875, column: 12, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1004, file: !74, line: 874, column: 3)
!1009 = !DILocation(line: 875, column: 21, scope: !1008)
!1010 = !DILocation(line: 875, column: 11, scope: !1008)
!1011 = !DILocation(line: 875, column: 4, scope: !1008)
!1012 = !DILocation(line: 880, column: 4, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1004, file: !74, line: 879, column: 3)
!1014 = !DILocation(line: 885, column: 1, scope: !968)
!1015 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 902, type: !1016, scopeLine: 903, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!18, !18, !18, !433}
!1018 = !DILocalVariable(name: "factor1", arg: 1, scope: !1015, file: !74, line: 902, type: !18)
!1019 = !DILocation(line: 902, column: 33, scope: !1015)
!1020 = !DILocalVariable(name: "factor2", arg: 2, scope: !1015, file: !74, line: 902, type: !18)
!1021 = !DILocation(line: 902, column: 46, scope: !1015)
!1022 = !DILocalVariable(name: "denominator", arg: 3, scope: !1015, file: !74, line: 902, type: !433)
!1023 = !DILocation(line: 902, column: 59, scope: !1015)
!1024 = !DILocalVariable(name: "u32Temp1", scope: !1015, file: !74, line: 904, type: !433)
!1025 = !DILocation(line: 904, column: 6, scope: !1015)
!1026 = !DILocation(line: 905, column: 5, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1015, file: !74, line: 905, column: 5)
!1028 = !DILocation(line: 905, column: 17, scope: !1027)
!1029 = !DILocation(line: 905, column: 5, scope: !1015)
!1030 = !DILocation(line: 907, column: 3, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1027, file: !74, line: 906, column: 2)
!1032 = !DILocation(line: 911, column: 15, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1027, file: !74, line: 910, column: 2)
!1034 = !DILocation(line: 911, column: 25, scope: !1033)
!1035 = !DILocation(line: 911, column: 23, scope: !1033)
!1036 = !DILocation(line: 911, column: 36, scope: !1033)
!1037 = !DILocation(line: 911, column: 34, scope: !1033)
!1038 = !DILocation(line: 911, column: 12, scope: !1033)
!1039 = !DILocation(line: 912, column: 8, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1033, file: !74, line: 912, column: 6)
!1041 = !DILocation(line: 912, column: 18, scope: !1040)
!1042 = !DILocation(line: 912, column: 16, scope: !1040)
!1043 = !DILocation(line: 912, column: 28, scope: !1040)
!1044 = !DILocation(line: 912, column: 40, scope: !1040)
!1045 = !DILocation(line: 912, column: 39, scope: !1040)
!1046 = !DILocation(line: 912, column: 26, scope: !1040)
!1047 = !DILocation(line: 912, column: 53, scope: !1040)
!1048 = !DILocation(line: 912, column: 64, scope: !1040)
!1049 = !DILocation(line: 912, column: 50, scope: !1040)
!1050 = !DILocation(line: 912, column: 6, scope: !1033)
!1051 = !DILocation(line: 914, column: 12, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1040, file: !74, line: 913, column: 3)
!1053 = !DILocation(line: 915, column: 3, scope: !1052)
!1054 = !DILocation(line: 916, column: 6, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1033, file: !74, line: 916, column: 6)
!1056 = !DILocation(line: 916, column: 15, scope: !1055)
!1057 = !DILocation(line: 916, column: 6, scope: !1033)
!1058 = !DILocation(line: 918, column: 12, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1055, file: !74, line: 917, column: 3)
!1060 = !DILocation(line: 918, column: 21, scope: !1059)
!1061 = !DILocation(line: 918, column: 11, scope: !1059)
!1062 = !DILocation(line: 918, column: 4, scope: !1059)
!1063 = !DILocation(line: 922, column: 4, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1055, file: !74, line: 921, column: 3)
!1065 = !DILocation(line: 925, column: 1, scope: !1015)
!1066 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 942, type: !1067, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!433, !433, !18}
!1069 = !DILocalVariable(name: "x_value", arg: 1, scope: !1066, file: !74, line: 942, type: !433)
!1070 = !DILocation(line: 942, column: 25, scope: !1066)
!1071 = !DILocalVariable(name: "y_value", arg: 2, scope: !1066, file: !74, line: 942, type: !18)
!1072 = !DILocation(line: 942, column: 38, scope: !1066)
!1073 = !DILocalVariable(name: "u32Temp1", scope: !1066, file: !74, line: 944, type: !433)
!1074 = !DILocation(line: 944, column: 6, scope: !1066)
!1075 = !DILocation(line: 945, column: 5, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1066, file: !74, line: 945, column: 5)
!1077 = !DILocation(line: 945, column: 13, scope: !1076)
!1078 = !DILocation(line: 945, column: 5, scope: !1066)
!1079 = !DILocation(line: 947, column: 3, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1076, file: !74, line: 946, column: 2)
!1081 = !DILocation(line: 951, column: 15, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1076, file: !74, line: 950, column: 2)
!1083 = !DILocation(line: 951, column: 26, scope: !1082)
!1084 = !DILocation(line: 951, column: 34, scope: !1082)
!1085 = !DILocation(line: 951, column: 33, scope: !1082)
!1086 = !DILocation(line: 951, column: 45, scope: !1082)
!1087 = !DILocation(line: 951, column: 43, scope: !1082)
!1088 = !DILocation(line: 951, column: 23, scope: !1082)
!1089 = !DILocation(line: 951, column: 54, scope: !1082)
!1090 = !DILocation(line: 951, column: 12, scope: !1082)
!1091 = !DILocation(line: 952, column: 15, scope: !1082)
!1092 = !DILocation(line: 952, column: 23, scope: !1082)
!1093 = !DILocation(line: 952, column: 22, scope: !1082)
!1094 = !DILocation(line: 952, column: 35, scope: !1082)
!1095 = !DILocation(line: 952, column: 44, scope: !1082)
!1096 = !DILocation(line: 952, column: 43, scope: !1082)
!1097 = !DILocation(line: 952, column: 32, scope: !1082)
!1098 = !DILocation(line: 952, column: 12, scope: !1082)
!1099 = !DILocation(line: 953, column: 10, scope: !1082)
!1100 = !DILocation(line: 953, column: 3, scope: !1082)
!1101 = !DILocation(line: 955, column: 1, scope: !1066)
!1102 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 973, type: !1103, scopeLine: 974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!6, !6, !6, !6}
!1105 = !DILocalVariable(name: "fak1", arg: 1, scope: !1102, file: !74, line: 973, type: !6)
!1106 = !DILocation(line: 973, column: 33, scope: !1102)
!1107 = !DILocalVariable(name: "fak2", arg: 2, scope: !1102, file: !74, line: 973, type: !6)
!1108 = !DILocation(line: 973, column: 43, scope: !1102)
!1109 = !DILocalVariable(name: "div", arg: 3, scope: !1102, file: !74, line: 973, type: !6)
!1110 = !DILocation(line: 973, column: 53, scope: !1102)
!1111 = !DILocalVariable(name: "s32Temp1", scope: !1102, file: !74, line: 975, type: !25)
!1112 = !DILocation(line: 975, column: 6, scope: !1102)
!1113 = !DILocalVariable(name: "s32Temp2", scope: !1102, file: !74, line: 975, type: !25)
!1114 = !DILocation(line: 975, column: 20, scope: !1102)
!1115 = !DILocalVariable(name: "s32Temp3", scope: !1102, file: !74, line: 975, type: !25)
!1116 = !DILocation(line: 975, column: 34, scope: !1102)
!1117 = !DILocation(line: 976, column: 13, scope: !1102)
!1118 = !DILocation(line: 976, column: 20, scope: !1102)
!1119 = !DILocation(line: 976, column: 18, scope: !1102)
!1120 = !DILocation(line: 976, column: 11, scope: !1102)
!1121 = !DILocation(line: 977, column: 5, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1102, file: !74, line: 977, column: 5)
!1123 = !DILocation(line: 977, column: 9, scope: !1122)
!1124 = !DILocation(line: 977, column: 5, scope: !1102)
!1125 = !DILocation(line: 979, column: 6, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1127, file: !74, line: 979, column: 6)
!1127 = distinct !DILexicalBlock(scope: !1122, file: !74, line: 978, column: 2)
!1128 = !DILocation(line: 979, column: 15, scope: !1126)
!1129 = !DILocation(line: 979, column: 6, scope: !1127)
!1130 = !DILocation(line: 981, column: 4, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1126, file: !74, line: 980, column: 3)
!1132 = !DILocation(line: 985, column: 4, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1126, file: !74, line: 984, column: 3)
!1134 = !DILocation(line: 990, column: 15, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1122, file: !74, line: 989, column: 2)
!1136 = !DILocation(line: 990, column: 28, scope: !1135)
!1137 = !DILocation(line: 990, column: 39, scope: !1135)
!1138 = !DILocation(line: 990, column: 37, scope: !1135)
!1139 = !DILocation(line: 990, column: 46, scope: !1135)
!1140 = !DILocation(line: 990, column: 44, scope: !1135)
!1141 = !DILocation(line: 990, column: 24, scope: !1135)
!1142 = !DILocation(line: 990, column: 52, scope: !1135)
!1143 = !DILocation(line: 990, column: 12, scope: !1135)
!1144 = !DILocation(line: 991, column: 15, scope: !1135)
!1145 = !DILocation(line: 991, column: 24, scope: !1135)
!1146 = !DILocation(line: 991, column: 23, scope: !1135)
!1147 = !DILocation(line: 991, column: 32, scope: !1135)
!1148 = !DILocation(line: 991, column: 41, scope: !1135)
!1149 = !DILocation(line: 991, column: 40, scope: !1135)
!1150 = !DILocation(line: 991, column: 29, scope: !1135)
!1151 = !DILocation(line: 991, column: 12, scope: !1135)
!1152 = !DILocation(line: 992, column: 6, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1135, file: !74, line: 992, column: 6)
!1154 = !DILocation(line: 992, column: 15, scope: !1153)
!1155 = !DILocation(line: 992, column: 6, scope: !1135)
!1156 = !DILocation(line: 994, column: 7, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1158, file: !74, line: 994, column: 7)
!1158 = distinct !DILexicalBlock(scope: !1153, file: !74, line: 993, column: 3)
!1159 = !DILocation(line: 994, column: 16, scope: !1157)
!1160 = !DILocation(line: 994, column: 7, scope: !1158)
!1161 = !DILocation(line: 996, column: 17, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1157, file: !74, line: 995, column: 4)
!1163 = !DILocation(line: 996, column: 12, scope: !1162)
!1164 = !DILocation(line: 996, column: 5, scope: !1162)
!1165 = !DILocation(line: 1000, column: 5, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1157, file: !74, line: 999, column: 4)
!1167 = !DILocation(line: 1005, column: 4, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1153, file: !74, line: 1004, column: 3)
!1169 = !DILocation(line: 1008, column: 1, scope: !1102)
!1170 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1026, type: !1171, scopeLine: 1027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{!6, !6, !6, !18}
!1173 = !DILocalVariable(name: "data1", arg: 1, scope: !1170, file: !74, line: 1026, type: !6)
!1174 = !DILocation(line: 1026, column: 33, scope: !1170)
!1175 = !DILocalVariable(name: "data2", arg: 2, scope: !1170, file: !74, line: 1026, type: !6)
!1176 = !DILocation(line: 1026, column: 43, scope: !1170)
!1177 = !DILocalVariable(name: "denominator", arg: 3, scope: !1170, file: !74, line: 1026, type: !18)
!1178 = !DILocation(line: 1026, column: 53, scope: !1170)
!1179 = !DILocalVariable(name: "s32Result", scope: !1170, file: !74, line: 1028, type: !25)
!1180 = !DILocation(line: 1028, column: 6, scope: !1170)
!1181 = !DILocalVariable(name: "s32Temp1", scope: !1170, file: !74, line: 1028, type: !25)
!1182 = !DILocation(line: 1028, column: 21, scope: !1170)
!1183 = !DILocation(line: 1029, column: 14, scope: !1170)
!1184 = !DILocation(line: 1029, column: 22, scope: !1170)
!1185 = !DILocation(line: 1029, column: 20, scope: !1170)
!1186 = !DILocation(line: 1029, column: 12, scope: !1170)
!1187 = !DILocation(line: 1031, column: 5, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1170, file: !74, line: 1031, column: 5)
!1189 = !DILocation(line: 1031, column: 17, scope: !1188)
!1190 = !DILocation(line: 1031, column: 5, scope: !1170)
!1191 = !DILocation(line: 1033, column: 6, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1193, file: !74, line: 1033, column: 6)
!1193 = distinct !DILexicalBlock(scope: !1188, file: !74, line: 1032, column: 2)
!1194 = !DILocation(line: 1033, column: 16, scope: !1192)
!1195 = !DILocation(line: 1033, column: 6, scope: !1193)
!1196 = !DILocation(line: 1035, column: 4, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1192, file: !74, line: 1034, column: 3)
!1198 = !DILocation(line: 1037, column: 11, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1192, file: !74, line: 1037, column: 11)
!1200 = !DILocation(line: 1037, column: 21, scope: !1199)
!1201 = !DILocation(line: 1037, column: 11, scope: !1192)
!1202 = !DILocation(line: 1039, column: 4, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1199, file: !74, line: 1038, column: 3)
!1204 = !DILocation(line: 1043, column: 4, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1199, file: !74, line: 1042, column: 3)
!1206 = !DILocation(line: 1048, column: 15, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1188, file: !74, line: 1047, column: 2)
!1208 = !DILocation(line: 1048, column: 28, scope: !1207)
!1209 = !DILocation(line: 1048, column: 38, scope: !1207)
!1210 = !DILocation(line: 1048, column: 37, scope: !1207)
!1211 = !DILocation(line: 1048, column: 51, scope: !1207)
!1212 = !DILocation(line: 1048, column: 50, scope: !1207)
!1213 = !DILocation(line: 1048, column: 25, scope: !1207)
!1214 = !DILocation(line: 1048, column: 64, scope: !1207)
!1215 = !DILocation(line: 1048, column: 12, scope: !1207)
!1216 = !DILocation(line: 1049, column: 16, scope: !1207)
!1217 = !DILocation(line: 1049, column: 25, scope: !1207)
!1218 = !DILocation(line: 1049, column: 24, scope: !1207)
!1219 = !DILocation(line: 1049, column: 41, scope: !1207)
!1220 = !DILocation(line: 1049, column: 51, scope: !1207)
!1221 = !DILocation(line: 1049, column: 50, scope: !1207)
!1222 = !DILocation(line: 1049, column: 38, scope: !1207)
!1223 = !DILocation(line: 1049, column: 13, scope: !1207)
!1224 = !DILocation(line: 1050, column: 6, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1207, file: !74, line: 1050, column: 6)
!1226 = !DILocation(line: 1050, column: 16, scope: !1225)
!1227 = !DILocation(line: 1050, column: 6, scope: !1207)
!1228 = !DILocation(line: 1052, column: 7, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1230, file: !74, line: 1052, column: 7)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !74, line: 1051, column: 3)
!1231 = !DILocation(line: 1052, column: 17, scope: !1229)
!1232 = !DILocation(line: 1052, column: 7, scope: !1230)
!1233 = !DILocation(line: 1054, column: 17, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1229, file: !74, line: 1053, column: 4)
!1235 = !DILocation(line: 1054, column: 12, scope: !1234)
!1236 = !DILocation(line: 1054, column: 5, scope: !1234)
!1237 = !DILocation(line: 1058, column: 5, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1229, file: !74, line: 1057, column: 4)
!1239 = !DILocation(line: 1063, column: 4, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1225, file: !74, line: 1062, column: 3)
!1241 = !DILocation(line: 1067, column: 1, scope: !1170)
!1242 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1084, type: !1243, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!433, !433, !25}
!1245 = !DILocalVariable(name: "numerator", arg: 1, scope: !1242, file: !74, line: 1084, type: !433)
!1246 = !DILocation(line: 1084, column: 25, scope: !1242)
!1247 = !DILocalVariable(name: "denominator", arg: 2, scope: !1242, file: !74, line: 1084, type: !25)
!1248 = !DILocation(line: 1084, column: 40, scope: !1242)
!1249 = !DILocalVariable(name: "u32Temp1", scope: !1242, file: !74, line: 1086, type: !433)
!1250 = !DILocation(line: 1086, column: 6, scope: !1242)
!1251 = !DILocation(line: 1087, column: 5, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1242, file: !74, line: 1087, column: 5)
!1253 = !DILocation(line: 1087, column: 17, scope: !1252)
!1254 = !DILocation(line: 1087, column: 5, scope: !1242)
!1255 = !DILocation(line: 1089, column: 3, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1252, file: !74, line: 1088, column: 2)
!1257 = !DILocation(line: 1093, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1259, file: !74, line: 1093, column: 6)
!1259 = distinct !DILexicalBlock(scope: !1252, file: !74, line: 1092, column: 2)
!1260 = !DILocation(line: 1093, column: 18, scope: !1258)
!1261 = !DILocation(line: 1093, column: 6, scope: !1259)
!1262 = !DILocation(line: 1095, column: 4, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !74, line: 1094, column: 3)
!1264 = !DILocation(line: 1099, column: 16, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1258, file: !74, line: 1098, column: 3)
!1266 = !DILocation(line: 1099, column: 30, scope: !1265)
!1267 = !DILocation(line: 1099, column: 40, scope: !1265)
!1268 = !DILocation(line: 1099, column: 39, scope: !1265)
!1269 = !DILocation(line: 1099, column: 55, scope: !1265)
!1270 = !DILocation(line: 1099, column: 53, scope: !1265)
!1271 = !DILocation(line: 1099, column: 26, scope: !1265)
!1272 = !DILocation(line: 1099, column: 68, scope: !1265)
!1273 = !DILocation(line: 1099, column: 13, scope: !1265)
!1274 = !DILocation(line: 1100, column: 16, scope: !1265)
!1275 = !DILocation(line: 1100, column: 25, scope: !1265)
!1276 = !DILocation(line: 1100, column: 24, scope: !1265)
!1277 = !DILocation(line: 1100, column: 41, scope: !1265)
!1278 = !DILocation(line: 1100, column: 51, scope: !1265)
!1279 = !DILocation(line: 1100, column: 50, scope: !1265)
!1280 = !DILocation(line: 1100, column: 38, scope: !1265)
!1281 = !DILocation(line: 1100, column: 13, scope: !1265)
!1282 = !DILocation(line: 1101, column: 11, scope: !1265)
!1283 = !DILocation(line: 1101, column: 4, scope: !1265)
!1284 = !DILocation(line: 1104, column: 1, scope: !1242)
!1285 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1121, type: !1286, scopeLine: 1122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!433, !25, !433}
!1288 = !DILocalVariable(name: "numerator", arg: 1, scope: !1285, file: !74, line: 1121, type: !25)
!1289 = !DILocation(line: 1121, column: 25, scope: !1285)
!1290 = !DILocalVariable(name: "denominator", arg: 2, scope: !1285, file: !74, line: 1121, type: !433)
!1291 = !DILocation(line: 1121, column: 40, scope: !1285)
!1292 = !DILocalVariable(name: "s32Temp1", scope: !1285, file: !74, line: 1123, type: !25)
!1293 = !DILocation(line: 1123, column: 6, scope: !1285)
!1294 = !DILocation(line: 1124, column: 5, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1285, file: !74, line: 1124, column: 5)
!1296 = !DILocation(line: 1124, column: 17, scope: !1295)
!1297 = !DILocation(line: 1124, column: 5, scope: !1285)
!1298 = !DILocation(line: 1126, column: 6, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1300, file: !74, line: 1126, column: 6)
!1300 = distinct !DILexicalBlock(scope: !1295, file: !74, line: 1125, column: 2)
!1301 = !DILocation(line: 1126, column: 16, scope: !1299)
!1302 = !DILocation(line: 1126, column: 6, scope: !1300)
!1303 = !DILocation(line: 1128, column: 4, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1299, file: !74, line: 1127, column: 3)
!1305 = !DILocation(line: 1132, column: 4, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1299, file: !74, line: 1131, column: 3)
!1307 = !DILocation(line: 1137, column: 6, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1309, file: !74, line: 1137, column: 6)
!1309 = distinct !DILexicalBlock(scope: !1295, file: !74, line: 1136, column: 2)
!1310 = !DILocation(line: 1137, column: 16, scope: !1308)
!1311 = !DILocation(line: 1137, column: 6, scope: !1309)
!1312 = !DILocation(line: 1139, column: 17, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !74, line: 1138, column: 3)
!1314 = !DILocation(line: 1139, column: 31, scope: !1313)
!1315 = !DILocation(line: 1139, column: 41, scope: !1313)
!1316 = !DILocation(line: 1139, column: 40, scope: !1313)
!1317 = !DILocation(line: 1139, column: 56, scope: !1313)
!1318 = !DILocation(line: 1139, column: 54, scope: !1313)
!1319 = !DILocation(line: 1139, column: 27, scope: !1313)
!1320 = !DILocation(line: 1139, column: 69, scope: !1313)
!1321 = !DILocation(line: 1139, column: 13, scope: !1313)
!1322 = !DILocation(line: 1140, column: 13, scope: !1313)
!1323 = !DILocation(line: 1140, column: 23, scope: !1313)
!1324 = !DILocation(line: 1140, column: 22, scope: !1313)
!1325 = !DILocation(line: 1140, column: 39, scope: !1313)
!1326 = !DILocation(line: 1140, column: 48, scope: !1313)
!1327 = !DILocation(line: 1140, column: 47, scope: !1313)
!1328 = !DILocation(line: 1140, column: 36, scope: !1313)
!1329 = !DILocation(line: 1140, column: 4, scope: !1313)
!1330 = !DILocation(line: 1144, column: 4, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1308, file: !74, line: 1143, column: 3)
!1332 = !DILocation(line: 1147, column: 1, scope: !1285)
!1333 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1164, type: !1334, scopeLine: 1165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1334 = !DISubroutineType(types: !1335)
!1335 = !{!433, !25, !25}
!1336 = !DILocalVariable(name: "numerator", arg: 1, scope: !1333, file: !74, line: 1164, type: !25)
!1337 = !DILocation(line: 1164, column: 25, scope: !1333)
!1338 = !DILocalVariable(name: "denominator", arg: 2, scope: !1333, file: !74, line: 1164, type: !25)
!1339 = !DILocation(line: 1164, column: 40, scope: !1333)
!1340 = !DILocalVariable(name: "u32Temp1", scope: !1333, file: !74, line: 1166, type: !433)
!1341 = !DILocation(line: 1166, column: 6, scope: !1333)
!1342 = !DILocalVariable(name: "u32Temp2", scope: !1333, file: !74, line: 1166, type: !433)
!1343 = !DILocation(line: 1166, column: 20, scope: !1333)
!1344 = !DILocation(line: 1167, column: 5, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1333, file: !74, line: 1167, column: 5)
!1346 = !DILocation(line: 1167, column: 17, scope: !1345)
!1347 = !DILocation(line: 1167, column: 5, scope: !1333)
!1348 = !DILocation(line: 1169, column: 6, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1350, file: !74, line: 1169, column: 6)
!1350 = distinct !DILexicalBlock(scope: !1345, file: !74, line: 1168, column: 2)
!1351 = !DILocation(line: 1169, column: 16, scope: !1349)
!1352 = !DILocation(line: 1169, column: 6, scope: !1350)
!1353 = !DILocation(line: 1171, column: 4, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1349, file: !74, line: 1170, column: 3)
!1355 = !DILocation(line: 1175, column: 4, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1349, file: !74, line: 1174, column: 3)
!1357 = !DILocation(line: 1180, column: 6, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1359, file: !74, line: 1180, column: 6)
!1359 = distinct !DILexicalBlock(scope: !1345, file: !74, line: 1179, column: 2)
!1360 = !DILocation(line: 1180, column: 16, scope: !1358)
!1361 = !DILocation(line: 1180, column: 6, scope: !1359)
!1362 = !DILocation(line: 1182, column: 7, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1364, file: !74, line: 1182, column: 7)
!1364 = distinct !DILexicalBlock(scope: !1358, file: !74, line: 1181, column: 3)
!1365 = !DILocation(line: 1182, column: 17, scope: !1363)
!1366 = !DILocation(line: 1182, column: 7, scope: !1364)
!1367 = !DILocation(line: 1184, column: 5, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1363, file: !74, line: 1183, column: 4)
!1369 = !DILocation(line: 1188, column: 8, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1371, file: !74, line: 1188, column: 8)
!1371 = distinct !DILexicalBlock(scope: !1363, file: !74, line: 1187, column: 4)
!1372 = !DILocation(line: 1188, column: 20, scope: !1370)
!1373 = !DILocation(line: 1188, column: 8, scope: !1371)
!1374 = !DILocation(line: 1190, column: 6, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1370, file: !74, line: 1189, column: 5)
!1376 = !DILocation(line: 1194, column: 18, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1370, file: !74, line: 1193, column: 5)
!1378 = !DILocation(line: 1194, column: 32, scope: !1377)
!1379 = !DILocation(line: 1194, column: 42, scope: !1377)
!1380 = !DILocation(line: 1194, column: 41, scope: !1377)
!1381 = !DILocation(line: 1194, column: 57, scope: !1377)
!1382 = !DILocation(line: 1194, column: 55, scope: !1377)
!1383 = !DILocation(line: 1194, column: 28, scope: !1377)
!1384 = !DILocation(line: 1194, column: 71, scope: !1377)
!1385 = !DILocation(line: 1194, column: 15, scope: !1377)
!1386 = !DILocation(line: 1195, column: 18, scope: !1377)
!1387 = !DILocation(line: 1195, column: 29, scope: !1377)
!1388 = !DILocation(line: 1195, column: 27, scope: !1377)
!1389 = !DILocation(line: 1195, column: 45, scope: !1377)
!1390 = !DILocation(line: 1195, column: 57, scope: !1377)
!1391 = !DILocation(line: 1195, column: 55, scope: !1377)
!1392 = !DILocation(line: 1195, column: 42, scope: !1377)
!1393 = !DILocation(line: 1195, column: 15, scope: !1377)
!1394 = !DILocation(line: 1196, column: 13, scope: !1377)
!1395 = !DILocation(line: 1196, column: 6, scope: !1377)
!1396 = !DILocation(line: 1202, column: 7, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1398, file: !74, line: 1202, column: 7)
!1398 = distinct !DILexicalBlock(scope: !1358, file: !74, line: 1201, column: 3)
!1399 = !DILocation(line: 1202, column: 19, scope: !1397)
!1400 = !DILocation(line: 1202, column: 7, scope: !1398)
!1401 = !DILocation(line: 1204, column: 5, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1397, file: !74, line: 1203, column: 4)
!1403 = !DILocation(line: 1208, column: 18, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1397, file: !74, line: 1207, column: 4)
!1405 = !DILocation(line: 1208, column: 17, scope: !1404)
!1406 = !DILocation(line: 1208, column: 15, scope: !1404)
!1407 = !DILocation(line: 1209, column: 20, scope: !1404)
!1408 = !DILocation(line: 1209, column: 19, scope: !1404)
!1409 = !DILocation(line: 1209, column: 17, scope: !1404)
!1410 = !DILocation(line: 1210, column: 17, scope: !1404)
!1411 = !DILocation(line: 1210, column: 31, scope: !1404)
!1412 = !DILocation(line: 1210, column: 41, scope: !1404)
!1413 = !DILocation(line: 1210, column: 40, scope: !1404)
!1414 = !DILocation(line: 1210, column: 56, scope: !1404)
!1415 = !DILocation(line: 1210, column: 54, scope: !1404)
!1416 = !DILocation(line: 1210, column: 27, scope: !1404)
!1417 = !DILocation(line: 1210, column: 70, scope: !1404)
!1418 = !DILocation(line: 1210, column: 14, scope: !1404)
!1419 = !DILocation(line: 1211, column: 17, scope: !1404)
!1420 = !DILocation(line: 1211, column: 28, scope: !1404)
!1421 = !DILocation(line: 1211, column: 26, scope: !1404)
!1422 = !DILocation(line: 1211, column: 44, scope: !1404)
!1423 = !DILocation(line: 1211, column: 56, scope: !1404)
!1424 = !DILocation(line: 1211, column: 54, scope: !1404)
!1425 = !DILocation(line: 1211, column: 41, scope: !1404)
!1426 = !DILocation(line: 1211, column: 14, scope: !1404)
!1427 = !DILocation(line: 1212, column: 12, scope: !1404)
!1428 = !DILocation(line: 1212, column: 5, scope: !1404)
!1429 = !DILocation(line: 1217, column: 1, scope: !1333)
!1430 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1234, type: !1431, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!433, !433, !433}
!1433 = !DILocalVariable(name: "numerator", arg: 1, scope: !1430, file: !74, line: 1234, type: !433)
!1434 = !DILocation(line: 1234, column: 25, scope: !1430)
!1435 = !DILocalVariable(name: "denominator", arg: 2, scope: !1430, file: !74, line: 1234, type: !433)
!1436 = !DILocation(line: 1234, column: 40, scope: !1430)
!1437 = !DILocalVariable(name: "u32Temp1", scope: !1430, file: !74, line: 1237, type: !433)
!1438 = !DILocation(line: 1237, column: 6, scope: !1430)
!1439 = !DILocalVariable(name: "u32Temp2", scope: !1430, file: !74, line: 1237, type: !433)
!1440 = !DILocation(line: 1237, column: 20, scope: !1430)
!1441 = !DILocalVariable(name: "u32Temp3", scope: !1430, file: !74, line: 1237, type: !433)
!1442 = !DILocation(line: 1237, column: 34, scope: !1430)
!1443 = !DILocalVariable(name: "numerator_old", scope: !1430, file: !74, line: 1237, type: !433)
!1444 = !DILocation(line: 1237, column: 48, scope: !1430)
!1445 = !DILocation(line: 1238, column: 5, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1430, file: !74, line: 1238, column: 5)
!1447 = !DILocation(line: 1238, column: 16, scope: !1446)
!1448 = !DILocation(line: 1238, column: 5, scope: !1430)
!1449 = !DILocation(line: 1240, column: 3, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1446, file: !74, line: 1239, column: 2)
!1451 = !DILocation(line: 1244, column: 14, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1446, file: !74, line: 1243, column: 2)
!1453 = !DILocation(line: 1244, column: 26, scope: !1452)
!1454 = !DILocation(line: 1244, column: 41, scope: !1452)
!1455 = !DILocation(line: 1244, column: 51, scope: !1452)
!1456 = !DILocation(line: 1244, column: 50, scope: !1452)
!1457 = !DILocation(line: 1244, column: 38, scope: !1452)
!1458 = !DILocation(line: 1244, column: 24, scope: !1452)
!1459 = !DILocation(line: 1244, column: 12, scope: !1452)
!1460 = !DILocation(line: 1245, column: 7, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1452, file: !74, line: 1245, column: 6)
!1462 = !DILocation(line: 1245, column: 16, scope: !1461)
!1463 = !DILocation(line: 1245, column: 24, scope: !1461)
!1464 = !DILocation(line: 1245, column: 6, scope: !1452)
!1465 = !DILocation(line: 1247, column: 16, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1461, file: !74, line: 1246, column: 3)
!1467 = !DILocation(line: 1247, column: 27, scope: !1466)
!1468 = !DILocation(line: 1247, column: 13, scope: !1466)
!1469 = !DILocation(line: 1248, column: 3, scope: !1466)
!1470 = !DILocation(line: 1251, column: 16, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1461, file: !74, line: 1250, column: 3)
!1472 = !DILocation(line: 1251, column: 27, scope: !1471)
!1473 = !DILocation(line: 1251, column: 32, scope: !1471)
!1474 = !DILocation(line: 1251, column: 13, scope: !1471)
!1475 = !DILocation(line: 1254, column: 6, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1452, file: !74, line: 1254, column: 6)
!1477 = !DILocation(line: 1254, column: 17, scope: !1476)
!1478 = !DILocation(line: 1254, column: 15, scope: !1476)
!1479 = !DILocation(line: 1254, column: 6, scope: !1452)
!1480 = !DILocation(line: 1256, column: 12, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1476, file: !74, line: 1255, column: 3)
!1482 = !DILocation(line: 1256, column: 22, scope: !1481)
!1483 = !DILocation(line: 1256, column: 21, scope: !1481)
!1484 = !DILocation(line: 1256, column: 4, scope: !1481)
!1485 = !DILocation(line: 1260, column: 13, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1476, file: !74, line: 1259, column: 3)
!1487 = !DILocation(line: 1260, column: 23, scope: !1486)
!1488 = !DILocation(line: 1260, column: 22, scope: !1486)
!1489 = !DILocation(line: 1260, column: 36, scope: !1486)
!1490 = !DILocation(line: 1260, column: 4, scope: !1486)
!1491 = !DILocation(line: 1265, column: 1, scope: !1430)
!1492 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1282, type: !1493, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1493 = !DISubroutineType(types: !1494)
!1494 = !{!25, !433, !25}
!1495 = !DILocalVariable(name: "numerator", arg: 1, scope: !1492, file: !74, line: 1282, type: !433)
!1496 = !DILocation(line: 1282, column: 25, scope: !1492)
!1497 = !DILocalVariable(name: "denominator", arg: 2, scope: !1492, file: !74, line: 1282, type: !25)
!1498 = !DILocation(line: 1282, column: 40, scope: !1492)
!1499 = !DILocalVariable(name: "u32Temp1", scope: !1492, file: !74, line: 1284, type: !433)
!1500 = !DILocation(line: 1284, column: 6, scope: !1492)
!1501 = !DILocalVariable(name: "u32Temp2", scope: !1492, file: !74, line: 1284, type: !433)
!1502 = !DILocation(line: 1284, column: 20, scope: !1492)
!1503 = !DILocation(line: 1285, column: 5, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1492, file: !74, line: 1285, column: 5)
!1505 = !DILocation(line: 1285, column: 17, scope: !1504)
!1506 = !DILocation(line: 1285, column: 5, scope: !1492)
!1507 = !DILocation(line: 1287, column: 6, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1509, file: !74, line: 1287, column: 6)
!1509 = distinct !DILexicalBlock(scope: !1504, file: !74, line: 1286, column: 2)
!1510 = !DILocation(line: 1287, column: 18, scope: !1508)
!1511 = !DILocation(line: 1287, column: 6, scope: !1509)
!1512 = !DILocation(line: 1289, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1508, file: !74, line: 1288, column: 3)
!1514 = !DILocation(line: 1293, column: 19, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1508, file: !74, line: 1292, column: 3)
!1516 = !DILocation(line: 1293, column: 18, scope: !1515)
!1517 = !DILocation(line: 1293, column: 16, scope: !1515)
!1518 = !DILocation(line: 1294, column: 16, scope: !1515)
!1519 = !DILocation(line: 1294, column: 30, scope: !1515)
!1520 = !DILocation(line: 1294, column: 40, scope: !1515)
!1521 = !DILocation(line: 1294, column: 39, scope: !1515)
!1522 = !DILocation(line: 1294, column: 55, scope: !1515)
!1523 = !DILocation(line: 1294, column: 53, scope: !1515)
!1524 = !DILocation(line: 1294, column: 26, scope: !1515)
!1525 = !DILocation(line: 1294, column: 69, scope: !1515)
!1526 = !DILocation(line: 1294, column: 13, scope: !1515)
!1527 = !DILocation(line: 1295, column: 16, scope: !1515)
!1528 = !DILocation(line: 1295, column: 25, scope: !1515)
!1529 = !DILocation(line: 1295, column: 24, scope: !1515)
!1530 = !DILocation(line: 1295, column: 41, scope: !1515)
!1531 = !DILocation(line: 1295, column: 51, scope: !1515)
!1532 = !DILocation(line: 1295, column: 50, scope: !1515)
!1533 = !DILocation(line: 1295, column: 38, scope: !1515)
!1534 = !DILocation(line: 1295, column: 13, scope: !1515)
!1535 = !DILocation(line: 1296, column: 7, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1515, file: !74, line: 1296, column: 7)
!1537 = !DILocation(line: 1296, column: 16, scope: !1536)
!1538 = !DILocation(line: 1296, column: 7, scope: !1515)
!1539 = !DILocation(line: 1298, column: 13, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1536, file: !74, line: 1297, column: 4)
!1541 = !DILocation(line: 1298, column: 12, scope: !1540)
!1542 = !DILocation(line: 1298, column: 5, scope: !1540)
!1543 = !DILocation(line: 1302, column: 5, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1536, file: !74, line: 1301, column: 4)
!1545 = !DILocation(line: 1308, column: 15, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1504, file: !74, line: 1307, column: 2)
!1547 = !DILocation(line: 1308, column: 29, scope: !1546)
!1548 = !DILocation(line: 1308, column: 39, scope: !1546)
!1549 = !DILocation(line: 1308, column: 38, scope: !1546)
!1550 = !DILocation(line: 1308, column: 54, scope: !1546)
!1551 = !DILocation(line: 1308, column: 52, scope: !1546)
!1552 = !DILocation(line: 1308, column: 25, scope: !1546)
!1553 = !DILocation(line: 1308, column: 68, scope: !1546)
!1554 = !DILocation(line: 1308, column: 12, scope: !1546)
!1555 = !DILocation(line: 1309, column: 15, scope: !1546)
!1556 = !DILocation(line: 1309, column: 24, scope: !1546)
!1557 = !DILocation(line: 1309, column: 23, scope: !1546)
!1558 = !DILocation(line: 1309, column: 40, scope: !1546)
!1559 = !DILocation(line: 1309, column: 50, scope: !1546)
!1560 = !DILocation(line: 1309, column: 49, scope: !1546)
!1561 = !DILocation(line: 1309, column: 37, scope: !1546)
!1562 = !DILocation(line: 1309, column: 12, scope: !1546)
!1563 = !DILocation(line: 1310, column: 6, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1546, file: !74, line: 1310, column: 6)
!1565 = !DILocation(line: 1310, column: 15, scope: !1564)
!1566 = !DILocation(line: 1310, column: 6, scope: !1546)
!1567 = !DILocation(line: 1312, column: 11, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1564, file: !74, line: 1311, column: 3)
!1569 = !DILocation(line: 1312, column: 4, scope: !1568)
!1570 = !DILocation(line: 1316, column: 4, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1564, file: !74, line: 1315, column: 3)
!1572 = !DILocation(line: 1319, column: 1, scope: !1492)
!1573 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1337, type: !1574, scopeLine: 1338, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1574 = !DISubroutineType(types: !1575)
!1575 = !{!25, !25, !433}
!1576 = !DILocalVariable(name: "numerator", arg: 1, scope: !1573, file: !74, line: 1337, type: !25)
!1577 = !DILocation(line: 1337, column: 25, scope: !1573)
!1578 = !DILocalVariable(name: "denominator", arg: 2, scope: !1573, file: !74, line: 1337, type: !433)
!1579 = !DILocation(line: 1337, column: 40, scope: !1573)
!1580 = !DILocalVariable(name: "s32Temp1", scope: !1573, file: !74, line: 1339, type: !25)
!1581 = !DILocation(line: 1339, column: 6, scope: !1573)
!1582 = !DILocalVariable(name: "s32Temp2", scope: !1573, file: !74, line: 1339, type: !25)
!1583 = !DILocation(line: 1339, column: 20, scope: !1573)
!1584 = !DILocalVariable(name: "u32Temp0", scope: !1573, file: !74, line: 1340, type: !433)
!1585 = !DILocation(line: 1340, column: 6, scope: !1573)
!1586 = !DILocalVariable(name: "u32Temp1", scope: !1573, file: !74, line: 1340, type: !433)
!1587 = !DILocation(line: 1340, column: 20, scope: !1573)
!1588 = !DILocalVariable(name: "u32Temp2", scope: !1573, file: !74, line: 1340, type: !433)
!1589 = !DILocation(line: 1340, column: 34, scope: !1573)
!1590 = !DILocation(line: 1341, column: 5, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1573, file: !74, line: 1341, column: 5)
!1592 = !DILocation(line: 1341, column: 17, scope: !1591)
!1593 = !DILocation(line: 1341, column: 5, scope: !1573)
!1594 = !DILocation(line: 1343, column: 6, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1596, file: !74, line: 1343, column: 6)
!1596 = distinct !DILexicalBlock(scope: !1591, file: !74, line: 1342, column: 2)
!1597 = !DILocation(line: 1343, column: 16, scope: !1595)
!1598 = !DILocation(line: 1343, column: 6, scope: !1596)
!1599 = !DILocation(line: 1345, column: 4, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1595, file: !74, line: 1344, column: 3)
!1601 = !DILocation(line: 1349, column: 4, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1595, file: !74, line: 1348, column: 3)
!1603 = !DILocation(line: 1354, column: 6, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1605, file: !74, line: 1354, column: 6)
!1605 = distinct !DILexicalBlock(scope: !1591, file: !74, line: 1353, column: 2)
!1606 = !DILocation(line: 1354, column: 16, scope: !1604)
!1607 = !DILocation(line: 1354, column: 6, scope: !1605)
!1608 = !DILocation(line: 1356, column: 16, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1604, file: !74, line: 1355, column: 3)
!1610 = !DILocation(line: 1356, column: 15, scope: !1609)
!1611 = !DILocation(line: 1356, column: 13, scope: !1609)
!1612 = !DILocation(line: 1357, column: 16, scope: !1609)
!1613 = !DILocation(line: 1357, column: 25, scope: !1609)
!1614 = !DILocation(line: 1357, column: 24, scope: !1609)
!1615 = !DILocation(line: 1357, column: 13, scope: !1609)
!1616 = !DILocation(line: 1358, column: 15, scope: !1609)
!1617 = !DILocation(line: 1358, column: 28, scope: !1609)
!1618 = !DILocation(line: 1358, column: 37, scope: !1609)
!1619 = !DILocation(line: 1358, column: 36, scope: !1609)
!1620 = !DILocation(line: 1358, column: 52, scope: !1609)
!1621 = !DILocation(line: 1358, column: 50, scope: !1609)
!1622 = !DILocation(line: 1358, column: 24, scope: !1609)
!1623 = !DILocation(line: 1358, column: 13, scope: !1609)
!1624 = !DILocation(line: 1360, column: 8, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1609, file: !74, line: 1360, column: 7)
!1626 = !DILocation(line: 1360, column: 20, scope: !1625)
!1627 = !DILocation(line: 1360, column: 27, scope: !1625)
!1628 = !DILocation(line: 1360, column: 7, scope: !1609)
!1629 = !DILocation(line: 1362, column: 20, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1625, file: !74, line: 1361, column: 4)
!1631 = !DILocation(line: 1362, column: 32, scope: !1630)
!1632 = !DILocation(line: 1362, column: 17, scope: !1630)
!1633 = !DILocation(line: 1363, column: 4, scope: !1630)
!1634 = !DILocation(line: 1366, column: 20, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1625, file: !74, line: 1365, column: 4)
!1636 = !DILocation(line: 1366, column: 32, scope: !1635)
!1637 = !DILocation(line: 1366, column: 38, scope: !1635)
!1638 = !DILocation(line: 1366, column: 17, scope: !1635)
!1639 = !DILocation(line: 1370, column: 7, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1609, file: !74, line: 1370, column: 7)
!1641 = !DILocation(line: 1370, column: 18, scope: !1640)
!1642 = !DILocation(line: 1370, column: 16, scope: !1640)
!1643 = !DILocation(line: 1370, column: 7, scope: !1609)
!1644 = !DILocation(line: 1372, column: 14, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1640, file: !74, line: 1371, column: 4)
!1646 = !DILocation(line: 1372, column: 13, scope: !1645)
!1647 = !DILocation(line: 1372, column: 23, scope: !1645)
!1648 = !DILocation(line: 1372, column: 5, scope: !1645)
!1649 = !DILocation(line: 1376, column: 14, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1640, file: !74, line: 1375, column: 4)
!1651 = !DILocation(line: 1376, column: 23, scope: !1650)
!1652 = !DILocation(line: 1376, column: 12, scope: !1650)
!1653 = !DILocation(line: 1376, column: 27, scope: !1650)
!1654 = !DILocation(line: 1376, column: 5, scope: !1650)
!1655 = !DILocation(line: 1383, column: 16, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1604, file: !74, line: 1382, column: 3)
!1657 = !DILocation(line: 1383, column: 30, scope: !1656)
!1658 = !DILocation(line: 1383, column: 40, scope: !1656)
!1659 = !DILocation(line: 1383, column: 39, scope: !1656)
!1660 = !DILocation(line: 1383, column: 55, scope: !1656)
!1661 = !DILocation(line: 1383, column: 53, scope: !1656)
!1662 = !DILocation(line: 1383, column: 26, scope: !1656)
!1663 = !DILocation(line: 1383, column: 69, scope: !1656)
!1664 = !DILocation(line: 1383, column: 13, scope: !1656)
!1665 = !DILocation(line: 1384, column: 16, scope: !1656)
!1666 = !DILocation(line: 1384, column: 26, scope: !1656)
!1667 = !DILocation(line: 1384, column: 25, scope: !1656)
!1668 = !DILocation(line: 1384, column: 42, scope: !1656)
!1669 = !DILocation(line: 1384, column: 51, scope: !1656)
!1670 = !DILocation(line: 1384, column: 50, scope: !1656)
!1671 = !DILocation(line: 1384, column: 39, scope: !1656)
!1672 = !DILocation(line: 1384, column: 13, scope: !1656)
!1673 = !DILocation(line: 1385, column: 11, scope: !1656)
!1674 = !DILocation(line: 1385, column: 4, scope: !1656)
!1675 = !DILocation(line: 1388, column: 1, scope: !1573)
!1676 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1405, type: !1677, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!25, !25, !25}
!1679 = !DILocalVariable(name: "numerator", arg: 1, scope: !1676, file: !74, line: 1405, type: !25)
!1680 = !DILocation(line: 1405, column: 25, scope: !1676)
!1681 = !DILocalVariable(name: "denominator", arg: 2, scope: !1676, file: !74, line: 1405, type: !25)
!1682 = !DILocation(line: 1405, column: 40, scope: !1676)
!1683 = !DILocalVariable(name: "s32Temp1", scope: !1676, file: !74, line: 1407, type: !25)
!1684 = !DILocation(line: 1407, column: 6, scope: !1676)
!1685 = !DILocalVariable(name: "s32Temp2", scope: !1676, file: !74, line: 1407, type: !25)
!1686 = !DILocation(line: 1407, column: 20, scope: !1676)
!1687 = !DILocalVariable(name: "denominator_prime", scope: !1676, file: !74, line: 1408, type: !433)
!1688 = !DILocation(line: 1408, column: 6, scope: !1676)
!1689 = !DILocalVariable(name: "u32Temp1", scope: !1676, file: !74, line: 1408, type: !433)
!1690 = !DILocation(line: 1408, column: 29, scope: !1676)
!1691 = !DILocalVariable(name: "u32Temp2", scope: !1676, file: !74, line: 1408, type: !433)
!1692 = !DILocation(line: 1408, column: 43, scope: !1676)
!1693 = !DILocalVariable(name: "u32numerator", scope: !1676, file: !74, line: 1409, type: !433)
!1694 = !DILocation(line: 1409, column: 6, scope: !1676)
!1695 = !DILocalVariable(name: "u32denominator", scope: !1676, file: !74, line: 1409, type: !433)
!1696 = !DILocation(line: 1409, column: 23, scope: !1676)
!1697 = !DILocation(line: 1410, column: 5, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1676, file: !74, line: 1410, column: 5)
!1699 = !DILocation(line: 1410, column: 15, scope: !1698)
!1700 = !DILocation(line: 1410, column: 5, scope: !1676)
!1701 = !DILocation(line: 1412, column: 6, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1703, file: !74, line: 1412, column: 6)
!1703 = distinct !DILexicalBlock(scope: !1698, file: !74, line: 1411, column: 2)
!1704 = !DILocation(line: 1412, column: 18, scope: !1702)
!1705 = !DILocation(line: 1412, column: 6, scope: !1703)
!1706 = !DILocation(line: 1414, column: 7, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1708, file: !74, line: 1414, column: 7)
!1708 = distinct !DILexicalBlock(scope: !1702, file: !74, line: 1413, column: 3)
!1709 = !DILocation(line: 1414, column: 19, scope: !1707)
!1710 = !DILocation(line: 1414, column: 7, scope: !1708)
!1711 = !DILocation(line: 1416, column: 5, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1707, file: !74, line: 1415, column: 4)
!1713 = !DILocation(line: 1420, column: 21, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1707, file: !74, line: 1419, column: 4)
!1715 = !DILocation(line: 1420, column: 20, scope: !1714)
!1716 = !DILocation(line: 1420, column: 18, scope: !1714)
!1717 = !DILocation(line: 1421, column: 23, scope: !1714)
!1718 = !DILocation(line: 1421, column: 22, scope: !1714)
!1719 = !DILocation(line: 1421, column: 20, scope: !1714)
!1720 = !DILocation(line: 1422, column: 16, scope: !1714)
!1721 = !DILocation(line: 1422, column: 33, scope: !1714)
!1722 = !DILocation(line: 1422, column: 46, scope: !1714)
!1723 = !DILocation(line: 1422, column: 45, scope: !1714)
!1724 = !DILocation(line: 1422, column: 64, scope: !1714)
!1725 = !DILocation(line: 1422, column: 62, scope: !1714)
!1726 = !DILocation(line: 1422, column: 29, scope: !1714)
!1727 = !DILocation(line: 1422, column: 81, scope: !1714)
!1728 = !DILocation(line: 1422, column: 14, scope: !1714)
!1729 = !DILocation(line: 1423, column: 17, scope: !1714)
!1730 = !DILocation(line: 1423, column: 30, scope: !1714)
!1731 = !DILocation(line: 1423, column: 29, scope: !1714)
!1732 = !DILocation(line: 1423, column: 49, scope: !1714)
!1733 = !DILocation(line: 1423, column: 58, scope: !1714)
!1734 = !DILocation(line: 1423, column: 57, scope: !1714)
!1735 = !DILocation(line: 1423, column: 46, scope: !1714)
!1736 = !DILocation(line: 1423, column: 14, scope: !1714)
!1737 = !DILocation(line: 1424, column: 8, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1714, file: !74, line: 1424, column: 8)
!1739 = !DILocation(line: 1424, column: 17, scope: !1738)
!1740 = !DILocation(line: 1424, column: 8, scope: !1714)
!1741 = !DILocation(line: 1426, column: 13, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1738, file: !74, line: 1425, column: 5)
!1743 = !DILocation(line: 1426, column: 6, scope: !1742)
!1744 = !DILocation(line: 1430, column: 6, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1738, file: !74, line: 1429, column: 5)
!1746 = !DILocation(line: 1436, column: 20, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1702, file: !74, line: 1435, column: 3)
!1748 = !DILocation(line: 1436, column: 19, scope: !1747)
!1749 = !DILocation(line: 1436, column: 29, scope: !1747)
!1750 = !DILocation(line: 1436, column: 17, scope: !1747)
!1751 = !DILocation(line: 1437, column: 16, scope: !1747)
!1752 = !DILocation(line: 1437, column: 33, scope: !1747)
!1753 = !DILocation(line: 1437, column: 46, scope: !1747)
!1754 = !DILocation(line: 1437, column: 45, scope: !1747)
!1755 = !DILocation(line: 1437, column: 61, scope: !1747)
!1756 = !DILocation(line: 1437, column: 59, scope: !1747)
!1757 = !DILocation(line: 1437, column: 29, scope: !1747)
!1758 = !DILocation(line: 1437, column: 75, scope: !1747)
!1759 = !DILocation(line: 1437, column: 13, scope: !1747)
!1760 = !DILocation(line: 1438, column: 16, scope: !1747)
!1761 = !DILocation(line: 1438, column: 29, scope: !1747)
!1762 = !DILocation(line: 1438, column: 28, scope: !1747)
!1763 = !DILocation(line: 1438, column: 45, scope: !1747)
!1764 = !DILocation(line: 1438, column: 54, scope: !1747)
!1765 = !DILocation(line: 1438, column: 53, scope: !1747)
!1766 = !DILocation(line: 1438, column: 42, scope: !1747)
!1767 = !DILocation(line: 1438, column: 13, scope: !1747)
!1768 = !DILocation(line: 1439, column: 13, scope: !1747)
!1769 = !DILocation(line: 1439, column: 12, scope: !1747)
!1770 = !DILocation(line: 1439, column: 22, scope: !1747)
!1771 = !DILocation(line: 1439, column: 4, scope: !1747)
!1772 = !DILocation(line: 1444, column: 6, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1774, file: !74, line: 1444, column: 6)
!1774 = distinct !DILexicalBlock(scope: !1698, file: !74, line: 1443, column: 2)
!1775 = !DILocation(line: 1444, column: 18, scope: !1773)
!1776 = !DILocation(line: 1444, column: 6, scope: !1774)
!1777 = !DILocation(line: 1446, column: 7, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1779, file: !74, line: 1446, column: 7)
!1779 = distinct !DILexicalBlock(scope: !1773, file: !74, line: 1445, column: 3)
!1780 = !DILocation(line: 1446, column: 19, scope: !1778)
!1781 = !DILocation(line: 1446, column: 7, scope: !1779)
!1782 = !DILocation(line: 1448, column: 5, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1778, file: !74, line: 1447, column: 4)
!1784 = !DILocation(line: 1452, column: 23, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1778, file: !74, line: 1451, column: 4)
!1786 = !DILocation(line: 1452, column: 22, scope: !1785)
!1787 = !DILocation(line: 1452, column: 35, scope: !1785)
!1788 = !DILocation(line: 1452, column: 20, scope: !1785)
!1789 = !DILocation(line: 1453, column: 17, scope: !1785)
!1790 = !DILocation(line: 1453, column: 31, scope: !1785)
!1791 = !DILocation(line: 1453, column: 41, scope: !1785)
!1792 = !DILocation(line: 1453, column: 40, scope: !1785)
!1793 = !DILocation(line: 1453, column: 59, scope: !1785)
!1794 = !DILocation(line: 1453, column: 57, scope: !1785)
!1795 = !DILocation(line: 1453, column: 27, scope: !1785)
!1796 = !DILocation(line: 1453, column: 76, scope: !1785)
!1797 = !DILocation(line: 1453, column: 14, scope: !1785)
!1798 = !DILocation(line: 1454, column: 17, scope: !1785)
!1799 = !DILocation(line: 1454, column: 27, scope: !1785)
!1800 = !DILocation(line: 1454, column: 26, scope: !1785)
!1801 = !DILocation(line: 1454, column: 46, scope: !1785)
!1802 = !DILocation(line: 1454, column: 55, scope: !1785)
!1803 = !DILocation(line: 1454, column: 54, scope: !1785)
!1804 = !DILocation(line: 1454, column: 43, scope: !1785)
!1805 = !DILocation(line: 1454, column: 14, scope: !1785)
!1806 = !DILocation(line: 1455, column: 14, scope: !1785)
!1807 = !DILocation(line: 1455, column: 13, scope: !1785)
!1808 = !DILocation(line: 1455, column: 23, scope: !1785)
!1809 = !DILocation(line: 1455, column: 5, scope: !1785)
!1810 = !DILocation(line: 1460, column: 16, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1773, file: !74, line: 1459, column: 3)
!1812 = !DILocation(line: 1460, column: 30, scope: !1811)
!1813 = !DILocation(line: 1460, column: 40, scope: !1811)
!1814 = !DILocation(line: 1460, column: 39, scope: !1811)
!1815 = !DILocation(line: 1460, column: 55, scope: !1811)
!1816 = !DILocation(line: 1460, column: 53, scope: !1811)
!1817 = !DILocation(line: 1460, column: 26, scope: !1811)
!1818 = !DILocation(line: 1460, column: 69, scope: !1811)
!1819 = !DILocation(line: 1460, column: 13, scope: !1811)
!1820 = !DILocation(line: 1461, column: 16, scope: !1811)
!1821 = !DILocation(line: 1461, column: 26, scope: !1811)
!1822 = !DILocation(line: 1461, column: 25, scope: !1811)
!1823 = !DILocation(line: 1461, column: 42, scope: !1811)
!1824 = !DILocation(line: 1461, column: 51, scope: !1811)
!1825 = !DILocation(line: 1461, column: 50, scope: !1811)
!1826 = !DILocation(line: 1461, column: 39, scope: !1811)
!1827 = !DILocation(line: 1461, column: 13, scope: !1811)
!1828 = !DILocation(line: 1462, column: 11, scope: !1811)
!1829 = !DILocation(line: 1462, column: 4, scope: !1811)
!1830 = !DILocation(line: 1465, column: 1, scope: !1676)
!1831 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1483, type: !1832, scopeLine: 1484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1832 = !DISubroutineType(types: !1833)
!1833 = !{!6, !25, !433}
!1834 = !DILocalVariable(name: "numerator", arg: 1, scope: !1831, file: !74, line: 1483, type: !25)
!1835 = !DILocation(line: 1483, column: 25, scope: !1831)
!1836 = !DILocalVariable(name: "denominator", arg: 2, scope: !1831, file: !74, line: 1483, type: !433)
!1837 = !DILocation(line: 1483, column: 40, scope: !1831)
!1838 = !DILocalVariable(name: "numerator_prime", scope: !1831, file: !74, line: 1486, type: !433)
!1839 = !DILocation(line: 1486, column: 6, scope: !1831)
!1840 = !DILocalVariable(name: "u32Temp1", scope: !1831, file: !74, line: 1486, type: !433)
!1841 = !DILocation(line: 1486, column: 27, scope: !1831)
!1842 = !DILocalVariable(name: "u32Temp2", scope: !1831, file: !74, line: 1486, type: !433)
!1843 = !DILocation(line: 1486, column: 41, scope: !1831)
!1844 = !DILocalVariable(name: "u32Temp3", scope: !1831, file: !74, line: 1486, type: !433)
!1845 = !DILocation(line: 1486, column: 55, scope: !1831)
!1846 = !DILocalVariable(name: "s32Temp1", scope: !1831, file: !74, line: 1487, type: !25)
!1847 = !DILocation(line: 1487, column: 6, scope: !1831)
!1848 = !DILocalVariable(name: "s32Temp2", scope: !1831, file: !74, line: 1487, type: !25)
!1849 = !DILocation(line: 1487, column: 20, scope: !1831)
!1850 = !DILocalVariable(name: "s32Temp3", scope: !1831, file: !74, line: 1487, type: !25)
!1851 = !DILocation(line: 1487, column: 34, scope: !1831)
!1852 = !DILocation(line: 1488, column: 5, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1831, file: !74, line: 1488, column: 5)
!1854 = !DILocation(line: 1488, column: 17, scope: !1853)
!1855 = !DILocation(line: 1488, column: 5, scope: !1831)
!1856 = !DILocation(line: 1490, column: 6, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1858, file: !74, line: 1490, column: 6)
!1858 = distinct !DILexicalBlock(scope: !1853, file: !74, line: 1489, column: 2)
!1859 = !DILocation(line: 1490, column: 15, scope: !1857)
!1860 = !DILocation(line: 1490, column: 6, scope: !1858)
!1861 = !DILocation(line: 1492, column: 4, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !1857, file: !74, line: 1491, column: 3)
!1863 = !DILocation(line: 1496, column: 4, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1857, file: !74, line: 1495, column: 3)
!1865 = !DILocation(line: 1501, column: 6, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1867, file: !74, line: 1501, column: 6)
!1867 = distinct !DILexicalBlock(scope: !1853, file: !74, line: 1500, column: 2)
!1868 = !DILocation(line: 1501, column: 16, scope: !1866)
!1869 = !DILocation(line: 1501, column: 6, scope: !1867)
!1870 = !DILocation(line: 1503, column: 23, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1866, file: !74, line: 1502, column: 3)
!1872 = !DILocation(line: 1503, column: 22, scope: !1871)
!1873 = !DILocation(line: 1503, column: 20, scope: !1871)
!1874 = !DILocation(line: 1504, column: 16, scope: !1871)
!1875 = !DILocation(line: 1504, column: 32, scope: !1871)
!1876 = !DILocation(line: 1504, column: 31, scope: !1871)
!1877 = !DILocation(line: 1504, column: 13, scope: !1871)
!1878 = !DILocation(line: 1505, column: 15, scope: !1871)
!1879 = !DILocation(line: 1505, column: 34, scope: !1871)
!1880 = !DILocation(line: 1505, column: 45, scope: !1871)
!1881 = !DILocation(line: 1505, column: 43, scope: !1871)
!1882 = !DILocation(line: 1505, column: 31, scope: !1871)
!1883 = !DILocation(line: 1505, column: 13, scope: !1871)
!1884 = !DILocation(line: 1507, column: 8, scope: !1885)
!1885 = distinct !DILexicalBlock(scope: !1871, file: !74, line: 1507, column: 7)
!1886 = !DILocation(line: 1507, column: 20, scope: !1885)
!1887 = !DILocation(line: 1507, column: 27, scope: !1885)
!1888 = !DILocation(line: 1507, column: 7, scope: !1871)
!1889 = !DILocation(line: 1509, column: 19, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1885, file: !74, line: 1508, column: 4)
!1891 = !DILocation(line: 1509, column: 31, scope: !1890)
!1892 = !DILocation(line: 1509, column: 17, scope: !1890)
!1893 = !DILocation(line: 1510, column: 4, scope: !1890)
!1894 = !DILocation(line: 1513, column: 20, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1885, file: !74, line: 1512, column: 4)
!1896 = !DILocation(line: 1513, column: 32, scope: !1895)
!1897 = !DILocation(line: 1513, column: 38, scope: !1895)
!1898 = !DILocation(line: 1513, column: 17, scope: !1895)
!1899 = !DILocation(line: 1516, column: 7, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1871, file: !74, line: 1516, column: 7)
!1901 = !DILocation(line: 1516, column: 18, scope: !1900)
!1902 = !DILocation(line: 1516, column: 16, scope: !1900)
!1903 = !DILocation(line: 1516, column: 7, scope: !1871)
!1904 = !DILocation(line: 1518, column: 18, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1900, file: !74, line: 1517, column: 4)
!1906 = !DILocation(line: 1518, column: 16, scope: !1905)
!1907 = !DILocation(line: 1518, column: 28, scope: !1905)
!1908 = !DILocation(line: 1518, column: 14, scope: !1905)
!1909 = !DILocation(line: 1519, column: 4, scope: !1905)
!1910 = !DILocation(line: 1522, column: 18, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1900, file: !74, line: 1521, column: 4)
!1912 = !DILocation(line: 1522, column: 26, scope: !1911)
!1913 = !DILocation(line: 1522, column: 16, scope: !1911)
!1914 = !DILocation(line: 1522, column: 30, scope: !1911)
!1915 = !DILocation(line: 1522, column: 14, scope: !1911)
!1916 = !DILocation(line: 1524, column: 8, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1871, file: !74, line: 1524, column: 7)
!1918 = !DILocation(line: 1524, column: 18, scope: !1917)
!1919 = !DILocation(line: 1524, column: 7, scope: !1871)
!1920 = !DILocation(line: 1526, column: 18, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1917, file: !74, line: 1525, column: 4)
!1922 = !DILocation(line: 1526, column: 12, scope: !1921)
!1923 = !DILocation(line: 1526, column: 5, scope: !1921)
!1924 = !DILocation(line: 1530, column: 5, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1917, file: !74, line: 1529, column: 4)
!1926 = !DILocation(line: 1535, column: 16, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1866, file: !74, line: 1534, column: 3)
!1928 = !DILocation(line: 1535, column: 26, scope: !1927)
!1929 = !DILocation(line: 1535, column: 25, scope: !1927)
!1930 = !DILocation(line: 1535, column: 41, scope: !1927)
!1931 = !DILocation(line: 1535, column: 39, scope: !1927)
!1932 = !DILocation(line: 1535, column: 13, scope: !1927)
!1933 = !DILocation(line: 1536, column: 16, scope: !1927)
!1934 = !DILocation(line: 1536, column: 30, scope: !1927)
!1935 = !DILocation(line: 1536, column: 40, scope: !1927)
!1936 = !DILocation(line: 1536, column: 39, scope: !1927)
!1937 = !DILocation(line: 1536, column: 55, scope: !1927)
!1938 = !DILocation(line: 1536, column: 53, scope: !1927)
!1939 = !DILocation(line: 1536, column: 26, scope: !1927)
!1940 = !DILocation(line: 1536, column: 68, scope: !1927)
!1941 = !DILocation(line: 1536, column: 13, scope: !1927)
!1942 = !DILocation(line: 1537, column: 16, scope: !1927)
!1943 = !DILocation(line: 1537, column: 25, scope: !1927)
!1944 = !DILocation(line: 1537, column: 24, scope: !1927)
!1945 = !DILocation(line: 1537, column: 41, scope: !1927)
!1946 = !DILocation(line: 1537, column: 51, scope: !1927)
!1947 = !DILocation(line: 1537, column: 50, scope: !1927)
!1948 = !DILocation(line: 1537, column: 38, scope: !1927)
!1949 = !DILocation(line: 1537, column: 13, scope: !1927)
!1950 = !DILocation(line: 1538, column: 7, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1927, file: !74, line: 1538, column: 7)
!1952 = !DILocation(line: 1538, column: 16, scope: !1951)
!1953 = !DILocation(line: 1538, column: 7, scope: !1927)
!1954 = !DILocation(line: 1540, column: 17, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1951, file: !74, line: 1539, column: 4)
!1956 = !DILocation(line: 1540, column: 12, scope: !1955)
!1957 = !DILocation(line: 1540, column: 5, scope: !1955)
!1958 = !DILocation(line: 1544, column: 5, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1951, file: !74, line: 1543, column: 4)
!1960 = !DILocation(line: 1548, column: 1, scope: !1831)
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
