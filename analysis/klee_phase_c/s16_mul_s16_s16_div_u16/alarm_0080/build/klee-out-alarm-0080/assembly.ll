; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080/build/s16_mul_s16_s16_div_u16_alarm_0080.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"data1\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"data2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [129 x i8] c"KLEE-ALARM-0080: signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0080.err\00", align 1
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
  %data1 = alloca i16, align 2
  %data2 = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %data1, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %data2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i16* %result, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = bitcast i16* %data1 to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !61
  %1 = bitcast i16* %data2 to i8*, !dbg !62
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  %2 = bitcast i16* %denominator to i8*, !dbg !64
  call void @klee_make_symbolic(i8* %2, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  %3 = load i16, i16* %data1, align 2, !dbg !66
  %4 = load i16, i16* %data2, align 2, !dbg !67
  %5 = load i16, i16* %denominator, align 2, !dbg !68
  %call = call signext i16 @s16_mul_s16_s16_div_u16(i16 signext %3, i16 signext %4, i16 zeroext %5), !dbg !69
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
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1054
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1056
  %6 = load i16, i16* %div.addr, align 2, !dbg !1057
  %conv8 = sext i16 %6 to i32, !dbg !1057
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1058
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1058
  %div9 = sdiv i32 %5, %conv8, !dbg !1058, !klee.check.div !111
  %7 = load i16, i16* %div.addr, align 2, !dbg !1059
  %conv10 = sext i16 %7 to i32, !dbg !1059
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1060
  %sub = sub nsw i32 %4, %mul11, !dbg !1061
  %shl = shl i32 %sub, 1, !dbg !1062
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1063
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1064
  %9 = load i16, i16* %div.addr, align 2, !dbg !1065
  %conv12 = sext i16 %9 to i32, !dbg !1065
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1066
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1066
  %div13 = sdiv i32 %8, %conv12, !dbg !1066, !klee.check.div !111
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1067
  %11 = load i16, i16* %div.addr, align 2, !dbg !1068
  %conv14 = sext i16 %11 to i32, !dbg !1068
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1069
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1069
  %div15 = sdiv i32 %10, %conv14, !dbg !1069, !klee.check.div !111
  %add = add nsw i32 %div13, %div15, !dbg !1070
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1071
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1072
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1074
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1075

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1076
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1079
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1080

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1081
  %conv22 = trunc i32 %14 to i16, !dbg !1083
  store i16 %conv22, i16* %retval, align 2, !dbg !1084
  br label %return, !dbg !1084

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1085
  br label %return, !dbg !1085

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1087
  br label %return, !dbg !1087

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1089
  ret i16 %15, !dbg !1089
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1090 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1093, metadata !DIExpression()), !dbg !1094
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1095, metadata !DIExpression()), !dbg !1096
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1097, metadata !DIExpression()), !dbg !1098
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1099, metadata !DIExpression()), !dbg !1100
  store i32 0, i32* %s32Result, align 4, !dbg !1100
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1101, metadata !DIExpression()), !dbg !1102
  store i32 0, i32* %s32Temp1, align 4, !dbg !1102
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1103
  %conv = sext i16 %0 to i32, !dbg !1103
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1104
  %conv1 = sext i16 %1 to i32, !dbg !1104
  %mul = mul nsw i32 %conv, %conv1, !dbg !1105
  store i32 %mul, i32* %s32Result, align 4, !dbg !1106
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1107
  %conv2 = zext i16 %2 to i32, !dbg !1107
  %cmp = icmp eq i32 %conv2, 0, !dbg !1109
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1110

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1111
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1114
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1115

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1116
  br label %return, !dbg !1116

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1118
  %cmp7 = icmp eq i32 %4, 0, !dbg !1120
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1121

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1122
  br label %return, !dbg !1122

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1124
  br label %return, !dbg !1124

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1126
  %6 = load i32, i32* %s32Result, align 4, !dbg !1129
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1130
  %conv12 = zext i16 %7 to i32, !dbg !1131
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1132
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1132
  %div = sdiv i32 %6, %conv12, !dbg !1132, !klee.check.div !111
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1133
  %conv13 = zext i16 %8 to i32, !dbg !1134
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1135
  %sub = sub nsw i32 %5, %mul14, !dbg !1136
  %conv15 = sext i32 %sub to i64, !dbg !1137
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv15), !dbg !1138
  %tobool = icmp ne i32 %call, 0, !dbg !1138
  br i1 %tobool, label %if.end, label %if.then16, !dbg !1139

if.then16:                                        ; preds = %if.else11
  store i16 0, i16* %retval, align 2, !dbg !1140
  br label %return, !dbg !1140

if.end:                                           ; preds = %if.else11
  %9 = load i32, i32* %s32Result, align 4, !dbg !1142
  %10 = load i32, i32* %s32Result, align 4, !dbg !1144
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1145
  %conv17 = zext i16 %11 to i32, !dbg !1146
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !1147
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1147
  %div18 = sdiv i32 %10, %conv17, !dbg !1147, !klee.check.div !111
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1148
  %conv19 = zext i16 %12 to i32, !dbg !1149
  %mul20 = mul nsw i32 %div18, %conv19, !dbg !1150
  %sub21 = sub nsw i32 %9, %mul20, !dbg !1151
  %conv22 = sext i32 %sub21 to i64, !dbg !1152
  %call23 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv22, i32 1), !dbg !1153
  %tobool24 = icmp ne i32 %call23, 0, !dbg !1153
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !1154

if.then25:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !1155
  br label %return, !dbg !1155

if.end26:                                         ; preds = %if.end
  %13 = load i32, i32* %s32Result, align 4, !dbg !1157
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !1159
  %conv27 = zext i16 %14 to i32, !dbg !1160
  %int_cast_to_i642 = zext i32 %conv27 to i64, !dbg !1161
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1161
  %div28 = sdiv i32 %13, %conv27, !dbg !1161, !klee.check.div !111
  %conv29 = sext i32 %div28 to i64, !dbg !1162
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !1163
  %conv30 = zext i16 %15 to i32, !dbg !1164
  %conv31 = sext i32 %conv30 to i64, !dbg !1165
  %call32 = call i32 @klee_alarm_s32_mul_upper(i64 %conv29, i64 %conv31), !dbg !1166
  %tobool33 = icmp ne i32 %call32, 0, !dbg !1166
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !1167

if.then34:                                        ; preds = %if.end26
  store i16 0, i16* %retval, align 2, !dbg !1168
  br label %return, !dbg !1168

if.end35:                                         ; preds = %if.end26
  %16 = load i32, i32* %s32Result, align 4, !dbg !1170
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !1172
  %conv36 = zext i16 %17 to i32, !dbg !1173
  %int_cast_to_i643 = zext i32 %conv36 to i64, !dbg !1174
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1174
  %div37 = sdiv i32 %16, %conv36, !dbg !1174, !klee.check.div !111
  %conv38 = sext i32 %div37 to i64, !dbg !1175
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !1176
  %conv39 = zext i16 %18 to i32, !dbg !1177
  %conv40 = sext i32 %conv39 to i64, !dbg !1178
  %call41 = call i32 @klee_alarm_s32_mul_lower(i64 %conv38, i64 %conv40), !dbg !1179
  %tobool42 = icmp ne i32 %call41, 0, !dbg !1179
  br i1 %tobool42, label %if.end44, label %if.then43, !dbg !1180

if.then43:                                        ; preds = %if.end35
  store i16 0, i16* %retval, align 2, !dbg !1181
  br label %return, !dbg !1181

if.end44:                                         ; preds = %if.end35
  %19 = load i32, i32* %s32Result, align 4, !dbg !1183
  %20 = load i32, i32* %s32Result, align 4, !dbg !1184
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !1185
  %conv45 = zext i16 %21 to i32, !dbg !1185
  %int_cast_to_i644 = zext i32 %conv45 to i64, !dbg !1186
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1186
  %div46 = sdiv i32 %20, %conv45, !dbg !1186, !klee.check.div !111
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !1187
  %conv47 = zext i16 %22 to i32, !dbg !1187
  %mul48 = mul nsw i32 %div46, %conv47, !dbg !1188
  %sub49 = sub nsw i32 %19, %mul48, !dbg !1189
  %shl = shl i32 %sub49, 1, !dbg !1190
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1191
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1192
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !1194
  %conv50 = zext i16 %24 to i32, !dbg !1195
  %int_cast_to_i645 = zext i32 %conv50 to i64, !dbg !1196
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1196
  %div51 = sdiv i32 %23, %conv50, !dbg !1196, !klee.check.div !111
  %conv52 = sext i32 %div51 to i64, !dbg !1197
  %25 = load i32, i32* %s32Result, align 4, !dbg !1198
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !1199
  %conv53 = zext i16 %26 to i32, !dbg !1200
  %int_cast_to_i646 = zext i32 %conv53 to i64, !dbg !1201
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1201
  %div54 = sdiv i32 %25, %conv53, !dbg !1201, !klee.check.div !111
  %conv55 = sext i32 %div54 to i64, !dbg !1202
  %call56 = call i32 @klee_alarm_s32_add_upper(i64 %conv52, i64 %conv55), !dbg !1203
  %tobool57 = icmp ne i32 %call56, 0, !dbg !1203
  br i1 %tobool57, label %if.end59, label %if.then58, !dbg !1204

