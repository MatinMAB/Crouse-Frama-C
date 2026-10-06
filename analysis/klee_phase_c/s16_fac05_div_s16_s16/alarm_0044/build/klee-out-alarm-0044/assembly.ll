; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044/build/s16_fac05_div_s16_s16_alarm_0044.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [81 x i8] c"KLEE-ALARM-0044: invalid LHS operand for left shift. assert 0 <= (int)numerator;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0044.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i16* %result, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = bitcast i16* %numerator to i8*, !dbg !50
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !51
  %1 = bitcast i16* %denominator to i8*, !dbg !52
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  %2 = load i16, i16* %numerator, align 2, !dbg !54
  %3 = load i16, i16* %denominator, align 2, !dbg !55
  %call = call signext i16 @s16_fac05_div_s16_s16(i16 signext %2, i16 signext %3), !dbg !56
  store i16 %call, i16* %result, align 2, !dbg !57
  %4 = load i16, i16* %result, align 2, !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !60 {
entry:
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !75
  %conv = sext i16 %0 to i32, !dbg !77
  %conv1 = sext i32 %conv to i64, !dbg !78
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv1), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.end, label %if.then, !dbg !80

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 177, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !83
  %conv2 = sext i16 %1 to i32, !dbg !84
  %shl = shl i32 %conv2, 16, !dbg !85
  %conv3 = sext i32 %shl to i64, !dbg !86
  store volatile i64 %conv3, i64* @klee_alarm_sink_s64, align 8, !dbg !87
  ret i16 0, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !89 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = load i64, i64* %left.addr, align 8, !dbg !94
  %cmp = icmp sge i64 %0, 0, !dbg !95
  %conv = zext i1 %cmp to i32, !dbg !95
  ret i32 %conv, !dbg !96
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !97 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 0, i32* %s32Temp1, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 0, i32* %s32Temp2, align 4, !dbg !107
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !108
  store i32 %0, i32* %s32Temp1, align 4, !dbg !109
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !110
  %conv = sext i16 %1 to i32, !dbg !110
  %cmp = icmp eq i32 %conv, 0, !dbg !112
  br i1 %cmp, label %if.then, label %if.else5, !dbg !113

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !114
  %cmp2 = icmp slt i32 %2, 0, !dbg !117
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !118

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !119
  br label %return, !dbg !119

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !121
  br label %return, !dbg !121

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !123
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !126
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !127

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !128
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !130
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !131
  %conv9 = sext i16 %6 to i32, !dbg !131
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !132
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !132
  %div = sdiv i32 %5, %conv9, !dbg !132, !klee.check.div !133
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !134
  %conv10 = sext i16 %7 to i32, !dbg !134
  %mul = mul nsw i32 %div, %conv10, !dbg !135
  %sub = sub nsw i32 %4, %mul, !dbg !136
  %shl = shl i32 %sub, 1, !dbg !137
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !138
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !139
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !140
  %conv11 = sext i16 %9 to i32, !dbg !140
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !141
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !141
  %div12 = sdiv i32 %8, %conv11, !dbg !141, !klee.check.div !133
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !142
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !143
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !144
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !145
  %conv13 = sext i16 %12 to i32, !dbg !145
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !146
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !146
  %div14 = sdiv i32 %11, %conv13, !dbg !146, !klee.check.div !133
  %add = add nsw i32 %10, %div14, !dbg !147
  store i32 %add, i32* %s32Temp1, align 4, !dbg !148
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !149
  %cmp15 = icmp slt i32 %13, 32767, !dbg !151
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !152

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !153
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !156
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !157

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !158
  %conv21 = trunc i32 %15 to i16, !dbg !160
  store i16 %conv21, i16* %retval, align 2, !dbg !161
  br label %return, !dbg !161

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !162
  br label %return, !dbg !162

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !164
  br label %return, !dbg !164

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !166
  %conv25 = sext i16 %16 to i32, !dbg !166
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !169
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !170

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !171
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !173
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !174
  %conv29 = sext i16 %19 to i32, !dbg !174
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !175
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !175
  %div30 = sdiv i32 %18, %conv29, !dbg !175, !klee.check.div !133
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !176
  %conv31 = sext i16 %20 to i32, !dbg !176
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !177
  %sub33 = sub nsw i32 %17, %mul32, !dbg !178
  %shl34 = shl i32 %sub33, 1, !dbg !179
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !180
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !181
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !182
  %conv35 = sext i16 %22 to i32, !dbg !182
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !183
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !183
  %div36 = sdiv i32 %21, %conv35, !dbg !183, !klee.check.div !133
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !184
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !185
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !186
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !187
  %conv37 = sext i16 %25 to i32, !dbg !187
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !188
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !188
  %div38 = sdiv i32 %24, %conv37, !dbg !188, !klee.check.div !133
  %add39 = add nsw i32 %23, %div38, !dbg !189
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !190
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !191
  %cmp40 = icmp slt i32 %26, 32767, !dbg !193
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !194

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !195
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !198
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !199

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !200
  %conv46 = trunc i32 %28 to i16, !dbg !202
  store i16 %conv46, i16* %retval, align 2, !dbg !203
  br label %return, !dbg !203

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !204
  br label %return, !dbg !204

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !206
  br label %return, !dbg !206

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !208
  br label %return, !dbg !208

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !210
  ret i16 %29, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !211 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !214, metadata !DIExpression()), !dbg !215
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !224
  %conv = zext i16 %0 to i32, !dbg !224
  %and = and i32 %conv, 65535, !dbg !225
  %conv1 = trunc i32 %and to i16, !dbg !224
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !226
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !227
  %conv2 = sext i16 %1 to i32, !dbg !227
  %shl = shl i32 %conv2, 16, !dbg !228
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !229
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !230
  %conv3 = zext i16 %2 to i32, !dbg !230
  %cmp = icmp eq i32 %conv3, 0, !dbg !232
  br i1 %cmp, label %if.then, label %if.else9, !dbg !233

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !234
  %conv5 = sext i16 %3 to i32, !dbg !234
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !237
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !238

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !239
  br label %return, !dbg !239

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !241
  br label %return, !dbg !241

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !243
  %conv10 = sext i16 %4 to i32, !dbg !243
  %shl11 = shl i32 %conv10, 16, !dbg !245
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !246
  %conv12 = sext i16 %5 to i32, !dbg !246
  %shl13 = shl i32 %conv12, 16, !dbg !247
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !248
  %conv14 = zext i16 %6 to i32, !dbg !248
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !249
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !249
  %div = sdiv i32 %shl13, %conv14, !dbg !249, !klee.check.div !133
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !250
  %conv15 = zext i16 %7 to i32, !dbg !250
  %mul = mul nsw i32 %div, %conv15, !dbg !251
  %sub = sub nsw i32 %shl11, %mul, !dbg !252
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !253
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !254
  %shl16 = shl i32 %8, 1, !dbg !255
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !256
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !257
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !258
  %conv17 = zext i16 %10 to i32, !dbg !258
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !259
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !259
  %div18 = sdiv i32 %9, %conv17, !dbg !259, !klee.check.div !133
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !260
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !261
  %conv19 = sext i16 %11 to i32, !dbg !261
  %shl20 = shl i32 %conv19, 16, !dbg !262
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !263
  %conv21 = zext i16 %12 to i32, !dbg !263
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !264
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !264
  %div22 = sdiv i32 %shl20, %conv21, !dbg !264, !klee.check.div !133
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !265
  %add = add nsw i32 %div22, %13, !dbg !266
  store i32 %add, i32* %s32Temp1, align 4, !dbg !267
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !268
  %cmp23 = icmp slt i32 %14, 32767, !dbg !270
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !271

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !272
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !275
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !276

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !277
  %conv29 = trunc i32 %16 to i16, !dbg !279
  store i16 %conv29, i16* %retval, align 2, !dbg !280
  br label %return, !dbg !280

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !281
  br label %return, !dbg !281

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !283
  br label %return, !dbg !283

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !285
  ret i16 %17, !dbg !285
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !286 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !287, metadata !DIExpression()), !dbg !288
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !289, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !291, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !293, metadata !DIExpression()), !dbg !294
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !295
  %conv = zext i16 %0 to i32, !dbg !295
  %and = and i32 %conv, 65535, !dbg !296
  %conv1 = trunc i32 %and to i16, !dbg !295
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !297
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !298
  %conv2 = zext i16 %1 to i32, !dbg !298
  %cmp = icmp eq i32 %conv2, 0, !dbg !300
  br i1 %cmp, label %if.then, label %if.else8, !dbg !301

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !302
  %conv4 = sext i16 %2 to i32, !dbg !302
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !305
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !306

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !307
  br label %return, !dbg !307

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !309
  br label %return, !dbg !309

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !311
  %conv9 = sext i16 %3 to i32, !dbg !311
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !313
  %conv10 = sext i16 %4 to i32, !dbg !313
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !314
  %conv11 = zext i16 %5 to i32, !dbg !314
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !315
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !315
  %div = sdiv i32 %conv10, %conv11, !dbg !315, !klee.check.div !133
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !316
  %conv12 = zext i16 %6 to i32, !dbg !316
  %mul = mul nsw i32 %div, %conv12, !dbg !317
  %sub = sub nsw i32 %conv9, %mul, !dbg !318
  %shl = shl i32 %sub, 1, !dbg !319
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !320
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !321
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !322
  %conv13 = zext i16 %8 to i32, !dbg !322
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !323
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !323
  %div14 = sdiv i32 %7, %conv13, !dbg !323, !klee.check.div !133
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !324
  %conv15 = sext i16 %9 to i32, !dbg !324
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !325
  %conv16 = zext i16 %10 to i32, !dbg !325
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !326
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !326
  %div17 = sdiv i32 %conv15, %conv16, !dbg !326, !klee.check.div !133
  %add = add nsw i32 %div14, %div17, !dbg !327
  store i32 %add, i32* %s32Temp1, align 4, !dbg !328
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !329
  %conv18 = trunc i32 %11 to i16, !dbg !329
  store i16 %conv18, i16* %retval, align 2, !dbg !330
  br label %return, !dbg !330

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !331
  ret i16 %12, !dbg !331
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !332 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !335, metadata !DIExpression()), !dbg !336
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !337, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !339, metadata !DIExpression()), !dbg !344
  store i32 0, i32* %u32Temp1, align 4, !dbg !344
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !345, metadata !DIExpression()), !dbg !346
  store i32 0, i32* %u32Temp2, align 4, !dbg !346
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 0, i32* %u32Temp3, align 4, !dbg !348
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !349
  %conv = zext i16 %0 to i32, !dbg !349
  %cmp = icmp eq i32 %conv, 0, !dbg !351
  br i1 %cmp, label %if.then, label %if.else, !dbg !352

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !353
  br label %return, !dbg !353

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !355
  %conv2 = zext i16 %1 to i32, !dbg !355
  %shl = shl i32 %conv2, 16, !dbg !357
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !358
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !359
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !360
  %conv3 = zext i16 %3 to i32, !dbg !360
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !361
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !361
  %div = udiv i32 %2, %conv3, !dbg !361, !klee.check.div !133
  store i32 %div, i32* %u32Temp2, align 4, !dbg !362
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !363
  %add = add i32 %4, 128, !dbg !364
  %shr = lshr i32 %add, 8, !dbg !365
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !366
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !367
  %cmp4 = icmp ult i32 %5, 255, !dbg !369
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !370

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !371
  %conv7 = trunc i32 %6 to i8, !dbg !373
  store i8 %conv7, i8* %retval, align 1, !dbg !374
  br label %return, !dbg !374

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !375
  br label %return, !dbg !375

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !377
  ret i8 %7, !dbg !377
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !378 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !381, metadata !DIExpression()), !dbg !382
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !385, metadata !DIExpression()), !dbg !386
  store i32 0, i32* %s32Temp1, align 4, !dbg !386
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !387
  %conv = zext i16 %0 to i32, !dbg !387
  %and = and i32 %conv, 65535, !dbg !388
  %conv1 = trunc i32 %and to i16, !dbg !387
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !389
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !390
  %conv2 = zext i16 %1 to i32, !dbg !390
  %and3 = and i32 %conv2, 65535, !dbg !392
  %cmp = icmp eq i32 %and3, 0, !dbg !393
  br i1 %cmp, label %if.then, label %if.else8, !dbg !394

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !395
  %cmp5 = icmp sge i32 %2, 0, !dbg !398
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !399

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !400
  br label %return, !dbg !400

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !402
  br label %return, !dbg !402

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !404
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !406
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !407
  %conv9 = zext i16 %5 to i32, !dbg !407
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !408
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !408
  %div = sdiv i32 %4, %conv9, !dbg !408, !klee.check.div !133
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !409
  %conv10 = zext i16 %6 to i32, !dbg !409
  %mul = mul nsw i32 %div, %conv10, !dbg !410
  %sub = sub nsw i32 %3, %mul, !dbg !411
  %shl = shl i32 %sub, 1, !dbg !412
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !413
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !414
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !415
  %conv11 = zext i16 %8 to i32, !dbg !415
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !416
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !416
  %div12 = sdiv i32 %7, %conv11, !dbg !416, !klee.check.div !133
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !417
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !418
  %conv13 = zext i16 %10 to i32, !dbg !418
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !419
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !419
  %div14 = sdiv i32 %9, %conv13, !dbg !419, !klee.check.div !133
  %add = add nsw i32 %div12, %div14, !dbg !420
  store i32 %add, i32* %s32Temp1, align 4, !dbg !421
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !422
  %cmp15 = icmp slt i32 %11, 65535, !dbg !424
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !425

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !426
  %cmp18 = icmp sgt i32 %12, 0, !dbg !429
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !430

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !431
  %conv21 = trunc i32 %13 to i16, !dbg !433
  store i16 %conv21, i16* %retval, align 2, !dbg !434
  br label %return, !dbg !434

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !435
  br label %return, !dbg !435

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !437
  br label %return, !dbg !437

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !439
  ret i16 %14, !dbg !439
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !440 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !443, metadata !DIExpression()), !dbg !444
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !445, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !447, metadata !DIExpression()), !dbg !448
  store i32 0, i32* %u32Temp, align 4, !dbg !448
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !449
  %conv = zext i16 %0 to i32, !dbg !449
  %cmp = icmp eq i32 %conv, 0, !dbg !451
  br i1 %cmp, label %if.then, label %if.else, !dbg !452

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !453
  br label %return, !dbg !453

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !455
  %conv2 = zext i16 %1 to i32, !dbg !455
  %shl = shl i32 %conv2, 16, !dbg !457
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !458
  %conv3 = zext i16 %2 to i32, !dbg !458
  %shr = ashr i32 %conv3, 1, !dbg !459
  %add = add nsw i32 %shl, %shr, !dbg !460
  store i32 %add, i32* %u32Temp, align 4, !dbg !461
  %3 = load i32, i32* %u32Temp, align 4, !dbg !462
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !463
  %conv4 = zext i16 %4 to i32, !dbg !463
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !464
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !464
  %div = udiv i32 %3, %conv4, !dbg !464, !klee.check.div !133
  store i32 %div, i32* %u32Temp, align 4, !dbg !465
  %5 = load i32, i32* %u32Temp, align 4, !dbg !466
  %cmp5 = icmp ult i32 %5, 65535, !dbg !468
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !469

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !470
  %and = and i32 %6, 65535, !dbg !472
  %conv8 = trunc i32 %and to i16, !dbg !470
  store i16 %conv8, i16* %retval, align 2, !dbg !473
  br label %return, !dbg !473

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !474
  br label %return, !dbg !474

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !476
  ret i16 %7, !dbg !476
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !477 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !480, metadata !DIExpression()), !dbg !481
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !482, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !484, metadata !DIExpression()), !dbg !485
  store i32 0, i32* %u32Temp1, align 4, !dbg !485
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !486, metadata !DIExpression()), !dbg !487
  store i32 0, i32* %u32Temp2, align 4, !dbg !487
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !488
  %conv = zext i16 %0 to i32, !dbg !488
  %and = and i32 %conv, 65535, !dbg !489
  %conv1 = trunc i32 %and to i16, !dbg !488
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !490
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !491
  %conv2 = zext i16 %1 to i32, !dbg !491
  %cmp = icmp eq i32 %conv2, 0, !dbg !493
  br i1 %cmp, label %if.then, label %if.else, !dbg !494

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !495
  br label %return, !dbg !495

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !497
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !499
  %conv4 = zext i16 %3 to i32, !dbg !499
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !500
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !500
  %div = udiv i32 %2, %conv4, !dbg !500, !klee.check.div !133
  store i32 %div, i32* %u32Temp1, align 4, !dbg !501
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !502
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !503
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !504
  %conv5 = zext i16 %6 to i32, !dbg !504
  %mul = mul i32 %5, %conv5, !dbg !505
  %sub = sub i32 %4, %mul, !dbg !506
  %shl = shl i32 %sub, 1, !dbg !507
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !508
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !509
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !510
  %conv6 = zext i16 %8 to i32, !dbg !510
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !511
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !511
  %div7 = udiv i32 %7, %conv6, !dbg !511, !klee.check.div !133
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !512
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !513
  %conv8 = zext i16 %10 to i32, !dbg !513
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !514
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !514
  %div9 = udiv i32 %9, %conv8, !dbg !514, !klee.check.div !133
  %add = add i32 %div7, %div9, !dbg !515
  store i32 %add, i32* %u32Temp2, align 4, !dbg !516
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !517
  %cmp10 = icmp ult i32 %11, 65535, !dbg !519
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !520

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !521
  %and13 = and i32 %12, 65535, !dbg !523
  %conv14 = trunc i32 %and13 to i16, !dbg !521
  store i16 %conv14, i16* %retval, align 2, !dbg !524
  br label %return, !dbg !524

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !525
  br label %return, !dbg !525

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !527
  ret i16 %13, !dbg !527
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !528 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !531, metadata !DIExpression()), !dbg !532
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !533, metadata !DIExpression()), !dbg !534
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !535, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !537, metadata !DIExpression()), !dbg !538
  store i32 0, i32* %s32Result, align 4, !dbg !538
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !539, metadata !DIExpression()), !dbg !540
  store i32 0, i32* %s32Temp1, align 4, !dbg !540
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !541
  %conv = sext i16 %0 to i32, !dbg !541
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !542
  %conv1 = zext i16 %1 to i32, !dbg !542
  %mul = mul nsw i32 %conv, %conv1, !dbg !543
  store i32 %mul, i32* %s32Result, align 4, !dbg !544
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !545
  %conv2 = sext i16 %2 to i32, !dbg !545
  %cmp = icmp eq i32 %conv2, 0, !dbg !547
  br i1 %cmp, label %if.then, label %if.else7, !dbg !548

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !549
  %cmp4 = icmp slt i32 %3, 0, !dbg !552
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !553

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !554
  br label %return, !dbg !554

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !556
  br label %return, !dbg !556

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !558
  %5 = load i32, i32* %s32Result, align 4, !dbg !560
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !561
  %conv8 = sext i16 %6 to i32, !dbg !561
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !562
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !562
  %div = sdiv i32 %5, %conv8, !dbg !562, !klee.check.div !133
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !563
  %conv9 = sext i16 %7 to i32, !dbg !563
  %mul10 = mul nsw i32 %div, %conv9, !dbg !564
  %sub = sub nsw i32 %4, %mul10, !dbg !565
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !566
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !567
  %shl = shl i32 %8, 1, !dbg !568
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !569
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !570
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !571
  %conv11 = sext i16 %10 to i32, !dbg !571
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !572
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !572
  %div12 = sdiv i32 %9, %conv11, !dbg !572, !klee.check.div !133
  %11 = load i32, i32* %s32Result, align 4, !dbg !573
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !574
  %conv13 = sext i16 %12 to i32, !dbg !574
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !575
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !575
  %div14 = sdiv i32 %11, %conv13, !dbg !575, !klee.check.div !133
  %add = add nsw i32 %div12, %div14, !dbg !576
  store i32 %add, i32* %s32Result, align 4, !dbg !577
  %13 = load i32, i32* %s32Result, align 4, !dbg !578
  %cmp15 = icmp slt i32 %13, 32767, !dbg !580
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !581

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !582
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !585
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !586

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !587
  %conv21 = trunc i32 %15 to i16, !dbg !589
  store i16 %conv21, i16* %retval, align 2, !dbg !590
  br label %return, !dbg !590

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !591
  br label %return, !dbg !591

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !593
  br label %return, !dbg !593

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !595
  ret i16 %16, !dbg !595
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !596 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !599, metadata !DIExpression()), !dbg !600
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !601, metadata !DIExpression()), !dbg !602
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !603, metadata !DIExpression()), !dbg !604
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !605, metadata !DIExpression()), !dbg !606
  store i32 0, i32* %s32Result, align 4, !dbg !606
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !607, metadata !DIExpression()), !dbg !608
  store i32 0, i32* %s32Temp1, align 4, !dbg !608
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !609
  %conv = zext i16 %0 to i32, !dbg !609
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !610
  %conv1 = sext i16 %1 to i32, !dbg !610
  %mul = mul nsw i32 %conv, %conv1, !dbg !611
  store i32 %mul, i32* %s32Result, align 4, !dbg !612
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !613
  %conv2 = zext i16 %2 to i32, !dbg !613
  %cmp = icmp eq i32 %conv2, 0, !dbg !615
  br i1 %cmp, label %if.then, label %if.else7, !dbg !616

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !617
  %cmp4 = icmp slt i32 %3, 0, !dbg !620
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !621

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !622
  br label %return, !dbg !622

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !624
  br label %return, !dbg !624

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !626
  %5 = load i32, i32* %s32Result, align 4, !dbg !628
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !629
  %conv8 = zext i16 %6 to i32, !dbg !629
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !630
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !630
  %div = sdiv i32 %5, %conv8, !dbg !630, !klee.check.div !133
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !631
  %conv9 = zext i16 %7 to i32, !dbg !631
  %mul10 = mul nsw i32 %div, %conv9, !dbg !632
  %sub = sub nsw i32 %4, %mul10, !dbg !633
  %shl = shl i32 %sub, 1, !dbg !634
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !635
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !636
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !637
  %conv11 = zext i16 %9 to i32, !dbg !637
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !638
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !638
  %div12 = sdiv i32 %8, %conv11, !dbg !638, !klee.check.div !133
  %10 = load i32, i32* %s32Result, align 4, !dbg !639
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !640
  %conv13 = zext i16 %11 to i32, !dbg !640
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !641
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !641
  %div14 = sdiv i32 %10, %conv13, !dbg !641, !klee.check.div !133
  %add = add nsw i32 %div12, %div14, !dbg !642
  store i32 %add, i32* %s32Result, align 4, !dbg !643
  %12 = load i32, i32* %s32Result, align 4, !dbg !644
  %cmp15 = icmp slt i32 %12, 32767, !dbg !646
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !647

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !648
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !651
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !652

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !653
  %conv21 = trunc i32 %14 to i16, !dbg !655
  store i16 %conv21, i16* %retval, align 2, !dbg !656
  br label %return, !dbg !656

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !657
  br label %return, !dbg !657

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !659
  br label %return, !dbg !659

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !661
  ret i16 %15, !dbg !661
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !662 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !665, metadata !DIExpression()), !dbg !666
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !667, metadata !DIExpression()), !dbg !668
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !669, metadata !DIExpression()), !dbg !670
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !671, metadata !DIExpression()), !dbg !672
  store i32 0, i32* %u32Result, align 4, !dbg !672
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !673, metadata !DIExpression()), !dbg !674
  store i32 0, i32* %u32Temp1, align 4, !dbg !674
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !675, metadata !DIExpression()), !dbg !676
  store i32 0, i32* %s32Result, align 4, !dbg !676
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !677, metadata !DIExpression()), !dbg !678
  store i32 0, i32* %s32Temp1, align 4, !dbg !678
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !679
  %conv = sext i16 %0 to i32, !dbg !679
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !680
  %conv1 = zext i16 %1 to i32, !dbg !680
  %mul = mul nsw i32 %conv, %conv1, !dbg !681
  store i32 %mul, i32* %s32Result, align 4, !dbg !682
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !683
  %conv2 = sext i16 %2 to i32, !dbg !683
  %cmp = icmp eq i32 %conv2, 0, !dbg !685
  br i1 %cmp, label %if.then, label %if.else7, !dbg !686

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !687
  %cmp4 = icmp sge i32 %3, 0, !dbg !690
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !691

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !692
  br label %return, !dbg !692

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !694
  br label %return, !dbg !694

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !696
  %5 = load i32, i32* %s32Result, align 4, !dbg !698
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !699
  %conv8 = sext i16 %6 to i32, !dbg !699
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !700
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !700
  %div = sdiv i32 %5, %conv8, !dbg !700, !klee.check.div !133
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !701
  %conv9 = sext i16 %7 to i32, !dbg !701
  %mul10 = mul nsw i32 %div, %conv9, !dbg !702
  %sub = sub nsw i32 %4, %mul10, !dbg !703
  %shl = shl i32 %sub, 1, !dbg !704
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !705
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !706
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !707
  %conv11 = sext i16 %9 to i32, !dbg !707
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !708
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !708
  %div12 = sdiv i32 %8, %conv11, !dbg !708, !klee.check.div !133
  %10 = load i32, i32* %s32Result, align 4, !dbg !709
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !710
  %conv13 = sext i16 %11 to i32, !dbg !710
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !711
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !711
  %div14 = sdiv i32 %10, %conv13, !dbg !711, !klee.check.div !133
  %add = add nsw i32 %div12, %div14, !dbg !712
  store i32 %add, i32* %s32Result, align 4, !dbg !713
  %12 = load i32, i32* %s32Result, align 4, !dbg !714
  %cmp15 = icmp slt i32 %12, 65535, !dbg !716
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !717

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !718
  %cmp18 = icmp sgt i32 %13, 0, !dbg !721
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !722

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !723
  %conv21 = trunc i32 %14 to i16, !dbg !725
  store i16 %conv21, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !731
  ret i16 %15, !dbg !731
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !732 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !735, metadata !DIExpression()), !dbg !736
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !737, metadata !DIExpression()), !dbg !738
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !739, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !741, metadata !DIExpression()), !dbg !742
  store i32 0, i32* %s32Result, align 4, !dbg !742
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !743, metadata !DIExpression()), !dbg !744
  store i32 0, i32* %s32Temp1, align 4, !dbg !744
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !745
  %conv = sext i16 %0 to i32, !dbg !745
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !746
  %conv1 = zext i16 %1 to i32, !dbg !746
  %mul = mul nsw i32 %conv, %conv1, !dbg !747
  store i32 %mul, i32* %s32Result, align 4, !dbg !748
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !749
  %conv2 = zext i16 %2 to i32, !dbg !749
  %cmp = icmp eq i32 %conv2, 0, !dbg !751
  br i1 %cmp, label %if.then, label %if.else7, !dbg !752

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !753
  %cmp4 = icmp sge i32 %3, 0, !dbg !756
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !757

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !758
  br label %return, !dbg !758

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !760
  br label %return, !dbg !760

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !762
  %5 = load i32, i32* %s32Result, align 4, !dbg !764
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !765
  %conv8 = zext i16 %6 to i32, !dbg !765
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !766
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !766
  %div = sdiv i32 %5, %conv8, !dbg !766, !klee.check.div !133
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !767
  %conv9 = zext i16 %7 to i32, !dbg !767
  %mul10 = mul nsw i32 %div, %conv9, !dbg !768
  %sub = sub nsw i32 %4, %mul10, !dbg !769
  %shl = shl i32 %sub, 1, !dbg !770
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !771
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !772
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !773
  %conv11 = zext i16 %9 to i32, !dbg !773
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !774
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !774
  %div12 = sdiv i32 %8, %conv11, !dbg !774, !klee.check.div !133
  %10 = load i32, i32* %s32Result, align 4, !dbg !775
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !776
  %conv13 = zext i16 %11 to i32, !dbg !776
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !777
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !777
  %div14 = sdiv i32 %10, %conv13, !dbg !777, !klee.check.div !133
  %add = add nsw i32 %div12, %div14, !dbg !778
  store i32 %add, i32* %s32Result, align 4, !dbg !779
  %12 = load i32, i32* %s32Result, align 4, !dbg !780
  %cmp15 = icmp slt i32 %12, 65535, !dbg !782
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !783

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !784
  %cmp18 = icmp sgt i32 %13, 0, !dbg !787
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !788

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !789
  %conv21 = trunc i32 %14 to i16, !dbg !791
  store i16 %conv21, i16* %retval, align 2, !dbg !792
  br label %return, !dbg !792

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !793
  br label %return, !dbg !793

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !797
  ret i16 %15, !dbg !797
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !798 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !801, metadata !DIExpression()), !dbg !802
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !803, metadata !DIExpression()), !dbg !804
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !805, metadata !DIExpression()), !dbg !806
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !807, metadata !DIExpression()), !dbg !808
  store i32 0, i32* %u32Temp1, align 4, !dbg !808
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !809, metadata !DIExpression()), !dbg !810
  store i16 0, i16* %u16TempDenom, align 2, !dbg !810
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv = zext i16 %0 to i32, !dbg !811
  %cmp = icmp eq i32 %conv, 0, !dbg !813
  br i1 %cmp, label %if.then, label %if.else, !dbg !814

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !815
  br label %return, !dbg !815

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !817
  %conv2 = zext i16 %1 to i32, !dbg !817
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !819
  %conv3 = zext i16 %2 to i32, !dbg !819
  %mul = mul nsw i32 %conv2, %conv3, !dbg !820
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !821
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !822
  %conv4 = zext i16 %3 to i32, !dbg !822
  %shr = ashr i32 %conv4, 1, !dbg !823
  %conv5 = trunc i32 %shr to i16, !dbg !822
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !824
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !825
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !826
  %conv6 = zext i16 %5 to i32, !dbg !826
  %add = add i32 %4, %conv6, !dbg !827
  store i32 %add, i32* %u32Temp1, align 4, !dbg !828
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !829
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !830
  %conv7 = zext i16 %7 to i32, !dbg !830
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !831
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !831
  %div = udiv i32 %6, %conv7, !dbg !831, !klee.check.div !133
  store i32 %div, i32* %u32Temp1, align 4, !dbg !832
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !833
  %cmp8 = icmp ult i32 %8, 65535, !dbg !835
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !836

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !837
  %and = and i32 %9, 65535, !dbg !839
  %conv11 = trunc i32 %and to i16, !dbg !840
  store i16 %conv11, i16* %retval, align 2, !dbg !841
  br label %return, !dbg !841

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !842
  br label %return, !dbg !842

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !844
  ret i16 %10, !dbg !844
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !845 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !848, metadata !DIExpression()), !dbg !849
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !850, metadata !DIExpression()), !dbg !851
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !852, metadata !DIExpression()), !dbg !853
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !854, metadata !DIExpression()), !dbg !855
  store i32 0, i32* %u32Temp1, align 4, !dbg !855
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !856
  %cmp = icmp eq i32 %0, 0, !dbg !858
  br i1 %cmp, label %if.then, label %if.else, !dbg !859

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !860
  br label %return, !dbg !860

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !862
  %conv = zext i16 %1 to i32, !dbg !862
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !864
  %conv1 = zext i16 %2 to i32, !dbg !864
  %mul = mul nsw i32 %conv, %conv1, !dbg !865
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !866
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !867
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !867
  %div = udiv i32 %mul, %3, !dbg !867, !klee.check.div !133
  store i32 %div, i32* %u32Temp1, align 4, !dbg !868
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !869
  %conv2 = zext i16 %4 to i32, !dbg !869
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !871
  %conv3 = zext i16 %5 to i32, !dbg !871
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !872
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !873
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !874
  %mul5 = mul i32 %6, %7, !dbg !875
  %sub = sub i32 %mul4, %mul5, !dbg !876
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !877
  %div6 = udiv i32 %8, 2, !dbg !878
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !879
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !880

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !881
  %inc = add i32 %9, 1, !dbg !881
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !881
  br label %if.end, !dbg !883

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !884
  %cmp10 = icmp ult i32 %10, 65535, !dbg !886
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !887

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !888
  %and = and i32 %11, 65535, !dbg !890
  %conv13 = trunc i32 %and to i16, !dbg !891
  store i16 %conv13, i16* %retval, align 2, !dbg !892
  br label %return, !dbg !892

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !893
  br label %return, !dbg !893

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !895
  ret i16 %12, !dbg !895
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !896 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !899, metadata !DIExpression()), !dbg !900
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !901, metadata !DIExpression()), !dbg !902
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !903, metadata !DIExpression()), !dbg !904
  store i32 0, i32* %u32Temp1, align 4, !dbg !904
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !905
  %conv = zext i16 %0 to i32, !dbg !905
  %cmp = icmp eq i32 %conv, 0, !dbg !907
  br i1 %cmp, label %if.then, label %if.else, !dbg !908

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !909
  br label %return, !dbg !909

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !911
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !913
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !914
  %conv2 = zext i16 %3 to i32, !dbg !914
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !915
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !915
  %div = udiv i32 %2, %conv2, !dbg !915, !klee.check.div !133
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !916
  %conv3 = zext i16 %4 to i32, !dbg !916
  %mul = mul i32 %div, %conv3, !dbg !917
  %sub = sub i32 %1, %mul, !dbg !918
  %shl = shl i32 %sub, 1, !dbg !919
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !920
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !921
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !922
  %conv4 = zext i16 %6 to i32, !dbg !922
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !923
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !923
  %div5 = udiv i32 %5, %conv4, !dbg !923, !klee.check.div !133
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !924
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !925
  %conv6 = zext i16 %8 to i32, !dbg !925
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !926
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !926
  %div7 = udiv i32 %7, %conv6, !dbg !926, !klee.check.div !133
  %add = add i32 %div5, %div7, !dbg !927
  store i32 %add, i32* %u32Temp1, align 4, !dbg !928
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !929
  store i32 %9, i32* %retval, align 4, !dbg !930
  br label %return, !dbg !930

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !931
  ret i32 %10, !dbg !931
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !932 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !935, metadata !DIExpression()), !dbg !936
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !937, metadata !DIExpression()), !dbg !938
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !939, metadata !DIExpression()), !dbg !940
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !941, metadata !DIExpression()), !dbg !942
  store i32 0, i32* %s32Temp1, align 4, !dbg !942
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !943, metadata !DIExpression()), !dbg !944
  store i32 0, i32* %s32Temp2, align 4, !dbg !944
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !945, metadata !DIExpression()), !dbg !946
  store i32 0, i32* %s32Temp3, align 4, !dbg !946
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !947
  %conv = sext i16 %0 to i32, !dbg !947
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !948
  %conv1 = sext i16 %1 to i32, !dbg !948
  %mul = mul nsw i32 %conv, %conv1, !dbg !949
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !950
  %2 = load i16, i16* %div.addr, align 2, !dbg !951
  %conv2 = sext i16 %2 to i32, !dbg !951
  %cmp = icmp eq i32 %conv2, 0, !dbg !953
  br i1 %cmp, label %if.then, label %if.else7, !dbg !954

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !955
  %cmp4 = icmp slt i32 %3, 0, !dbg !958
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !959

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !960
  br label %return, !dbg !960

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !962
  br label %return, !dbg !962

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !964
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !966
  %6 = load i16, i16* %div.addr, align 2, !dbg !967
  %conv8 = sext i16 %6 to i32, !dbg !967
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !968
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !968
  %div9 = sdiv i32 %5, %conv8, !dbg !968, !klee.check.div !133
  %7 = load i16, i16* %div.addr, align 2, !dbg !969
  %conv10 = sext i16 %7 to i32, !dbg !969
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !970
  %sub = sub nsw i32 %4, %mul11, !dbg !971
  %shl = shl i32 %sub, 1, !dbg !972
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !973
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !974
  %9 = load i16, i16* %div.addr, align 2, !dbg !975
  %conv12 = sext i16 %9 to i32, !dbg !975
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !976
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !976
  %div13 = sdiv i32 %8, %conv12, !dbg !976, !klee.check.div !133
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !977
  %11 = load i16, i16* %div.addr, align 2, !dbg !978
  %conv14 = sext i16 %11 to i32, !dbg !978
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !979
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !979
  %div15 = sdiv i32 %10, %conv14, !dbg !979, !klee.check.div !133
  %add = add nsw i32 %div13, %div15, !dbg !980
  store i32 %add, i32* %s32Temp3, align 4, !dbg !981
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !982
  %cmp16 = icmp slt i32 %12, 32767, !dbg !984
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !985

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !986
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !989
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !990

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !991
  %conv22 = trunc i32 %14 to i16, !dbg !993
  store i16 %conv22, i16* %retval, align 2, !dbg !994
  br label %return, !dbg !994

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !995
  br label %return, !dbg !995

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !997
  br label %return, !dbg !997

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !999
  ret i16 %15, !dbg !999
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1000 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1003, metadata !DIExpression()), !dbg !1004
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1005, metadata !DIExpression()), !dbg !1006
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1007, metadata !DIExpression()), !dbg !1008
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1009, metadata !DIExpression()), !dbg !1010
  store i32 0, i32* %s32Result, align 4, !dbg !1010
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1011, metadata !DIExpression()), !dbg !1012
  store i32 0, i32* %s32Temp1, align 4, !dbg !1012
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1013
  %conv = sext i16 %0 to i32, !dbg !1013
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1014
  %conv1 = sext i16 %1 to i32, !dbg !1014
  %mul = mul nsw i32 %conv, %conv1, !dbg !1015
  store i32 %mul, i32* %s32Result, align 4, !dbg !1016
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1017
  %conv2 = zext i16 %2 to i32, !dbg !1017
  %cmp = icmp eq i32 %conv2, 0, !dbg !1019
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1020

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1021
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1024
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1025

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1026
  br label %return, !dbg !1026

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1028
  %cmp7 = icmp eq i32 %4, 0, !dbg !1030
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1031

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1032
  br label %return, !dbg !1032

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1034
  br label %return, !dbg !1034

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1036
  %6 = load i32, i32* %s32Result, align 4, !dbg !1038
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1039
  %conv12 = zext i16 %7 to i32, !dbg !1039
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1040
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1040
  %div = sdiv i32 %6, %conv12, !dbg !1040, !klee.check.div !133
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1041
  %conv13 = zext i16 %8 to i32, !dbg !1041
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1042
  %sub = sub nsw i32 %5, %mul14, !dbg !1043
  %shl = shl i32 %sub, 1, !dbg !1044
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1045
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1046
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1047
  %conv15 = zext i16 %10 to i32, !dbg !1047
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1048
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1048
  %div16 = sdiv i32 %9, %conv15, !dbg !1048, !klee.check.div !133
  %11 = load i32, i32* %s32Result, align 4, !dbg !1049
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1050
  %conv17 = zext i16 %12 to i32, !dbg !1050
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1051
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1051
  %div18 = sdiv i32 %11, %conv17, !dbg !1051, !klee.check.div !133
  %add = add nsw i32 %div16, %div18, !dbg !1052
  store i32 %add, i32* %s32Result, align 4, !dbg !1053
  %13 = load i32, i32* %s32Result, align 4, !dbg !1054
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1056
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1057

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1058
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1061
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1062

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1063
  %conv25 = trunc i32 %15 to i16, !dbg !1065
  store i16 %conv25, i16* %retval, align 2, !dbg !1066
  br label %return, !dbg !1066

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1067
  br label %return, !dbg !1067

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1069
  br label %return, !dbg !1069

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1071
  ret i16 %16, !dbg !1071
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1072 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1077, metadata !DIExpression()), !dbg !1078
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1079, metadata !DIExpression()), !dbg !1080
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1081
  %cmp = icmp eq i32 %0, 0, !dbg !1083
  br i1 %cmp, label %if.then, label %if.else, !dbg !1084

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1085
  br label %return, !dbg !1085

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1087
  %cmp1 = icmp sle i32 %1, 0, !dbg !1090
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1091

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1092
  br label %return, !dbg !1092

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1094
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1096
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1097
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1098
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1098
  %div = udiv i32 %3, %4, !dbg !1098, !klee.check.div !133
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1099
  %mul = mul i32 %div, %5, !dbg !1100
  %sub = sub i32 %2, %mul, !dbg !1101
  %shl = shl i32 %sub, 1, !dbg !1102
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1103
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1104
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1105
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1106
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1106
  %div4 = udiv i32 %6, %7, !dbg !1106, !klee.check.div !133
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1107
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1108
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1109
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1109
  %div5 = udiv i32 %8, %9, !dbg !1109, !klee.check.div !133
  %add = add i32 %div4, %div5, !dbg !1110
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1111
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1112
  store i32 %10, i32* %retval, align 4, !dbg !1113
  br label %return, !dbg !1113

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1114
  ret i32 %11, !dbg !1114
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1115 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1120, metadata !DIExpression()), !dbg !1121
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i32 0, i32* %s32Temp1, align 4, !dbg !1123
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1124
  %cmp = icmp eq i32 %0, 0, !dbg !1126
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1127

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1128
  %cmp1 = icmp sge i32 %1, 0, !dbg !1131
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1132

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1133
  br label %return, !dbg !1133

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1135
  br label %return, !dbg !1135

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1137
  %cmp4 = icmp sge i32 %2, 0, !dbg !1140
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1141

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1142
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1144
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1145
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1146
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1146
  %div = udiv i32 %4, %5, !dbg !1146, !klee.check.div !133
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1147
  %mul = mul i32 %div, %6, !dbg !1148
  %sub = sub i32 %3, %mul, !dbg !1149
  %shl = shl i32 %sub, 1, !dbg !1150
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1151
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1152
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1153
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1154
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1154
  %div6 = udiv i32 %7, %8, !dbg !1154, !klee.check.div !133
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1155
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1156
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1157
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1157
  %div7 = udiv i32 %9, %10, !dbg !1157, !klee.check.div !133
  %add = add i32 %div6, %div7, !dbg !1158
  store i32 %add, i32* %retval, align 4, !dbg !1159
  br label %return, !dbg !1159

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1160
  br label %return, !dbg !1160

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1162
  ret i32 %11, !dbg !1162
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1163 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1166, metadata !DIExpression()), !dbg !1167
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1168, metadata !DIExpression()), !dbg !1169
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1170, metadata !DIExpression()), !dbg !1171
  store i32 0, i32* %u32Temp1, align 4, !dbg !1171
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1172, metadata !DIExpression()), !dbg !1173
  store i32 0, i32* %u32Temp2, align 4, !dbg !1173
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1174
  %cmp = icmp eq i32 %0, 0, !dbg !1176
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1177

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1178
  %cmp1 = icmp slt i32 %1, 0, !dbg !1181
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1182

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1183
  br label %return, !dbg !1183

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1185
  br label %return, !dbg !1185

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1187
  %cmp4 = icmp sge i32 %2, 0, !dbg !1190
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1191

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1192
  %cmp6 = icmp eq i32 %3, 0, !dbg !1195
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1196

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1197
  br label %return, !dbg !1197

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1199
  %cmp9 = icmp sle i32 %4, 0, !dbg !1202
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1203

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1204
  br label %return, !dbg !1204

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1206
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1208
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1209
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1210
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1210
  %div = sdiv i32 %6, %7, !dbg !1210, !klee.check.div !133
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1211
  %mul = mul nsw i32 %div, %8, !dbg !1212
  %sub = sub nsw i32 %5, %mul, !dbg !1213
  %shl = shl i32 %sub, 1, !dbg !1214
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1215
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1216
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1217
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1218
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1218
  %div12 = udiv i32 %9, %10, !dbg !1218, !klee.check.div !133
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1219
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1220
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1221
  %div13 = sdiv i32 %11, %12, !dbg !1221, !klee.check.div !133
  %add = add i32 %div12, %div13, !dbg !1222
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1223
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1224
  store i32 %13, i32* %retval, align 4, !dbg !1225
  br label %return, !dbg !1225

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1226
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1229
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1230

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1231
  br label %return, !dbg !1231

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1233
  %sub18 = sub nsw i32 0, %15, !dbg !1235
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1236
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1237
  %sub19 = sub nsw i32 0, %16, !dbg !1238
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1239
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1240
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1241
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1242
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1243
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1243
  %div20 = sdiv i32 %18, %19, !dbg !1243, !klee.check.div !133
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1244
  %mul21 = mul nsw i32 %div20, %20, !dbg !1245
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1246
  %shl23 = shl i32 %sub22, 1, !dbg !1247
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1248
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1249
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1250
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1251
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1251
  %div24 = udiv i32 %21, %22, !dbg !1251, !klee.check.div !133
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1252
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1253
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1254
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1254
  %div25 = sdiv i32 %23, %24, !dbg !1254, !klee.check.div !133
  %add26 = add i32 %div24, %div25, !dbg !1255
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1256
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1257
  store i32 %25, i32* %retval, align 4, !dbg !1258
  br label %return, !dbg !1258

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1259
  ret i32 %26, !dbg !1259
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1260 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1263, metadata !DIExpression()), !dbg !1264
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1265, metadata !DIExpression()), !dbg !1266
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1267, metadata !DIExpression()), !dbg !1268
  store i32 0, i32* %u32Temp1, align 4, !dbg !1268
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1269, metadata !DIExpression()), !dbg !1270
  store i32 0, i32* %u32Temp2, align 4, !dbg !1270
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1271, metadata !DIExpression()), !dbg !1272
  store i32 0, i32* %u32Temp3, align 4, !dbg !1272
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1273, metadata !DIExpression()), !dbg !1274
  store i32 0, i32* %numerator_old, align 4, !dbg !1274
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1275
  %cmp = icmp eq i32 %0, 0, !dbg !1277
  br i1 %cmp, label %if.then, label %if.else, !dbg !1278

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1279
  br label %return, !dbg !1279

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1281
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1283
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1284
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1285
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1286
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1286
  %div = udiv i32 %3, %4, !dbg !1286, !klee.check.div !133
  %mul = mul i32 %2, %div, !dbg !1287
  %sub = sub i32 %1, %mul, !dbg !1288
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1289
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1290
  %and = and i32 %5, 1, !dbg !1292
  %cmp1 = icmp eq i32 %and, 0, !dbg !1293
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1294

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1295
  %shr = lshr i32 %6, 1, !dbg !1297
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1298
  br label %if.end, !dbg !1299

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1300
  %shr4 = lshr i32 %7, 1, !dbg !1302
  %add = add i32 %shr4, 1, !dbg !1303
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1304
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1305
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1307
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1308
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1309

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1310
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1312
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1313
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1313
  %div7 = udiv i32 %10, %11, !dbg !1313, !klee.check.div !133
  store i32 %div7, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1315
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1317
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1318
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1318
  %div9 = udiv i32 %12, %13, !dbg !1318, !klee.check.div !133
  %add10 = add i32 %div9, 1, !dbg !1319
  store i32 %add10, i32* %retval, align 4, !dbg !1320
  br label %return, !dbg !1320

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1321
  ret i32 %14, !dbg !1321
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1322 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1325, metadata !DIExpression()), !dbg !1326
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1327, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1329, metadata !DIExpression()), !dbg !1330
  store i32 0, i32* %u32Temp1, align 4, !dbg !1330
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1331, metadata !DIExpression()), !dbg !1332
  store i32 0, i32* %u32Temp2, align 4, !dbg !1332
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1333
  %cmp = icmp sle i32 %0, 0, !dbg !1335
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1336

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %cmp1 = icmp sge i32 %1, 0, !dbg !1340
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1341

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1342
  br label %return, !dbg !1342

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1344
  %sub = sub nsw i32 0, %2, !dbg !1346
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1347
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1348
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1349
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1351
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1351
  %div = udiv i32 %4, %5, !dbg !1351, !klee.check.div !133
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1352
  %mul = mul i32 %div, %6, !dbg !1353
  %sub3 = sub i32 %3, %mul, !dbg !1354
  %shl = shl i32 %sub3, 1, !dbg !1355
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1356
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1357
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1359
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1359
  %div4 = udiv i32 %7, %8, !dbg !1359, !klee.check.div !133
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1361
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1362
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1362
  %div5 = udiv i32 %9, %10, !dbg !1362, !klee.check.div !133
  %add = add i32 %div4, %div5, !dbg !1363
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1364
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1365
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1367
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1368

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1369
  %sub8 = sub i32 0, %12, !dbg !1371
  store i32 %sub8, i32* %retval, align 4, !dbg !1372
  br label %return, !dbg !1372

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1373
  br label %return, !dbg !1373

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1375
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1377
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1378
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1379
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1379
  %div11 = udiv i32 %14, %15, !dbg !1379, !klee.check.div !133
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %mul12 = mul i32 %div11, %16, !dbg !1381
  %sub13 = sub i32 %13, %mul12, !dbg !1382
  %shl14 = shl i32 %sub13, 1, !dbg !1383
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1384
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1385
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1386
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1387
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1387
  %div15 = udiv i32 %17, %18, !dbg !1387, !klee.check.div !133
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1388
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1389
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1390
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1390
  %div16 = udiv i32 %19, %20, !dbg !1390, !klee.check.div !133
  %add17 = add i32 %div15, %div16, !dbg !1391
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1392
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1393
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1395
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1396

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1397
  store i32 %22, i32* %retval, align 4, !dbg !1399
  br label %return, !dbg !1399

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1400
  br label %return, !dbg !1400

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1402
  ret i32 %23, !dbg !1402
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1403 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1406, metadata !DIExpression()), !dbg !1407
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1408, metadata !DIExpression()), !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1410, metadata !DIExpression()), !dbg !1411
  store i32 0, i32* %s32Temp1, align 4, !dbg !1411
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1412, metadata !DIExpression()), !dbg !1413
  store i32 0, i32* %s32Temp2, align 4, !dbg !1413
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1414, metadata !DIExpression()), !dbg !1415
  store i32 0, i32* %u32Temp0, align 4, !dbg !1415
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1416, metadata !DIExpression()), !dbg !1417
  store i32 0, i32* %u32Temp1, align 4, !dbg !1417
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1418, metadata !DIExpression()), !dbg !1419
  store i32 0, i32* %u32Temp2, align 4, !dbg !1419
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %cmp = icmp eq i32 %0, 0, !dbg !1422
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1423

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1424
  %cmp1 = icmp slt i32 %1, 0, !dbg !1427
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1428

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1429
  br label %return, !dbg !1429

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1431
  br label %return, !dbg !1431

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1433
  %cmp4 = icmp sle i32 %2, 0, !dbg !1436
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1437

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1438
  %sub = sub nsw i32 0, %3, !dbg !1440
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1441
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1442
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1443
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1444
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1444
  %div = udiv i32 %4, %5, !dbg !1444, !klee.check.div !133
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1445
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1446
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1447
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1449
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1449
  %div6 = udiv i32 %7, %8, !dbg !1449, !klee.check.div !133
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %mul = mul i32 %div6, %9, !dbg !1451
  %sub7 = sub i32 %6, %mul, !dbg !1452
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1453
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %and = and i32 %10, 1, !dbg !1456
  %cmp8 = icmp eq i32 %and, 0, !dbg !1457
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1458

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %shr = lshr i32 %11, 1, !dbg !1461
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1462
  br label %if.end, !dbg !1463

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %shr11 = lshr i32 %12, 1, !dbg !1466
  %add = add i32 %shr11, 1, !dbg !1467
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1468
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1469
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1471
  %cmp12 = icmp ult i32 %13, %14, !dbg !1472
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1473

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1474
  %neg = xor i32 %15, -1, !dbg !1476
  %add14 = add i32 %neg, 1, !dbg !1477
  store i32 %add14, i32* %retval, align 4, !dbg !1478
  br label %return, !dbg !1478

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1479
  %add16 = add i32 %16, 1, !dbg !1481
  %neg17 = xor i32 %add16, -1, !dbg !1482
  %add18 = add i32 %neg17, 1, !dbg !1483
  store i32 %add18, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1487
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1489
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1489
  %div20 = udiv i32 %18, %19, !dbg !1489, !klee.check.div !133
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %mul21 = mul i32 %div20, %20, !dbg !1491
  %sub22 = sub i32 %17, %mul21, !dbg !1492
  %shl = shl i32 %sub22, 1, !dbg !1493
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1494
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1495
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1497
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1497
  %div23 = udiv i32 %21, %22, !dbg !1497, !klee.check.div !133
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1498
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1499
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1500
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1500
  %div24 = udiv i32 %23, %24, !dbg !1500, !klee.check.div !133
  %add25 = add i32 %div23, %div24, !dbg !1501
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1502
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1503
  store i32 %25, i32* %retval, align 4, !dbg !1504
  br label %return, !dbg !1504

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1505
  ret i32 %26, !dbg !1505
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1506 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1509, metadata !DIExpression()), !dbg !1510
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1511, metadata !DIExpression()), !dbg !1512
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1513, metadata !DIExpression()), !dbg !1514
  store i32 0, i32* %s32Temp1, align 4, !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 0, i32* %s32Temp2, align 4, !dbg !1516
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1517, metadata !DIExpression()), !dbg !1518
  store i32 0, i32* %denominator_prime, align 4, !dbg !1518
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1519, metadata !DIExpression()), !dbg !1520
  store i32 0, i32* %u32Temp1, align 4, !dbg !1520
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1521, metadata !DIExpression()), !dbg !1522
  store i32 0, i32* %u32Temp2, align 4, !dbg !1522
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1523, metadata !DIExpression()), !dbg !1524
  store i32 0, i32* %u32numerator, align 4, !dbg !1524
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1525, metadata !DIExpression()), !dbg !1526
  store i32 0, i32* %u32denominator, align 4, !dbg !1526
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1527
  %cmp = icmp slt i32 %0, 0, !dbg !1529
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1530

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %cmp1 = icmp sle i32 %1, 0, !dbg !1534
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1535

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1536
  %cmp3 = icmp sge i32 %2, 0, !dbg !1539
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1540

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1541
  br label %return, !dbg !1541

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1543
  %sub = sub nsw i32 0, %3, !dbg !1545
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1546
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1547
  %sub5 = sub nsw i32 0, %4, !dbg !1548
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1549
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1550
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1551
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1552
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1553
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1553
  %div = udiv i32 %6, %7, !dbg !1553, !klee.check.div !133
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1554
  %mul = mul i32 %div, %8, !dbg !1555
  %sub6 = sub i32 %5, %mul, !dbg !1556
  %shl = shl i32 %sub6, 1, !dbg !1557
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1558
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1559
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1560
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1561
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1561
  %div7 = udiv i32 %9, %10, !dbg !1561, !klee.check.div !133
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1562
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1563
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1564
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1564
  %div8 = udiv i32 %11, %12, !dbg !1564, !klee.check.div !133
  %add = add i32 %div7, %div8, !dbg !1565
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1566
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1567
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1569
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1570

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1571
  store i32 %14, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1574
  br label %return, !dbg !1574

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1576
  %neg = xor i32 %15, -1, !dbg !1578
  %add13 = add nsw i32 %neg, 1, !dbg !1579
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1580
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1581
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1582
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1584
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1584
  %div14 = udiv i32 %17, %18, !dbg !1584, !klee.check.div !133
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1585
  %mul15 = mul i32 %div14, %19, !dbg !1586
  %sub16 = sub i32 %16, %mul15, !dbg !1587
  %shl17 = shl i32 %sub16, 1, !dbg !1588
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1589
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1590
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1591
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1592
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1592
  %div18 = udiv i32 %20, %21, !dbg !1592, !klee.check.div !133
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1593
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1594
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1595
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1595
  %div19 = sdiv i32 %22, %23, !dbg !1595, !klee.check.div !133
  %add20 = add i32 %div18, %div19, !dbg !1596
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1597
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1598
  %neg21 = xor i32 %24, -1, !dbg !1599
  %add22 = add nsw i32 %neg21, 1, !dbg !1600
  store i32 %add22, i32* %retval, align 4, !dbg !1601
  br label %return, !dbg !1601

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1602
  %cmp24 = icmp sle i32 %25, 0, !dbg !1605
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1606

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1607
  %cmp26 = icmp sge i32 %26, 0, !dbg !1610
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1611

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1612
  br label %return, !dbg !1612

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1614
  %neg29 = xor i32 %27, -1, !dbg !1616
  %add30 = add nsw i32 %neg29, 1, !dbg !1617
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1618
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1619
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1620
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1621
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1622
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1622
  %div31 = udiv i32 %29, %30, !dbg !1622, !klee.check.div !133
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1623
  %mul32 = mul i32 %div31, %31, !dbg !1624
  %sub33 = sub i32 %28, %mul32, !dbg !1625
  %shl34 = shl i32 %sub33, 1, !dbg !1626
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1627
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1628
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1629
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1630
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1630
  %div35 = udiv i32 %32, %33, !dbg !1630, !klee.check.div !133
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1631
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1632
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1633
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1633
  %div36 = udiv i32 %34, %35, !dbg !1633, !klee.check.div !133
  %add37 = add i32 %div35, %div36, !dbg !1634
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1635
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1636
  %neg38 = xor i32 %36, -1, !dbg !1637
  %add39 = add nsw i32 %neg38, 1, !dbg !1638
  store i32 %add39, i32* %retval, align 4, !dbg !1639
  br label %return, !dbg !1639

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1640
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1642
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1643
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1644
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1644
  %div41 = sdiv i32 %38, %39, !dbg !1644, !klee.check.div !133
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1645
  %mul42 = mul nsw i32 %div41, %40, !dbg !1646
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1647
  %shl44 = shl i32 %sub43, 1, !dbg !1648
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1649
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1650
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1651
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1652
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1652
  %div45 = sdiv i32 %41, %42, !dbg !1652, !klee.check.div !133
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1653
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1654
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1655
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1655
  %div46 = udiv i32 %43, %44, !dbg !1655, !klee.check.div !133
  %add47 = add i32 %div45, %div46, !dbg !1656
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1657
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1658
  store i32 %45, i32* %retval, align 4, !dbg !1659
  br label %return, !dbg !1659

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1660
  ret i32 %46, !dbg !1660
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1661 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1664, metadata !DIExpression()), !dbg !1665
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1666, metadata !DIExpression()), !dbg !1667
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1668, metadata !DIExpression()), !dbg !1669
  store i32 0, i32* %numerator_prime, align 4, !dbg !1669
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1670, metadata !DIExpression()), !dbg !1671
  store i32 0, i32* %u32Temp1, align 4, !dbg !1671
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1672, metadata !DIExpression()), !dbg !1673
  store i32 0, i32* %u32Temp2, align 4, !dbg !1673
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1674, metadata !DIExpression()), !dbg !1675
  store i32 0, i32* %u32Temp3, align 4, !dbg !1675
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1676, metadata !DIExpression()), !dbg !1677
  store i32 0, i32* %s32Temp1, align 4, !dbg !1677
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1678, metadata !DIExpression()), !dbg !1679
  store i32 0, i32* %s32Temp2, align 4, !dbg !1679
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1680, metadata !DIExpression()), !dbg !1681
  store i32 0, i32* %s32Temp3, align 4, !dbg !1681
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1682
  %cmp = icmp eq i32 %0, 0, !dbg !1684
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1685

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %cmp1 = icmp slt i32 %1, 0, !dbg !1689
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1690

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1691
  br label %return, !dbg !1691

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1693
  br label %return, !dbg !1693

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1695
  %cmp4 = icmp slt i32 %2, 0, !dbg !1698
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1699

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1700
  %sub = sub nsw i32 0, %3, !dbg !1702
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1703
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1704
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1705
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1706
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1706
  %div = udiv i32 %4, %5, !dbg !1706, !klee.check.div !133
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1707
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1708
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1709
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1710
  %mul = mul i32 %7, %8, !dbg !1711
  %sub6 = sub i32 %6, %mul, !dbg !1712
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1713
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1714
  %and = and i32 %9, 1, !dbg !1716
  %cmp7 = icmp eq i32 %and, 0, !dbg !1717
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1718

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1719
  %shr = lshr i32 %10, 1, !dbg !1721
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1722
  br label %if.end, !dbg !1723

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %shr10 = lshr i32 %11, 1, !dbg !1726
  %add = add i32 %shr10, 1, !dbg !1727
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1728
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1729
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1731
  %cmp11 = icmp ult i32 %12, %13, !dbg !1732
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1733

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1734
  %neg = xor i32 %14, -1, !dbg !1736
  %add13 = add i32 %neg, 1, !dbg !1737
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1738
  br label %if.end18, !dbg !1739

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1740
  %add15 = add i32 %15, 1, !dbg !1742
  %neg16 = xor i32 %add15, -1, !dbg !1743
  %add17 = add i32 %neg16, 1, !dbg !1744
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1745
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1746
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1748
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1749

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1750
  %conv = trunc i32 %17 to i16, !dbg !1752
  store i16 %conv, i16* %retval, align 2, !dbg !1753
  br label %return, !dbg !1753

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1754
  br label %return, !dbg !1754

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1756
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1758
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1759
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1759
  %div23 = udiv i32 %18, %19, !dbg !1759, !klee.check.div !133
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1760
  %mul24 = mul i32 %div23, %20, !dbg !1761
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1762
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1763
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1764
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1766
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1766
  %div25 = udiv i32 %22, %23, !dbg !1766, !klee.check.div !133
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1767
  %mul26 = mul i32 %div25, %24, !dbg !1768
  %sub27 = sub i32 %21, %mul26, !dbg !1769
  %shl = shl i32 %sub27, 1, !dbg !1770
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1771
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1772
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1773
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1774
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1774
  %div28 = udiv i32 %25, %26, !dbg !1774, !klee.check.div !133
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1775
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1776
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1777
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1777
  %div29 = udiv i32 %27, %28, !dbg !1777, !klee.check.div !133
  %add30 = add i32 %div28, %div29, !dbg !1778
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1779
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1780
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1782
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1783

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1784
  %conv34 = trunc i32 %30 to i16, !dbg !1786
  store i16 %conv34, i16* %retval, align 2, !dbg !1787
  br label %return, !dbg !1787

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1788
  br label %return, !dbg !1788

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1790
  ret i16 %31, !dbg !1790
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1791 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1797, metadata !DIExpression()), !dbg !1798
  %2 = icmp eq i64 %0, 0, !dbg !1799
  br i1 %2, label %3, label %4, !dbg !1801

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1802
  unreachable, !dbg !1802

