; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075/build/s16_mul_s16_s16_div_s16_alarm_0075.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"fak1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"fak2\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"div\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [113 x i8] c"KLEE-ALARM-0075: signed overflow. assert -2147483648 <= (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div);\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0075.err\00", align 1
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
  %fak1 = alloca i16, align 2
  %fak2 = alloca i16, align 2
  %div = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %fak1, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %fak2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %div, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i16* %result, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = bitcast i16* %fak1 to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !61
  %1 = bitcast i16* %fak2 to i8*, !dbg !62
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  %2 = bitcast i16* %div to i8*, !dbg !64
  call void @klee_make_symbolic(i8* %2, i64 2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  %3 = load i16, i16* %fak1, align 2, !dbg !66
  %4 = load i16, i16* %fak2, align 2, !dbg !67
  %5 = load i16, i16* %div, align 2, !dbg !68
  %call = call signext i16 @s16_mul_s16_s16_div_s16(i16 signext %3, i16 signext %4, i16 signext %5), !dbg !69
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
  %5 = load i32, i32* %s32Result, align 4, !dbg !854
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !855
  %conv8 = zext i16 %6 to i32, !dbg !855
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !856
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !856
  %div = sdiv i32 %5, %conv8, !dbg !856, !klee.check.div !111
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !857
  %conv9 = zext i16 %7 to i32, !dbg !857
  %mul10 = mul nsw i32 %div, %conv9, !dbg !858
  %sub = sub nsw i32 %4, %mul10, !dbg !859
  %shl = shl i32 %sub, 1, !dbg !860
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !861
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !862
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !863
  %conv11 = zext i16 %9 to i32, !dbg !863
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !864
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !864
  %div12 = sdiv i32 %8, %conv11, !dbg !864, !klee.check.div !111
  %10 = load i32, i32* %s32Result, align 4, !dbg !865
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !866
  %conv13 = zext i16 %11 to i32, !dbg !866
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !867
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !867
  %div14 = sdiv i32 %10, %conv13, !dbg !867, !klee.check.div !111
  %add = add nsw i32 %div12, %div14, !dbg !868
  store i32 %add, i32* %s32Result, align 4, !dbg !869
  %12 = load i32, i32* %s32Result, align 4, !dbg !870
  %cmp15 = icmp slt i32 %12, 65535, !dbg !872
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !873

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !874
  %cmp18 = icmp sgt i32 %13, 0, !dbg !877
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !878

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !879
  %conv21 = trunc i32 %14 to i16, !dbg !881
  store i16 %conv21, i16* %retval, align 2, !dbg !882
  br label %return, !dbg !882

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !883
  br label %return, !dbg !883

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !885
  br label %return, !dbg !885

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !887
  ret i16 %15, !dbg !887
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !888 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !891, metadata !DIExpression()), !dbg !892
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !893, metadata !DIExpression()), !dbg !894
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !895, metadata !DIExpression()), !dbg !896
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !897, metadata !DIExpression()), !dbg !898
  store i32 0, i32* %u32Temp1, align 4, !dbg !898
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !899, metadata !DIExpression()), !dbg !900
  store i16 0, i16* %u16TempDenom, align 2, !dbg !900
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !901
  %conv = zext i16 %0 to i32, !dbg !901
  %cmp = icmp eq i32 %conv, 0, !dbg !903
  br i1 %cmp, label %if.then, label %if.else, !dbg !904

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !905
  br label %return, !dbg !905

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !907
  %conv2 = zext i16 %1 to i32, !dbg !907
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !909
  %conv3 = zext i16 %2 to i32, !dbg !909
  %mul = mul nsw i32 %conv2, %conv3, !dbg !910
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !911
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !912
  %conv4 = zext i16 %3 to i32, !dbg !912
  %shr = ashr i32 %conv4, 1, !dbg !913
  %conv5 = trunc i32 %shr to i16, !dbg !912
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !914
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !915
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !916
  %conv6 = zext i16 %5 to i32, !dbg !916
  %add = add i32 %4, %conv6, !dbg !917
  store i32 %add, i32* %u32Temp1, align 4, !dbg !918
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !919
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !920
  %conv7 = zext i16 %7 to i32, !dbg !920
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !921
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !921
  %div = udiv i32 %6, %conv7, !dbg !921, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !922
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !923
  %cmp8 = icmp ult i32 %8, 65535, !dbg !925
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !926

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !927
  %and = and i32 %9, 65535, !dbg !929
  %conv11 = trunc i32 %and to i16, !dbg !930
  store i16 %conv11, i16* %retval, align 2, !dbg !931
  br label %return, !dbg !931

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !932
  br label %return, !dbg !932

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !934
  ret i16 %10, !dbg !934
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !935 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !938, metadata !DIExpression()), !dbg !939
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !940, metadata !DIExpression()), !dbg !941
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !942, metadata !DIExpression()), !dbg !943
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !944, metadata !DIExpression()), !dbg !945
  store i32 0, i32* %u32Temp1, align 4, !dbg !945
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !946
  %cmp = icmp eq i32 %0, 0, !dbg !948
  br i1 %cmp, label %if.then, label %if.else, !dbg !949

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !950
  br label %return, !dbg !950

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !952
  %conv = zext i16 %1 to i32, !dbg !952
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !954
  %conv1 = zext i16 %2 to i32, !dbg !954
  %mul = mul nsw i32 %conv, %conv1, !dbg !955
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !956
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !957
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !957
  %div = udiv i32 %mul, %3, !dbg !957, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !958
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !959
  %conv2 = zext i16 %4 to i32, !dbg !959
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !961
  %conv3 = zext i16 %5 to i32, !dbg !961
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !962
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !963
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !964
  %mul5 = mul i32 %6, %7, !dbg !965
  %sub = sub i32 %mul4, %mul5, !dbg !966
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !967
  %div6 = udiv i32 %8, 2, !dbg !968
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !969
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !970

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !971
  %inc = add i32 %9, 1, !dbg !971
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !971
  br label %if.end, !dbg !973

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !974
  %cmp10 = icmp ult i32 %10, 65535, !dbg !976
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !977

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !978
  %and = and i32 %11, 65535, !dbg !980
  %conv13 = trunc i32 %and to i16, !dbg !981
  store i16 %conv13, i16* %retval, align 2, !dbg !982
  br label %return, !dbg !982

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !983
  br label %return, !dbg !983

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !985
  ret i16 %12, !dbg !985
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !986 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !991, metadata !DIExpression()), !dbg !992
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !993, metadata !DIExpression()), !dbg !994
  store i32 0, i32* %u32Temp1, align 4, !dbg !994
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !995
  %conv = zext i16 %0 to i32, !dbg !995
  %cmp = icmp eq i32 %conv, 0, !dbg !997
  br i1 %cmp, label %if.then, label %if.else, !dbg !998

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !999
  br label %return, !dbg !999

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1001
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1003
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1004
  %conv2 = zext i16 %3 to i32, !dbg !1004
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1005
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1005
  %div = udiv i32 %2, %conv2, !dbg !1005, !klee.check.div !111
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1006
  %conv3 = zext i16 %4 to i32, !dbg !1006
  %mul = mul i32 %div, %conv3, !dbg !1007
  %sub = sub i32 %1, %mul, !dbg !1008
  %shl = shl i32 %sub, 1, !dbg !1009
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1010
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1011
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1012
  %conv4 = zext i16 %6 to i32, !dbg !1012
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1013
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1013
  %div5 = udiv i32 %5, %conv4, !dbg !1013, !klee.check.div !111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1014
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1015
  %conv6 = zext i16 %8 to i32, !dbg !1015
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1016
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1016
  %div7 = udiv i32 %7, %conv6, !dbg !1016, !klee.check.div !111
  %add = add i32 %div5, %div7, !dbg !1017
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1018
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1019
  store i32 %9, i32* %retval, align 4, !dbg !1020
  br label %return, !dbg !1020

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1021
  ret i32 %10, !dbg !1021
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1022 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1025, metadata !DIExpression()), !dbg !1026
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1027, metadata !DIExpression()), !dbg !1028
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1029, metadata !DIExpression()), !dbg !1030
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1031, metadata !DIExpression()), !dbg !1032
  store i32 0, i32* %s32Temp1, align 4, !dbg !1032
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1033, metadata !DIExpression()), !dbg !1034
  store i32 0, i32* %s32Temp2, align 4, !dbg !1034
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1035, metadata !DIExpression()), !dbg !1036
  store i32 0, i32* %s32Temp3, align 4, !dbg !1036
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1037
  %conv = sext i16 %0 to i32, !dbg !1037
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1038
  %conv1 = sext i16 %1 to i32, !dbg !1038
  %mul = mul nsw i32 %conv, %conv1, !dbg !1039
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1040
  %2 = load i16, i16* %div.addr, align 2, !dbg !1041
  %conv2 = sext i16 %2 to i32, !dbg !1041
  %cmp = icmp eq i32 %conv2, 0, !dbg !1043
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1044

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1045
  %cmp4 = icmp slt i32 %3, 0, !dbg !1048
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1049

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1050
  br label %return, !dbg !1050

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1052
  br label %return, !dbg !1052

if.else7:                                         ; preds = %entry
  %4 = load i16, i16* %div.addr, align 2, !dbg !1054
  %conv8 = sext i16 %4 to i64, !dbg !1057
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv8), !dbg !1058
  %tobool = icmp ne i32 %call, 0, !dbg !1058
  br i1 %tobool, label %if.end, label %if.then9, !dbg !1059

if.then9:                                         ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !1060
  br label %return, !dbg !1060

if.end:                                           ; preds = %if.else7
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1062
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1064
  %7 = load i16, i16* %div.addr, align 2, !dbg !1065
  %conv10 = sext i16 %7 to i32, !dbg !1066
  %int_cast_to_i64 = zext i32 %conv10 to i64, !dbg !1067
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1067
  %div11 = sdiv i32 %6, %conv10, !dbg !1067, !klee.check.div !111
  %8 = load i16, i16* %div.addr, align 2, !dbg !1068
  %conv12 = sext i16 %8 to i32, !dbg !1069
  %mul13 = mul nsw i32 %div11, %conv12, !dbg !1070
  %sub = sub nsw i32 %5, %mul13, !dbg !1071
  %conv14 = sext i32 %sub to i64, !dbg !1072
  %call15 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv14), !dbg !1073
  %tobool16 = icmp ne i32 %call15, 0, !dbg !1073
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !1074

if.then17:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !1075
  br label %return, !dbg !1075

if.end18:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1077
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1079
  %11 = load i16, i16* %div.addr, align 2, !dbg !1080
  %conv19 = sext i16 %11 to i32, !dbg !1081
  %int_cast_to_i641 = zext i32 %conv19 to i64, !dbg !1082
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1082
  %div20 = sdiv i32 %10, %conv19, !dbg !1082, !klee.check.div !111
  %12 = load i16, i16* %div.addr, align 2, !dbg !1083
  %conv21 = sext i16 %12 to i32, !dbg !1084
  %mul22 = mul nsw i32 %div20, %conv21, !dbg !1085
  %sub23 = sub nsw i32 %9, %mul22, !dbg !1086
  %conv24 = sext i32 %sub23 to i64, !dbg !1087
  %call25 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv24, i32 1), !dbg !1088
  %tobool26 = icmp ne i32 %call25, 0, !dbg !1088
  br i1 %tobool26, label %if.end28, label %if.then27, !dbg !1089

if.then27:                                        ; preds = %if.end18
  store i16 0, i16* %retval, align 2, !dbg !1090
  br label %return, !dbg !1090

if.end28:                                         ; preds = %if.end18
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !1092
  %14 = load i16, i16* %div.addr, align 2, !dbg !1094
  %conv29 = sext i16 %14 to i32, !dbg !1095
  %int_cast_to_i642 = zext i32 %conv29 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1096
  %div30 = sdiv i32 %13, %conv29, !dbg !1096, !klee.check.div !111
  %conv31 = sext i32 %div30 to i64, !dbg !1097
  %15 = load i16, i16* %div.addr, align 2, !dbg !1098
  %conv32 = sext i16 %15 to i32, !dbg !1099
  %conv33 = sext i32 %conv32 to i64, !dbg !1100
  %call34 = call i32 @klee_alarm_s32_mul_upper(i64 %conv31, i64 %conv33), !dbg !1101
  %tobool35 = icmp ne i32 %call34, 0, !dbg !1101
  br i1 %tobool35, label %if.end37, label %if.then36, !dbg !1102

if.then36:                                        ; preds = %if.end28
  store i16 0, i16* %retval, align 2, !dbg !1103
  br label %return, !dbg !1103

if.end37:                                         ; preds = %if.end28
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !1105
  %17 = load i16, i16* %div.addr, align 2, !dbg !1107
  %conv38 = sext i16 %17 to i32, !dbg !1108
  %int_cast_to_i643 = zext i32 %conv38 to i64, !dbg !1109
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1109
  %div39 = sdiv i32 %16, %conv38, !dbg !1109, !klee.check.div !111
  %conv40 = sext i32 %div39 to i64, !dbg !1110
  %18 = load i16, i16* %div.addr, align 2, !dbg !1111
  %conv41 = sext i16 %18 to i32, !dbg !1112
  %conv42 = sext i32 %conv41 to i64, !dbg !1113
  %call43 = call i32 @klee_alarm_s32_mul_lower(i64 %conv40, i64 %conv42), !dbg !1114
  %tobool44 = icmp ne i32 %call43, 0, !dbg !1114
  br i1 %tobool44, label %if.end46, label %if.then45, !dbg !1115

if.then45:                                        ; preds = %if.end37
  store i16 0, i16* %retval, align 2, !dbg !1116
  br label %return, !dbg !1116

if.end46:                                         ; preds = %if.end37
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !1118
  %20 = load i32, i32* %s32Temp1, align 4, !dbg !1119
  %21 = load i16, i16* %div.addr, align 2, !dbg !1120
  %conv47 = sext i16 %21 to i32, !dbg !1120
  %int_cast_to_i644 = zext i32 %conv47 to i64, !dbg !1121
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1121
  %div48 = sdiv i32 %20, %conv47, !dbg !1121, !klee.check.div !111
  %22 = load i16, i16* %div.addr, align 2, !dbg !1122
  %conv49 = sext i16 %22 to i32, !dbg !1122
  %mul50 = mul nsw i32 %div48, %conv49, !dbg !1123
  %sub51 = sub nsw i32 %19, %mul50, !dbg !1124
  %shl = shl i32 %sub51, 1, !dbg !1125
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1126
  %23 = load i16, i16* %div.addr, align 2, !dbg !1127
  %conv52 = sext i16 %23 to i64, !dbg !1129
  %call53 = call i32 @klee_alarm_divisor_nonzero(i64 %conv52), !dbg !1130
  %tobool54 = icmp ne i32 %call53, 0, !dbg !1130
  br i1 %tobool54, label %if.end56, label %if.then55, !dbg !1131

if.then55:                                        ; preds = %if.end46
  store i16 0, i16* %retval, align 2, !dbg !1132
  br label %return, !dbg !1132

if.end56:                                         ; preds = %if.end46
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1134
  %25 = load i16, i16* %div.addr, align 2, !dbg !1136
  %conv57 = sext i16 %25 to i32, !dbg !1137
  %int_cast_to_i645 = zext i32 %conv57 to i64, !dbg !1138
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1138
  %div58 = sdiv i32 %24, %conv57, !dbg !1138, !klee.check.div !111
  %conv59 = sext i32 %div58 to i64, !dbg !1139
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !1140
  %27 = load i16, i16* %div.addr, align 2, !dbg !1141
  %conv60 = sext i16 %27 to i32, !dbg !1142
  %int_cast_to_i646 = zext i32 %conv60 to i64, !dbg !1143
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1143
  %div61 = sdiv i32 %26, %conv60, !dbg !1143, !klee.check.div !111
  %conv62 = sext i32 %div61 to i64, !dbg !1144
  %call63 = call i32 @klee_alarm_s32_add_upper(i64 %conv59, i64 %conv62), !dbg !1145
  %tobool64 = icmp ne i32 %call63, 0, !dbg !1145
  br i1 %tobool64, label %if.end66, label %if.then65, !dbg !1146

if.then65:                                        ; preds = %if.end56
  store i16 0, i16* %retval, align 2, !dbg !1147
  br label %return, !dbg !1147