if.then58:                                        ; preds = %if.end44
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1043, i8* getelementptr inbounds ([129 x i8], [129 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !1205
  unreachable, !dbg !1205

if.end59:                                         ; preds = %if.end44
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !1207
  %28 = load i16, i16* %denominator.addr, align 2, !dbg !1208
  %conv60 = zext i16 %28 to i32, !dbg !1209
  %int_cast_to_i647 = zext i32 %conv60 to i64, !dbg !1210
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1210
  %div61 = sdiv i32 %27, %conv60, !dbg !1210, !klee.check.div !111
  %29 = load i32, i32* %s32Result, align 4, !dbg !1211
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !1212
  %conv62 = zext i16 %30 to i32, !dbg !1213
  %int_cast_to_i648 = zext i32 %conv62 to i64, !dbg !1214
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1214
  %div63 = sdiv i32 %29, %conv62, !dbg !1214, !klee.check.div !111
  %add = add nsw i32 %div61, %div63, !dbg !1215
  %conv64 = sext i32 %add to i64, !dbg !1216
  store volatile i64 %conv64, i64* @klee_alarm_sink_s64, align 8, !dbg !1217
  store i16 0, i16* %retval, align 2, !dbg !1218
  br label %return, !dbg !1218

return:                                           ; preds = %if.end59, %if.then43, %if.then34, %if.then25, %if.then16, %if.else10, %if.then9, %if.then6
  %31 = load i16, i16* %retval, align 2, !dbg !1219
  ret i16 %31, !dbg !1219
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !1220 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1223, metadata !DIExpression()), !dbg !1224
  %0 = load i64, i64* %left.addr, align 8, !dbg !1225
  %cmp = icmp sge i64 %0, 0, !dbg !1226
  %conv = zext i1 %cmp to i32, !dbg !1226
  ret i32 %conv, !dbg !1227
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !1228 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1231, metadata !DIExpression()), !dbg !1232
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1233, metadata !DIExpression()), !dbg !1234
  %0 = load i32, i32* %count.addr, align 4, !dbg !1235
  %cmp = icmp uge i32 %0, 63, !dbg !1237
  br i1 %cmp, label %if.then, label %if.end, !dbg !1238

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1239
  br label %return, !dbg !1239

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !1241
  %2 = load i32, i32* %count.addr, align 4, !dbg !1242
  %sh_prom = zext i32 %2 to i64, !dbg !1243
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !1243
  %shl = shl i64 1, %sh_prom, !dbg !1243, !klee.check.shift !111
  %mul = mul nsw i64 %1, %shl, !dbg !1244
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !1245
  %conv = zext i1 %cmp1 to i32, !dbg !1245
  store i32 %conv, i32* %retval, align 4, !dbg !1246
  br label %return, !dbg !1246

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !1247
  ret i32 %3, !dbg !1247
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !1248 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1251, metadata !DIExpression()), !dbg !1252
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1253, metadata !DIExpression()), !dbg !1254
  %0 = load i64, i64* %left.addr, align 8, !dbg !1255
  %1 = load i64, i64* %right.addr, align 8, !dbg !1256
  %mul = mul nsw i64 %0, %1, !dbg !1257
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !1258
  %conv = zext i1 %cmp to i32, !dbg !1258
  ret i32 %conv, !dbg !1259
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !1260 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1261, metadata !DIExpression()), !dbg !1262
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1263, metadata !DIExpression()), !dbg !1264
  %0 = load i64, i64* %left.addr, align 8, !dbg !1265
  %1 = load i64, i64* %right.addr, align 8, !dbg !1266
  %mul = mul nsw i64 %0, %1, !dbg !1267
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !1268
  %conv = zext i1 %cmp to i32, !dbg !1268
  ret i32 %conv, !dbg !1269
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !1270 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1271, metadata !DIExpression()), !dbg !1272
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1273, metadata !DIExpression()), !dbg !1274
  %0 = load i64, i64* %left.addr, align 8, !dbg !1275
  %1 = load i64, i64* %right.addr, align 8, !dbg !1276
  %add = add nsw i64 %0, %1, !dbg !1277
  %cmp = icmp sle i64 %add, 2147483647, !dbg !1278
  %conv = zext i1 %cmp to i32, !dbg !1278
  ret i32 %conv, !dbg !1279
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1280 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1283, metadata !DIExpression()), !dbg !1284
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1285, metadata !DIExpression()), !dbg !1286
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1287, metadata !DIExpression()), !dbg !1288
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1289
  %cmp = icmp eq i32 %0, 0, !dbg !1291
  br i1 %cmp, label %if.then, label %if.else, !dbg !1292

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1293
  br label %return, !dbg !1293

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1295
  %cmp1 = icmp sle i32 %1, 0, !dbg !1298
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1299

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1300
  br label %return, !dbg !1300

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1302
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1304
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1305
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1306
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1306
  %div = udiv i32 %3, %4, !dbg !1306, !klee.check.div !111
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1307
  %mul = mul i32 %div, %5, !dbg !1308
  %sub = sub i32 %2, %mul, !dbg !1309
  %shl = shl i32 %sub, 1, !dbg !1310
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1311
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1312
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1313
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1314
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1314
  %div4 = udiv i32 %6, %7, !dbg !1314, !klee.check.div !111
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1315
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1316
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1317
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1317
  %div5 = udiv i32 %8, %9, !dbg !1317, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1318
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1319
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1320
  store i32 %10, i32* %retval, align 4, !dbg !1321
  br label %return, !dbg !1321

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1322
  ret i32 %11, !dbg !1322
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1323 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1330, metadata !DIExpression()), !dbg !1331
  store i32 0, i32* %s32Temp1, align 4, !dbg !1331
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1332
  %cmp = icmp eq i32 %0, 0, !dbg !1334
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1335

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1336
  %cmp1 = icmp sge i32 %1, 0, !dbg !1339
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1340

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1341
  br label %return, !dbg !1341

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1343
  br label %return, !dbg !1343

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1345
  %cmp4 = icmp sge i32 %2, 0, !dbg !1348
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1349

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1350
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1352
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1353
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1354
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1354
  %div = udiv i32 %4, %5, !dbg !1354, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1355
  %mul = mul i32 %div, %6, !dbg !1356
  %sub = sub i32 %3, %mul, !dbg !1357
  %shl = shl i32 %sub, 1, !dbg !1358
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1359
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1361
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1362
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1362
  %div6 = udiv i32 %7, %8, !dbg !1362, !klee.check.div !111
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1363
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1364
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1365
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1365
  %div7 = udiv i32 %9, %10, !dbg !1365, !klee.check.div !111
  %add = add i32 %div6, %div7, !dbg !1366
  store i32 %add, i32* %retval, align 4, !dbg !1367
  br label %return, !dbg !1367

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1368
  br label %return, !dbg !1368

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1370
  ret i32 %11, !dbg !1370
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1371 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1374, metadata !DIExpression()), !dbg !1375
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1376, metadata !DIExpression()), !dbg !1377
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1378, metadata !DIExpression()), !dbg !1379
  store i32 0, i32* %u32Temp1, align 4, !dbg !1379
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1380, metadata !DIExpression()), !dbg !1381
  store i32 0, i32* %u32Temp2, align 4, !dbg !1381
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1382
  %cmp = icmp eq i32 %0, 0, !dbg !1384
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1385

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1386
  %cmp1 = icmp slt i32 %1, 0, !dbg !1389
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1390

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1391
  br label %return, !dbg !1391

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1393
  br label %return, !dbg !1393

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %cmp4 = icmp sge i32 %2, 0, !dbg !1398
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1399

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %cmp6 = icmp eq i32 %3, 0, !dbg !1403
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1404

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %cmp9 = icmp sle i32 %4, 0, !dbg !1410
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1411

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1414
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1416
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1417
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1418
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1418
  %div = sdiv i32 %6, %7, !dbg !1418, !klee.check.div !111
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1419
  %mul = mul nsw i32 %div, %8, !dbg !1420
  %sub = sub nsw i32 %5, %mul, !dbg !1421
  %shl = shl i32 %sub, 1, !dbg !1422
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1423
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1424
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1425
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1426
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1426
  %div12 = udiv i32 %9, %10, !dbg !1426, !klee.check.div !111
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1427
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1428
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1429
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1429
  %div13 = sdiv i32 %11, %12, !dbg !1429, !klee.check.div !111
  %add = add i32 %div12, %div13, !dbg !1430
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1431
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1432
  store i32 %13, i32* %retval, align 4, !dbg !1433
  br label %return, !dbg !1433

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1437
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1438

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1441
  %sub18 = sub nsw i32 0, %15, !dbg !1443
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1444
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %sub19 = sub nsw i32 0, %16, !dbg !1446
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1447
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1448
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1449
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1451
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1451
  %div20 = sdiv i32 %18, %19, !dbg !1451, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1452
  %mul21 = mul nsw i32 %div20, %20, !dbg !1453
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1454
  %shl23 = shl i32 %sub22, 1, !dbg !1455
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1456
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1457
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1458
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1459
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1459
  %div24 = udiv i32 %21, %22, !dbg !1459, !klee.check.div !111
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1460
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1461
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1462
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1462
  %div25 = sdiv i32 %23, %24, !dbg !1462, !klee.check.div !111
  %add26 = add i32 %div24, %div25, !dbg !1463
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1464
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1465
  store i32 %25, i32* %retval, align 4, !dbg !1466
  br label %return, !dbg !1466

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1467
  ret i32 %26, !dbg !1467
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1468 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1471, metadata !DIExpression()), !dbg !1472
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1473, metadata !DIExpression()), !dbg !1474
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1475, metadata !DIExpression()), !dbg !1476
  store i32 0, i32* %u32Temp1, align 4, !dbg !1476
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1477, metadata !DIExpression()), !dbg !1478
  store i32 0, i32* %u32Temp2, align 4, !dbg !1478
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1479, metadata !DIExpression()), !dbg !1480
  store i32 0, i32* %u32Temp3, align 4, !dbg !1480
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1481, metadata !DIExpression()), !dbg !1482
  store i32 0, i32* %numerator_old, align 4, !dbg !1482
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1483
  %cmp = icmp eq i32 %0, 0, !dbg !1485
  br i1 %cmp, label %if.then, label %if.else, !dbg !1486

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1487
  br label %return, !dbg !1487

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1489
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1491
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1492
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1493
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1494
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1494
  %div = udiv i32 %3, %4, !dbg !1494, !klee.check.div !111
  %mul = mul i32 %2, %div, !dbg !1495
  %sub = sub i32 %1, %mul, !dbg !1496
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1497
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1498
  %and = and i32 %5, 1, !dbg !1500
  %cmp1 = icmp eq i32 %and, 0, !dbg !1501
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1502

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %shr = lshr i32 %6, 1, !dbg !1505
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1506
  br label %if.end, !dbg !1507

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1508
  %shr4 = lshr i32 %7, 1, !dbg !1510
  %add = add i32 %shr4, 1, !dbg !1511
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1512
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1513
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1515
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1516
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1517

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1518
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1520
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1521
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1521
  %div7 = udiv i32 %10, %11, !dbg !1521, !klee.check.div !111
  store i32 %div7, i32* %retval, align 4, !dbg !1522
  br label %return, !dbg !1522

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1526
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1526
  %div9 = udiv i32 %12, %13, !dbg !1526, !klee.check.div !111
  %add10 = add i32 %div9, 1, !dbg !1527
  store i32 %add10, i32* %retval, align 4, !dbg !1528
  br label %return, !dbg !1528

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1529
  ret i32 %14, !dbg !1529
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1530 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1533, metadata !DIExpression()), !dbg !1534
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1535, metadata !DIExpression()), !dbg !1536
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1537, metadata !DIExpression()), !dbg !1538
  store i32 0, i32* %u32Temp1, align 4, !dbg !1538
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1539, metadata !DIExpression()), !dbg !1540
  store i32 0, i32* %u32Temp2, align 4, !dbg !1540
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1541
  %cmp = icmp sle i32 %0, 0, !dbg !1543
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1544

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %cmp1 = icmp sge i32 %1, 0, !dbg !1548
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1549

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1550
  br label %return, !dbg !1550

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1552
  %sub = sub nsw i32 0, %2, !dbg !1554
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1555
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1556
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1557
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1558
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1559
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1559
  %div = udiv i32 %4, %5, !dbg !1559, !klee.check.div !111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1560
  %mul = mul i32 %div, %6, !dbg !1561
  %sub3 = sub i32 %3, %mul, !dbg !1562
  %shl = shl i32 %sub3, 1, !dbg !1563
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1564
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1565
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1567
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1567
  %div4 = udiv i32 %7, %8, !dbg !1567, !klee.check.div !111
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1568
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1569
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1570
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1570
  %div5 = udiv i32 %9, %10, !dbg !1570, !klee.check.div !111
  %add = add i32 %div4, %div5, !dbg !1571
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1572
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1573
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1575
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1576

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1577
  %sub8 = sub i32 0, %12, !dbg !1579
  store i32 %sub8, i32* %retval, align 4, !dbg !1580
  br label %return, !dbg !1580

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1581
  br label %return, !dbg !1581

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1583
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1585
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1586
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1587
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1587
  %div11 = udiv i32 %14, %15, !dbg !1587, !klee.check.div !111
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1588
  %mul12 = mul i32 %div11, %16, !dbg !1589
  %sub13 = sub i32 %13, %mul12, !dbg !1590
  %shl14 = shl i32 %sub13, 1, !dbg !1591
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1592
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1593
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1594
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1595
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1595
  %div15 = udiv i32 %17, %18, !dbg !1595, !klee.check.div !111
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1596
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1598
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1598
  %div16 = udiv i32 %19, %20, !dbg !1598, !klee.check.div !111
  %add17 = add i32 %div15, %div16, !dbg !1599
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1600
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1601
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1603
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1604

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1605
  store i32 %22, i32* %retval, align 4, !dbg !1607
  br label %return, !dbg !1607

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1608
  br label %return, !dbg !1608

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1610
  ret i32 %23, !dbg !1610
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1611 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1614, metadata !DIExpression()), !dbg !1615
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1616, metadata !DIExpression()), !dbg !1617
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1618, metadata !DIExpression()), !dbg !1619
  store i32 0, i32* %s32Temp1, align 4, !dbg !1619
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1620, metadata !DIExpression()), !dbg !1621
  store i32 0, i32* %s32Temp2, align 4, !dbg !1621
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1622, metadata !DIExpression()), !dbg !1623
  store i32 0, i32* %u32Temp0, align 4, !dbg !1623
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1624, metadata !DIExpression()), !dbg !1625
  store i32 0, i32* %u32Temp1, align 4, !dbg !1625
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1626, metadata !DIExpression()), !dbg !1627
  store i32 0, i32* %u32Temp2, align 4, !dbg !1627
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1628
  %cmp = icmp eq i32 %0, 0, !dbg !1630
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1631

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1632
  %cmp1 = icmp slt i32 %1, 0, !dbg !1635
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1636

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1637
  br label %return, !dbg !1637

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1639
  br label %return, !dbg !1639

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1641
  %cmp4 = icmp sle i32 %2, 0, !dbg !1644
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1645

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1646
  %sub = sub nsw i32 0, %3, !dbg !1648
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1649
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1650
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1651
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1652
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1652
  %div = udiv i32 %4, %5, !dbg !1652, !klee.check.div !111
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1653
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1654
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1655
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1656
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1657
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1657
  %div6 = udiv i32 %7, %8, !dbg !1657, !klee.check.div !111
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1658
  %mul = mul i32 %div6, %9, !dbg !1659
  %sub7 = sub i32 %6, %mul, !dbg !1660
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1661
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1662
  %and = and i32 %10, 1, !dbg !1664
  %cmp8 = icmp eq i32 %and, 0, !dbg !1665
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1666

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1667
  %shr = lshr i32 %11, 1, !dbg !1669
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1670
  br label %if.end, !dbg !1671

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %shr11 = lshr i32 %12, 1, !dbg !1674
  %add = add i32 %shr11, 1, !dbg !1675
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1676
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1677
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1679
  %cmp12 = icmp ult i32 %13, %14, !dbg !1680
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1681

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1682
  %neg = xor i32 %15, -1, !dbg !1684
  %add14 = add i32 %neg, 1, !dbg !1685
  store i32 %add14, i32* %retval, align 4, !dbg !1686
  br label %return, !dbg !1686

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1687
  %add16 = add i32 %16, 1, !dbg !1689
  %neg17 = xor i32 %add16, -1, !dbg !1690
  %add18 = add i32 %neg17, 1, !dbg !1691
  store i32 %add18, i32* %retval, align 4, !dbg !1692
  br label %return, !dbg !1692

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1693
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1695
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1697
  %div20 = udiv i32 %18, %19, !dbg !1697, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1698
  %mul21 = mul i32 %div20, %20, !dbg !1699
  %sub22 = sub i32 %17, %mul21, !dbg !1700
  %shl = shl i32 %sub22, 1, !dbg !1701
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1702
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1703
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1704
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1705
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1705
  %div23 = udiv i32 %21, %22, !dbg !1705, !klee.check.div !111
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1706
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1707
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1708
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1708
  %div24 = udiv i32 %23, %24, !dbg !1708, !klee.check.div !111
  %add25 = add i32 %div23, %div24, !dbg !1709
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1710
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1711
  store i32 %25, i32* %retval, align 4, !dbg !1712
  br label %return, !dbg !1712

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1713
  ret i32 %26, !dbg !1713
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1714 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1717, metadata !DIExpression()), !dbg !1718
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1719, metadata !DIExpression()), !dbg !1720
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1721, metadata !DIExpression()), !dbg !1722
  store i32 0, i32* %s32Temp1, align 4, !dbg !1722
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1723, metadata !DIExpression()), !dbg !1724
  store i32 0, i32* %s32Temp2, align 4, !dbg !1724
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1725, metadata !DIExpression()), !dbg !1726
  store i32 0, i32* %denominator_prime, align 4, !dbg !1726
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1727, metadata !DIExpression()), !dbg !1728
  store i32 0, i32* %u32Temp1, align 4, !dbg !1728
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1729, metadata !DIExpression()), !dbg !1730
  store i32 0, i32* %u32Temp2, align 4, !dbg !1730
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1731, metadata !DIExpression()), !dbg !1732
  store i32 0, i32* %u32numerator, align 4, !dbg !1732
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1733, metadata !DIExpression()), !dbg !1734
  store i32 0, i32* %u32denominator, align 4, !dbg !1734
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1735
  %cmp = icmp slt i32 %0, 0, !dbg !1737
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1738

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1739
  %cmp1 = icmp sle i32 %1, 0, !dbg !1742
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1743

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1744
  %cmp3 = icmp sge i32 %2, 0, !dbg !1747
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1748

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1749
  br label %return, !dbg !1749

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1751
  %sub = sub nsw i32 0, %3, !dbg !1753
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1754
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1755
  %sub5 = sub nsw i32 0, %4, !dbg !1756
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1757
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1758
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1759
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1760
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1761
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1761
  %div = udiv i32 %6, %7, !dbg !1761, !klee.check.div !111
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1762
  %mul = mul i32 %div, %8, !dbg !1763
  %sub6 = sub i32 %5, %mul, !dbg !1764
  %shl = shl i32 %sub6, 1, !dbg !1765
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1766
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1767
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1768
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1769
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1769
  %div7 = udiv i32 %9, %10, !dbg !1769, !klee.check.div !111
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1770
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1771
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1772
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1772
  %div8 = udiv i32 %11, %12, !dbg !1772, !klee.check.div !111
  %add = add i32 %div7, %div8, !dbg !1773
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1774
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1775
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1777
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1778

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1779
  store i32 %14, i32* %retval, align 4, !dbg !1781
  br label %return, !dbg !1781

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1782
  br label %return, !dbg !1782

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1784
  %neg = xor i32 %15, -1, !dbg !1786
  %add13 = add nsw i32 %neg, 1, !dbg !1787
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1788
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1789
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1790
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1791
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1792
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1792
  %div14 = udiv i32 %17, %18, !dbg !1792, !klee.check.div !111
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1793
  %mul15 = mul i32 %div14, %19, !dbg !1794
  %sub16 = sub i32 %16, %mul15, !dbg !1795
  %shl17 = shl i32 %sub16, 1, !dbg !1796
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1797
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1798
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1799
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1800
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1800
  %div18 = udiv i32 %20, %21, !dbg !1800, !klee.check.div !111
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1801
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1802
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1803
  %div19 = sdiv i32 %22, %23, !dbg !1803, !klee.check.div !111
  %add20 = add i32 %div18, %div19, !dbg !1804
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1805
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1806
  %neg21 = xor i32 %24, -1, !dbg !1807
  %add22 = add nsw i32 %neg21, 1, !dbg !1808
  store i32 %add22, i32* %retval, align 4, !dbg !1809
  br label %return, !dbg !1809

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1810
  %cmp24 = icmp sle i32 %25, 0, !dbg !1813
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1814

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1815
  %cmp26 = icmp sge i32 %26, 0, !dbg !1818
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1819

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1820
  br label %return, !dbg !1820

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1822
  %neg29 = xor i32 %27, -1, !dbg !1824
  %add30 = add nsw i32 %neg29, 1, !dbg !1825
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1826
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1827
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1828
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1829
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1830
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1830
  %div31 = udiv i32 %29, %30, !dbg !1830, !klee.check.div !111
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1831
  %mul32 = mul i32 %div31, %31, !dbg !1832
  %sub33 = sub i32 %28, %mul32, !dbg !1833
  %shl34 = shl i32 %sub33, 1, !dbg !1834
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1835
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1836
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1837
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1838
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1838
  %div35 = udiv i32 %32, %33, !dbg !1838, !klee.check.div !111
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1839
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1840
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1841
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1841
  %div36 = udiv i32 %34, %35, !dbg !1841, !klee.check.div !111
  %add37 = add i32 %div35, %div36, !dbg !1842
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1843
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1844
  %neg38 = xor i32 %36, -1, !dbg !1845
  %add39 = add nsw i32 %neg38, 1, !dbg !1846
  store i32 %add39, i32* %retval, align 4, !dbg !1847
  br label %return, !dbg !1847

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1848
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1850
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1851
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1852
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1852
  %div41 = sdiv i32 %38, %39, !dbg !1852, !klee.check.div !111
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1853
  %mul42 = mul nsw i32 %div41, %40, !dbg !1854
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1855
  %shl44 = shl i32 %sub43, 1, !dbg !1856
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1857
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1858
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1859
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1860
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1860
  %div45 = sdiv i32 %41, %42, !dbg !1860, !klee.check.div !111
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1861
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1862
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1863
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1863
  %div46 = udiv i32 %43, %44, !dbg !1863, !klee.check.div !111
  %add47 = add i32 %div45, %div46, !dbg !1864
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1865
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1866
  store i32 %45, i32* %retval, align 4, !dbg !1867
  br label %return, !dbg !1867

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1868
  ret i32 %46, !dbg !1868
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1869 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1872, metadata !DIExpression()), !dbg !1873
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1874, metadata !DIExpression()), !dbg !1875
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1876, metadata !DIExpression()), !dbg !1877
  store i32 0, i32* %numerator_prime, align 4, !dbg !1877
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1878, metadata !DIExpression()), !dbg !1879
  store i32 0, i32* %u32Temp1, align 4, !dbg !1879
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1880, metadata !DIExpression()), !dbg !1881
  store i32 0, i32* %u32Temp2, align 4, !dbg !1881
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1882, metadata !DIExpression()), !dbg !1883
  store i32 0, i32* %u32Temp3, align 4, !dbg !1883
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1884, metadata !DIExpression()), !dbg !1885
  store i32 0, i32* %s32Temp1, align 4, !dbg !1885
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1886, metadata !DIExpression()), !dbg !1887
  store i32 0, i32* %s32Temp2, align 4, !dbg !1887
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1888, metadata !DIExpression()), !dbg !1889
  store i32 0, i32* %s32Temp3, align 4, !dbg !1889
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1890
  %cmp = icmp eq i32 %0, 0, !dbg !1892
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1893

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1894
  %cmp1 = icmp slt i32 %1, 0, !dbg !1897
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1898

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1899
  br label %return, !dbg !1899

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1901
  br label %return, !dbg !1901

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1903
  %cmp4 = icmp slt i32 %2, 0, !dbg !1906
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1907

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1908
  %sub = sub nsw i32 0, %3, !dbg !1910
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1911
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1912
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1913
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1914
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1914
  %div = udiv i32 %4, %5, !dbg !1914, !klee.check.div !111
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1915
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1916
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1917
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1918
  %mul = mul i32 %7, %8, !dbg !1919
  %sub6 = sub i32 %6, %mul, !dbg !1920
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1921
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1922
  %and = and i32 %9, 1, !dbg !1924
  %cmp7 = icmp eq i32 %and, 0, !dbg !1925
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1926

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1927
  %shr = lshr i32 %10, 1, !dbg !1929
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1930
  br label %if.end, !dbg !1931

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %shr10 = lshr i32 %11, 1, !dbg !1934
  %add = add i32 %shr10, 1, !dbg !1935
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1936
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1937
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1939
  %cmp11 = icmp ult i32 %12, %13, !dbg !1940
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1941

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1942
  %neg = xor i32 %14, -1, !dbg !1944
  %add13 = add i32 %neg, 1, !dbg !1945
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1946
  br label %if.end18, !dbg !1947

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1948
  %add15 = add i32 %15, 1, !dbg !1950
  %neg16 = xor i32 %add15, -1, !dbg !1951
  %add17 = add i32 %neg16, 1, !dbg !1952
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1953
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1954
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1956
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1957

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1958
  %conv = trunc i32 %17 to i16, !dbg !1960
  store i16 %conv, i16* %retval, align 2, !dbg !1961
  br label %return, !dbg !1961

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1962
  br label %return, !dbg !1962

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1964
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1966
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1967
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1967
  %div23 = udiv i32 %18, %19, !dbg !1967, !klee.check.div !111
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1968
  %mul24 = mul i32 %div23, %20, !dbg !1969
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1970
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1971
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1972
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1973
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1974
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1974
  %div25 = udiv i32 %22, %23, !dbg !1974, !klee.check.div !111
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1975
  %mul26 = mul i32 %div25, %24, !dbg !1976
  %sub27 = sub i32 %21, %mul26, !dbg !1977
  %shl = shl i32 %sub27, 1, !dbg !1978
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1979
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1980
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1981
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1982
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1982
  %div28 = udiv i32 %25, %26, !dbg !1982, !klee.check.div !111
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1983
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1984
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1985
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1985
  %div29 = udiv i32 %27, %28, !dbg !1985, !klee.check.div !111
  %add30 = add i32 %div28, %div29, !dbg !1986
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1987
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1988
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1990
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1991

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1992
  %conv34 = trunc i32 %30 to i16, !dbg !1994
  store i16 %conv34, i16* %retval, align 2, !dbg !1995
  br label %return, !dbg !1995

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1996
  br label %return, !dbg !1996

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1998
  ret i16 %31, !dbg !1998
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1999 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2005, metadata !DIExpression()), !dbg !2006
  %2 = icmp eq i64 %0, 0, !dbg !2007
  br i1 %2, label %3, label %4, !dbg !2009

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2010
  unreachable, !dbg !2010

