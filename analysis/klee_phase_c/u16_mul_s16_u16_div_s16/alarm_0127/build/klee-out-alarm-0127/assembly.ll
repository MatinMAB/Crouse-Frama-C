; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127/build/u16_mul_s16_u16_div_s16_alarm_0127.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [147 x i8] c"KLEE-ALARM-0127: invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0127.err\00", align 1
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
  %call14 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv13, i32 1), !dbg !805
  %tobool15 = icmp ne i32 %call14, 0, !dbg !805
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !806

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !807
  br label %return, !dbg !807

if.end17:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Result, align 4, !dbg !809
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv18 = sext i16 %10 to i32, !dbg !812
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !813
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !813
  %div19 = sdiv i32 %9, %conv18, !dbg !813, !klee.check.div !111
  %conv20 = sext i32 %div19 to i64, !dbg !814
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !815
  %conv21 = sext i16 %11 to i32, !dbg !816
  %conv22 = sext i32 %conv21 to i64, !dbg !817
  %call23 = call i32 @klee_alarm_s32_mul_upper(i64 %conv20, i64 %conv22), !dbg !818
  %tobool24 = icmp ne i32 %call23, 0, !dbg !818
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !819

if.then25:                                        ; preds = %if.end17
  store i16 0, i16* %retval, align 2, !dbg !820
  br label %return, !dbg !820

if.end26:                                         ; preds = %if.end17
  %12 = load i32, i32* %s32Result, align 4, !dbg !822
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !824
  %conv27 = sext i16 %13 to i32, !dbg !825
  %int_cast_to_i642 = zext i32 %conv27 to i64, !dbg !826
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !826
  %div28 = sdiv i32 %12, %conv27, !dbg !826, !klee.check.div !111
  %conv29 = sext i32 %div28 to i64, !dbg !827
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !828
  %conv30 = sext i16 %14 to i32, !dbg !829
  %conv31 = sext i32 %conv30 to i64, !dbg !830
  %call32 = call i32 @klee_alarm_s32_mul_lower(i64 %conv29, i64 %conv31), !dbg !831
  %tobool33 = icmp ne i32 %call32, 0, !dbg !831
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !832

if.then34:                                        ; preds = %if.end26
  store i16 0, i16* %retval, align 2, !dbg !833
  br label %return, !dbg !833

if.end35:                                         ; preds = %if.end26
  %15 = load i32, i32* %s32Result, align 4, !dbg !835
  %conv36 = sext i32 %15 to i64, !dbg !837
  %16 = load i32, i32* %s32Result, align 4, !dbg !838
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !839
  %conv37 = sext i16 %17 to i32, !dbg !840
  %int_cast_to_i643 = zext i32 %conv37 to i64, !dbg !841
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !841
  %div38 = sdiv i32 %16, %conv37, !dbg !841, !klee.check.div !111
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !842
  %conv39 = sext i16 %18 to i32, !dbg !843
  %mul40 = mul nsw i32 %div38, %conv39, !dbg !844
  %conv41 = sext i32 %mul40 to i64, !dbg !845
  %call42 = call i32 @klee_alarm_s32_sub_lower(i64 %conv36, i64 %conv41), !dbg !846
  %tobool43 = icmp ne i32 %call42, 0, !dbg !846
  br i1 %tobool43, label %if.end45, label %if.then44, !dbg !847

if.then44:                                        ; preds = %if.end35
  store i16 0, i16* %retval, align 2, !dbg !848
  br label %return, !dbg !848

if.end45:                                         ; preds = %if.end35
  %19 = load i32, i32* %s32Result, align 4, !dbg !850
  %20 = load i32, i32* %s32Result, align 4, !dbg !852
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !853
  %conv46 = sext i16 %21 to i32, !dbg !854
  %int_cast_to_i644 = zext i32 %conv46 to i64, !dbg !855
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !855
  %div47 = sdiv i32 %20, %conv46, !dbg !855, !klee.check.div !111
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !856
  %conv48 = sext i16 %22 to i32, !dbg !857
  %mul49 = mul nsw i32 %div47, %conv48, !dbg !858
  %sub50 = sub nsw i32 %19, %mul49, !dbg !859
  %conv51 = sext i32 %sub50 to i64, !dbg !860
  %call52 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv51), !dbg !861
  %tobool53 = icmp ne i32 %call52, 0, !dbg !861
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !862