if.end66:                                         ; preds = %if.end56
  %28 = load i32, i32* %s32Temp2, align 4, !dbg !1149
  %29 = load i16, i16* %div.addr, align 2, !dbg !1151
  %conv67 = sext i16 %29 to i32, !dbg !1152
  %int_cast_to_i647 = zext i32 %conv67 to i64, !dbg !1153
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1153
  %div68 = sdiv i32 %28, %conv67, !dbg !1153, !klee.check.div !111
  %conv69 = sext i32 %div68 to i64, !dbg !1154
  %30 = load i32, i32* %s32Temp1, align 4, !dbg !1155
  %31 = load i16, i16* %div.addr, align 2, !dbg !1156
  %conv70 = sext i16 %31 to i32, !dbg !1157
  %int_cast_to_i648 = zext i32 %conv70 to i64, !dbg !1158
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1158
  %div71 = sdiv i32 %30, %conv70, !dbg !1158, !klee.check.div !111
  %conv72 = sext i32 %div71 to i64, !dbg !1159
  %call73 = call i32 @klee_alarm_s32_add_lower(i64 %conv69, i64 %conv72), !dbg !1160
  %tobool74 = icmp ne i32 %call73, 0, !dbg !1160
  br i1 %tobool74, label %if.end76, label %if.then75, !dbg !1161

if.then75:                                        ; preds = %if.end66
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 997, i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !1162
  unreachable, !dbg !1162

if.end76:                                         ; preds = %if.end66
  %32 = load i32, i32* %s32Temp2, align 4, !dbg !1164
  %33 = load i16, i16* %div.addr, align 2, !dbg !1165
  %conv77 = sext i16 %33 to i32, !dbg !1166
  %int_cast_to_i649 = zext i32 %conv77 to i64, !dbg !1167
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1167
  %div78 = sdiv i32 %32, %conv77, !dbg !1167, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1168
  %35 = load i16, i16* %div.addr, align 2, !dbg !1169
  %conv79 = sext i16 %35 to i32, !dbg !1170
  %int_cast_to_i6410 = zext i32 %conv79 to i64, !dbg !1171
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1171
  %div80 = sdiv i32 %34, %conv79, !dbg !1171, !klee.check.div !111
  %add = add nsw i32 %div78, %div80, !dbg !1172
  %conv81 = sext i32 %add to i64, !dbg !1173
  store volatile i64 %conv81, i64* @klee_alarm_sink_s64, align 8, !dbg !1174
  store i16 0, i16* %retval, align 2, !dbg !1175
  br label %return, !dbg !1175

return:                                           ; preds = %if.end76, %if.then65, %if.then55, %if.then45, %if.then36, %if.then27, %if.then17, %if.then9, %if.else, %if.then6
  %36 = load i16, i16* %retval, align 2, !dbg !1176
  ret i16 %36, !dbg !1176
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !1177 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !1180, metadata !DIExpression()), !dbg !1181
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !1182
  %cmp = icmp ne i64 %0, 0, !dbg !1183
  %conv = zext i1 %cmp to i32, !dbg !1183
  ret i32 %conv, !dbg !1184
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !1185 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1186, metadata !DIExpression()), !dbg !1187
  %0 = load i64, i64* %left.addr, align 8, !dbg !1188
  %cmp = icmp sge i64 %0, 0, !dbg !1189
  %conv = zext i1 %cmp to i32, !dbg !1189
  ret i32 %conv, !dbg !1190
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !1191 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1194, metadata !DIExpression()), !dbg !1195
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1196, metadata !DIExpression()), !dbg !1197
  %0 = load i32, i32* %count.addr, align 4, !dbg !1198
  %cmp = icmp uge i32 %0, 63, !dbg !1200
  br i1 %cmp, label %if.then, label %if.end, !dbg !1201

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1202
  br label %return, !dbg !1202

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !1204
  %2 = load i32, i32* %count.addr, align 4, !dbg !1205
  %sh_prom = zext i32 %2 to i64, !dbg !1206
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !1206
  %shl = shl i64 1, %sh_prom, !dbg !1206, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !1207
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !1208
  %conv = zext i1 %cmp1 to i32, !dbg !1208
  store i32 %conv, i32* %retval, align 4, !dbg !1209
  br label %return, !dbg !1209

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !1210
  ret i32 %3, !dbg !1210
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !1211 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1214, metadata !DIExpression()), !dbg !1215
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1216, metadata !DIExpression()), !dbg !1217
  %0 = load i64, i64* %left.addr, align 8, !dbg !1218
  %1 = load i64, i64* %right.addr, align 8, !dbg !1219
  %mul = mul nsw i64 %0, %1, !dbg !1220
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !1221
  %conv = zext i1 %cmp to i32, !dbg !1221
  ret i32 %conv, !dbg !1222
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !1223 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1224, metadata !DIExpression()), !dbg !1225
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1226, metadata !DIExpression()), !dbg !1227
  %0 = load i64, i64* %left.addr, align 8, !dbg !1228
  %1 = load i64, i64* %right.addr, align 8, !dbg !1229
  %mul = mul nsw i64 %0, %1, !dbg !1230
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !1231
  %conv = zext i1 %cmp to i32, !dbg !1231
  ret i32 %conv, !dbg !1232
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !1233 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1234, metadata !DIExpression()), !dbg !1235
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1236, metadata !DIExpression()), !dbg !1237
  %0 = load i64, i64* %left.addr, align 8, !dbg !1238
  %1 = load i64, i64* %right.addr, align 8, !dbg !1239
  %add = add nsw i64 %0, %1, !dbg !1240
  %cmp = icmp sle i64 %add, 2147483647, !dbg !1241
  %conv = zext i1 %cmp to i32, !dbg !1241
  ret i32 %conv, !dbg !1242
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !1243 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1244, metadata !DIExpression()), !dbg !1245
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1246, metadata !DIExpression()), !dbg !1247
  %0 = load i64, i64* %left.addr, align 8, !dbg !1248
  %1 = load i64, i64* %right.addr, align 8, !dbg !1249
  %add = add nsw i64 %0, %1, !dbg !1250
  %cmp = icmp sge i64 %add, -2147483648, !dbg !1251
  %conv = zext i1 %cmp to i32, !dbg !1251
  ret i32 %conv, !dbg !1252
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1253 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1258, metadata !DIExpression()), !dbg !1259
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1260, metadata !DIExpression()), !dbg !1261
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1262, metadata !DIExpression()), !dbg !1263
  store i32 0, i32* %s32Result, align 4, !dbg !1263
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1264, metadata !DIExpression()), !dbg !1265
  store i32 0, i32* %s32Temp1, align 4, !dbg !1265
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1266
  %conv = sext i16 %0 to i32, !dbg !1266
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1267
  %conv1 = sext i16 %1 to i32, !dbg !1267
  %mul = mul nsw i32 %conv, %conv1, !dbg !1268
  store i32 %mul, i32* %s32Result, align 4, !dbg !1269
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1270
  %conv2 = zext i16 %2 to i32, !dbg !1270
  %cmp = icmp eq i32 %conv2, 0, !dbg !1272
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1273

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1274
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1277
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1278

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1279
  br label %return, !dbg !1279

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1281
  %cmp7 = icmp eq i32 %4, 0, !dbg !1283
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1284

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1285
  br label %return, !dbg !1285

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1287
  br label %return, !dbg !1287

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1289
  %6 = load i32, i32* %s32Result, align 4, !dbg !1291
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1292
  %conv12 = zext i16 %7 to i32, !dbg !1292
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1293
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1293
  %div = sdiv i32 %6, %conv12, !dbg !1293, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1294
  %conv13 = zext i16 %8 to i32, !dbg !1294
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1295
  %sub = sub nsw i32 %5, %mul14, !dbg !1296
  %shl = shl i32 %sub, 1, !dbg !1297
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1298
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1299
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1300
  %conv15 = zext i16 %10 to i32, !dbg !1300
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1301
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1301
  %div16 = sdiv i32 %9, %conv15, !dbg !1301, !klee.check.div !111
  %11 = load i32, i32* %s32Result, align 4, !dbg !1302
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1303
  %conv17 = zext i16 %12 to i32, !dbg !1303
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1304
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1304
  %div18 = sdiv i32 %11, %conv17, !dbg !1304, !klee.check.div !111
  %add = add nsw i32 %div16, %div18, !dbg !1305
  store i32 %add, i32* %s32Result, align 4, !dbg !1306
  %13 = load i32, i32* %s32Result, align 4, !dbg !1307
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1309
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1310

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1311
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1314
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1315

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1316
  %conv25 = trunc i32 %15 to i16, !dbg !1318
  store i16 %conv25, i16* %retval, align 2, !dbg !1319
  br label %return, !dbg !1319

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1320
  br label %return, !dbg !1320

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1322
  br label %return, !dbg !1322

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1324
  ret i16 %16, !dbg !1324
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1325 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1332, metadata !DIExpression()), !dbg !1333
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %cmp = icmp eq i32 %0, 0, !dbg !1336
  br i1 %cmp, label %if.then, label %if.else, !dbg !1337

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1338
  br label %return, !dbg !1338

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1340
  %cmp1 = icmp sle i32 %1, 0, !dbg !1343
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1344

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1347
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1349
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1351
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1351
  %div = udiv i32 %3, %4, !dbg !1351, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1352
  %mul = mul i32 %div, %5, !dbg !1353
  %sub = sub i32 %2, %mul, !dbg !1354
  %shl = shl i32 %sub, 1, !dbg !1355
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1356
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1357
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1359
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1359
  %div4 = udiv i32 %6, %7, !dbg !1359, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1361
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1362
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1362
  %div5 = udiv i32 %8, %9, !dbg !1362, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1363
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1364
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1365
  store i32 %10, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1367
  ret i32 %11, !dbg !1367
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1368 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1371, metadata !DIExpression()), !dbg !1372
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1373, metadata !DIExpression()), !dbg !1374
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1375, metadata !DIExpression()), !dbg !1376
  store i32 0, i32* %s32Temp1, align 4, !dbg !1376
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1377
  %cmp = icmp eq i32 %0, 0, !dbg !1379
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1380

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %cmp1 = icmp sge i32 %1, 0, !dbg !1384
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1385

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1386
  br label %return, !dbg !1386

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1388
  br label %return, !dbg !1388

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1390
  %cmp4 = icmp sge i32 %2, 0, !dbg !1393
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1394

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1397
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1399
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1399
  %div = udiv i32 %4, %5, !dbg !1399, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %mul = mul i32 %div, %6, !dbg !1401
  %sub = sub i32 %3, %mul, !dbg !1402
  %shl = shl i32 %sub, 1, !dbg !1403
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1404
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1405
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1406
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1407
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1407
  %div6 = udiv i32 %7, %8, !dbg !1407, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1408
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1409
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1410
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1410
  %div7 = udiv i32 %9, %10, !dbg !1410, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1411
  store i32 %add, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1413
  br label %return, !dbg !1413

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1415
  ret i32 %11, !dbg !1415
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1416 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1419, metadata !DIExpression()), !dbg !1420
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1421, metadata !DIExpression()), !dbg !1422
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1423, metadata !DIExpression()), !dbg !1424
  store i32 0, i32* %u32Temp1, align 4, !dbg !1424
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1425, metadata !DIExpression()), !dbg !1426
  store i32 0, i32* %u32Temp2, align 4, !dbg !1426
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %cmp = icmp eq i32 %0, 0, !dbg !1429
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1430

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1431
  %cmp1 = icmp slt i32 %1, 0, !dbg !1434
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1435

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1436
  br label %return, !dbg !1436

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1440
  %cmp4 = icmp sge i32 %2, 0, !dbg !1443
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1444

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %cmp6 = icmp eq i32 %3, 0, !dbg !1448
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1449

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1450
  br label %return, !dbg !1450

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1452
  %cmp9 = icmp sle i32 %4, 0, !dbg !1455
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1456

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1457
  br label %return, !dbg !1457

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1459
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1461
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1462
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1463
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1463
  %div = sdiv i32 %6, %7, !dbg !1463, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %mul = mul nsw i32 %div, %8, !dbg !1465
  %sub = sub nsw i32 %5, %mul, !dbg !1466
  %shl = shl i32 %sub, 1, !dbg !1467
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1468
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1469
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1471
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1471
  %div12 = udiv i32 %9, %10, !dbg !1471, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1472
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1473
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1474
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1474
  %div13 = sdiv i32 %11, %12, !dbg !1474, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1475
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1476
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1477
  store i32 %13, i32* %retval, align 4, !dbg !1478
  br label %return, !dbg !1478

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1479
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1482
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1483

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1486
  %sub18 = sub nsw i32 0, %15, !dbg !1488
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1489
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %sub19 = sub nsw i32 0, %16, !dbg !1491
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1492
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1493
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1494
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1495
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1496
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1496
  %div20 = sdiv i32 %18, %19, !dbg !1496, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1497
  %mul21 = mul nsw i32 %div20, %20, !dbg !1498
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1499
  %shl23 = shl i32 %sub22, 1, !dbg !1500
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1501
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1502
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1504
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1504
  %div24 = udiv i32 %21, %22, !dbg !1504, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1505
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1506
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1507
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1507
  %div25 = sdiv i32 %23, %24, !dbg !1507, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1508
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1509
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1510
  store i32 %25, i32* %retval, align 4, !dbg !1511
  br label %return, !dbg !1511

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1512
  ret i32 %26, !dbg !1512
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1513 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1516, metadata !DIExpression()), !dbg !1517
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1518, metadata !DIExpression()), !dbg !1519
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1520, metadata !DIExpression()), !dbg !1521
  store i32 0, i32* %u32Temp1, align 4, !dbg !1521
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1522, metadata !DIExpression()), !dbg !1523
  store i32 0, i32* %u32Temp2, align 4, !dbg !1523
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1524, metadata !DIExpression()), !dbg !1525
  store i32 0, i32* %u32Temp3, align 4, !dbg !1525
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 0, i32* %numerator_old, align 4, !dbg !1527
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %cmp = icmp eq i32 %0, 0, !dbg !1530
  br i1 %cmp, label %if.then, label %if.else, !dbg !1531

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1532
  br label %return, !dbg !1532

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1534
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1536
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1537
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1538
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1539
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1539
  %div = udiv i32 %3, %4, !dbg !1539, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1540
  %sub = sub i32 %1, %mul, !dbg !1541
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1542
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1543
  %and = and i32 %5, 1, !dbg !1545
  %cmp1 = icmp eq i32 %and, 0, !dbg !1546
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1547

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %shr = lshr i32 %6, 1, !dbg !1550
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1551
  br label %if.end, !dbg !1552

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %shr4 = lshr i32 %7, 1, !dbg !1555
  %add = add i32 %shr4, 1, !dbg !1556
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1557
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1558
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1560
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1561
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1562

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1565
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1566
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1566
  %div7 = udiv i32 %10, %11, !dbg !1566, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1567
  br label %return, !dbg !1567

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1568
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1571
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1571
  %div9 = udiv i32 %12, %13, !dbg !1571, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1572
  store i32 %add10, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1574
  ret i32 %14, !dbg !1574
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1575 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1578, metadata !DIExpression()), !dbg !1579
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1580, metadata !DIExpression()), !dbg !1581
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1582, metadata !DIExpression()), !dbg !1583
  store i32 0, i32* %u32Temp1, align 4, !dbg !1583
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 0, i32* %u32Temp2, align 4, !dbg !1585
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1586
  %cmp = icmp sle i32 %0, 0, !dbg !1588
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1589

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %cmp1 = icmp sge i32 %1, 0, !dbg !1593
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1594

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1595
  br label %return, !dbg !1595

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %sub = sub nsw i32 0, %2, !dbg !1599
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1600
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1601
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1602
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1603
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1604
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1604
  %div = udiv i32 %4, %5, !dbg !1604, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1605
  %mul = mul i32 %div, %6, !dbg !1606
  %sub3 = sub i32 %3, %mul, !dbg !1607
  %shl = shl i32 %sub3, 1, !dbg !1608
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1609
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1610
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1611
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1612
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1612
  %div4 = udiv i32 %7, %8, !dbg !1612, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1613
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1614
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1615
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1615
  %div5 = udiv i32 %9, %10, !dbg !1615, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1616
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1617
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1618
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1620
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1621

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1622
  %sub8 = sub i32 0, %12, !dbg !1624
  store i32 %sub8, i32* %retval, align 4, !dbg !1625
  br label %return, !dbg !1625

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1626
  br label %return, !dbg !1626

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1628
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1630
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1632
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1632
  %div11 = udiv i32 %14, %15, !dbg !1632, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %mul12 = mul i32 %div11, %16, !dbg !1634
  %sub13 = sub i32 %13, %mul12, !dbg !1635
  %shl14 = shl i32 %sub13, 1, !dbg !1636
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1637
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1638
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1639
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1640
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1640
  %div15 = udiv i32 %17, %18, !dbg !1640, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1641
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1642
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1643
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1643
  %div16 = udiv i32 %19, %20, !dbg !1643, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1644
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1645
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1646
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1648
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1649

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1650
  store i32 %22, i32* %retval, align 4, !dbg !1652
  br label %return, !dbg !1652

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1653
  br label %return, !dbg !1653

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1655
  ret i32 %23, !dbg !1655
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1656 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1659, metadata !DIExpression()), !dbg !1660
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1661, metadata !DIExpression()), !dbg !1662
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1663, metadata !DIExpression()), !dbg !1664
  store i32 0, i32* %s32Temp1, align 4, !dbg !1664
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1665, metadata !DIExpression()), !dbg !1666
  store i32 0, i32* %s32Temp2, align 4, !dbg !1666
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1667, metadata !DIExpression()), !dbg !1668
  store i32 0, i32* %u32Temp0, align 4, !dbg !1668
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1669, metadata !DIExpression()), !dbg !1670
  store i32 0, i32* %u32Temp1, align 4, !dbg !1670
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1671, metadata !DIExpression()), !dbg !1672
  store i32 0, i32* %u32Temp2, align 4, !dbg !1672
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1673
  %cmp = icmp eq i32 %0, 0, !dbg !1675
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1676

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1677
  %cmp1 = icmp slt i32 %1, 0, !dbg !1680
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1681

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1682
  br label %return, !dbg !1682

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1684
  br label %return, !dbg !1684

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %cmp4 = icmp sle i32 %2, 0, !dbg !1689
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1690

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1691
  %sub = sub nsw i32 0, %3, !dbg !1693
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1694
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1695
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1697
  %div = udiv i32 %4, %5, !dbg !1697, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1698
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1699
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1700
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1702
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1702
  %div6 = udiv i32 %7, %8, !dbg !1702, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %mul = mul i32 %div6, %9, !dbg !1704
  %sub7 = sub i32 %6, %mul, !dbg !1705
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1706
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1707
  %and = and i32 %10, 1, !dbg !1709
  %cmp8 = icmp eq i32 %and, 0, !dbg !1710
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1711

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %shr = lshr i32 %11, 1, !dbg !1714
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1715
  br label %if.end, !dbg !1716

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %shr11 = lshr i32 %12, 1, !dbg !1719
  %add = add i32 %shr11, 1, !dbg !1720
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1721
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1722
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %cmp12 = icmp ult i32 %13, %14, !dbg !1725
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1726

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1727
  %neg = xor i32 %15, -1, !dbg !1729
  %add14 = add i32 %neg, 1, !dbg !1730
  store i32 %add14, i32* %retval, align 4, !dbg !1731
  br label %return, !dbg !1731

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1732
  %add16 = add i32 %16, 1, !dbg !1734
  %neg17 = xor i32 %add16, -1, !dbg !1735
  %add18 = add i32 %neg17, 1, !dbg !1736
  store i32 %add18, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1738
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1740
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1741
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1742
  %div20 = udiv i32 %18, %19, !dbg !1742, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1743
  %mul21 = mul i32 %div20, %20, !dbg !1744
  %sub22 = sub i32 %17, %mul21, !dbg !1745
  %shl = shl i32 %sub22, 1, !dbg !1746
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1747
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1748
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1749
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1750
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1750
  %div23 = udiv i32 %21, %22, !dbg !1750, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1751
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1752
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1753
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1753
  %div24 = udiv i32 %23, %24, !dbg !1753, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1754
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1755
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1756
  store i32 %25, i32* %retval, align 4, !dbg !1757
  br label %return, !dbg !1757

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1758
  ret i32 %26, !dbg !1758
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1759 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1762, metadata !DIExpression()), !dbg !1763
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1764, metadata !DIExpression()), !dbg !1765
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1766, metadata !DIExpression()), !dbg !1767
  store i32 0, i32* %s32Temp1, align 4, !dbg !1767
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1768, metadata !DIExpression()), !dbg !1769
  store i32 0, i32* %s32Temp2, align 4, !dbg !1769
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1770, metadata !DIExpression()), !dbg !1771
  store i32 0, i32* %denominator_prime, align 4, !dbg !1771
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1772, metadata !DIExpression()), !dbg !1773
  store i32 0, i32* %u32Temp1, align 4, !dbg !1773
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1774, metadata !DIExpression()), !dbg !1775
  store i32 0, i32* %u32Temp2, align 4, !dbg !1775
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1776, metadata !DIExpression()), !dbg !1777
  store i32 0, i32* %u32numerator, align 4, !dbg !1777
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1778, metadata !DIExpression()), !dbg !1779
  store i32 0, i32* %u32denominator, align 4, !dbg !1779
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1780
  %cmp = icmp slt i32 %0, 0, !dbg !1782
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1783

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %cmp1 = icmp sle i32 %1, 0, !dbg !1787
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1788

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1789
  %cmp3 = icmp sge i32 %2, 0, !dbg !1792
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1793

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1794
  br label %return, !dbg !1794

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1796
  %sub = sub nsw i32 0, %3, !dbg !1798
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1799
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1800
  %sub5 = sub nsw i32 0, %4, !dbg !1801
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1802
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1803
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1804
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1805
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1806
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1806
  %div = udiv i32 %6, %7, !dbg !1806, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1807
  %mul = mul i32 %div, %8, !dbg !1808
  %sub6 = sub i32 %5, %mul, !dbg !1809
  %shl = shl i32 %sub6, 1, !dbg !1810
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1811
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1812
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1813
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1814
  %div7 = udiv i32 %9, %10, !dbg !1814, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1815
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1816
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1817
  %div8 = udiv i32 %11, %12, !dbg !1817, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1818
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1819
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1820
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1822
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1823

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1824
  store i32 %14, i32* %retval, align 4, !dbg !1826
  br label %return, !dbg !1826

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1827
  br label %return, !dbg !1827

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1829
  %neg = xor i32 %15, -1, !dbg !1831
  %add13 = add nsw i32 %neg, 1, !dbg !1832
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1833
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1834
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1835
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1837
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1837
  %div14 = udiv i32 %17, %18, !dbg !1837, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1838
  %mul15 = mul i32 %div14, %19, !dbg !1839
  %sub16 = sub i32 %16, %mul15, !dbg !1840
  %shl17 = shl i32 %sub16, 1, !dbg !1841
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1842
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1843
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1845
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1845
  %div18 = udiv i32 %20, %21, !dbg !1845, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1846
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1847
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1848
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1848
  %div19 = sdiv i32 %22, %23, !dbg !1848, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1849
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1850
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1851
  %neg21 = xor i32 %24, -1, !dbg !1852
  %add22 = add nsw i32 %neg21, 1, !dbg !1853
  store i32 %add22, i32* %retval, align 4, !dbg !1854
  br label %return, !dbg !1854

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %cmp24 = icmp sle i32 %25, 0, !dbg !1858
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1859

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1860
  %cmp26 = icmp sge i32 %26, 0, !dbg !1863
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1864

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1865
  br label %return, !dbg !1865

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %neg29 = xor i32 %27, -1, !dbg !1869
  %add30 = add nsw i32 %neg29, 1, !dbg !1870
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1871
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1872
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1873
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1874
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1875
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1875
  %div31 = udiv i32 %29, %30, !dbg !1875, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1876
  %mul32 = mul i32 %div31, %31, !dbg !1877
  %sub33 = sub i32 %28, %mul32, !dbg !1878
  %shl34 = shl i32 %sub33, 1, !dbg !1879
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1880
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1882
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1883
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1883
  %div35 = udiv i32 %32, %33, !dbg !1883, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1884
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1885
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1886
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1886
  %div36 = udiv i32 %34, %35, !dbg !1886, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1887
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1888
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1889
  %neg38 = xor i32 %36, -1, !dbg !1890
  %add39 = add nsw i32 %neg38, 1, !dbg !1891
  store i32 %add39, i32* %retval, align 4, !dbg !1892
  br label %return, !dbg !1892

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1893
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1895
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1897
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1897
  %div41 = sdiv i32 %38, %39, !dbg !1897, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1898
  %mul42 = mul nsw i32 %div41, %40, !dbg !1899
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1900
  %shl44 = shl i32 %sub43, 1, !dbg !1901
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1902
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1903
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1904
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1905
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1905
  %div45 = sdiv i32 %41, %42, !dbg !1905, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1906
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1907
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1908
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1908
  %div46 = udiv i32 %43, %44, !dbg !1908, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1909
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1910
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1911
  store i32 %45, i32* %retval, align 4, !dbg !1912
  br label %return, !dbg !1912

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1913
  ret i32 %46, !dbg !1913
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1914 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1917, metadata !DIExpression()), !dbg !1918
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1919, metadata !DIExpression()), !dbg !1920
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1921, metadata !DIExpression()), !dbg !1922
  store i32 0, i32* %numerator_prime, align 4, !dbg !1922
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1923, metadata !DIExpression()), !dbg !1924
  store i32 0, i32* %u32Temp1, align 4, !dbg !1924
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1925, metadata !DIExpression()), !dbg !1926
  store i32 0, i32* %u32Temp2, align 4, !dbg !1926
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1927, metadata !DIExpression()), !dbg !1928
  store i32 0, i32* %u32Temp3, align 4, !dbg !1928
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1929, metadata !DIExpression()), !dbg !1930
  store i32 0, i32* %s32Temp1, align 4, !dbg !1930
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1931, metadata !DIExpression()), !dbg !1932
  store i32 0, i32* %s32Temp2, align 4, !dbg !1932
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1933, metadata !DIExpression()), !dbg !1934
  store i32 0, i32* %s32Temp3, align 4, !dbg !1934
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1935
  %cmp = icmp eq i32 %0, 0, !dbg !1937
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1938

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1939
  %cmp1 = icmp slt i32 %1, 0, !dbg !1942
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1943

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1944
  br label %return, !dbg !1944

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1946
  br label %return, !dbg !1946

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1948
  %cmp4 = icmp slt i32 %2, 0, !dbg !1951
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1952

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1953
  %sub = sub nsw i32 0, %3, !dbg !1955
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1956
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1957
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1958
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1959
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1959
  %div = udiv i32 %4, %5, !dbg !1959, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1960
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1961
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1962
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1963
  %mul = mul i32 %7, %8, !dbg !1964
  %sub6 = sub i32 %6, %mul, !dbg !1965
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1966
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1967
  %and = and i32 %9, 1, !dbg !1969
  %cmp7 = icmp eq i32 %and, 0, !dbg !1970
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1971

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1972
  %shr = lshr i32 %10, 1, !dbg !1974
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1975
  br label %if.end, !dbg !1976

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1977
  %shr10 = lshr i32 %11, 1, !dbg !1979
  %add = add i32 %shr10, 1, !dbg !1980
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1981
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1982
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1984
  %cmp11 = icmp ult i32 %12, %13, !dbg !1985
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1986

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1987
  %neg = xor i32 %14, -1, !dbg !1989
  %add13 = add i32 %neg, 1, !dbg !1990
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1991
  br label %if.end18, !dbg !1992

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1993
  %add15 = add i32 %15, 1, !dbg !1995
  %neg16 = xor i32 %add15, -1, !dbg !1996
  %add17 = add i32 %neg16, 1, !dbg !1997
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1998
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1999
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2001
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2002

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2003
  %conv = trunc i32 %17 to i16, !dbg !2005
  store i16 %conv, i16* %retval, align 2, !dbg !2006
  br label %return, !dbg !2006

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2007
  br label %return, !dbg !2007

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2009
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2011
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2012
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2012
  %div23 = udiv i32 %18, %19, !dbg !2012, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2013
  %mul24 = mul i32 %div23, %20, !dbg !2014
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2015
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2016
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2017
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2018
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2019
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2019
  %div25 = udiv i32 %22, %23, !dbg !2019, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2020
  %mul26 = mul i32 %div25, %24, !dbg !2021
  %sub27 = sub i32 %21, %mul26, !dbg !2022
  %shl = shl i32 %sub27, 1, !dbg !2023
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2024
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2025
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2026
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2027
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2027
  %div28 = udiv i32 %25, %26, !dbg !2027, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2028
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2029
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2030
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2030
  %div29 = udiv i32 %27, %28, !dbg !2030, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !2031
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2032
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2033
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2035
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2036

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2037
  %conv34 = trunc i32 %30 to i16, !dbg !2039
  store i16 %conv34, i16* %retval, align 2, !dbg !2040
  br label %return, !dbg !2040

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2041
  br label %return, !dbg !2041

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2043
  ret i16 %31, !dbg !2043
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2044 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2050, metadata !DIExpression()), !dbg !2051
  %2 = icmp eq i64 %0, 0, !dbg !2052
  br i1 %2, label %3, label %4, !dbg !2054

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2055
  unreachable, !dbg !2055