4:                                                ; preds = %1
  ret void, !dbg !2011
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2012 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2018, metadata !DIExpression()), !dbg !2020
  call void @llvm.dbg.value(metadata i64 %1, metadata !2019, metadata !DIExpression()), !dbg !2020
  %3 = icmp ult i64 %1, %0, !dbg !2021
  br i1 %3, label %5, label %4, !dbg !2023

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2024
  unreachable, !dbg !2024

5:                                                ; preds = %2
  ret void, !dbg !2026
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080/div_Ccode_alarm_0080.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "data1", scope: !48, file: !49, line: 9, type: !8)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "data2", scope: !48, file: !49, line: 10, type: !8)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 11, type: !19)
!57 = !DILocation(line: 11, column: 14, scope: !48)
!58 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 12, type: !8)
!59 = !DILocation(line: 12, column: 13, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 15, column: 24, scope: !48)
!63 = !DILocation(line: 15, column: 5, scope: !48)
!64 = !DILocation(line: 16, column: 24, scope: !48)
!65 = !DILocation(line: 16, column: 5, scope: !48)
!66 = !DILocation(line: 18, column: 38, scope: !48)
!67 = !DILocation(line: 18, column: 45, scope: !48)
!68 = !DILocation(line: 18, column: 52, scope: !48)
!69 = !DILocation(line: 18, column: 14, scope: !48)
!70 = !DILocation(line: 18, column: 12, scope: !48)
!71 = !DILocation(line: 20, column: 11, scope: !48)
!72 = !DILocation(line: 21, column: 5, scope: !48)
!73 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !74, file: !74, line: 170, type: !75, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080")
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
!1054 = !DILocation(line: 964, column: 15, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1042, file: !74, line: 963, column: 2)
!1056 = !DILocation(line: 964, column: 28, scope: !1055)
!1057 = !DILocation(line: 964, column: 39, scope: !1055)
!1058 = !DILocation(line: 964, column: 37, scope: !1055)
!1059 = !DILocation(line: 964, column: 46, scope: !1055)
!1060 = !DILocation(line: 964, column: 44, scope: !1055)
!1061 = !DILocation(line: 964, column: 24, scope: !1055)
!1062 = !DILocation(line: 964, column: 52, scope: !1055)
!1063 = !DILocation(line: 964, column: 12, scope: !1055)
!1064 = !DILocation(line: 965, column: 15, scope: !1055)
!1065 = !DILocation(line: 965, column: 24, scope: !1055)
!1066 = !DILocation(line: 965, column: 23, scope: !1055)
!1067 = !DILocation(line: 965, column: 32, scope: !1055)
!1068 = !DILocation(line: 965, column: 41, scope: !1055)
!1069 = !DILocation(line: 965, column: 40, scope: !1055)
!1070 = !DILocation(line: 965, column: 29, scope: !1055)
!1071 = !DILocation(line: 965, column: 12, scope: !1055)
!1072 = !DILocation(line: 966, column: 6, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1055, file: !74, line: 966, column: 6)
!1074 = !DILocation(line: 966, column: 15, scope: !1073)
!1075 = !DILocation(line: 966, column: 6, scope: !1055)
!1076 = !DILocation(line: 968, column: 7, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1078, file: !74, line: 968, column: 7)
!1078 = distinct !DILexicalBlock(scope: !1073, file: !74, line: 967, column: 3)
!1079 = !DILocation(line: 968, column: 16, scope: !1077)
!1080 = !DILocation(line: 968, column: 7, scope: !1078)
!1081 = !DILocation(line: 970, column: 17, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1077, file: !74, line: 969, column: 4)
!1083 = !DILocation(line: 970, column: 12, scope: !1082)
!1084 = !DILocation(line: 970, column: 5, scope: !1082)
!1085 = !DILocation(line: 974, column: 5, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1077, file: !74, line: 973, column: 4)
!1087 = !DILocation(line: 979, column: 4, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1073, file: !74, line: 978, column: 3)
!1089 = !DILocation(line: 982, column: 1, scope: !1022)
!1090 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !74, file: !74, line: 1000, type: !1091, scopeLine: 1001, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!6, !6, !6, !18}
!1093 = !DILocalVariable(name: "data1", arg: 1, scope: !1090, file: !74, line: 1000, type: !6)
!1094 = !DILocation(line: 1000, column: 33, scope: !1090)
!1095 = !DILocalVariable(name: "data2", arg: 2, scope: !1090, file: !74, line: 1000, type: !6)
!1096 = !DILocation(line: 1000, column: 43, scope: !1090)
!1097 = !DILocalVariable(name: "denominator", arg: 3, scope: !1090, file: !74, line: 1000, type: !18)
!1098 = !DILocation(line: 1000, column: 53, scope: !1090)
!1099 = !DILocalVariable(name: "s32Result", scope: !1090, file: !74, line: 1002, type: !25)
!1100 = !DILocation(line: 1002, column: 6, scope: !1090)
!1101 = !DILocalVariable(name: "s32Temp1", scope: !1090, file: !74, line: 1002, type: !25)
!1102 = !DILocation(line: 1002, column: 21, scope: !1090)
!1103 = !DILocation(line: 1003, column: 14, scope: !1090)
!1104 = !DILocation(line: 1003, column: 22, scope: !1090)
!1105 = !DILocation(line: 1003, column: 20, scope: !1090)
!1106 = !DILocation(line: 1003, column: 12, scope: !1090)
!1107 = !DILocation(line: 1005, column: 5, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1090, file: !74, line: 1005, column: 5)
!1109 = !DILocation(line: 1005, column: 17, scope: !1108)
!1110 = !DILocation(line: 1005, column: 5, scope: !1090)
!1111 = !DILocation(line: 1007, column: 6, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1113, file: !74, line: 1007, column: 6)
!1113 = distinct !DILexicalBlock(scope: !1108, file: !74, line: 1006, column: 2)
!1114 = !DILocation(line: 1007, column: 16, scope: !1112)
!1115 = !DILocation(line: 1007, column: 6, scope: !1113)
!1116 = !DILocation(line: 1009, column: 4, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1112, file: !74, line: 1008, column: 3)
!1118 = !DILocation(line: 1011, column: 11, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1112, file: !74, line: 1011, column: 11)
!1120 = !DILocation(line: 1011, column: 21, scope: !1119)
!1121 = !DILocation(line: 1011, column: 11, scope: !1112)
!1122 = !DILocation(line: 1013, column: 4, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1119, file: !74, line: 1012, column: 3)
!1124 = !DILocation(line: 1017, column: 4, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1119, file: !74, line: 1016, column: 3)
!1126 = !DILocation(line: 1023, column: 63, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 1023, column: 7)
!1128 = distinct !DILexicalBlock(scope: !1108, file: !74, line: 1021, column: 2)
!1129 = !DILocation(line: 1023, column: 87, scope: !1127)
!1130 = !DILocation(line: 1023, column: 104, scope: !1127)
!1131 = !DILocation(line: 1023, column: 99, scope: !1127)
!1132 = !DILocation(line: 1023, column: 97, scope: !1127)
!1133 = !DILocation(line: 1023, column: 124, scope: !1127)
!1134 = !DILocation(line: 1023, column: 119, scope: !1127)
!1135 = !DILocation(line: 1023, column: 117, scope: !1127)
!1136 = !DILocation(line: 1023, column: 73, scope: !1127)
!1137 = !DILocation(line: 1023, column: 47, scope: !1127)
!1138 = !DILocation(line: 1023, column: 9, scope: !1127)
!1139 = !DILocation(line: 1023, column: 7, scope: !1128)
!1140 = !DILocation(line: 1024, column: 7, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1127, file: !74, line: 1023, column: 142)
!1142 = !DILocation(line: 1027, column: 53, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 1027, column: 7)
!1144 = !DILocation(line: 1027, column: 77, scope: !1143)
!1145 = !DILocation(line: 1027, column: 94, scope: !1143)
!1146 = !DILocation(line: 1027, column: 89, scope: !1143)
!1147 = !DILocation(line: 1027, column: 87, scope: !1143)
!1148 = !DILocation(line: 1027, column: 114, scope: !1143)
!1149 = !DILocation(line: 1027, column: 109, scope: !1143)
!1150 = !DILocation(line: 1027, column: 107, scope: !1143)
!1151 = !DILocation(line: 1027, column: 63, scope: !1143)
!1152 = !DILocation(line: 1027, column: 37, scope: !1143)
!1153 = !DILocation(line: 1027, column: 9, scope: !1143)
!1154 = !DILocation(line: 1027, column: 7, scope: !1128)
!1155 = !DILocation(line: 1028, column: 7, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1143, file: !74, line: 1027, column: 147)
!1157 = !DILocation(line: 1031, column: 50, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 1031, column: 7)
!1159 = !DILocation(line: 1031, column: 67, scope: !1158)
!1160 = !DILocation(line: 1031, column: 62, scope: !1158)
!1161 = !DILocation(line: 1031, column: 60, scope: !1158)
!1162 = !DILocation(line: 1031, column: 34, scope: !1158)
!1163 = !DILocation(line: 1031, column: 97, scope: !1158)
!1164 = !DILocation(line: 1031, column: 92, scope: !1158)
!1165 = !DILocation(line: 1031, column: 82, scope: !1158)
!1166 = !DILocation(line: 1031, column: 9, scope: !1158)
!1167 = !DILocation(line: 1031, column: 7, scope: !1128)
!1168 = !DILocation(line: 1032, column: 7, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1158, file: !74, line: 1031, column: 113)
!1170 = !DILocation(line: 1035, column: 50, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 1035, column: 7)
!1172 = !DILocation(line: 1035, column: 67, scope: !1171)
!1173 = !DILocation(line: 1035, column: 62, scope: !1171)
!1174 = !DILocation(line: 1035, column: 60, scope: !1171)
!1175 = !DILocation(line: 1035, column: 34, scope: !1171)
!1176 = !DILocation(line: 1035, column: 97, scope: !1171)
!1177 = !DILocation(line: 1035, column: 92, scope: !1171)
!1178 = !DILocation(line: 1035, column: 82, scope: !1171)
!1179 = !DILocation(line: 1035, column: 9, scope: !1171)
!1180 = !DILocation(line: 1035, column: 7, scope: !1128)
!1181 = !DILocation(line: 1036, column: 7, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1171, file: !74, line: 1035, column: 113)
!1183 = !DILocation(line: 1038, column: 15, scope: !1128)
!1184 = !DILocation(line: 1038, column: 28, scope: !1128)
!1185 = !DILocation(line: 1038, column: 38, scope: !1128)
!1186 = !DILocation(line: 1038, column: 37, scope: !1128)
!1187 = !DILocation(line: 1038, column: 51, scope: !1128)
!1188 = !DILocation(line: 1038, column: 50, scope: !1128)
!1189 = !DILocation(line: 1038, column: 25, scope: !1128)
!1190 = !DILocation(line: 1038, column: 64, scope: !1128)
!1191 = !DILocation(line: 1038, column: 12, scope: !1128)
!1192 = !DILocation(line: 1040, column: 50, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1128, file: !74, line: 1040, column: 7)
!1194 = !DILocation(line: 1040, column: 66, scope: !1193)
!1195 = !DILocation(line: 1040, column: 61, scope: !1193)
!1196 = !DILocation(line: 1040, column: 59, scope: !1193)
!1197 = !DILocation(line: 1040, column: 34, scope: !1193)
!1198 = !DILocation(line: 1040, column: 97, scope: !1193)
!1199 = !DILocation(line: 1040, column: 114, scope: !1193)
!1200 = !DILocation(line: 1040, column: 109, scope: !1193)
!1201 = !DILocation(line: 1040, column: 107, scope: !1193)
!1202 = !DILocation(line: 1040, column: 81, scope: !1193)
!1203 = !DILocation(line: 1040, column: 9, scope: !1193)
!1204 = !DILocation(line: 1040, column: 7, scope: !1128)
!1205 = !DILocation(line: 1041, column: 7, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1193, file: !74, line: 1040, column: 131)
!1207 = !DILocation(line: 1048, column: 41, scope: !1128)
!1208 = !DILocation(line: 1048, column: 57, scope: !1128)
!1209 = !DILocation(line: 1048, column: 52, scope: !1128)
!1210 = !DILocation(line: 1048, column: 50, scope: !1128)
!1211 = !DILocation(line: 1048, column: 78, scope: !1128)
!1212 = !DILocation(line: 1048, column: 95, scope: !1128)
!1213 = !DILocation(line: 1048, column: 90, scope: !1128)
!1214 = !DILocation(line: 1048, column: 88, scope: !1128)
!1215 = !DILocation(line: 1048, column: 70, scope: !1128)
!1216 = !DILocation(line: 1048, column: 25, scope: !1128)
!1217 = !DILocation(line: 1048, column: 23, scope: !1128)
!1218 = !DILocation(line: 1049, column: 3, scope: !1128)
!1219 = !DILocation(line: 1067, column: 1, scope: !1090)
!1220 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !1221, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1221 = !DISubroutineType(types: !1222)
!1222 = !{!28, !22}
!1223 = !DILocalVariable(name: "left", arg: 1, scope: !1220, file: !33, line: 84, type: !22)
!1224 = !DILocation(line: 84, column: 51, scope: !1220)
!1225 = !DILocation(line: 86, column: 12, scope: !1220)
!1226 = !DILocation(line: 86, column: 17, scope: !1220)
!1227 = !DILocation(line: 86, column: 5, scope: !1220)
!1228 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !1229, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!28, !22, !29}
!1231 = !DILocalVariable(name: "left", arg: 1, scope: !1228, file: !33, line: 90, type: !22)
!1232 = !DILocation(line: 90, column: 41, scope: !1228)
!1233 = !DILocalVariable(name: "count", arg: 2, scope: !1228, file: !33, line: 90, type: !29)
!1234 = !DILocation(line: 90, column: 56, scope: !1228)
!1235 = !DILocation(line: 92, column: 9, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1228, file: !33, line: 92, column: 9)
!1237 = !DILocation(line: 92, column: 15, scope: !1236)
!1238 = !DILocation(line: 92, column: 9, scope: !1228)
!1239 = !DILocation(line: 93, column: 9, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1236, file: !33, line: 92, column: 32)
!1241 = !DILocation(line: 95, column: 12, scope: !1228)
!1242 = !DILocation(line: 95, column: 34, scope: !1228)
!1243 = !DILocation(line: 95, column: 31, scope: !1228)
!1244 = !DILocation(line: 95, column: 17, scope: !1228)
!1245 = !DILocation(line: 95, column: 41, scope: !1228)
!1246 = !DILocation(line: 95, column: 5, scope: !1228)
!1247 = !DILocation(line: 96, column: 1, scope: !1228)
!1248 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !1249, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!28, !22, !22}
!1251 = !DILocalVariable(name: "left", arg: 1, scope: !1248, file: !33, line: 78, type: !22)
!1252 = !DILocation(line: 78, column: 38, scope: !1248)
!1253 = !DILocalVariable(name: "right", arg: 2, scope: !1248, file: !33, line: 78, type: !22)
!1254 = !DILocation(line: 78, column: 52, scope: !1248)
!1255 = !DILocation(line: 80, column: 12, scope: !1248)
!1256 = !DILocation(line: 80, column: 19, scope: !1248)
!1257 = !DILocation(line: 80, column: 17, scope: !1248)
!1258 = !DILocation(line: 80, column: 25, scope: !1248)
!1259 = !DILocation(line: 80, column: 5, scope: !1248)
!1260 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !1249, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1261 = !DILocalVariable(name: "left", arg: 1, scope: !1260, file: !33, line: 72, type: !22)
!1262 = !DILocation(line: 72, column: 38, scope: !1260)
!1263 = !DILocalVariable(name: "right", arg: 2, scope: !1260, file: !33, line: 72, type: !22)
!1264 = !DILocation(line: 72, column: 52, scope: !1260)
!1265 = !DILocation(line: 74, column: 12, scope: !1260)
!1266 = !DILocation(line: 74, column: 19, scope: !1260)
!1267 = !DILocation(line: 74, column: 17, scope: !1260)
!1268 = !DILocation(line: 74, column: 25, scope: !1260)
!1269 = !DILocation(line: 74, column: 5, scope: !1260)
!1270 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !1249, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1271 = !DILocalVariable(name: "left", arg: 1, scope: !1270, file: !33, line: 54, type: !22)
!1272 = !DILocation(line: 54, column: 38, scope: !1270)
!1273 = !DILocalVariable(name: "right", arg: 2, scope: !1270, file: !33, line: 54, type: !22)
!1274 = !DILocation(line: 54, column: 52, scope: !1270)
!1275 = !DILocation(line: 56, column: 12, scope: !1270)
!1276 = !DILocation(line: 56, column: 19, scope: !1270)
!1277 = !DILocation(line: 56, column: 17, scope: !1270)
!1278 = !DILocation(line: 56, column: 25, scope: !1270)
!1279 = !DILocation(line: 56, column: 5, scope: !1270)
!1280 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !74, file: !74, line: 1084, type: !1281, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1281 = !DISubroutineType(types: !1282)
!1282 = !{!433, !433, !25}
!1283 = !DILocalVariable(name: "numerator", arg: 1, scope: !1280, file: !74, line: 1084, type: !433)
!1284 = !DILocation(line: 1084, column: 25, scope: !1280)
!1285 = !DILocalVariable(name: "denominator", arg: 2, scope: !1280, file: !74, line: 1084, type: !25)
!1286 = !DILocation(line: 1084, column: 40, scope: !1280)
!1287 = !DILocalVariable(name: "u32Temp1", scope: !1280, file: !74, line: 1086, type: !433)
!1288 = !DILocation(line: 1086, column: 6, scope: !1280)
!1289 = !DILocation(line: 1087, column: 5, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1280, file: !74, line: 1087, column: 5)
!1291 = !DILocation(line: 1087, column: 17, scope: !1290)
!1292 = !DILocation(line: 1087, column: 5, scope: !1280)
!1293 = !DILocation(line: 1089, column: 3, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1290, file: !74, line: 1088, column: 2)
!1295 = !DILocation(line: 1093, column: 6, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1297, file: !74, line: 1093, column: 6)
!1297 = distinct !DILexicalBlock(scope: !1290, file: !74, line: 1092, column: 2)
!1298 = !DILocation(line: 1093, column: 18, scope: !1296)
!1299 = !DILocation(line: 1093, column: 6, scope: !1297)
!1300 = !DILocation(line: 1095, column: 4, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1296, file: !74, line: 1094, column: 3)
!1302 = !DILocation(line: 1099, column: 16, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1296, file: !74, line: 1098, column: 3)
!1304 = !DILocation(line: 1099, column: 30, scope: !1303)
!1305 = !DILocation(line: 1099, column: 40, scope: !1303)
!1306 = !DILocation(line: 1099, column: 39, scope: !1303)
!1307 = !DILocation(line: 1099, column: 55, scope: !1303)
!1308 = !DILocation(line: 1099, column: 53, scope: !1303)
!1309 = !DILocation(line: 1099, column: 26, scope: !1303)
!1310 = !DILocation(line: 1099, column: 68, scope: !1303)
!1311 = !DILocation(line: 1099, column: 13, scope: !1303)
!1312 = !DILocation(line: 1100, column: 16, scope: !1303)
!1313 = !DILocation(line: 1100, column: 25, scope: !1303)
!1314 = !DILocation(line: 1100, column: 24, scope: !1303)
!1315 = !DILocation(line: 1100, column: 41, scope: !1303)
!1316 = !DILocation(line: 1100, column: 51, scope: !1303)
!1317 = !DILocation(line: 1100, column: 50, scope: !1303)
!1318 = !DILocation(line: 1100, column: 38, scope: !1303)
!1319 = !DILocation(line: 1100, column: 13, scope: !1303)
!1320 = !DILocation(line: 1101, column: 11, scope: !1303)
!1321 = !DILocation(line: 1101, column: 4, scope: !1303)
!1322 = !DILocation(line: 1104, column: 1, scope: !1280)
!1323 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !74, file: !74, line: 1121, type: !1324, scopeLine: 1122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{!433, !25, !433}
!1326 = !DILocalVariable(name: "numerator", arg: 1, scope: !1323, file: !74, line: 1121, type: !25)
!1327 = !DILocation(line: 1121, column: 25, scope: !1323)
!1328 = !DILocalVariable(name: "denominator", arg: 2, scope: !1323, file: !74, line: 1121, type: !433)
!1329 = !DILocation(line: 1121, column: 40, scope: !1323)
!1330 = !DILocalVariable(name: "s32Temp1", scope: !1323, file: !74, line: 1123, type: !25)
!1331 = !DILocation(line: 1123, column: 6, scope: !1323)
!1332 = !DILocation(line: 1124, column: 5, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1323, file: !74, line: 1124, column: 5)
!1334 = !DILocation(line: 1124, column: 17, scope: !1333)
!1335 = !DILocation(line: 1124, column: 5, scope: !1323)
!1336 = !DILocation(line: 1126, column: 6, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1338, file: !74, line: 1126, column: 6)
!1338 = distinct !DILexicalBlock(scope: !1333, file: !74, line: 1125, column: 2)
!1339 = !DILocation(line: 1126, column: 16, scope: !1337)
!1340 = !DILocation(line: 1126, column: 6, scope: !1338)
!1341 = !DILocation(line: 1128, column: 4, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !74, line: 1127, column: 3)
!1343 = !DILocation(line: 1132, column: 4, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1337, file: !74, line: 1131, column: 3)
!1345 = !DILocation(line: 1137, column: 6, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1347, file: !74, line: 1137, column: 6)
!1347 = distinct !DILexicalBlock(scope: !1333, file: !74, line: 1136, column: 2)
!1348 = !DILocation(line: 1137, column: 16, scope: !1346)
!1349 = !DILocation(line: 1137, column: 6, scope: !1347)
!1350 = !DILocation(line: 1139, column: 17, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1346, file: !74, line: 1138, column: 3)
!1352 = !DILocation(line: 1139, column: 31, scope: !1351)
!1353 = !DILocation(line: 1139, column: 41, scope: !1351)
!1354 = !DILocation(line: 1139, column: 40, scope: !1351)
!1355 = !DILocation(line: 1139, column: 56, scope: !1351)
!1356 = !DILocation(line: 1139, column: 54, scope: !1351)
!1357 = !DILocation(line: 1139, column: 27, scope: !1351)
!1358 = !DILocation(line: 1139, column: 69, scope: !1351)
!1359 = !DILocation(line: 1139, column: 13, scope: !1351)
!1360 = !DILocation(line: 1140, column: 13, scope: !1351)
!1361 = !DILocation(line: 1140, column: 23, scope: !1351)
!1362 = !DILocation(line: 1140, column: 22, scope: !1351)
!1363 = !DILocation(line: 1140, column: 39, scope: !1351)
!1364 = !DILocation(line: 1140, column: 48, scope: !1351)
!1365 = !DILocation(line: 1140, column: 47, scope: !1351)
!1366 = !DILocation(line: 1140, column: 36, scope: !1351)
!1367 = !DILocation(line: 1140, column: 4, scope: !1351)
!1368 = !DILocation(line: 1144, column: 4, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1346, file: !74, line: 1143, column: 3)
!1370 = !DILocation(line: 1147, column: 1, scope: !1323)
!1371 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !74, file: !74, line: 1164, type: !1372, scopeLine: 1165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{!433, !25, !25}
!1374 = !DILocalVariable(name: "numerator", arg: 1, scope: !1371, file: !74, line: 1164, type: !25)
!1375 = !DILocation(line: 1164, column: 25, scope: !1371)
!1376 = !DILocalVariable(name: "denominator", arg: 2, scope: !1371, file: !74, line: 1164, type: !25)
!1377 = !DILocation(line: 1164, column: 40, scope: !1371)
!1378 = !DILocalVariable(name: "u32Temp1", scope: !1371, file: !74, line: 1166, type: !433)
!1379 = !DILocation(line: 1166, column: 6, scope: !1371)
!1380 = !DILocalVariable(name: "u32Temp2", scope: !1371, file: !74, line: 1166, type: !433)
!1381 = !DILocation(line: 1166, column: 20, scope: !1371)
!1382 = !DILocation(line: 1167, column: 5, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1371, file: !74, line: 1167, column: 5)
!1384 = !DILocation(line: 1167, column: 17, scope: !1383)
!1385 = !DILocation(line: 1167, column: 5, scope: !1371)
!1386 = !DILocation(line: 1169, column: 6, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1388, file: !74, line: 1169, column: 6)
!1388 = distinct !DILexicalBlock(scope: !1383, file: !74, line: 1168, column: 2)
!1389 = !DILocation(line: 1169, column: 16, scope: !1387)
!1390 = !DILocation(line: 1169, column: 6, scope: !1388)
!1391 = !DILocation(line: 1171, column: 4, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1387, file: !74, line: 1170, column: 3)
!1393 = !DILocation(line: 1175, column: 4, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1387, file: !74, line: 1174, column: 3)
!1395 = !DILocation(line: 1180, column: 6, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1397, file: !74, line: 1180, column: 6)
!1397 = distinct !DILexicalBlock(scope: !1383, file: !74, line: 1179, column: 2)
!1398 = !DILocation(line: 1180, column: 16, scope: !1396)
!1399 = !DILocation(line: 1180, column: 6, scope: !1397)
!1400 = !DILocation(line: 1182, column: 7, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !74, line: 1182, column: 7)
!1402 = distinct !DILexicalBlock(scope: !1396, file: !74, line: 1181, column: 3)
!1403 = !DILocation(line: 1182, column: 17, scope: !1401)
!1404 = !DILocation(line: 1182, column: 7, scope: !1402)
!1405 = !DILocation(line: 1184, column: 5, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !74, line: 1183, column: 4)
!1407 = !DILocation(line: 1188, column: 8, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1409, file: !74, line: 1188, column: 8)
!1409 = distinct !DILexicalBlock(scope: !1401, file: !74, line: 1187, column: 4)
!1410 = !DILocation(line: 1188, column: 20, scope: !1408)
!1411 = !DILocation(line: 1188, column: 8, scope: !1409)
!1412 = !DILocation(line: 1190, column: 6, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1408, file: !74, line: 1189, column: 5)
!1414 = !DILocation(line: 1194, column: 18, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1408, file: !74, line: 1193, column: 5)
!1416 = !DILocation(line: 1194, column: 32, scope: !1415)
!1417 = !DILocation(line: 1194, column: 42, scope: !1415)
!1418 = !DILocation(line: 1194, column: 41, scope: !1415)
!1419 = !DILocation(line: 1194, column: 57, scope: !1415)
!1420 = !DILocation(line: 1194, column: 55, scope: !1415)
!1421 = !DILocation(line: 1194, column: 28, scope: !1415)
!1422 = !DILocation(line: 1194, column: 71, scope: !1415)
!1423 = !DILocation(line: 1194, column: 15, scope: !1415)
!1424 = !DILocation(line: 1195, column: 18, scope: !1415)
!1425 = !DILocation(line: 1195, column: 29, scope: !1415)
!1426 = !DILocation(line: 1195, column: 27, scope: !1415)
!1427 = !DILocation(line: 1195, column: 45, scope: !1415)
!1428 = !DILocation(line: 1195, column: 57, scope: !1415)
!1429 = !DILocation(line: 1195, column: 55, scope: !1415)
!1430 = !DILocation(line: 1195, column: 42, scope: !1415)
!1431 = !DILocation(line: 1195, column: 15, scope: !1415)
!1432 = !DILocation(line: 1196, column: 13, scope: !1415)
!1433 = !DILocation(line: 1196, column: 6, scope: !1415)
!1434 = !DILocation(line: 1202, column: 7, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1436, file: !74, line: 1202, column: 7)
!1436 = distinct !DILexicalBlock(scope: !1396, file: !74, line: 1201, column: 3)
!1437 = !DILocation(line: 1202, column: 19, scope: !1435)
!1438 = !DILocation(line: 1202, column: 7, scope: !1436)
!1439 = !DILocation(line: 1204, column: 5, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1435, file: !74, line: 1203, column: 4)
!1441 = !DILocation(line: 1208, column: 18, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1435, file: !74, line: 1207, column: 4)
!1443 = !DILocation(line: 1208, column: 17, scope: !1442)
!1444 = !DILocation(line: 1208, column: 15, scope: !1442)
!1445 = !DILocation(line: 1209, column: 20, scope: !1442)
!1446 = !DILocation(line: 1209, column: 19, scope: !1442)
!1447 = !DILocation(line: 1209, column: 17, scope: !1442)
!1448 = !DILocation(line: 1210, column: 17, scope: !1442)
!1449 = !DILocation(line: 1210, column: 31, scope: !1442)
!1450 = !DILocation(line: 1210, column: 41, scope: !1442)
!1451 = !DILocation(line: 1210, column: 40, scope: !1442)
!1452 = !DILocation(line: 1210, column: 56, scope: !1442)
!1453 = !DILocation(line: 1210, column: 54, scope: !1442)
!1454 = !DILocation(line: 1210, column: 27, scope: !1442)
!1455 = !DILocation(line: 1210, column: 70, scope: !1442)
!1456 = !DILocation(line: 1210, column: 14, scope: !1442)
!1457 = !DILocation(line: 1211, column: 17, scope: !1442)
!1458 = !DILocation(line: 1211, column: 28, scope: !1442)
!1459 = !DILocation(line: 1211, column: 26, scope: !1442)
!1460 = !DILocation(line: 1211, column: 44, scope: !1442)
!1461 = !DILocation(line: 1211, column: 56, scope: !1442)
!1462 = !DILocation(line: 1211, column: 54, scope: !1442)
!1463 = !DILocation(line: 1211, column: 41, scope: !1442)
!1464 = !DILocation(line: 1211, column: 14, scope: !1442)
!1465 = !DILocation(line: 1212, column: 12, scope: !1442)
!1466 = !DILocation(line: 1212, column: 5, scope: !1442)
!1467 = !DILocation(line: 1217, column: 1, scope: !1371)
!1468 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !74, file: !74, line: 1234, type: !1469, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1469 = !DISubroutineType(types: !1470)
!1470 = !{!433, !433, !433}
!1471 = !DILocalVariable(name: "numerator", arg: 1, scope: !1468, file: !74, line: 1234, type: !433)
!1472 = !DILocation(line: 1234, column: 25, scope: !1468)
!1473 = !DILocalVariable(name: "denominator", arg: 2, scope: !1468, file: !74, line: 1234, type: !433)
!1474 = !DILocation(line: 1234, column: 40, scope: !1468)
!1475 = !DILocalVariable(name: "u32Temp1", scope: !1468, file: !74, line: 1237, type: !433)
!1476 = !DILocation(line: 1237, column: 6, scope: !1468)
!1477 = !DILocalVariable(name: "u32Temp2", scope: !1468, file: !74, line: 1237, type: !433)
!1478 = !DILocation(line: 1237, column: 20, scope: !1468)
!1479 = !DILocalVariable(name: "u32Temp3", scope: !1468, file: !74, line: 1237, type: !433)
!1480 = !DILocation(line: 1237, column: 34, scope: !1468)
!1481 = !DILocalVariable(name: "numerator_old", scope: !1468, file: !74, line: 1237, type: !433)
!1482 = !DILocation(line: 1237, column: 48, scope: !1468)
!1483 = !DILocation(line: 1238, column: 5, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1468, file: !74, line: 1238, column: 5)
!1485 = !DILocation(line: 1238, column: 16, scope: !1484)
!1486 = !DILocation(line: 1238, column: 5, scope: !1468)
!1487 = !DILocation(line: 1240, column: 3, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1484, file: !74, line: 1239, column: 2)
!1489 = !DILocation(line: 1244, column: 14, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1484, file: !74, line: 1243, column: 2)
!1491 = !DILocation(line: 1244, column: 26, scope: !1490)
!1492 = !DILocation(line: 1244, column: 41, scope: !1490)
!1493 = !DILocation(line: 1244, column: 51, scope: !1490)
!1494 = !DILocation(line: 1244, column: 50, scope: !1490)
!1495 = !DILocation(line: 1244, column: 38, scope: !1490)
!1496 = !DILocation(line: 1244, column: 24, scope: !1490)
!1497 = !DILocation(line: 1244, column: 12, scope: !1490)
!1498 = !DILocation(line: 1245, column: 7, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1490, file: !74, line: 1245, column: 6)
!1500 = !DILocation(line: 1245, column: 16, scope: !1499)
!1501 = !DILocation(line: 1245, column: 24, scope: !1499)
!1502 = !DILocation(line: 1245, column: 6, scope: !1490)
!1503 = !DILocation(line: 1247, column: 16, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1499, file: !74, line: 1246, column: 3)
!1505 = !DILocation(line: 1247, column: 27, scope: !1504)
!1506 = !DILocation(line: 1247, column: 13, scope: !1504)
!1507 = !DILocation(line: 1248, column: 3, scope: !1504)
!1508 = !DILocation(line: 1251, column: 16, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1499, file: !74, line: 1250, column: 3)
!1510 = !DILocation(line: 1251, column: 27, scope: !1509)
!1511 = !DILocation(line: 1251, column: 32, scope: !1509)
!1512 = !DILocation(line: 1251, column: 13, scope: !1509)
!1513 = !DILocation(line: 1254, column: 6, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1490, file: !74, line: 1254, column: 6)
!1515 = !DILocation(line: 1254, column: 17, scope: !1514)
!1516 = !DILocation(line: 1254, column: 15, scope: !1514)
!1517 = !DILocation(line: 1254, column: 6, scope: !1490)
!1518 = !DILocation(line: 1256, column: 12, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1514, file: !74, line: 1255, column: 3)
!1520 = !DILocation(line: 1256, column: 22, scope: !1519)
!1521 = !DILocation(line: 1256, column: 21, scope: !1519)
!1522 = !DILocation(line: 1256, column: 4, scope: !1519)
!1523 = !DILocation(line: 1260, column: 13, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1514, file: !74, line: 1259, column: 3)
!1525 = !DILocation(line: 1260, column: 23, scope: !1524)
!1526 = !DILocation(line: 1260, column: 22, scope: !1524)
!1527 = !DILocation(line: 1260, column: 36, scope: !1524)
!1528 = !DILocation(line: 1260, column: 4, scope: !1524)
!1529 = !DILocation(line: 1265, column: 1, scope: !1468)
!1530 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !74, file: !74, line: 1282, type: !1531, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{!25, !433, !25}
!1533 = !DILocalVariable(name: "numerator", arg: 1, scope: !1530, file: !74, line: 1282, type: !433)
!1534 = !DILocation(line: 1282, column: 25, scope: !1530)
!1535 = !DILocalVariable(name: "denominator", arg: 2, scope: !1530, file: !74, line: 1282, type: !25)
!1536 = !DILocation(line: 1282, column: 40, scope: !1530)
!1537 = !DILocalVariable(name: "u32Temp1", scope: !1530, file: !74, line: 1284, type: !433)
!1538 = !DILocation(line: 1284, column: 6, scope: !1530)
!1539 = !DILocalVariable(name: "u32Temp2", scope: !1530, file: !74, line: 1284, type: !433)
!1540 = !DILocation(line: 1284, column: 20, scope: !1530)
!1541 = !DILocation(line: 1285, column: 5, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1530, file: !74, line: 1285, column: 5)
!1543 = !DILocation(line: 1285, column: 17, scope: !1542)
!1544 = !DILocation(line: 1285, column: 5, scope: !1530)
!1545 = !DILocation(line: 1287, column: 6, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1547, file: !74, line: 1287, column: 6)
!1547 = distinct !DILexicalBlock(scope: !1542, file: !74, line: 1286, column: 2)
!1548 = !DILocation(line: 1287, column: 18, scope: !1546)
!1549 = !DILocation(line: 1287, column: 6, scope: !1547)
!1550 = !DILocation(line: 1289, column: 4, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1546, file: !74, line: 1288, column: 3)
!1552 = !DILocation(line: 1293, column: 19, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1546, file: !74, line: 1292, column: 3)
!1554 = !DILocation(line: 1293, column: 18, scope: !1553)
!1555 = !DILocation(line: 1293, column: 16, scope: !1553)
!1556 = !DILocation(line: 1294, column: 16, scope: !1553)
!1557 = !DILocation(line: 1294, column: 30, scope: !1553)
!1558 = !DILocation(line: 1294, column: 40, scope: !1553)
!1559 = !DILocation(line: 1294, column: 39, scope: !1553)
!1560 = !DILocation(line: 1294, column: 55, scope: !1553)
!1561 = !DILocation(line: 1294, column: 53, scope: !1553)
!1562 = !DILocation(line: 1294, column: 26, scope: !1553)
!1563 = !DILocation(line: 1294, column: 69, scope: !1553)
!1564 = !DILocation(line: 1294, column: 13, scope: !1553)
!1565 = !DILocation(line: 1295, column: 16, scope: !1553)
!1566 = !DILocation(line: 1295, column: 25, scope: !1553)
!1567 = !DILocation(line: 1295, column: 24, scope: !1553)
!1568 = !DILocation(line: 1295, column: 41, scope: !1553)
!1569 = !DILocation(line: 1295, column: 51, scope: !1553)
!1570 = !DILocation(line: 1295, column: 50, scope: !1553)
!1571 = !DILocation(line: 1295, column: 38, scope: !1553)
!1572 = !DILocation(line: 1295, column: 13, scope: !1553)
!1573 = !DILocation(line: 1296, column: 7, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1553, file: !74, line: 1296, column: 7)
!1575 = !DILocation(line: 1296, column: 16, scope: !1574)
!1576 = !DILocation(line: 1296, column: 7, scope: !1553)
!1577 = !DILocation(line: 1298, column: 13, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1574, file: !74, line: 1297, column: 4)
!1579 = !DILocation(line: 1298, column: 12, scope: !1578)
!1580 = !DILocation(line: 1298, column: 5, scope: !1578)
!1581 = !DILocation(line: 1302, column: 5, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1574, file: !74, line: 1301, column: 4)
!1583 = !DILocation(line: 1308, column: 15, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1542, file: !74, line: 1307, column: 2)
!1585 = !DILocation(line: 1308, column: 29, scope: !1584)
!1586 = !DILocation(line: 1308, column: 39, scope: !1584)
!1587 = !DILocation(line: 1308, column: 38, scope: !1584)
!1588 = !DILocation(line: 1308, column: 54, scope: !1584)
!1589 = !DILocation(line: 1308, column: 52, scope: !1584)
!1590 = !DILocation(line: 1308, column: 25, scope: !1584)
!1591 = !DILocation(line: 1308, column: 68, scope: !1584)
!1592 = !DILocation(line: 1308, column: 12, scope: !1584)
!1593 = !DILocation(line: 1309, column: 15, scope: !1584)
!1594 = !DILocation(line: 1309, column: 24, scope: !1584)
!1595 = !DILocation(line: 1309, column: 23, scope: !1584)
!1596 = !DILocation(line: 1309, column: 40, scope: !1584)
!1597 = !DILocation(line: 1309, column: 50, scope: !1584)
!1598 = !DILocation(line: 1309, column: 49, scope: !1584)
!1599 = !DILocation(line: 1309, column: 37, scope: !1584)
!1600 = !DILocation(line: 1309, column: 12, scope: !1584)
!1601 = !DILocation(line: 1310, column: 6, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1584, file: !74, line: 1310, column: 6)
!1603 = !DILocation(line: 1310, column: 15, scope: !1602)
!1604 = !DILocation(line: 1310, column: 6, scope: !1584)
!1605 = !DILocation(line: 1312, column: 11, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1602, file: !74, line: 1311, column: 3)
!1607 = !DILocation(line: 1312, column: 4, scope: !1606)
!1608 = !DILocation(line: 1316, column: 4, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1602, file: !74, line: 1315, column: 3)
!1610 = !DILocation(line: 1319, column: 1, scope: !1530)
!1611 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !74, file: !74, line: 1337, type: !1612, scopeLine: 1338, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1612 = !DISubroutineType(types: !1613)
!1613 = !{!25, !25, !433}
!1614 = !DILocalVariable(name: "numerator", arg: 1, scope: !1611, file: !74, line: 1337, type: !25)
!1615 = !DILocation(line: 1337, column: 25, scope: !1611)
!1616 = !DILocalVariable(name: "denominator", arg: 2, scope: !1611, file: !74, line: 1337, type: !433)
!1617 = !DILocation(line: 1337, column: 40, scope: !1611)
!1618 = !DILocalVariable(name: "s32Temp1", scope: !1611, file: !74, line: 1339, type: !25)
!1619 = !DILocation(line: 1339, column: 6, scope: !1611)
!1620 = !DILocalVariable(name: "s32Temp2", scope: !1611, file: !74, line: 1339, type: !25)
!1621 = !DILocation(line: 1339, column: 20, scope: !1611)
!1622 = !DILocalVariable(name: "u32Temp0", scope: !1611, file: !74, line: 1340, type: !433)
!1623 = !DILocation(line: 1340, column: 6, scope: !1611)
!1624 = !DILocalVariable(name: "u32Temp1", scope: !1611, file: !74, line: 1340, type: !433)
!1625 = !DILocation(line: 1340, column: 20, scope: !1611)
!1626 = !DILocalVariable(name: "u32Temp2", scope: !1611, file: !74, line: 1340, type: !433)
!1627 = !DILocation(line: 1340, column: 34, scope: !1611)
!1628 = !DILocation(line: 1341, column: 5, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1611, file: !74, line: 1341, column: 5)
!1630 = !DILocation(line: 1341, column: 17, scope: !1629)
!1631 = !DILocation(line: 1341, column: 5, scope: !1611)
!1632 = !DILocation(line: 1343, column: 6, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1634, file: !74, line: 1343, column: 6)
!1634 = distinct !DILexicalBlock(scope: !1629, file: !74, line: 1342, column: 2)
!1635 = !DILocation(line: 1343, column: 16, scope: !1633)
!1636 = !DILocation(line: 1343, column: 6, scope: !1634)
!1637 = !DILocation(line: 1345, column: 4, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1633, file: !74, line: 1344, column: 3)
!1639 = !DILocation(line: 1349, column: 4, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1633, file: !74, line: 1348, column: 3)
!1641 = !DILocation(line: 1354, column: 6, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1643, file: !74, line: 1354, column: 6)
!1643 = distinct !DILexicalBlock(scope: !1629, file: !74, line: 1353, column: 2)
!1644 = !DILocation(line: 1354, column: 16, scope: !1642)
!1645 = !DILocation(line: 1354, column: 6, scope: !1643)
!1646 = !DILocation(line: 1356, column: 16, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1642, file: !74, line: 1355, column: 3)
!1648 = !DILocation(line: 1356, column: 15, scope: !1647)
!1649 = !DILocation(line: 1356, column: 13, scope: !1647)
!1650 = !DILocation(line: 1357, column: 16, scope: !1647)
!1651 = !DILocation(line: 1357, column: 25, scope: !1647)
!1652 = !DILocation(line: 1357, column: 24, scope: !1647)
!1653 = !DILocation(line: 1357, column: 13, scope: !1647)
!1654 = !DILocation(line: 1358, column: 15, scope: !1647)
!1655 = !DILocation(line: 1358, column: 28, scope: !1647)
!1656 = !DILocation(line: 1358, column: 37, scope: !1647)
!1657 = !DILocation(line: 1358, column: 36, scope: !1647)
!1658 = !DILocation(line: 1358, column: 52, scope: !1647)
!1659 = !DILocation(line: 1358, column: 50, scope: !1647)
!1660 = !DILocation(line: 1358, column: 24, scope: !1647)
!1661 = !DILocation(line: 1358, column: 13, scope: !1647)
!1662 = !DILocation(line: 1360, column: 8, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1360, column: 7)
!1664 = !DILocation(line: 1360, column: 20, scope: !1663)
!1665 = !DILocation(line: 1360, column: 27, scope: !1663)
!1666 = !DILocation(line: 1360, column: 7, scope: !1647)
!1667 = !DILocation(line: 1362, column: 20, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1663, file: !74, line: 1361, column: 4)
!1669 = !DILocation(line: 1362, column: 32, scope: !1668)
!1670 = !DILocation(line: 1362, column: 17, scope: !1668)
!1671 = !DILocation(line: 1363, column: 4, scope: !1668)
!1672 = !DILocation(line: 1366, column: 20, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1663, file: !74, line: 1365, column: 4)
!1674 = !DILocation(line: 1366, column: 32, scope: !1673)
!1675 = !DILocation(line: 1366, column: 38, scope: !1673)
!1676 = !DILocation(line: 1366, column: 17, scope: !1673)
!1677 = !DILocation(line: 1370, column: 7, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1647, file: !74, line: 1370, column: 7)
!1679 = !DILocation(line: 1370, column: 18, scope: !1678)
!1680 = !DILocation(line: 1370, column: 16, scope: !1678)
!1681 = !DILocation(line: 1370, column: 7, scope: !1647)
!1682 = !DILocation(line: 1372, column: 14, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1678, file: !74, line: 1371, column: 4)
!1684 = !DILocation(line: 1372, column: 13, scope: !1683)
!1685 = !DILocation(line: 1372, column: 23, scope: !1683)
!1686 = !DILocation(line: 1372, column: 5, scope: !1683)
!1687 = !DILocation(line: 1376, column: 14, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1678, file: !74, line: 1375, column: 4)
!1689 = !DILocation(line: 1376, column: 23, scope: !1688)
!1690 = !DILocation(line: 1376, column: 12, scope: !1688)
!1691 = !DILocation(line: 1376, column: 27, scope: !1688)
!1692 = !DILocation(line: 1376, column: 5, scope: !1688)
!1693 = !DILocation(line: 1383, column: 16, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1642, file: !74, line: 1382, column: 3)
!1695 = !DILocation(line: 1383, column: 30, scope: !1694)
!1696 = !DILocation(line: 1383, column: 40, scope: !1694)
!1697 = !DILocation(line: 1383, column: 39, scope: !1694)
!1698 = !DILocation(line: 1383, column: 55, scope: !1694)
!1699 = !DILocation(line: 1383, column: 53, scope: !1694)
!1700 = !DILocation(line: 1383, column: 26, scope: !1694)
!1701 = !DILocation(line: 1383, column: 69, scope: !1694)
!1702 = !DILocation(line: 1383, column: 13, scope: !1694)
!1703 = !DILocation(line: 1384, column: 16, scope: !1694)
!1704 = !DILocation(line: 1384, column: 26, scope: !1694)
!1705 = !DILocation(line: 1384, column: 25, scope: !1694)
!1706 = !DILocation(line: 1384, column: 42, scope: !1694)
!1707 = !DILocation(line: 1384, column: 51, scope: !1694)
!1708 = !DILocation(line: 1384, column: 50, scope: !1694)
!1709 = !DILocation(line: 1384, column: 39, scope: !1694)
!1710 = !DILocation(line: 1384, column: 13, scope: !1694)
!1711 = !DILocation(line: 1385, column: 11, scope: !1694)
!1712 = !DILocation(line: 1385, column: 4, scope: !1694)
!1713 = !DILocation(line: 1388, column: 1, scope: !1611)
!1714 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !74, file: !74, line: 1405, type: !1715, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1715 = !DISubroutineType(types: !1716)
!1716 = !{!25, !25, !25}
!1717 = !DILocalVariable(name: "numerator", arg: 1, scope: !1714, file: !74, line: 1405, type: !25)
!1718 = !DILocation(line: 1405, column: 25, scope: !1714)
!1719 = !DILocalVariable(name: "denominator", arg: 2, scope: !1714, file: !74, line: 1405, type: !25)
!1720 = !DILocation(line: 1405, column: 40, scope: !1714)
!1721 = !DILocalVariable(name: "s32Temp1", scope: !1714, file: !74, line: 1407, type: !25)
!1722 = !DILocation(line: 1407, column: 6, scope: !1714)
!1723 = !DILocalVariable(name: "s32Temp2", scope: !1714, file: !74, line: 1407, type: !25)
!1724 = !DILocation(line: 1407, column: 20, scope: !1714)
!1725 = !DILocalVariable(name: "denominator_prime", scope: !1714, file: !74, line: 1408, type: !433)
!1726 = !DILocation(line: 1408, column: 6, scope: !1714)
!1727 = !DILocalVariable(name: "u32Temp1", scope: !1714, file: !74, line: 1408, type: !433)
!1728 = !DILocation(line: 1408, column: 29, scope: !1714)
!1729 = !DILocalVariable(name: "u32Temp2", scope: !1714, file: !74, line: 1408, type: !433)
!1730 = !DILocation(line: 1408, column: 43, scope: !1714)
!1731 = !DILocalVariable(name: "u32numerator", scope: !1714, file: !74, line: 1409, type: !433)
!1732 = !DILocation(line: 1409, column: 6, scope: !1714)
!1733 = !DILocalVariable(name: "u32denominator", scope: !1714, file: !74, line: 1409, type: !433)
!1734 = !DILocation(line: 1409, column: 23, scope: !1714)
!1735 = !DILocation(line: 1410, column: 5, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1714, file: !74, line: 1410, column: 5)
!1737 = !DILocation(line: 1410, column: 15, scope: !1736)
!1738 = !DILocation(line: 1410, column: 5, scope: !1714)
!1739 = !DILocation(line: 1412, column: 6, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1741, file: !74, line: 1412, column: 6)
!1741 = distinct !DILexicalBlock(scope: !1736, file: !74, line: 1411, column: 2)
!1742 = !DILocation(line: 1412, column: 18, scope: !1740)
!1743 = !DILocation(line: 1412, column: 6, scope: !1741)
!1744 = !DILocation(line: 1414, column: 7, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1746, file: !74, line: 1414, column: 7)
!1746 = distinct !DILexicalBlock(scope: !1740, file: !74, line: 1413, column: 3)
!1747 = !DILocation(line: 1414, column: 19, scope: !1745)
!1748 = !DILocation(line: 1414, column: 7, scope: !1746)
!1749 = !DILocation(line: 1416, column: 5, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1745, file: !74, line: 1415, column: 4)
!1751 = !DILocation(line: 1420, column: 21, scope: !1752)
!1752 = distinct !DILexicalBlock(scope: !1745, file: !74, line: 1419, column: 4)
!1753 = !DILocation(line: 1420, column: 20, scope: !1752)
!1754 = !DILocation(line: 1420, column: 18, scope: !1752)
!1755 = !DILocation(line: 1421, column: 23, scope: !1752)
!1756 = !DILocation(line: 1421, column: 22, scope: !1752)
!1757 = !DILocation(line: 1421, column: 20, scope: !1752)
!1758 = !DILocation(line: 1422, column: 16, scope: !1752)
!1759 = !DILocation(line: 1422, column: 33, scope: !1752)
!1760 = !DILocation(line: 1422, column: 46, scope: !1752)
!1761 = !DILocation(line: 1422, column: 45, scope: !1752)
!1762 = !DILocation(line: 1422, column: 64, scope: !1752)
!1763 = !DILocation(line: 1422, column: 62, scope: !1752)
!1764 = !DILocation(line: 1422, column: 29, scope: !1752)
!1765 = !DILocation(line: 1422, column: 81, scope: !1752)
!1766 = !DILocation(line: 1422, column: 14, scope: !1752)
!1767 = !DILocation(line: 1423, column: 17, scope: !1752)
!1768 = !DILocation(line: 1423, column: 30, scope: !1752)
!1769 = !DILocation(line: 1423, column: 29, scope: !1752)
!1770 = !DILocation(line: 1423, column: 49, scope: !1752)
!1771 = !DILocation(line: 1423, column: 58, scope: !1752)
!1772 = !DILocation(line: 1423, column: 57, scope: !1752)
!1773 = !DILocation(line: 1423, column: 46, scope: !1752)
!1774 = !DILocation(line: 1423, column: 14, scope: !1752)
!1775 = !DILocation(line: 1424, column: 8, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1752, file: !74, line: 1424, column: 8)
!1777 = !DILocation(line: 1424, column: 17, scope: !1776)
!1778 = !DILocation(line: 1424, column: 8, scope: !1752)
!1779 = !DILocation(line: 1426, column: 13, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1776, file: !74, line: 1425, column: 5)
!1781 = !DILocation(line: 1426, column: 6, scope: !1780)
!1782 = !DILocation(line: 1430, column: 6, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1776, file: !74, line: 1429, column: 5)
!1784 = !DILocation(line: 1436, column: 20, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1740, file: !74, line: 1435, column: 3)
!1786 = !DILocation(line: 1436, column: 19, scope: !1785)
!1787 = !DILocation(line: 1436, column: 29, scope: !1785)
!1788 = !DILocation(line: 1436, column: 17, scope: !1785)
!1789 = !DILocation(line: 1437, column: 16, scope: !1785)
!1790 = !DILocation(line: 1437, column: 33, scope: !1785)
!1791 = !DILocation(line: 1437, column: 46, scope: !1785)
!1792 = !DILocation(line: 1437, column: 45, scope: !1785)
!1793 = !DILocation(line: 1437, column: 61, scope: !1785)
!1794 = !DILocation(line: 1437, column: 59, scope: !1785)
!1795 = !DILocation(line: 1437, column: 29, scope: !1785)
!1796 = !DILocation(line: 1437, column: 75, scope: !1785)
!1797 = !DILocation(line: 1437, column: 13, scope: !1785)
!1798 = !DILocation(line: 1438, column: 16, scope: !1785)
!1799 = !DILocation(line: 1438, column: 29, scope: !1785)
!1800 = !DILocation(line: 1438, column: 28, scope: !1785)
!1801 = !DILocation(line: 1438, column: 45, scope: !1785)
!1802 = !DILocation(line: 1438, column: 54, scope: !1785)
!1803 = !DILocation(line: 1438, column: 53, scope: !1785)
!1804 = !DILocation(line: 1438, column: 42, scope: !1785)
!1805 = !DILocation(line: 1438, column: 13, scope: !1785)
!1806 = !DILocation(line: 1439, column: 13, scope: !1785)
!1807 = !DILocation(line: 1439, column: 12, scope: !1785)
!1808 = !DILocation(line: 1439, column: 22, scope: !1785)
!1809 = !DILocation(line: 1439, column: 4, scope: !1785)
!1810 = !DILocation(line: 1444, column: 6, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1812, file: !74, line: 1444, column: 6)
!1812 = distinct !DILexicalBlock(scope: !1736, file: !74, line: 1443, column: 2)
!1813 = !DILocation(line: 1444, column: 18, scope: !1811)
!1814 = !DILocation(line: 1444, column: 6, scope: !1812)
!1815 = !DILocation(line: 1446, column: 7, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1817, file: !74, line: 1446, column: 7)
!1817 = distinct !DILexicalBlock(scope: !1811, file: !74, line: 1445, column: 3)
!1818 = !DILocation(line: 1446, column: 19, scope: !1816)
!1819 = !DILocation(line: 1446, column: 7, scope: !1817)
!1820 = !DILocation(line: 1448, column: 5, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1816, file: !74, line: 1447, column: 4)
!1822 = !DILocation(line: 1452, column: 23, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1816, file: !74, line: 1451, column: 4)
!1824 = !DILocation(line: 1452, column: 22, scope: !1823)
!1825 = !DILocation(line: 1452, column: 35, scope: !1823)
!1826 = !DILocation(line: 1452, column: 20, scope: !1823)
!1827 = !DILocation(line: 1453, column: 17, scope: !1823)
!1828 = !DILocation(line: 1453, column: 31, scope: !1823)
!1829 = !DILocation(line: 1453, column: 41, scope: !1823)
!1830 = !DILocation(line: 1453, column: 40, scope: !1823)
!1831 = !DILocation(line: 1453, column: 59, scope: !1823)
!1832 = !DILocation(line: 1453, column: 57, scope: !1823)
!1833 = !DILocation(line: 1453, column: 27, scope: !1823)
!1834 = !DILocation(line: 1453, column: 76, scope: !1823)
!1835 = !DILocation(line: 1453, column: 14, scope: !1823)
!1836 = !DILocation(line: 1454, column: 17, scope: !1823)
!1837 = !DILocation(line: 1454, column: 27, scope: !1823)
!1838 = !DILocation(line: 1454, column: 26, scope: !1823)
!1839 = !DILocation(line: 1454, column: 46, scope: !1823)
!1840 = !DILocation(line: 1454, column: 55, scope: !1823)
!1841 = !DILocation(line: 1454, column: 54, scope: !1823)
!1842 = !DILocation(line: 1454, column: 43, scope: !1823)
!1843 = !DILocation(line: 1454, column: 14, scope: !1823)
!1844 = !DILocation(line: 1455, column: 14, scope: !1823)
!1845 = !DILocation(line: 1455, column: 13, scope: !1823)
!1846 = !DILocation(line: 1455, column: 23, scope: !1823)
!1847 = !DILocation(line: 1455, column: 5, scope: !1823)
!1848 = !DILocation(line: 1460, column: 16, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1811, file: !74, line: 1459, column: 3)
!1850 = !DILocation(line: 1460, column: 30, scope: !1849)
!1851 = !DILocation(line: 1460, column: 40, scope: !1849)
!1852 = !DILocation(line: 1460, column: 39, scope: !1849)
!1853 = !DILocation(line: 1460, column: 55, scope: !1849)
!1854 = !DILocation(line: 1460, column: 53, scope: !1849)
!1855 = !DILocation(line: 1460, column: 26, scope: !1849)
!1856 = !DILocation(line: 1460, column: 69, scope: !1849)
!1857 = !DILocation(line: 1460, column: 13, scope: !1849)
!1858 = !DILocation(line: 1461, column: 16, scope: !1849)
!1859 = !DILocation(line: 1461, column: 26, scope: !1849)
!1860 = !DILocation(line: 1461, column: 25, scope: !1849)
!1861 = !DILocation(line: 1461, column: 42, scope: !1849)
!1862 = !DILocation(line: 1461, column: 51, scope: !1849)
!1863 = !DILocation(line: 1461, column: 50, scope: !1849)
!1864 = !DILocation(line: 1461, column: 39, scope: !1849)
!1865 = !DILocation(line: 1461, column: 13, scope: !1849)
!1866 = !DILocation(line: 1462, column: 11, scope: !1849)
!1867 = !DILocation(line: 1462, column: 4, scope: !1849)
!1868 = !DILocation(line: 1465, column: 1, scope: !1714)
!1869 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !74, file: !74, line: 1483, type: !1870, scopeLine: 1484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!6, !25, !433}
!1872 = !DILocalVariable(name: "numerator", arg: 1, scope: !1869, file: !74, line: 1483, type: !25)
!1873 = !DILocation(line: 1483, column: 25, scope: !1869)
!1874 = !DILocalVariable(name: "denominator", arg: 2, scope: !1869, file: !74, line: 1483, type: !433)
!1875 = !DILocation(line: 1483, column: 40, scope: !1869)
!1876 = !DILocalVariable(name: "numerator_prime", scope: !1869, file: !74, line: 1486, type: !433)
!1877 = !DILocation(line: 1486, column: 6, scope: !1869)
!1878 = !DILocalVariable(name: "u32Temp1", scope: !1869, file: !74, line: 1486, type: !433)
!1879 = !DILocation(line: 1486, column: 27, scope: !1869)
!1880 = !DILocalVariable(name: "u32Temp2", scope: !1869, file: !74, line: 1486, type: !433)
!1881 = !DILocation(line: 1486, column: 41, scope: !1869)
!1882 = !DILocalVariable(name: "u32Temp3", scope: !1869, file: !74, line: 1486, type: !433)
!1883 = !DILocation(line: 1486, column: 55, scope: !1869)
!1884 = !DILocalVariable(name: "s32Temp1", scope: !1869, file: !74, line: 1487, type: !25)
!1885 = !DILocation(line: 1487, column: 6, scope: !1869)
!1886 = !DILocalVariable(name: "s32Temp2", scope: !1869, file: !74, line: 1487, type: !25)
!1887 = !DILocation(line: 1487, column: 20, scope: !1869)
!1888 = !DILocalVariable(name: "s32Temp3", scope: !1869, file: !74, line: 1487, type: !25)
!1889 = !DILocation(line: 1487, column: 34, scope: !1869)
!1890 = !DILocation(line: 1488, column: 5, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1869, file: !74, line: 1488, column: 5)
!1892 = !DILocation(line: 1488, column: 17, scope: !1891)
!1893 = !DILocation(line: 1488, column: 5, scope: !1869)
!1894 = !DILocation(line: 1490, column: 6, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1896, file: !74, line: 1490, column: 6)
!1896 = distinct !DILexicalBlock(scope: !1891, file: !74, line: 1489, column: 2)
!1897 = !DILocation(line: 1490, column: 15, scope: !1895)
!1898 = !DILocation(line: 1490, column: 6, scope: !1896)
!1899 = !DILocation(line: 1492, column: 4, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1895, file: !74, line: 1491, column: 3)
!1901 = !DILocation(line: 1496, column: 4, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1895, file: !74, line: 1495, column: 3)
!1903 = !DILocation(line: 1501, column: 6, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1905, file: !74, line: 1501, column: 6)
!1905 = distinct !DILexicalBlock(scope: !1891, file: !74, line: 1500, column: 2)
!1906 = !DILocation(line: 1501, column: 16, scope: !1904)
!1907 = !DILocation(line: 1501, column: 6, scope: !1905)
!1908 = !DILocation(line: 1503, column: 23, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1904, file: !74, line: 1502, column: 3)
!1910 = !DILocation(line: 1503, column: 22, scope: !1909)
!1911 = !DILocation(line: 1503, column: 20, scope: !1909)
!1912 = !DILocation(line: 1504, column: 16, scope: !1909)
!1913 = !DILocation(line: 1504, column: 32, scope: !1909)
!1914 = !DILocation(line: 1504, column: 31, scope: !1909)
!1915 = !DILocation(line: 1504, column: 13, scope: !1909)
!1916 = !DILocation(line: 1505, column: 15, scope: !1909)
!1917 = !DILocation(line: 1505, column: 34, scope: !1909)
!1918 = !DILocation(line: 1505, column: 45, scope: !1909)
!1919 = !DILocation(line: 1505, column: 43, scope: !1909)
!1920 = !DILocation(line: 1505, column: 31, scope: !1909)
!1921 = !DILocation(line: 1505, column: 13, scope: !1909)
!1922 = !DILocation(line: 1507, column: 8, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1507, column: 7)
!1924 = !DILocation(line: 1507, column: 20, scope: !1923)
!1925 = !DILocation(line: 1507, column: 27, scope: !1923)
!1926 = !DILocation(line: 1507, column: 7, scope: !1909)
!1927 = !DILocation(line: 1509, column: 19, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1923, file: !74, line: 1508, column: 4)
!1929 = !DILocation(line: 1509, column: 31, scope: !1928)
!1930 = !DILocation(line: 1509, column: 17, scope: !1928)
!1931 = !DILocation(line: 1510, column: 4, scope: !1928)
!1932 = !DILocation(line: 1513, column: 20, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1923, file: !74, line: 1512, column: 4)
!1934 = !DILocation(line: 1513, column: 32, scope: !1933)
!1935 = !DILocation(line: 1513, column: 38, scope: !1933)
!1936 = !DILocation(line: 1513, column: 17, scope: !1933)
!1937 = !DILocation(line: 1516, column: 7, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1516, column: 7)
!1939 = !DILocation(line: 1516, column: 18, scope: !1938)
!1940 = !DILocation(line: 1516, column: 16, scope: !1938)
!1941 = !DILocation(line: 1516, column: 7, scope: !1909)
!1942 = !DILocation(line: 1518, column: 18, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1938, file: !74, line: 1517, column: 4)
!1944 = !DILocation(line: 1518, column: 16, scope: !1943)
!1945 = !DILocation(line: 1518, column: 28, scope: !1943)
!1946 = !DILocation(line: 1518, column: 14, scope: !1943)
!1947 = !DILocation(line: 1519, column: 4, scope: !1943)
!1948 = !DILocation(line: 1522, column: 18, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1938, file: !74, line: 1521, column: 4)
!1950 = !DILocation(line: 1522, column: 26, scope: !1949)
!1951 = !DILocation(line: 1522, column: 16, scope: !1949)
!1952 = !DILocation(line: 1522, column: 30, scope: !1949)
!1953 = !DILocation(line: 1522, column: 14, scope: !1949)
!1954 = !DILocation(line: 1524, column: 8, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1909, file: !74, line: 1524, column: 7)
!1956 = !DILocation(line: 1524, column: 18, scope: !1955)
!1957 = !DILocation(line: 1524, column: 7, scope: !1909)
!1958 = !DILocation(line: 1526, column: 18, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1955, file: !74, line: 1525, column: 4)
!1960 = !DILocation(line: 1526, column: 12, scope: !1959)
!1961 = !DILocation(line: 1526, column: 5, scope: !1959)
!1962 = !DILocation(line: 1530, column: 5, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1955, file: !74, line: 1529, column: 4)
!1964 = !DILocation(line: 1535, column: 16, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1904, file: !74, line: 1534, column: 3)
!1966 = !DILocation(line: 1535, column: 26, scope: !1965)
!1967 = !DILocation(line: 1535, column: 25, scope: !1965)
!1968 = !DILocation(line: 1535, column: 41, scope: !1965)
!1969 = !DILocation(line: 1535, column: 39, scope: !1965)
!1970 = !DILocation(line: 1535, column: 13, scope: !1965)
!1971 = !DILocation(line: 1536, column: 16, scope: !1965)
!1972 = !DILocation(line: 1536, column: 30, scope: !1965)
!1973 = !DILocation(line: 1536, column: 40, scope: !1965)
!1974 = !DILocation(line: 1536, column: 39, scope: !1965)
!1975 = !DILocation(line: 1536, column: 55, scope: !1965)
!1976 = !DILocation(line: 1536, column: 53, scope: !1965)
!1977 = !DILocation(line: 1536, column: 26, scope: !1965)
!1978 = !DILocation(line: 1536, column: 68, scope: !1965)
!1979 = !DILocation(line: 1536, column: 13, scope: !1965)
!1980 = !DILocation(line: 1537, column: 16, scope: !1965)
!1981 = !DILocation(line: 1537, column: 25, scope: !1965)
!1982 = !DILocation(line: 1537, column: 24, scope: !1965)
!1983 = !DILocation(line: 1537, column: 41, scope: !1965)
!1984 = !DILocation(line: 1537, column: 51, scope: !1965)
!1985 = !DILocation(line: 1537, column: 50, scope: !1965)
!1986 = !DILocation(line: 1537, column: 38, scope: !1965)
!1987 = !DILocation(line: 1537, column: 13, scope: !1965)
!1988 = !DILocation(line: 1538, column: 7, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1965, file: !74, line: 1538, column: 7)
!1990 = !DILocation(line: 1538, column: 16, scope: !1989)
!1991 = !DILocation(line: 1538, column: 7, scope: !1965)
!1992 = !DILocation(line: 1540, column: 17, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1989, file: !74, line: 1539, column: 4)
!1994 = !DILocation(line: 1540, column: 12, scope: !1993)
!1995 = !DILocation(line: 1540, column: 5, scope: !1993)
!1996 = !DILocation(line: 1544, column: 5, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1989, file: !74, line: 1543, column: 4)
!1998 = !DILocation(line: 1548, column: 1, scope: !1869)
!1999 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2000, file: !2000, line: 12, type: !2001, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2004)
!2000 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2001 = !DISubroutineType(types: !2002)
!2002 = !{null, !2003}
!2003 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2004 = !{!2005}
!2005 = !DILocalVariable(name: "z", arg: 1, scope: !1999, file: !2000, line: 12, type: !2003)
!2006 = !DILocation(line: 0, scope: !1999)
!2007 = !DILocation(line: 13, column: 9, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !1999, file: !2000, line: 13, column: 7)
!2009 = !DILocation(line: 13, column: 7, scope: !1999)
!2010 = !DILocation(line: 14, column: 5, scope: !2008)
!2011 = !DILocation(line: 15, column: 1, scope: !1999)
!2012 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2013, file: !2013, line: 20, type: !2014, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2017)
!2013 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2014 = !DISubroutineType(types: !2015)
!2015 = !{null, !2016, !2016}
!2016 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2017 = !{!2018, !2019}
!2018 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2012, file: !2013, line: 20, type: !2016)
!2019 = !DILocalVariable(name: "shift", arg: 2, scope: !2012, file: !2013, line: 20, type: !2016)
!2020 = !DILocation(line: 0, scope: !2012)
!2021 = !DILocation(line: 21, column: 13, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2012, file: !2013, line: 21, column: 7)
!2023 = !DILocation(line: 21, column: 7, scope: !2012)
!2024 = !DILocation(line: 27, column: 5, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2022, file: !2013, line: 21, column: 26)
!2026 = !DILocation(line: 29, column: 1, scope: !2012)