if.then54:                                        ; preds = %if.end45
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 764, i8* getelementptr inbounds ([147 x i8], [147 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !863
  unreachable, !dbg !863

if.end55:                                         ; preds = %if.end45
  %23 = load i32, i32* %s32Result, align 4, !dbg !865
  %24 = load i32, i32* %s32Result, align 4, !dbg !866
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !867
  %conv56 = sext i16 %25 to i32, !dbg !868
  %int_cast_to_i645 = zext i32 %conv56 to i64, !dbg !869
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !869
  %div57 = sdiv i32 %24, %conv56, !dbg !869, !klee.check.div !111
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !870
  %conv58 = sext i16 %26 to i32, !dbg !871
  %mul59 = mul nsw i32 %div57, %conv58, !dbg !872
  %sub60 = sub nsw i32 %23, %mul59, !dbg !873
  %shl = shl i32 %sub60, 1, !dbg !874
  %conv61 = sext i32 %shl to i64, !dbg !875
  store volatile i64 %conv61, i64* @klee_alarm_sink_s64, align 8, !dbg !876
  store i16 0, i16* %retval, align 2, !dbg !877
  br label %return, !dbg !877

return:                                           ; preds = %if.end55, %if.then44, %if.then34, %if.then25, %if.then16, %if.then9, %if.else, %if.then6
  %27 = load i16, i16* %retval, align 2, !dbg !878
  ret i16 %27, !dbg !878
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !879 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !882, metadata !DIExpression()), !dbg !883
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !884
  %cmp = icmp ne i64 %0, 0, !dbg !885
  %conv = zext i1 %cmp to i32, !dbg !885
  ret i32 %conv, !dbg !886
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !887 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !890, metadata !DIExpression()), !dbg !891
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !892, metadata !DIExpression()), !dbg !893
  %0 = load i32, i32* %count.addr, align 4, !dbg !894
  %cmp = icmp uge i32 %0, 63, !dbg !896
  br i1 %cmp, label %if.then, label %if.end, !dbg !897

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !898
  br label %return, !dbg !898

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !900
  %2 = load i32, i32* %count.addr, align 4, !dbg !901
  %sh_prom = zext i32 %2 to i64, !dbg !902
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !902
  %shl = shl i64 1, %sh_prom, !dbg !902, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !903
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !904
  %conv = zext i1 %cmp1 to i32, !dbg !904
  store i32 %conv, i32* %retval, align 4, !dbg !905
  br label %return, !dbg !905

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !906
  ret i32 %3, !dbg !906
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !907 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !910, metadata !DIExpression()), !dbg !911
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !912, metadata !DIExpression()), !dbg !913
  %0 = load i64, i64* %left.addr, align 8, !dbg !914
  %1 = load i64, i64* %right.addr, align 8, !dbg !915
  %mul = mul nsw i64 %0, %1, !dbg !916
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !917
  %conv = zext i1 %cmp to i32, !dbg !917
  ret i32 %conv, !dbg !918
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !919 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !920, metadata !DIExpression()), !dbg !921
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !922, metadata !DIExpression()), !dbg !923
  %0 = load i64, i64* %left.addr, align 8, !dbg !924
  %1 = load i64, i64* %right.addr, align 8, !dbg !925
  %mul = mul nsw i64 %0, %1, !dbg !926
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !927
  %conv = zext i1 %cmp to i32, !dbg !927
  ret i32 %conv, !dbg !928
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !929 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !930, metadata !DIExpression()), !dbg !931
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !932, metadata !DIExpression()), !dbg !933
  %0 = load i64, i64* %left.addr, align 8, !dbg !934
  %1 = load i64, i64* %right.addr, align 8, !dbg !935
  %sub = sub nsw i64 %0, %1, !dbg !936
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !937
  %conv = zext i1 %cmp to i32, !dbg !937
  ret i32 %conv, !dbg !938
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !939 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !940, metadata !DIExpression()), !dbg !941
  %0 = load i64, i64* %left.addr, align 8, !dbg !942
  %cmp = icmp sge i64 %0, 0, !dbg !943
  %conv = zext i1 %cmp to i32, !dbg !943
  ret i32 %conv, !dbg !944
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !945 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !948, metadata !DIExpression()), !dbg !949
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !950, metadata !DIExpression()), !dbg !951
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !952, metadata !DIExpression()), !dbg !953
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !954, metadata !DIExpression()), !dbg !955
  store i32 0, i32* %s32Result, align 4, !dbg !955
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !956, metadata !DIExpression()), !dbg !957
  store i32 0, i32* %s32Temp1, align 4, !dbg !957
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !958
  %conv = sext i16 %0 to i32, !dbg !958
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !959
  %conv1 = zext i16 %1 to i32, !dbg !959
  %mul = mul nsw i32 %conv, %conv1, !dbg !960
  store i32 %mul, i32* %s32Result, align 4, !dbg !961
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !962
  %conv2 = zext i16 %2 to i32, !dbg !962
  %cmp = icmp eq i32 %conv2, 0, !dbg !964
  br i1 %cmp, label %if.then, label %if.else7, !dbg !965

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !966
  %cmp4 = icmp sge i32 %3, 0, !dbg !969
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !970

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !971
  br label %return, !dbg !971

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !973
  br label %return, !dbg !973

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !975
  %5 = load i32, i32* %s32Result, align 4, !dbg !977
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !978
  %conv8 = zext i16 %6 to i32, !dbg !978
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !979
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !979
  %div = sdiv i32 %5, %conv8, !dbg !979, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !980
  %conv9 = zext i16 %7 to i32, !dbg !980
  %mul10 = mul nsw i32 %div, %conv9, !dbg !981
  %sub = sub nsw i32 %4, %mul10, !dbg !982
  %shl = shl i32 %sub, 1, !dbg !983
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !984
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !985
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !986
  %conv11 = zext i16 %9 to i32, !dbg !986
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !987
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !987
  %div12 = sdiv i32 %8, %conv11, !dbg !987, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !988
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !989
  %conv13 = zext i16 %11 to i32, !dbg !989
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !990
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !990
  %div14 = sdiv i32 %10, %conv13, !dbg !990, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !991
  store i32 %add, i32* %s32Result, align 4, !dbg !992
  %12 = load i32, i32* %s32Result, align 4, !dbg !993
  %cmp15 = icmp slt i32 %12, 65535, !dbg !995
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !996

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !997
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1000
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1001

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1002
  %conv21 = trunc i32 %14 to i16, !dbg !1004
  store i16 %conv21, i16* %retval, align 2, !dbg !1005
  br label %return, !dbg !1005

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1006
  br label %return, !dbg !1006

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1008
  br label %return, !dbg !1008

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1010
  ret i16 %15, !dbg !1010
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1011 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1014, metadata !DIExpression()), !dbg !1015
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1016, metadata !DIExpression()), !dbg !1017
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i32 0, i32* %u32Temp1, align 4, !dbg !1021
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1023
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1024
  %conv = zext i16 %0 to i32, !dbg !1024
  %cmp = icmp eq i32 %conv, 0, !dbg !1026
  br i1 %cmp, label %if.then, label %if.else, !dbg !1027

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1028
  br label %return, !dbg !1028

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1030
  %conv2 = zext i16 %1 to i32, !dbg !1030
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1032
  %conv3 = zext i16 %2 to i32, !dbg !1032
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1033
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1034
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1035
  %conv4 = zext i16 %3 to i32, !dbg !1035
  %shr = ashr i32 %conv4, 1, !dbg !1036
  %conv5 = trunc i32 %shr to i16, !dbg !1035
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1037
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1038
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1039
  %conv6 = zext i16 %5 to i32, !dbg !1039
  %add = add i32 %4, %conv6, !dbg !1040
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1041
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1042
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1043
  %conv7 = zext i16 %7 to i32, !dbg !1043
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1044
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1044
  %div = udiv i32 %6, %conv7, !dbg !1044, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1045
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1046
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1048
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1049

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1050
  %and = and i32 %9, 65535, !dbg !1052
  %conv11 = trunc i32 %and to i16, !dbg !1053
  store i16 %conv11, i16* %retval, align 2, !dbg !1054
  br label %return, !dbg !1054

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1055
  br label %return, !dbg !1055

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1057
  ret i16 %10, !dbg !1057
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1058 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1061, metadata !DIExpression()), !dbg !1062
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1063, metadata !DIExpression()), !dbg !1064
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1065, metadata !DIExpression()), !dbg !1066
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1067, metadata !DIExpression()), !dbg !1068
  store i32 0, i32* %u32Temp1, align 4, !dbg !1068
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1069
  %cmp = icmp eq i32 %0, 0, !dbg !1071
  br i1 %cmp, label %if.then, label %if.else, !dbg !1072

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1075
  %conv = zext i16 %1 to i32, !dbg !1075
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1077
  %conv1 = zext i16 %2 to i32, !dbg !1077
  %mul = mul nsw i32 %conv, %conv1, !dbg !1078
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1079
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1080
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1080
  %div = udiv i32 %mul, %3, !dbg !1080, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1081
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1082
  %conv2 = zext i16 %4 to i32, !dbg !1082
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1084
  %conv3 = zext i16 %5 to i32, !dbg !1084
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1085
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1086
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1087
  %mul5 = mul i32 %6, %7, !dbg !1088
  %sub = sub i32 %mul4, %mul5, !dbg !1089
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1090
  %div6 = udiv i32 %8, 2, !dbg !1091
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1092
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1093

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1094
  %inc = add i32 %9, 1, !dbg !1094
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1094
  br label %if.end, !dbg !1096

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1097
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1099
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1100

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1101
  %and = and i32 %11, 65535, !dbg !1103
  %conv13 = trunc i32 %and to i16, !dbg !1104
  store i16 %conv13, i16* %retval, align 2, !dbg !1105
  br label %return, !dbg !1105

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1106
  br label %return, !dbg !1106

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1108
  ret i16 %12, !dbg !1108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1109 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1112, metadata !DIExpression()), !dbg !1113
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1114, metadata !DIExpression()), !dbg !1115
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i32 0, i32* %u32Temp1, align 4, !dbg !1117
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1118
  %conv = zext i16 %0 to i32, !dbg !1118
  %cmp = icmp eq i32 %conv, 0, !dbg !1120
  br i1 %cmp, label %if.then, label %if.else, !dbg !1121

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1122
  br label %return, !dbg !1122

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1124
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1126
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1127
  %conv2 = zext i16 %3 to i32, !dbg !1127
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1128
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1128
  %div = udiv i32 %2, %conv2, !dbg !1128, !klee.check.div !111
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1129
  %conv3 = zext i16 %4 to i32, !dbg !1129
  %mul = mul i32 %div, %conv3, !dbg !1130
  %sub = sub i32 %1, %mul, !dbg !1131
  %shl = shl i32 %sub, 1, !dbg !1132
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1133
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1134
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1135
  %conv4 = zext i16 %6 to i32, !dbg !1135
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1136
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1136
  %div5 = udiv i32 %5, %conv4, !dbg !1136, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1137
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1138
  %conv6 = zext i16 %8 to i32, !dbg !1138
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1139
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1139
  %div7 = udiv i32 %7, %conv6, !dbg !1139, !klee.check.div !111
  %add = add i32 %div5, %div7, !dbg !1140
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1141
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1142
  store i32 %9, i32* %retval, align 4, !dbg !1143
  br label %return, !dbg !1143

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1144
  ret i32 %10, !dbg !1144
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1145 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1148, metadata !DIExpression()), !dbg !1149
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1150, metadata !DIExpression()), !dbg !1151
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1152, metadata !DIExpression()), !dbg !1153
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1154, metadata !DIExpression()), !dbg !1155
  store i32 0, i32* %s32Temp1, align 4, !dbg !1155
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i32 0, i32* %s32Temp2, align 4, !dbg !1157
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1158, metadata !DIExpression()), !dbg !1159
  store i32 0, i32* %s32Temp3, align 4, !dbg !1159
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1160
  %conv = sext i16 %0 to i32, !dbg !1160
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1161
  %conv1 = sext i16 %1 to i32, !dbg !1161
  %mul = mul nsw i32 %conv, %conv1, !dbg !1162
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1163
  %2 = load i16, i16* %div.addr, align 2, !dbg !1164
  %conv2 = sext i16 %2 to i32, !dbg !1164
  %cmp = icmp eq i32 %conv2, 0, !dbg !1166
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1167

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1168
  %cmp4 = icmp slt i32 %3, 0, !dbg !1171
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1172

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1173
  br label %return, !dbg !1173

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1175
  br label %return, !dbg !1175

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1177
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1179
  %6 = load i16, i16* %div.addr, align 2, !dbg !1180
  %conv8 = sext i16 %6 to i32, !dbg !1180
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1181
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1181
  %div9 = sdiv i32 %5, %conv8, !dbg !1181, !klee.check.div !111
  %7 = load i16, i16* %div.addr, align 2, !dbg !1182
  %conv10 = sext i16 %7 to i32, !dbg !1182
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1183
  %sub = sub nsw i32 %4, %mul11, !dbg !1184
  %shl = shl i32 %sub, 1, !dbg !1185
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1186
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1187
  %9 = load i16, i16* %div.addr, align 2, !dbg !1188
  %conv12 = sext i16 %9 to i32, !dbg !1188
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1189
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1189
  %div13 = sdiv i32 %8, %conv12, !dbg !1189, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1190
  %11 = load i16, i16* %div.addr, align 2, !dbg !1191
  %conv14 = sext i16 %11 to i32, !dbg !1191
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1192
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1192
  %div15 = sdiv i32 %10, %conv14, !dbg !1192, !klee.check.div !111
  %add = add nsw i32 %div13, %div15, !dbg !1193
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1194
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1195
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1197
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1198

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1199
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1202
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1203

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1204
  %conv22 = trunc i32 %14 to i16, !dbg !1206
  store i16 %conv22, i16* %retval, align 2, !dbg !1207
  br label %return, !dbg !1207

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1208
  br label %return, !dbg !1208

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1210
  br label %return, !dbg !1210

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1212
  ret i16 %15, !dbg !1212
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1213 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1216, metadata !DIExpression()), !dbg !1217
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1218, metadata !DIExpression()), !dbg !1219
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1220, metadata !DIExpression()), !dbg !1221
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1222, metadata !DIExpression()), !dbg !1223
  store i32 0, i32* %s32Result, align 4, !dbg !1223
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1224, metadata !DIExpression()), !dbg !1225
  store i32 0, i32* %s32Temp1, align 4, !dbg !1225
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1226
  %conv = sext i16 %0 to i32, !dbg !1226
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1227
  %conv1 = sext i16 %1 to i32, !dbg !1227
  %mul = mul nsw i32 %conv, %conv1, !dbg !1228
  store i32 %mul, i32* %s32Result, align 4, !dbg !1229
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1230
  %conv2 = zext i16 %2 to i32, !dbg !1230
  %cmp = icmp eq i32 %conv2, 0, !dbg !1232
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1233

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1234
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1237
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1238

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1239
  br label %return, !dbg !1239

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1241
  %cmp7 = icmp eq i32 %4, 0, !dbg !1243
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1244

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1245
  br label %return, !dbg !1245

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1247
  br label %return, !dbg !1247

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1249
  %6 = load i32, i32* %s32Result, align 4, !dbg !1251
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1252
  %conv12 = zext i16 %7 to i32, !dbg !1252
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1253
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1253
  %div = sdiv i32 %6, %conv12, !dbg !1253, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1254
  %conv13 = zext i16 %8 to i32, !dbg !1254
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1255
  %sub = sub nsw i32 %5, %mul14, !dbg !1256
  %shl = shl i32 %sub, 1, !dbg !1257
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1258
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1259
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1260
  %conv15 = zext i16 %10 to i32, !dbg !1260
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1261
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1261
  %div16 = sdiv i32 %9, %conv15, !dbg !1261, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1262
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1263
  %conv17 = zext i16 %12 to i32, !dbg !1263
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1264
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1264
  %div18 = sdiv i32 %11, %conv17, !dbg !1264, !klee.check.div !111
  %add = add nsw i32 %div16, %div18, !dbg !1265
  store i32 %add, i32* %s32Result, align 4, !dbg !1266
  %13 = load i32, i32* %s32Result, align 4, !dbg !1267
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1269
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1270

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1271
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1274
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1275

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1276
  %conv25 = trunc i32 %15 to i16, !dbg !1278
  store i16 %conv25, i16* %retval, align 2, !dbg !1279
  br label %return, !dbg !1279

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1280
  br label %return, !dbg !1280

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1282
  br label %return, !dbg !1282

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1284
  ret i16 %16, !dbg !1284
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1285 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1288, metadata !DIExpression()), !dbg !1289
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1290, metadata !DIExpression()), !dbg !1291
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1292, metadata !DIExpression()), !dbg !1293
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %cmp = icmp eq i32 %0, 0, !dbg !1296
  br i1 %cmp, label %if.then, label %if.else, !dbg !1297

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1298
  br label %return, !dbg !1298

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1300
  %cmp1 = icmp sle i32 %1, 0, !dbg !1303
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1304

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1305
  br label %return, !dbg !1305

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1307
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1309
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1311
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1311
  %div = udiv i32 %3, %4, !dbg !1311, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1312
  %mul = mul i32 %div, %5, !dbg !1313
  %sub = sub i32 %2, %mul, !dbg !1314
  %shl = shl i32 %sub, 1, !dbg !1315
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1316
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1317
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1319
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1319
  %div4 = udiv i32 %6, %7, !dbg !1319, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1320
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1322
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1322
  %div5 = udiv i32 %8, %9, !dbg !1322, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1323
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1324
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1325
  store i32 %10, i32* %retval, align 4, !dbg !1326
  br label %return, !dbg !1326

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1327
  ret i32 %11, !dbg !1327
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1328 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1331, metadata !DIExpression()), !dbg !1332
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1333, metadata !DIExpression()), !dbg !1334
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1335, metadata !DIExpression()), !dbg !1336
  store i32 0, i32* %s32Temp1, align 4, !dbg !1336
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %cmp = icmp eq i32 %0, 0, !dbg !1339
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1340

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1341
  %cmp1 = icmp sge i32 %1, 0, !dbg !1344
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1345

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1346
  br label %return, !dbg !1346

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1348
  br label %return, !dbg !1348

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1350
  %cmp4 = icmp sge i32 %2, 0, !dbg !1353
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1354

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1355
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1357
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1359
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1359
  %div = udiv i32 %4, %5, !dbg !1359, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1360
  %mul = mul i32 %div, %6, !dbg !1361
  %sub = sub i32 %3, %mul, !dbg !1362
  %shl = shl i32 %sub, 1, !dbg !1363
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1364
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1365
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1366
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1367
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1367
  %div6 = udiv i32 %7, %8, !dbg !1367, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1368
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1369
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1370
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1370
  %div7 = udiv i32 %9, %10, !dbg !1370, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1371
  store i32 %add, i32* %retval, align 4, !dbg !1372
  br label %return, !dbg !1372

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1373
  br label %return, !dbg !1373

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1375
  ret i32 %11, !dbg !1375
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1376 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1379, metadata !DIExpression()), !dbg !1380
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1381, metadata !DIExpression()), !dbg !1382
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1383, metadata !DIExpression()), !dbg !1384
  store i32 0, i32* %u32Temp1, align 4, !dbg !1384
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1385, metadata !DIExpression()), !dbg !1386
  store i32 0, i32* %u32Temp2, align 4, !dbg !1386
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1387
  %cmp = icmp eq i32 %0, 0, !dbg !1389
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1390

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1391
  %cmp1 = icmp slt i32 %1, 0, !dbg !1394
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1395

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1396
  br label %return, !dbg !1396

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1398
  br label %return, !dbg !1398

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %cmp4 = icmp sge i32 %2, 0, !dbg !1403
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1404

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1405
  %cmp6 = icmp eq i32 %3, 0, !dbg !1408
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1409

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1410
  br label %return, !dbg !1410

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %cmp9 = icmp sle i32 %4, 0, !dbg !1415
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1416

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1417
  br label %return, !dbg !1417

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1419
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1421
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1422
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1423
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1423
  %div = sdiv i32 %6, %7, !dbg !1423, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1424
  %mul = mul nsw i32 %div, %8, !dbg !1425
  %sub = sub nsw i32 %5, %mul, !dbg !1426
  %shl = shl i32 %sub, 1, !dbg !1427
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1428
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1429
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1430
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1431
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1431
  %div12 = udiv i32 %9, %10, !dbg !1431, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1432
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1433
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1434
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1434
  %div13 = sdiv i32 %11, %12, !dbg !1434, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1435
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1436
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1437
  store i32 %13, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1442
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1443

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1444
  br label %return, !dbg !1444

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1446
  %sub18 = sub nsw i32 0, %15, !dbg !1448
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1449
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %sub19 = sub nsw i32 0, %16, !dbg !1451
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1452
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1453
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1454
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1455
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1456
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1456
  %div20 = sdiv i32 %18, %19, !dbg !1456, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %mul21 = mul nsw i32 %div20, %20, !dbg !1458
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1459
  %shl23 = shl i32 %sub22, 1, !dbg !1460
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1461
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1462
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1463
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1464
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1464
  %div24 = udiv i32 %21, %22, !dbg !1464, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1465
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1467
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1467
  %div25 = sdiv i32 %23, %24, !dbg !1467, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1468
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1469
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1470
  store i32 %25, i32* %retval, align 4, !dbg !1471
  br label %return, !dbg !1471

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1472
  ret i32 %26, !dbg !1472
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1473 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1476, metadata !DIExpression()), !dbg !1477
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1478, metadata !DIExpression()), !dbg !1479
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1480, metadata !DIExpression()), !dbg !1481
  store i32 0, i32* %u32Temp1, align 4, !dbg !1481
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1482, metadata !DIExpression()), !dbg !1483
  store i32 0, i32* %u32Temp2, align 4, !dbg !1483
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1484, metadata !DIExpression()), !dbg !1485
  store i32 0, i32* %u32Temp3, align 4, !dbg !1485
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1486, metadata !DIExpression()), !dbg !1487
  store i32 0, i32* %numerator_old, align 4, !dbg !1487
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %cmp = icmp eq i32 %0, 0, !dbg !1490
  br i1 %cmp, label %if.then, label %if.else, !dbg !1491

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1492
  br label %return, !dbg !1492

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1494
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1497
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1499
  %div = udiv i32 %3, %4, !dbg !1499, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1500
  %sub = sub i32 %1, %mul, !dbg !1501
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1502
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1503
  %and = and i32 %5, 1, !dbg !1505
  %cmp1 = icmp eq i32 %and, 0, !dbg !1506
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1507

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1508
  %shr = lshr i32 %6, 1, !dbg !1510
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1511
  br label %if.end, !dbg !1512

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1513
  %shr4 = lshr i32 %7, 1, !dbg !1515
  %add = add i32 %shr4, 1, !dbg !1516
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1517
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1518
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1520
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1521
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1522

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1526
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1526
  %div7 = udiv i32 %10, %11, !dbg !1526, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1527
  br label %return, !dbg !1527

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1528
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1530
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1531
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1531
  %div9 = udiv i32 %12, %13, !dbg !1531, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1532
  store i32 %add10, i32* %retval, align 4, !dbg !1533
  br label %return, !dbg !1533

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1534
  ret i32 %14, !dbg !1534
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1535 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1538, metadata !DIExpression()), !dbg !1539
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1540, metadata !DIExpression()), !dbg !1541
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1542, metadata !DIExpression()), !dbg !1543
  store i32 0, i32* %u32Temp1, align 4, !dbg !1543
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1544, metadata !DIExpression()), !dbg !1545
  store i32 0, i32* %u32Temp2, align 4, !dbg !1545
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1546
  %cmp = icmp sle i32 %0, 0, !dbg !1548
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1549

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1550
  %cmp1 = icmp sge i32 %1, 0, !dbg !1553
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1554

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1555
  br label %return, !dbg !1555

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1557
  %sub = sub nsw i32 0, %2, !dbg !1559
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1560
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1561
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1562
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1563
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1564
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1564
  %div = udiv i32 %4, %5, !dbg !1564, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1565
  %mul = mul i32 %div, %6, !dbg !1566
  %sub3 = sub i32 %3, %mul, !dbg !1567
  %shl = shl i32 %sub3, 1, !dbg !1568
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1569
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1570
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1572
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1572
  %div4 = udiv i32 %7, %8, !dbg !1572, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1573
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1575
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1575
  %div5 = udiv i32 %9, %10, !dbg !1575, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1576
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1577
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1578
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1580
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1581

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1582
  %sub8 = sub i32 0, %12, !dbg !1584
  store i32 %sub8, i32* %retval, align 4, !dbg !1585
  br label %return, !dbg !1585

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1586
  br label %return, !dbg !1586

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1588
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1590
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1591
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1592
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1592
  %div11 = udiv i32 %14, %15, !dbg !1592, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1593
  %mul12 = mul i32 %div11, %16, !dbg !1594
  %sub13 = sub i32 %13, %mul12, !dbg !1595
  %shl14 = shl i32 %sub13, 1, !dbg !1596
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1597
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1598
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1599
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1600
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1600
  %div15 = udiv i32 %17, %18, !dbg !1600, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1601
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1602
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1603
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1603
  %div16 = udiv i32 %19, %20, !dbg !1603, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1604
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1605
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1606
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1608
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1609

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1610
  store i32 %22, i32* %retval, align 4, !dbg !1612
  br label %return, !dbg !1612

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1613
  br label %return, !dbg !1613

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1615
  ret i32 %23, !dbg !1615
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1616 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1619, metadata !DIExpression()), !dbg !1620
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1621, metadata !DIExpression()), !dbg !1622
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1623, metadata !DIExpression()), !dbg !1624
  store i32 0, i32* %s32Temp1, align 4, !dbg !1624
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1625, metadata !DIExpression()), !dbg !1626
  store i32 0, i32* %s32Temp2, align 4, !dbg !1626
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1627, metadata !DIExpression()), !dbg !1628
  store i32 0, i32* %u32Temp0, align 4, !dbg !1628
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1629, metadata !DIExpression()), !dbg !1630
  store i32 0, i32* %u32Temp1, align 4, !dbg !1630
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1631, metadata !DIExpression()), !dbg !1632
  store i32 0, i32* %u32Temp2, align 4, !dbg !1632
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %cmp = icmp eq i32 %0, 0, !dbg !1635
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1636

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1637
  %cmp1 = icmp slt i32 %1, 0, !dbg !1640
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1641

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1642
  br label %return, !dbg !1642

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1644
  br label %return, !dbg !1644

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1646
  %cmp4 = icmp sle i32 %2, 0, !dbg !1649
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1650

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1651
  %sub = sub nsw i32 0, %3, !dbg !1653
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1654
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1655
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1656
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1657
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1657
  %div = udiv i32 %4, %5, !dbg !1657, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1658
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1659
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1660
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1661
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1662
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1662
  %div6 = udiv i32 %7, %8, !dbg !1662, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1663
  %mul = mul i32 %div6, %9, !dbg !1664
  %sub7 = sub i32 %6, %mul, !dbg !1665
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1666
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1667
  %and = and i32 %10, 1, !dbg !1669
  %cmp8 = icmp eq i32 %and, 0, !dbg !1670
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1671

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %shr = lshr i32 %11, 1, !dbg !1674
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1675
  br label %if.end, !dbg !1676

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1677
  %shr11 = lshr i32 %12, 1, !dbg !1679
  %add = add i32 %shr11, 1, !dbg !1680
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1681
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1682
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1684
  %cmp12 = icmp ult i32 %13, %14, !dbg !1685
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1686

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1687
  %neg = xor i32 %15, -1, !dbg !1689
  %add14 = add i32 %neg, 1, !dbg !1690
  store i32 %add14, i32* %retval, align 4, !dbg !1691
  br label %return, !dbg !1691

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1692
  %add16 = add i32 %16, 1, !dbg !1694
  %neg17 = xor i32 %add16, -1, !dbg !1695
  %add18 = add i32 %neg17, 1, !dbg !1696
  store i32 %add18, i32* %retval, align 4, !dbg !1697
  br label %return, !dbg !1697

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1698
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1700
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1702
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1702
  %div20 = udiv i32 %18, %19, !dbg !1702, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %mul21 = mul i32 %div20, %20, !dbg !1704
  %sub22 = sub i32 %17, %mul21, !dbg !1705
  %shl = shl i32 %sub22, 1, !dbg !1706
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1707
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1708
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1709
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1710
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1710
  %div23 = udiv i32 %21, %22, !dbg !1710, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1711
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1713
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1713
  %div24 = udiv i32 %23, %24, !dbg !1713, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1714
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1715
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1716
  store i32 %25, i32* %retval, align 4, !dbg !1717
  br label %return, !dbg !1717

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1718
  ret i32 %26, !dbg !1718
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1719 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1722, metadata !DIExpression()), !dbg !1723
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1724, metadata !DIExpression()), !dbg !1725
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1726, metadata !DIExpression()), !dbg !1727
  store i32 0, i32* %s32Temp1, align 4, !dbg !1727
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1728, metadata !DIExpression()), !dbg !1729
  store i32 0, i32* %s32Temp2, align 4, !dbg !1729
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1730, metadata !DIExpression()), !dbg !1731
  store i32 0, i32* %denominator_prime, align 4, !dbg !1731
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1732, metadata !DIExpression()), !dbg !1733
  store i32 0, i32* %u32Temp1, align 4, !dbg !1733
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1734, metadata !DIExpression()), !dbg !1735
  store i32 0, i32* %u32Temp2, align 4, !dbg !1735
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1736, metadata !DIExpression()), !dbg !1737
  store i32 0, i32* %u32numerator, align 4, !dbg !1737
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1738, metadata !DIExpression()), !dbg !1739
  store i32 0, i32* %u32denominator, align 4, !dbg !1739
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1740
  %cmp = icmp slt i32 %0, 0, !dbg !1742
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1743

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1744
  %cmp1 = icmp sle i32 %1, 0, !dbg !1747
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1748

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1749
  %cmp3 = icmp sge i32 %2, 0, !dbg !1752
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1753

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1754
  br label %return, !dbg !1754

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1756
  %sub = sub nsw i32 0, %3, !dbg !1758
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1759
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1760
  %sub5 = sub nsw i32 0, %4, !dbg !1761
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1762
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1763
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1764
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1765
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1766
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1766
  %div = udiv i32 %6, %7, !dbg !1766, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1767
  %mul = mul i32 %div, %8, !dbg !1768
  %sub6 = sub i32 %5, %mul, !dbg !1769
  %shl = shl i32 %sub6, 1, !dbg !1770
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1771
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1772
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1773
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1774
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1774
  %div7 = udiv i32 %9, %10, !dbg !1774, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1775
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1776
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1777
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1777
  %div8 = udiv i32 %11, %12, !dbg !1777, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1778
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1779
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1780
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1782
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1783

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1784
  store i32 %14, i32* %retval, align 4, !dbg !1786
  br label %return, !dbg !1786

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1787
  br label %return, !dbg !1787

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1789
  %neg = xor i32 %15, -1, !dbg !1791
  %add13 = add nsw i32 %neg, 1, !dbg !1792
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1793
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1794
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1795
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1796
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1797
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1797
  %div14 = udiv i32 %17, %18, !dbg !1797, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1798
  %mul15 = mul i32 %div14, %19, !dbg !1799
  %sub16 = sub i32 %16, %mul15, !dbg !1800
  %shl17 = shl i32 %sub16, 1, !dbg !1801
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1802
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1803
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1804
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1805
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1805
  %div18 = udiv i32 %20, %21, !dbg !1805, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1806
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1807
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1808
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1808
  %div19 = sdiv i32 %22, %23, !dbg !1808, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1809
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1810
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1811
  %neg21 = xor i32 %24, -1, !dbg !1812
  %add22 = add nsw i32 %neg21, 1, !dbg !1813
  store i32 %add22, i32* %retval, align 4, !dbg !1814
  br label %return, !dbg !1814

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1815
  %cmp24 = icmp sle i32 %25, 0, !dbg !1818
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1819

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1820
  %cmp26 = icmp sge i32 %26, 0, !dbg !1823
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1824

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1825
  br label %return, !dbg !1825

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1827
  %neg29 = xor i32 %27, -1, !dbg !1829
  %add30 = add nsw i32 %neg29, 1, !dbg !1830
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1831
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1832
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1833
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1834
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1835
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1835
  %div31 = udiv i32 %29, %30, !dbg !1835, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1836
  %mul32 = mul i32 %div31, %31, !dbg !1837
  %sub33 = sub i32 %28, %mul32, !dbg !1838
  %shl34 = shl i32 %sub33, 1, !dbg !1839
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1840
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1841
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1842
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1843
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1843
  %div35 = udiv i32 %32, %33, !dbg !1843, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1844
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1845
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1846
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1846
  %div36 = udiv i32 %34, %35, !dbg !1846, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1847
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1848
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1849
  %neg38 = xor i32 %36, -1, !dbg !1850
  %add39 = add nsw i32 %neg38, 1, !dbg !1851
  store i32 %add39, i32* %retval, align 4, !dbg !1852
  br label %return, !dbg !1852

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1853
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1855
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1856
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1857
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1857
  %div41 = sdiv i32 %38, %39, !dbg !1857, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1858
  %mul42 = mul nsw i32 %div41, %40, !dbg !1859
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1860
  %shl44 = shl i32 %sub43, 1, !dbg !1861
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1862
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1863
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1864
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1865
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1865
  %div45 = sdiv i32 %41, %42, !dbg !1865, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1866
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1868
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1868
  %div46 = udiv i32 %43, %44, !dbg !1868, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1869
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1870
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1871
  store i32 %45, i32* %retval, align 4, !dbg !1872
  br label %return, !dbg !1872

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1873
  ret i32 %46, !dbg !1873
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1874 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1877, metadata !DIExpression()), !dbg !1878
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1879, metadata !DIExpression()), !dbg !1880
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1881, metadata !DIExpression()), !dbg !1882
  store i32 0, i32* %numerator_prime, align 4, !dbg !1882
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1883, metadata !DIExpression()), !dbg !1884
  store i32 0, i32* %u32Temp1, align 4, !dbg !1884
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1885, metadata !DIExpression()), !dbg !1886
  store i32 0, i32* %u32Temp2, align 4, !dbg !1886
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1887, metadata !DIExpression()), !dbg !1888
  store i32 0, i32* %u32Temp3, align 4, !dbg !1888
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1889, metadata !DIExpression()), !dbg !1890
  store i32 0, i32* %s32Temp1, align 4, !dbg !1890
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1891, metadata !DIExpression()), !dbg !1892
  store i32 0, i32* %s32Temp2, align 4, !dbg !1892
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1893, metadata !DIExpression()), !dbg !1894
  store i32 0, i32* %s32Temp3, align 4, !dbg !1894
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1895
  %cmp = icmp eq i32 %0, 0, !dbg !1897
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1898

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1899
  %cmp1 = icmp slt i32 %1, 0, !dbg !1902
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1903

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1904
  br label %return, !dbg !1904

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1906
  br label %return, !dbg !1906

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1908
  %cmp4 = icmp slt i32 %2, 0, !dbg !1911
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1912

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1913
  %sub = sub nsw i32 0, %3, !dbg !1915
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1916
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1917
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1918
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1919
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1919
  %div = udiv i32 %4, %5, !dbg !1919, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1920
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1921
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1922
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1923
  %mul = mul i32 %7, %8, !dbg !1924
  %sub6 = sub i32 %6, %mul, !dbg !1925
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1926
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1927
  %and = and i32 %9, 1, !dbg !1929
  %cmp7 = icmp eq i32 %and, 0, !dbg !1930
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1931

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %shr = lshr i32 %10, 1, !dbg !1934
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1935
  br label %if.end, !dbg !1936

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1937
  %shr10 = lshr i32 %11, 1, !dbg !1939
  %add = add i32 %shr10, 1, !dbg !1940
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1941
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1942
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1944
  %cmp11 = icmp ult i32 %12, %13, !dbg !1945
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1946

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1947
  %neg = xor i32 %14, -1, !dbg !1949
  %add13 = add i32 %neg, 1, !dbg !1950
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1951
  br label %if.end18, !dbg !1952

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1953
  %add15 = add i32 %15, 1, !dbg !1955
  %neg16 = xor i32 %add15, -1, !dbg !1956
  %add17 = add i32 %neg16, 1, !dbg !1957
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1958
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1959
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1961
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1962

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1963
  %conv = trunc i32 %17 to i16, !dbg !1965
  store i16 %conv, i16* %retval, align 2, !dbg !1966
  br label %return, !dbg !1966

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1967
  br label %return, !dbg !1967

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1969
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1971
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1972
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1972
  %div23 = udiv i32 %18, %19, !dbg !1972, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1973
  %mul24 = mul i32 %div23, %20, !dbg !1974
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1975
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1976
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1977
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1978
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1979
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1979
  %div25 = udiv i32 %22, %23, !dbg !1979, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1980
  %mul26 = mul i32 %div25, %24, !dbg !1981
  %sub27 = sub i32 %21, %mul26, !dbg !1982
  %shl = shl i32 %sub27, 1, !dbg !1983
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1984
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1985
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1986
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1987
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1987
  %div28 = udiv i32 %25, %26, !dbg !1987, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1988
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1989
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1990
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1990
  %div29 = udiv i32 %27, %28, !dbg !1990, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !1991
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1992
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1993
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1995
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1996

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1997
  %conv34 = trunc i32 %30 to i16, !dbg !1999
  store i16 %conv34, i16* %retval, align 2, !dbg !2000
  br label %return, !dbg !2000

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2001
  br label %return, !dbg !2001

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2003
  ret i16 %31, !dbg !2003
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2004 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2010, metadata !DIExpression()), !dbg !2011
  %2 = icmp eq i64 %0, 0, !dbg !2012
  br i1 %2, label %3, label %4, !dbg !2014

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2015
  unreachable, !dbg !2015