4:                                                ; preds = %1
  ret void, !dbg !2056
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2057 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2063, metadata !DIExpression()), !dbg !2065
  call void @llvm.dbg.value(metadata i64 %1, metadata !2064, metadata !DIExpression()), !dbg !2065
  %3 = icmp ult i64 %1, %0, !dbg !2066
  br i1 %3, label %5, label %4, !dbg !2068

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2069
  unreachable, !dbg !2069

5:                                                ; preds = %2
  ret void, !dbg !2071
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075/div_Ccode_alarm_0075.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "fak1", scope: !48, file: !49, line: 9, type: !8)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "fak2", scope: !48, file: !49, line: 10, type: !8)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "div", scope: !48, file: !49, line: 11, type: !8)
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
!67 = !DILocation(line: 18, column: 44, scope: !48)
!68 = !DILocation(line: 18, column: 50, scope: !48)
!69 = !DILocation(line: 18, column: 14, scope: !48)
!70 = !DILocation(line: 18, column: 12, scope: !48)
!71 = !DILocation(line: 20, column: 11, scope: !48)
!72 = !DILocation(line: 21, column: 5, scope: !48)
!73 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !74, file: !74, line: 170, type: !75, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075")
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
!852 = !DILocation(line: 795, column: 15, scope: !853)
!853 = distinct !DILexicalBlock(scope: !840, file: !74, line: 794, column: 2)
!854 = !DILocation(line: 795, column: 29, scope: !853)
!855 = !DILocation(line: 795, column: 39, scope: !853)
!856 = !DILocation(line: 795, column: 38, scope: !853)
!857 = !DILocation(line: 795, column: 54, scope: !853)
!858 = !DILocation(line: 795, column: 52, scope: !853)
!859 = !DILocation(line: 795, column: 25, scope: !853)
!860 = !DILocation(line: 795, column: 68, scope: !853)
!861 = !DILocation(line: 795, column: 12, scope: !853)
!862 = !DILocation(line: 796, column: 16, scope: !853)
!863 = !DILocation(line: 796, column: 25, scope: !853)
!864 = !DILocation(line: 796, column: 24, scope: !853)
!865 = !DILocation(line: 796, column: 41, scope: !853)
!866 = !DILocation(line: 796, column: 51, scope: !853)
!867 = !DILocation(line: 796, column: 50, scope: !853)
!868 = !DILocation(line: 796, column: 38, scope: !853)
!869 = !DILocation(line: 796, column: 13, scope: !853)
!870 = !DILocation(line: 797, column: 6, scope: !871)
!871 = distinct !DILexicalBlock(scope: !853, file: !74, line: 797, column: 6)
!872 = !DILocation(line: 797, column: 16, scope: !871)
!873 = !DILocation(line: 797, column: 6, scope: !853)
!874 = !DILocation(line: 799, column: 7, scope: !875)
!875 = distinct !DILexicalBlock(scope: !876, file: !74, line: 799, column: 7)
!876 = distinct !DILexicalBlock(scope: !871, file: !74, line: 798, column: 3)
!877 = !DILocation(line: 799, column: 17, scope: !875)
!878 = !DILocation(line: 799, column: 7, scope: !876)
!879 = !DILocation(line: 801, column: 17, scope: !880)
!880 = distinct !DILexicalBlock(scope: !875, file: !74, line: 800, column: 4)
!881 = !DILocation(line: 801, column: 12, scope: !880)
!882 = !DILocation(line: 801, column: 5, scope: !880)
!883 = !DILocation(line: 805, column: 5, scope: !884)
!884 = distinct !DILexicalBlock(scope: !875, file: !74, line: 804, column: 4)
!885 = !DILocation(line: 810, column: 4, scope: !886)
!886 = distinct !DILexicalBlock(scope: !871, file: !74, line: 809, column: 3)
!887 = !DILocation(line: 814, column: 1, scope: !822)
!888 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !74, file: !74, line: 832, type: !889, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!889 = !DISubroutineType(types: !890)
!890 = !{!18, !18, !18, !18}
!891 = !DILocalVariable(name: "factor1", arg: 1, scope: !888, file: !74, line: 832, type: !18)
!892 = !DILocation(line: 832, column: 33, scope: !888)
!893 = !DILocalVariable(name: "factor2", arg: 2, scope: !888, file: !74, line: 832, type: !18)
!894 = !DILocation(line: 832, column: 46, scope: !888)
!895 = !DILocalVariable(name: "denominator", arg: 3, scope: !888, file: !74, line: 832, type: !18)
!896 = !DILocation(line: 832, column: 59, scope: !888)
!897 = !DILocalVariable(name: "u32Temp1", scope: !888, file: !74, line: 834, type: !433)
!898 = !DILocation(line: 834, column: 6, scope: !888)
!899 = !DILocalVariable(name: "u16TempDenom", scope: !888, file: !74, line: 835, type: !18)
!900 = !DILocation(line: 835, column: 6, scope: !888)
!901 = !DILocation(line: 837, column: 5, scope: !902)
!902 = distinct !DILexicalBlock(scope: !888, file: !74, line: 837, column: 5)
!903 = !DILocation(line: 837, column: 17, scope: !902)
!904 = !DILocation(line: 837, column: 5, scope: !888)
!905 = !DILocation(line: 839, column: 3, scope: !906)
!906 = distinct !DILexicalBlock(scope: !902, file: !74, line: 838, column: 2)
!907 = !DILocation(line: 843, column: 14, scope: !908)
!908 = distinct !DILexicalBlock(scope: !902, file: !74, line: 842, column: 2)
!909 = !DILocation(line: 843, column: 24, scope: !908)
!910 = !DILocation(line: 843, column: 22, scope: !908)
!911 = !DILocation(line: 843, column: 12, scope: !908)
!912 = !DILocation(line: 844, column: 18, scope: !908)
!913 = !DILocation(line: 844, column: 30, scope: !908)
!914 = !DILocation(line: 844, column: 16, scope: !908)
!915 = !DILocation(line: 845, column: 14, scope: !908)
!916 = !DILocation(line: 845, column: 25, scope: !908)
!917 = !DILocation(line: 845, column: 23, scope: !908)
!918 = !DILocation(line: 845, column: 12, scope: !908)
!919 = !DILocation(line: 846, column: 14, scope: !908)
!920 = !DILocation(line: 846, column: 25, scope: !908)
!921 = !DILocation(line: 846, column: 23, scope: !908)
!922 = !DILocation(line: 846, column: 12, scope: !908)
!923 = !DILocation(line: 847, column: 6, scope: !924)
!924 = distinct !DILexicalBlock(scope: !908, file: !74, line: 847, column: 6)
!925 = !DILocation(line: 847, column: 15, scope: !924)
!926 = !DILocation(line: 847, column: 6, scope: !908)
!927 = !DILocation(line: 849, column: 12, scope: !928)
!928 = distinct !DILexicalBlock(scope: !924, file: !74, line: 848, column: 3)
!929 = !DILocation(line: 849, column: 21, scope: !928)
!930 = !DILocation(line: 849, column: 11, scope: !928)
!931 = !DILocation(line: 849, column: 4, scope: !928)
!932 = !DILocation(line: 854, column: 4, scope: !933)
!933 = distinct !DILexicalBlock(scope: !924, file: !74, line: 853, column: 3)
!934 = !DILocation(line: 859, column: 1, scope: !888)
!935 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !74, file: !74, line: 876, type: !936, scopeLine: 877, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!936 = !DISubroutineType(types: !937)
!937 = !{!18, !18, !18, !433}
!938 = !DILocalVariable(name: "factor1", arg: 1, scope: !935, file: !74, line: 876, type: !18)
!939 = !DILocation(line: 876, column: 33, scope: !935)
!940 = !DILocalVariable(name: "factor2", arg: 2, scope: !935, file: !74, line: 876, type: !18)
!941 = !DILocation(line: 876, column: 46, scope: !935)
!942 = !DILocalVariable(name: "denominator", arg: 3, scope: !935, file: !74, line: 876, type: !433)
!943 = !DILocation(line: 876, column: 59, scope: !935)
!944 = !DILocalVariable(name: "u32Temp1", scope: !935, file: !74, line: 878, type: !433)
!945 = !DILocation(line: 878, column: 6, scope: !935)
!946 = !DILocation(line: 879, column: 5, scope: !947)
!947 = distinct !DILexicalBlock(scope: !935, file: !74, line: 879, column: 5)
!948 = !DILocation(line: 879, column: 17, scope: !947)
!949 = !DILocation(line: 879, column: 5, scope: !935)
!950 = !DILocation(line: 881, column: 3, scope: !951)
!951 = distinct !DILexicalBlock(scope: !947, file: !74, line: 880, column: 2)
!952 = !DILocation(line: 885, column: 15, scope: !953)
!953 = distinct !DILexicalBlock(scope: !947, file: !74, line: 884, column: 2)
!954 = !DILocation(line: 885, column: 25, scope: !953)
!955 = !DILocation(line: 885, column: 23, scope: !953)
!956 = !DILocation(line: 885, column: 36, scope: !953)
!957 = !DILocation(line: 885, column: 34, scope: !953)
!958 = !DILocation(line: 885, column: 12, scope: !953)
!959 = !DILocation(line: 886, column: 8, scope: !960)
!960 = distinct !DILexicalBlock(scope: !953, file: !74, line: 886, column: 6)
!961 = !DILocation(line: 886, column: 18, scope: !960)
!962 = !DILocation(line: 886, column: 16, scope: !960)
!963 = !DILocation(line: 886, column: 28, scope: !960)
!964 = !DILocation(line: 886, column: 40, scope: !960)
!965 = !DILocation(line: 886, column: 39, scope: !960)
!966 = !DILocation(line: 886, column: 26, scope: !960)
!967 = !DILocation(line: 886, column: 53, scope: !960)
!968 = !DILocation(line: 886, column: 64, scope: !960)
!969 = !DILocation(line: 886, column: 50, scope: !960)
!970 = !DILocation(line: 886, column: 6, scope: !953)
!971 = !DILocation(line: 888, column: 12, scope: !972)
!972 = distinct !DILexicalBlock(scope: !960, file: !74, line: 887, column: 3)
!973 = !DILocation(line: 889, column: 3, scope: !972)
!974 = !DILocation(line: 890, column: 6, scope: !975)
!975 = distinct !DILexicalBlock(scope: !953, file: !74, line: 890, column: 6)
!976 = !DILocation(line: 890, column: 15, scope: !975)
!977 = !DILocation(line: 890, column: 6, scope: !953)
!978 = !DILocation(line: 892, column: 12, scope: !979)
!979 = distinct !DILexicalBlock(scope: !975, file: !74, line: 891, column: 3)
!980 = !DILocation(line: 892, column: 21, scope: !979)
!981 = !DILocation(line: 892, column: 11, scope: !979)
!982 = !DILocation(line: 892, column: 4, scope: !979)
!983 = !DILocation(line: 896, column: 4, scope: !984)
!984 = distinct !DILexicalBlock(scope: !975, file: !74, line: 895, column: 3)
!985 = !DILocation(line: 899, column: 1, scope: !935)
!986 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !74, file: !74, line: 916, type: !987, scopeLine: 917, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!987 = !DISubroutineType(types: !988)
!988 = !{!433, !433, !18}
!989 = !DILocalVariable(name: "x_value", arg: 1, scope: !986, file: !74, line: 916, type: !433)
!990 = !DILocation(line: 916, column: 25, scope: !986)
!991 = !DILocalVariable(name: "y_value", arg: 2, scope: !986, file: !74, line: 916, type: !18)
!992 = !DILocation(line: 916, column: 38, scope: !986)
!993 = !DILocalVariable(name: "u32Temp1", scope: !986, file: !74, line: 918, type: !433)
!994 = !DILocation(line: 918, column: 6, scope: !986)
!995 = !DILocation(line: 919, column: 5, scope: !996)
!996 = distinct !DILexicalBlock(scope: !986, file: !74, line: 919, column: 5)
!997 = !DILocation(line: 919, column: 13, scope: !996)
!998 = !DILocation(line: 919, column: 5, scope: !986)
!999 = !DILocation(line: 921, column: 3, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !996, file: !74, line: 920, column: 2)
!1001 = !DILocation(line: 925, column: 15, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !996, file: !74, line: 924, column: 2)
!1003 = !DILocation(line: 925, column: 26, scope: !1002)
!1004 = !DILocation(line: 925, column: 34, scope: !1002)
!1005 = !DILocation(line: 925, column: 33, scope: !1002)
!1006 = !DILocation(line: 925, column: 45, scope: !1002)
!1007 = !DILocation(line: 925, column: 43, scope: !1002)
!1008 = !DILocation(line: 925, column: 23, scope: !1002)
!1009 = !DILocation(line: 925, column: 54, scope: !1002)
!1010 = !DILocation(line: 925, column: 12, scope: !1002)
!1011 = !DILocation(line: 926, column: 15, scope: !1002)
!1012 = !DILocation(line: 926, column: 23, scope: !1002)
!1013 = !DILocation(line: 926, column: 22, scope: !1002)
!1014 = !DILocation(line: 926, column: 35, scope: !1002)
!1015 = !DILocation(line: 926, column: 44, scope: !1002)
!1016 = !DILocation(line: 926, column: 43, scope: !1002)
!1017 = !DILocation(line: 926, column: 32, scope: !1002)
!1018 = !DILocation(line: 926, column: 12, scope: !1002)
!1019 = !DILocation(line: 927, column: 10, scope: !1002)
!1020 = !DILocation(line: 927, column: 3, scope: !1002)
!1021 = !DILocation(line: 929, column: 1, scope: !986)
!1022 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !74, file: !74, line: 947, type: !1023, scopeLine: 948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!6, !6, !6, !6}
!1025 = !DILocalVariable(name: "fak1", arg: 1, scope: !1022, file: !74, line: 947, type: !6)
!1026 = !DILocation(line: 947, column: 33, scope: !1022)
!1027 = !DILocalVariable(name: "fak2", arg: 2, scope: !1022, file: !74, line: 947, type: !6)
!1028 = !DILocation(line: 947, column: 43, scope: !1022)
!1029 = !DILocalVariable(name: "div", arg: 3, scope: !1022, file: !74, line: 947, type: !6)
!1030 = !DILocation(line: 947, column: 53, scope: !1022)
!1031 = !DILocalVariable(name: "s32Temp1", scope: !1022, file: !74, line: 949, type: !25)
!1032 = !DILocation(line: 949, column: 6, scope: !1022)
!1033 = !DILocalVariable(name: "s32Temp2", scope: !1022, file: !74, line: 949, type: !25)
!1034 = !DILocation(line: 949, column: 20, scope: !1022)
!1035 = !DILocalVariable(name: "s32Temp3", scope: !1022, file: !74, line: 949, type: !25)
!1036 = !DILocation(line: 949, column: 34, scope: !1022)
!1037 = !DILocation(line: 950, column: 13, scope: !1022)
!1038 = !DILocation(line: 950, column: 20, scope: !1022)
!1039 = !DILocation(line: 950, column: 18, scope: !1022)
!1040 = !DILocation(line: 950, column: 11, scope: !1022)
!1041 = !DILocation(line: 951, column: 5, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1022, file: !74, line: 951, column: 5)
!1043 = !DILocation(line: 951, column: 9, scope: !1042)
!1044 = !DILocation(line: 951, column: 5, scope: !1022)
!1045 = !DILocation(line: 953, column: 6, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1047, file: !74, line: 953, column: 6)
!1047 = distinct !DILexicalBlock(scope: !1042, file: !74, line: 952, column: 2)
!1048 = !DILocation(line: 953, column: 15, scope: !1046)
!1049 = !DILocation(line: 953, column: 6, scope: !1047)
!1050 = !DILocation(line: 955, column: 4, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1046, file: !74, line: 954, column: 3)
!1052 = !DILocation(line: 959, column: 4, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1046, file: !74, line: 958, column: 3)
!1054 = !DILocation(line: 965, column: 46, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 965, column: 7)
!1056 = distinct !DILexicalBlock(scope: !1042, file: !74, line: 963, column: 2)
!1057 = !DILocation(line: 965, column: 36, scope: !1055)
!1058 = !DILocation(line: 965, column: 9, scope: !1055)
!1059 = !DILocation(line: 965, column: 7, scope: !1056)
!1060 = !DILocation(line: 966, column: 7, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1055, file: !74, line: 965, column: 54)
!1062 = !DILocation(line: 969, column: 63, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 969, column: 7)
!1064 = !DILocation(line: 969, column: 86, scope: !1063)
!1065 = !DILocation(line: 969, column: 102, scope: !1063)
!1066 = !DILocation(line: 969, column: 97, scope: !1063)
!1067 = !DILocation(line: 969, column: 95, scope: !1063)
!1068 = !DILocation(line: 969, column: 114, scope: !1063)
!1069 = !DILocation(line: 969, column: 109, scope: !1063)
!1070 = !DILocation(line: 969, column: 107, scope: !1063)
!1071 = !DILocation(line: 969, column: 72, scope: !1063)
!1072 = !DILocation(line: 969, column: 47, scope: !1063)
!1073 = !DILocation(line: 969, column: 9, scope: !1063)
!1074 = !DILocation(line: 969, column: 7, scope: !1056)
!1075 = !DILocation(line: 970, column: 7, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1063, file: !74, line: 969, column: 124)
!1077 = !DILocation(line: 973, column: 53, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 973, column: 7)
!1079 = !DILocation(line: 973, column: 76, scope: !1078)
!1080 = !DILocation(line: 973, column: 92, scope: !1078)
!1081 = !DILocation(line: 973, column: 87, scope: !1078)
!1082 = !DILocation(line: 973, column: 85, scope: !1078)
!1083 = !DILocation(line: 973, column: 104, scope: !1078)
!1084 = !DILocation(line: 973, column: 99, scope: !1078)
!1085 = !DILocation(line: 973, column: 97, scope: !1078)
!1086 = !DILocation(line: 973, column: 62, scope: !1078)
!1087 = !DILocation(line: 973, column: 37, scope: !1078)
!1088 = !DILocation(line: 973, column: 9, scope: !1078)
!1089 = !DILocation(line: 973, column: 7, scope: !1056)
!1090 = !DILocation(line: 974, column: 7, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1078, file: !74, line: 973, column: 129)
!1092 = !DILocation(line: 977, column: 50, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 977, column: 7)
!1094 = !DILocation(line: 977, column: 66, scope: !1093)
!1095 = !DILocation(line: 977, column: 61, scope: !1093)
!1096 = !DILocation(line: 977, column: 59, scope: !1093)
!1097 = !DILocation(line: 977, column: 34, scope: !1093)
!1098 = !DILocation(line: 977, column: 88, scope: !1093)
!1099 = !DILocation(line: 977, column: 83, scope: !1093)
!1100 = !DILocation(line: 977, column: 73, scope: !1093)
!1101 = !DILocation(line: 977, column: 9, scope: !1093)
!1102 = !DILocation(line: 977, column: 7, scope: !1056)
!1103 = !DILocation(line: 978, column: 7, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1093, file: !74, line: 977, column: 96)
!1105 = !DILocation(line: 981, column: 50, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 981, column: 7)
!1107 = !DILocation(line: 981, column: 66, scope: !1106)
!1108 = !DILocation(line: 981, column: 61, scope: !1106)
!1109 = !DILocation(line: 981, column: 59, scope: !1106)
!1110 = !DILocation(line: 981, column: 34, scope: !1106)
!1111 = !DILocation(line: 981, column: 88, scope: !1106)
!1112 = !DILocation(line: 981, column: 83, scope: !1106)
!1113 = !DILocation(line: 981, column: 73, scope: !1106)
!1114 = !DILocation(line: 981, column: 9, scope: !1106)
!1115 = !DILocation(line: 981, column: 7, scope: !1056)
!1116 = !DILocation(line: 982, column: 7, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1106, file: !74, line: 981, column: 96)
!1118 = !DILocation(line: 984, column: 15, scope: !1056)
!1119 = !DILocation(line: 984, column: 28, scope: !1056)
!1120 = !DILocation(line: 984, column: 39, scope: !1056)
!1121 = !DILocation(line: 984, column: 37, scope: !1056)
!1122 = !DILocation(line: 984, column: 46, scope: !1056)
!1123 = !DILocation(line: 984, column: 44, scope: !1056)
!1124 = !DILocation(line: 984, column: 24, scope: !1056)
!1125 = !DILocation(line: 984, column: 52, scope: !1056)
!1126 = !DILocation(line: 984, column: 12, scope: !1056)
!1127 = !DILocation(line: 986, column: 46, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 986, column: 7)
!1129 = !DILocation(line: 986, column: 36, scope: !1128)
!1130 = !DILocation(line: 986, column: 9, scope: !1128)
!1131 = !DILocation(line: 986, column: 7, scope: !1056)
!1132 = !DILocation(line: 987, column: 7, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 986, column: 54)
!1134 = !DILocation(line: 990, column: 50, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 990, column: 7)
!1136 = !DILocation(line: 990, column: 66, scope: !1135)
!1137 = !DILocation(line: 990, column: 61, scope: !1135)
!1138 = !DILocation(line: 990, column: 59, scope: !1135)
!1139 = !DILocation(line: 990, column: 34, scope: !1135)
!1140 = !DILocation(line: 990, column: 89, scope: !1135)
!1141 = !DILocation(line: 990, column: 105, scope: !1135)
!1142 = !DILocation(line: 990, column: 100, scope: !1135)
!1143 = !DILocation(line: 990, column: 98, scope: !1135)
!1144 = !DILocation(line: 990, column: 73, scope: !1135)
!1145 = !DILocation(line: 990, column: 9, scope: !1135)
!1146 = !DILocation(line: 990, column: 7, scope: !1056)
!1147 = !DILocation(line: 991, column: 7, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1135, file: !74, line: 990, column: 114)
!1149 = !DILocation(line: 994, column: 50, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1056, file: !74, line: 994, column: 7)
!1151 = !DILocation(line: 994, column: 66, scope: !1150)
!1152 = !DILocation(line: 994, column: 61, scope: !1150)
!1153 = !DILocation(line: 994, column: 59, scope: !1150)
!1154 = !DILocation(line: 994, column: 34, scope: !1150)
!1155 = !DILocation(line: 994, column: 89, scope: !1150)
!1156 = !DILocation(line: 994, column: 105, scope: !1150)
!1157 = !DILocation(line: 994, column: 100, scope: !1150)
!1158 = !DILocation(line: 994, column: 98, scope: !1150)
!1159 = !DILocation(line: 994, column: 73, scope: !1150)
!1160 = !DILocation(line: 994, column: 9, scope: !1150)
!1161 = !DILocation(line: 994, column: 7, scope: !1056)
!1162 = !DILocation(line: 995, column: 7, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1150, file: !74, line: 994, column: 114)
!1164 = !DILocation(line: 1002, column: 41, scope: !1056)
!1165 = !DILocation(line: 1002, column: 57, scope: !1056)
!1166 = !DILocation(line: 1002, column: 52, scope: !1056)
!1167 = !DILocation(line: 1002, column: 50, scope: !1056)
!1168 = !DILocation(line: 1002, column: 70, scope: !1056)
!1169 = !DILocation(line: 1002, column: 86, scope: !1056)
!1170 = !DILocation(line: 1002, column: 81, scope: !1056)
!1171 = !DILocation(line: 1002, column: 79, scope: !1056)
!1172 = !DILocation(line: 1002, column: 62, scope: !1056)
!1173 = !DILocation(line: 1002, column: 25, scope: !1056)
!1174 = !DILocation(line: 1002, column: 23, scope: !1056)
!1175 = !DILocation(line: 1003, column: 3, scope: !1056)
!1176 = !DILocation(line: 1020, column: 1, scope: !1022)
!1177 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !1178, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1178 = !DISubroutineType(types: !1179)
!1179 = !{!28, !22}
!1180 = !DILocalVariable(name: "denominator", arg: 1, scope: !1177, file: !33, line: 24, type: !22)
!1181 = !DILocation(line: 24, column: 40, scope: !1177)
!1182 = !DILocation(line: 26, column: 12, scope: !1177)
!1183 = !DILocation(line: 26, column: 24, scope: !1177)
!1184 = !DILocation(line: 26, column: 5, scope: !1177)
!1185 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !1178, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1186 = !DILocalVariable(name: "left", arg: 1, scope: !1185, file: !33, line: 84, type: !22)
!1187 = !DILocation(line: 84, column: 51, scope: !1185)
!1188 = !DILocation(line: 86, column: 12, scope: !1185)
!1189 = !DILocation(line: 86, column: 17, scope: !1185)
!1190 = !DILocation(line: 86, column: 5, scope: !1185)
!1191 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !1192, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1192 = !DISubroutineType(types: !1193)
!1193 = !{!28, !22, !29}
!1194 = !DILocalVariable(name: "left", arg: 1, scope: !1191, file: !33, line: 90, type: !22)
!1195 = !DILocation(line: 90, column: 41, scope: !1191)
!1196 = !DILocalVariable(name: "count", arg: 2, scope: !1191, file: !33, line: 90, type: !29)
!1197 = !DILocation(line: 90, column: 56, scope: !1191)
!1198 = !DILocation(line: 92, column: 9, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1191, file: !33, line: 92, column: 9)
!1200 = !DILocation(line: 92, column: 15, scope: !1199)
!1201 = !DILocation(line: 92, column: 9, scope: !1191)
!1202 = !DILocation(line: 93, column: 9, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1199, file: !33, line: 92, column: 32)
!1204 = !DILocation(line: 95, column: 12, scope: !1191)
!1205 = !DILocation(line: 95, column: 34, scope: !1191)
!1206 = !DILocation(line: 95, column: 31, scope: !1191)
!1207 = !DILocation(line: 95, column: 17, scope: !1191)
!1208 = !DILocation(line: 95, column: 41, scope: !1191)
!1209 = !DILocation(line: 95, column: 5, scope: !1191)
!1210 = !DILocation(line: 96, column: 1, scope: !1191)
!1211 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !1212, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1212 = !DISubroutineType(types: !1213)
!1213 = !{!28, !22, !22}
!1214 = !DILocalVariable(name: "left", arg: 1, scope: !1211, file: !33, line: 78, type: !22)
!1215 = !DILocation(line: 78, column: 38, scope: !1211)
!1216 = !DILocalVariable(name: "right", arg: 2, scope: !1211, file: !33, line: 78, type: !22)
!1217 = !DILocation(line: 78, column: 52, scope: !1211)
!1218 = !DILocation(line: 80, column: 12, scope: !1211)
!1219 = !DILocation(line: 80, column: 19, scope: !1211)
!1220 = !DILocation(line: 80, column: 17, scope: !1211)
!1221 = !DILocation(line: 80, column: 25, scope: !1211)
!1222 = !DILocation(line: 80, column: 5, scope: !1211)
!1223 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !1212, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1224 = !DILocalVariable(name: "left", arg: 1, scope: !1223, file: !33, line: 72, type: !22)
!1225 = !DILocation(line: 72, column: 38, scope: !1223)
!1226 = !DILocalVariable(name: "right", arg: 2, scope: !1223, file: !33, line: 72, type: !22)
!1227 = !DILocation(line: 72, column: 52, scope: !1223)
!1228 = !DILocation(line: 74, column: 12, scope: !1223)
!1229 = !DILocation(line: 74, column: 19, scope: !1223)
!1230 = !DILocation(line: 74, column: 17, scope: !1223)
!1231 = !DILocation(line: 74, column: 25, scope: !1223)
!1232 = !DILocation(line: 74, column: 5, scope: !1223)
!1233 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !1212, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1234 = !DILocalVariable(name: "left", arg: 1, scope: !1233, file: !33, line: 54, type: !22)
!1235 = !DILocation(line: 54, column: 38, scope: !1233)
!1236 = !DILocalVariable(name: "right", arg: 2, scope: !1233, file: !33, line: 54, type: !22)
!1237 = !DILocation(line: 54, column: 52, scope: !1233)
!1238 = !DILocation(line: 56, column: 12, scope: !1233)
!1239 = !DILocation(line: 56, column: 19, scope: !1233)
!1240 = !DILocation(line: 56, column: 17, scope: !1233)
!1241 = !DILocation(line: 56, column: 25, scope: !1233)
!1242 = !DILocation(line: 56, column: 5, scope: !1233)
!1243 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !1212, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1244 = !DILocalVariable(name: "left", arg: 1, scope: !1243, file: !33, line: 48, type: !22)
!1245 = !DILocation(line: 48, column: 38, scope: !1243)
!1246 = !DILocalVariable(name: "right", arg: 2, scope: !1243, file: !33, line: 48, type: !22)
!1247 = !DILocation(line: 48, column: 52, scope: !1243)
!1248 = !DILocation(line: 50, column: 12, scope: !1243)
!1249 = !DILocation(line: 50, column: 19, scope: !1243)
!1250 = !DILocation(line: 50, column: 17, scope: !1243)
!1251 = !DILocation(line: 50, column: 25, scope: !1243)
!1252 = !DILocation(line: 50, column: 5, scope: !1243)
!1253 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1038, type: !1254, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!6, !6, !6, !18}
!1256 = !DILocalVariable(name: "data1", arg: 1, scope: !1253, file: !74, line: 1038, type: !6)
!1257 = !DILocation(line: 1038, column: 33, scope: !1253)
!1258 = !DILocalVariable(name: "data2", arg: 2, scope: !1253, file: !74, line: 1038, type: !6)
!1259 = !DILocation(line: 1038, column: 43, scope: !1253)
!1260 = !DILocalVariable(name: "denominator", arg: 3, scope: !1253, file: !74, line: 1038, type: !18)
!1261 = !DILocation(line: 1038, column: 53, scope: !1253)
!1262 = !DILocalVariable(name: "s32Result", scope: !1253, file: !74, line: 1040, type: !25)
!1263 = !DILocation(line: 1040, column: 6, scope: !1253)
!1264 = !DILocalVariable(name: "s32Temp1", scope: !1253, file: !74, line: 1040, type: !25)
!1265 = !DILocation(line: 1040, column: 21, scope: !1253)
!1266 = !DILocation(line: 1041, column: 14, scope: !1253)
!1267 = !DILocation(line: 1041, column: 22, scope: !1253)
!1268 = !DILocation(line: 1041, column: 20, scope: !1253)
!1269 = !DILocation(line: 1041, column: 12, scope: !1253)
!1270 = !DILocation(line: 1043, column: 5, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1253, file: !74, line: 1043, column: 5)
!1272 = !DILocation(line: 1043, column: 17, scope: !1271)
!1273 = !DILocation(line: 1043, column: 5, scope: !1253)
!1274 = !DILocation(line: 1045, column: 6, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1276, file: !74, line: 1045, column: 6)
!1276 = distinct !DILexicalBlock(scope: !1271, file: !74, line: 1044, column: 2)
!1277 = !DILocation(line: 1045, column: 16, scope: !1275)
!1278 = !DILocation(line: 1045, column: 6, scope: !1276)
!1279 = !DILocation(line: 1047, column: 4, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1275, file: !74, line: 1046, column: 3)
!1281 = !DILocation(line: 1049, column: 11, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1275, file: !74, line: 1049, column: 11)
!1283 = !DILocation(line: 1049, column: 21, scope: !1282)
!1284 = !DILocation(line: 1049, column: 11, scope: !1275)
!1285 = !DILocation(line: 1051, column: 4, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1282, file: !74, line: 1050, column: 3)
!1287 = !DILocation(line: 1055, column: 4, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1282, file: !74, line: 1054, column: 3)
!1289 = !DILocation(line: 1060, column: 15, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1271, file: !74, line: 1059, column: 2)
!1291 = !DILocation(line: 1060, column: 28, scope: !1290)
!1292 = !DILocation(line: 1060, column: 38, scope: !1290)
!1293 = !DILocation(line: 1060, column: 37, scope: !1290)
!1294 = !DILocation(line: 1060, column: 51, scope: !1290)
!1295 = !DILocation(line: 1060, column: 50, scope: !1290)
!1296 = !DILocation(line: 1060, column: 25, scope: !1290)
!1297 = !DILocation(line: 1060, column: 64, scope: !1290)
!1298 = !DILocation(line: 1060, column: 12, scope: !1290)
!1299 = !DILocation(line: 1061, column: 16, scope: !1290)
!1300 = !DILocation(line: 1061, column: 25, scope: !1290)
!1301 = !DILocation(line: 1061, column: 24, scope: !1290)
!1302 = !DILocation(line: 1061, column: 41, scope: !1290)
!1303 = !DILocation(line: 1061, column: 51, scope: !1290)
!1304 = !DILocation(line: 1061, column: 50, scope: !1290)
!1305 = !DILocation(line: 1061, column: 38, scope: !1290)
!1306 = !DILocation(line: 1061, column: 13, scope: !1290)
!1307 = !DILocation(line: 1062, column: 6, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1290, file: !74, line: 1062, column: 6)
!1309 = !DILocation(line: 1062, column: 16, scope: !1308)
!1310 = !DILocation(line: 1062, column: 6, scope: !1290)
!1311 = !DILocation(line: 1064, column: 7, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !74, line: 1064, column: 7)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !74, line: 1063, column: 3)
!1314 = !DILocation(line: 1064, column: 17, scope: !1312)
!1315 = !DILocation(line: 1064, column: 7, scope: !1313)
!1316 = !DILocation(line: 1066, column: 17, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1312, file: !74, line: 1065, column: 4)
!1318 = !DILocation(line: 1066, column: 12, scope: !1317)
!1319 = !DILocation(line: 1066, column: 5, scope: !1317)
!1320 = !DILocation(line: 1070, column: 5, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1312, file: !74, line: 1069, column: 4)
!1322 = !DILocation(line: 1075, column: 4, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1308, file: !74, line: 1074, column: 3)
!1324 = !DILocation(line: 1079, column: 1, scope: !1253)
!1325 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1096, type: !1326, scopeLine: 1097, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1326 = !DISubroutineType(types: !1327)
!1327 = !{!433, !433, !25}
!1328 = !DILocalVariable(name: "numerator", arg: 1, scope: !1325, file: !74, line: 1096, type: !433)
!1329 = !DILocation(line: 1096, column: 25, scope: !1325)
!1330 = !DILocalVariable(name: "denominator", arg: 2, scope: !1325, file: !74, line: 1096, type: !25)
!1331 = !DILocation(line: 1096, column: 40, scope: !1325)
!1332 = !DILocalVariable(name: "u32Temp1", scope: !1325, file: !74, line: 1098, type: !433)
!1333 = !DILocation(line: 1098, column: 6, scope: !1325)
!1334 = !DILocation(line: 1099, column: 5, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1325, file: !74, line: 1099, column: 5)
!1336 = !DILocation(line: 1099, column: 17, scope: !1335)
!1337 = !DILocation(line: 1099, column: 5, scope: !1325)
!1338 = !DILocation(line: 1101, column: 3, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1335, file: !74, line: 1100, column: 2)
!1340 = !DILocation(line: 1105, column: 6, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1342, file: !74, line: 1105, column: 6)
!1342 = distinct !DILexicalBlock(scope: !1335, file: !74, line: 1104, column: 2)
!1343 = !DILocation(line: 1105, column: 18, scope: !1341)
!1344 = !DILocation(line: 1105, column: 6, scope: !1342)
!1345 = !DILocation(line: 1107, column: 4, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !74, line: 1106, column: 3)
!1347 = !DILocation(line: 1111, column: 16, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1341, file: !74, line: 1110, column: 3)
!1349 = !DILocation(line: 1111, column: 30, scope: !1348)
!1350 = !DILocation(line: 1111, column: 40, scope: !1348)
!1351 = !DILocation(line: 1111, column: 39, scope: !1348)
!1352 = !DILocation(line: 1111, column: 55, scope: !1348)
!1353 = !DILocation(line: 1111, column: 53, scope: !1348)
!1354 = !DILocation(line: 1111, column: 26, scope: !1348)
!1355 = !DILocation(line: 1111, column: 68, scope: !1348)
!1356 = !DILocation(line: 1111, column: 13, scope: !1348)
!1357 = !DILocation(line: 1112, column: 16, scope: !1348)
!1358 = !DILocation(line: 1112, column: 25, scope: !1348)
!1359 = !DILocation(line: 1112, column: 24, scope: !1348)
!1360 = !DILocation(line: 1112, column: 41, scope: !1348)
!1361 = !DILocation(line: 1112, column: 51, scope: !1348)
!1362 = !DILocation(line: 1112, column: 50, scope: !1348)
!1363 = !DILocation(line: 1112, column: 38, scope: !1348)
!1364 = !DILocation(line: 1112, column: 13, scope: !1348)
!1365 = !DILocation(line: 1113, column: 11, scope: !1348)
!1366 = !DILocation(line: 1113, column: 4, scope: !1348)
!1367 = !DILocation(line: 1116, column: 1, scope: !1325)
!1368 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1133, type: !1369, scopeLine: 1134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!433, !25, !433}
!1371 = !DILocalVariable(name: "numerator", arg: 1, scope: !1368, file: !74, line: 1133, type: !25)
!1372 = !DILocation(line: 1133, column: 25, scope: !1368)
!1373 = !DILocalVariable(name: "denominator", arg: 2, scope: !1368, file: !74, line: 1133, type: !433)
!1374 = !DILocation(line: 1133, column: 40, scope: !1368)
!1375 = !DILocalVariable(name: "s32Temp1", scope: !1368, file: !74, line: 1135, type: !25)
!1376 = !DILocation(line: 1135, column: 6, scope: !1368)
!1377 = !DILocation(line: 1136, column: 5, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1368, file: !74, line: 1136, column: 5)
!1379 = !DILocation(line: 1136, column: 17, scope: !1378)
!1380 = !DILocation(line: 1136, column: 5, scope: !1368)
!1381 = !DILocation(line: 1138, column: 6, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1383, file: !74, line: 1138, column: 6)
!1383 = distinct !DILexicalBlock(scope: !1378, file: !74, line: 1137, column: 2)
!1384 = !DILocation(line: 1138, column: 16, scope: !1382)
!1385 = !DILocation(line: 1138, column: 6, scope: !1383)
!1386 = !DILocation(line: 1140, column: 4, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1382, file: !74, line: 1139, column: 3)
!1388 = !DILocation(line: 1144, column: 4, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1382, file: !74, line: 1143, column: 3)
!1390 = !DILocation(line: 1149, column: 6, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1392, file: !74, line: 1149, column: 6)
!1392 = distinct !DILexicalBlock(scope: !1378, file: !74, line: 1148, column: 2)
!1393 = !DILocation(line: 1149, column: 16, scope: !1391)
!1394 = !DILocation(line: 1149, column: 6, scope: !1392)
!1395 = !DILocation(line: 1151, column: 17, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1391, file: !74, line: 1150, column: 3)
!1397 = !DILocation(line: 1151, column: 31, scope: !1396)
!1398 = !DILocation(line: 1151, column: 41, scope: !1396)
!1399 = !DILocation(line: 1151, column: 40, scope: !1396)
!1400 = !DILocation(line: 1151, column: 56, scope: !1396)
!1401 = !DILocation(line: 1151, column: 54, scope: !1396)
!1402 = !DILocation(line: 1151, column: 27, scope: !1396)
!1403 = !DILocation(line: 1151, column: 69, scope: !1396)
!1404 = !DILocation(line: 1151, column: 13, scope: !1396)
!1405 = !DILocation(line: 1152, column: 13, scope: !1396)
!1406 = !DILocation(line: 1152, column: 23, scope: !1396)
!1407 = !DILocation(line: 1152, column: 22, scope: !1396)
!1408 = !DILocation(line: 1152, column: 39, scope: !1396)
!1409 = !DILocation(line: 1152, column: 48, scope: !1396)
!1410 = !DILocation(line: 1152, column: 47, scope: !1396)
!1411 = !DILocation(line: 1152, column: 36, scope: !1396)
!1412 = !DILocation(line: 1152, column: 4, scope: !1396)
!1413 = !DILocation(line: 1156, column: 4, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1391, file: !74, line: 1155, column: 3)
!1415 = !DILocation(line: 1159, column: 1, scope: !1368)
!1416 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1176, type: !1417, scopeLine: 1177, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!433, !25, !25}
!1419 = !DILocalVariable(name: "numerator", arg: 1, scope: !1416, file: !74, line: 1176, type: !25)
!1420 = !DILocation(line: 1176, column: 25, scope: !1416)
!1421 = !DILocalVariable(name: "denominator", arg: 2, scope: !1416, file: !74, line: 1176, type: !25)
!1422 = !DILocation(line: 1176, column: 40, scope: !1416)
!1423 = !DILocalVariable(name: "u32Temp1", scope: !1416, file: !74, line: 1178, type: !433)
!1424 = !DILocation(line: 1178, column: 6, scope: !1416)
!1425 = !DILocalVariable(name: "u32Temp2", scope: !1416, file: !74, line: 1178, type: !433)
!1426 = !DILocation(line: 1178, column: 20, scope: !1416)
!1427 = !DILocation(line: 1179, column: 5, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1416, file: !74, line: 1179, column: 5)
!1429 = !DILocation(line: 1179, column: 17, scope: !1428)
!1430 = !DILocation(line: 1179, column: 5, scope: !1416)
!1431 = !DILocation(line: 1181, column: 6, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1433, file: !74, line: 1181, column: 6)
!1433 = distinct !DILexicalBlock(scope: !1428, file: !74, line: 1180, column: 2)
!1434 = !DILocation(line: 1181, column: 16, scope: !1432)
!1435 = !DILocation(line: 1181, column: 6, scope: !1433)
!1436 = !DILocation(line: 1183, column: 4, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1432, file: !74, line: 1182, column: 3)
!1438 = !DILocation(line: 1187, column: 4, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1432, file: !74, line: 1186, column: 3)
!1440 = !DILocation(line: 1192, column: 6, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1442, file: !74, line: 1192, column: 6)
!1442 = distinct !DILexicalBlock(scope: !1428, file: !74, line: 1191, column: 2)
!1443 = !DILocation(line: 1192, column: 16, scope: !1441)
!1444 = !DILocation(line: 1192, column: 6, scope: !1442)
!1445 = !DILocation(line: 1194, column: 7, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1447, file: !74, line: 1194, column: 7)
!1447 = distinct !DILexicalBlock(scope: !1441, file: !74, line: 1193, column: 3)
!1448 = !DILocation(line: 1194, column: 17, scope: !1446)
!1449 = !DILocation(line: 1194, column: 7, scope: !1447)
!1450 = !DILocation(line: 1196, column: 5, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1446, file: !74, line: 1195, column: 4)
!1452 = !DILocation(line: 1200, column: 8, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1454, file: !74, line: 1200, column: 8)
!1454 = distinct !DILexicalBlock(scope: !1446, file: !74, line: 1199, column: 4)
!1455 = !DILocation(line: 1200, column: 20, scope: !1453)
!1456 = !DILocation(line: 1200, column: 8, scope: !1454)
!1457 = !DILocation(line: 1202, column: 6, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1453, file: !74, line: 1201, column: 5)
!1459 = !DILocation(line: 1206, column: 18, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1453, file: !74, line: 1205, column: 5)
!1461 = !DILocation(line: 1206, column: 32, scope: !1460)
!1462 = !DILocation(line: 1206, column: 42, scope: !1460)
!1463 = !DILocation(line: 1206, column: 41, scope: !1460)
!1464 = !DILocation(line: 1206, column: 57, scope: !1460)
!1465 = !DILocation(line: 1206, column: 55, scope: !1460)
!1466 = !DILocation(line: 1206, column: 28, scope: !1460)
!1467 = !DILocation(line: 1206, column: 71, scope: !1460)
!1468 = !DILocation(line: 1206, column: 15, scope: !1460)
!1469 = !DILocation(line: 1207, column: 18, scope: !1460)
!1470 = !DILocation(line: 1207, column: 29, scope: !1460)
!1471 = !DILocation(line: 1207, column: 27, scope: !1460)
!1472 = !DILocation(line: 1207, column: 45, scope: !1460)
!1473 = !DILocation(line: 1207, column: 57, scope: !1460)
!1474 = !DILocation(line: 1207, column: 55, scope: !1460)
!1475 = !DILocation(line: 1207, column: 42, scope: !1460)
!1476 = !DILocation(line: 1207, column: 15, scope: !1460)
!1477 = !DILocation(line: 1208, column: 13, scope: !1460)
!1478 = !DILocation(line: 1208, column: 6, scope: !1460)
!1479 = !DILocation(line: 1214, column: 7, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1481, file: !74, line: 1214, column: 7)
!1481 = distinct !DILexicalBlock(scope: !1441, file: !74, line: 1213, column: 3)
!1482 = !DILocation(line: 1214, column: 19, scope: !1480)
!1483 = !DILocation(line: 1214, column: 7, scope: !1481)
!1484 = !DILocation(line: 1216, column: 5, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1480, file: !74, line: 1215, column: 4)
!1486 = !DILocation(line: 1220, column: 18, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1480, file: !74, line: 1219, column: 4)
!1488 = !DILocation(line: 1220, column: 17, scope: !1487)
!1489 = !DILocation(line: 1220, column: 15, scope: !1487)
!1490 = !DILocation(line: 1221, column: 20, scope: !1487)
!1491 = !DILocation(line: 1221, column: 19, scope: !1487)
!1492 = !DILocation(line: 1221, column: 17, scope: !1487)
!1493 = !DILocation(line: 1222, column: 17, scope: !1487)
!1494 = !DILocation(line: 1222, column: 31, scope: !1487)
!1495 = !DILocation(line: 1222, column: 41, scope: !1487)
!1496 = !DILocation(line: 1222, column: 40, scope: !1487)
!1497 = !DILocation(line: 1222, column: 56, scope: !1487)
!1498 = !DILocation(line: 1222, column: 54, scope: !1487)
!1499 = !DILocation(line: 1222, column: 27, scope: !1487)
!1500 = !DILocation(line: 1222, column: 70, scope: !1487)
!1501 = !DILocation(line: 1222, column: 14, scope: !1487)
!1502 = !DILocation(line: 1223, column: 17, scope: !1487)
!1503 = !DILocation(line: 1223, column: 28, scope: !1487)
!1504 = !DILocation(line: 1223, column: 26, scope: !1487)
!1505 = !DILocation(line: 1223, column: 44, scope: !1487)
!1506 = !DILocation(line: 1223, column: 56, scope: !1487)
!1507 = !DILocation(line: 1223, column: 54, scope: !1487)
!1508 = !DILocation(line: 1223, column: 41, scope: !1487)
!1509 = !DILocation(line: 1223, column: 14, scope: !1487)
!1510 = !DILocation(line: 1224, column: 12, scope: !1487)
!1511 = !DILocation(line: 1224, column: 5, scope: !1487)
!1512 = !DILocation(line: 1229, column: 1, scope: !1416)
!1513 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1246, type: !1514, scopeLine: 1247, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!433, !433, !433}
!1516 = !DILocalVariable(name: "numerator", arg: 1, scope: !1513, file: !74, line: 1246, type: !433)
!1517 = !DILocation(line: 1246, column: 25, scope: !1513)
!1518 = !DILocalVariable(name: "denominator", arg: 2, scope: !1513, file: !74, line: 1246, type: !433)
!1519 = !DILocation(line: 1246, column: 40, scope: !1513)
!1520 = !DILocalVariable(name: "u32Temp1", scope: !1513, file: !74, line: 1249, type: !433)
!1521 = !DILocation(line: 1249, column: 6, scope: !1513)
!1522 = !DILocalVariable(name: "u32Temp2", scope: !1513, file: !74, line: 1249, type: !433)
!1523 = !DILocation(line: 1249, column: 20, scope: !1513)
!1524 = !DILocalVariable(name: "u32Temp3", scope: !1513, file: !74, line: 1249, type: !433)
!1525 = !DILocation(line: 1249, column: 34, scope: !1513)
!1526 = !DILocalVariable(name: "numerator_old", scope: !1513, file: !74, line: 1249, type: !433)
!1527 = !DILocation(line: 1249, column: 48, scope: !1513)
!1528 = !DILocation(line: 1250, column: 5, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1513, file: !74, line: 1250, column: 5)
!1530 = !DILocation(line: 1250, column: 16, scope: !1529)
!1531 = !DILocation(line: 1250, column: 5, scope: !1513)
!1532 = !DILocation(line: 1252, column: 3, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1529, file: !74, line: 1251, column: 2)
!1534 = !DILocation(line: 1256, column: 14, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1529, file: !74, line: 1255, column: 2)
!1536 = !DILocation(line: 1256, column: 26, scope: !1535)
!1537 = !DILocation(line: 1256, column: 41, scope: !1535)
!1538 = !DILocation(line: 1256, column: 51, scope: !1535)
!1539 = !DILocation(line: 1256, column: 50, scope: !1535)
!1540 = !DILocation(line: 1256, column: 38, scope: !1535)
!1541 = !DILocation(line: 1256, column: 24, scope: !1535)
!1542 = !DILocation(line: 1256, column: 12, scope: !1535)
!1543 = !DILocation(line: 1257, column: 7, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1535, file: !74, line: 1257, column: 6)
!1545 = !DILocation(line: 1257, column: 16, scope: !1544)
!1546 = !DILocation(line: 1257, column: 24, scope: !1544)
!1547 = !DILocation(line: 1257, column: 6, scope: !1535)
!1548 = !DILocation(line: 1259, column: 16, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1544, file: !74, line: 1258, column: 3)
!1550 = !DILocation(line: 1259, column: 27, scope: !1549)
!1551 = !DILocation(line: 1259, column: 13, scope: !1549)
!1552 = !DILocation(line: 1260, column: 3, scope: !1549)
!1553 = !DILocation(line: 1263, column: 16, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1544, file: !74, line: 1262, column: 3)
!1555 = !DILocation(line: 1263, column: 27, scope: !1554)
!1556 = !DILocation(line: 1263, column: 32, scope: !1554)
!1557 = !DILocation(line: 1263, column: 13, scope: !1554)
!1558 = !DILocation(line: 1266, column: 6, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1535, file: !74, line: 1266, column: 6)
!1560 = !DILocation(line: 1266, column: 17, scope: !1559)
!1561 = !DILocation(line: 1266, column: 15, scope: !1559)
!1562 = !DILocation(line: 1266, column: 6, scope: !1535)
!1563 = !DILocation(line: 1268, column: 12, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1559, file: !74, line: 1267, column: 3)
!1565 = !DILocation(line: 1268, column: 22, scope: !1564)
!1566 = !DILocation(line: 1268, column: 21, scope: !1564)
!1567 = !DILocation(line: 1268, column: 4, scope: !1564)
!1568 = !DILocation(line: 1272, column: 13, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1559, file: !74, line: 1271, column: 3)
!1570 = !DILocation(line: 1272, column: 23, scope: !1569)
!1571 = !DILocation(line: 1272, column: 22, scope: !1569)
!1572 = !DILocation(line: 1272, column: 36, scope: !1569)
!1573 = !DILocation(line: 1272, column: 4, scope: !1569)
!1574 = !DILocation(line: 1277, column: 1, scope: !1513)
!1575 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1294, type: !1576, scopeLine: 1295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!25, !433, !25}
!1578 = !DILocalVariable(name: "numerator", arg: 1, scope: !1575, file: !74, line: 1294, type: !433)
!1579 = !DILocation(line: 1294, column: 25, scope: !1575)
!1580 = !DILocalVariable(name: "denominator", arg: 2, scope: !1575, file: !74, line: 1294, type: !25)
!1581 = !DILocation(line: 1294, column: 40, scope: !1575)
!1582 = !DILocalVariable(name: "u32Temp1", scope: !1575, file: !74, line: 1296, type: !433)
!1583 = !DILocation(line: 1296, column: 6, scope: !1575)
!1584 = !DILocalVariable(name: "u32Temp2", scope: !1575, file: !74, line: 1296, type: !433)
!1585 = !DILocation(line: 1296, column: 20, scope: !1575)
!1586 = !DILocation(line: 1297, column: 5, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1575, file: !74, line: 1297, column: 5)
!1588 = !DILocation(line: 1297, column: 17, scope: !1587)
!1589 = !DILocation(line: 1297, column: 5, scope: !1575)
!1590 = !DILocation(line: 1299, column: 6, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1592, file: !74, line: 1299, column: 6)
!1592 = distinct !DILexicalBlock(scope: !1587, file: !74, line: 1298, column: 2)
!1593 = !DILocation(line: 1299, column: 18, scope: !1591)
!1594 = !DILocation(line: 1299, column: 6, scope: !1592)
!1595 = !DILocation(line: 1301, column: 4, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1591, file: !74, line: 1300, column: 3)
!1597 = !DILocation(line: 1305, column: 19, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1591, file: !74, line: 1304, column: 3)
!1599 = !DILocation(line: 1305, column: 18, scope: !1598)
!1600 = !DILocation(line: 1305, column: 16, scope: !1598)
!1601 = !DILocation(line: 1306, column: 16, scope: !1598)
!1602 = !DILocation(line: 1306, column: 30, scope: !1598)
!1603 = !DILocation(line: 1306, column: 40, scope: !1598)
!1604 = !DILocation(line: 1306, column: 39, scope: !1598)
!1605 = !DILocation(line: 1306, column: 55, scope: !1598)
!1606 = !DILocation(line: 1306, column: 53, scope: !1598)
!1607 = !DILocation(line: 1306, column: 26, scope: !1598)
!1608 = !DILocation(line: 1306, column: 69, scope: !1598)
!1609 = !DILocation(line: 1306, column: 13, scope: !1598)
!1610 = !DILocation(line: 1307, column: 16, scope: !1598)
!1611 = !DILocation(line: 1307, column: 25, scope: !1598)
!1612 = !DILocation(line: 1307, column: 24, scope: !1598)
!1613 = !DILocation(line: 1307, column: 41, scope: !1598)
!1614 = !DILocation(line: 1307, column: 51, scope: !1598)
!1615 = !DILocation(line: 1307, column: 50, scope: !1598)
!1616 = !DILocation(line: 1307, column: 38, scope: !1598)
!1617 = !DILocation(line: 1307, column: 13, scope: !1598)
!1618 = !DILocation(line: 1308, column: 7, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1598, file: !74, line: 1308, column: 7)
!1620 = !DILocation(line: 1308, column: 16, scope: !1619)
!1621 = !DILocation(line: 1308, column: 7, scope: !1598)
!1622 = !DILocation(line: 1310, column: 13, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1619, file: !74, line: 1309, column: 4)
!1624 = !DILocation(line: 1310, column: 12, scope: !1623)
!1625 = !DILocation(line: 1310, column: 5, scope: !1623)
!1626 = !DILocation(line: 1314, column: 5, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1619, file: !74, line: 1313, column: 4)
!1628 = !DILocation(line: 1320, column: 15, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1587, file: !74, line: 1319, column: 2)
!1630 = !DILocation(line: 1320, column: 29, scope: !1629)
!1631 = !DILocation(line: 1320, column: 39, scope: !1629)
!1632 = !DILocation(line: 1320, column: 38, scope: !1629)
!1633 = !DILocation(line: 1320, column: 54, scope: !1629)
!1634 = !DILocation(line: 1320, column: 52, scope: !1629)
!1635 = !DILocation(line: 1320, column: 25, scope: !1629)
!1636 = !DILocation(line: 1320, column: 68, scope: !1629)
!1637 = !DILocation(line: 1320, column: 12, scope: !1629)
!1638 = !DILocation(line: 1321, column: 15, scope: !1629)
!1639 = !DILocation(line: 1321, column: 24, scope: !1629)
!1640 = !DILocation(line: 1321, column: 23, scope: !1629)
!1641 = !DILocation(line: 1321, column: 40, scope: !1629)
!1642 = !DILocation(line: 1321, column: 50, scope: !1629)
!1643 = !DILocation(line: 1321, column: 49, scope: !1629)
!1644 = !DILocation(line: 1321, column: 37, scope: !1629)
!1645 = !DILocation(line: 1321, column: 12, scope: !1629)
!1646 = !DILocation(line: 1322, column: 6, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1629, file: !74, line: 1322, column: 6)
!1648 = !DILocation(line: 1322, column: 15, scope: !1647)
!1649 = !DILocation(line: 1322, column: 6, scope: !1629)
!1650 = !DILocation(line: 1324, column: 11, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1323, column: 3)
!1652 = !DILocation(line: 1324, column: 4, scope: !1651)
!1653 = !DILocation(line: 1328, column: 4, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1327, column: 3)
!1655 = !DILocation(line: 1331, column: 1, scope: !1575)
!1656 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1349, type: !1657, scopeLine: 1350, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1657 = !DISubroutineType(types: !1658)
!1658 = !{!25, !25, !433}
!1659 = !DILocalVariable(name: "numerator", arg: 1, scope: !1656, file: !74, line: 1349, type: !25)
!1660 = !DILocation(line: 1349, column: 25, scope: !1656)
!1661 = !DILocalVariable(name: "denominator", arg: 2, scope: !1656, file: !74, line: 1349, type: !433)
!1662 = !DILocation(line: 1349, column: 40, scope: !1656)
!1663 = !DILocalVariable(name: "s32Temp1", scope: !1656, file: !74, line: 1351, type: !25)
!1664 = !DILocation(line: 1351, column: 6, scope: !1656)
!1665 = !DILocalVariable(name: "s32Temp2", scope: !1656, file: !74, line: 1351, type: !25)
!1666 = !DILocation(line: 1351, column: 20, scope: !1656)
!1667 = !DILocalVariable(name: "u32Temp0", scope: !1656, file: !74, line: 1352, type: !433)
!1668 = !DILocation(line: 1352, column: 6, scope: !1656)
!1669 = !DILocalVariable(name: "u32Temp1", scope: !1656, file: !74, line: 1352, type: !433)
!1670 = !DILocation(line: 1352, column: 20, scope: !1656)
!1671 = !DILocalVariable(name: "u32Temp2", scope: !1656, file: !74, line: 1352, type: !433)
!1672 = !DILocation(line: 1352, column: 34, scope: !1656)
!1673 = !DILocation(line: 1353, column: 5, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1656, file: !74, line: 1353, column: 5)
!1675 = !DILocation(line: 1353, column: 17, scope: !1674)
!1676 = !DILocation(line: 1353, column: 5, scope: !1656)
!1677 = !DILocation(line: 1355, column: 6, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1679, file: !74, line: 1355, column: 6)
!1679 = distinct !DILexicalBlock(scope: !1674, file: !74, line: 1354, column: 2)
!1680 = !DILocation(line: 1355, column: 16, scope: !1678)
!1681 = !DILocation(line: 1355, column: 6, scope: !1679)
!1682 = !DILocation(line: 1357, column: 4, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1678, file: !74, line: 1356, column: 3)
!1684 = !DILocation(line: 1361, column: 4, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1678, file: !74, line: 1360, column: 3)
!1686 = !DILocation(line: 1366, column: 6, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1688, file: !74, line: 1366, column: 6)
!1688 = distinct !DILexicalBlock(scope: !1674, file: !74, line: 1365, column: 2)
!1689 = !DILocation(line: 1366, column: 16, scope: !1687)
!1690 = !DILocation(line: 1366, column: 6, scope: !1688)
!1691 = !DILocation(line: 1368, column: 16, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1687, file: !74, line: 1367, column: 3)
!1693 = !DILocation(line: 1368, column: 15, scope: !1692)
!1694 = !DILocation(line: 1368, column: 13, scope: !1692)
!1695 = !DILocation(line: 1369, column: 16, scope: !1692)
!1696 = !DILocation(line: 1369, column: 25, scope: !1692)
!1697 = !DILocation(line: 1369, column: 24, scope: !1692)
!1698 = !DILocation(line: 1369, column: 13, scope: !1692)
!1699 = !DILocation(line: 1370, column: 15, scope: !1692)
!1700 = !DILocation(line: 1370, column: 28, scope: !1692)
!1701 = !DILocation(line: 1370, column: 37, scope: !1692)
!1702 = !DILocation(line: 1370, column: 36, scope: !1692)
!1703 = !DILocation(line: 1370, column: 52, scope: !1692)
!1704 = !DILocation(line: 1370, column: 50, scope: !1692)
!1705 = !DILocation(line: 1370, column: 24, scope: !1692)
!1706 = !DILocation(line: 1370, column: 13, scope: !1692)
!1707 = !DILocation(line: 1372, column: 8, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1692, file: !74, line: 1372, column: 7)
!1709 = !DILocation(line: 1372, column: 20, scope: !1708)
!1710 = !DILocation(line: 1372, column: 27, scope: !1708)
!1711 = !DILocation(line: 1372, column: 7, scope: !1692)
!1712 = !DILocation(line: 1374, column: 20, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1708, file: !74, line: 1373, column: 4)
!1714 = !DILocation(line: 1374, column: 32, scope: !1713)
!1715 = !DILocation(line: 1374, column: 17, scope: !1713)
!1716 = !DILocation(line: 1375, column: 4, scope: !1713)
!1717 = !DILocation(line: 1378, column: 20, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1708, file: !74, line: 1377, column: 4)
!1719 = !DILocation(line: 1378, column: 32, scope: !1718)
!1720 = !DILocation(line: 1378, column: 38, scope: !1718)
!1721 = !DILocation(line: 1378, column: 17, scope: !1718)
!1722 = !DILocation(line: 1382, column: 7, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1692, file: !74, line: 1382, column: 7)
!1724 = !DILocation(line: 1382, column: 18, scope: !1723)
!1725 = !DILocation(line: 1382, column: 16, scope: !1723)
!1726 = !DILocation(line: 1382, column: 7, scope: !1692)
!1727 = !DILocation(line: 1384, column: 14, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1723, file: !74, line: 1383, column: 4)
!1729 = !DILocation(line: 1384, column: 13, scope: !1728)
!1730 = !DILocation(line: 1384, column: 23, scope: !1728)
!1731 = !DILocation(line: 1384, column: 5, scope: !1728)
!1732 = !DILocation(line: 1388, column: 14, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1723, file: !74, line: 1387, column: 4)
!1734 = !DILocation(line: 1388, column: 23, scope: !1733)
!1735 = !DILocation(line: 1388, column: 12, scope: !1733)
!1736 = !DILocation(line: 1388, column: 27, scope: !1733)
!1737 = !DILocation(line: 1388, column: 5, scope: !1733)
!1738 = !DILocation(line: 1395, column: 16, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1687, file: !74, line: 1394, column: 3)
!1740 = !DILocation(line: 1395, column: 30, scope: !1739)
!1741 = !DILocation(line: 1395, column: 40, scope: !1739)
!1742 = !DILocation(line: 1395, column: 39, scope: !1739)
!1743 = !DILocation(line: 1395, column: 55, scope: !1739)
!1744 = !DILocation(line: 1395, column: 53, scope: !1739)
!1745 = !DILocation(line: 1395, column: 26, scope: !1739)
!1746 = !DILocation(line: 1395, column: 69, scope: !1739)
!1747 = !DILocation(line: 1395, column: 13, scope: !1739)
!1748 = !DILocation(line: 1396, column: 16, scope: !1739)
!1749 = !DILocation(line: 1396, column: 26, scope: !1739)
!1750 = !DILocation(line: 1396, column: 25, scope: !1739)
!1751 = !DILocation(line: 1396, column: 42, scope: !1739)
!1752 = !DILocation(line: 1396, column: 51, scope: !1739)
!1753 = !DILocation(line: 1396, column: 50, scope: !1739)
!1754 = !DILocation(line: 1396, column: 39, scope: !1739)
!1755 = !DILocation(line: 1396, column: 13, scope: !1739)
!1756 = !DILocation(line: 1397, column: 11, scope: !1739)
!1757 = !DILocation(line: 1397, column: 4, scope: !1739)
!1758 = !DILocation(line: 1400, column: 1, scope: !1656)
!1759 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1417, type: !1760, scopeLine: 1418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1760 = !DISubroutineType(types: !1761)
!1761 = !{!25, !25, !25}
!1762 = !DILocalVariable(name: "numerator", arg: 1, scope: !1759, file: !74, line: 1417, type: !25)
!1763 = !DILocation(line: 1417, column: 25, scope: !1759)
!1764 = !DILocalVariable(name: "denominator", arg: 2, scope: !1759, file: !74, line: 1417, type: !25)
!1765 = !DILocation(line: 1417, column: 40, scope: !1759)
!1766 = !DILocalVariable(name: "s32Temp1", scope: !1759, file: !74, line: 1419, type: !25)
!1767 = !DILocation(line: 1419, column: 6, scope: !1759)
!1768 = !DILocalVariable(name: "s32Temp2", scope: !1759, file: !74, line: 1419, type: !25)
!1769 = !DILocation(line: 1419, column: 20, scope: !1759)
!1770 = !DILocalVariable(name: "denominator_prime", scope: !1759, file: !74, line: 1420, type: !433)
!1771 = !DILocation(line: 1420, column: 6, scope: !1759)
!1772 = !DILocalVariable(name: "u32Temp1", scope: !1759, file: !74, line: 1420, type: !433)
!1773 = !DILocation(line: 1420, column: 29, scope: !1759)
!1774 = !DILocalVariable(name: "u32Temp2", scope: !1759, file: !74, line: 1420, type: !433)
!1775 = !DILocation(line: 1420, column: 43, scope: !1759)
!1776 = !DILocalVariable(name: "u32numerator", scope: !1759, file: !74, line: 1421, type: !433)
!1777 = !DILocation(line: 1421, column: 6, scope: !1759)
!1778 = !DILocalVariable(name: "u32denominator", scope: !1759, file: !74, line: 1421, type: !433)
!1779 = !DILocation(line: 1421, column: 23, scope: !1759)
!1780 = !DILocation(line: 1422, column: 5, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1759, file: !74, line: 1422, column: 5)
!1782 = !DILocation(line: 1422, column: 15, scope: !1781)
!1783 = !DILocation(line: 1422, column: 5, scope: !1759)
!1784 = !DILocation(line: 1424, column: 6, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1786, file: !74, line: 1424, column: 6)
!1786 = distinct !DILexicalBlock(scope: !1781, file: !74, line: 1423, column: 2)
!1787 = !DILocation(line: 1424, column: 18, scope: !1785)
!1788 = !DILocation(line: 1424, column: 6, scope: !1786)
!1789 = !DILocation(line: 1426, column: 7, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1791, file: !74, line: 1426, column: 7)
!1791 = distinct !DILexicalBlock(scope: !1785, file: !74, line: 1425, column: 3)
!1792 = !DILocation(line: 1426, column: 19, scope: !1790)
!1793 = !DILocation(line: 1426, column: 7, scope: !1791)
!1794 = !DILocation(line: 1428, column: 5, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1790, file: !74, line: 1427, column: 4)
!1796 = !DILocation(line: 1432, column: 21, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1790, file: !74, line: 1431, column: 4)
!1798 = !DILocation(line: 1432, column: 20, scope: !1797)
!1799 = !DILocation(line: 1432, column: 18, scope: !1797)
!1800 = !DILocation(line: 1433, column: 23, scope: !1797)
!1801 = !DILocation(line: 1433, column: 22, scope: !1797)
!1802 = !DILocation(line: 1433, column: 20, scope: !1797)
!1803 = !DILocation(line: 1434, column: 16, scope: !1797)
!1804 = !DILocation(line: 1434, column: 33, scope: !1797)
!1805 = !DILocation(line: 1434, column: 46, scope: !1797)
!1806 = !DILocation(line: 1434, column: 45, scope: !1797)
!1807 = !DILocation(line: 1434, column: 64, scope: !1797)
!1808 = !DILocation(line: 1434, column: 62, scope: !1797)
!1809 = !DILocation(line: 1434, column: 29, scope: !1797)
!1810 = !DILocation(line: 1434, column: 81, scope: !1797)
!1811 = !DILocation(line: 1434, column: 14, scope: !1797)
!1812 = !DILocation(line: 1435, column: 17, scope: !1797)
!1813 = !DILocation(line: 1435, column: 30, scope: !1797)
!1814 = !DILocation(line: 1435, column: 29, scope: !1797)
!1815 = !DILocation(line: 1435, column: 49, scope: !1797)
!1816 = !DILocation(line: 1435, column: 58, scope: !1797)
!1817 = !DILocation(line: 1435, column: 57, scope: !1797)
!1818 = !DILocation(line: 1435, column: 46, scope: !1797)
!1819 = !DILocation(line: 1435, column: 14, scope: !1797)
!1820 = !DILocation(line: 1436, column: 8, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1797, file: !74, line: 1436, column: 8)
!1822 = !DILocation(line: 1436, column: 17, scope: !1821)
!1823 = !DILocation(line: 1436, column: 8, scope: !1797)
!1824 = !DILocation(line: 1438, column: 13, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1821, file: !74, line: 1437, column: 5)
!1826 = !DILocation(line: 1438, column: 6, scope: !1825)
!1827 = !DILocation(line: 1442, column: 6, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1821, file: !74, line: 1441, column: 5)
!1829 = !DILocation(line: 1448, column: 20, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1785, file: !74, line: 1447, column: 3)
!1831 = !DILocation(line: 1448, column: 19, scope: !1830)
!1832 = !DILocation(line: 1448, column: 29, scope: !1830)
!1833 = !DILocation(line: 1448, column: 17, scope: !1830)
!1834 = !DILocation(line: 1449, column: 16, scope: !1830)
!1835 = !DILocation(line: 1449, column: 33, scope: !1830)
!1836 = !DILocation(line: 1449, column: 46, scope: !1830)
!1837 = !DILocation(line: 1449, column: 45, scope: !1830)
!1838 = !DILocation(line: 1449, column: 61, scope: !1830)
!1839 = !DILocation(line: 1449, column: 59, scope: !1830)
!1840 = !DILocation(line: 1449, column: 29, scope: !1830)
!1841 = !DILocation(line: 1449, column: 75, scope: !1830)
!1842 = !DILocation(line: 1449, column: 13, scope: !1830)
!1843 = !DILocation(line: 1450, column: 16, scope: !1830)
!1844 = !DILocation(line: 1450, column: 29, scope: !1830)
!1845 = !DILocation(line: 1450, column: 28, scope: !1830)
!1846 = !DILocation(line: 1450, column: 45, scope: !1830)
!1847 = !DILocation(line: 1450, column: 54, scope: !1830)
!1848 = !DILocation(line: 1450, column: 53, scope: !1830)
!1849 = !DILocation(line: 1450, column: 42, scope: !1830)
!1850 = !DILocation(line: 1450, column: 13, scope: !1830)
!1851 = !DILocation(line: 1451, column: 13, scope: !1830)
!1852 = !DILocation(line: 1451, column: 12, scope: !1830)
!1853 = !DILocation(line: 1451, column: 22, scope: !1830)
!1854 = !DILocation(line: 1451, column: 4, scope: !1830)
!1855 = !DILocation(line: 1456, column: 6, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1857, file: !74, line: 1456, column: 6)
!1857 = distinct !DILexicalBlock(scope: !1781, file: !74, line: 1455, column: 2)
!1858 = !DILocation(line: 1456, column: 18, scope: !1856)
!1859 = !DILocation(line: 1456, column: 6, scope: !1857)
!1860 = !DILocation(line: 1458, column: 7, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1862, file: !74, line: 1458, column: 7)
!1862 = distinct !DILexicalBlock(scope: !1856, file: !74, line: 1457, column: 3)
!1863 = !DILocation(line: 1458, column: 19, scope: !1861)
!1864 = !DILocation(line: 1458, column: 7, scope: !1862)
!1865 = !DILocation(line: 1460, column: 5, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !74, line: 1459, column: 4)
!1867 = !DILocation(line: 1464, column: 23, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1861, file: !74, line: 1463, column: 4)
!1869 = !DILocation(line: 1464, column: 22, scope: !1868)
!1870 = !DILocation(line: 1464, column: 35, scope: !1868)
!1871 = !DILocation(line: 1464, column: 20, scope: !1868)
!1872 = !DILocation(line: 1465, column: 17, scope: !1868)
!1873 = !DILocation(line: 1465, column: 31, scope: !1868)
!1874 = !DILocation(line: 1465, column: 41, scope: !1868)
!1875 = !DILocation(line: 1465, column: 40, scope: !1868)
!1876 = !DILocation(line: 1465, column: 59, scope: !1868)
!1877 = !DILocation(line: 1465, column: 57, scope: !1868)
!1878 = !DILocation(line: 1465, column: 27, scope: !1868)
!1879 = !DILocation(line: 1465, column: 76, scope: !1868)
!1880 = !DILocation(line: 1465, column: 14, scope: !1868)
!1881 = !DILocation(line: 1466, column: 17, scope: !1868)
!1882 = !DILocation(line: 1466, column: 27, scope: !1868)
!1883 = !DILocation(line: 1466, column: 26, scope: !1868)
!1884 = !DILocation(line: 1466, column: 46, scope: !1868)
!1885 = !DILocation(line: 1466, column: 55, scope: !1868)
!1886 = !DILocation(line: 1466, column: 54, scope: !1868)
!1887 = !DILocation(line: 1466, column: 43, scope: !1868)
!1888 = !DILocation(line: 1466, column: 14, scope: !1868)
!1889 = !DILocation(line: 1467, column: 14, scope: !1868)
!1890 = !DILocation(line: 1467, column: 13, scope: !1868)
!1891 = !DILocation(line: 1467, column: 23, scope: !1868)
!1892 = !DILocation(line: 1467, column: 5, scope: !1868)
!1893 = !DILocation(line: 1472, column: 16, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1856, file: !74, line: 1471, column: 3)
!1895 = !DILocation(line: 1472, column: 30, scope: !1894)
!1896 = !DILocation(line: 1472, column: 40, scope: !1894)
!1897 = !DILocation(line: 1472, column: 39, scope: !1894)
!1898 = !DILocation(line: 1472, column: 55, scope: !1894)
!1899 = !DILocation(line: 1472, column: 53, scope: !1894)
!1900 = !DILocation(line: 1472, column: 26, scope: !1894)
!1901 = !DILocation(line: 1472, column: 69, scope: !1894)
!1902 = !DILocation(line: 1472, column: 13, scope: !1894)
!1903 = !DILocation(line: 1473, column: 16, scope: !1894)
!1904 = !DILocation(line: 1473, column: 26, scope: !1894)
!1905 = !DILocation(line: 1473, column: 25, scope: !1894)
!1906 = !DILocation(line: 1473, column: 42, scope: !1894)
!1907 = !DILocation(line: 1473, column: 51, scope: !1894)
!1908 = !DILocation(line: 1473, column: 50, scope: !1894)
!1909 = !DILocation(line: 1473, column: 39, scope: !1894)
!1910 = !DILocation(line: 1473, column: 13, scope: !1894)
!1911 = !DILocation(line: 1474, column: 11, scope: !1894)
!1912 = !DILocation(line: 1474, column: 4, scope: !1894)
!1913 = !DILocation(line: 1477, column: 1, scope: !1759)
!1914 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1495, type: !1915, scopeLine: 1496, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1915 = !DISubroutineType(types: !1916)
!1916 = !{!6, !25, !433}
!1917 = !DILocalVariable(name: "numerator", arg: 1, scope: !1914, file: !74, line: 1495, type: !25)
!1918 = !DILocation(line: 1495, column: 25, scope: !1914)
!1919 = !DILocalVariable(name: "denominator", arg: 2, scope: !1914, file: !74, line: 1495, type: !433)
!1920 = !DILocation(line: 1495, column: 40, scope: !1914)
!1921 = !DILocalVariable(name: "numerator_prime", scope: !1914, file: !74, line: 1498, type: !433)
!1922 = !DILocation(line: 1498, column: 6, scope: !1914)
!1923 = !DILocalVariable(name: "u32Temp1", scope: !1914, file: !74, line: 1498, type: !433)
!1924 = !DILocation(line: 1498, column: 27, scope: !1914)
!1925 = !DILocalVariable(name: "u32Temp2", scope: !1914, file: !74, line: 1498, type: !433)
!1926 = !DILocation(line: 1498, column: 41, scope: !1914)
!1927 = !DILocalVariable(name: "u32Temp3", scope: !1914, file: !74, line: 1498, type: !433)
!1928 = !DILocation(line: 1498, column: 55, scope: !1914)
!1929 = !DILocalVariable(name: "s32Temp1", scope: !1914, file: !74, line: 1499, type: !25)
!1930 = !DILocation(line: 1499, column: 6, scope: !1914)
!1931 = !DILocalVariable(name: "s32Temp2", scope: !1914, file: !74, line: 1499, type: !25)
!1932 = !DILocation(line: 1499, column: 20, scope: !1914)
!1933 = !DILocalVariable(name: "s32Temp3", scope: !1914, file: !74, line: 1499, type: !25)
!1934 = !DILocation(line: 1499, column: 34, scope: !1914)
!1935 = !DILocation(line: 1500, column: 5, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1914, file: !74, line: 1500, column: 5)
!1937 = !DILocation(line: 1500, column: 17, scope: !1936)
!1938 = !DILocation(line: 1500, column: 5, scope: !1914)
!1939 = !DILocation(line: 1502, column: 6, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1941, file: !74, line: 1502, column: 6)
!1941 = distinct !DILexicalBlock(scope: !1936, file: !74, line: 1501, column: 2)
!1942 = !DILocation(line: 1502, column: 15, scope: !1940)
!1943 = !DILocation(line: 1502, column: 6, scope: !1941)
!1944 = !DILocation(line: 1504, column: 4, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1940, file: !74, line: 1503, column: 3)
!1946 = !DILocation(line: 1508, column: 4, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1940, file: !74, line: 1507, column: 3)
!1948 = !DILocation(line: 1513, column: 6, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1950, file: !74, line: 1513, column: 6)
!1950 = distinct !DILexicalBlock(scope: !1936, file: !74, line: 1512, column: 2)
!1951 = !DILocation(line: 1513, column: 16, scope: !1949)
!1952 = !DILocation(line: 1513, column: 6, scope: !1950)
!1953 = !DILocation(line: 1515, column: 23, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1949, file: !74, line: 1514, column: 3)
!1955 = !DILocation(line: 1515, column: 22, scope: !1954)
!1956 = !DILocation(line: 1515, column: 20, scope: !1954)
!1957 = !DILocation(line: 1516, column: 16, scope: !1954)
!1958 = !DILocation(line: 1516, column: 32, scope: !1954)
!1959 = !DILocation(line: 1516, column: 31, scope: !1954)
!1960 = !DILocation(line: 1516, column: 13, scope: !1954)
!1961 = !DILocation(line: 1517, column: 15, scope: !1954)
!1962 = !DILocation(line: 1517, column: 34, scope: !1954)
!1963 = !DILocation(line: 1517, column: 45, scope: !1954)
!1964 = !DILocation(line: 1517, column: 43, scope: !1954)
!1965 = !DILocation(line: 1517, column: 31, scope: !1954)
!1966 = !DILocation(line: 1517, column: 13, scope: !1954)
!1967 = !DILocation(line: 1519, column: 8, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1954, file: !74, line: 1519, column: 7)
!1969 = !DILocation(line: 1519, column: 20, scope: !1968)
!1970 = !DILocation(line: 1519, column: 27, scope: !1968)
!1971 = !DILocation(line: 1519, column: 7, scope: !1954)
!1972 = !DILocation(line: 1521, column: 19, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1968, file: !74, line: 1520, column: 4)
!1974 = !DILocation(line: 1521, column: 31, scope: !1973)
!1975 = !DILocation(line: 1521, column: 17, scope: !1973)
!1976 = !DILocation(line: 1522, column: 4, scope: !1973)
!1977 = !DILocation(line: 1525, column: 20, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1968, file: !74, line: 1524, column: 4)
!1979 = !DILocation(line: 1525, column: 32, scope: !1978)
!1980 = !DILocation(line: 1525, column: 38, scope: !1978)
!1981 = !DILocation(line: 1525, column: 17, scope: !1978)
!1982 = !DILocation(line: 1528, column: 7, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1954, file: !74, line: 1528, column: 7)
!1984 = !DILocation(line: 1528, column: 18, scope: !1983)
!1985 = !DILocation(line: 1528, column: 16, scope: !1983)
!1986 = !DILocation(line: 1528, column: 7, scope: !1954)
!1987 = !DILocation(line: 1530, column: 18, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1983, file: !74, line: 1529, column: 4)
!1989 = !DILocation(line: 1530, column: 16, scope: !1988)
!1990 = !DILocation(line: 1530, column: 28, scope: !1988)
!1991 = !DILocation(line: 1530, column: 14, scope: !1988)
!1992 = !DILocation(line: 1531, column: 4, scope: !1988)
!1993 = !DILocation(line: 1534, column: 18, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1983, file: !74, line: 1533, column: 4)
!1995 = !DILocation(line: 1534, column: 26, scope: !1994)
!1996 = !DILocation(line: 1534, column: 16, scope: !1994)
!1997 = !DILocation(line: 1534, column: 30, scope: !1994)
!1998 = !DILocation(line: 1534, column: 14, scope: !1994)
!1999 = !DILocation(line: 1536, column: 8, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1954, file: !74, line: 1536, column: 7)
!2001 = !DILocation(line: 1536, column: 18, scope: !2000)
!2002 = !DILocation(line: 1536, column: 7, scope: !1954)
!2003 = !DILocation(line: 1538, column: 18, scope: !2004)
!2004 = distinct !DILexicalBlock(scope: !2000, file: !74, line: 1537, column: 4)
!2005 = !DILocation(line: 1538, column: 12, scope: !2004)
!2006 = !DILocation(line: 1538, column: 5, scope: !2004)
!2007 = !DILocation(line: 1542, column: 5, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !2000, file: !74, line: 1541, column: 4)
!2009 = !DILocation(line: 1547, column: 16, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !1949, file: !74, line: 1546, column: 3)
!2011 = !DILocation(line: 1547, column: 26, scope: !2010)
!2012 = !DILocation(line: 1547, column: 25, scope: !2010)
!2013 = !DILocation(line: 1547, column: 41, scope: !2010)
!2014 = !DILocation(line: 1547, column: 39, scope: !2010)
!2015 = !DILocation(line: 1547, column: 13, scope: !2010)
!2016 = !DILocation(line: 1548, column: 16, scope: !2010)
!2017 = !DILocation(line: 1548, column: 30, scope: !2010)
!2018 = !DILocation(line: 1548, column: 40, scope: !2010)
!2019 = !DILocation(line: 1548, column: 39, scope: !2010)
!2020 = !DILocation(line: 1548, column: 55, scope: !2010)
!2021 = !DILocation(line: 1548, column: 53, scope: !2010)
!2022 = !DILocation(line: 1548, column: 26, scope: !2010)
!2023 = !DILocation(line: 1548, column: 68, scope: !2010)
!2024 = !DILocation(line: 1548, column: 13, scope: !2010)
!2025 = !DILocation(line: 1549, column: 16, scope: !2010)
!2026 = !DILocation(line: 1549, column: 25, scope: !2010)
!2027 = !DILocation(line: 1549, column: 24, scope: !2010)
!2028 = !DILocation(line: 1549, column: 41, scope: !2010)
!2029 = !DILocation(line: 1549, column: 51, scope: !2010)
!2030 = !DILocation(line: 1549, column: 50, scope: !2010)
!2031 = !DILocation(line: 1549, column: 38, scope: !2010)
!2032 = !DILocation(line: 1549, column: 13, scope: !2010)
!2033 = !DILocation(line: 1550, column: 7, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2010, file: !74, line: 1550, column: 7)
!2035 = !DILocation(line: 1550, column: 16, scope: !2034)
!2036 = !DILocation(line: 1550, column: 7, scope: !2010)
!2037 = !DILocation(line: 1552, column: 17, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2034, file: !74, line: 1551, column: 4)
!2039 = !DILocation(line: 1552, column: 12, scope: !2038)
!2040 = !DILocation(line: 1552, column: 5, scope: !2038)
!2041 = !DILocation(line: 1556, column: 5, scope: !2042)
!2042 = distinct !DILexicalBlock(scope: !2034, file: !74, line: 1555, column: 4)
!2043 = !DILocation(line: 1560, column: 1, scope: !1914)
!2044 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2045, file: !2045, line: 12, type: !2046, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2049)
!2045 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2046 = !DISubroutineType(types: !2047)
!2047 = !{null, !2048}
!2048 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2049 = !{!2050}
!2050 = !DILocalVariable(name: "z", arg: 1, scope: !2044, file: !2045, line: 12, type: !2048)
!2051 = !DILocation(line: 0, scope: !2044)
!2052 = !DILocation(line: 13, column: 9, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2044, file: !2045, line: 13, column: 7)
!2054 = !DILocation(line: 13, column: 7, scope: !2044)
!2055 = !DILocation(line: 14, column: 5, scope: !2053)
!2056 = !DILocation(line: 15, column: 1, scope: !2044)
!2057 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2058, file: !2058, line: 20, type: !2059, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2062)
!2058 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2059 = !DISubroutineType(types: !2060)
!2060 = !{null, !2061, !2061}
!2061 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2062 = !{!2063, !2064}
!2063 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2057, file: !2058, line: 20, type: !2061)
!2064 = !DILocalVariable(name: "shift", arg: 2, scope: !2057, file: !2058, line: 20, type: !2061)
!2065 = !DILocation(line: 0, scope: !2057)
!2066 = !DILocation(line: 21, column: 13, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2057, file: !2058, line: 21, column: 7)
!2068 = !DILocation(line: 21, column: 7, scope: !2057)
!2069 = !DILocation(line: 27, column: 5, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2067, file: !2058, line: 21, column: 26)
!2071 = !DILocation(line: 29, column: 1, scope: !2057)