4:                                                ; preds = %1
  ret void, !dbg !1803
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!29, !2, !31}
!llvm.ident = !{!33, !33, !34}
!llvm.module.flags = !{!35, !36, !37, !38, !39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !27, line: 21, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !26, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044/div_Ccode_alarm_0044.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044")
!4 = !{}
!5 = !{!6, !11, !12, !17, !22}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !13, line: 9, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !16)
!16 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !13, line: 6, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !21)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !13, line: 8, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !25)
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !{!0}
!27 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044")
!28 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!29 = distinct !DICompileUnit(language: DW_LANG_C99, file: !30, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!30 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044")
!31 = distinct !DICompileUnit(language: DW_LANG_C89, file: !32, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!32 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!33 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!34 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{i32 7, !"uwtable", i32 1}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = distinct !DISubprogram(name: "main", scope: !41, file: !41, line: 7, type: !42, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !29, retainedNodes: !4)
!41 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044")
!42 = !DISubroutineType(types: !43)
!43 = !{!11}
!44 = !DILocalVariable(name: "numerator", scope: !40, file: !41, line: 9, type: !14)
!45 = !DILocation(line: 9, column: 13, scope: !40)
!46 = !DILocalVariable(name: "denominator", scope: !40, file: !41, line: 10, type: !14)
!47 = !DILocation(line: 10, column: 13, scope: !40)
!48 = !DILocalVariable(name: "result", scope: !40, file: !41, line: 11, type: !14)
!49 = !DILocation(line: 11, column: 13, scope: !40)
!50 = !DILocation(line: 13, column: 24, scope: !40)
!51 = !DILocation(line: 13, column: 5, scope: !40)
!52 = !DILocation(line: 14, column: 24, scope: !40)
!53 = !DILocation(line: 14, column: 5, scope: !40)
!54 = !DILocation(line: 16, column: 36, scope: !40)
!55 = !DILocation(line: 16, column: 47, scope: !40)
!56 = !DILocation(line: 16, column: 14, scope: !40)
!57 = !DILocation(line: 16, column: 12, scope: !40)
!58 = !DILocation(line: 18, column: 11, scope: !40)
!59 = !DILocation(line: 19, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !61, file: !61, line: 170, type: !62, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044")
!62 = !DISubroutineType(types: !63)
!63 = !{!12, !12, !12}
!64 = !DILocalVariable(name: "numerator", arg: 1, scope: !60, file: !61, line: 170, type: !12)
!65 = !DILocation(line: 170, column: 31, scope: !60)
!66 = !DILocalVariable(name: "denominator", arg: 2, scope: !60, file: !61, line: 170, type: !12)
!67 = !DILocation(line: 170, column: 47, scope: !60)
!68 = !DILocalVariable(name: "s32Temp1", scope: !60, file: !61, line: 172, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !13, line: 11, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!72 = !DILocation(line: 172, column: 6, scope: !60)
!73 = !DILocalVariable(name: "s32Temp2", scope: !60, file: !61, line: 172, type: !69)
!74 = !DILocation(line: 172, column: 15, scope: !60)
!75 = !DILocation(line: 174, column: 61, scope: !76)
!76 = distinct !DILexicalBlock(scope: !60, file: !61, line: 174, column: 6)
!77 = !DILocation(line: 174, column: 56, scope: !76)
!78 = !DILocation(line: 174, column: 46, scope: !76)
!79 = !DILocation(line: 174, column: 8, scope: !76)
!80 = !DILocation(line: 174, column: 6, scope: !60)
!81 = !DILocation(line: 175, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !61, line: 174, column: 75)
!83 = !DILocation(line: 182, column: 39, scope: !60)
!84 = !DILocation(line: 182, column: 34, scope: !60)
!85 = !DILocation(line: 182, column: 49, scope: !60)
!86 = !DILocation(line: 182, column: 24, scope: !60)
!87 = !DILocation(line: 182, column: 22, scope: !60)
!88 = !DILocation(line: 183, column: 2, scope: !60)
!89 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !27, file: !27, line: 84, type: !90, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DISubroutineType(types: !91)
!91 = !{!11, !6}
!92 = !DILocalVariable(name: "left", arg: 1, scope: !89, file: !27, line: 84, type: !6)
!93 = !DILocation(line: 84, column: 51, scope: !89)
!94 = !DILocation(line: 86, column: 12, scope: !89)
!95 = !DILocation(line: 86, column: 17, scope: !89)
!96 = !DILocation(line: 86, column: 5, scope: !89)
!97 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !61, file: !61, line: 265, type: !98, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!12, !69, !12}
!100 = !DILocalVariable(name: "numerator", arg: 1, scope: !97, file: !61, line: 265, type: !69)
!101 = !DILocation(line: 265, column: 25, scope: !97)
!102 = !DILocalVariable(name: "denominator", arg: 2, scope: !97, file: !61, line: 265, type: !12)
!103 = !DILocation(line: 265, column: 41, scope: !97)
!104 = !DILocalVariable(name: "s32Temp1", scope: !97, file: !61, line: 267, type: !69)
!105 = !DILocation(line: 267, column: 6, scope: !97)
!106 = !DILocalVariable(name: "s32Temp2", scope: !97, file: !61, line: 267, type: !69)
!107 = !DILocation(line: 267, column: 17, scope: !97)
!108 = !DILocation(line: 268, column: 13, scope: !97)
!109 = !DILocation(line: 268, column: 11, scope: !97)
!110 = !DILocation(line: 269, column: 5, scope: !111)
!111 = distinct !DILexicalBlock(scope: !97, file: !61, line: 269, column: 5)
!112 = !DILocation(line: 269, column: 17, scope: !111)
!113 = !DILocation(line: 269, column: 5, scope: !97)
!114 = !DILocation(line: 271, column: 7, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !61, line: 271, column: 7)
!116 = distinct !DILexicalBlock(scope: !111, file: !61, line: 270, column: 2)
!117 = !DILocation(line: 271, column: 17, scope: !115)
!118 = !DILocation(line: 271, column: 7, scope: !116)
!119 = !DILocation(line: 273, column: 4, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !61, line: 272, column: 3)
!121 = !DILocation(line: 277, column: 4, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !61, line: 276, column: 3)
!123 = !DILocation(line: 282, column: 6, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !61, line: 282, column: 6)
!125 = distinct !DILexicalBlock(scope: !111, file: !61, line: 281, column: 2)
!126 = !DILocation(line: 282, column: 16, scope: !124)
!127 = !DILocation(line: 282, column: 6, scope: !125)
!128 = !DILocation(line: 284, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !61, line: 283, column: 3)
!130 = !DILocation(line: 284, column: 28, scope: !129)
!131 = !DILocation(line: 284, column: 37, scope: !129)
!132 = !DILocation(line: 284, column: 36, scope: !129)
!133 = !{!"True"}
!134 = !DILocation(line: 284, column: 52, scope: !129)
!135 = !DILocation(line: 284, column: 50, scope: !129)
!136 = !DILocation(line: 284, column: 25, scope: !129)
!137 = !DILocation(line: 284, column: 65, scope: !129)
!138 = !DILocation(line: 284, column: 13, scope: !129)
!139 = !DILocation(line: 285, column: 15, scope: !129)
!140 = !DILocation(line: 285, column: 24, scope: !129)
!141 = !DILocation(line: 285, column: 23, scope: !129)
!142 = !DILocation(line: 285, column: 13, scope: !129)
!143 = !DILocation(line: 286, column: 15, scope: !129)
!144 = !DILocation(line: 286, column: 27, scope: !129)
!145 = !DILocation(line: 286, column: 38, scope: !129)
!146 = !DILocation(line: 286, column: 37, scope: !129)
!147 = !DILocation(line: 286, column: 24, scope: !129)
!148 = !DILocation(line: 286, column: 13, scope: !129)
!149 = !DILocation(line: 287, column: 7, scope: !150)
!150 = distinct !DILexicalBlock(scope: !129, file: !61, line: 287, column: 7)
!151 = !DILocation(line: 287, column: 16, scope: !150)
!152 = !DILocation(line: 287, column: 7, scope: !129)
!153 = !DILocation(line: 289, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !61, line: 289, column: 8)
!155 = distinct !DILexicalBlock(scope: !150, file: !61, line: 288, column: 4)
!156 = !DILocation(line: 289, column: 17, scope: !154)
!157 = !DILocation(line: 289, column: 8, scope: !155)
!158 = !DILocation(line: 291, column: 18, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !61, line: 290, column: 5)
!160 = !DILocation(line: 291, column: 13, scope: !159)
!161 = !DILocation(line: 291, column: 6, scope: !159)
!162 = !DILocation(line: 295, column: 6, scope: !163)
!163 = distinct !DILexicalBlock(scope: !154, file: !61, line: 294, column: 5)
!164 = !DILocation(line: 300, column: 5, scope: !165)
!165 = distinct !DILexicalBlock(scope: !150, file: !61, line: 299, column: 4)
!166 = !DILocation(line: 305, column: 7, scope: !167)
!167 = distinct !DILexicalBlock(scope: !168, file: !61, line: 305, column: 7)
!168 = distinct !DILexicalBlock(scope: !124, file: !61, line: 304, column: 3)
!169 = !DILocation(line: 305, column: 19, scope: !167)
!170 = !DILocation(line: 305, column: 7, scope: !168)
!171 = !DILocation(line: 307, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !61, line: 306, column: 4)
!173 = !DILocation(line: 307, column: 29, scope: !172)
!174 = !DILocation(line: 307, column: 38, scope: !172)
!175 = !DILocation(line: 307, column: 37, scope: !172)
!176 = !DILocation(line: 307, column: 53, scope: !172)
!177 = !DILocation(line: 307, column: 51, scope: !172)
!178 = !DILocation(line: 307, column: 26, scope: !172)
!179 = !DILocation(line: 307, column: 66, scope: !172)
!180 = !DILocation(line: 307, column: 14, scope: !172)
!181 = !DILocation(line: 308, column: 16, scope: !172)
!182 = !DILocation(line: 308, column: 25, scope: !172)
!183 = !DILocation(line: 308, column: 24, scope: !172)
!184 = !DILocation(line: 308, column: 14, scope: !172)
!185 = !DILocation(line: 309, column: 16, scope: !172)
!186 = !DILocation(line: 309, column: 28, scope: !172)
!187 = !DILocation(line: 309, column: 39, scope: !172)
!188 = !DILocation(line: 309, column: 38, scope: !172)
!189 = !DILocation(line: 309, column: 25, scope: !172)
!190 = !DILocation(line: 309, column: 14, scope: !172)
!191 = !DILocation(line: 310, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !172, file: !61, line: 310, column: 8)
!193 = !DILocation(line: 310, column: 17, scope: !192)
!194 = !DILocation(line: 310, column: 8, scope: !172)
!195 = !DILocation(line: 312, column: 9, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !61, line: 312, column: 9)
!197 = distinct !DILexicalBlock(scope: !192, file: !61, line: 311, column: 5)
!198 = !DILocation(line: 312, column: 18, scope: !196)
!199 = !DILocation(line: 312, column: 9, scope: !197)
!200 = !DILocation(line: 314, column: 19, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !61, line: 313, column: 6)
!202 = !DILocation(line: 314, column: 14, scope: !201)
!203 = !DILocation(line: 314, column: 7, scope: !201)
!204 = !DILocation(line: 318, column: 7, scope: !205)
!205 = distinct !DILexicalBlock(scope: !196, file: !61, line: 317, column: 6)
!206 = !DILocation(line: 323, column: 6, scope: !207)
!207 = distinct !DILexicalBlock(scope: !192, file: !61, line: 322, column: 5)
!208 = !DILocation(line: 329, column: 5, scope: !209)
!209 = distinct !DILexicalBlock(scope: !167, file: !61, line: 328, column: 4)
!210 = !DILocation(line: 335, column: 1, scope: !97)
!211 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !61, file: !61, line: 353, type: !212, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!212 = !DISubroutineType(types: !213)
!213 = !{!12, !12, !22}
!214 = !DILocalVariable(name: "numerator", arg: 1, scope: !211, file: !61, line: 353, type: !12)
!215 = !DILocation(line: 353, column: 31, scope: !211)
!216 = !DILocalVariable(name: "denominator", arg: 2, scope: !211, file: !61, line: 353, type: !22)
!217 = !DILocation(line: 353, column: 47, scope: !211)
!218 = !DILocalVariable(name: "u16Temp1", scope: !211, file: !61, line: 355, type: !22)
!219 = !DILocation(line: 355, column: 6, scope: !211)
!220 = !DILocalVariable(name: "s32Temp1", scope: !211, file: !61, line: 356, type: !69)
!221 = !DILocation(line: 356, column: 6, scope: !211)
!222 = !DILocalVariable(name: "s32Temp2", scope: !211, file: !61, line: 356, type: !69)
!223 = !DILocation(line: 356, column: 15, scope: !211)
!224 = !DILocation(line: 357, column: 13, scope: !211)
!225 = !DILocation(line: 357, column: 25, scope: !211)
!226 = !DILocation(line: 357, column: 11, scope: !211)
!227 = !DILocation(line: 358, column: 13, scope: !211)
!228 = !DILocation(line: 358, column: 22, scope: !211)
!229 = !DILocation(line: 358, column: 11, scope: !211)
!230 = !DILocation(line: 359, column: 5, scope: !231)
!231 = distinct !DILexicalBlock(scope: !211, file: !61, line: 359, column: 5)
!232 = !DILocation(line: 359, column: 14, scope: !231)
!233 = !DILocation(line: 359, column: 5, scope: !211)
!234 = !DILocation(line: 361, column: 7, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !61, line: 361, column: 7)
!236 = distinct !DILexicalBlock(scope: !231, file: !61, line: 360, column: 2)
!237 = !DILocation(line: 361, column: 17, scope: !235)
!238 = !DILocation(line: 361, column: 7, scope: !236)
!239 = !DILocation(line: 363, column: 4, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !61, line: 362, column: 3)
!241 = !DILocation(line: 367, column: 4, scope: !242)
!242 = distinct !DILexicalBlock(scope: !235, file: !61, line: 366, column: 3)
!243 = !DILocation(line: 372, column: 15, scope: !244)
!244 = distinct !DILexicalBlock(scope: !231, file: !61, line: 371, column: 2)
!245 = !DILocation(line: 372, column: 24, scope: !244)
!246 = !DILocation(line: 372, column: 32, scope: !244)
!247 = !DILocation(line: 372, column: 41, scope: !244)
!248 = !DILocation(line: 372, column: 47, scope: !244)
!249 = !DILocation(line: 372, column: 46, scope: !244)
!250 = !DILocation(line: 372, column: 57, scope: !244)
!251 = !DILocation(line: 372, column: 56, scope: !244)
!252 = !DILocation(line: 372, column: 29, scope: !244)
!253 = !DILocation(line: 372, column: 12, scope: !244)
!254 = !DILocation(line: 373, column: 14, scope: !244)
!255 = !DILocation(line: 373, column: 22, scope: !244)
!256 = !DILocation(line: 373, column: 12, scope: !244)
!257 = !DILocation(line: 374, column: 14, scope: !244)
!258 = !DILocation(line: 374, column: 23, scope: !244)
!259 = !DILocation(line: 374, column: 22, scope: !244)
!260 = !DILocation(line: 374, column: 12, scope: !244)
!261 = !DILocation(line: 375, column: 16, scope: !244)
!262 = !DILocation(line: 375, column: 25, scope: !244)
!263 = !DILocation(line: 375, column: 31, scope: !244)
!264 = !DILocation(line: 375, column: 30, scope: !244)
!265 = !DILocation(line: 375, column: 43, scope: !244)
!266 = !DILocation(line: 375, column: 41, scope: !244)
!267 = !DILocation(line: 375, column: 12, scope: !244)
!268 = !DILocation(line: 376, column: 6, scope: !269)
!269 = distinct !DILexicalBlock(scope: !244, file: !61, line: 376, column: 6)
!270 = !DILocation(line: 376, column: 15, scope: !269)
!271 = !DILocation(line: 376, column: 6, scope: !244)
!272 = !DILocation(line: 378, column: 7, scope: !273)
!273 = distinct !DILexicalBlock(scope: !274, file: !61, line: 378, column: 7)
!274 = distinct !DILexicalBlock(scope: !269, file: !61, line: 377, column: 3)
!275 = !DILocation(line: 378, column: 16, scope: !273)
!276 = !DILocation(line: 378, column: 7, scope: !274)
!277 = !DILocation(line: 380, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !273, file: !61, line: 379, column: 4)
!279 = !DILocation(line: 380, column: 12, scope: !278)
!280 = !DILocation(line: 380, column: 5, scope: !278)
!281 = !DILocation(line: 384, column: 5, scope: !282)
!282 = distinct !DILexicalBlock(scope: !273, file: !61, line: 383, column: 4)
!283 = !DILocation(line: 389, column: 4, scope: !284)
!284 = distinct !DILexicalBlock(scope: !269, file: !61, line: 388, column: 3)
!285 = !DILocation(line: 392, column: 1, scope: !211)
!286 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !61, file: !61, line: 409, type: !212, scopeLine: 410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!287 = !DILocalVariable(name: "numerator", arg: 1, scope: !286, file: !61, line: 409, type: !12)
!288 = !DILocation(line: 409, column: 30, scope: !286)
!289 = !DILocalVariable(name: "denominator", arg: 2, scope: !286, file: !61, line: 409, type: !22)
!290 = !DILocation(line: 409, column: 45, scope: !286)
!291 = !DILocalVariable(name: "u16Temp1", scope: !286, file: !61, line: 411, type: !22)
!292 = !DILocation(line: 411, column: 6, scope: !286)
!293 = !DILocalVariable(name: "s32Temp1", scope: !286, file: !61, line: 412, type: !69)
!294 = !DILocation(line: 412, column: 6, scope: !286)
!295 = !DILocation(line: 413, column: 13, scope: !286)
!296 = !DILocation(line: 413, column: 25, scope: !286)
!297 = !DILocation(line: 413, column: 11, scope: !286)
!298 = !DILocation(line: 414, column: 5, scope: !299)
!299 = distinct !DILexicalBlock(scope: !286, file: !61, line: 414, column: 5)
!300 = !DILocation(line: 414, column: 13, scope: !299)
!301 = !DILocation(line: 414, column: 5, scope: !286)
!302 = !DILocation(line: 416, column: 6, scope: !303)
!303 = distinct !DILexicalBlock(scope: !304, file: !61, line: 416, column: 6)
!304 = distinct !DILexicalBlock(scope: !299, file: !61, line: 415, column: 2)
!305 = !DILocation(line: 416, column: 15, scope: !303)
!306 = !DILocation(line: 416, column: 6, scope: !304)
!307 = !DILocation(line: 418, column: 4, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !61, line: 417, column: 3)
!309 = !DILocation(line: 422, column: 4, scope: !310)
!310 = distinct !DILexicalBlock(scope: !303, file: !61, line: 421, column: 3)
!311 = !DILocation(line: 428, column: 15, scope: !312)
!312 = distinct !DILexicalBlock(scope: !299, file: !61, line: 427, column: 2)
!313 = !DILocation(line: 428, column: 27, scope: !312)
!314 = !DILocation(line: 428, column: 37, scope: !312)
!315 = !DILocation(line: 428, column: 36, scope: !312)
!316 = !DILocation(line: 428, column: 49, scope: !312)
!317 = !DILocation(line: 428, column: 47, scope: !312)
!318 = !DILocation(line: 428, column: 25, scope: !312)
!319 = !DILocation(line: 428, column: 59, scope: !312)
!320 = !DILocation(line: 428, column: 12, scope: !312)
!321 = !DILocation(line: 429, column: 15, scope: !312)
!322 = !DILocation(line: 429, column: 24, scope: !312)
!323 = !DILocation(line: 429, column: 23, scope: !312)
!324 = !DILocation(line: 429, column: 37, scope: !312)
!325 = !DILocation(line: 429, column: 47, scope: !312)
!326 = !DILocation(line: 429, column: 46, scope: !312)
!327 = !DILocation(line: 429, column: 34, scope: !312)
!328 = !DILocation(line: 429, column: 12, scope: !312)
!329 = !DILocation(line: 430, column: 10, scope: !312)
!330 = !DILocation(line: 430, column: 3, scope: !312)
!331 = !DILocation(line: 432, column: 1, scope: !286)
!332 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !61, file: !61, line: 450, type: !333, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!333 = !DISubroutineType(types: !334)
!334 = !{!17, !22, !22}
!335 = !DILocalVariable(name: "numerator", arg: 1, scope: !332, file: !61, line: 450, type: !22)
!336 = !DILocation(line: 450, column: 28, scope: !332)
!337 = !DILocalVariable(name: "denominator", arg: 2, scope: !332, file: !61, line: 450, type: !22)
!338 = !DILocation(line: 450, column: 43, scope: !332)
!339 = !DILocalVariable(name: "u32Temp1", scope: !332, file: !61, line: 452, type: !340)
!340 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !341)
!341 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !342)
!342 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !343)
!343 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!344 = !DILocation(line: 452, column: 6, scope: !332)
!345 = !DILocalVariable(name: "u32Temp2", scope: !332, file: !61, line: 452, type: !340)
!346 = !DILocation(line: 452, column: 20, scope: !332)
!347 = !DILocalVariable(name: "u32Temp3", scope: !332, file: !61, line: 452, type: !340)
!348 = !DILocation(line: 452, column: 33, scope: !332)
!349 = !DILocation(line: 453, column: 5, scope: !350)
!350 = distinct !DILexicalBlock(scope: !332, file: !61, line: 453, column: 5)
!351 = !DILocation(line: 453, column: 16, scope: !350)
!352 = !DILocation(line: 453, column: 5, scope: !332)
!353 = !DILocation(line: 455, column: 3, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !61, line: 454, column: 2)
!355 = !DILocation(line: 459, column: 15, scope: !356)
!356 = distinct !DILexicalBlock(scope: !350, file: !61, line: 458, column: 2)
!357 = !DILocation(line: 459, column: 24, scope: !356)
!358 = !DILocation(line: 459, column: 12, scope: !356)
!359 = !DILocation(line: 460, column: 14, scope: !356)
!360 = !DILocation(line: 460, column: 25, scope: !356)
!361 = !DILocation(line: 460, column: 23, scope: !356)
!362 = !DILocation(line: 460, column: 12, scope: !356)
!363 = !DILocation(line: 461, column: 15, scope: !356)
!364 = !DILocation(line: 461, column: 24, scope: !356)
!365 = !DILocation(line: 461, column: 32, scope: !356)
!366 = !DILocation(line: 461, column: 12, scope: !356)
!367 = !DILocation(line: 462, column: 6, scope: !368)
!368 = distinct !DILexicalBlock(scope: !356, file: !61, line: 462, column: 6)
!369 = !DILocation(line: 462, column: 15, scope: !368)
!370 = !DILocation(line: 462, column: 6, scope: !356)
!371 = !DILocation(line: 464, column: 15, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !61, line: 463, column: 3)
!373 = !DILocation(line: 464, column: 11, scope: !372)
!374 = !DILocation(line: 464, column: 4, scope: !372)
!375 = !DILocation(line: 468, column: 4, scope: !376)
!376 = distinct !DILexicalBlock(scope: !368, file: !61, line: 467, column: 3)
!377 = !DILocation(line: 471, column: 1, scope: !332)
!378 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !61, file: !61, line: 488, type: !379, scopeLine: 489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!379 = !DISubroutineType(types: !380)
!380 = !{!22, !69, !22}
!381 = !DILocalVariable(name: "x_value", arg: 1, scope: !378, file: !61, line: 488, type: !69)
!382 = !DILocation(line: 488, column: 25, scope: !378)
!383 = !DILocalVariable(name: "y_value", arg: 2, scope: !378, file: !61, line: 488, type: !22)
!384 = !DILocation(line: 488, column: 38, scope: !378)
!385 = !DILocalVariable(name: "s32Temp1", scope: !378, file: !61, line: 490, type: !69)
!386 = !DILocation(line: 490, column: 6, scope: !378)
!387 = !DILocation(line: 491, column: 12, scope: !378)
!388 = !DILocation(line: 491, column: 20, scope: !378)
!389 = !DILocation(line: 491, column: 10, scope: !378)
!390 = !DILocation(line: 492, column: 6, scope: !391)
!391 = distinct !DILexicalBlock(scope: !378, file: !61, line: 492, column: 5)
!392 = !DILocation(line: 492, column: 14, scope: !391)
!393 = !DILocation(line: 492, column: 24, scope: !391)
!394 = !DILocation(line: 492, column: 5, scope: !378)
!395 = !DILocation(line: 494, column: 6, scope: !396)
!396 = distinct !DILexicalBlock(scope: !397, file: !61, line: 494, column: 6)
!397 = distinct !DILexicalBlock(scope: !391, file: !61, line: 493, column: 2)
!398 = !DILocation(line: 494, column: 14, scope: !396)
!399 = !DILocation(line: 494, column: 6, scope: !397)
!400 = !DILocation(line: 496, column: 4, scope: !401)
!401 = distinct !DILexicalBlock(scope: !396, file: !61, line: 495, column: 3)
!402 = !DILocation(line: 500, column: 4, scope: !403)
!403 = distinct !DILexicalBlock(scope: !396, file: !61, line: 499, column: 3)
!404 = !DILocation(line: 505, column: 15, scope: !405)
!405 = distinct !DILexicalBlock(scope: !391, file: !61, line: 504, column: 2)
!406 = !DILocation(line: 505, column: 27, scope: !405)
!407 = !DILocation(line: 505, column: 35, scope: !405)
!408 = !DILocation(line: 505, column: 34, scope: !405)
!409 = !DILocation(line: 505, column: 46, scope: !405)
!410 = !DILocation(line: 505, column: 44, scope: !405)
!411 = !DILocation(line: 505, column: 23, scope: !405)
!412 = !DILocation(line: 505, column: 56, scope: !405)
!413 = !DILocation(line: 505, column: 12, scope: !405)
!414 = !DILocation(line: 506, column: 15, scope: !405)
!415 = !DILocation(line: 506, column: 24, scope: !405)
!416 = !DILocation(line: 506, column: 23, scope: !405)
!417 = !DILocation(line: 506, column: 36, scope: !405)
!418 = !DILocation(line: 506, column: 44, scope: !405)
!419 = !DILocation(line: 506, column: 43, scope: !405)
!420 = !DILocation(line: 506, column: 33, scope: !405)
!421 = !DILocation(line: 506, column: 12, scope: !405)
!422 = !DILocation(line: 507, column: 6, scope: !423)
!423 = distinct !DILexicalBlock(scope: !405, file: !61, line: 507, column: 6)
!424 = !DILocation(line: 507, column: 15, scope: !423)
!425 = !DILocation(line: 507, column: 6, scope: !405)
!426 = !DILocation(line: 509, column: 7, scope: !427)
!427 = distinct !DILexicalBlock(scope: !428, file: !61, line: 509, column: 7)
!428 = distinct !DILexicalBlock(scope: !423, file: !61, line: 508, column: 3)
!429 = !DILocation(line: 509, column: 16, scope: !427)
!430 = !DILocation(line: 509, column: 7, scope: !428)
!431 = !DILocation(line: 511, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !427, file: !61, line: 510, column: 4)
!433 = !DILocation(line: 511, column: 12, scope: !432)
!434 = !DILocation(line: 511, column: 5, scope: !432)
!435 = !DILocation(line: 515, column: 5, scope: !436)
!436 = distinct !DILexicalBlock(scope: !427, file: !61, line: 514, column: 4)
!437 = !DILocation(line: 520, column: 4, scope: !438)
!438 = distinct !DILexicalBlock(scope: !423, file: !61, line: 519, column: 3)
!439 = !DILocation(line: 523, column: 1, scope: !378)
!440 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !61, file: !61, line: 541, type: !441, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!441 = !DISubroutineType(types: !442)
!442 = !{!22, !22, !22}
!443 = !DILocalVariable(name: "numerator", arg: 1, scope: !440, file: !61, line: 541, type: !22)
!444 = !DILocation(line: 541, column: 31, scope: !440)
!445 = !DILocalVariable(name: "denominator", arg: 2, scope: !440, file: !61, line: 541, type: !22)
!446 = !DILocation(line: 541, column: 46, scope: !440)
!447 = !DILocalVariable(name: "u32Temp", scope: !440, file: !61, line: 543, type: !340)
!448 = !DILocation(line: 543, column: 6, scope: !440)
!449 = !DILocation(line: 544, column: 5, scope: !450)
!450 = distinct !DILexicalBlock(scope: !440, file: !61, line: 544, column: 5)
!451 = !DILocation(line: 544, column: 17, scope: !450)
!452 = !DILocation(line: 544, column: 5, scope: !440)
!453 = !DILocation(line: 546, column: 3, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !61, line: 545, column: 2)
!455 = !DILocation(line: 550, column: 14, scope: !456)
!456 = distinct !DILexicalBlock(scope: !450, file: !61, line: 549, column: 2)
!457 = !DILocation(line: 550, column: 23, scope: !456)
!458 = !DILocation(line: 550, column: 32, scope: !456)
!459 = !DILocation(line: 550, column: 44, scope: !456)
!460 = !DILocation(line: 550, column: 29, scope: !456)
!461 = !DILocation(line: 550, column: 11, scope: !456)
!462 = !DILocation(line: 551, column: 13, scope: !456)
!463 = !DILocation(line: 551, column: 21, scope: !456)
!464 = !DILocation(line: 551, column: 20, scope: !456)
!465 = !DILocation(line: 551, column: 11, scope: !456)
!466 = !DILocation(line: 552, column: 6, scope: !467)
!467 = distinct !DILexicalBlock(scope: !456, file: !61, line: 552, column: 6)
!468 = !DILocation(line: 552, column: 14, scope: !467)
!469 = !DILocation(line: 552, column: 6, scope: !456)
!470 = !DILocation(line: 554, column: 11, scope: !471)
!471 = distinct !DILexicalBlock(scope: !467, file: !61, line: 553, column: 3)
!472 = !DILocation(line: 554, column: 19, scope: !471)
!473 = !DILocation(line: 554, column: 4, scope: !471)
!474 = !DILocation(line: 558, column: 4, scope: !475)
!475 = distinct !DILexicalBlock(scope: !467, file: !61, line: 557, column: 3)
!476 = !DILocation(line: 562, column: 1, scope: !440)
!477 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !61, file: !61, line: 579, type: !478, scopeLine: 580, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!478 = !DISubroutineType(types: !479)
!479 = !{!22, !340, !22}
!480 = !DILocalVariable(name: "x_value", arg: 1, scope: !477, file: !61, line: 579, type: !340)
!481 = !DILocation(line: 579, column: 25, scope: !477)
!482 = !DILocalVariable(name: "y_value", arg: 2, scope: !477, file: !61, line: 579, type: !22)
!483 = !DILocation(line: 579, column: 38, scope: !477)
!484 = !DILocalVariable(name: "u32Temp1", scope: !477, file: !61, line: 581, type: !340)
!485 = !DILocation(line: 581, column: 6, scope: !477)
!486 = !DILocalVariable(name: "u32Temp2", scope: !477, file: !61, line: 581, type: !340)
!487 = !DILocation(line: 581, column: 17, scope: !477)
!488 = !DILocation(line: 582, column: 12, scope: !477)
!489 = !DILocation(line: 582, column: 20, scope: !477)
!490 = !DILocation(line: 582, column: 10, scope: !477)
!491 = !DILocation(line: 583, column: 5, scope: !492)
!492 = distinct !DILexicalBlock(scope: !477, file: !61, line: 583, column: 5)
!493 = !DILocation(line: 583, column: 13, scope: !492)
!494 = !DILocation(line: 583, column: 5, scope: !477)
!495 = !DILocation(line: 585, column: 3, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !61, line: 584, column: 2)
!497 = !DILocation(line: 589, column: 14, scope: !498)
!498 = distinct !DILexicalBlock(scope: !492, file: !61, line: 588, column: 2)
!499 = !DILocation(line: 589, column: 22, scope: !498)
!500 = !DILocation(line: 589, column: 21, scope: !498)
!501 = !DILocation(line: 589, column: 12, scope: !498)
!502 = !DILocation(line: 590, column: 14, scope: !498)
!503 = !DILocation(line: 590, column: 25, scope: !498)
!504 = !DILocation(line: 590, column: 36, scope: !498)
!505 = !DILocation(line: 590, column: 34, scope: !498)
!506 = !DILocation(line: 590, column: 22, scope: !498)
!507 = !DILocation(line: 590, column: 45, scope: !498)
!508 = !DILocation(line: 590, column: 12, scope: !498)
!509 = !DILocation(line: 591, column: 15, scope: !498)
!510 = !DILocation(line: 591, column: 24, scope: !498)
!511 = !DILocation(line: 591, column: 23, scope: !498)
!512 = !DILocation(line: 591, column: 36, scope: !498)
!513 = !DILocation(line: 591, column: 44, scope: !498)
!514 = !DILocation(line: 591, column: 43, scope: !498)
!515 = !DILocation(line: 591, column: 33, scope: !498)
!516 = !DILocation(line: 591, column: 12, scope: !498)
!517 = !DILocation(line: 592, column: 6, scope: !518)
!518 = distinct !DILexicalBlock(scope: !498, file: !61, line: 592, column: 6)
!519 = !DILocation(line: 592, column: 15, scope: !518)
!520 = !DILocation(line: 592, column: 6, scope: !498)
!521 = !DILocation(line: 594, column: 11, scope: !522)
!522 = distinct !DILexicalBlock(scope: !518, file: !61, line: 593, column: 3)
!523 = !DILocation(line: 594, column: 20, scope: !522)
!524 = !DILocation(line: 594, column: 4, scope: !522)
!525 = !DILocation(line: 598, column: 4, scope: !526)
!526 = distinct !DILexicalBlock(scope: !518, file: !61, line: 597, column: 3)
!527 = !DILocation(line: 602, column: 1, scope: !477)
!528 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 621, type: !529, scopeLine: 622, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!529 = !DISubroutineType(types: !530)
!530 = !{!12, !12, !22, !12}
!531 = !DILocalVariable(name: "factor1", arg: 1, scope: !528, file: !61, line: 621, type: !12)
!532 = !DILocation(line: 621, column: 33, scope: !528)
!533 = !DILocalVariable(name: "factor2", arg: 2, scope: !528, file: !61, line: 621, type: !22)
!534 = !DILocation(line: 621, column: 46, scope: !528)
!535 = !DILocalVariable(name: "denominator", arg: 3, scope: !528, file: !61, line: 621, type: !12)
!536 = !DILocation(line: 621, column: 59, scope: !528)
!537 = !DILocalVariable(name: "s32Result", scope: !528, file: !61, line: 623, type: !69)
!538 = !DILocation(line: 623, column: 6, scope: !528)
!539 = !DILocalVariable(name: "s32Temp1", scope: !528, file: !61, line: 623, type: !69)
!540 = !DILocation(line: 623, column: 21, scope: !528)
!541 = !DILocation(line: 624, column: 14, scope: !528)
!542 = !DILocation(line: 624, column: 24, scope: !528)
!543 = !DILocation(line: 624, column: 22, scope: !528)
!544 = !DILocation(line: 624, column: 12, scope: !528)
!545 = !DILocation(line: 625, column: 5, scope: !546)
!546 = distinct !DILexicalBlock(scope: !528, file: !61, line: 625, column: 5)
!547 = !DILocation(line: 625, column: 17, scope: !546)
!548 = !DILocation(line: 625, column: 5, scope: !528)
!549 = !DILocation(line: 627, column: 6, scope: !550)
!550 = distinct !DILexicalBlock(scope: !551, file: !61, line: 627, column: 6)
!551 = distinct !DILexicalBlock(scope: !546, file: !61, line: 626, column: 2)
!552 = !DILocation(line: 627, column: 16, scope: !550)
!553 = !DILocation(line: 627, column: 6, scope: !551)
!554 = !DILocation(line: 629, column: 4, scope: !555)
!555 = distinct !DILexicalBlock(scope: !550, file: !61, line: 628, column: 3)
!556 = !DILocation(line: 633, column: 4, scope: !557)
!557 = distinct !DILexicalBlock(scope: !550, file: !61, line: 632, column: 3)
!558 = !DILocation(line: 638, column: 14, scope: !559)
!559 = distinct !DILexicalBlock(scope: !546, file: !61, line: 637, column: 2)
!560 = !DILocation(line: 638, column: 27, scope: !559)
!561 = !DILocation(line: 638, column: 37, scope: !559)
!562 = !DILocation(line: 638, column: 36, scope: !559)
!563 = !DILocation(line: 638, column: 50, scope: !559)
!564 = !DILocation(line: 638, column: 49, scope: !559)
!565 = !DILocation(line: 638, column: 24, scope: !559)
!566 = !DILocation(line: 638, column: 12, scope: !559)
!567 = !DILocation(line: 639, column: 14, scope: !559)
!568 = !DILocation(line: 639, column: 23, scope: !559)
!569 = !DILocation(line: 639, column: 12, scope: !559)
!570 = !DILocation(line: 640, column: 16, scope: !559)
!571 = !DILocation(line: 640, column: 25, scope: !559)
!572 = !DILocation(line: 640, column: 24, scope: !559)
!573 = !DILocation(line: 640, column: 41, scope: !559)
!574 = !DILocation(line: 640, column: 51, scope: !559)
!575 = !DILocation(line: 640, column: 50, scope: !559)
!576 = !DILocation(line: 640, column: 38, scope: !559)
!577 = !DILocation(line: 640, column: 13, scope: !559)
!578 = !DILocation(line: 641, column: 6, scope: !579)
!579 = distinct !DILexicalBlock(scope: !559, file: !61, line: 641, column: 6)
!580 = !DILocation(line: 641, column: 16, scope: !579)
!581 = !DILocation(line: 641, column: 6, scope: !559)
!582 = !DILocation(line: 643, column: 7, scope: !583)
!583 = distinct !DILexicalBlock(scope: !584, file: !61, line: 643, column: 7)
!584 = distinct !DILexicalBlock(scope: !579, file: !61, line: 642, column: 3)
!585 = !DILocation(line: 643, column: 17, scope: !583)
!586 = !DILocation(line: 643, column: 7, scope: !584)
!587 = !DILocation(line: 645, column: 17, scope: !588)
!588 = distinct !DILexicalBlock(scope: !583, file: !61, line: 644, column: 4)
!589 = !DILocation(line: 645, column: 12, scope: !588)
!590 = !DILocation(line: 645, column: 5, scope: !588)
!591 = !DILocation(line: 650, column: 5, scope: !592)
!592 = distinct !DILexicalBlock(scope: !583, file: !61, line: 649, column: 4)
!593 = !DILocation(line: 655, column: 4, scope: !594)
!594 = distinct !DILexicalBlock(scope: !579, file: !61, line: 654, column: 3)
!595 = !DILocation(line: 659, column: 1, scope: !528)
!596 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !61, file: !61, line: 677, type: !597, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!597 = !DISubroutineType(types: !598)
!598 = !{!12, !22, !12, !22}
!599 = !DILocalVariable(name: "factor1", arg: 1, scope: !596, file: !61, line: 677, type: !22)
!600 = !DILocation(line: 677, column: 33, scope: !596)
!601 = !DILocalVariable(name: "factor2", arg: 2, scope: !596, file: !61, line: 677, type: !12)
!602 = !DILocation(line: 677, column: 46, scope: !596)
!603 = !DILocalVariable(name: "denominator", arg: 3, scope: !596, file: !61, line: 677, type: !22)
!604 = !DILocation(line: 677, column: 59, scope: !596)
!605 = !DILocalVariable(name: "s32Result", scope: !596, file: !61, line: 679, type: !69)
!606 = !DILocation(line: 679, column: 6, scope: !596)
!607 = !DILocalVariable(name: "s32Temp1", scope: !596, file: !61, line: 679, type: !69)
!608 = !DILocation(line: 679, column: 21, scope: !596)
!609 = !DILocation(line: 680, column: 14, scope: !596)
!610 = !DILocation(line: 680, column: 24, scope: !596)
!611 = !DILocation(line: 680, column: 22, scope: !596)
!612 = !DILocation(line: 680, column: 12, scope: !596)
!613 = !DILocation(line: 681, column: 5, scope: !614)
!614 = distinct !DILexicalBlock(scope: !596, file: !61, line: 681, column: 5)
!615 = !DILocation(line: 681, column: 16, scope: !614)
!616 = !DILocation(line: 681, column: 5, scope: !596)
!617 = !DILocation(line: 683, column: 6, scope: !618)
!618 = distinct !DILexicalBlock(scope: !619, file: !61, line: 683, column: 6)
!619 = distinct !DILexicalBlock(scope: !614, file: !61, line: 682, column: 2)
!620 = !DILocation(line: 683, column: 16, scope: !618)
!621 = !DILocation(line: 683, column: 6, scope: !619)
!622 = !DILocation(line: 685, column: 4, scope: !623)
!623 = distinct !DILexicalBlock(scope: !618, file: !61, line: 684, column: 3)
!624 = !DILocation(line: 689, column: 4, scope: !625)
!625 = distinct !DILexicalBlock(scope: !618, file: !61, line: 688, column: 3)
!626 = !DILocation(line: 694, column: 14, scope: !627)
!627 = distinct !DILexicalBlock(scope: !614, file: !61, line: 693, column: 2)
!628 = !DILocation(line: 694, column: 28, scope: !627)
!629 = !DILocation(line: 694, column: 38, scope: !627)
!630 = !DILocation(line: 694, column: 37, scope: !627)
!631 = !DILocation(line: 694, column: 53, scope: !627)
!632 = !DILocation(line: 694, column: 51, scope: !627)
!633 = !DILocation(line: 694, column: 24, scope: !627)
!634 = !DILocation(line: 694, column: 66, scope: !627)
!635 = !DILocation(line: 694, column: 12, scope: !627)
!636 = !DILocation(line: 695, column: 16, scope: !627)
!637 = !DILocation(line: 695, column: 25, scope: !627)
!638 = !DILocation(line: 695, column: 24, scope: !627)
!639 = !DILocation(line: 695, column: 41, scope: !627)
!640 = !DILocation(line: 695, column: 51, scope: !627)
!641 = !DILocation(line: 695, column: 50, scope: !627)
!642 = !DILocation(line: 695, column: 38, scope: !627)
!643 = !DILocation(line: 695, column: 13, scope: !627)
!644 = !DILocation(line: 696, column: 6, scope: !645)
!645 = distinct !DILexicalBlock(scope: !627, file: !61, line: 696, column: 6)
!646 = !DILocation(line: 696, column: 16, scope: !645)
!647 = !DILocation(line: 696, column: 6, scope: !627)
!648 = !DILocation(line: 698, column: 7, scope: !649)
!649 = distinct !DILexicalBlock(scope: !650, file: !61, line: 698, column: 7)
!650 = distinct !DILexicalBlock(scope: !645, file: !61, line: 697, column: 3)
!651 = !DILocation(line: 698, column: 17, scope: !649)
!652 = !DILocation(line: 698, column: 7, scope: !650)
!653 = !DILocation(line: 700, column: 17, scope: !654)
!654 = distinct !DILexicalBlock(scope: !649, file: !61, line: 699, column: 4)
!655 = !DILocation(line: 700, column: 12, scope: !654)
!656 = !DILocation(line: 700, column: 5, scope: !654)
!657 = !DILocation(line: 704, column: 5, scope: !658)
!658 = distinct !DILexicalBlock(scope: !649, file: !61, line: 703, column: 4)
!659 = !DILocation(line: 709, column: 4, scope: !660)
!660 = distinct !DILexicalBlock(scope: !645, file: !61, line: 708, column: 3)
!661 = !DILocation(line: 712, column: 1, scope: !596)
!662 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 731, type: !663, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!663 = !DISubroutineType(types: !664)
!664 = !{!22, !12, !22, !12}
!665 = !DILocalVariable(name: "factor1", arg: 1, scope: !662, file: !61, line: 731, type: !12)
!666 = !DILocation(line: 731, column: 33, scope: !662)
!667 = !DILocalVariable(name: "factor2", arg: 2, scope: !662, file: !61, line: 731, type: !22)
!668 = !DILocation(line: 731, column: 46, scope: !662)
!669 = !DILocalVariable(name: "denominator", arg: 3, scope: !662, file: !61, line: 731, type: !12)
!670 = !DILocation(line: 731, column: 59, scope: !662)
!671 = !DILocalVariable(name: "u32Result", scope: !662, file: !61, line: 733, type: !340)
!672 = !DILocation(line: 733, column: 6, scope: !662)
!673 = !DILocalVariable(name: "u32Temp1", scope: !662, file: !61, line: 733, type: !340)
!674 = !DILocation(line: 733, column: 21, scope: !662)
!675 = !DILocalVariable(name: "s32Result", scope: !662, file: !61, line: 734, type: !69)
!676 = !DILocation(line: 734, column: 6, scope: !662)
!677 = !DILocalVariable(name: "s32Temp1", scope: !662, file: !61, line: 734, type: !69)
!678 = !DILocation(line: 734, column: 21, scope: !662)
!679 = !DILocation(line: 735, column: 14, scope: !662)
!680 = !DILocation(line: 735, column: 24, scope: !662)
!681 = !DILocation(line: 735, column: 22, scope: !662)
!682 = !DILocation(line: 735, column: 12, scope: !662)
!683 = !DILocation(line: 737, column: 5, scope: !684)
!684 = distinct !DILexicalBlock(scope: !662, file: !61, line: 737, column: 5)
!685 = !DILocation(line: 737, column: 17, scope: !684)
!686 = !DILocation(line: 737, column: 5, scope: !662)
!687 = !DILocation(line: 739, column: 6, scope: !688)
!688 = distinct !DILexicalBlock(scope: !689, file: !61, line: 739, column: 6)
!689 = distinct !DILexicalBlock(scope: !684, file: !61, line: 738, column: 2)
!690 = !DILocation(line: 739, column: 16, scope: !688)
!691 = !DILocation(line: 739, column: 6, scope: !689)
!692 = !DILocation(line: 741, column: 4, scope: !693)
!693 = distinct !DILexicalBlock(scope: !688, file: !61, line: 740, column: 3)
!694 = !DILocation(line: 745, column: 4, scope: !695)
!695 = distinct !DILexicalBlock(scope: !688, file: !61, line: 744, column: 3)
!696 = !DILocation(line: 750, column: 15, scope: !697)
!697 = distinct !DILexicalBlock(scope: !684, file: !61, line: 749, column: 2)
!698 = !DILocation(line: 750, column: 29, scope: !697)
!699 = !DILocation(line: 750, column: 39, scope: !697)
!700 = !DILocation(line: 750, column: 38, scope: !697)
!701 = !DILocation(line: 750, column: 54, scope: !697)
!702 = !DILocation(line: 750, column: 52, scope: !697)
!703 = !DILocation(line: 750, column: 25, scope: !697)
!704 = !DILocation(line: 750, column: 68, scope: !697)
!705 = !DILocation(line: 750, column: 12, scope: !697)
!706 = !DILocation(line: 751, column: 16, scope: !697)
!707 = !DILocation(line: 751, column: 25, scope: !697)
!708 = !DILocation(line: 751, column: 24, scope: !697)
!709 = !DILocation(line: 751, column: 41, scope: !697)
!710 = !DILocation(line: 751, column: 51, scope: !697)
!711 = !DILocation(line: 751, column: 50, scope: !697)
!712 = !DILocation(line: 751, column: 38, scope: !697)
!713 = !DILocation(line: 751, column: 13, scope: !697)
!714 = !DILocation(line: 752, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !697, file: !61, line: 752, column: 6)
!716 = !DILocation(line: 752, column: 16, scope: !715)
!717 = !DILocation(line: 752, column: 6, scope: !697)
!718 = !DILocation(line: 754, column: 7, scope: !719)
!719 = distinct !DILexicalBlock(scope: !720, file: !61, line: 754, column: 7)
!720 = distinct !DILexicalBlock(scope: !715, file: !61, line: 753, column: 3)
!721 = !DILocation(line: 754, column: 17, scope: !719)
!722 = !DILocation(line: 754, column: 7, scope: !720)
!723 = !DILocation(line: 756, column: 17, scope: !724)
!724 = distinct !DILexicalBlock(scope: !719, file: !61, line: 755, column: 4)
!725 = !DILocation(line: 756, column: 12, scope: !724)
!726 = !DILocation(line: 756, column: 5, scope: !724)
!727 = !DILocation(line: 760, column: 5, scope: !728)
!728 = distinct !DILexicalBlock(scope: !719, file: !61, line: 759, column: 4)
!729 = !DILocation(line: 765, column: 4, scope: !730)
!730 = distinct !DILexicalBlock(scope: !715, file: !61, line: 764, column: 3)
!731 = !DILocation(line: 768, column: 1, scope: !662)
!732 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !61, file: !61, line: 787, type: !733, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!733 = !DISubroutineType(types: !734)
!734 = !{!22, !12, !22, !22}
!735 = !DILocalVariable(name: "factor1", arg: 1, scope: !732, file: !61, line: 787, type: !12)
!736 = !DILocation(line: 787, column: 33, scope: !732)
!737 = !DILocalVariable(name: "factor2", arg: 2, scope: !732, file: !61, line: 787, type: !22)
!738 = !DILocation(line: 787, column: 46, scope: !732)
!739 = !DILocalVariable(name: "denominator", arg: 3, scope: !732, file: !61, line: 787, type: !22)
!740 = !DILocation(line: 787, column: 59, scope: !732)
!741 = !DILocalVariable(name: "s32Result", scope: !732, file: !61, line: 789, type: !69)
!742 = !DILocation(line: 789, column: 6, scope: !732)
!743 = !DILocalVariable(name: "s32Temp1", scope: !732, file: !61, line: 789, type: !69)
!744 = !DILocation(line: 789, column: 21, scope: !732)
!745 = !DILocation(line: 790, column: 14, scope: !732)
!746 = !DILocation(line: 790, column: 24, scope: !732)
!747 = !DILocation(line: 790, column: 22, scope: !732)
!748 = !DILocation(line: 790, column: 12, scope: !732)
!749 = !DILocation(line: 792, column: 5, scope: !750)
!750 = distinct !DILexicalBlock(scope: !732, file: !61, line: 792, column: 5)
!751 = !DILocation(line: 792, column: 17, scope: !750)
!752 = !DILocation(line: 792, column: 5, scope: !732)
!753 = !DILocation(line: 794, column: 6, scope: !754)
!754 = distinct !DILexicalBlock(scope: !755, file: !61, line: 794, column: 6)
!755 = distinct !DILexicalBlock(scope: !750, file: !61, line: 793, column: 2)
!756 = !DILocation(line: 794, column: 16, scope: !754)
!757 = !DILocation(line: 794, column: 6, scope: !755)
!758 = !DILocation(line: 796, column: 4, scope: !759)
!759 = distinct !DILexicalBlock(scope: !754, file: !61, line: 795, column: 3)
!760 = !DILocation(line: 800, column: 4, scope: !761)
!761 = distinct !DILexicalBlock(scope: !754, file: !61, line: 799, column: 3)
!762 = !DILocation(line: 805, column: 15, scope: !763)
!763 = distinct !DILexicalBlock(scope: !750, file: !61, line: 804, column: 2)
!764 = !DILocation(line: 805, column: 29, scope: !763)
!765 = !DILocation(line: 805, column: 39, scope: !763)
!766 = !DILocation(line: 805, column: 38, scope: !763)
!767 = !DILocation(line: 805, column: 54, scope: !763)
!768 = !DILocation(line: 805, column: 52, scope: !763)
!769 = !DILocation(line: 805, column: 25, scope: !763)
!770 = !DILocation(line: 805, column: 68, scope: !763)
!771 = !DILocation(line: 805, column: 12, scope: !763)
!772 = !DILocation(line: 806, column: 16, scope: !763)
!773 = !DILocation(line: 806, column: 25, scope: !763)
!774 = !DILocation(line: 806, column: 24, scope: !763)
!775 = !DILocation(line: 806, column: 41, scope: !763)
!776 = !DILocation(line: 806, column: 51, scope: !763)
!777 = !DILocation(line: 806, column: 50, scope: !763)
!778 = !DILocation(line: 806, column: 38, scope: !763)
!779 = !DILocation(line: 806, column: 13, scope: !763)
!780 = !DILocation(line: 807, column: 6, scope: !781)
!781 = distinct !DILexicalBlock(scope: !763, file: !61, line: 807, column: 6)
!782 = !DILocation(line: 807, column: 16, scope: !781)
!783 = !DILocation(line: 807, column: 6, scope: !763)
!784 = !DILocation(line: 809, column: 7, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !61, line: 809, column: 7)
!786 = distinct !DILexicalBlock(scope: !781, file: !61, line: 808, column: 3)
!787 = !DILocation(line: 809, column: 17, scope: !785)
!788 = !DILocation(line: 809, column: 7, scope: !786)
!789 = !DILocation(line: 811, column: 17, scope: !790)
!790 = distinct !DILexicalBlock(scope: !785, file: !61, line: 810, column: 4)
!791 = !DILocation(line: 811, column: 12, scope: !790)
!792 = !DILocation(line: 811, column: 5, scope: !790)
!793 = !DILocation(line: 815, column: 5, scope: !794)
!794 = distinct !DILexicalBlock(scope: !785, file: !61, line: 814, column: 4)
!795 = !DILocation(line: 820, column: 4, scope: !796)
!796 = distinct !DILexicalBlock(scope: !781, file: !61, line: 819, column: 3)
!797 = !DILocation(line: 824, column: 1, scope: !732)
!798 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !61, file: !61, line: 842, type: !799, scopeLine: 843, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!799 = !DISubroutineType(types: !800)
!800 = !{!22, !22, !22, !22}
!801 = !DILocalVariable(name: "factor1", arg: 1, scope: !798, file: !61, line: 842, type: !22)
!802 = !DILocation(line: 842, column: 33, scope: !798)
!803 = !DILocalVariable(name: "factor2", arg: 2, scope: !798, file: !61, line: 842, type: !22)
!804 = !DILocation(line: 842, column: 46, scope: !798)
!805 = !DILocalVariable(name: "denominator", arg: 3, scope: !798, file: !61, line: 842, type: !22)
!806 = !DILocation(line: 842, column: 59, scope: !798)
!807 = !DILocalVariable(name: "u32Temp1", scope: !798, file: !61, line: 844, type: !340)
!808 = !DILocation(line: 844, column: 6, scope: !798)
!809 = !DILocalVariable(name: "u16TempDenom", scope: !798, file: !61, line: 845, type: !22)
!810 = !DILocation(line: 845, column: 6, scope: !798)
!811 = !DILocation(line: 847, column: 5, scope: !812)
!812 = distinct !DILexicalBlock(scope: !798, file: !61, line: 847, column: 5)
!813 = !DILocation(line: 847, column: 17, scope: !812)
!814 = !DILocation(line: 847, column: 5, scope: !798)
!815 = !DILocation(line: 849, column: 3, scope: !816)
!816 = distinct !DILexicalBlock(scope: !812, file: !61, line: 848, column: 2)
!817 = !DILocation(line: 853, column: 14, scope: !818)
!818 = distinct !DILexicalBlock(scope: !812, file: !61, line: 852, column: 2)
!819 = !DILocation(line: 853, column: 24, scope: !818)
!820 = !DILocation(line: 853, column: 22, scope: !818)
!821 = !DILocation(line: 853, column: 12, scope: !818)
!822 = !DILocation(line: 854, column: 18, scope: !818)
!823 = !DILocation(line: 854, column: 30, scope: !818)
!824 = !DILocation(line: 854, column: 16, scope: !818)
!825 = !DILocation(line: 855, column: 14, scope: !818)
!826 = !DILocation(line: 855, column: 25, scope: !818)
!827 = !DILocation(line: 855, column: 23, scope: !818)
!828 = !DILocation(line: 855, column: 12, scope: !818)
!829 = !DILocation(line: 856, column: 14, scope: !818)
!830 = !DILocation(line: 856, column: 25, scope: !818)
!831 = !DILocation(line: 856, column: 23, scope: !818)
!832 = !DILocation(line: 856, column: 12, scope: !818)
!833 = !DILocation(line: 857, column: 6, scope: !834)
!834 = distinct !DILexicalBlock(scope: !818, file: !61, line: 857, column: 6)
!835 = !DILocation(line: 857, column: 15, scope: !834)
!836 = !DILocation(line: 857, column: 6, scope: !818)
!837 = !DILocation(line: 859, column: 12, scope: !838)
!838 = distinct !DILexicalBlock(scope: !834, file: !61, line: 858, column: 3)
!839 = !DILocation(line: 859, column: 21, scope: !838)
!840 = !DILocation(line: 859, column: 11, scope: !838)
!841 = !DILocation(line: 859, column: 4, scope: !838)
!842 = !DILocation(line: 864, column: 4, scope: !843)
!843 = distinct !DILexicalBlock(scope: !834, file: !61, line: 863, column: 3)
!844 = !DILocation(line: 869, column: 1, scope: !798)
!845 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !61, file: !61, line: 886, type: !846, scopeLine: 887, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!846 = !DISubroutineType(types: !847)
!847 = !{!22, !22, !22, !340}
!848 = !DILocalVariable(name: "factor1", arg: 1, scope: !845, file: !61, line: 886, type: !22)
!849 = !DILocation(line: 886, column: 33, scope: !845)
!850 = !DILocalVariable(name: "factor2", arg: 2, scope: !845, file: !61, line: 886, type: !22)
!851 = !DILocation(line: 886, column: 46, scope: !845)
!852 = !DILocalVariable(name: "denominator", arg: 3, scope: !845, file: !61, line: 886, type: !340)
!853 = !DILocation(line: 886, column: 59, scope: !845)
!854 = !DILocalVariable(name: "u32Temp1", scope: !845, file: !61, line: 888, type: !340)
!855 = !DILocation(line: 888, column: 6, scope: !845)
!856 = !DILocation(line: 889, column: 5, scope: !857)
!857 = distinct !DILexicalBlock(scope: !845, file: !61, line: 889, column: 5)
!858 = !DILocation(line: 889, column: 17, scope: !857)
!859 = !DILocation(line: 889, column: 5, scope: !845)
!860 = !DILocation(line: 891, column: 3, scope: !861)
!861 = distinct !DILexicalBlock(scope: !857, file: !61, line: 890, column: 2)
!862 = !DILocation(line: 895, column: 15, scope: !863)
!863 = distinct !DILexicalBlock(scope: !857, file: !61, line: 894, column: 2)
!864 = !DILocation(line: 895, column: 25, scope: !863)
!865 = !DILocation(line: 895, column: 23, scope: !863)
!866 = !DILocation(line: 895, column: 36, scope: !863)
!867 = !DILocation(line: 895, column: 34, scope: !863)
!868 = !DILocation(line: 895, column: 12, scope: !863)
!869 = !DILocation(line: 896, column: 8, scope: !870)
!870 = distinct !DILexicalBlock(scope: !863, file: !61, line: 896, column: 6)
!871 = !DILocation(line: 896, column: 18, scope: !870)
!872 = !DILocation(line: 896, column: 16, scope: !870)
!873 = !DILocation(line: 896, column: 28, scope: !870)
!874 = !DILocation(line: 896, column: 40, scope: !870)
!875 = !DILocation(line: 896, column: 39, scope: !870)
!876 = !DILocation(line: 896, column: 26, scope: !870)
!877 = !DILocation(line: 896, column: 53, scope: !870)
!878 = !DILocation(line: 896, column: 64, scope: !870)
!879 = !DILocation(line: 896, column: 50, scope: !870)
!880 = !DILocation(line: 896, column: 6, scope: !863)
!881 = !DILocation(line: 898, column: 12, scope: !882)
!882 = distinct !DILexicalBlock(scope: !870, file: !61, line: 897, column: 3)
!883 = !DILocation(line: 899, column: 3, scope: !882)
!884 = !DILocation(line: 900, column: 6, scope: !885)
!885 = distinct !DILexicalBlock(scope: !863, file: !61, line: 900, column: 6)
!886 = !DILocation(line: 900, column: 15, scope: !885)
!887 = !DILocation(line: 900, column: 6, scope: !863)
!888 = !DILocation(line: 902, column: 12, scope: !889)
!889 = distinct !DILexicalBlock(scope: !885, file: !61, line: 901, column: 3)
!890 = !DILocation(line: 902, column: 21, scope: !889)
!891 = !DILocation(line: 902, column: 11, scope: !889)
!892 = !DILocation(line: 902, column: 4, scope: !889)
!893 = !DILocation(line: 906, column: 4, scope: !894)
!894 = distinct !DILexicalBlock(scope: !885, file: !61, line: 905, column: 3)
!895 = !DILocation(line: 909, column: 1, scope: !845)
!896 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !61, file: !61, line: 926, type: !897, scopeLine: 927, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!897 = !DISubroutineType(types: !898)
!898 = !{!340, !340, !22}
!899 = !DILocalVariable(name: "x_value", arg: 1, scope: !896, file: !61, line: 926, type: !340)
!900 = !DILocation(line: 926, column: 25, scope: !896)
!901 = !DILocalVariable(name: "y_value", arg: 2, scope: !896, file: !61, line: 926, type: !22)
!902 = !DILocation(line: 926, column: 38, scope: !896)
!903 = !DILocalVariable(name: "u32Temp1", scope: !896, file: !61, line: 928, type: !340)
!904 = !DILocation(line: 928, column: 6, scope: !896)
!905 = !DILocation(line: 929, column: 5, scope: !906)
!906 = distinct !DILexicalBlock(scope: !896, file: !61, line: 929, column: 5)
!907 = !DILocation(line: 929, column: 13, scope: !906)
!908 = !DILocation(line: 929, column: 5, scope: !896)
!909 = !DILocation(line: 931, column: 3, scope: !910)
!910 = distinct !DILexicalBlock(scope: !906, file: !61, line: 930, column: 2)
!911 = !DILocation(line: 935, column: 15, scope: !912)
!912 = distinct !DILexicalBlock(scope: !906, file: !61, line: 934, column: 2)
!913 = !DILocation(line: 935, column: 26, scope: !912)
!914 = !DILocation(line: 935, column: 34, scope: !912)
!915 = !DILocation(line: 935, column: 33, scope: !912)
!916 = !DILocation(line: 935, column: 45, scope: !912)
!917 = !DILocation(line: 935, column: 43, scope: !912)
!918 = !DILocation(line: 935, column: 23, scope: !912)
!919 = !DILocation(line: 935, column: 54, scope: !912)
!920 = !DILocation(line: 935, column: 12, scope: !912)
!921 = !DILocation(line: 936, column: 15, scope: !912)
!922 = !DILocation(line: 936, column: 23, scope: !912)
!923 = !DILocation(line: 936, column: 22, scope: !912)
!924 = !DILocation(line: 936, column: 35, scope: !912)
!925 = !DILocation(line: 936, column: 44, scope: !912)
!926 = !DILocation(line: 936, column: 43, scope: !912)
!927 = !DILocation(line: 936, column: 32, scope: !912)
!928 = !DILocation(line: 936, column: 12, scope: !912)
!929 = !DILocation(line: 937, column: 10, scope: !912)
!930 = !DILocation(line: 937, column: 3, scope: !912)
!931 = !DILocation(line: 939, column: 1, scope: !896)
!932 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !61, file: !61, line: 957, type: !933, scopeLine: 958, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!933 = !DISubroutineType(types: !934)
!934 = !{!12, !12, !12, !12}
!935 = !DILocalVariable(name: "fak1", arg: 1, scope: !932, file: !61, line: 957, type: !12)
!936 = !DILocation(line: 957, column: 33, scope: !932)
!937 = !DILocalVariable(name: "fak2", arg: 2, scope: !932, file: !61, line: 957, type: !12)
!938 = !DILocation(line: 957, column: 43, scope: !932)
!939 = !DILocalVariable(name: "div", arg: 3, scope: !932, file: !61, line: 957, type: !12)
!940 = !DILocation(line: 957, column: 53, scope: !932)
!941 = !DILocalVariable(name: "s32Temp1", scope: !932, file: !61, line: 959, type: !69)
!942 = !DILocation(line: 959, column: 6, scope: !932)
!943 = !DILocalVariable(name: "s32Temp2", scope: !932, file: !61, line: 959, type: !69)
!944 = !DILocation(line: 959, column: 20, scope: !932)
!945 = !DILocalVariable(name: "s32Temp3", scope: !932, file: !61, line: 959, type: !69)
!946 = !DILocation(line: 959, column: 34, scope: !932)
!947 = !DILocation(line: 960, column: 13, scope: !932)
!948 = !DILocation(line: 960, column: 20, scope: !932)
!949 = !DILocation(line: 960, column: 18, scope: !932)
!950 = !DILocation(line: 960, column: 11, scope: !932)
!951 = !DILocation(line: 961, column: 5, scope: !952)
!952 = distinct !DILexicalBlock(scope: !932, file: !61, line: 961, column: 5)
!953 = !DILocation(line: 961, column: 9, scope: !952)
!954 = !DILocation(line: 961, column: 5, scope: !932)
!955 = !DILocation(line: 963, column: 6, scope: !956)
!956 = distinct !DILexicalBlock(scope: !957, file: !61, line: 963, column: 6)
!957 = distinct !DILexicalBlock(scope: !952, file: !61, line: 962, column: 2)
!958 = !DILocation(line: 963, column: 15, scope: !956)
!959 = !DILocation(line: 963, column: 6, scope: !957)
!960 = !DILocation(line: 965, column: 4, scope: !961)
!961 = distinct !DILexicalBlock(scope: !956, file: !61, line: 964, column: 3)
!962 = !DILocation(line: 969, column: 4, scope: !963)
!963 = distinct !DILexicalBlock(scope: !956, file: !61, line: 968, column: 3)
!964 = !DILocation(line: 974, column: 15, scope: !965)
!965 = distinct !DILexicalBlock(scope: !952, file: !61, line: 973, column: 2)
!966 = !DILocation(line: 974, column: 28, scope: !965)
!967 = !DILocation(line: 974, column: 39, scope: !965)
!968 = !DILocation(line: 974, column: 37, scope: !965)
!969 = !DILocation(line: 974, column: 46, scope: !965)
!970 = !DILocation(line: 974, column: 44, scope: !965)
!971 = !DILocation(line: 974, column: 24, scope: !965)
!972 = !DILocation(line: 974, column: 52, scope: !965)
!973 = !DILocation(line: 974, column: 12, scope: !965)
!974 = !DILocation(line: 975, column: 15, scope: !965)
!975 = !DILocation(line: 975, column: 24, scope: !965)
!976 = !DILocation(line: 975, column: 23, scope: !965)
!977 = !DILocation(line: 975, column: 32, scope: !965)
!978 = !DILocation(line: 975, column: 41, scope: !965)
!979 = !DILocation(line: 975, column: 40, scope: !965)
!980 = !DILocation(line: 975, column: 29, scope: !965)
!981 = !DILocation(line: 975, column: 12, scope: !965)
!982 = !DILocation(line: 976, column: 6, scope: !983)
!983 = distinct !DILexicalBlock(scope: !965, file: !61, line: 976, column: 6)
!984 = !DILocation(line: 976, column: 15, scope: !983)
!985 = !DILocation(line: 976, column: 6, scope: !965)
!986 = !DILocation(line: 978, column: 7, scope: !987)
!987 = distinct !DILexicalBlock(scope: !988, file: !61, line: 978, column: 7)
!988 = distinct !DILexicalBlock(scope: !983, file: !61, line: 977, column: 3)
!989 = !DILocation(line: 978, column: 16, scope: !987)
!990 = !DILocation(line: 978, column: 7, scope: !988)
!991 = !DILocation(line: 980, column: 17, scope: !992)
!992 = distinct !DILexicalBlock(scope: !987, file: !61, line: 979, column: 4)
!993 = !DILocation(line: 980, column: 12, scope: !992)
!994 = !DILocation(line: 980, column: 5, scope: !992)
!995 = !DILocation(line: 984, column: 5, scope: !996)
!996 = distinct !DILexicalBlock(scope: !987, file: !61, line: 983, column: 4)
!997 = !DILocation(line: 989, column: 4, scope: !998)
!998 = distinct !DILexicalBlock(scope: !983, file: !61, line: 988, column: 3)
!999 = !DILocation(line: 992, column: 1, scope: !932)
!1000 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !61, file: !61, line: 1010, type: !1001, scopeLine: 1011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!12, !12, !12, !22}
!1003 = !DILocalVariable(name: "data1", arg: 1, scope: !1000, file: !61, line: 1010, type: !12)
!1004 = !DILocation(line: 1010, column: 33, scope: !1000)
!1005 = !DILocalVariable(name: "data2", arg: 2, scope: !1000, file: !61, line: 1010, type: !12)
!1006 = !DILocation(line: 1010, column: 43, scope: !1000)
!1007 = !DILocalVariable(name: "denominator", arg: 3, scope: !1000, file: !61, line: 1010, type: !22)
!1008 = !DILocation(line: 1010, column: 53, scope: !1000)
!1009 = !DILocalVariable(name: "s32Result", scope: !1000, file: !61, line: 1012, type: !69)
!1010 = !DILocation(line: 1012, column: 6, scope: !1000)
!1011 = !DILocalVariable(name: "s32Temp1", scope: !1000, file: !61, line: 1012, type: !69)
!1012 = !DILocation(line: 1012, column: 21, scope: !1000)
!1013 = !DILocation(line: 1013, column: 14, scope: !1000)
!1014 = !DILocation(line: 1013, column: 22, scope: !1000)
!1015 = !DILocation(line: 1013, column: 20, scope: !1000)
!1016 = !DILocation(line: 1013, column: 12, scope: !1000)
!1017 = !DILocation(line: 1015, column: 5, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1000, file: !61, line: 1015, column: 5)
!1019 = !DILocation(line: 1015, column: 17, scope: !1018)
!1020 = !DILocation(line: 1015, column: 5, scope: !1000)
!1021 = !DILocation(line: 1017, column: 6, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1023, file: !61, line: 1017, column: 6)
!1023 = distinct !DILexicalBlock(scope: !1018, file: !61, line: 1016, column: 2)
!1024 = !DILocation(line: 1017, column: 16, scope: !1022)
!1025 = !DILocation(line: 1017, column: 6, scope: !1023)
!1026 = !DILocation(line: 1019, column: 4, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1022, file: !61, line: 1018, column: 3)
!1028 = !DILocation(line: 1021, column: 11, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1022, file: !61, line: 1021, column: 11)
!1030 = !DILocation(line: 1021, column: 21, scope: !1029)
!1031 = !DILocation(line: 1021, column: 11, scope: !1022)
!1032 = !DILocation(line: 1023, column: 4, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1029, file: !61, line: 1022, column: 3)
!1034 = !DILocation(line: 1027, column: 4, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1029, file: !61, line: 1026, column: 3)
!1036 = !DILocation(line: 1032, column: 15, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1018, file: !61, line: 1031, column: 2)
!1038 = !DILocation(line: 1032, column: 28, scope: !1037)
!1039 = !DILocation(line: 1032, column: 38, scope: !1037)
!1040 = !DILocation(line: 1032, column: 37, scope: !1037)
!1041 = !DILocation(line: 1032, column: 51, scope: !1037)
!1042 = !DILocation(line: 1032, column: 50, scope: !1037)
!1043 = !DILocation(line: 1032, column: 25, scope: !1037)
!1044 = !DILocation(line: 1032, column: 64, scope: !1037)
!1045 = !DILocation(line: 1032, column: 12, scope: !1037)
!1046 = !DILocation(line: 1033, column: 16, scope: !1037)
!1047 = !DILocation(line: 1033, column: 25, scope: !1037)
!1048 = !DILocation(line: 1033, column: 24, scope: !1037)
!1049 = !DILocation(line: 1033, column: 41, scope: !1037)
!1050 = !DILocation(line: 1033, column: 51, scope: !1037)
!1051 = !DILocation(line: 1033, column: 50, scope: !1037)
!1052 = !DILocation(line: 1033, column: 38, scope: !1037)
!1053 = !DILocation(line: 1033, column: 13, scope: !1037)
!1054 = !DILocation(line: 1034, column: 6, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1037, file: !61, line: 1034, column: 6)
!1056 = !DILocation(line: 1034, column: 16, scope: !1055)
!1057 = !DILocation(line: 1034, column: 6, scope: !1037)
!1058 = !DILocation(line: 1036, column: 7, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1060, file: !61, line: 1036, column: 7)
!1060 = distinct !DILexicalBlock(scope: !1055, file: !61, line: 1035, column: 3)
!1061 = !DILocation(line: 1036, column: 17, scope: !1059)
!1062 = !DILocation(line: 1036, column: 7, scope: !1060)
!1063 = !DILocation(line: 1038, column: 17, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1059, file: !61, line: 1037, column: 4)
!1065 = !DILocation(line: 1038, column: 12, scope: !1064)
!1066 = !DILocation(line: 1038, column: 5, scope: !1064)
!1067 = !DILocation(line: 1042, column: 5, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1059, file: !61, line: 1041, column: 4)
!1069 = !DILocation(line: 1047, column: 4, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1055, file: !61, line: 1046, column: 3)
!1071 = !DILocation(line: 1051, column: 1, scope: !1000)
!1072 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !61, file: !61, line: 1068, type: !1073, scopeLine: 1069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!340, !340, !69}
!1075 = !DILocalVariable(name: "numerator", arg: 1, scope: !1072, file: !61, line: 1068, type: !340)
!1076 = !DILocation(line: 1068, column: 25, scope: !1072)
!1077 = !DILocalVariable(name: "denominator", arg: 2, scope: !1072, file: !61, line: 1068, type: !69)
!1078 = !DILocation(line: 1068, column: 40, scope: !1072)
!1079 = !DILocalVariable(name: "u32Temp1", scope: !1072, file: !61, line: 1070, type: !340)
!1080 = !DILocation(line: 1070, column: 6, scope: !1072)
!1081 = !DILocation(line: 1071, column: 5, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1072, file: !61, line: 1071, column: 5)
!1083 = !DILocation(line: 1071, column: 17, scope: !1082)
!1084 = !DILocation(line: 1071, column: 5, scope: !1072)
!1085 = !DILocation(line: 1073, column: 3, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1082, file: !61, line: 1072, column: 2)
!1087 = !DILocation(line: 1077, column: 6, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1089, file: !61, line: 1077, column: 6)
!1089 = distinct !DILexicalBlock(scope: !1082, file: !61, line: 1076, column: 2)
!1090 = !DILocation(line: 1077, column: 18, scope: !1088)
!1091 = !DILocation(line: 1077, column: 6, scope: !1089)
!1092 = !DILocation(line: 1079, column: 4, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1088, file: !61, line: 1078, column: 3)
!1094 = !DILocation(line: 1083, column: 16, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1088, file: !61, line: 1082, column: 3)
!1096 = !DILocation(line: 1083, column: 30, scope: !1095)
!1097 = !DILocation(line: 1083, column: 40, scope: !1095)
!1098 = !DILocation(line: 1083, column: 39, scope: !1095)
!1099 = !DILocation(line: 1083, column: 55, scope: !1095)
!1100 = !DILocation(line: 1083, column: 53, scope: !1095)
!1101 = !DILocation(line: 1083, column: 26, scope: !1095)
!1102 = !DILocation(line: 1083, column: 68, scope: !1095)
!1103 = !DILocation(line: 1083, column: 13, scope: !1095)
!1104 = !DILocation(line: 1084, column: 16, scope: !1095)
!1105 = !DILocation(line: 1084, column: 25, scope: !1095)
!1106 = !DILocation(line: 1084, column: 24, scope: !1095)
!1107 = !DILocation(line: 1084, column: 41, scope: !1095)
!1108 = !DILocation(line: 1084, column: 51, scope: !1095)
!1109 = !DILocation(line: 1084, column: 50, scope: !1095)
!1110 = !DILocation(line: 1084, column: 38, scope: !1095)
!1111 = !DILocation(line: 1084, column: 13, scope: !1095)
!1112 = !DILocation(line: 1085, column: 11, scope: !1095)
!1113 = !DILocation(line: 1085, column: 4, scope: !1095)
!1114 = !DILocation(line: 1088, column: 1, scope: !1072)
!1115 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !61, file: !61, line: 1105, type: !1116, scopeLine: 1106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!340, !69, !340}
!1118 = !DILocalVariable(name: "numerator", arg: 1, scope: !1115, file: !61, line: 1105, type: !69)
!1119 = !DILocation(line: 1105, column: 25, scope: !1115)
!1120 = !DILocalVariable(name: "denominator", arg: 2, scope: !1115, file: !61, line: 1105, type: !340)
!1121 = !DILocation(line: 1105, column: 40, scope: !1115)
!1122 = !DILocalVariable(name: "s32Temp1", scope: !1115, file: !61, line: 1107, type: !69)
!1123 = !DILocation(line: 1107, column: 6, scope: !1115)
!1124 = !DILocation(line: 1108, column: 5, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1115, file: !61, line: 1108, column: 5)
!1126 = !DILocation(line: 1108, column: 17, scope: !1125)
!1127 = !DILocation(line: 1108, column: 5, scope: !1115)
!1128 = !DILocation(line: 1110, column: 6, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1130, file: !61, line: 1110, column: 6)
!1130 = distinct !DILexicalBlock(scope: !1125, file: !61, line: 1109, column: 2)
!1131 = !DILocation(line: 1110, column: 16, scope: !1129)
!1132 = !DILocation(line: 1110, column: 6, scope: !1130)
!1133 = !DILocation(line: 1112, column: 4, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1129, file: !61, line: 1111, column: 3)
!1135 = !DILocation(line: 1116, column: 4, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1129, file: !61, line: 1115, column: 3)
!1137 = !DILocation(line: 1121, column: 6, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1139, file: !61, line: 1121, column: 6)
!1139 = distinct !DILexicalBlock(scope: !1125, file: !61, line: 1120, column: 2)
!1140 = !DILocation(line: 1121, column: 16, scope: !1138)
!1141 = !DILocation(line: 1121, column: 6, scope: !1139)
!1142 = !DILocation(line: 1123, column: 17, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !61, line: 1122, column: 3)
!1144 = !DILocation(line: 1123, column: 31, scope: !1143)
!1145 = !DILocation(line: 1123, column: 41, scope: !1143)
!1146 = !DILocation(line: 1123, column: 40, scope: !1143)
!1147 = !DILocation(line: 1123, column: 56, scope: !1143)
!1148 = !DILocation(line: 1123, column: 54, scope: !1143)
!1149 = !DILocation(line: 1123, column: 27, scope: !1143)
!1150 = !DILocation(line: 1123, column: 69, scope: !1143)
!1151 = !DILocation(line: 1123, column: 13, scope: !1143)
!1152 = !DILocation(line: 1124, column: 13, scope: !1143)
!1153 = !DILocation(line: 1124, column: 23, scope: !1143)
!1154 = !DILocation(line: 1124, column: 22, scope: !1143)
!1155 = !DILocation(line: 1124, column: 39, scope: !1143)
!1156 = !DILocation(line: 1124, column: 48, scope: !1143)
!1157 = !DILocation(line: 1124, column: 47, scope: !1143)
!1158 = !DILocation(line: 1124, column: 36, scope: !1143)
!1159 = !DILocation(line: 1124, column: 4, scope: !1143)
!1160 = !DILocation(line: 1128, column: 4, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1138, file: !61, line: 1127, column: 3)
!1162 = !DILocation(line: 1131, column: 1, scope: !1115)
!1163 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !61, file: !61, line: 1148, type: !1164, scopeLine: 1149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!340, !69, !69}
!1166 = !DILocalVariable(name: "numerator", arg: 1, scope: !1163, file: !61, line: 1148, type: !69)
!1167 = !DILocation(line: 1148, column: 25, scope: !1163)
!1168 = !DILocalVariable(name: "denominator", arg: 2, scope: !1163, file: !61, line: 1148, type: !69)
!1169 = !DILocation(line: 1148, column: 40, scope: !1163)
!1170 = !DILocalVariable(name: "u32Temp1", scope: !1163, file: !61, line: 1150, type: !340)
!1171 = !DILocation(line: 1150, column: 6, scope: !1163)
!1172 = !DILocalVariable(name: "u32Temp2", scope: !1163, file: !61, line: 1150, type: !340)
!1173 = !DILocation(line: 1150, column: 20, scope: !1163)
!1174 = !DILocation(line: 1151, column: 5, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1163, file: !61, line: 1151, column: 5)
!1176 = !DILocation(line: 1151, column: 17, scope: !1175)
!1177 = !DILocation(line: 1151, column: 5, scope: !1163)
!1178 = !DILocation(line: 1153, column: 6, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1180, file: !61, line: 1153, column: 6)
!1180 = distinct !DILexicalBlock(scope: !1175, file: !61, line: 1152, column: 2)
!1181 = !DILocation(line: 1153, column: 16, scope: !1179)
!1182 = !DILocation(line: 1153, column: 6, scope: !1180)
!1183 = !DILocation(line: 1155, column: 4, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1179, file: !61, line: 1154, column: 3)
!1185 = !DILocation(line: 1159, column: 4, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1179, file: !61, line: 1158, column: 3)
!1187 = !DILocation(line: 1164, column: 6, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1189, file: !61, line: 1164, column: 6)
!1189 = distinct !DILexicalBlock(scope: !1175, file: !61, line: 1163, column: 2)
!1190 = !DILocation(line: 1164, column: 16, scope: !1188)
!1191 = !DILocation(line: 1164, column: 6, scope: !1189)
!1192 = !DILocation(line: 1166, column: 7, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1194, file: !61, line: 1166, column: 7)
!1194 = distinct !DILexicalBlock(scope: !1188, file: !61, line: 1165, column: 3)
!1195 = !DILocation(line: 1166, column: 17, scope: !1193)
!1196 = !DILocation(line: 1166, column: 7, scope: !1194)
!1197 = !DILocation(line: 1168, column: 5, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1193, file: !61, line: 1167, column: 4)
!1199 = !DILocation(line: 1172, column: 8, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1201, file: !61, line: 1172, column: 8)
!1201 = distinct !DILexicalBlock(scope: !1193, file: !61, line: 1171, column: 4)
!1202 = !DILocation(line: 1172, column: 20, scope: !1200)
!1203 = !DILocation(line: 1172, column: 8, scope: !1201)
!1204 = !DILocation(line: 1174, column: 6, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1200, file: !61, line: 1173, column: 5)
!1206 = !DILocation(line: 1178, column: 18, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1200, file: !61, line: 1177, column: 5)
!1208 = !DILocation(line: 1178, column: 32, scope: !1207)
!1209 = !DILocation(line: 1178, column: 42, scope: !1207)
!1210 = !DILocation(line: 1178, column: 41, scope: !1207)
!1211 = !DILocation(line: 1178, column: 57, scope: !1207)
!1212 = !DILocation(line: 1178, column: 55, scope: !1207)
!1213 = !DILocation(line: 1178, column: 28, scope: !1207)
!1214 = !DILocation(line: 1178, column: 71, scope: !1207)
!1215 = !DILocation(line: 1178, column: 15, scope: !1207)
!1216 = !DILocation(line: 1179, column: 18, scope: !1207)
!1217 = !DILocation(line: 1179, column: 29, scope: !1207)
!1218 = !DILocation(line: 1179, column: 27, scope: !1207)
!1219 = !DILocation(line: 1179, column: 45, scope: !1207)
!1220 = !DILocation(line: 1179, column: 57, scope: !1207)
!1221 = !DILocation(line: 1179, column: 55, scope: !1207)
!1222 = !DILocation(line: 1179, column: 42, scope: !1207)
!1223 = !DILocation(line: 1179, column: 15, scope: !1207)
!1224 = !DILocation(line: 1180, column: 13, scope: !1207)
!1225 = !DILocation(line: 1180, column: 6, scope: !1207)
!1226 = !DILocation(line: 1186, column: 7, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1228, file: !61, line: 1186, column: 7)
!1228 = distinct !DILexicalBlock(scope: !1188, file: !61, line: 1185, column: 3)
!1229 = !DILocation(line: 1186, column: 19, scope: !1227)
!1230 = !DILocation(line: 1186, column: 7, scope: !1228)
!1231 = !DILocation(line: 1188, column: 5, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1227, file: !61, line: 1187, column: 4)
!1233 = !DILocation(line: 1192, column: 18, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1227, file: !61, line: 1191, column: 4)
!1235 = !DILocation(line: 1192, column: 17, scope: !1234)
!1236 = !DILocation(line: 1192, column: 15, scope: !1234)
!1237 = !DILocation(line: 1193, column: 20, scope: !1234)
!1238 = !DILocation(line: 1193, column: 19, scope: !1234)
!1239 = !DILocation(line: 1193, column: 17, scope: !1234)
!1240 = !DILocation(line: 1194, column: 17, scope: !1234)
!1241 = !DILocation(line: 1194, column: 31, scope: !1234)
!1242 = !DILocation(line: 1194, column: 41, scope: !1234)
!1243 = !DILocation(line: 1194, column: 40, scope: !1234)
!1244 = !DILocation(line: 1194, column: 56, scope: !1234)
!1245 = !DILocation(line: 1194, column: 54, scope: !1234)
!1246 = !DILocation(line: 1194, column: 27, scope: !1234)
!1247 = !DILocation(line: 1194, column: 70, scope: !1234)
!1248 = !DILocation(line: 1194, column: 14, scope: !1234)
!1249 = !DILocation(line: 1195, column: 17, scope: !1234)
!1250 = !DILocation(line: 1195, column: 28, scope: !1234)
!1251 = !DILocation(line: 1195, column: 26, scope: !1234)
!1252 = !DILocation(line: 1195, column: 44, scope: !1234)
!1253 = !DILocation(line: 1195, column: 56, scope: !1234)
!1254 = !DILocation(line: 1195, column: 54, scope: !1234)
!1255 = !DILocation(line: 1195, column: 41, scope: !1234)
!1256 = !DILocation(line: 1195, column: 14, scope: !1234)
!1257 = !DILocation(line: 1196, column: 12, scope: !1234)
!1258 = !DILocation(line: 1196, column: 5, scope: !1234)
!1259 = !DILocation(line: 1201, column: 1, scope: !1163)
!1260 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !61, file: !61, line: 1218, type: !1261, scopeLine: 1219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1261 = !DISubroutineType(types: !1262)
!1262 = !{!340, !340, !340}
!1263 = !DILocalVariable(name: "numerator", arg: 1, scope: !1260, file: !61, line: 1218, type: !340)
!1264 = !DILocation(line: 1218, column: 25, scope: !1260)
!1265 = !DILocalVariable(name: "denominator", arg: 2, scope: !1260, file: !61, line: 1218, type: !340)
!1266 = !DILocation(line: 1218, column: 40, scope: !1260)
!1267 = !DILocalVariable(name: "u32Temp1", scope: !1260, file: !61, line: 1221, type: !340)
!1268 = !DILocation(line: 1221, column: 6, scope: !1260)
!1269 = !DILocalVariable(name: "u32Temp2", scope: !1260, file: !61, line: 1221, type: !340)
!1270 = !DILocation(line: 1221, column: 20, scope: !1260)
!1271 = !DILocalVariable(name: "u32Temp3", scope: !1260, file: !61, line: 1221, type: !340)
!1272 = !DILocation(line: 1221, column: 34, scope: !1260)
!1273 = !DILocalVariable(name: "numerator_old", scope: !1260, file: !61, line: 1221, type: !340)
!1274 = !DILocation(line: 1221, column: 48, scope: !1260)
!1275 = !DILocation(line: 1222, column: 5, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1260, file: !61, line: 1222, column: 5)
!1277 = !DILocation(line: 1222, column: 16, scope: !1276)
!1278 = !DILocation(line: 1222, column: 5, scope: !1260)
!1279 = !DILocation(line: 1224, column: 3, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1276, file: !61, line: 1223, column: 2)
!1281 = !DILocation(line: 1228, column: 14, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1276, file: !61, line: 1227, column: 2)
!1283 = !DILocation(line: 1228, column: 26, scope: !1282)
!1284 = !DILocation(line: 1228, column: 41, scope: !1282)
!1285 = !DILocation(line: 1228, column: 51, scope: !1282)
!1286 = !DILocation(line: 1228, column: 50, scope: !1282)
!1287 = !DILocation(line: 1228, column: 38, scope: !1282)
!1288 = !DILocation(line: 1228, column: 24, scope: !1282)
!1289 = !DILocation(line: 1228, column: 12, scope: !1282)
!1290 = !DILocation(line: 1229, column: 7, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1282, file: !61, line: 1229, column: 6)
!1292 = !DILocation(line: 1229, column: 16, scope: !1291)
!1293 = !DILocation(line: 1229, column: 24, scope: !1291)
!1294 = !DILocation(line: 1229, column: 6, scope: !1282)
!1295 = !DILocation(line: 1231, column: 16, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1291, file: !61, line: 1230, column: 3)
!1297 = !DILocation(line: 1231, column: 27, scope: !1296)
!1298 = !DILocation(line: 1231, column: 13, scope: !1296)
!1299 = !DILocation(line: 1232, column: 3, scope: !1296)
!1300 = !DILocation(line: 1235, column: 16, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1291, file: !61, line: 1234, column: 3)
!1302 = !DILocation(line: 1235, column: 27, scope: !1301)
!1303 = !DILocation(line: 1235, column: 32, scope: !1301)
!1304 = !DILocation(line: 1235, column: 13, scope: !1301)
!1305 = !DILocation(line: 1238, column: 6, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1282, file: !61, line: 1238, column: 6)
!1307 = !DILocation(line: 1238, column: 17, scope: !1306)
!1308 = !DILocation(line: 1238, column: 15, scope: !1306)
!1309 = !DILocation(line: 1238, column: 6, scope: !1282)
!1310 = !DILocation(line: 1240, column: 12, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1306, file: !61, line: 1239, column: 3)
!1312 = !DILocation(line: 1240, column: 22, scope: !1311)
!1313 = !DILocation(line: 1240, column: 21, scope: !1311)
!1314 = !DILocation(line: 1240, column: 4, scope: !1311)
!1315 = !DILocation(line: 1244, column: 13, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1306, file: !61, line: 1243, column: 3)
!1317 = !DILocation(line: 1244, column: 23, scope: !1316)
!1318 = !DILocation(line: 1244, column: 22, scope: !1316)
!1319 = !DILocation(line: 1244, column: 36, scope: !1316)
!1320 = !DILocation(line: 1244, column: 4, scope: !1316)
!1321 = !DILocation(line: 1249, column: 1, scope: !1260)
!1322 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !61, file: !61, line: 1266, type: !1323, scopeLine: 1267, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!69, !340, !69}
!1325 = !DILocalVariable(name: "numerator", arg: 1, scope: !1322, file: !61, line: 1266, type: !340)
!1326 = !DILocation(line: 1266, column: 25, scope: !1322)
!1327 = !DILocalVariable(name: "denominator", arg: 2, scope: !1322, file: !61, line: 1266, type: !69)
!1328 = !DILocation(line: 1266, column: 40, scope: !1322)
!1329 = !DILocalVariable(name: "u32Temp1", scope: !1322, file: !61, line: 1268, type: !340)
!1330 = !DILocation(line: 1268, column: 6, scope: !1322)
!1331 = !DILocalVariable(name: "u32Temp2", scope: !1322, file: !61, line: 1268, type: !340)
!1332 = !DILocation(line: 1268, column: 20, scope: !1322)
!1333 = !DILocation(line: 1269, column: 5, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1322, file: !61, line: 1269, column: 5)
!1335 = !DILocation(line: 1269, column: 17, scope: !1334)
!1336 = !DILocation(line: 1269, column: 5, scope: !1322)
!1337 = !DILocation(line: 1271, column: 6, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1339, file: !61, line: 1271, column: 6)
!1339 = distinct !DILexicalBlock(scope: !1334, file: !61, line: 1270, column: 2)
!1340 = !DILocation(line: 1271, column: 18, scope: !1338)
!1341 = !DILocation(line: 1271, column: 6, scope: !1339)
!1342 = !DILocation(line: 1273, column: 4, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1338, file: !61, line: 1272, column: 3)
!1344 = !DILocation(line: 1277, column: 19, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1338, file: !61, line: 1276, column: 3)
!1346 = !DILocation(line: 1277, column: 18, scope: !1345)
!1347 = !DILocation(line: 1277, column: 16, scope: !1345)
!1348 = !DILocation(line: 1278, column: 16, scope: !1345)
!1349 = !DILocation(line: 1278, column: 30, scope: !1345)
!1350 = !DILocation(line: 1278, column: 40, scope: !1345)
!1351 = !DILocation(line: 1278, column: 39, scope: !1345)
!1352 = !DILocation(line: 1278, column: 55, scope: !1345)
!1353 = !DILocation(line: 1278, column: 53, scope: !1345)
!1354 = !DILocation(line: 1278, column: 26, scope: !1345)
!1355 = !DILocation(line: 1278, column: 69, scope: !1345)
!1356 = !DILocation(line: 1278, column: 13, scope: !1345)
!1357 = !DILocation(line: 1279, column: 16, scope: !1345)
!1358 = !DILocation(line: 1279, column: 25, scope: !1345)
!1359 = !DILocation(line: 1279, column: 24, scope: !1345)
!1360 = !DILocation(line: 1279, column: 41, scope: !1345)
!1361 = !DILocation(line: 1279, column: 51, scope: !1345)
!1362 = !DILocation(line: 1279, column: 50, scope: !1345)
!1363 = !DILocation(line: 1279, column: 38, scope: !1345)
!1364 = !DILocation(line: 1279, column: 13, scope: !1345)
!1365 = !DILocation(line: 1280, column: 7, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1345, file: !61, line: 1280, column: 7)
!1367 = !DILocation(line: 1280, column: 16, scope: !1366)
!1368 = !DILocation(line: 1280, column: 7, scope: !1345)
!1369 = !DILocation(line: 1282, column: 13, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1366, file: !61, line: 1281, column: 4)
!1371 = !DILocation(line: 1282, column: 12, scope: !1370)
!1372 = !DILocation(line: 1282, column: 5, scope: !1370)
!1373 = !DILocation(line: 1286, column: 5, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1366, file: !61, line: 1285, column: 4)
!1375 = !DILocation(line: 1292, column: 15, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1334, file: !61, line: 1291, column: 2)
!1377 = !DILocation(line: 1292, column: 29, scope: !1376)
!1378 = !DILocation(line: 1292, column: 39, scope: !1376)
!1379 = !DILocation(line: 1292, column: 38, scope: !1376)
!1380 = !DILocation(line: 1292, column: 54, scope: !1376)
!1381 = !DILocation(line: 1292, column: 52, scope: !1376)
!1382 = !DILocation(line: 1292, column: 25, scope: !1376)
!1383 = !DILocation(line: 1292, column: 68, scope: !1376)
!1384 = !DILocation(line: 1292, column: 12, scope: !1376)
!1385 = !DILocation(line: 1293, column: 15, scope: !1376)
!1386 = !DILocation(line: 1293, column: 24, scope: !1376)
!1387 = !DILocation(line: 1293, column: 23, scope: !1376)
!1388 = !DILocation(line: 1293, column: 40, scope: !1376)
!1389 = !DILocation(line: 1293, column: 50, scope: !1376)
!1390 = !DILocation(line: 1293, column: 49, scope: !1376)
!1391 = !DILocation(line: 1293, column: 37, scope: !1376)
!1392 = !DILocation(line: 1293, column: 12, scope: !1376)
!1393 = !DILocation(line: 1294, column: 6, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1376, file: !61, line: 1294, column: 6)
!1395 = !DILocation(line: 1294, column: 15, scope: !1394)
!1396 = !DILocation(line: 1294, column: 6, scope: !1376)
!1397 = !DILocation(line: 1296, column: 11, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1394, file: !61, line: 1295, column: 3)
!1399 = !DILocation(line: 1296, column: 4, scope: !1398)
!1400 = !DILocation(line: 1300, column: 4, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1394, file: !61, line: 1299, column: 3)
!1402 = !DILocation(line: 1303, column: 1, scope: !1322)
!1403 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !61, file: !61, line: 1321, type: !1404, scopeLine: 1322, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!69, !69, !340}
!1406 = !DILocalVariable(name: "numerator", arg: 1, scope: !1403, file: !61, line: 1321, type: !69)
!1407 = !DILocation(line: 1321, column: 25, scope: !1403)
!1408 = !DILocalVariable(name: "denominator", arg: 2, scope: !1403, file: !61, line: 1321, type: !340)
!1409 = !DILocation(line: 1321, column: 40, scope: !1403)
!1410 = !DILocalVariable(name: "s32Temp1", scope: !1403, file: !61, line: 1323, type: !69)
!1411 = !DILocation(line: 1323, column: 6, scope: !1403)
!1412 = !DILocalVariable(name: "s32Temp2", scope: !1403, file: !61, line: 1323, type: !69)
!1413 = !DILocation(line: 1323, column: 20, scope: !1403)
!1414 = !DILocalVariable(name: "u32Temp0", scope: !1403, file: !61, line: 1324, type: !340)
!1415 = !DILocation(line: 1324, column: 6, scope: !1403)
!1416 = !DILocalVariable(name: "u32Temp1", scope: !1403, file: !61, line: 1324, type: !340)
!1417 = !DILocation(line: 1324, column: 20, scope: !1403)
!1418 = !DILocalVariable(name: "u32Temp2", scope: !1403, file: !61, line: 1324, type: !340)
!1419 = !DILocation(line: 1324, column: 34, scope: !1403)
!1420 = !DILocation(line: 1325, column: 5, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1403, file: !61, line: 1325, column: 5)
!1422 = !DILocation(line: 1325, column: 17, scope: !1421)
!1423 = !DILocation(line: 1325, column: 5, scope: !1403)
!1424 = !DILocation(line: 1327, column: 6, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1426, file: !61, line: 1327, column: 6)
!1426 = distinct !DILexicalBlock(scope: !1421, file: !61, line: 1326, column: 2)
!1427 = !DILocation(line: 1327, column: 16, scope: !1425)
!1428 = !DILocation(line: 1327, column: 6, scope: !1426)
!1429 = !DILocation(line: 1329, column: 4, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1425, file: !61, line: 1328, column: 3)
!1431 = !DILocation(line: 1333, column: 4, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1425, file: !61, line: 1332, column: 3)
!1433 = !DILocation(line: 1338, column: 6, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1435, file: !61, line: 1338, column: 6)
!1435 = distinct !DILexicalBlock(scope: !1421, file: !61, line: 1337, column: 2)
!1436 = !DILocation(line: 1338, column: 16, scope: !1434)
!1437 = !DILocation(line: 1338, column: 6, scope: !1435)
!1438 = !DILocation(line: 1340, column: 16, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1434, file: !61, line: 1339, column: 3)
!1440 = !DILocation(line: 1340, column: 15, scope: !1439)
!1441 = !DILocation(line: 1340, column: 13, scope: !1439)
!1442 = !DILocation(line: 1341, column: 16, scope: !1439)
!1443 = !DILocation(line: 1341, column: 25, scope: !1439)
!1444 = !DILocation(line: 1341, column: 24, scope: !1439)
!1445 = !DILocation(line: 1341, column: 13, scope: !1439)
!1446 = !DILocation(line: 1342, column: 15, scope: !1439)
!1447 = !DILocation(line: 1342, column: 28, scope: !1439)
!1448 = !DILocation(line: 1342, column: 37, scope: !1439)
!1449 = !DILocation(line: 1342, column: 36, scope: !1439)
!1450 = !DILocation(line: 1342, column: 52, scope: !1439)
!1451 = !DILocation(line: 1342, column: 50, scope: !1439)
!1452 = !DILocation(line: 1342, column: 24, scope: !1439)
!1453 = !DILocation(line: 1342, column: 13, scope: !1439)
!1454 = !DILocation(line: 1344, column: 8, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1439, file: !61, line: 1344, column: 7)
!1456 = !DILocation(line: 1344, column: 20, scope: !1455)
!1457 = !DILocation(line: 1344, column: 27, scope: !1455)
!1458 = !DILocation(line: 1344, column: 7, scope: !1439)
!1459 = !DILocation(line: 1346, column: 20, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1455, file: !61, line: 1345, column: 4)
!1461 = !DILocation(line: 1346, column: 32, scope: !1460)
!1462 = !DILocation(line: 1346, column: 17, scope: !1460)
!1463 = !DILocation(line: 1347, column: 4, scope: !1460)
!1464 = !DILocation(line: 1350, column: 20, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1455, file: !61, line: 1349, column: 4)
!1466 = !DILocation(line: 1350, column: 32, scope: !1465)
!1467 = !DILocation(line: 1350, column: 38, scope: !1465)
!1468 = !DILocation(line: 1350, column: 17, scope: !1465)
!1469 = !DILocation(line: 1354, column: 7, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1439, file: !61, line: 1354, column: 7)
!1471 = !DILocation(line: 1354, column: 18, scope: !1470)
!1472 = !DILocation(line: 1354, column: 16, scope: !1470)
!1473 = !DILocation(line: 1354, column: 7, scope: !1439)
!1474 = !DILocation(line: 1356, column: 14, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1470, file: !61, line: 1355, column: 4)
!1476 = !DILocation(line: 1356, column: 13, scope: !1475)
!1477 = !DILocation(line: 1356, column: 23, scope: !1475)
!1478 = !DILocation(line: 1356, column: 5, scope: !1475)
!1479 = !DILocation(line: 1360, column: 14, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1470, file: !61, line: 1359, column: 4)
!1481 = !DILocation(line: 1360, column: 23, scope: !1480)
!1482 = !DILocation(line: 1360, column: 12, scope: !1480)
!1483 = !DILocation(line: 1360, column: 27, scope: !1480)
!1484 = !DILocation(line: 1360, column: 5, scope: !1480)
!1485 = !DILocation(line: 1367, column: 16, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1434, file: !61, line: 1366, column: 3)
!1487 = !DILocation(line: 1367, column: 30, scope: !1486)
!1488 = !DILocation(line: 1367, column: 40, scope: !1486)
!1489 = !DILocation(line: 1367, column: 39, scope: !1486)
!1490 = !DILocation(line: 1367, column: 55, scope: !1486)
!1491 = !DILocation(line: 1367, column: 53, scope: !1486)
!1492 = !DILocation(line: 1367, column: 26, scope: !1486)
!1493 = !DILocation(line: 1367, column: 69, scope: !1486)
!1494 = !DILocation(line: 1367, column: 13, scope: !1486)
!1495 = !DILocation(line: 1368, column: 16, scope: !1486)
!1496 = !DILocation(line: 1368, column: 26, scope: !1486)
!1497 = !DILocation(line: 1368, column: 25, scope: !1486)
!1498 = !DILocation(line: 1368, column: 42, scope: !1486)
!1499 = !DILocation(line: 1368, column: 51, scope: !1486)
!1500 = !DILocation(line: 1368, column: 50, scope: !1486)
!1501 = !DILocation(line: 1368, column: 39, scope: !1486)
!1502 = !DILocation(line: 1368, column: 13, scope: !1486)
!1503 = !DILocation(line: 1369, column: 11, scope: !1486)
!1504 = !DILocation(line: 1369, column: 4, scope: !1486)
!1505 = !DILocation(line: 1372, column: 1, scope: !1403)
!1506 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !61, file: !61, line: 1389, type: !1507, scopeLine: 1390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{!69, !69, !69}
!1509 = !DILocalVariable(name: "numerator", arg: 1, scope: !1506, file: !61, line: 1389, type: !69)
!1510 = !DILocation(line: 1389, column: 25, scope: !1506)
!1511 = !DILocalVariable(name: "denominator", arg: 2, scope: !1506, file: !61, line: 1389, type: !69)
!1512 = !DILocation(line: 1389, column: 40, scope: !1506)
!1513 = !DILocalVariable(name: "s32Temp1", scope: !1506, file: !61, line: 1391, type: !69)
!1514 = !DILocation(line: 1391, column: 6, scope: !1506)
!1515 = !DILocalVariable(name: "s32Temp2", scope: !1506, file: !61, line: 1391, type: !69)
!1516 = !DILocation(line: 1391, column: 20, scope: !1506)
!1517 = !DILocalVariable(name: "denominator_prime", scope: !1506, file: !61, line: 1392, type: !340)
!1518 = !DILocation(line: 1392, column: 6, scope: !1506)
!1519 = !DILocalVariable(name: "u32Temp1", scope: !1506, file: !61, line: 1392, type: !340)
!1520 = !DILocation(line: 1392, column: 29, scope: !1506)
!1521 = !DILocalVariable(name: "u32Temp2", scope: !1506, file: !61, line: 1392, type: !340)
!1522 = !DILocation(line: 1392, column: 43, scope: !1506)
!1523 = !DILocalVariable(name: "u32numerator", scope: !1506, file: !61, line: 1393, type: !340)
!1524 = !DILocation(line: 1393, column: 6, scope: !1506)
!1525 = !DILocalVariable(name: "u32denominator", scope: !1506, file: !61, line: 1393, type: !340)
!1526 = !DILocation(line: 1393, column: 23, scope: !1506)
!1527 = !DILocation(line: 1394, column: 5, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1506, file: !61, line: 1394, column: 5)
!1529 = !DILocation(line: 1394, column: 15, scope: !1528)
!1530 = !DILocation(line: 1394, column: 5, scope: !1506)
!1531 = !DILocation(line: 1396, column: 6, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1533, file: !61, line: 1396, column: 6)
!1533 = distinct !DILexicalBlock(scope: !1528, file: !61, line: 1395, column: 2)
!1534 = !DILocation(line: 1396, column: 18, scope: !1532)
!1535 = !DILocation(line: 1396, column: 6, scope: !1533)
!1536 = !DILocation(line: 1398, column: 7, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1538, file: !61, line: 1398, column: 7)
!1538 = distinct !DILexicalBlock(scope: !1532, file: !61, line: 1397, column: 3)
!1539 = !DILocation(line: 1398, column: 19, scope: !1537)
!1540 = !DILocation(line: 1398, column: 7, scope: !1538)
!1541 = !DILocation(line: 1400, column: 5, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1537, file: !61, line: 1399, column: 4)
!1543 = !DILocation(line: 1404, column: 21, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1537, file: !61, line: 1403, column: 4)
!1545 = !DILocation(line: 1404, column: 20, scope: !1544)
!1546 = !DILocation(line: 1404, column: 18, scope: !1544)
!1547 = !DILocation(line: 1405, column: 23, scope: !1544)
!1548 = !DILocation(line: 1405, column: 22, scope: !1544)
!1549 = !DILocation(line: 1405, column: 20, scope: !1544)
!1550 = !DILocation(line: 1406, column: 16, scope: !1544)
!1551 = !DILocation(line: 1406, column: 33, scope: !1544)
!1552 = !DILocation(line: 1406, column: 46, scope: !1544)
!1553 = !DILocation(line: 1406, column: 45, scope: !1544)
!1554 = !DILocation(line: 1406, column: 64, scope: !1544)
!1555 = !DILocation(line: 1406, column: 62, scope: !1544)
!1556 = !DILocation(line: 1406, column: 29, scope: !1544)
!1557 = !DILocation(line: 1406, column: 81, scope: !1544)
!1558 = !DILocation(line: 1406, column: 14, scope: !1544)
!1559 = !DILocation(line: 1407, column: 17, scope: !1544)
!1560 = !DILocation(line: 1407, column: 30, scope: !1544)
!1561 = !DILocation(line: 1407, column: 29, scope: !1544)
!1562 = !DILocation(line: 1407, column: 49, scope: !1544)
!1563 = !DILocation(line: 1407, column: 58, scope: !1544)
!1564 = !DILocation(line: 1407, column: 57, scope: !1544)
!1565 = !DILocation(line: 1407, column: 46, scope: !1544)
!1566 = !DILocation(line: 1407, column: 14, scope: !1544)
!1567 = !DILocation(line: 1408, column: 8, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1544, file: !61, line: 1408, column: 8)
!1569 = !DILocation(line: 1408, column: 17, scope: !1568)
!1570 = !DILocation(line: 1408, column: 8, scope: !1544)
!1571 = !DILocation(line: 1410, column: 13, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1568, file: !61, line: 1409, column: 5)
!1573 = !DILocation(line: 1410, column: 6, scope: !1572)
!1574 = !DILocation(line: 1414, column: 6, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1568, file: !61, line: 1413, column: 5)
!1576 = !DILocation(line: 1420, column: 20, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1532, file: !61, line: 1419, column: 3)
!1578 = !DILocation(line: 1420, column: 19, scope: !1577)
!1579 = !DILocation(line: 1420, column: 29, scope: !1577)
!1580 = !DILocation(line: 1420, column: 17, scope: !1577)
!1581 = !DILocation(line: 1421, column: 16, scope: !1577)
!1582 = !DILocation(line: 1421, column: 33, scope: !1577)
!1583 = !DILocation(line: 1421, column: 46, scope: !1577)
!1584 = !DILocation(line: 1421, column: 45, scope: !1577)
!1585 = !DILocation(line: 1421, column: 61, scope: !1577)
!1586 = !DILocation(line: 1421, column: 59, scope: !1577)
!1587 = !DILocation(line: 1421, column: 29, scope: !1577)
!1588 = !DILocation(line: 1421, column: 75, scope: !1577)
!1589 = !DILocation(line: 1421, column: 13, scope: !1577)
!1590 = !DILocation(line: 1422, column: 16, scope: !1577)
!1591 = !DILocation(line: 1422, column: 29, scope: !1577)
!1592 = !DILocation(line: 1422, column: 28, scope: !1577)
!1593 = !DILocation(line: 1422, column: 45, scope: !1577)
!1594 = !DILocation(line: 1422, column: 54, scope: !1577)
!1595 = !DILocation(line: 1422, column: 53, scope: !1577)
!1596 = !DILocation(line: 1422, column: 42, scope: !1577)
!1597 = !DILocation(line: 1422, column: 13, scope: !1577)
!1598 = !DILocation(line: 1423, column: 13, scope: !1577)
!1599 = !DILocation(line: 1423, column: 12, scope: !1577)
!1600 = !DILocation(line: 1423, column: 22, scope: !1577)
!1601 = !DILocation(line: 1423, column: 4, scope: !1577)
!1602 = !DILocation(line: 1428, column: 6, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1604, file: !61, line: 1428, column: 6)
!1604 = distinct !DILexicalBlock(scope: !1528, file: !61, line: 1427, column: 2)
!1605 = !DILocation(line: 1428, column: 18, scope: !1603)
!1606 = !DILocation(line: 1428, column: 6, scope: !1604)
!1607 = !DILocation(line: 1430, column: 7, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1609, file: !61, line: 1430, column: 7)
!1609 = distinct !DILexicalBlock(scope: !1603, file: !61, line: 1429, column: 3)
!1610 = !DILocation(line: 1430, column: 19, scope: !1608)
!1611 = !DILocation(line: 1430, column: 7, scope: !1609)
!1612 = !DILocation(line: 1432, column: 5, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1608, file: !61, line: 1431, column: 4)
!1614 = !DILocation(line: 1436, column: 23, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1608, file: !61, line: 1435, column: 4)
!1616 = !DILocation(line: 1436, column: 22, scope: !1615)
!1617 = !DILocation(line: 1436, column: 35, scope: !1615)
!1618 = !DILocation(line: 1436, column: 20, scope: !1615)
!1619 = !DILocation(line: 1437, column: 17, scope: !1615)
!1620 = !DILocation(line: 1437, column: 31, scope: !1615)
!1621 = !DILocation(line: 1437, column: 41, scope: !1615)
!1622 = !DILocation(line: 1437, column: 40, scope: !1615)
!1623 = !DILocation(line: 1437, column: 59, scope: !1615)
!1624 = !DILocation(line: 1437, column: 57, scope: !1615)
!1625 = !DILocation(line: 1437, column: 27, scope: !1615)
!1626 = !DILocation(line: 1437, column: 76, scope: !1615)
!1627 = !DILocation(line: 1437, column: 14, scope: !1615)
!1628 = !DILocation(line: 1438, column: 17, scope: !1615)
!1629 = !DILocation(line: 1438, column: 27, scope: !1615)
!1630 = !DILocation(line: 1438, column: 26, scope: !1615)
!1631 = !DILocation(line: 1438, column: 46, scope: !1615)
!1632 = !DILocation(line: 1438, column: 55, scope: !1615)
!1633 = !DILocation(line: 1438, column: 54, scope: !1615)
!1634 = !DILocation(line: 1438, column: 43, scope: !1615)
!1635 = !DILocation(line: 1438, column: 14, scope: !1615)
!1636 = !DILocation(line: 1439, column: 14, scope: !1615)
!1637 = !DILocation(line: 1439, column: 13, scope: !1615)
!1638 = !DILocation(line: 1439, column: 23, scope: !1615)
!1639 = !DILocation(line: 1439, column: 5, scope: !1615)
!1640 = !DILocation(line: 1444, column: 16, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1603, file: !61, line: 1443, column: 3)
!1642 = !DILocation(line: 1444, column: 30, scope: !1641)
!1643 = !DILocation(line: 1444, column: 40, scope: !1641)
!1644 = !DILocation(line: 1444, column: 39, scope: !1641)
!1645 = !DILocation(line: 1444, column: 55, scope: !1641)
!1646 = !DILocation(line: 1444, column: 53, scope: !1641)
!1647 = !DILocation(line: 1444, column: 26, scope: !1641)
!1648 = !DILocation(line: 1444, column: 69, scope: !1641)
!1649 = !DILocation(line: 1444, column: 13, scope: !1641)
!1650 = !DILocation(line: 1445, column: 16, scope: !1641)
!1651 = !DILocation(line: 1445, column: 26, scope: !1641)
!1652 = !DILocation(line: 1445, column: 25, scope: !1641)
!1653 = !DILocation(line: 1445, column: 42, scope: !1641)
!1654 = !DILocation(line: 1445, column: 51, scope: !1641)
!1655 = !DILocation(line: 1445, column: 50, scope: !1641)
!1656 = !DILocation(line: 1445, column: 39, scope: !1641)
!1657 = !DILocation(line: 1445, column: 13, scope: !1641)
!1658 = !DILocation(line: 1446, column: 11, scope: !1641)
!1659 = !DILocation(line: 1446, column: 4, scope: !1641)
!1660 = !DILocation(line: 1449, column: 1, scope: !1506)
!1661 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !61, file: !61, line: 1467, type: !1662, scopeLine: 1468, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1662 = !DISubroutineType(types: !1663)
!1663 = !{!12, !69, !340}
!1664 = !DILocalVariable(name: "numerator", arg: 1, scope: !1661, file: !61, line: 1467, type: !69)
!1665 = !DILocation(line: 1467, column: 25, scope: !1661)
!1666 = !DILocalVariable(name: "denominator", arg: 2, scope: !1661, file: !61, line: 1467, type: !340)
!1667 = !DILocation(line: 1467, column: 40, scope: !1661)
!1668 = !DILocalVariable(name: "numerator_prime", scope: !1661, file: !61, line: 1470, type: !340)
!1669 = !DILocation(line: 1470, column: 6, scope: !1661)
!1670 = !DILocalVariable(name: "u32Temp1", scope: !1661, file: !61, line: 1470, type: !340)
!1671 = !DILocation(line: 1470, column: 27, scope: !1661)
!1672 = !DILocalVariable(name: "u32Temp2", scope: !1661, file: !61, line: 1470, type: !340)
!1673 = !DILocation(line: 1470, column: 41, scope: !1661)
!1674 = !DILocalVariable(name: "u32Temp3", scope: !1661, file: !61, line: 1470, type: !340)
!1675 = !DILocation(line: 1470, column: 55, scope: !1661)
!1676 = !DILocalVariable(name: "s32Temp1", scope: !1661, file: !61, line: 1471, type: !69)
!1677 = !DILocation(line: 1471, column: 6, scope: !1661)
!1678 = !DILocalVariable(name: "s32Temp2", scope: !1661, file: !61, line: 1471, type: !69)
!1679 = !DILocation(line: 1471, column: 20, scope: !1661)
!1680 = !DILocalVariable(name: "s32Temp3", scope: !1661, file: !61, line: 1471, type: !69)
!1681 = !DILocation(line: 1471, column: 34, scope: !1661)
!1682 = !DILocation(line: 1472, column: 5, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1661, file: !61, line: 1472, column: 5)
!1684 = !DILocation(line: 1472, column: 17, scope: !1683)
!1685 = !DILocation(line: 1472, column: 5, scope: !1661)
!1686 = !DILocation(line: 1474, column: 6, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1688, file: !61, line: 1474, column: 6)
!1688 = distinct !DILexicalBlock(scope: !1683, file: !61, line: 1473, column: 2)
!1689 = !DILocation(line: 1474, column: 15, scope: !1687)
!1690 = !DILocation(line: 1474, column: 6, scope: !1688)
!1691 = !DILocation(line: 1476, column: 4, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1687, file: !61, line: 1475, column: 3)
!1693 = !DILocation(line: 1480, column: 4, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1687, file: !61, line: 1479, column: 3)
!1695 = !DILocation(line: 1485, column: 6, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1697, file: !61, line: 1485, column: 6)
!1697 = distinct !DILexicalBlock(scope: !1683, file: !61, line: 1484, column: 2)
!1698 = !DILocation(line: 1485, column: 16, scope: !1696)
!1699 = !DILocation(line: 1485, column: 6, scope: !1697)
!1700 = !DILocation(line: 1487, column: 23, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1696, file: !61, line: 1486, column: 3)
!1702 = !DILocation(line: 1487, column: 22, scope: !1701)
!1703 = !DILocation(line: 1487, column: 20, scope: !1701)
!1704 = !DILocation(line: 1488, column: 16, scope: !1701)
!1705 = !DILocation(line: 1488, column: 32, scope: !1701)
!1706 = !DILocation(line: 1488, column: 31, scope: !1701)
!1707 = !DILocation(line: 1488, column: 13, scope: !1701)
!1708 = !DILocation(line: 1489, column: 15, scope: !1701)
!1709 = !DILocation(line: 1489, column: 34, scope: !1701)
!1710 = !DILocation(line: 1489, column: 45, scope: !1701)
!1711 = !DILocation(line: 1489, column: 43, scope: !1701)
!1712 = !DILocation(line: 1489, column: 31, scope: !1701)
!1713 = !DILocation(line: 1489, column: 13, scope: !1701)
!1714 = !DILocation(line: 1491, column: 8, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1701, file: !61, line: 1491, column: 7)
!1716 = !DILocation(line: 1491, column: 20, scope: !1715)
!1717 = !DILocation(line: 1491, column: 27, scope: !1715)
!1718 = !DILocation(line: 1491, column: 7, scope: !1701)
!1719 = !DILocation(line: 1493, column: 19, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1715, file: !61, line: 1492, column: 4)
!1721 = !DILocation(line: 1493, column: 31, scope: !1720)
!1722 = !DILocation(line: 1493, column: 17, scope: !1720)
!1723 = !DILocation(line: 1494, column: 4, scope: !1720)
!1724 = !DILocation(line: 1497, column: 20, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1715, file: !61, line: 1496, column: 4)
!1726 = !DILocation(line: 1497, column: 32, scope: !1725)
!1727 = !DILocation(line: 1497, column: 38, scope: !1725)
!1728 = !DILocation(line: 1497, column: 17, scope: !1725)
!1729 = !DILocation(line: 1500, column: 7, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1701, file: !61, line: 1500, column: 7)
!1731 = !DILocation(line: 1500, column: 18, scope: !1730)
!1732 = !DILocation(line: 1500, column: 16, scope: !1730)
!1733 = !DILocation(line: 1500, column: 7, scope: !1701)
!1734 = !DILocation(line: 1502, column: 18, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1730, file: !61, line: 1501, column: 4)
!1736 = !DILocation(line: 1502, column: 16, scope: !1735)
!1737 = !DILocation(line: 1502, column: 28, scope: !1735)
!1738 = !DILocation(line: 1502, column: 14, scope: !1735)
!1739 = !DILocation(line: 1503, column: 4, scope: !1735)
!1740 = !DILocation(line: 1506, column: 18, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1730, file: !61, line: 1505, column: 4)
!1742 = !DILocation(line: 1506, column: 26, scope: !1741)
!1743 = !DILocation(line: 1506, column: 16, scope: !1741)
!1744 = !DILocation(line: 1506, column: 30, scope: !1741)
!1745 = !DILocation(line: 1506, column: 14, scope: !1741)
!1746 = !DILocation(line: 1508, column: 8, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1701, file: !61, line: 1508, column: 7)
!1748 = !DILocation(line: 1508, column: 18, scope: !1747)
!1749 = !DILocation(line: 1508, column: 7, scope: !1701)
!1750 = !DILocation(line: 1510, column: 18, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1747, file: !61, line: 1509, column: 4)
!1752 = !DILocation(line: 1510, column: 12, scope: !1751)
!1753 = !DILocation(line: 1510, column: 5, scope: !1751)
!1754 = !DILocation(line: 1514, column: 5, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1747, file: !61, line: 1513, column: 4)
!1756 = !DILocation(line: 1519, column: 16, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1696, file: !61, line: 1518, column: 3)
!1758 = !DILocation(line: 1519, column: 26, scope: !1757)
!1759 = !DILocation(line: 1519, column: 25, scope: !1757)
!1760 = !DILocation(line: 1519, column: 41, scope: !1757)
!1761 = !DILocation(line: 1519, column: 39, scope: !1757)
!1762 = !DILocation(line: 1519, column: 13, scope: !1757)
!1763 = !DILocation(line: 1520, column: 16, scope: !1757)
!1764 = !DILocation(line: 1520, column: 30, scope: !1757)
!1765 = !DILocation(line: 1520, column: 40, scope: !1757)
!1766 = !DILocation(line: 1520, column: 39, scope: !1757)
!1767 = !DILocation(line: 1520, column: 55, scope: !1757)
!1768 = !DILocation(line: 1520, column: 53, scope: !1757)
!1769 = !DILocation(line: 1520, column: 26, scope: !1757)
!1770 = !DILocation(line: 1520, column: 68, scope: !1757)
!1771 = !DILocation(line: 1520, column: 13, scope: !1757)
!1772 = !DILocation(line: 1521, column: 16, scope: !1757)
!1773 = !DILocation(line: 1521, column: 25, scope: !1757)
!1774 = !DILocation(line: 1521, column: 24, scope: !1757)
!1775 = !DILocation(line: 1521, column: 41, scope: !1757)
!1776 = !DILocation(line: 1521, column: 51, scope: !1757)
!1777 = !DILocation(line: 1521, column: 50, scope: !1757)
!1778 = !DILocation(line: 1521, column: 38, scope: !1757)
!1779 = !DILocation(line: 1521, column: 13, scope: !1757)
!1780 = !DILocation(line: 1522, column: 7, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1757, file: !61, line: 1522, column: 7)
!1782 = !DILocation(line: 1522, column: 16, scope: !1781)
!1783 = !DILocation(line: 1522, column: 7, scope: !1757)
!1784 = !DILocation(line: 1524, column: 17, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1781, file: !61, line: 1523, column: 4)
!1786 = !DILocation(line: 1524, column: 12, scope: !1785)
!1787 = !DILocation(line: 1524, column: 5, scope: !1785)
!1788 = !DILocation(line: 1528, column: 5, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1781, file: !61, line: 1527, column: 4)
!1790 = !DILocation(line: 1532, column: 1, scope: !1661)
!1791 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1792, file: !1792, line: 12, type: !1793, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !1796)
!1792 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1793 = !DISubroutineType(types: !1794)
!1794 = !{null, !1795}
!1795 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1796 = !{!1797}
!1797 = !DILocalVariable(name: "z", arg: 1, scope: !1791, file: !1792, line: 12, type: !1795)
!1798 = !DILocation(line: 0, scope: !1791)
!1799 = !DILocation(line: 13, column: 9, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1791, file: !1792, line: 13, column: 7)
!1801 = !DILocation(line: 13, column: 7, scope: !1791)
!1802 = !DILocation(line: 14, column: 5, scope: !1800)
!1803 = !DILocation(line: 15, column: 1, scope: !1791)