4:                                                ; preds = %1
  ret void, !dbg !2016
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2017 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2023, metadata !DIExpression()), !dbg !2025
  call void @llvm.dbg.value(metadata i64 %1, metadata !2024, metadata !DIExpression()), !dbg !2025
  %3 = icmp ult i64 %1, %0, !dbg !2026
  br i1 %3, label %5, label %4, !dbg !2028

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2029
  unreachable, !dbg !2029

5:                                                ; preds = %2
  ret void, !dbg !2031
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127/div_Ccode_alarm_0127.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127")
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
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127")
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
!794 = !DILocation(line: 745, column: 53, scope: !795)
!795 = distinct !DILexicalBlock(scope: !788, file: !74, line: 745, column: 7)
!796 = !DILocation(line: 745, column: 77, scope: !795)
!797 = !DILocation(line: 745, column: 94, scope: !795)
!798 = !DILocation(line: 745, column: 89, scope: !795)
!799 = !DILocation(line: 745, column: 87, scope: !795)
!800 = !DILocation(line: 745, column: 114, scope: !795)
!801 = !DILocation(line: 745, column: 109, scope: !795)
!802 = !DILocation(line: 745, column: 107, scope: !795)
!803 = !DILocation(line: 745, column: 63, scope: !795)
!804 = !DILocation(line: 745, column: 37, scope: !795)
!805 = !DILocation(line: 745, column: 9, scope: !795)
!806 = !DILocation(line: 745, column: 7, scope: !788)
!807 = !DILocation(line: 746, column: 7, scope: !808)
!808 = distinct !DILexicalBlock(scope: !795, file: !74, line: 745, column: 147)
!809 = !DILocation(line: 749, column: 50, scope: !810)
!810 = distinct !DILexicalBlock(scope: !788, file: !74, line: 749, column: 7)
!811 = !DILocation(line: 749, column: 67, scope: !810)
!812 = !DILocation(line: 749, column: 62, scope: !810)
!813 = !DILocation(line: 749, column: 60, scope: !810)
!814 = !DILocation(line: 749, column: 34, scope: !810)
!815 = !DILocation(line: 749, column: 97, scope: !810)
!816 = !DILocation(line: 749, column: 92, scope: !810)
!817 = !DILocation(line: 749, column: 82, scope: !810)
!818 = !DILocation(line: 749, column: 9, scope: !810)
!819 = !DILocation(line: 749, column: 7, scope: !788)
!820 = !DILocation(line: 750, column: 7, scope: !821)
!821 = distinct !DILexicalBlock(scope: !810, file: !74, line: 749, column: 113)
!822 = !DILocation(line: 753, column: 50, scope: !823)
!823 = distinct !DILexicalBlock(scope: !788, file: !74, line: 753, column: 7)
!824 = !DILocation(line: 753, column: 67, scope: !823)
!825 = !DILocation(line: 753, column: 62, scope: !823)
!826 = !DILocation(line: 753, column: 60, scope: !823)
!827 = !DILocation(line: 753, column: 34, scope: !823)
!828 = !DILocation(line: 753, column: 97, scope: !823)
!829 = !DILocation(line: 753, column: 92, scope: !823)
!830 = !DILocation(line: 753, column: 82, scope: !823)
!831 = !DILocation(line: 753, column: 9, scope: !823)
!832 = !DILocation(line: 753, column: 7, scope: !788)
!833 = !DILocation(line: 754, column: 7, scope: !834)
!834 = distinct !DILexicalBlock(scope: !823, file: !74, line: 753, column: 113)
!835 = !DILocation(line: 757, column: 44, scope: !836)
!836 = distinct !DILexicalBlock(scope: !788, file: !74, line: 757, column: 7)
!837 = !DILocation(line: 757, column: 34, scope: !836)
!838 = !DILocation(line: 757, column: 78, scope: !836)
!839 = !DILocation(line: 757, column: 95, scope: !836)
!840 = !DILocation(line: 757, column: 90, scope: !836)
!841 = !DILocation(line: 757, column: 88, scope: !836)
!842 = !DILocation(line: 757, column: 115, scope: !836)
!843 = !DILocation(line: 757, column: 110, scope: !836)
!844 = !DILocation(line: 757, column: 108, scope: !836)
!845 = !DILocation(line: 757, column: 56, scope: !836)
!846 = !DILocation(line: 757, column: 9, scope: !836)
!847 = !DILocation(line: 757, column: 7, scope: !788)
!848 = !DILocation(line: 758, column: 7, scope: !849)
!849 = distinct !DILexicalBlock(scope: !836, file: !74, line: 757, column: 132)
!850 = !DILocation(line: 761, column: 63, scope: !851)
!851 = distinct !DILexicalBlock(scope: !788, file: !74, line: 761, column: 7)
!852 = !DILocation(line: 761, column: 87, scope: !851)
!853 = !DILocation(line: 761, column: 104, scope: !851)
!854 = !DILocation(line: 761, column: 99, scope: !851)
!855 = !DILocation(line: 761, column: 97, scope: !851)
!856 = !DILocation(line: 761, column: 124, scope: !851)
!857 = !DILocation(line: 761, column: 119, scope: !851)
!858 = !DILocation(line: 761, column: 117, scope: !851)
!859 = !DILocation(line: 761, column: 73, scope: !851)
!860 = !DILocation(line: 761, column: 47, scope: !851)
!861 = !DILocation(line: 761, column: 9, scope: !851)
!862 = !DILocation(line: 761, column: 7, scope: !788)
!863 = !DILocation(line: 762, column: 7, scope: !864)
!864 = distinct !DILexicalBlock(scope: !851, file: !74, line: 761, column: 142)
!865 = !DILocation(line: 769, column: 41, scope: !788)
!866 = !DILocation(line: 769, column: 65, scope: !788)
!867 = !DILocation(line: 769, column: 82, scope: !788)
!868 = !DILocation(line: 769, column: 77, scope: !788)
!869 = !DILocation(line: 769, column: 75, scope: !788)
!870 = !DILocation(line: 769, column: 102, scope: !788)
!871 = !DILocation(line: 769, column: 97, scope: !788)
!872 = !DILocation(line: 769, column: 95, scope: !788)
!873 = !DILocation(line: 769, column: 51, scope: !788)
!874 = !DILocation(line: 769, column: 116, scope: !788)
!875 = !DILocation(line: 769, column: 25, scope: !788)
!876 = !DILocation(line: 769, column: 23, scope: !788)
!877 = !DILocation(line: 770, column: 3, scope: !788)
!878 = !DILocation(line: 788, column: 1, scope: !752)
!879 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !880, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!880 = !DISubroutineType(types: !881)
!881 = !{!28, !22}
!882 = !DILocalVariable(name: "denominator", arg: 1, scope: !879, file: !33, line: 24, type: !22)
!883 = !DILocation(line: 24, column: 40, scope: !879)
!884 = !DILocation(line: 26, column: 12, scope: !879)
!885 = !DILocation(line: 26, column: 24, scope: !879)
!886 = !DILocation(line: 26, column: 5, scope: !879)
!887 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !888, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!888 = !DISubroutineType(types: !889)
!889 = !{!28, !22, !29}
!890 = !DILocalVariable(name: "left", arg: 1, scope: !887, file: !33, line: 90, type: !22)
!891 = !DILocation(line: 90, column: 41, scope: !887)
!892 = !DILocalVariable(name: "count", arg: 2, scope: !887, file: !33, line: 90, type: !29)
!893 = !DILocation(line: 90, column: 56, scope: !887)
!894 = !DILocation(line: 92, column: 9, scope: !895)
!895 = distinct !DILexicalBlock(scope: !887, file: !33, line: 92, column: 9)
!896 = !DILocation(line: 92, column: 15, scope: !895)
!897 = !DILocation(line: 92, column: 9, scope: !887)
!898 = !DILocation(line: 93, column: 9, scope: !899)
!899 = distinct !DILexicalBlock(scope: !895, file: !33, line: 92, column: 32)
!900 = !DILocation(line: 95, column: 12, scope: !887)
!901 = !DILocation(line: 95, column: 34, scope: !887)
!902 = !DILocation(line: 95, column: 31, scope: !887)
!903 = !DILocation(line: 95, column: 17, scope: !887)
!904 = !DILocation(line: 95, column: 41, scope: !887)
!905 = !DILocation(line: 95, column: 5, scope: !887)
!906 = !DILocation(line: 96, column: 1, scope: !887)
!907 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !908, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!908 = !DISubroutineType(types: !909)
!909 = !{!28, !22, !22}
!910 = !DILocalVariable(name: "left", arg: 1, scope: !907, file: !33, line: 78, type: !22)
!911 = !DILocation(line: 78, column: 38, scope: !907)
!912 = !DILocalVariable(name: "right", arg: 2, scope: !907, file: !33, line: 78, type: !22)
!913 = !DILocation(line: 78, column: 52, scope: !907)
!914 = !DILocation(line: 80, column: 12, scope: !907)
!915 = !DILocation(line: 80, column: 19, scope: !907)
!916 = !DILocation(line: 80, column: 17, scope: !907)
!917 = !DILocation(line: 80, column: 25, scope: !907)
!918 = !DILocation(line: 80, column: 5, scope: !907)
!919 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !908, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!920 = !DILocalVariable(name: "left", arg: 1, scope: !919, file: !33, line: 72, type: !22)
!921 = !DILocation(line: 72, column: 38, scope: !919)
!922 = !DILocalVariable(name: "right", arg: 2, scope: !919, file: !33, line: 72, type: !22)
!923 = !DILocation(line: 72, column: 52, scope: !919)
!924 = !DILocation(line: 74, column: 12, scope: !919)
!925 = !DILocation(line: 74, column: 19, scope: !919)
!926 = !DILocation(line: 74, column: 17, scope: !919)
!927 = !DILocation(line: 74, column: 25, scope: !919)
!928 = !DILocation(line: 74, column: 5, scope: !919)
!929 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !33, file: !33, line: 60, type: !908, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!930 = !DILocalVariable(name: "left", arg: 1, scope: !929, file: !33, line: 60, type: !22)
!931 = !DILocation(line: 60, column: 38, scope: !929)
!932 = !DILocalVariable(name: "right", arg: 2, scope: !929, file: !33, line: 60, type: !22)
!933 = !DILocation(line: 60, column: 52, scope: !929)
!934 = !DILocation(line: 62, column: 12, scope: !929)
!935 = !DILocation(line: 62, column: 19, scope: !929)
!936 = !DILocation(line: 62, column: 17, scope: !929)
!937 = !DILocation(line: 62, column: 25, scope: !929)
!938 = !DILocation(line: 62, column: 5, scope: !929)
!939 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !880, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!940 = !DILocalVariable(name: "left", arg: 1, scope: !939, file: !33, line: 84, type: !22)
!941 = !DILocation(line: 84, column: 51, scope: !939)
!942 = !DILocation(line: 86, column: 12, scope: !939)
!943 = !DILocation(line: 86, column: 17, scope: !939)
!944 = !DILocation(line: 86, column: 5, scope: !939)
!945 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !74, file: !74, line: 807, type: !946, scopeLine: 808, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!946 = !DISubroutineType(types: !947)
!947 = !{!18, !6, !18, !18}
!948 = !DILocalVariable(name: "factor1", arg: 1, scope: !945, file: !74, line: 807, type: !6)
!949 = !DILocation(line: 807, column: 33, scope: !945)
!950 = !DILocalVariable(name: "factor2", arg: 2, scope: !945, file: !74, line: 807, type: !18)
!951 = !DILocation(line: 807, column: 46, scope: !945)
!952 = !DILocalVariable(name: "denominator", arg: 3, scope: !945, file: !74, line: 807, type: !18)
!953 = !DILocation(line: 807, column: 59, scope: !945)
!954 = !DILocalVariable(name: "s32Result", scope: !945, file: !74, line: 809, type: !25)
!955 = !DILocation(line: 809, column: 6, scope: !945)
!956 = !DILocalVariable(name: "s32Temp1", scope: !945, file: !74, line: 809, type: !25)
!957 = !DILocation(line: 809, column: 21, scope: !945)
!958 = !DILocation(line: 810, column: 14, scope: !945)
!959 = !DILocation(line: 810, column: 24, scope: !945)
!960 = !DILocation(line: 810, column: 22, scope: !945)
!961 = !DILocation(line: 810, column: 12, scope: !945)
!962 = !DILocation(line: 812, column: 5, scope: !963)
!963 = distinct !DILexicalBlock(scope: !945, file: !74, line: 812, column: 5)
!964 = !DILocation(line: 812, column: 17, scope: !963)
!965 = !DILocation(line: 812, column: 5, scope: !945)
!966 = !DILocation(line: 814, column: 6, scope: !967)
!967 = distinct !DILexicalBlock(scope: !968, file: !74, line: 814, column: 6)
!968 = distinct !DILexicalBlock(scope: !963, file: !74, line: 813, column: 2)
!969 = !DILocation(line: 814, column: 16, scope: !967)
!970 = !DILocation(line: 814, column: 6, scope: !968)
!971 = !DILocation(line: 816, column: 4, scope: !972)
!972 = distinct !DILexicalBlock(scope: !967, file: !74, line: 815, column: 3)
!973 = !DILocation(line: 820, column: 4, scope: !974)
!974 = distinct !DILexicalBlock(scope: !967, file: !74, line: 819, column: 3)
!975 = !DILocation(line: 825, column: 15, scope: !976)
!976 = distinct !DILexicalBlock(scope: !963, file: !74, line: 824, column: 2)
!977 = !DILocation(line: 825, column: 29, scope: !976)
!978 = !DILocation(line: 825, column: 39, scope: !976)
!979 = !DILocation(line: 825, column: 38, scope: !976)
!980 = !DILocation(line: 825, column: 54, scope: !976)
!981 = !DILocation(line: 825, column: 52, scope: !976)
!982 = !DILocation(line: 825, column: 25, scope: !976)
!983 = !DILocation(line: 825, column: 68, scope: !976)
!984 = !DILocation(line: 825, column: 12, scope: !976)
!985 = !DILocation(line: 826, column: 16, scope: !976)
!986 = !DILocation(line: 826, column: 25, scope: !976)
!987 = !DILocation(line: 826, column: 24, scope: !976)
!988 = !DILocation(line: 826, column: 41, scope: !976)
!989 = !DILocation(line: 826, column: 51, scope: !976)
!990 = !DILocation(line: 826, column: 50, scope: !976)
!991 = !DILocation(line: 826, column: 38, scope: !976)
!992 = !DILocation(line: 826, column: 13, scope: !976)
!993 = !DILocation(line: 827, column: 6, scope: !994)
!994 = distinct !DILexicalBlock(scope: !976, file: !74, line: 827, column: 6)
!995 = !DILocation(line: 827, column: 16, scope: !994)
!996 = !DILocation(line: 827, column: 6, scope: !976)
!997 = !DILocation(line: 829, column: 7, scope: !998)
!998 = distinct !DILexicalBlock(scope: !999, file: !74, line: 829, column: 7)
!999 = distinct !DILexicalBlock(scope: !994, file: !74, line: 828, column: 3)
!1000 = !DILocation(line: 829, column: 17, scope: !998)
!1001 = !DILocation(line: 829, column: 7, scope: !999)
!1002 = !DILocation(line: 831, column: 17, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !998, file: !74, line: 830, column: 4)
!1004 = !DILocation(line: 831, column: 12, scope: !1003)
!1005 = !DILocation(line: 831, column: 5, scope: !1003)
!1006 = !DILocation(line: 835, column: 5, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !998, file: !74, line: 834, column: 4)
!1008 = !DILocation(line: 840, column: 4, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !994, file: !74, line: 839, column: 3)
!1010 = !DILocation(line: 844, column: 1, scope: !945)
!1011 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 862, type: !1012, scopeLine: 863, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!18, !18, !18, !18}
!1014 = !DILocalVariable(name: "factor1", arg: 1, scope: !1011, file: !74, line: 862, type: !18)
!1015 = !DILocation(line: 862, column: 33, scope: !1011)
!1016 = !DILocalVariable(name: "factor2", arg: 2, scope: !1011, file: !74, line: 862, type: !18)
!1017 = !DILocation(line: 862, column: 46, scope: !1011)
!1018 = !DILocalVariable(name: "denominator", arg: 3, scope: !1011, file: !74, line: 862, type: !18)
!1019 = !DILocation(line: 862, column: 59, scope: !1011)
!1020 = !DILocalVariable(name: "u32Temp1", scope: !1011, file: !74, line: 864, type: !433)
!1021 = !DILocation(line: 864, column: 6, scope: !1011)
!1022 = !DILocalVariable(name: "u16TempDenom", scope: !1011, file: !74, line: 865, type: !18)
!1023 = !DILocation(line: 865, column: 6, scope: !1011)
!1024 = !DILocation(line: 867, column: 5, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1011, file: !74, line: 867, column: 5)
!1026 = !DILocation(line: 867, column: 17, scope: !1025)
!1027 = !DILocation(line: 867, column: 5, scope: !1011)
!1028 = !DILocation(line: 869, column: 3, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1025, file: !74, line: 868, column: 2)
!1030 = !DILocation(line: 873, column: 14, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1025, file: !74, line: 872, column: 2)
!1032 = !DILocation(line: 873, column: 24, scope: !1031)
!1033 = !DILocation(line: 873, column: 22, scope: !1031)
!1034 = !DILocation(line: 873, column: 12, scope: !1031)
!1035 = !DILocation(line: 874, column: 18, scope: !1031)
!1036 = !DILocation(line: 874, column: 30, scope: !1031)
!1037 = !DILocation(line: 874, column: 16, scope: !1031)
!1038 = !DILocation(line: 875, column: 14, scope: !1031)
!1039 = !DILocation(line: 875, column: 25, scope: !1031)
!1040 = !DILocation(line: 875, column: 23, scope: !1031)
!1041 = !DILocation(line: 875, column: 12, scope: !1031)
!1042 = !DILocation(line: 876, column: 14, scope: !1031)
!1043 = !DILocation(line: 876, column: 25, scope: !1031)
!1044 = !DILocation(line: 876, column: 23, scope: !1031)
!1045 = !DILocation(line: 876, column: 12, scope: !1031)
!1046 = !DILocation(line: 877, column: 6, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1031, file: !74, line: 877, column: 6)
!1048 = !DILocation(line: 877, column: 15, scope: !1047)
!1049 = !DILocation(line: 877, column: 6, scope: !1031)
!1050 = !DILocation(line: 879, column: 12, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1047, file: !74, line: 878, column: 3)
!1052 = !DILocation(line: 879, column: 21, scope: !1051)
!1053 = !DILocation(line: 879, column: 11, scope: !1051)
!1054 = !DILocation(line: 879, column: 4, scope: !1051)
!1055 = !DILocation(line: 884, column: 4, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1047, file: !74, line: 883, column: 3)
!1057 = !DILocation(line: 889, column: 1, scope: !1011)
!1058 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 906, type: !1059, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1059 = !DISubroutineType(types: !1060)
!1060 = !{!18, !18, !18, !433}
!1061 = !DILocalVariable(name: "factor1", arg: 1, scope: !1058, file: !74, line: 906, type: !18)
!1062 = !DILocation(line: 906, column: 33, scope: !1058)
!1063 = !DILocalVariable(name: "factor2", arg: 2, scope: !1058, file: !74, line: 906, type: !18)
!1064 = !DILocation(line: 906, column: 46, scope: !1058)
!1065 = !DILocalVariable(name: "denominator", arg: 3, scope: !1058, file: !74, line: 906, type: !433)
!1066 = !DILocation(line: 906, column: 59, scope: !1058)
!1067 = !DILocalVariable(name: "u32Temp1", scope: !1058, file: !74, line: 908, type: !433)
!1068 = !DILocation(line: 908, column: 6, scope: !1058)
!1069 = !DILocation(line: 909, column: 5, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1058, file: !74, line: 909, column: 5)
!1071 = !DILocation(line: 909, column: 17, scope: !1070)
!1072 = !DILocation(line: 909, column: 5, scope: !1058)
!1073 = !DILocation(line: 911, column: 3, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1070, file: !74, line: 910, column: 2)
!1075 = !DILocation(line: 915, column: 15, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1070, file: !74, line: 914, column: 2)
!1077 = !DILocation(line: 915, column: 25, scope: !1076)
!1078 = !DILocation(line: 915, column: 23, scope: !1076)
!1079 = !DILocation(line: 915, column: 36, scope: !1076)
!1080 = !DILocation(line: 915, column: 34, scope: !1076)
!1081 = !DILocation(line: 915, column: 12, scope: !1076)
!1082 = !DILocation(line: 916, column: 8, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1076, file: !74, line: 916, column: 6)
!1084 = !DILocation(line: 916, column: 18, scope: !1083)
!1085 = !DILocation(line: 916, column: 16, scope: !1083)
!1086 = !DILocation(line: 916, column: 28, scope: !1083)
!1087 = !DILocation(line: 916, column: 40, scope: !1083)
!1088 = !DILocation(line: 916, column: 39, scope: !1083)
!1089 = !DILocation(line: 916, column: 26, scope: !1083)
!1090 = !DILocation(line: 916, column: 53, scope: !1083)
!1091 = !DILocation(line: 916, column: 64, scope: !1083)
!1092 = !DILocation(line: 916, column: 50, scope: !1083)
!1093 = !DILocation(line: 916, column: 6, scope: !1076)
!1094 = !DILocation(line: 918, column: 12, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1083, file: !74, line: 917, column: 3)
!1096 = !DILocation(line: 919, column: 3, scope: !1095)
!1097 = !DILocation(line: 920, column: 6, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1076, file: !74, line: 920, column: 6)
!1099 = !DILocation(line: 920, column: 15, scope: !1098)
!1100 = !DILocation(line: 920, column: 6, scope: !1076)
!1101 = !DILocation(line: 922, column: 12, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1098, file: !74, line: 921, column: 3)
!1103 = !DILocation(line: 922, column: 21, scope: !1102)
!1104 = !DILocation(line: 922, column: 11, scope: !1102)
!1105 = !DILocation(line: 922, column: 4, scope: !1102)
!1106 = !DILocation(line: 926, column: 4, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1098, file: !74, line: 925, column: 3)
!1108 = !DILocation(line: 929, column: 1, scope: !1058)
!1109 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 946, type: !1110, scopeLine: 947, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{!433, !433, !18}
!1112 = !DILocalVariable(name: "x_value", arg: 1, scope: !1109, file: !74, line: 946, type: !433)
!1113 = !DILocation(line: 946, column: 25, scope: !1109)
!1114 = !DILocalVariable(name: "y_value", arg: 2, scope: !1109, file: !74, line: 946, type: !18)
!1115 = !DILocation(line: 946, column: 38, scope: !1109)
!1116 = !DILocalVariable(name: "u32Temp1", scope: !1109, file: !74, line: 948, type: !433)
!1117 = !DILocation(line: 948, column: 6, scope: !1109)
!1118 = !DILocation(line: 949, column: 5, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1109, file: !74, line: 949, column: 5)
!1120 = !DILocation(line: 949, column: 13, scope: !1119)
!1121 = !DILocation(line: 949, column: 5, scope: !1109)
!1122 = !DILocation(line: 951, column: 3, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1119, file: !74, line: 950, column: 2)
!1124 = !DILocation(line: 955, column: 15, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1119, file: !74, line: 954, column: 2)
!1126 = !DILocation(line: 955, column: 26, scope: !1125)
!1127 = !DILocation(line: 955, column: 34, scope: !1125)
!1128 = !DILocation(line: 955, column: 33, scope: !1125)
!1129 = !DILocation(line: 955, column: 45, scope: !1125)
!1130 = !DILocation(line: 955, column: 43, scope: !1125)
!1131 = !DILocation(line: 955, column: 23, scope: !1125)
!1132 = !DILocation(line: 955, column: 54, scope: !1125)
!1133 = !DILocation(line: 955, column: 12, scope: !1125)
!1134 = !DILocation(line: 956, column: 15, scope: !1125)
!1135 = !DILocation(line: 956, column: 23, scope: !1125)
!1136 = !DILocation(line: 956, column: 22, scope: !1125)
!1137 = !DILocation(line: 956, column: 35, scope: !1125)
!1138 = !DILocation(line: 956, column: 44, scope: !1125)
!1139 = !DILocation(line: 956, column: 43, scope: !1125)
!1140 = !DILocation(line: 956, column: 32, scope: !1125)
!1141 = !DILocation(line: 956, column: 12, scope: !1125)
!1142 = !DILocation(line: 957, column: 10, scope: !1125)
!1143 = !DILocation(line: 957, column: 3, scope: !1125)
!1144 = !DILocation(line: 959, column: 1, scope: !1109)
!1145 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 977, type: !1146, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{!6, !6, !6, !6}
!1148 = !DILocalVariable(name: "fak1", arg: 1, scope: !1145, file: !74, line: 977, type: !6)
!1149 = !DILocation(line: 977, column: 33, scope: !1145)
!1150 = !DILocalVariable(name: "fak2", arg: 2, scope: !1145, file: !74, line: 977, type: !6)
!1151 = !DILocation(line: 977, column: 43, scope: !1145)
!1152 = !DILocalVariable(name: "div", arg: 3, scope: !1145, file: !74, line: 977, type: !6)
!1153 = !DILocation(line: 977, column: 53, scope: !1145)
!1154 = !DILocalVariable(name: "s32Temp1", scope: !1145, file: !74, line: 979, type: !25)
!1155 = !DILocation(line: 979, column: 6, scope: !1145)
!1156 = !DILocalVariable(name: "s32Temp2", scope: !1145, file: !74, line: 979, type: !25)
!1157 = !DILocation(line: 979, column: 20, scope: !1145)
!1158 = !DILocalVariable(name: "s32Temp3", scope: !1145, file: !74, line: 979, type: !25)
!1159 = !DILocation(line: 979, column: 34, scope: !1145)
!1160 = !DILocation(line: 980, column: 13, scope: !1145)
!1161 = !DILocation(line: 980, column: 20, scope: !1145)
!1162 = !DILocation(line: 980, column: 18, scope: !1145)
!1163 = !DILocation(line: 980, column: 11, scope: !1145)
!1164 = !DILocation(line: 981, column: 5, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1145, file: !74, line: 981, column: 5)
!1166 = !DILocation(line: 981, column: 9, scope: !1165)
!1167 = !DILocation(line: 981, column: 5, scope: !1145)
!1168 = !DILocation(line: 983, column: 6, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1170, file: !74, line: 983, column: 6)
!1170 = distinct !DILexicalBlock(scope: !1165, file: !74, line: 982, column: 2)
!1171 = !DILocation(line: 983, column: 15, scope: !1169)
!1172 = !DILocation(line: 983, column: 6, scope: !1170)
!1173 = !DILocation(line: 985, column: 4, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1169, file: !74, line: 984, column: 3)
!1175 = !DILocation(line: 989, column: 4, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1169, file: !74, line: 988, column: 3)
!1177 = !DILocation(line: 994, column: 15, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1165, file: !74, line: 993, column: 2)
!1179 = !DILocation(line: 994, column: 28, scope: !1178)
!1180 = !DILocation(line: 994, column: 39, scope: !1178)
!1181 = !DILocation(line: 994, column: 37, scope: !1178)
!1182 = !DILocation(line: 994, column: 46, scope: !1178)
!1183 = !DILocation(line: 994, column: 44, scope: !1178)
!1184 = !DILocation(line: 994, column: 24, scope: !1178)
!1185 = !DILocation(line: 994, column: 52, scope: !1178)
!1186 = !DILocation(line: 994, column: 12, scope: !1178)
!1187 = !DILocation(line: 995, column: 15, scope: !1178)
!1188 = !DILocation(line: 995, column: 24, scope: !1178)
!1189 = !DILocation(line: 995, column: 23, scope: !1178)
!1190 = !DILocation(line: 995, column: 32, scope: !1178)
!1191 = !DILocation(line: 995, column: 41, scope: !1178)
!1192 = !DILocation(line: 995, column: 40, scope: !1178)
!1193 = !DILocation(line: 995, column: 29, scope: !1178)
!1194 = !DILocation(line: 995, column: 12, scope: !1178)
!1195 = !DILocation(line: 996, column: 6, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1178, file: !74, line: 996, column: 6)
!1197 = !DILocation(line: 996, column: 15, scope: !1196)
!1198 = !DILocation(line: 996, column: 6, scope: !1178)
!1199 = !DILocation(line: 998, column: 7, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1201, file: !74, line: 998, column: 7)
!1201 = distinct !DILexicalBlock(scope: !1196, file: !74, line: 997, column: 3)
!1202 = !DILocation(line: 998, column: 16, scope: !1200)
!1203 = !DILocation(line: 998, column: 7, scope: !1201)
!1204 = !DILocation(line: 1000, column: 17, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1200, file: !74, line: 999, column: 4)
!1206 = !DILocation(line: 1000, column: 12, scope: !1205)
!1207 = !DILocation(line: 1000, column: 5, scope: !1205)
!1208 = !DILocation(line: 1004, column: 5, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1200, file: !74, line: 1003, column: 4)
!1210 = !DILocation(line: 1009, column: 4, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1196, file: !74, line: 1008, column: 3)
!1212 = !DILocation(line: 1012, column: 1, scope: !1145)
!1213 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1030, type: !1214, scopeLine: 1031, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!6, !6, !6, !18}
!1216 = !DILocalVariable(name: "data1", arg: 1, scope: !1213, file: !74, line: 1030, type: !6)
!1217 = !DILocation(line: 1030, column: 33, scope: !1213)
!1218 = !DILocalVariable(name: "data2", arg: 2, scope: !1213, file: !74, line: 1030, type: !6)
!1219 = !DILocation(line: 1030, column: 43, scope: !1213)
!1220 = !DILocalVariable(name: "denominator", arg: 3, scope: !1213, file: !74, line: 1030, type: !18)
!1221 = !DILocation(line: 1030, column: 53, scope: !1213)
!1222 = !DILocalVariable(name: "s32Result", scope: !1213, file: !74, line: 1032, type: !25)
!1223 = !DILocation(line: 1032, column: 6, scope: !1213)
!1224 = !DILocalVariable(name: "s32Temp1", scope: !1213, file: !74, line: 1032, type: !25)
!1225 = !DILocation(line: 1032, column: 21, scope: !1213)
!1226 = !DILocation(line: 1033, column: 14, scope: !1213)
!1227 = !DILocation(line: 1033, column: 22, scope: !1213)
!1228 = !DILocation(line: 1033, column: 20, scope: !1213)
!1229 = !DILocation(line: 1033, column: 12, scope: !1213)
!1230 = !DILocation(line: 1035, column: 5, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1213, file: !74, line: 1035, column: 5)
!1232 = !DILocation(line: 1035, column: 17, scope: !1231)
!1233 = !DILocation(line: 1035, column: 5, scope: !1213)
!1234 = !DILocation(line: 1037, column: 6, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1236, file: !74, line: 1037, column: 6)
!1236 = distinct !DILexicalBlock(scope: !1231, file: !74, line: 1036, column: 2)
!1237 = !DILocation(line: 1037, column: 16, scope: !1235)
!1238 = !DILocation(line: 1037, column: 6, scope: !1236)
!1239 = !DILocation(line: 1039, column: 4, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1235, file: !74, line: 1038, column: 3)
!1241 = !DILocation(line: 1041, column: 11, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1235, file: !74, line: 1041, column: 11)
!1243 = !DILocation(line: 1041, column: 21, scope: !1242)
!1244 = !DILocation(line: 1041, column: 11, scope: !1235)
!1245 = !DILocation(line: 1043, column: 4, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1242, file: !74, line: 1042, column: 3)
!1247 = !DILocation(line: 1047, column: 4, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1242, file: !74, line: 1046, column: 3)
!1249 = !DILocation(line: 1052, column: 15, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1231, file: !74, line: 1051, column: 2)
!1251 = !DILocation(line: 1052, column: 28, scope: !1250)
!1252 = !DILocation(line: 1052, column: 38, scope: !1250)
!1253 = !DILocation(line: 1052, column: 37, scope: !1250)
!1254 = !DILocation(line: 1052, column: 51, scope: !1250)
!1255 = !DILocation(line: 1052, column: 50, scope: !1250)
!1256 = !DILocation(line: 1052, column: 25, scope: !1250)
!1257 = !DILocation(line: 1052, column: 64, scope: !1250)
!1258 = !DILocation(line: 1052, column: 12, scope: !1250)
!1259 = !DILocation(line: 1053, column: 16, scope: !1250)
!1260 = !DILocation(line: 1053, column: 25, scope: !1250)
!1261 = !DILocation(line: 1053, column: 24, scope: !1250)
!1262 = !DILocation(line: 1053, column: 41, scope: !1250)
!1263 = !DILocation(line: 1053, column: 51, scope: !1250)
!1264 = !DILocation(line: 1053, column: 50, scope: !1250)
!1265 = !DILocation(line: 1053, column: 38, scope: !1250)
!1266 = !DILocation(line: 1053, column: 13, scope: !1250)
!1267 = !DILocation(line: 1054, column: 6, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1250, file: !74, line: 1054, column: 6)
!1269 = !DILocation(line: 1054, column: 16, scope: !1268)
!1270 = !DILocation(line: 1054, column: 6, scope: !1250)
!1271 = !DILocation(line: 1056, column: 7, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1273, file: !74, line: 1056, column: 7)
!1273 = distinct !DILexicalBlock(scope: !1268, file: !74, line: 1055, column: 3)
!1274 = !DILocation(line: 1056, column: 17, scope: !1272)
!1275 = !DILocation(line: 1056, column: 7, scope: !1273)
!1276 = !DILocation(line: 1058, column: 17, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1272, file: !74, line: 1057, column: 4)
!1278 = !DILocation(line: 1058, column: 12, scope: !1277)
!1279 = !DILocation(line: 1058, column: 5, scope: !1277)
!1280 = !DILocation(line: 1062, column: 5, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1272, file: !74, line: 1061, column: 4)
!1282 = !DILocation(line: 1067, column: 4, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1268, file: !74, line: 1066, column: 3)
!1284 = !DILocation(line: 1071, column: 1, scope: !1213)
!1285 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1088, type: !1286, scopeLine: 1089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!433, !433, !25}
!1288 = !DILocalVariable(name: "numerator", arg: 1, scope: !1285, file: !74, line: 1088, type: !433)
!1289 = !DILocation(line: 1088, column: 25, scope: !1285)
!1290 = !DILocalVariable(name: "denominator", arg: 2, scope: !1285, file: !74, line: 1088, type: !25)
!1291 = !DILocation(line: 1088, column: 40, scope: !1285)
!1292 = !DILocalVariable(name: "u32Temp1", scope: !1285, file: !74, line: 1090, type: !433)
!1293 = !DILocation(line: 1090, column: 6, scope: !1285)
!1294 = !DILocation(line: 1091, column: 5, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1285, file: !74, line: 1091, column: 5)
!1296 = !DILocation(line: 1091, column: 17, scope: !1295)
!1297 = !DILocation(line: 1091, column: 5, scope: !1285)
!1298 = !DILocation(line: 1093, column: 3, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1295, file: !74, line: 1092, column: 2)
!1300 = !DILocation(line: 1097, column: 6, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1302, file: !74, line: 1097, column: 6)
!1302 = distinct !DILexicalBlock(scope: !1295, file: !74, line: 1096, column: 2)
!1303 = !DILocation(line: 1097, column: 18, scope: !1301)
!1304 = !DILocation(line: 1097, column: 6, scope: !1302)
!1305 = !DILocation(line: 1099, column: 4, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1301, file: !74, line: 1098, column: 3)
!1307 = !DILocation(line: 1103, column: 16, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1301, file: !74, line: 1102, column: 3)
!1309 = !DILocation(line: 1103, column: 30, scope: !1308)
!1310 = !DILocation(line: 1103, column: 40, scope: !1308)
!1311 = !DILocation(line: 1103, column: 39, scope: !1308)
!1312 = !DILocation(line: 1103, column: 55, scope: !1308)
!1313 = !DILocation(line: 1103, column: 53, scope: !1308)
!1314 = !DILocation(line: 1103, column: 26, scope: !1308)
!1315 = !DILocation(line: 1103, column: 68, scope: !1308)
!1316 = !DILocation(line: 1103, column: 13, scope: !1308)
!1317 = !DILocation(line: 1104, column: 16, scope: !1308)
!1318 = !DILocation(line: 1104, column: 25, scope: !1308)
!1319 = !DILocation(line: 1104, column: 24, scope: !1308)
!1320 = !DILocation(line: 1104, column: 41, scope: !1308)
!1321 = !DILocation(line: 1104, column: 51, scope: !1308)
!1322 = !DILocation(line: 1104, column: 50, scope: !1308)
!1323 = !DILocation(line: 1104, column: 38, scope: !1308)
!1324 = !DILocation(line: 1104, column: 13, scope: !1308)
!1325 = !DILocation(line: 1105, column: 11, scope: !1308)
!1326 = !DILocation(line: 1105, column: 4, scope: !1308)
!1327 = !DILocation(line: 1108, column: 1, scope: !1285)
!1328 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1125, type: !1329, scopeLine: 1126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!433, !25, !433}
!1331 = !DILocalVariable(name: "numerator", arg: 1, scope: !1328, file: !74, line: 1125, type: !25)
!1332 = !DILocation(line: 1125, column: 25, scope: !1328)
!1333 = !DILocalVariable(name: "denominator", arg: 2, scope: !1328, file: !74, line: 1125, type: !433)
!1334 = !DILocation(line: 1125, column: 40, scope: !1328)
!1335 = !DILocalVariable(name: "s32Temp1", scope: !1328, file: !74, line: 1127, type: !25)
!1336 = !DILocation(line: 1127, column: 6, scope: !1328)
!1337 = !DILocation(line: 1128, column: 5, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1328, file: !74, line: 1128, column: 5)
!1339 = !DILocation(line: 1128, column: 17, scope: !1338)
!1340 = !DILocation(line: 1128, column: 5, scope: !1328)
!1341 = !DILocation(line: 1130, column: 6, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1343, file: !74, line: 1130, column: 6)
!1343 = distinct !DILexicalBlock(scope: !1338, file: !74, line: 1129, column: 2)
!1344 = !DILocation(line: 1130, column: 16, scope: !1342)
!1345 = !DILocation(line: 1130, column: 6, scope: !1343)
!1346 = !DILocation(line: 1132, column: 4, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1342, file: !74, line: 1131, column: 3)
!1348 = !DILocation(line: 1136, column: 4, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1342, file: !74, line: 1135, column: 3)
!1350 = !DILocation(line: 1141, column: 6, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1352, file: !74, line: 1141, column: 6)
!1352 = distinct !DILexicalBlock(scope: !1338, file: !74, line: 1140, column: 2)
!1353 = !DILocation(line: 1141, column: 16, scope: !1351)
!1354 = !DILocation(line: 1141, column: 6, scope: !1352)
!1355 = !DILocation(line: 1143, column: 17, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1351, file: !74, line: 1142, column: 3)
!1357 = !DILocation(line: 1143, column: 31, scope: !1356)
!1358 = !DILocation(line: 1143, column: 41, scope: !1356)
!1359 = !DILocation(line: 1143, column: 40, scope: !1356)
!1360 = !DILocation(line: 1143, column: 56, scope: !1356)
!1361 = !DILocation(line: 1143, column: 54, scope: !1356)
!1362 = !DILocation(line: 1143, column: 27, scope: !1356)
!1363 = !DILocation(line: 1143, column: 69, scope: !1356)
!1364 = !DILocation(line: 1143, column: 13, scope: !1356)
!1365 = !DILocation(line: 1144, column: 13, scope: !1356)
!1366 = !DILocation(line: 1144, column: 23, scope: !1356)
!1367 = !DILocation(line: 1144, column: 22, scope: !1356)
!1368 = !DILocation(line: 1144, column: 39, scope: !1356)
!1369 = !DILocation(line: 1144, column: 48, scope: !1356)
!1370 = !DILocation(line: 1144, column: 47, scope: !1356)
!1371 = !DILocation(line: 1144, column: 36, scope: !1356)
!1372 = !DILocation(line: 1144, column: 4, scope: !1356)
!1373 = !DILocation(line: 1148, column: 4, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1351, file: !74, line: 1147, column: 3)
!1375 = !DILocation(line: 1151, column: 1, scope: !1328)
!1376 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1168, type: !1377, scopeLine: 1169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1377 = !DISubroutineType(types: !1378)
!1378 = !{!433, !25, !25}
!1379 = !DILocalVariable(name: "numerator", arg: 1, scope: !1376, file: !74, line: 1168, type: !25)
!1380 = !DILocation(line: 1168, column: 25, scope: !1376)
!1381 = !DILocalVariable(name: "denominator", arg: 2, scope: !1376, file: !74, line: 1168, type: !25)
!1382 = !DILocation(line: 1168, column: 40, scope: !1376)
!1383 = !DILocalVariable(name: "u32Temp1", scope: !1376, file: !74, line: 1170, type: !433)
!1384 = !DILocation(line: 1170, column: 6, scope: !1376)
!1385 = !DILocalVariable(name: "u32Temp2", scope: !1376, file: !74, line: 1170, type: !433)
!1386 = !DILocation(line: 1170, column: 20, scope: !1376)
!1387 = !DILocation(line: 1171, column: 5, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1376, file: !74, line: 1171, column: 5)
!1389 = !DILocation(line: 1171, column: 17, scope: !1388)
!1390 = !DILocation(line: 1171, column: 5, scope: !1376)
!1391 = !DILocation(line: 1173, column: 6, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1393, file: !74, line: 1173, column: 6)
!1393 = distinct !DILexicalBlock(scope: !1388, file: !74, line: 1172, column: 2)
!1394 = !DILocation(line: 1173, column: 16, scope: !1392)
!1395 = !DILocation(line: 1173, column: 6, scope: !1393)
!1396 = !DILocation(line: 1175, column: 4, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1392, file: !74, line: 1174, column: 3)
!1398 = !DILocation(line: 1179, column: 4, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1392, file: !74, line: 1178, column: 3)
!1400 = !DILocation(line: 1184, column: 6, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !74, line: 1184, column: 6)
!1402 = distinct !DILexicalBlock(scope: !1388, file: !74, line: 1183, column: 2)
!1403 = !DILocation(line: 1184, column: 16, scope: !1401)
!1404 = !DILocation(line: 1184, column: 6, scope: !1402)
!1405 = !DILocation(line: 1186, column: 7, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1407, file: !74, line: 1186, column: 7)
!1407 = distinct !DILexicalBlock(scope: !1401, file: !74, line: 1185, column: 3)
!1408 = !DILocation(line: 1186, column: 17, scope: !1406)
!1409 = !DILocation(line: 1186, column: 7, scope: !1407)
!1410 = !DILocation(line: 1188, column: 5, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1406, file: !74, line: 1187, column: 4)
!1412 = !DILocation(line: 1192, column: 8, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1414, file: !74, line: 1192, column: 8)
!1414 = distinct !DILexicalBlock(scope: !1406, file: !74, line: 1191, column: 4)
!1415 = !DILocation(line: 1192, column: 20, scope: !1413)
!1416 = !DILocation(line: 1192, column: 8, scope: !1414)
!1417 = !DILocation(line: 1194, column: 6, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1413, file: !74, line: 1193, column: 5)
!1419 = !DILocation(line: 1198, column: 18, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1413, file: !74, line: 1197, column: 5)
!1421 = !DILocation(line: 1198, column: 32, scope: !1420)
!1422 = !DILocation(line: 1198, column: 42, scope: !1420)
!1423 = !DILocation(line: 1198, column: 41, scope: !1420)
!1424 = !DILocation(line: 1198, column: 57, scope: !1420)
!1425 = !DILocation(line: 1198, column: 55, scope: !1420)
!1426 = !DILocation(line: 1198, column: 28, scope: !1420)
!1427 = !DILocation(line: 1198, column: 71, scope: !1420)
!1428 = !DILocation(line: 1198, column: 15, scope: !1420)
!1429 = !DILocation(line: 1199, column: 18, scope: !1420)
!1430 = !DILocation(line: 1199, column: 29, scope: !1420)
!1431 = !DILocation(line: 1199, column: 27, scope: !1420)
!1432 = !DILocation(line: 1199, column: 45, scope: !1420)
!1433 = !DILocation(line: 1199, column: 57, scope: !1420)
!1434 = !DILocation(line: 1199, column: 55, scope: !1420)
!1435 = !DILocation(line: 1199, column: 42, scope: !1420)
!1436 = !DILocation(line: 1199, column: 15, scope: !1420)
!1437 = !DILocation(line: 1200, column: 13, scope: !1420)
!1438 = !DILocation(line: 1200, column: 6, scope: !1420)
!1439 = !DILocation(line: 1206, column: 7, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1441, file: !74, line: 1206, column: 7)
!1441 = distinct !DILexicalBlock(scope: !1401, file: !74, line: 1205, column: 3)
!1442 = !DILocation(line: 1206, column: 19, scope: !1440)
!1443 = !DILocation(line: 1206, column: 7, scope: !1441)
!1444 = !DILocation(line: 1208, column: 5, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1440, file: !74, line: 1207, column: 4)
!1446 = !DILocation(line: 1212, column: 18, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1440, file: !74, line: 1211, column: 4)
!1448 = !DILocation(line: 1212, column: 17, scope: !1447)
!1449 = !DILocation(line: 1212, column: 15, scope: !1447)
!1450 = !DILocation(line: 1213, column: 20, scope: !1447)
!1451 = !DILocation(line: 1213, column: 19, scope: !1447)
!1452 = !DILocation(line: 1213, column: 17, scope: !1447)
!1453 = !DILocation(line: 1214, column: 17, scope: !1447)
!1454 = !DILocation(line: 1214, column: 31, scope: !1447)
!1455 = !DILocation(line: 1214, column: 41, scope: !1447)
!1456 = !DILocation(line: 1214, column: 40, scope: !1447)
!1457 = !DILocation(line: 1214, column: 56, scope: !1447)
!1458 = !DILocation(line: 1214, column: 54, scope: !1447)
!1459 = !DILocation(line: 1214, column: 27, scope: !1447)
!1460 = !DILocation(line: 1214, column: 70, scope: !1447)
!1461 = !DILocation(line: 1214, column: 14, scope: !1447)
!1462 = !DILocation(line: 1215, column: 17, scope: !1447)
!1463 = !DILocation(line: 1215, column: 28, scope: !1447)
!1464 = !DILocation(line: 1215, column: 26, scope: !1447)
!1465 = !DILocation(line: 1215, column: 44, scope: !1447)
!1466 = !DILocation(line: 1215, column: 56, scope: !1447)
!1467 = !DILocation(line: 1215, column: 54, scope: !1447)
!1468 = !DILocation(line: 1215, column: 41, scope: !1447)
!1469 = !DILocation(line: 1215, column: 14, scope: !1447)
!1470 = !DILocation(line: 1216, column: 12, scope: !1447)
!1471 = !DILocation(line: 1216, column: 5, scope: !1447)
!1472 = !DILocation(line: 1221, column: 1, scope: !1376)
!1473 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1238, type: !1474, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1474 = !DISubroutineType(types: !1475)
!1475 = !{!433, !433, !433}
!1476 = !DILocalVariable(name: "numerator", arg: 1, scope: !1473, file: !74, line: 1238, type: !433)
!1477 = !DILocation(line: 1238, column: 25, scope: !1473)
!1478 = !DILocalVariable(name: "denominator", arg: 2, scope: !1473, file: !74, line: 1238, type: !433)
!1479 = !DILocation(line: 1238, column: 40, scope: !1473)
!1480 = !DILocalVariable(name: "u32Temp1", scope: !1473, file: !74, line: 1241, type: !433)
!1481 = !DILocation(line: 1241, column: 6, scope: !1473)
!1482 = !DILocalVariable(name: "u32Temp2", scope: !1473, file: !74, line: 1241, type: !433)
!1483 = !DILocation(line: 1241, column: 20, scope: !1473)
!1484 = !DILocalVariable(name: "u32Temp3", scope: !1473, file: !74, line: 1241, type: !433)
!1485 = !DILocation(line: 1241, column: 34, scope: !1473)
!1486 = !DILocalVariable(name: "numerator_old", scope: !1473, file: !74, line: 1241, type: !433)
!1487 = !DILocation(line: 1241, column: 48, scope: !1473)
!1488 = !DILocation(line: 1242, column: 5, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1473, file: !74, line: 1242, column: 5)
!1490 = !DILocation(line: 1242, column: 16, scope: !1489)
!1491 = !DILocation(line: 1242, column: 5, scope: !1473)
!1492 = !DILocation(line: 1244, column: 3, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1489, file: !74, line: 1243, column: 2)
!1494 = !DILocation(line: 1248, column: 14, scope: !1495)
!1495 = distinct !DILexicalBlock(scope: !1489, file: !74, line: 1247, column: 2)
!1496 = !DILocation(line: 1248, column: 26, scope: !1495)
!1497 = !DILocation(line: 1248, column: 41, scope: !1495)
!1498 = !DILocation(line: 1248, column: 51, scope: !1495)
!1499 = !DILocation(line: 1248, column: 50, scope: !1495)
!1500 = !DILocation(line: 1248, column: 38, scope: !1495)
!1501 = !DILocation(line: 1248, column: 24, scope: !1495)
!1502 = !DILocation(line: 1248, column: 12, scope: !1495)
!1503 = !DILocation(line: 1249, column: 7, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1495, file: !74, line: 1249, column: 6)
!1505 = !DILocation(line: 1249, column: 16, scope: !1504)
!1506 = !DILocation(line: 1249, column: 24, scope: !1504)
!1507 = !DILocation(line: 1249, column: 6, scope: !1495)
!1508 = !DILocation(line: 1251, column: 16, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1504, file: !74, line: 1250, column: 3)
!1510 = !DILocation(line: 1251, column: 27, scope: !1509)
!1511 = !DILocation(line: 1251, column: 13, scope: !1509)
!1512 = !DILocation(line: 1252, column: 3, scope: !1509)
!1513 = !DILocation(line: 1255, column: 16, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1504, file: !74, line: 1254, column: 3)
!1515 = !DILocation(line: 1255, column: 27, scope: !1514)
!1516 = !DILocation(line: 1255, column: 32, scope: !1514)
!1517 = !DILocation(line: 1255, column: 13, scope: !1514)
!1518 = !DILocation(line: 1258, column: 6, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1495, file: !74, line: 1258, column: 6)
!1520 = !DILocation(line: 1258, column: 17, scope: !1519)
!1521 = !DILocation(line: 1258, column: 15, scope: !1519)
!1522 = !DILocation(line: 1258, column: 6, scope: !1495)
!1523 = !DILocation(line: 1260, column: 12, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1519, file: !74, line: 1259, column: 3)
!1525 = !DILocation(line: 1260, column: 22, scope: !1524)
!1526 = !DILocation(line: 1260, column: 21, scope: !1524)
!1527 = !DILocation(line: 1260, column: 4, scope: !1524)
!1528 = !DILocation(line: 1264, column: 13, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1519, file: !74, line: 1263, column: 3)
!1530 = !DILocation(line: 1264, column: 23, scope: !1529)
!1531 = !DILocation(line: 1264, column: 22, scope: !1529)
!1532 = !DILocation(line: 1264, column: 36, scope: !1529)
!1533 = !DILocation(line: 1264, column: 4, scope: !1529)
!1534 = !DILocation(line: 1269, column: 1, scope: !1473)
!1535 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1286, type: !1536, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!25, !433, !25}
!1538 = !DILocalVariable(name: "numerator", arg: 1, scope: !1535, file: !74, line: 1286, type: !433)
!1539 = !DILocation(line: 1286, column: 25, scope: !1535)
!1540 = !DILocalVariable(name: "denominator", arg: 2, scope: !1535, file: !74, line: 1286, type: !25)
!1541 = !DILocation(line: 1286, column: 40, scope: !1535)
!1542 = !DILocalVariable(name: "u32Temp1", scope: !1535, file: !74, line: 1288, type: !433)
!1543 = !DILocation(line: 1288, column: 6, scope: !1535)
!1544 = !DILocalVariable(name: "u32Temp2", scope: !1535, file: !74, line: 1288, type: !433)
!1545 = !DILocation(line: 1288, column: 20, scope: !1535)
!1546 = !DILocation(line: 1289, column: 5, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1535, file: !74, line: 1289, column: 5)
!1548 = !DILocation(line: 1289, column: 17, scope: !1547)
!1549 = !DILocation(line: 1289, column: 5, scope: !1535)
!1550 = !DILocation(line: 1291, column: 6, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1552, file: !74, line: 1291, column: 6)
!1552 = distinct !DILexicalBlock(scope: !1547, file: !74, line: 1290, column: 2)
!1553 = !DILocation(line: 1291, column: 18, scope: !1551)
!1554 = !DILocation(line: 1291, column: 6, scope: !1552)
!1555 = !DILocation(line: 1293, column: 4, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1551, file: !74, line: 1292, column: 3)
!1557 = !DILocation(line: 1297, column: 19, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1551, file: !74, line: 1296, column: 3)
!1559 = !DILocation(line: 1297, column: 18, scope: !1558)
!1560 = !DILocation(line: 1297, column: 16, scope: !1558)
!1561 = !DILocation(line: 1298, column: 16, scope: !1558)
!1562 = !DILocation(line: 1298, column: 30, scope: !1558)
!1563 = !DILocation(line: 1298, column: 40, scope: !1558)
!1564 = !DILocation(line: 1298, column: 39, scope: !1558)
!1565 = !DILocation(line: 1298, column: 55, scope: !1558)
!1566 = !DILocation(line: 1298, column: 53, scope: !1558)
!1567 = !DILocation(line: 1298, column: 26, scope: !1558)
!1568 = !DILocation(line: 1298, column: 69, scope: !1558)
!1569 = !DILocation(line: 1298, column: 13, scope: !1558)
!1570 = !DILocation(line: 1299, column: 16, scope: !1558)
!1571 = !DILocation(line: 1299, column: 25, scope: !1558)
!1572 = !DILocation(line: 1299, column: 24, scope: !1558)
!1573 = !DILocation(line: 1299, column: 41, scope: !1558)
!1574 = !DILocation(line: 1299, column: 51, scope: !1558)
!1575 = !DILocation(line: 1299, column: 50, scope: !1558)
!1576 = !DILocation(line: 1299, column: 38, scope: !1558)
!1577 = !DILocation(line: 1299, column: 13, scope: !1558)
!1578 = !DILocation(line: 1300, column: 7, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1558, file: !74, line: 1300, column: 7)
!1580 = !DILocation(line: 1300, column: 16, scope: !1579)
!1581 = !DILocation(line: 1300, column: 7, scope: !1558)
!1582 = !DILocation(line: 1302, column: 13, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1579, file: !74, line: 1301, column: 4)
!1584 = !DILocation(line: 1302, column: 12, scope: !1583)
!1585 = !DILocation(line: 1302, column: 5, scope: !1583)
!1586 = !DILocation(line: 1306, column: 5, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1579, file: !74, line: 1305, column: 4)
!1588 = !DILocation(line: 1312, column: 15, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1547, file: !74, line: 1311, column: 2)
!1590 = !DILocation(line: 1312, column: 29, scope: !1589)
!1591 = !DILocation(line: 1312, column: 39, scope: !1589)
!1592 = !DILocation(line: 1312, column: 38, scope: !1589)
!1593 = !DILocation(line: 1312, column: 54, scope: !1589)
!1594 = !DILocation(line: 1312, column: 52, scope: !1589)
!1595 = !DILocation(line: 1312, column: 25, scope: !1589)
!1596 = !DILocation(line: 1312, column: 68, scope: !1589)
!1597 = !DILocation(line: 1312, column: 12, scope: !1589)
!1598 = !DILocation(line: 1313, column: 15, scope: !1589)
!1599 = !DILocation(line: 1313, column: 24, scope: !1589)
!1600 = !DILocation(line: 1313, column: 23, scope: !1589)
!1601 = !DILocation(line: 1313, column: 40, scope: !1589)
!1602 = !DILocation(line: 1313, column: 50, scope: !1589)
!1603 = !DILocation(line: 1313, column: 49, scope: !1589)
!1604 = !DILocation(line: 1313, column: 37, scope: !1589)
!1605 = !DILocation(line: 1313, column: 12, scope: !1589)
!1606 = !DILocation(line: 1314, column: 6, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1589, file: !74, line: 1314, column: 6)
!1608 = !DILocation(line: 1314, column: 15, scope: !1607)
!1609 = !DILocation(line: 1314, column: 6, scope: !1589)
!1610 = !DILocation(line: 1316, column: 11, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1607, file: !74, line: 1315, column: 3)
!1612 = !DILocation(line: 1316, column: 4, scope: !1611)
!1613 = !DILocation(line: 1320, column: 4, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1607, file: !74, line: 1319, column: 3)
!1615 = !DILocation(line: 1323, column: 1, scope: !1535)
!1616 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1341, type: !1617, scopeLine: 1342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1617 = !DISubroutineType(types: !1618)
!1618 = !{!25, !25, !433}
!1619 = !DILocalVariable(name: "numerator", arg: 1, scope: !1616, file: !74, line: 1341, type: !25)
!1620 = !DILocation(line: 1341, column: 25, scope: !1616)
!1621 = !DILocalVariable(name: "denominator", arg: 2, scope: !1616, file: !74, line: 1341, type: !433)
!1622 = !DILocation(line: 1341, column: 40, scope: !1616)
!1623 = !DILocalVariable(name: "s32Temp1", scope: !1616, file: !74, line: 1343, type: !25)
!1624 = !DILocation(line: 1343, column: 6, scope: !1616)
!1625 = !DILocalVariable(name: "s32Temp2", scope: !1616, file: !74, line: 1343, type: !25)
!1626 = !DILocation(line: 1343, column: 20, scope: !1616)
!1627 = !DILocalVariable(name: "u32Temp0", scope: !1616, file: !74, line: 1344, type: !433)
!1628 = !DILocation(line: 1344, column: 6, scope: !1616)
!1629 = !DILocalVariable(name: "u32Temp1", scope: !1616, file: !74, line: 1344, type: !433)
!1630 = !DILocation(line: 1344, column: 20, scope: !1616)
!1631 = !DILocalVariable(name: "u32Temp2", scope: !1616, file: !74, line: 1344, type: !433)
!1632 = !DILocation(line: 1344, column: 34, scope: !1616)
!1633 = !DILocation(line: 1345, column: 5, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1616, file: !74, line: 1345, column: 5)
!1635 = !DILocation(line: 1345, column: 17, scope: !1634)
!1636 = !DILocation(line: 1345, column: 5, scope: !1616)
!1637 = !DILocation(line: 1347, column: 6, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1639, file: !74, line: 1347, column: 6)
!1639 = distinct !DILexicalBlock(scope: !1634, file: !74, line: 1346, column: 2)
!1640 = !DILocation(line: 1347, column: 16, scope: !1638)
!1641 = !DILocation(line: 1347, column: 6, scope: !1639)
!1642 = !DILocation(line: 1349, column: 4, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1638, file: !74, line: 1348, column: 3)
!1644 = !DILocation(line: 1353, column: 4, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1638, file: !74, line: 1352, column: 3)
!1646 = !DILocation(line: 1358, column: 6, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1648, file: !74, line: 1358, column: 6)
!1648 = distinct !DILexicalBlock(scope: !1634, file: !74, line: 1357, column: 2)
!1649 = !DILocation(line: 1358, column: 16, scope: !1647)
!1650 = !DILocation(line: 1358, column: 6, scope: !1648)
!1651 = !DILocation(line: 1360, column: 16, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1359, column: 3)
!1653 = !DILocation(line: 1360, column: 15, scope: !1652)
!1654 = !DILocation(line: 1360, column: 13, scope: !1652)
!1655 = !DILocation(line: 1361, column: 16, scope: !1652)
!1656 = !DILocation(line: 1361, column: 25, scope: !1652)
!1657 = !DILocation(line: 1361, column: 24, scope: !1652)
!1658 = !DILocation(line: 1361, column: 13, scope: !1652)
!1659 = !DILocation(line: 1362, column: 15, scope: !1652)
!1660 = !DILocation(line: 1362, column: 28, scope: !1652)
!1661 = !DILocation(line: 1362, column: 37, scope: !1652)
!1662 = !DILocation(line: 1362, column: 36, scope: !1652)
!1663 = !DILocation(line: 1362, column: 52, scope: !1652)
!1664 = !DILocation(line: 1362, column: 50, scope: !1652)
!1665 = !DILocation(line: 1362, column: 24, scope: !1652)
!1666 = !DILocation(line: 1362, column: 13, scope: !1652)
!1667 = !DILocation(line: 1364, column: 8, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1652, file: !74, line: 1364, column: 7)
!1669 = !DILocation(line: 1364, column: 20, scope: !1668)
!1670 = !DILocation(line: 1364, column: 27, scope: !1668)
!1671 = !DILocation(line: 1364, column: 7, scope: !1652)
!1672 = !DILocation(line: 1366, column: 20, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1668, file: !74, line: 1365, column: 4)
!1674 = !DILocation(line: 1366, column: 32, scope: !1673)
!1675 = !DILocation(line: 1366, column: 17, scope: !1673)
!1676 = !DILocation(line: 1367, column: 4, scope: !1673)
!1677 = !DILocation(line: 1370, column: 20, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1668, file: !74, line: 1369, column: 4)
!1679 = !DILocation(line: 1370, column: 32, scope: !1678)
!1680 = !DILocation(line: 1370, column: 38, scope: !1678)
!1681 = !DILocation(line: 1370, column: 17, scope: !1678)
!1682 = !DILocation(line: 1374, column: 7, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1652, file: !74, line: 1374, column: 7)
!1684 = !DILocation(line: 1374, column: 18, scope: !1683)
!1685 = !DILocation(line: 1374, column: 16, scope: !1683)
!1686 = !DILocation(line: 1374, column: 7, scope: !1652)
!1687 = !DILocation(line: 1376, column: 14, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1683, file: !74, line: 1375, column: 4)
!1689 = !DILocation(line: 1376, column: 13, scope: !1688)
!1690 = !DILocation(line: 1376, column: 23, scope: !1688)
!1691 = !DILocation(line: 1376, column: 5, scope: !1688)
!1692 = !DILocation(line: 1380, column: 14, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1683, file: !74, line: 1379, column: 4)
!1694 = !DILocation(line: 1380, column: 23, scope: !1693)
!1695 = !DILocation(line: 1380, column: 12, scope: !1693)
!1696 = !DILocation(line: 1380, column: 27, scope: !1693)
!1697 = !DILocation(line: 1380, column: 5, scope: !1693)
!1698 = !DILocation(line: 1387, column: 16, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1386, column: 3)
!1700 = !DILocation(line: 1387, column: 30, scope: !1699)
!1701 = !DILocation(line: 1387, column: 40, scope: !1699)
!1702 = !DILocation(line: 1387, column: 39, scope: !1699)
!1703 = !DILocation(line: 1387, column: 55, scope: !1699)
!1704 = !DILocation(line: 1387, column: 53, scope: !1699)
!1705 = !DILocation(line: 1387, column: 26, scope: !1699)
!1706 = !DILocation(line: 1387, column: 69, scope: !1699)
!1707 = !DILocation(line: 1387, column: 13, scope: !1699)
!1708 = !DILocation(line: 1388, column: 16, scope: !1699)
!1709 = !DILocation(line: 1388, column: 26, scope: !1699)
!1710 = !DILocation(line: 1388, column: 25, scope: !1699)
!1711 = !DILocation(line: 1388, column: 42, scope: !1699)
!1712 = !DILocation(line: 1388, column: 51, scope: !1699)
!1713 = !DILocation(line: 1388, column: 50, scope: !1699)
!1714 = !DILocation(line: 1388, column: 39, scope: !1699)
!1715 = !DILocation(line: 1388, column: 13, scope: !1699)
!1716 = !DILocation(line: 1389, column: 11, scope: !1699)
!1717 = !DILocation(line: 1389, column: 4, scope: !1699)
!1718 = !DILocation(line: 1392, column: 1, scope: !1616)
!1719 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1409, type: !1720, scopeLine: 1410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1720 = !DISubroutineType(types: !1721)
!1721 = !{!25, !25, !25}
!1722 = !DILocalVariable(name: "numerator", arg: 1, scope: !1719, file: !74, line: 1409, type: !25)
!1723 = !DILocation(line: 1409, column: 25, scope: !1719)
!1724 = !DILocalVariable(name: "denominator", arg: 2, scope: !1719, file: !74, line: 1409, type: !25)
!1725 = !DILocation(line: 1409, column: 40, scope: !1719)
!1726 = !DILocalVariable(name: "s32Temp1", scope: !1719, file: !74, line: 1411, type: !25)
!1727 = !DILocation(line: 1411, column: 6, scope: !1719)
!1728 = !DILocalVariable(name: "s32Temp2", scope: !1719, file: !74, line: 1411, type: !25)
!1729 = !DILocation(line: 1411, column: 20, scope: !1719)
!1730 = !DILocalVariable(name: "denominator_prime", scope: !1719, file: !74, line: 1412, type: !433)
!1731 = !DILocation(line: 1412, column: 6, scope: !1719)
!1732 = !DILocalVariable(name: "u32Temp1", scope: !1719, file: !74, line: 1412, type: !433)
!1733 = !DILocation(line: 1412, column: 29, scope: !1719)
!1734 = !DILocalVariable(name: "u32Temp2", scope: !1719, file: !74, line: 1412, type: !433)
!1735 = !DILocation(line: 1412, column: 43, scope: !1719)
!1736 = !DILocalVariable(name: "u32numerator", scope: !1719, file: !74, line: 1413, type: !433)
!1737 = !DILocation(line: 1413, column: 6, scope: !1719)
!1738 = !DILocalVariable(name: "u32denominator", scope: !1719, file: !74, line: 1413, type: !433)
!1739 = !DILocation(line: 1413, column: 23, scope: !1719)
!1740 = !DILocation(line: 1414, column: 5, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1719, file: !74, line: 1414, column: 5)
!1742 = !DILocation(line: 1414, column: 15, scope: !1741)
!1743 = !DILocation(line: 1414, column: 5, scope: !1719)
!1744 = !DILocation(line: 1416, column: 6, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1746, file: !74, line: 1416, column: 6)
!1746 = distinct !DILexicalBlock(scope: !1741, file: !74, line: 1415, column: 2)
!1747 = !DILocation(line: 1416, column: 18, scope: !1745)
!1748 = !DILocation(line: 1416, column: 6, scope: !1746)
!1749 = !DILocation(line: 1418, column: 7, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1751, file: !74, line: 1418, column: 7)
!1751 = distinct !DILexicalBlock(scope: !1745, file: !74, line: 1417, column: 3)
!1752 = !DILocation(line: 1418, column: 19, scope: !1750)
!1753 = !DILocation(line: 1418, column: 7, scope: !1751)
!1754 = !DILocation(line: 1420, column: 5, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1750, file: !74, line: 1419, column: 4)
!1756 = !DILocation(line: 1424, column: 21, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1750, file: !74, line: 1423, column: 4)
!1758 = !DILocation(line: 1424, column: 20, scope: !1757)
!1759 = !DILocation(line: 1424, column: 18, scope: !1757)
!1760 = !DILocation(line: 1425, column: 23, scope: !1757)
!1761 = !DILocation(line: 1425, column: 22, scope: !1757)
!1762 = !DILocation(line: 1425, column: 20, scope: !1757)
!1763 = !DILocation(line: 1426, column: 16, scope: !1757)
!1764 = !DILocation(line: 1426, column: 33, scope: !1757)
!1765 = !DILocation(line: 1426, column: 46, scope: !1757)
!1766 = !DILocation(line: 1426, column: 45, scope: !1757)
!1767 = !DILocation(line: 1426, column: 64, scope: !1757)
!1768 = !DILocation(line: 1426, column: 62, scope: !1757)
!1769 = !DILocation(line: 1426, column: 29, scope: !1757)
!1770 = !DILocation(line: 1426, column: 81, scope: !1757)
!1771 = !DILocation(line: 1426, column: 14, scope: !1757)
!1772 = !DILocation(line: 1427, column: 17, scope: !1757)
!1773 = !DILocation(line: 1427, column: 30, scope: !1757)
!1774 = !DILocation(line: 1427, column: 29, scope: !1757)
!1775 = !DILocation(line: 1427, column: 49, scope: !1757)
!1776 = !DILocation(line: 1427, column: 58, scope: !1757)
!1777 = !DILocation(line: 1427, column: 57, scope: !1757)
!1778 = !DILocation(line: 1427, column: 46, scope: !1757)
!1779 = !DILocation(line: 1427, column: 14, scope: !1757)
!1780 = !DILocation(line: 1428, column: 8, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1757, file: !74, line: 1428, column: 8)
!1782 = !DILocation(line: 1428, column: 17, scope: !1781)
!1783 = !DILocation(line: 1428, column: 8, scope: !1757)
!1784 = !DILocation(line: 1430, column: 13, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1781, file: !74, line: 1429, column: 5)
!1786 = !DILocation(line: 1430, column: 6, scope: !1785)
!1787 = !DILocation(line: 1434, column: 6, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1781, file: !74, line: 1433, column: 5)
!1789 = !DILocation(line: 1440, column: 20, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1745, file: !74, line: 1439, column: 3)
!1791 = !DILocation(line: 1440, column: 19, scope: !1790)
!1792 = !DILocation(line: 1440, column: 29, scope: !1790)
!1793 = !DILocation(line: 1440, column: 17, scope: !1790)
!1794 = !DILocation(line: 1441, column: 16, scope: !1790)
!1795 = !DILocation(line: 1441, column: 33, scope: !1790)
!1796 = !DILocation(line: 1441, column: 46, scope: !1790)
!1797 = !DILocation(line: 1441, column: 45, scope: !1790)
!1798 = !DILocation(line: 1441, column: 61, scope: !1790)
!1799 = !DILocation(line: 1441, column: 59, scope: !1790)
!1800 = !DILocation(line: 1441, column: 29, scope: !1790)
!1801 = !DILocation(line: 1441, column: 75, scope: !1790)
!1802 = !DILocation(line: 1441, column: 13, scope: !1790)
!1803 = !DILocation(line: 1442, column: 16, scope: !1790)
!1804 = !DILocation(line: 1442, column: 29, scope: !1790)
!1805 = !DILocation(line: 1442, column: 28, scope: !1790)
!1806 = !DILocation(line: 1442, column: 45, scope: !1790)
!1807 = !DILocation(line: 1442, column: 54, scope: !1790)
!1808 = !DILocation(line: 1442, column: 53, scope: !1790)
!1809 = !DILocation(line: 1442, column: 42, scope: !1790)
!1810 = !DILocation(line: 1442, column: 13, scope: !1790)
!1811 = !DILocation(line: 1443, column: 13, scope: !1790)
!1812 = !DILocation(line: 1443, column: 12, scope: !1790)
!1813 = !DILocation(line: 1443, column: 22, scope: !1790)
!1814 = !DILocation(line: 1443, column: 4, scope: !1790)
!1815 = !DILocation(line: 1448, column: 6, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1817, file: !74, line: 1448, column: 6)
!1817 = distinct !DILexicalBlock(scope: !1741, file: !74, line: 1447, column: 2)
!1818 = !DILocation(line: 1448, column: 18, scope: !1816)
!1819 = !DILocation(line: 1448, column: 6, scope: !1817)
!1820 = !DILocation(line: 1450, column: 7, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1822, file: !74, line: 1450, column: 7)
!1822 = distinct !DILexicalBlock(scope: !1816, file: !74, line: 1449, column: 3)
!1823 = !DILocation(line: 1450, column: 19, scope: !1821)
!1824 = !DILocation(line: 1450, column: 7, scope: !1822)
!1825 = !DILocation(line: 1452, column: 5, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1821, file: !74, line: 1451, column: 4)
!1827 = !DILocation(line: 1456, column: 23, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1821, file: !74, line: 1455, column: 4)
!1829 = !DILocation(line: 1456, column: 22, scope: !1828)
!1830 = !DILocation(line: 1456, column: 35, scope: !1828)
!1831 = !DILocation(line: 1456, column: 20, scope: !1828)
!1832 = !DILocation(line: 1457, column: 17, scope: !1828)
!1833 = !DILocation(line: 1457, column: 31, scope: !1828)
!1834 = !DILocation(line: 1457, column: 41, scope: !1828)
!1835 = !DILocation(line: 1457, column: 40, scope: !1828)
!1836 = !DILocation(line: 1457, column: 59, scope: !1828)
!1837 = !DILocation(line: 1457, column: 57, scope: !1828)
!1838 = !DILocation(line: 1457, column: 27, scope: !1828)
!1839 = !DILocation(line: 1457, column: 76, scope: !1828)
!1840 = !DILocation(line: 1457, column: 14, scope: !1828)
!1841 = !DILocation(line: 1458, column: 17, scope: !1828)
!1842 = !DILocation(line: 1458, column: 27, scope: !1828)
!1843 = !DILocation(line: 1458, column: 26, scope: !1828)
!1844 = !DILocation(line: 1458, column: 46, scope: !1828)
!1845 = !DILocation(line: 1458, column: 55, scope: !1828)
!1846 = !DILocation(line: 1458, column: 54, scope: !1828)
!1847 = !DILocation(line: 1458, column: 43, scope: !1828)
!1848 = !DILocation(line: 1458, column: 14, scope: !1828)
!1849 = !DILocation(line: 1459, column: 14, scope: !1828)
!1850 = !DILocation(line: 1459, column: 13, scope: !1828)
!1851 = !DILocation(line: 1459, column: 23, scope: !1828)
!1852 = !DILocation(line: 1459, column: 5, scope: !1828)
!1853 = !DILocation(line: 1464, column: 16, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1816, file: !74, line: 1463, column: 3)
!1855 = !DILocation(line: 1464, column: 30, scope: !1854)
!1856 = !DILocation(line: 1464, column: 40, scope: !1854)
!1857 = !DILocation(line: 1464, column: 39, scope: !1854)
!1858 = !DILocation(line: 1464, column: 55, scope: !1854)
!1859 = !DILocation(line: 1464, column: 53, scope: !1854)
!1860 = !DILocation(line: 1464, column: 26, scope: !1854)
!1861 = !DILocation(line: 1464, column: 69, scope: !1854)
!1862 = !DILocation(line: 1464, column: 13, scope: !1854)
!1863 = !DILocation(line: 1465, column: 16, scope: !1854)
!1864 = !DILocation(line: 1465, column: 26, scope: !1854)
!1865 = !DILocation(line: 1465, column: 25, scope: !1854)
!1866 = !DILocation(line: 1465, column: 42, scope: !1854)
!1867 = !DILocation(line: 1465, column: 51, scope: !1854)
!1868 = !DILocation(line: 1465, column: 50, scope: !1854)
!1869 = !DILocation(line: 1465, column: 39, scope: !1854)
!1870 = !DILocation(line: 1465, column: 13, scope: !1854)
!1871 = !DILocation(line: 1466, column: 11, scope: !1854)
!1872 = !DILocation(line: 1466, column: 4, scope: !1854)
!1873 = !DILocation(line: 1469, column: 1, scope: !1719)
!1874 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1487, type: !1875, scopeLine: 1488, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1875 = !DISubroutineType(types: !1876)
!1876 = !{!6, !25, !433}
!1877 = !DILocalVariable(name: "numerator", arg: 1, scope: !1874, file: !74, line: 1487, type: !25)
!1878 = !DILocation(line: 1487, column: 25, scope: !1874)
!1879 = !DILocalVariable(name: "denominator", arg: 2, scope: !1874, file: !74, line: 1487, type: !433)
!1880 = !DILocation(line: 1487, column: 40, scope: !1874)
!1881 = !DILocalVariable(name: "numerator_prime", scope: !1874, file: !74, line: 1490, type: !433)
!1882 = !DILocation(line: 1490, column: 6, scope: !1874)
!1883 = !DILocalVariable(name: "u32Temp1", scope: !1874, file: !74, line: 1490, type: !433)
!1884 = !DILocation(line: 1490, column: 27, scope: !1874)
!1885 = !DILocalVariable(name: "u32Temp2", scope: !1874, file: !74, line: 1490, type: !433)
!1886 = !DILocation(line: 1490, column: 41, scope: !1874)
!1887 = !DILocalVariable(name: "u32Temp3", scope: !1874, file: !74, line: 1490, type: !433)
!1888 = !DILocation(line: 1490, column: 55, scope: !1874)
!1889 = !DILocalVariable(name: "s32Temp1", scope: !1874, file: !74, line: 1491, type: !25)
!1890 = !DILocation(line: 1491, column: 6, scope: !1874)
!1891 = !DILocalVariable(name: "s32Temp2", scope: !1874, file: !74, line: 1491, type: !25)
!1892 = !DILocation(line: 1491, column: 20, scope: !1874)
!1893 = !DILocalVariable(name: "s32Temp3", scope: !1874, file: !74, line: 1491, type: !25)
!1894 = !DILocation(line: 1491, column: 34, scope: !1874)
!1895 = !DILocation(line: 1492, column: 5, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1874, file: !74, line: 1492, column: 5)
!1897 = !DILocation(line: 1492, column: 17, scope: !1896)
!1898 = !DILocation(line: 1492, column: 5, scope: !1874)
!1899 = !DILocation(line: 1494, column: 6, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1901, file: !74, line: 1494, column: 6)
!1901 = distinct !DILexicalBlock(scope: !1896, file: !74, line: 1493, column: 2)
!1902 = !DILocation(line: 1494, column: 15, scope: !1900)
!1903 = !DILocation(line: 1494, column: 6, scope: !1901)
!1904 = !DILocation(line: 1496, column: 4, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1900, file: !74, line: 1495, column: 3)
!1906 = !DILocation(line: 1500, column: 4, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1900, file: !74, line: 1499, column: 3)
!1908 = !DILocation(line: 1505, column: 6, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1910, file: !74, line: 1505, column: 6)
!1910 = distinct !DILexicalBlock(scope: !1896, file: !74, line: 1504, column: 2)
!1911 = !DILocation(line: 1505, column: 16, scope: !1909)
!1912 = !DILocation(line: 1505, column: 6, scope: !1910)
!1913 = !DILocation(line: 1507, column: 23, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1506, column: 3)
!1915 = !DILocation(line: 1507, column: 22, scope: !1914)
!1916 = !DILocation(line: 1507, column: 20, scope: !1914)
!1917 = !DILocation(line: 1508, column: 16, scope: !1914)
!1918 = !DILocation(line: 1508, column: 32, scope: !1914)
!1919 = !DILocation(line: 1508, column: 31, scope: !1914)
!1920 = !DILocation(line: 1508, column: 13, scope: !1914)
!1921 = !DILocation(line: 1509, column: 15, scope: !1914)
!1922 = !DILocation(line: 1509, column: 34, scope: !1914)
!1923 = !DILocation(line: 1509, column: 45, scope: !1914)
!1924 = !DILocation(line: 1509, column: 43, scope: !1914)
!1925 = !DILocation(line: 1509, column: 31, scope: !1914)
!1926 = !DILocation(line: 1509, column: 13, scope: !1914)
!1927 = !DILocation(line: 1511, column: 8, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1914, file: !74, line: 1511, column: 7)
!1929 = !DILocation(line: 1511, column: 20, scope: !1928)
!1930 = !DILocation(line: 1511, column: 27, scope: !1928)
!1931 = !DILocation(line: 1511, column: 7, scope: !1914)
!1932 = !DILocation(line: 1513, column: 19, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1928, file: !74, line: 1512, column: 4)
!1934 = !DILocation(line: 1513, column: 31, scope: !1933)
!1935 = !DILocation(line: 1513, column: 17, scope: !1933)
!1936 = !DILocation(line: 1514, column: 4, scope: !1933)
!1937 = !DILocation(line: 1517, column: 20, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1928, file: !74, line: 1516, column: 4)
!1939 = !DILocation(line: 1517, column: 32, scope: !1938)
!1940 = !DILocation(line: 1517, column: 38, scope: !1938)
!1941 = !DILocation(line: 1517, column: 17, scope: !1938)
!1942 = !DILocation(line: 1520, column: 7, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1914, file: !74, line: 1520, column: 7)
!1944 = !DILocation(line: 1520, column: 18, scope: !1943)
!1945 = !DILocation(line: 1520, column: 16, scope: !1943)
!1946 = !DILocation(line: 1520, column: 7, scope: !1914)
!1947 = !DILocation(line: 1522, column: 18, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1943, file: !74, line: 1521, column: 4)
!1949 = !DILocation(line: 1522, column: 16, scope: !1948)
!1950 = !DILocation(line: 1522, column: 28, scope: !1948)
!1951 = !DILocation(line: 1522, column: 14, scope: !1948)
!1952 = !DILocation(line: 1523, column: 4, scope: !1948)
!1953 = !DILocation(line: 1526, column: 18, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1943, file: !74, line: 1525, column: 4)
!1955 = !DILocation(line: 1526, column: 26, scope: !1954)
!1956 = !DILocation(line: 1526, column: 16, scope: !1954)
!1957 = !DILocation(line: 1526, column: 30, scope: !1954)
!1958 = !DILocation(line: 1526, column: 14, scope: !1954)
!1959 = !DILocation(line: 1528, column: 8, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1914, file: !74, line: 1528, column: 7)
!1961 = !DILocation(line: 1528, column: 18, scope: !1960)
!1962 = !DILocation(line: 1528, column: 7, scope: !1914)
!1963 = !DILocation(line: 1530, column: 18, scope: !1964)
!1964 = distinct !DILexicalBlock(scope: !1960, file: !74, line: 1529, column: 4)
!1965 = !DILocation(line: 1530, column: 12, scope: !1964)
!1966 = !DILocation(line: 1530, column: 5, scope: !1964)
!1967 = !DILocation(line: 1534, column: 5, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1960, file: !74, line: 1533, column: 4)
!1969 = !DILocation(line: 1539, column: 16, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1538, column: 3)
!1971 = !DILocation(line: 1539, column: 26, scope: !1970)
!1972 = !DILocation(line: 1539, column: 25, scope: !1970)
!1973 = !DILocation(line: 1539, column: 41, scope: !1970)
!1974 = !DILocation(line: 1539, column: 39, scope: !1970)
!1975 = !DILocation(line: 1539, column: 13, scope: !1970)
!1976 = !DILocation(line: 1540, column: 16, scope: !1970)
!1977 = !DILocation(line: 1540, column: 30, scope: !1970)
!1978 = !DILocation(line: 1540, column: 40, scope: !1970)
!1979 = !DILocation(line: 1540, column: 39, scope: !1970)
!1980 = !DILocation(line: 1540, column: 55, scope: !1970)
!1981 = !DILocation(line: 1540, column: 53, scope: !1970)
!1982 = !DILocation(line: 1540, column: 26, scope: !1970)
!1983 = !DILocation(line: 1540, column: 68, scope: !1970)
!1984 = !DILocation(line: 1540, column: 13, scope: !1970)
!1985 = !DILocation(line: 1541, column: 16, scope: !1970)
!1986 = !DILocation(line: 1541, column: 25, scope: !1970)
!1987 = !DILocation(line: 1541, column: 24, scope: !1970)
!1988 = !DILocation(line: 1541, column: 41, scope: !1970)
!1989 = !DILocation(line: 1541, column: 51, scope: !1970)
!1990 = !DILocation(line: 1541, column: 50, scope: !1970)
!1991 = !DILocation(line: 1541, column: 38, scope: !1970)
!1992 = !DILocation(line: 1541, column: 13, scope: !1970)
!1993 = !DILocation(line: 1542, column: 7, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1970, file: !74, line: 1542, column: 7)
!1995 = !DILocation(line: 1542, column: 16, scope: !1994)
!1996 = !DILocation(line: 1542, column: 7, scope: !1970)
!1997 = !DILocation(line: 1544, column: 17, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1994, file: !74, line: 1543, column: 4)
!1999 = !DILocation(line: 1544, column: 12, scope: !1998)
!2000 = !DILocation(line: 1544, column: 5, scope: !1998)
!2001 = !DILocation(line: 1548, column: 5, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1994, file: !74, line: 1547, column: 4)
!2003 = !DILocation(line: 1552, column: 1, scope: !1874)
!2004 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2005, file: !2005, line: 12, type: !2006, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2009)
!2005 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2006 = !DISubroutineType(types: !2007)
!2007 = !{null, !2008}
!2008 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2009 = !{!2010}
!2010 = !DILocalVariable(name: "z", arg: 1, scope: !2004, file: !2005, line: 12, type: !2008)
!2011 = !DILocation(line: 0, scope: !2004)
!2012 = !DILocation(line: 13, column: 9, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2004, file: !2005, line: 13, column: 7)
!2014 = !DILocation(line: 13, column: 7, scope: !2004)
!2015 = !DILocation(line: 14, column: 5, scope: !2013)
!2016 = !DILocation(line: 15, column: 1, scope: !2004)
!2017 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2018, file: !2018, line: 20, type: !2019, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2022)
!2018 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2019 = !DISubroutineType(types: !2020)
!2020 = !{null, !2021, !2021}
!2021 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2022 = !{!2023, !2024}
!2023 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2017, file: !2018, line: 20, type: !2021)
!2024 = !DILocalVariable(name: "shift", arg: 2, scope: !2017, file: !2018, line: 20, type: !2021)
!2025 = !DILocation(line: 0, scope: !2017)
!2026 = !DILocation(line: 21, column: 13, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2017, file: !2018, line: 21, column: 7)
!2028 = !DILocation(line: 21, column: 7, scope: !2017)
!2029 = !DILocation(line: 27, column: 5, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !2027, file: !2018, line: 21, column: 26)
!2031 = !DILocation(line: 29, column: 1, scope: !2017)
