; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048/build/s16_fac05_div_s16_s16_alarm_0048.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [110 x i8] c"KLEE-ALARM-0048: signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0048.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i16* %result, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = bitcast i16* %numerator to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !54
  %1 = bitcast i16* %denominator to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  %2 = load i16, i16* %numerator, align 2, !dbg !57
  %3 = load i16, i16* %denominator, align 2, !dbg !58
  %call = call signext i16 @s16_fac05_div_s16_s16(i16 signext %2, i16 signext %3), !dbg !59
  store i16 %call, i16* %result, align 2, !dbg !60
  %4 = load i16, i16* %result, align 2, !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !63 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !75
  %conv = sext i16 %0 to i32, !dbg !77
  %conv1 = sext i32 %conv to i64, !dbg !78
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv1), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.end, label %if.then, !dbg !80

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !81
  br label %return, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !83
  %conv2 = sext i16 %1 to i32, !dbg !83
  %shl = shl i32 %conv2, 16, !dbg !84
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !85
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !86
  %conv3 = sext i16 %2 to i32, !dbg !86
  %cmp = icmp eq i32 %conv3, 0, !dbg !88
  br i1 %cmp, label %if.then5, label %if.else10, !dbg !89

if.then5:                                         ; preds = %if.end
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !90
  %conv6 = sext i16 %3 to i32, !dbg !90
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !93
  br i1 %cmp7, label %if.then9, label %if.else, !dbg !94

if.then9:                                         ; preds = %if.then5
  store i16 -32768, i16* %retval, align 2, !dbg !95
  br label %return, !dbg !95

if.else:                                          ; preds = %if.then5
  store i16 32767, i16* %retval, align 2, !dbg !97
  br label %return, !dbg !97

if.else10:                                        ; preds = %if.end
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !99
  %cmp11 = icmp ne i32 %4, -2147483648, !dbg !102
  br i1 %cmp11, label %if.then13, label %if.else31, !dbg !103

if.then13:                                        ; preds = %if.else10
  %5 = load i16, i16* %denominator.addr, align 2, !dbg !104
  %conv14 = sext i16 %5 to i64, !dbg !107
  %call15 = call i32 @klee_alarm_divisor_nonzero(i64 %conv14), !dbg !108
  %tobool16 = icmp ne i32 %call15, 0, !dbg !108
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !109

if.then17:                                        ; preds = %if.then13
  store i16 0, i16* %retval, align 2, !dbg !110
  br label %return, !dbg !110

if.end18:                                         ; preds = %if.then13
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !112
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !114
  %conv19 = sext i16 %7 to i32, !dbg !115
  %int_cast_to_i64 = zext i32 %conv19 to i64, !dbg !116
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !116
  %div = sdiv i32 %6, %conv19, !dbg !116, !klee.check.div !117
  %conv20 = sext i32 %div to i64, !dbg !118
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !119
  %conv21 = sext i16 %8 to i32, !dbg !120
  %conv22 = sext i32 %conv21 to i64, !dbg !121
  %call23 = call i32 @klee_alarm_s32_mul_upper(i64 %conv20, i64 %conv22), !dbg !122
  %tobool24 = icmp ne i32 %call23, 0, !dbg !122
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !123

if.then25:                                        ; preds = %if.end18
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 202, i8* getelementptr inbounds ([110 x i8], [110 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !124
  unreachable, !dbg !124

if.end26:                                         ; preds = %if.end18
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !126
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !127
  %conv27 = sext i16 %10 to i32, !dbg !128
  %int_cast_to_i641 = zext i32 %conv27 to i64, !dbg !129
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !129
  %div28 = sdiv i32 %9, %conv27, !dbg !129, !klee.check.div !117
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !130
  %conv29 = sext i16 %11 to i32, !dbg !131
  %mul = mul nsw i32 %div28, %conv29, !dbg !132
  %conv30 = sext i32 %mul to i64, !dbg !133
  store volatile i64 %conv30, i64* @klee_alarm_sink_s64, align 8, !dbg !134
  store i16 0, i16* %retval, align 2, !dbg !135
  br label %return, !dbg !135

if.else31:                                        ; preds = %if.else10
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !136
  %conv32 = sext i16 %12 to i32, !dbg !136
  %cmp33 = icmp ne i32 %conv32, -1, !dbg !139
  br i1 %cmp33, label %if.then35, label %if.else56, !dbg !140

if.then35:                                        ; preds = %if.else31
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !141
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !143
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !144
  %conv36 = sext i16 %15 to i32, !dbg !144
  %int_cast_to_i642 = zext i32 %conv36 to i64, !dbg !145
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !145
  %div37 = sdiv i32 %14, %conv36, !dbg !145, !klee.check.div !117
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !146
  %conv38 = sext i16 %16 to i32, !dbg !146
  %mul39 = mul nsw i32 %div37, %conv38, !dbg !147
  %sub = sub nsw i32 %13, %mul39, !dbg !148
  %shl40 = shl i32 %sub, 1, !dbg !149
  store i32 %shl40, i32* %s32Temp2, align 4, !dbg !150
  %17 = load i32, i32* %s32Temp2, align 4, !dbg !151
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !152
  %conv41 = sext i16 %18 to i32, !dbg !152
  %int_cast_to_i643 = zext i32 %conv41 to i64, !dbg !153
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !153
  %div42 = sdiv i32 %17, %conv41, !dbg !153, !klee.check.div !117
  store i32 %div42, i32* %s32Temp1, align 4, !dbg !154
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !155
  %20 = load i16, i16* %numerator.addr, align 2, !dbg !156
  %conv43 = sext i16 %20 to i32, !dbg !156
  %shl44 = shl i32 %conv43, 16, !dbg !157
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !158
  %conv45 = sext i16 %21 to i32, !dbg !158
  %int_cast_to_i644 = zext i32 %conv45 to i64, !dbg !159
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !159
  %div46 = sdiv i32 %shl44, %conv45, !dbg !159, !klee.check.div !117
  %add = add nsw i32 %19, %div46, !dbg !160
  store i32 %add, i32* %s32Temp1, align 4, !dbg !161
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !162
  %cmp47 = icmp slt i32 %22, 32767, !dbg !164
  br i1 %cmp47, label %if.then49, label %if.else55, !dbg !165

if.then49:                                        ; preds = %if.then35
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !166
  %cmp50 = icmp sgt i32 %23, -32768, !dbg !169
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !170

if.then52:                                        ; preds = %if.then49
  %24 = load i32, i32* %s32Temp1, align 4, !dbg !171
  %conv53 = trunc i32 %24 to i16, !dbg !173
  store i16 %conv53, i16* %retval, align 2, !dbg !174
  br label %return, !dbg !174

if.else54:                                        ; preds = %if.then49
  store i16 -32768, i16* %retval, align 2, !dbg !175
  br label %return, !dbg !175

if.else55:                                        ; preds = %if.then35
  store i16 32767, i16* %retval, align 2, !dbg !177
  br label %return, !dbg !177

if.else56:                                        ; preds = %if.else31
  store i16 32767, i16* %retval, align 2, !dbg !179
  br label %return, !dbg !179

return:                                           ; preds = %if.else56, %if.else55, %if.else54, %if.then52, %if.end26, %if.then17, %if.else, %if.then9, %if.then
  %25 = load i16, i16* %retval, align 2, !dbg !181
  ret i16 %25, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !182 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !185, metadata !DIExpression()), !dbg !186
  %0 = load i64, i64* %left.addr, align 8, !dbg !187
  %cmp = icmp sge i64 %0, 0, !dbg !188
  %conv = zext i1 %cmp to i32, !dbg !188
  ret i32 %conv, !dbg !189
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !190 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !191, metadata !DIExpression()), !dbg !192
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !193
  %cmp = icmp ne i64 %0, 0, !dbg !194
  %conv = zext i1 %cmp to i32, !dbg !194
  ret i32 %conv, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !196 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !199, metadata !DIExpression()), !dbg !200
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !201, metadata !DIExpression()), !dbg !202
  %0 = load i64, i64* %left.addr, align 8, !dbg !203
  %1 = load i64, i64* %right.addr, align 8, !dbg !204
  %mul = mul nsw i64 %0, %1, !dbg !205
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !206
  %conv = zext i1 %cmp to i32, !dbg !206
  ret i32 %conv, !dbg !207
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !208 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !211, metadata !DIExpression()), !dbg !212
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 0, i32* %s32Temp1, align 4, !dbg !216
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 0, i32* %s32Temp2, align 4, !dbg !218
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !219
  store i32 %0, i32* %s32Temp1, align 4, !dbg !220
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !221
  %conv = sext i16 %1 to i32, !dbg !221
  %cmp = icmp eq i32 %conv, 0, !dbg !223
  br i1 %cmp, label %if.then, label %if.else5, !dbg !224

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !225
  %cmp2 = icmp slt i32 %2, 0, !dbg !228
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !229

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !230
  br label %return, !dbg !230

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !232
  br label %return, !dbg !232

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !234
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !237
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !238

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !239
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !241
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !242
  %conv9 = sext i16 %6 to i32, !dbg !242
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !243
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !243
  %div = sdiv i32 %5, %conv9, !dbg !243, !klee.check.div !117
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !244
  %conv10 = sext i16 %7 to i32, !dbg !244
  %mul = mul nsw i32 %div, %conv10, !dbg !245
  %sub = sub nsw i32 %4, %mul, !dbg !246
  %shl = shl i32 %sub, 1, !dbg !247
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !248
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !249
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !250
  %conv11 = sext i16 %9 to i32, !dbg !250
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !251
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !251
  %div12 = sdiv i32 %8, %conv11, !dbg !251, !klee.check.div !117
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !252
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !253
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !254
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !255
  %conv13 = sext i16 %12 to i32, !dbg !255
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !256
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !256
  %div14 = sdiv i32 %11, %conv13, !dbg !256, !klee.check.div !117
  %add = add nsw i32 %10, %div14, !dbg !257
  store i32 %add, i32* %s32Temp1, align 4, !dbg !258
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !259
  %cmp15 = icmp slt i32 %13, 32767, !dbg !261
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !262

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !263
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !266
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !267

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !268
  %conv21 = trunc i32 %15 to i16, !dbg !270
  store i16 %conv21, i16* %retval, align 2, !dbg !271
  br label %return, !dbg !271

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !272
  br label %return, !dbg !272

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !274
  br label %return, !dbg !274

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !276
  %conv25 = sext i16 %16 to i32, !dbg !276
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !279
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !280

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !281
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !283
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !284
  %conv29 = sext i16 %19 to i32, !dbg !284
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !285
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !285
  %div30 = sdiv i32 %18, %conv29, !dbg !285, !klee.check.div !117
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !286
  %conv31 = sext i16 %20 to i32, !dbg !286
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !287
  %sub33 = sub nsw i32 %17, %mul32, !dbg !288
  %shl34 = shl i32 %sub33, 1, !dbg !289
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !290
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !291
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !292
  %conv35 = sext i16 %22 to i32, !dbg !292
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !293
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !293
  %div36 = sdiv i32 %21, %conv35, !dbg !293, !klee.check.div !117
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !294
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !295
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !296
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !297
  %conv37 = sext i16 %25 to i32, !dbg !297
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !298
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !298
  %div38 = sdiv i32 %24, %conv37, !dbg !298, !klee.check.div !117
  %add39 = add nsw i32 %23, %div38, !dbg !299
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !300
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !301
  %cmp40 = icmp slt i32 %26, 32767, !dbg !303
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !304

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !305
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !308
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !309

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !310
  %conv46 = trunc i32 %28 to i16, !dbg !312
  store i16 %conv46, i16* %retval, align 2, !dbg !313
  br label %return, !dbg !313

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !314
  br label %return, !dbg !314

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !316
  br label %return, !dbg !316

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !318
  br label %return, !dbg !318

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !320
  ret i16 %29, !dbg !320
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !321 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !324, metadata !DIExpression()), !dbg !325
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !326, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !330, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !332, metadata !DIExpression()), !dbg !333
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !334
  %conv = zext i16 %0 to i32, !dbg !334
  %and = and i32 %conv, 65535, !dbg !335
  %conv1 = trunc i32 %and to i16, !dbg !334
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !336
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !337
  %conv2 = sext i16 %1 to i32, !dbg !337
  %shl = shl i32 %conv2, 16, !dbg !338
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !339
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !340
  %conv3 = zext i16 %2 to i32, !dbg !340
  %cmp = icmp eq i32 %conv3, 0, !dbg !342
  br i1 %cmp, label %if.then, label %if.else9, !dbg !343

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !344
  %conv5 = sext i16 %3 to i32, !dbg !344
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !347
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !348

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !349
  br label %return, !dbg !349

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !351
  br label %return, !dbg !351

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !353
  %conv10 = sext i16 %4 to i32, !dbg !353
  %shl11 = shl i32 %conv10, 16, !dbg !355
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !356
  %conv12 = sext i16 %5 to i32, !dbg !356
  %shl13 = shl i32 %conv12, 16, !dbg !357
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !358
  %conv14 = zext i16 %6 to i32, !dbg !358
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !359
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !359
  %div = sdiv i32 %shl13, %conv14, !dbg !359, !klee.check.div !117
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !360
  %conv15 = zext i16 %7 to i32, !dbg !360
  %mul = mul nsw i32 %div, %conv15, !dbg !361
  %sub = sub nsw i32 %shl11, %mul, !dbg !362
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !363
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !364
  %shl16 = shl i32 %8, 1, !dbg !365
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !366
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !367
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !368
  %conv17 = zext i16 %10 to i32, !dbg !368
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !369
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !369
  %div18 = sdiv i32 %9, %conv17, !dbg !369, !klee.check.div !117
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !370
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !371
  %conv19 = sext i16 %11 to i32, !dbg !371
  %shl20 = shl i32 %conv19, 16, !dbg !372
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !373
  %conv21 = zext i16 %12 to i32, !dbg !373
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !374
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !374
  %div22 = sdiv i32 %shl20, %conv21, !dbg !374, !klee.check.div !117
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !375
  %add = add nsw i32 %div22, %13, !dbg !376
  store i32 %add, i32* %s32Temp1, align 4, !dbg !377
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !378
  %cmp23 = icmp slt i32 %14, 32767, !dbg !380
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !381

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !382
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !385
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !386

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !387
  %conv29 = trunc i32 %16 to i16, !dbg !389
  store i16 %conv29, i16* %retval, align 2, !dbg !390
  br label %return, !dbg !390

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !391
  br label %return, !dbg !391

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !393
  br label %return, !dbg !393

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !395
  ret i16 %17, !dbg !395
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !396 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !397, metadata !DIExpression()), !dbg !398
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !399, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !401, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !403, metadata !DIExpression()), !dbg !404
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !405
  %conv = zext i16 %0 to i32, !dbg !405
  %and = and i32 %conv, 65535, !dbg !406
  %conv1 = trunc i32 %and to i16, !dbg !405
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !407
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !408
  %conv2 = zext i16 %1 to i32, !dbg !408
  %cmp = icmp eq i32 %conv2, 0, !dbg !410
  br i1 %cmp, label %if.then, label %if.else8, !dbg !411

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !412
  %conv4 = sext i16 %2 to i32, !dbg !412
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !415
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !416

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !417
  br label %return, !dbg !417

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !419
  br label %return, !dbg !419

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !421
  %conv9 = sext i16 %3 to i32, !dbg !421
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !423
  %conv10 = sext i16 %4 to i32, !dbg !423
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !424
  %conv11 = zext i16 %5 to i32, !dbg !424
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !425
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !425
  %div = sdiv i32 %conv10, %conv11, !dbg !425, !klee.check.div !117
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !426
  %conv12 = zext i16 %6 to i32, !dbg !426
  %mul = mul nsw i32 %div, %conv12, !dbg !427
  %sub = sub nsw i32 %conv9, %mul, !dbg !428
  %shl = shl i32 %sub, 1, !dbg !429
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !430
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !431
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !432
  %conv13 = zext i16 %8 to i32, !dbg !432
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !433
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !433
  %div14 = sdiv i32 %7, %conv13, !dbg !433, !klee.check.div !117
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !434
  %conv15 = sext i16 %9 to i32, !dbg !434
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !435
  %conv16 = zext i16 %10 to i32, !dbg !435
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !436
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !436
  %div17 = sdiv i32 %conv15, %conv16, !dbg !436, !klee.check.div !117
  %add = add nsw i32 %div14, %div17, !dbg !437
  store i32 %add, i32* %s32Temp1, align 4, !dbg !438
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !439
  %conv18 = trunc i32 %11 to i16, !dbg !439
  store i16 %conv18, i16* %retval, align 2, !dbg !440
  br label %return, !dbg !440

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !441
  ret i16 %12, !dbg !441
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !442 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !445, metadata !DIExpression()), !dbg !446
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !447, metadata !DIExpression()), !dbg !448
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !449, metadata !DIExpression()), !dbg !454
  store i32 0, i32* %u32Temp1, align 4, !dbg !454
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !455, metadata !DIExpression()), !dbg !456
  store i32 0, i32* %u32Temp2, align 4, !dbg !456
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !457, metadata !DIExpression()), !dbg !458
  store i32 0, i32* %u32Temp3, align 4, !dbg !458
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !459
  %conv = zext i16 %0 to i32, !dbg !459
  %cmp = icmp eq i32 %conv, 0, !dbg !461
  br i1 %cmp, label %if.then, label %if.else, !dbg !462

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !463
  br label %return, !dbg !463

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !465
  %conv2 = zext i16 %1 to i32, !dbg !465
  %shl = shl i32 %conv2, 16, !dbg !467
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !468
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !469
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !470
  %conv3 = zext i16 %3 to i32, !dbg !470
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !471
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !471
  %div = udiv i32 %2, %conv3, !dbg !471, !klee.check.div !117
  store i32 %div, i32* %u32Temp2, align 4, !dbg !472
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !473
  %add = add i32 %4, 128, !dbg !474
  %shr = lshr i32 %add, 8, !dbg !475
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !476
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !477
  %cmp4 = icmp ult i32 %5, 255, !dbg !479
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !480

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !481
  %conv7 = trunc i32 %6 to i8, !dbg !483
  store i8 %conv7, i8* %retval, align 1, !dbg !484
  br label %return, !dbg !484

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !485
  br label %return, !dbg !485

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !487
  ret i8 %7, !dbg !487
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !488 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !491, metadata !DIExpression()), !dbg !492
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !493, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !495, metadata !DIExpression()), !dbg !496
  store i32 0, i32* %s32Temp1, align 4, !dbg !496
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !497
  %conv = zext i16 %0 to i32, !dbg !497
  %and = and i32 %conv, 65535, !dbg !498
  %conv1 = trunc i32 %and to i16, !dbg !497
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !499
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !500
  %conv2 = zext i16 %1 to i32, !dbg !500
  %and3 = and i32 %conv2, 65535, !dbg !502
  %cmp = icmp eq i32 %and3, 0, !dbg !503
  br i1 %cmp, label %if.then, label %if.else8, !dbg !504

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !505
  %cmp5 = icmp sge i32 %2, 0, !dbg !508
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !509

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !510
  br label %return, !dbg !510

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !512
  br label %return, !dbg !512

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !514
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !516
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !517
  %conv9 = zext i16 %5 to i32, !dbg !517
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !518
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !518
  %div = sdiv i32 %4, %conv9, !dbg !518, !klee.check.div !117
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !519
  %conv10 = zext i16 %6 to i32, !dbg !519
  %mul = mul nsw i32 %div, %conv10, !dbg !520
  %sub = sub nsw i32 %3, %mul, !dbg !521
  %shl = shl i32 %sub, 1, !dbg !522
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !523
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !524
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !525
  %conv11 = zext i16 %8 to i32, !dbg !525
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !526
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !526
  %div12 = sdiv i32 %7, %conv11, !dbg !526, !klee.check.div !117
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !527
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !528
  %conv13 = zext i16 %10 to i32, !dbg !528
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !529
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !529
  %div14 = sdiv i32 %9, %conv13, !dbg !529, !klee.check.div !117
  %add = add nsw i32 %div12, %div14, !dbg !530
  store i32 %add, i32* %s32Temp1, align 4, !dbg !531
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !532
  %cmp15 = icmp slt i32 %11, 65535, !dbg !534
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !535

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !536
  %cmp18 = icmp sgt i32 %12, 0, !dbg !539
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !540

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !541
  %conv21 = trunc i32 %13 to i16, !dbg !543
  store i16 %conv21, i16* %retval, align 2, !dbg !544
  br label %return, !dbg !544

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !545
  br label %return, !dbg !545

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !547
  br label %return, !dbg !547

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !549
  ret i16 %14, !dbg !549
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !550 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !553, metadata !DIExpression()), !dbg !554
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !555, metadata !DIExpression()), !dbg !556
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !557, metadata !DIExpression()), !dbg !558
  store i32 0, i32* %u32Temp, align 4, !dbg !558
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !559
  %conv = zext i16 %0 to i32, !dbg !559
  %cmp = icmp eq i32 %conv, 0, !dbg !561
  br i1 %cmp, label %if.then, label %if.else, !dbg !562

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !563
  br label %return, !dbg !563

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !565
  %conv2 = zext i16 %1 to i32, !dbg !565
  %shl = shl i32 %conv2, 16, !dbg !567
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !568
  %conv3 = zext i16 %2 to i32, !dbg !568
  %shr = ashr i32 %conv3, 1, !dbg !569
  %add = add nsw i32 %shl, %shr, !dbg !570
  store i32 %add, i32* %u32Temp, align 4, !dbg !571
  %3 = load i32, i32* %u32Temp, align 4, !dbg !572
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !573
  %conv4 = zext i16 %4 to i32, !dbg !573
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !574
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !574
  %div = udiv i32 %3, %conv4, !dbg !574, !klee.check.div !117
  store i32 %div, i32* %u32Temp, align 4, !dbg !575
  %5 = load i32, i32* %u32Temp, align 4, !dbg !576
  %cmp5 = icmp ult i32 %5, 65535, !dbg !578
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !579

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !580
  %and = and i32 %6, 65535, !dbg !582
  %conv8 = trunc i32 %and to i16, !dbg !580
  store i16 %conv8, i16* %retval, align 2, !dbg !583
  br label %return, !dbg !583

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !584
  br label %return, !dbg !584

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !586
  ret i16 %7, !dbg !586
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !587 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !590, metadata !DIExpression()), !dbg !591
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !592, metadata !DIExpression()), !dbg !593
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !594, metadata !DIExpression()), !dbg !595
  store i32 0, i32* %u32Temp1, align 4, !dbg !595
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !596, metadata !DIExpression()), !dbg !597
  store i32 0, i32* %u32Temp2, align 4, !dbg !597
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !598
  %conv = zext i16 %0 to i32, !dbg !598
  %and = and i32 %conv, 65535, !dbg !599
  %conv1 = trunc i32 %and to i16, !dbg !598
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !600
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !601
  %conv2 = zext i16 %1 to i32, !dbg !601
  %cmp = icmp eq i32 %conv2, 0, !dbg !603
  br i1 %cmp, label %if.then, label %if.else, !dbg !604

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !605
  br label %return, !dbg !605

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !607
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !609
  %conv4 = zext i16 %3 to i32, !dbg !609
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !610
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !610
  %div = udiv i32 %2, %conv4, !dbg !610, !klee.check.div !117
  store i32 %div, i32* %u32Temp1, align 4, !dbg !611
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !612
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !613
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !614
  %conv5 = zext i16 %6 to i32, !dbg !614
  %mul = mul i32 %5, %conv5, !dbg !615
  %sub = sub i32 %4, %mul, !dbg !616
  %shl = shl i32 %sub, 1, !dbg !617
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !618
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !619
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !620
  %conv6 = zext i16 %8 to i32, !dbg !620
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !621
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !621
  %div7 = udiv i32 %7, %conv6, !dbg !621, !klee.check.div !117
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !622
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !623
  %conv8 = zext i16 %10 to i32, !dbg !623
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !624
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !624
  %div9 = udiv i32 %9, %conv8, !dbg !624, !klee.check.div !117
  %add = add i32 %div7, %div9, !dbg !625
  store i32 %add, i32* %u32Temp2, align 4, !dbg !626
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !627
  %cmp10 = icmp ult i32 %11, 65535, !dbg !629
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !630

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !631
  %and13 = and i32 %12, 65535, !dbg !633
  %conv14 = trunc i32 %and13 to i16, !dbg !631
  store i16 %conv14, i16* %retval, align 2, !dbg !634
  br label %return, !dbg !634

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !635
  br label %return, !dbg !635

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !637
  ret i16 %13, !dbg !637
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !638 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !641, metadata !DIExpression()), !dbg !642
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !643, metadata !DIExpression()), !dbg !644
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !645, metadata !DIExpression()), !dbg !646
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !647, metadata !DIExpression()), !dbg !648
  store i32 0, i32* %s32Result, align 4, !dbg !648
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !649, metadata !DIExpression()), !dbg !650
  store i32 0, i32* %s32Temp1, align 4, !dbg !650
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !651
  %conv = sext i16 %0 to i32, !dbg !651
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !652
  %conv1 = zext i16 %1 to i32, !dbg !652
  %mul = mul nsw i32 %conv, %conv1, !dbg !653
  store i32 %mul, i32* %s32Result, align 4, !dbg !654
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !655
  %conv2 = sext i16 %2 to i32, !dbg !655
  %cmp = icmp eq i32 %conv2, 0, !dbg !657
  br i1 %cmp, label %if.then, label %if.else7, !dbg !658

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !659
  %cmp4 = icmp slt i32 %3, 0, !dbg !662
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !663

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !664
  br label %return, !dbg !664

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !666
  br label %return, !dbg !666

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !668
  %5 = load i32, i32* %s32Result, align 4, !dbg !670
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !671
  %conv8 = sext i16 %6 to i32, !dbg !671
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !672
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !672
  %div = sdiv i32 %5, %conv8, !dbg !672, !klee.check.div !117
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !673
  %conv9 = sext i16 %7 to i32, !dbg !673
  %mul10 = mul nsw i32 %div, %conv9, !dbg !674
  %sub = sub nsw i32 %4, %mul10, !dbg !675
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !676
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !677
  %shl = shl i32 %8, 1, !dbg !678
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !679
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !680
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !681
  %conv11 = sext i16 %10 to i32, !dbg !681
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !682
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !682
  %div12 = sdiv i32 %9, %conv11, !dbg !682, !klee.check.div !117
  %11 = load i32, i32* %s32Result, align 4, !dbg !683
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !684
  %conv13 = sext i16 %12 to i32, !dbg !684
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !685
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !685
  %div14 = sdiv i32 %11, %conv13, !dbg !685, !klee.check.div !117
  %add = add nsw i32 %div12, %div14, !dbg !686
  store i32 %add, i32* %s32Result, align 4, !dbg !687
  %13 = load i32, i32* %s32Result, align 4, !dbg !688
  %cmp15 = icmp slt i32 %13, 32767, !dbg !690
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !691

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !692
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !695
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !696

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !697
  %conv21 = trunc i32 %15 to i16, !dbg !699
  store i16 %conv21, i16* %retval, align 2, !dbg !700
  br label %return, !dbg !700

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !701
  br label %return, !dbg !701

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !703
  br label %return, !dbg !703

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !705
  ret i16 %16, !dbg !705
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !706 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !709, metadata !DIExpression()), !dbg !710
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !711, metadata !DIExpression()), !dbg !712
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !713, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !715, metadata !DIExpression()), !dbg !716
  store i32 0, i32* %s32Result, align 4, !dbg !716
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !717, metadata !DIExpression()), !dbg !718
  store i32 0, i32* %s32Temp1, align 4, !dbg !718
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !719
  %conv = zext i16 %0 to i32, !dbg !719
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !720
  %conv1 = sext i16 %1 to i32, !dbg !720
  %mul = mul nsw i32 %conv, %conv1, !dbg !721
  store i32 %mul, i32* %s32Result, align 4, !dbg !722
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !723
  %conv2 = zext i16 %2 to i32, !dbg !723
  %cmp = icmp eq i32 %conv2, 0, !dbg !725
  br i1 %cmp, label %if.then, label %if.else7, !dbg !726

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !727
  %cmp4 = icmp slt i32 %3, 0, !dbg !730
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !731

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !732
  br label %return, !dbg !732

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !734
  br label %return, !dbg !734

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !736
  %5 = load i32, i32* %s32Result, align 4, !dbg !738
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !739
  %conv8 = zext i16 %6 to i32, !dbg !739
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !740
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !740
  %div = sdiv i32 %5, %conv8, !dbg !740, !klee.check.div !117
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !741
  %conv9 = zext i16 %7 to i32, !dbg !741
  %mul10 = mul nsw i32 %div, %conv9, !dbg !742
  %sub = sub nsw i32 %4, %mul10, !dbg !743
  %shl = shl i32 %sub, 1, !dbg !744
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !745
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !746
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !747
  %conv11 = zext i16 %9 to i32, !dbg !747
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !748
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !748
  %div12 = sdiv i32 %8, %conv11, !dbg !748, !klee.check.div !117
  %10 = load i32, i32* %s32Result, align 4, !dbg !749
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !750
  %conv13 = zext i16 %11 to i32, !dbg !750
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !751
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !751
  %div14 = sdiv i32 %10, %conv13, !dbg !751, !klee.check.div !117
  %add = add nsw i32 %div12, %div14, !dbg !752
  store i32 %add, i32* %s32Result, align 4, !dbg !753
  %12 = load i32, i32* %s32Result, align 4, !dbg !754
  %cmp15 = icmp slt i32 %12, 32767, !dbg !756
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !757

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !758
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !761
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !762

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !763
  %conv21 = trunc i32 %14 to i16, !dbg !765
  store i16 %conv21, i16* %retval, align 2, !dbg !766
  br label %return, !dbg !766

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !767
  br label %return, !dbg !767

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !769
  br label %return, !dbg !769

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !771
  ret i16 %15, !dbg !771
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !772 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !775, metadata !DIExpression()), !dbg !776
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !777, metadata !DIExpression()), !dbg !778
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !779, metadata !DIExpression()), !dbg !780
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !781, metadata !DIExpression()), !dbg !782
  store i32 0, i32* %u32Result, align 4, !dbg !782
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !783, metadata !DIExpression()), !dbg !784
  store i32 0, i32* %u32Temp1, align 4, !dbg !784
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !785, metadata !DIExpression()), !dbg !786
  store i32 0, i32* %s32Result, align 4, !dbg !786
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !787, metadata !DIExpression()), !dbg !788
  store i32 0, i32* %s32Temp1, align 4, !dbg !788
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !789
  %conv = sext i16 %0 to i32, !dbg !789
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !790
  %conv1 = zext i16 %1 to i32, !dbg !790
  %mul = mul nsw i32 %conv, %conv1, !dbg !791
  store i32 %mul, i32* %s32Result, align 4, !dbg !792
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !793
  %conv2 = sext i16 %2 to i32, !dbg !793
  %cmp = icmp eq i32 %conv2, 0, !dbg !795
  br i1 %cmp, label %if.then, label %if.else7, !dbg !796

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !797
  %cmp4 = icmp sge i32 %3, 0, !dbg !800
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !801

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !802
  br label %return, !dbg !802

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !804
  br label %return, !dbg !804

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !806
  %5 = load i32, i32* %s32Result, align 4, !dbg !808
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !809
  %conv8 = sext i16 %6 to i32, !dbg !809
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !810
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !810
  %div = sdiv i32 %5, %conv8, !dbg !810, !klee.check.div !117
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv9 = sext i16 %7 to i32, !dbg !811
  %mul10 = mul nsw i32 %div, %conv9, !dbg !812
  %sub = sub nsw i32 %4, %mul10, !dbg !813
  %shl = shl i32 %sub, 1, !dbg !814
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !815
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !816
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !817
  %conv11 = sext i16 %9 to i32, !dbg !817
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !818
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !818
  %div12 = sdiv i32 %8, %conv11, !dbg !818, !klee.check.div !117
  %10 = load i32, i32* %s32Result, align 4, !dbg !819
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !820
  %conv13 = sext i16 %11 to i32, !dbg !820
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !821
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !821
  %div14 = sdiv i32 %10, %conv13, !dbg !821, !klee.check.div !117
  %add = add nsw i32 %div12, %div14, !dbg !822
  store i32 %add, i32* %s32Result, align 4, !dbg !823
  %12 = load i32, i32* %s32Result, align 4, !dbg !824
  %cmp15 = icmp slt i32 %12, 65535, !dbg !826
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !827

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !828
  %cmp18 = icmp sgt i32 %13, 0, !dbg !831
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !832

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !833
  %conv21 = trunc i32 %14 to i16, !dbg !835
  store i16 %conv21, i16* %retval, align 2, !dbg !836
  br label %return, !dbg !836

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !837
  br label %return, !dbg !837

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !839
  br label %return, !dbg !839

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !841
  ret i16 %15, !dbg !841
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !842 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !845, metadata !DIExpression()), !dbg !846
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !847, metadata !DIExpression()), !dbg !848
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !849, metadata !DIExpression()), !dbg !850
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !851, metadata !DIExpression()), !dbg !852
  store i32 0, i32* %s32Result, align 4, !dbg !852
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !853, metadata !DIExpression()), !dbg !854
  store i32 0, i32* %s32Temp1, align 4, !dbg !854
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !855
  %conv = sext i16 %0 to i32, !dbg !855
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !856
  %conv1 = zext i16 %1 to i32, !dbg !856
  %mul = mul nsw i32 %conv, %conv1, !dbg !857
  store i32 %mul, i32* %s32Result, align 4, !dbg !858
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !859
  %conv2 = zext i16 %2 to i32, !dbg !859
  %cmp = icmp eq i32 %conv2, 0, !dbg !861
  br i1 %cmp, label %if.then, label %if.else7, !dbg !862

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !863
  %cmp4 = icmp sge i32 %3, 0, !dbg !866
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !867

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !868
  br label %return, !dbg !868

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !870
  br label %return, !dbg !870

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !872
  %5 = load i32, i32* %s32Result, align 4, !dbg !874
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !875
  %conv8 = zext i16 %6 to i32, !dbg !875
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !876
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !876
  %div = sdiv i32 %5, %conv8, !dbg !876, !klee.check.div !117
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !877
  %conv9 = zext i16 %7 to i32, !dbg !877
  %mul10 = mul nsw i32 %div, %conv9, !dbg !878
  %sub = sub nsw i32 %4, %mul10, !dbg !879
  %shl = shl i32 %sub, 1, !dbg !880
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !881
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !882
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !883
  %conv11 = zext i16 %9 to i32, !dbg !883
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !884
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !884
  %div12 = sdiv i32 %8, %conv11, !dbg !884, !klee.check.div !117
  %10 = load i32, i32* %s32Result, align 4, !dbg !885
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !886
  %conv13 = zext i16 %11 to i32, !dbg !886
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !887
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !887
  %div14 = sdiv i32 %10, %conv13, !dbg !887, !klee.check.div !117
  %add = add nsw i32 %div12, %div14, !dbg !888
  store i32 %add, i32* %s32Result, align 4, !dbg !889
  %12 = load i32, i32* %s32Result, align 4, !dbg !890
  %cmp15 = icmp slt i32 %12, 65535, !dbg !892
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !893

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !894
  %cmp18 = icmp sgt i32 %13, 0, !dbg !897
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !898

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !899
  %conv21 = trunc i32 %14 to i16, !dbg !901
  store i16 %conv21, i16* %retval, align 2, !dbg !902
  br label %return, !dbg !902

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !903
  br label %return, !dbg !903

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !905
  br label %return, !dbg !905

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !907
  ret i16 %15, !dbg !907
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !908 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !911, metadata !DIExpression()), !dbg !912
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !913, metadata !DIExpression()), !dbg !914
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !915, metadata !DIExpression()), !dbg !916
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !917, metadata !DIExpression()), !dbg !918
  store i32 0, i32* %u32Temp1, align 4, !dbg !918
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !919, metadata !DIExpression()), !dbg !920
  store i16 0, i16* %u16TempDenom, align 2, !dbg !920
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !921
  %conv = zext i16 %0 to i32, !dbg !921
  %cmp = icmp eq i32 %conv, 0, !dbg !923
  br i1 %cmp, label %if.then, label %if.else, !dbg !924

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !925
  br label %return, !dbg !925

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !927
  %conv2 = zext i16 %1 to i32, !dbg !927
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !929
  %conv3 = zext i16 %2 to i32, !dbg !929
  %mul = mul nsw i32 %conv2, %conv3, !dbg !930
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !931
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !932
  %conv4 = zext i16 %3 to i32, !dbg !932
  %shr = ashr i32 %conv4, 1, !dbg !933
  %conv5 = trunc i32 %shr to i16, !dbg !932
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !934
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !935
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !936
  %conv6 = zext i16 %5 to i32, !dbg !936
  %add = add i32 %4, %conv6, !dbg !937
  store i32 %add, i32* %u32Temp1, align 4, !dbg !938
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !939
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !940
  %conv7 = zext i16 %7 to i32, !dbg !940
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !941
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !941
  %div = udiv i32 %6, %conv7, !dbg !941, !klee.check.div !117
  store i32 %div, i32* %u32Temp1, align 4, !dbg !942
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !943
  %cmp8 = icmp ult i32 %8, 65535, !dbg !945
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !946

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !947
  %and = and i32 %9, 65535, !dbg !949
  %conv11 = trunc i32 %and to i16, !dbg !950
  store i16 %conv11, i16* %retval, align 2, !dbg !951
  br label %return, !dbg !951

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !952
  br label %return, !dbg !952

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !954
  ret i16 %10, !dbg !954
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !955 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !958, metadata !DIExpression()), !dbg !959
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !960, metadata !DIExpression()), !dbg !961
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !962, metadata !DIExpression()), !dbg !963
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !964, metadata !DIExpression()), !dbg !965
  store i32 0, i32* %u32Temp1, align 4, !dbg !965
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !966
  %cmp = icmp eq i32 %0, 0, !dbg !968
  br i1 %cmp, label %if.then, label %if.else, !dbg !969

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !970
  br label %return, !dbg !970

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !972
  %conv = zext i16 %1 to i32, !dbg !972
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !974
  %conv1 = zext i16 %2 to i32, !dbg !974
  %mul = mul nsw i32 %conv, %conv1, !dbg !975
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !976
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !977
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !977
  %div = udiv i32 %mul, %3, !dbg !977, !klee.check.div !117
  store i32 %div, i32* %u32Temp1, align 4, !dbg !978
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !979
  %conv2 = zext i16 %4 to i32, !dbg !979
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !981
  %conv3 = zext i16 %5 to i32, !dbg !981
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !982
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !983
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !984
  %mul5 = mul i32 %6, %7, !dbg !985
  %sub = sub i32 %mul4, %mul5, !dbg !986
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !987
  %div6 = udiv i32 %8, 2, !dbg !988
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !989
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !990

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !991
  %inc = add i32 %9, 1, !dbg !991
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !991
  br label %if.end, !dbg !993

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !994
  %cmp10 = icmp ult i32 %10, 65535, !dbg !996
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !997

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !998
  %and = and i32 %11, 65535, !dbg !1000
  %conv13 = trunc i32 %and to i16, !dbg !1001
  store i16 %conv13, i16* %retval, align 2, !dbg !1002
  br label %return, !dbg !1002

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1003
  br label %return, !dbg !1003

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1005
  ret i16 %12, !dbg !1005
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1006 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1009, metadata !DIExpression()), !dbg !1010
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1011, metadata !DIExpression()), !dbg !1012
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1013, metadata !DIExpression()), !dbg !1014
  store i32 0, i32* %u32Temp1, align 4, !dbg !1014
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1015
  %conv = zext i16 %0 to i32, !dbg !1015
  %cmp = icmp eq i32 %conv, 0, !dbg !1017
  br i1 %cmp, label %if.then, label %if.else, !dbg !1018

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1019
  br label %return, !dbg !1019

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1021
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1023
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1024
  %conv2 = zext i16 %3 to i32, !dbg !1024
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1025
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1025
  %div = udiv i32 %2, %conv2, !dbg !1025, !klee.check.div !117
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1026
  %conv3 = zext i16 %4 to i32, !dbg !1026
  %mul = mul i32 %div, %conv3, !dbg !1027
  %sub = sub i32 %1, %mul, !dbg !1028
  %shl = shl i32 %sub, 1, !dbg !1029
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1030
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1031
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1032
  %conv4 = zext i16 %6 to i32, !dbg !1032
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1033
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1033
  %div5 = udiv i32 %5, %conv4, !dbg !1033, !klee.check.div !117
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1034
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1035
  %conv6 = zext i16 %8 to i32, !dbg !1035
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1036
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1036
  %div7 = udiv i32 %7, %conv6, !dbg !1036, !klee.check.div !117
  %add = add i32 %div5, %div7, !dbg !1037
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1038
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1039
  store i32 %9, i32* %retval, align 4, !dbg !1040
  br label %return, !dbg !1040

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1041
  ret i32 %10, !dbg !1041
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1042 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1045, metadata !DIExpression()), !dbg !1046
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i32 0, i32* %s32Temp1, align 4, !dbg !1052
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1053, metadata !DIExpression()), !dbg !1054
  store i32 0, i32* %s32Temp2, align 4, !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i32 0, i32* %s32Temp3, align 4, !dbg !1056
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1057
  %conv = sext i16 %0 to i32, !dbg !1057
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1058
  %conv1 = sext i16 %1 to i32, !dbg !1058
  %mul = mul nsw i32 %conv, %conv1, !dbg !1059
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1060
  %2 = load i16, i16* %div.addr, align 2, !dbg !1061
  %conv2 = sext i16 %2 to i32, !dbg !1061
  %cmp = icmp eq i32 %conv2, 0, !dbg !1063
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1064

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1065
  %cmp4 = icmp slt i32 %3, 0, !dbg !1068
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1069

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1070
  br label %return, !dbg !1070

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1074
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1076
  %6 = load i16, i16* %div.addr, align 2, !dbg !1077
  %conv8 = sext i16 %6 to i32, !dbg !1077
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1078
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1078
  %div9 = sdiv i32 %5, %conv8, !dbg !1078, !klee.check.div !117
  %7 = load i16, i16* %div.addr, align 2, !dbg !1079
  %conv10 = sext i16 %7 to i32, !dbg !1079
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1080
  %sub = sub nsw i32 %4, %mul11, !dbg !1081
  %shl = shl i32 %sub, 1, !dbg !1082
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1083
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1084
  %9 = load i16, i16* %div.addr, align 2, !dbg !1085
  %conv12 = sext i16 %9 to i32, !dbg !1085
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1086
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1086
  %div13 = sdiv i32 %8, %conv12, !dbg !1086, !klee.check.div !117
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1087
  %11 = load i16, i16* %div.addr, align 2, !dbg !1088
  %conv14 = sext i16 %11 to i32, !dbg !1088
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1089
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1089
  %div15 = sdiv i32 %10, %conv14, !dbg !1089, !klee.check.div !117
  %add = add nsw i32 %div13, %div15, !dbg !1090
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1091
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1092
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1094
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1095

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1096
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1099
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1100

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1101
  %conv22 = trunc i32 %14 to i16, !dbg !1103
  store i16 %conv22, i16* %retval, align 2, !dbg !1104
  br label %return, !dbg !1104

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1105
  br label %return, !dbg !1105

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1107
  br label %return, !dbg !1107

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1109
  ret i16 %15, !dbg !1109
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1110 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1113, metadata !DIExpression()), !dbg !1114
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1115, metadata !DIExpression()), !dbg !1116
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1117, metadata !DIExpression()), !dbg !1118
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1119, metadata !DIExpression()), !dbg !1120
  store i32 0, i32* %s32Result, align 4, !dbg !1120
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i32 0, i32* %s32Temp1, align 4, !dbg !1122
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1123
  %conv = sext i16 %0 to i32, !dbg !1123
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1124
  %conv1 = sext i16 %1 to i32, !dbg !1124
  %mul = mul nsw i32 %conv, %conv1, !dbg !1125
  store i32 %mul, i32* %s32Result, align 4, !dbg !1126
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1127
  %conv2 = zext i16 %2 to i32, !dbg !1127
  %cmp = icmp eq i32 %conv2, 0, !dbg !1129
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1130

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1131
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1134
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1135

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1136
  br label %return, !dbg !1136

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1138
  %cmp7 = icmp eq i32 %4, 0, !dbg !1140
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1141

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1142
  br label %return, !dbg !1142

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1144
  br label %return, !dbg !1144

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1146
  %6 = load i32, i32* %s32Result, align 4, !dbg !1148
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1149
  %conv12 = zext i16 %7 to i32, !dbg !1149
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1150
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1150
  %div = sdiv i32 %6, %conv12, !dbg !1150, !klee.check.div !117
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1151
  %conv13 = zext i16 %8 to i32, !dbg !1151
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1152
  %sub = sub nsw i32 %5, %mul14, !dbg !1153
  %shl = shl i32 %sub, 1, !dbg !1154
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1155
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1156
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1157
  %conv15 = zext i16 %10 to i32, !dbg !1157
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1158
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1158
  %div16 = sdiv i32 %9, %conv15, !dbg !1158, !klee.check.div !117
  %11 = load i32, i32* %s32Result, align 4, !dbg !1159
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1160
  %conv17 = zext i16 %12 to i32, !dbg !1160
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1161
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1161
  %div18 = sdiv i32 %11, %conv17, !dbg !1161, !klee.check.div !117
  %add = add nsw i32 %div16, %div18, !dbg !1162
  store i32 %add, i32* %s32Result, align 4, !dbg !1163
  %13 = load i32, i32* %s32Result, align 4, !dbg !1164
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1166
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1167

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1168
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1171
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1172

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1173
  %conv25 = trunc i32 %15 to i16, !dbg !1175
  store i16 %conv25, i16* %retval, align 2, !dbg !1176
  br label %return, !dbg !1176

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1177
  br label %return, !dbg !1177

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1179
  br label %return, !dbg !1179

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1181
  ret i16 %16, !dbg !1181
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1182 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1185, metadata !DIExpression()), !dbg !1186
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1187, metadata !DIExpression()), !dbg !1188
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1189, metadata !DIExpression()), !dbg !1190
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1191
  %cmp = icmp eq i32 %0, 0, !dbg !1193
  br i1 %cmp, label %if.then, label %if.else, !dbg !1194

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1195
  br label %return, !dbg !1195

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1197
  %cmp1 = icmp sle i32 %1, 0, !dbg !1200
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1201

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1202
  br label %return, !dbg !1202

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1204
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1206
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1207
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1208
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1208
  %div = udiv i32 %3, %4, !dbg !1208, !klee.check.div !117
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1209
  %mul = mul i32 %div, %5, !dbg !1210
  %sub = sub i32 %2, %mul, !dbg !1211
  %shl = shl i32 %sub, 1, !dbg !1212
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1213
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1214
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1215
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1216
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1216
  %div4 = udiv i32 %6, %7, !dbg !1216, !klee.check.div !117
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1217
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1218
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1219
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1219
  %div5 = udiv i32 %8, %9, !dbg !1219, !klee.check.div !117
  %add = add i32 %div4, %div5, !dbg !1220
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1221
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1222
  store i32 %10, i32* %retval, align 4, !dbg !1223
  br label %return, !dbg !1223

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1224
  ret i32 %11, !dbg !1224
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1225 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1228, metadata !DIExpression()), !dbg !1229
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1230, metadata !DIExpression()), !dbg !1231
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1232, metadata !DIExpression()), !dbg !1233
  store i32 0, i32* %s32Temp1, align 4, !dbg !1233
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1234
  %cmp = icmp eq i32 %0, 0, !dbg !1236
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1237

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1238
  %cmp1 = icmp sge i32 %1, 0, !dbg !1241
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1242

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1243
  br label %return, !dbg !1243

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1245
  br label %return, !dbg !1245

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1247
  %cmp4 = icmp sge i32 %2, 0, !dbg !1250
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1251

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1252
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1254
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1255
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1256
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1256
  %div = udiv i32 %4, %5, !dbg !1256, !klee.check.div !117
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1257
  %mul = mul i32 %div, %6, !dbg !1258
  %sub = sub i32 %3, %mul, !dbg !1259
  %shl = shl i32 %sub, 1, !dbg !1260
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1261
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1262
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1263
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1264
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1264
  %div6 = udiv i32 %7, %8, !dbg !1264, !klee.check.div !117
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1265
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1266
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1267
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1267
  %div7 = udiv i32 %9, %10, !dbg !1267, !klee.check.div !117
  %add = add i32 %div6, %div7, !dbg !1268
  store i32 %add, i32* %retval, align 4, !dbg !1269
  br label %return, !dbg !1269

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1270
  br label %return, !dbg !1270

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1272
  ret i32 %11, !dbg !1272
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1273 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1276, metadata !DIExpression()), !dbg !1277
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1278, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1280, metadata !DIExpression()), !dbg !1281
  store i32 0, i32* %u32Temp1, align 4, !dbg !1281
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1282, metadata !DIExpression()), !dbg !1283
  store i32 0, i32* %u32Temp2, align 4, !dbg !1283
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1284
  %cmp = icmp eq i32 %0, 0, !dbg !1286
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1287

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1288
  %cmp1 = icmp slt i32 %1, 0, !dbg !1291
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1292

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1293
  br label %return, !dbg !1293

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1295
  br label %return, !dbg !1295

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1297
  %cmp4 = icmp sge i32 %2, 0, !dbg !1300
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1301

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1302
  %cmp6 = icmp eq i32 %3, 0, !dbg !1305
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1306

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1307
  br label %return, !dbg !1307

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1309
  %cmp9 = icmp sle i32 %4, 0, !dbg !1312
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1313

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1320
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1320
  %div = sdiv i32 %6, %7, !dbg !1320, !klee.check.div !117
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %mul = mul nsw i32 %div, %8, !dbg !1322
  %sub = sub nsw i32 %5, %mul, !dbg !1323
  %shl = shl i32 %sub, 1, !dbg !1324
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1325
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1326
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1328
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1328
  %div12 = udiv i32 %9, %10, !dbg !1328, !klee.check.div !117
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1329
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1330
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1331
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1331
  %div13 = sdiv i32 %11, %12, !dbg !1331, !klee.check.div !117
  %add = add i32 %div12, %div13, !dbg !1332
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1333
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1334
  store i32 %13, i32* %retval, align 4, !dbg !1335
  br label %return, !dbg !1335

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1336
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1339
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1340

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1341
  br label %return, !dbg !1341

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1343
  %sub18 = sub nsw i32 0, %15, !dbg !1345
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1346
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1347
  %sub19 = sub nsw i32 0, %16, !dbg !1348
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1349
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1350
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1351
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1352
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1353
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1353
  %div20 = sdiv i32 %18, %19, !dbg !1353, !klee.check.div !117
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1354
  %mul21 = mul nsw i32 %div20, %20, !dbg !1355
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1356
  %shl23 = shl i32 %sub22, 1, !dbg !1357
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1358
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1359
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1360
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1361
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1361
  %div24 = udiv i32 %21, %22, !dbg !1361, !klee.check.div !117
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1362
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1363
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1364
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1364
  %div25 = sdiv i32 %23, %24, !dbg !1364, !klee.check.div !117
  %add26 = add i32 %div24, %div25, !dbg !1365
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1366
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1367
  store i32 %25, i32* %retval, align 4, !dbg !1368
  br label %return, !dbg !1368

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1369
  ret i32 %26, !dbg !1369
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1370 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1373, metadata !DIExpression()), !dbg !1374
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1375, metadata !DIExpression()), !dbg !1376
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1377, metadata !DIExpression()), !dbg !1378
  store i32 0, i32* %u32Temp1, align 4, !dbg !1378
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1379, metadata !DIExpression()), !dbg !1380
  store i32 0, i32* %u32Temp2, align 4, !dbg !1380
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1381, metadata !DIExpression()), !dbg !1382
  store i32 0, i32* %u32Temp3, align 4, !dbg !1382
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1383, metadata !DIExpression()), !dbg !1384
  store i32 0, i32* %numerator_old, align 4, !dbg !1384
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %cmp = icmp eq i32 %0, 0, !dbg !1387
  br i1 %cmp, label %if.then, label %if.else, !dbg !1388

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1389
  br label %return, !dbg !1389

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1391
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1393
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1394
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1396
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1396
  %div = udiv i32 %3, %4, !dbg !1396, !klee.check.div !117
  %mul = mul i32 %2, %div, !dbg !1397
  %sub = sub i32 %1, %mul, !dbg !1398
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1399
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1400
  %and = and i32 %5, 1, !dbg !1402
  %cmp1 = icmp eq i32 %and, 0, !dbg !1403
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1404

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1405
  %shr = lshr i32 %6, 1, !dbg !1407
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1408
  br label %if.end, !dbg !1409

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1410
  %shr4 = lshr i32 %7, 1, !dbg !1412
  %add = add i32 %shr4, 1, !dbg !1413
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1414
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1415
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1417
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1418
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1419

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1420
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1422
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1423
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1423
  %div7 = udiv i32 %10, %11, !dbg !1423, !klee.check.div !117
  store i32 %div7, i32* %retval, align 4, !dbg !1424
  br label %return, !dbg !1424

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1425
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1428
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1428
  %div9 = udiv i32 %12, %13, !dbg !1428, !klee.check.div !117
  %add10 = add i32 %div9, 1, !dbg !1429
  store i32 %add10, i32* %retval, align 4, !dbg !1430
  br label %return, !dbg !1430

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1431
  ret i32 %14, !dbg !1431
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1432 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1435, metadata !DIExpression()), !dbg !1436
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1437, metadata !DIExpression()), !dbg !1438
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1439, metadata !DIExpression()), !dbg !1440
  store i32 0, i32* %u32Temp1, align 4, !dbg !1440
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1441, metadata !DIExpression()), !dbg !1442
  store i32 0, i32* %u32Temp2, align 4, !dbg !1442
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1443
  %cmp = icmp sle i32 %0, 0, !dbg !1445
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1446

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1447
  %cmp1 = icmp sge i32 %1, 0, !dbg !1450
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1451

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1452
  br label %return, !dbg !1452

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %sub = sub nsw i32 0, %2, !dbg !1456
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1457
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1458
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1459
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1460
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1461
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1461
  %div = udiv i32 %4, %5, !dbg !1461, !klee.check.div !117
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1462
  %mul = mul i32 %div, %6, !dbg !1463
  %sub3 = sub i32 %3, %mul, !dbg !1464
  %shl = shl i32 %sub3, 1, !dbg !1465
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1466
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1467
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1468
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1469
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1469
  %div4 = udiv i32 %7, %8, !dbg !1469, !klee.check.div !117
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1470
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1471
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1472
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1472
  %div5 = udiv i32 %9, %10, !dbg !1472, !klee.check.div !117
  %add = add i32 %div4, %div5, !dbg !1473
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1474
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1475
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1477
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1478

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1479
  %sub8 = sub i32 0, %12, !dbg !1481
  store i32 %sub8, i32* %retval, align 4, !dbg !1482
  br label %return, !dbg !1482

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1483
  br label %return, !dbg !1483

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1487
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1489
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1489
  %div11 = udiv i32 %14, %15, !dbg !1489, !klee.check.div !117
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %mul12 = mul i32 %div11, %16, !dbg !1491
  %sub13 = sub i32 %13, %mul12, !dbg !1492
  %shl14 = shl i32 %sub13, 1, !dbg !1493
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1494
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1495
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1497
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1497
  %div15 = udiv i32 %17, %18, !dbg !1497, !klee.check.div !117
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1498
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1499
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1500
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1500
  %div16 = udiv i32 %19, %20, !dbg !1500, !klee.check.div !117
  %add17 = add i32 %div15, %div16, !dbg !1501
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1502
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1503
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1505
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1506

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1507
  store i32 %22, i32* %retval, align 4, !dbg !1509
  br label %return, !dbg !1509

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1510
  br label %return, !dbg !1510

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1512
  ret i32 %23, !dbg !1512
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1513 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1516, metadata !DIExpression()), !dbg !1517
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1518, metadata !DIExpression()), !dbg !1519
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1520, metadata !DIExpression()), !dbg !1521
  store i32 0, i32* %s32Temp1, align 4, !dbg !1521
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1522, metadata !DIExpression()), !dbg !1523
  store i32 0, i32* %s32Temp2, align 4, !dbg !1523
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1524, metadata !DIExpression()), !dbg !1525
  store i32 0, i32* %u32Temp0, align 4, !dbg !1525
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 0, i32* %u32Temp1, align 4, !dbg !1527
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1528, metadata !DIExpression()), !dbg !1529
  store i32 0, i32* %u32Temp2, align 4, !dbg !1529
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1530
  %cmp = icmp eq i32 %0, 0, !dbg !1532
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1533

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1534
  %cmp1 = icmp slt i32 %1, 0, !dbg !1537
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1538

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1539
  br label %return, !dbg !1539

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1541
  br label %return, !dbg !1541

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1543
  %cmp4 = icmp sle i32 %2, 0, !dbg !1546
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1547

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1548
  %sub = sub nsw i32 0, %3, !dbg !1550
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1551
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1552
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1554
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1554
  %div = udiv i32 %4, %5, !dbg !1554, !klee.check.div !117
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1555
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1556
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1557
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1558
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1559
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1559
  %div6 = udiv i32 %7, %8, !dbg !1559, !klee.check.div !117
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1560
  %mul = mul i32 %div6, %9, !dbg !1561
  %sub7 = sub i32 %6, %mul, !dbg !1562
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1563
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1564
  %and = and i32 %10, 1, !dbg !1566
  %cmp8 = icmp eq i32 %and, 0, !dbg !1567
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1568

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1569
  %shr = lshr i32 %11, 1, !dbg !1571
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1572
  br label %if.end, !dbg !1573

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %shr11 = lshr i32 %12, 1, !dbg !1576
  %add = add i32 %shr11, 1, !dbg !1577
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1578
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1579
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %cmp12 = icmp ult i32 %13, %14, !dbg !1582
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1583

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1584
  %neg = xor i32 %15, -1, !dbg !1586
  %add14 = add i32 %neg, 1, !dbg !1587
  store i32 %add14, i32* %retval, align 4, !dbg !1588
  br label %return, !dbg !1588

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1589
  %add16 = add i32 %16, 1, !dbg !1591
  %neg17 = xor i32 %add16, -1, !dbg !1592
  %add18 = add i32 %neg17, 1, !dbg !1593
  store i32 %add18, i32* %retval, align 4, !dbg !1594
  br label %return, !dbg !1594

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1595
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1597
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1598
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1599
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1599
  %div20 = udiv i32 %18, %19, !dbg !1599, !klee.check.div !117
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1600
  %mul21 = mul i32 %div20, %20, !dbg !1601
  %sub22 = sub i32 %17, %mul21, !dbg !1602
  %shl = shl i32 %sub22, 1, !dbg !1603
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1604
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1605
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1607
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1607
  %div23 = udiv i32 %21, %22, !dbg !1607, !klee.check.div !117
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1608
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1609
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1610
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1610
  %div24 = udiv i32 %23, %24, !dbg !1610, !klee.check.div !117
  %add25 = add i32 %div23, %div24, !dbg !1611
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1612
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1613
  store i32 %25, i32* %retval, align 4, !dbg !1614
  br label %return, !dbg !1614

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1615
  ret i32 %26, !dbg !1615
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1616 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1619, metadata !DIExpression()), !dbg !1620
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1621, metadata !DIExpression()), !dbg !1622
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1623, metadata !DIExpression()), !dbg !1624
  store i32 0, i32* %s32Temp1, align 4, !dbg !1624
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1625, metadata !DIExpression()), !dbg !1626
  store i32 0, i32* %s32Temp2, align 4, !dbg !1626
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1627, metadata !DIExpression()), !dbg !1628
  store i32 0, i32* %denominator_prime, align 4, !dbg !1628
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1629, metadata !DIExpression()), !dbg !1630
  store i32 0, i32* %u32Temp1, align 4, !dbg !1630
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1631, metadata !DIExpression()), !dbg !1632
  store i32 0, i32* %u32Temp2, align 4, !dbg !1632
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1633, metadata !DIExpression()), !dbg !1634
  store i32 0, i32* %u32numerator, align 4, !dbg !1634
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1635, metadata !DIExpression()), !dbg !1636
  store i32 0, i32* %u32denominator, align 4, !dbg !1636
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1637
  %cmp = icmp slt i32 %0, 0, !dbg !1639
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1640

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1641
  %cmp1 = icmp sle i32 %1, 0, !dbg !1644
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1645

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1646
  %cmp3 = icmp sge i32 %2, 0, !dbg !1649
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1650

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1651
  br label %return, !dbg !1651

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1653
  %sub = sub nsw i32 0, %3, !dbg !1655
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1656
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1657
  %sub5 = sub nsw i32 0, %4, !dbg !1658
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1659
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1660
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1661
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1662
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1663
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1663
  %div = udiv i32 %6, %7, !dbg !1663, !klee.check.div !117
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1664
  %mul = mul i32 %div, %8, !dbg !1665
  %sub6 = sub i32 %5, %mul, !dbg !1666
  %shl = shl i32 %sub6, 1, !dbg !1667
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1668
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1669
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1670
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1671
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1671
  %div7 = udiv i32 %9, %10, !dbg !1671, !klee.check.div !117
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1672
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1673
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1674
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1674
  %div8 = udiv i32 %11, %12, !dbg !1674, !klee.check.div !117
  %add = add i32 %div7, %div8, !dbg !1675
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1676
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1677
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1679
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1680

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1681
  store i32 %14, i32* %retval, align 4, !dbg !1683
  br label %return, !dbg !1683

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1684
  br label %return, !dbg !1684

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %neg = xor i32 %15, -1, !dbg !1688
  %add13 = add nsw i32 %neg, 1, !dbg !1689
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1690
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1691
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1692
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1693
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1694
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1694
  %div14 = udiv i32 %17, %18, !dbg !1694, !klee.check.div !117
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1695
  %mul15 = mul i32 %div14, %19, !dbg !1696
  %sub16 = sub i32 %16, %mul15, !dbg !1697
  %shl17 = shl i32 %sub16, 1, !dbg !1698
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1699
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1700
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1702
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1702
  %div18 = udiv i32 %20, %21, !dbg !1702, !klee.check.div !117
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1703
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1704
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1705
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1705
  %div19 = sdiv i32 %22, %23, !dbg !1705, !klee.check.div !117
  %add20 = add i32 %div18, %div19, !dbg !1706
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1707
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1708
  %neg21 = xor i32 %24, -1, !dbg !1709
  %add22 = add nsw i32 %neg21, 1, !dbg !1710
  store i32 %add22, i32* %retval, align 4, !dbg !1711
  br label %return, !dbg !1711

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %cmp24 = icmp sle i32 %25, 0, !dbg !1715
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1716

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %cmp26 = icmp sge i32 %26, 0, !dbg !1720
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1721

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1722
  br label %return, !dbg !1722

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %neg29 = xor i32 %27, -1, !dbg !1726
  %add30 = add nsw i32 %neg29, 1, !dbg !1727
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1728
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1729
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1730
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1731
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1732
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1732
  %div31 = udiv i32 %29, %30, !dbg !1732, !klee.check.div !117
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %mul32 = mul i32 %div31, %31, !dbg !1734
  %sub33 = sub i32 %28, %mul32, !dbg !1735
  %shl34 = shl i32 %sub33, 1, !dbg !1736
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1737
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1738
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1739
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1740
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1740
  %div35 = udiv i32 %32, %33, !dbg !1740, !klee.check.div !117
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1741
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1742
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1743
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1743
  %div36 = udiv i32 %34, %35, !dbg !1743, !klee.check.div !117
  %add37 = add i32 %div35, %div36, !dbg !1744
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1745
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1746
  %neg38 = xor i32 %36, -1, !dbg !1747
  %add39 = add nsw i32 %neg38, 1, !dbg !1748
  store i32 %add39, i32* %retval, align 4, !dbg !1749
  br label %return, !dbg !1749

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1750
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1752
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1753
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1754
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1754
  %div41 = sdiv i32 %38, %39, !dbg !1754, !klee.check.div !117
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1755
  %mul42 = mul nsw i32 %div41, %40, !dbg !1756
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1757
  %shl44 = shl i32 %sub43, 1, !dbg !1758
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1759
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1760
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1761
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1762
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1762
  %div45 = sdiv i32 %41, %42, !dbg !1762, !klee.check.div !117
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1763
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1765
  %div46 = udiv i32 %43, %44, !dbg !1765, !klee.check.div !117
  %add47 = add i32 %div45, %div46, !dbg !1766
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1767
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1768
  store i32 %45, i32* %retval, align 4, !dbg !1769
  br label %return, !dbg !1769

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1770
  ret i32 %46, !dbg !1770
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1771 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1774, metadata !DIExpression()), !dbg !1775
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1776, metadata !DIExpression()), !dbg !1777
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1778, metadata !DIExpression()), !dbg !1779
  store i32 0, i32* %numerator_prime, align 4, !dbg !1779
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1780, metadata !DIExpression()), !dbg !1781
  store i32 0, i32* %u32Temp1, align 4, !dbg !1781
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1782, metadata !DIExpression()), !dbg !1783
  store i32 0, i32* %u32Temp2, align 4, !dbg !1783
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1784, metadata !DIExpression()), !dbg !1785
  store i32 0, i32* %u32Temp3, align 4, !dbg !1785
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1786, metadata !DIExpression()), !dbg !1787
  store i32 0, i32* %s32Temp1, align 4, !dbg !1787
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1788, metadata !DIExpression()), !dbg !1789
  store i32 0, i32* %s32Temp2, align 4, !dbg !1789
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1790, metadata !DIExpression()), !dbg !1791
  store i32 0, i32* %s32Temp3, align 4, !dbg !1791
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1792
  %cmp = icmp eq i32 %0, 0, !dbg !1794
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1795

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1796
  %cmp1 = icmp slt i32 %1, 0, !dbg !1799
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1800

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1801
  br label %return, !dbg !1801

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1803
  br label %return, !dbg !1803

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1805
  %cmp4 = icmp slt i32 %2, 0, !dbg !1808
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1809

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1810
  %sub = sub nsw i32 0, %3, !dbg !1812
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1813
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1814
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1815
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1816
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1816
  %div = udiv i32 %4, %5, !dbg !1816, !klee.check.div !117
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1817
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1818
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1819
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1820
  %mul = mul i32 %7, %8, !dbg !1821
  %sub6 = sub i32 %6, %mul, !dbg !1822
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1823
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %and = and i32 %9, 1, !dbg !1826
  %cmp7 = icmp eq i32 %and, 0, !dbg !1827
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1828

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1829
  %shr = lshr i32 %10, 1, !dbg !1831
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1832
  br label %if.end, !dbg !1833

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1834
  %shr10 = lshr i32 %11, 1, !dbg !1836
  %add = add i32 %shr10, 1, !dbg !1837
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1838
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1839
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %cmp11 = icmp ult i32 %12, %13, !dbg !1842
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1843

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1844
  %neg = xor i32 %14, -1, !dbg !1846
  %add13 = add i32 %neg, 1, !dbg !1847
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1848
  br label %if.end18, !dbg !1849

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1850
  %add15 = add i32 %15, 1, !dbg !1852
  %neg16 = xor i32 %add15, -1, !dbg !1853
  %add17 = add i32 %neg16, 1, !dbg !1854
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1855
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1856
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1858
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1859

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1860
  %conv = trunc i32 %17 to i16, !dbg !1862
  store i16 %conv, i16* %retval, align 2, !dbg !1863
  br label %return, !dbg !1863

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1864
  br label %return, !dbg !1864

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1866
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1868
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1869
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1869
  %div23 = udiv i32 %18, %19, !dbg !1869, !klee.check.div !117
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1870
  %mul24 = mul i32 %div23, %20, !dbg !1871
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1872
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1873
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1874
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1875
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1876
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1876
  %div25 = udiv i32 %22, %23, !dbg !1876, !klee.check.div !117
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1877
  %mul26 = mul i32 %div25, %24, !dbg !1878
  %sub27 = sub i32 %21, %mul26, !dbg !1879
  %shl = shl i32 %sub27, 1, !dbg !1880
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1881
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1882
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1884
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1884
  %div28 = udiv i32 %25, %26, !dbg !1884, !klee.check.div !117
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1885
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1886
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1887
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1887
  %div29 = udiv i32 %27, %28, !dbg !1887, !klee.check.div !117
  %add30 = add i32 %div28, %div29, !dbg !1888
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1889
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1890
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1892
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1893

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1894
  %conv34 = trunc i32 %30 to i16, !dbg !1896
  store i16 %conv34, i16* %retval, align 2, !dbg !1897
  br label %return, !dbg !1897

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1898
  br label %return, !dbg !1898

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1900
  ret i16 %31, !dbg !1900
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1901 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1907, metadata !DIExpression()), !dbg !1908
  %2 = icmp eq i64 %0, 0, !dbg !1909
  br i1 %2, label %3, label %4, !dbg !1911

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1912
  unreachable, !dbg !1912

4:                                                ; preds = %1
  ret void, !dbg !1913
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

!llvm.dbg.cu = !{!32, !2, !34}
!llvm.ident = !{!36, !36, !37}
!llvm.module.flags = !{!38, !39, !40, !41, !42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048/div_Ccode_alarm_0048.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048")
!4 = !{}
!5 = !{!6, !11, !12, !16, !20, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !13, line: 11, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !13, line: 9, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !19)
!19 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !13, line: 6, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !22, line: 24, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !24)
!24 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !13, line: 8, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !22, line: 25, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !28)
!28 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048")
!34 = distinct !DICompileUnit(language: DW_LANG_C89, file: !35, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!36 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!37 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!38 = !{i32 7, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{i32 7, !"uwtable", i32 1}
!42 = !{i32 7, !"frame-pointer", i32 2}
!43 = distinct !DISubprogram(name: "main", scope: !44, file: !44, line: 7, type: !45, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048")
!45 = !DISubroutineType(types: !46)
!46 = !{!11}
!47 = !DILocalVariable(name: "numerator", scope: !43, file: !44, line: 9, type: !17)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "denominator", scope: !43, file: !44, line: 10, type: !17)
!50 = !DILocation(line: 10, column: 13, scope: !43)
!51 = !DILocalVariable(name: "result", scope: !43, file: !44, line: 11, type: !17)
!52 = !DILocation(line: 11, column: 13, scope: !43)
!53 = !DILocation(line: 13, column: 24, scope: !43)
!54 = !DILocation(line: 13, column: 5, scope: !43)
!55 = !DILocation(line: 14, column: 24, scope: !43)
!56 = !DILocation(line: 14, column: 5, scope: !43)
!57 = !DILocation(line: 16, column: 36, scope: !43)
!58 = !DILocation(line: 16, column: 47, scope: !43)
!59 = !DILocation(line: 16, column: 14, scope: !43)
!60 = !DILocation(line: 16, column: 12, scope: !43)
!61 = !DILocation(line: 18, column: 11, scope: !43)
!62 = !DILocation(line: 19, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !64, file: !64, line: 170, type: !65, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048")
!65 = !DISubroutineType(types: !66)
!66 = !{!16, !16, !16}
!67 = !DILocalVariable(name: "numerator", arg: 1, scope: !63, file: !64, line: 170, type: !16)
!68 = !DILocation(line: 170, column: 31, scope: !63)
!69 = !DILocalVariable(name: "denominator", arg: 2, scope: !63, file: !64, line: 170, type: !16)
!70 = !DILocation(line: 170, column: 47, scope: !63)
!71 = !DILocalVariable(name: "s32Temp1", scope: !63, file: !64, line: 172, type: !12)
!72 = !DILocation(line: 172, column: 6, scope: !63)
!73 = !DILocalVariable(name: "s32Temp2", scope: !63, file: !64, line: 172, type: !12)
!74 = !DILocation(line: 172, column: 15, scope: !63)
!75 = !DILocation(line: 174, column: 61, scope: !76)
!76 = distinct !DILexicalBlock(scope: !63, file: !64, line: 174, column: 6)
!77 = !DILocation(line: 174, column: 56, scope: !76)
!78 = !DILocation(line: 174, column: 46, scope: !76)
!79 = !DILocation(line: 174, column: 8, scope: !76)
!80 = !DILocation(line: 174, column: 6, scope: !63)
!81 = !DILocation(line: 175, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !64, line: 174, column: 75)
!83 = !DILocation(line: 177, column: 13, scope: !63)
!84 = !DILocation(line: 177, column: 22, scope: !63)
!85 = !DILocation(line: 177, column: 11, scope: !63)
!86 = !DILocation(line: 179, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !63, file: !64, line: 179, column: 6)
!88 = !DILocation(line: 179, column: 18, scope: !87)
!89 = !DILocation(line: 179, column: 6, scope: !63)
!90 = !DILocation(line: 181, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !64, line: 181, column: 7)
!92 = distinct !DILexicalBlock(scope: !87, file: !64, line: 180, column: 2)
!93 = !DILocation(line: 181, column: 17, scope: !91)
!94 = !DILocation(line: 181, column: 7, scope: !92)
!95 = !DILocation(line: 183, column: 4, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !64, line: 182, column: 3)
!97 = !DILocation(line: 187, column: 4, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !64, line: 186, column: 3)
!99 = !DILocation(line: 192, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !64, line: 192, column: 7)
!101 = distinct !DILexicalBlock(scope: !87, file: !64, line: 191, column: 2)
!102 = !DILocation(line: 192, column: 16, scope: !100)
!103 = !DILocation(line: 192, column: 7, scope: !101)
!104 = !DILocation(line: 195, column: 47, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !64, line: 195, column: 8)
!106 = distinct !DILexicalBlock(scope: !100, file: !64, line: 193, column: 3)
!107 = !DILocation(line: 195, column: 37, scope: !105)
!108 = !DILocation(line: 195, column: 10, scope: !105)
!109 = !DILocation(line: 195, column: 8, scope: !106)
!110 = !DILocation(line: 196, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !64, line: 195, column: 63)
!112 = !DILocation(line: 199, column: 51, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !64, line: 199, column: 8)
!114 = !DILocation(line: 199, column: 67, scope: !113)
!115 = !DILocation(line: 199, column: 62, scope: !113)
!116 = !DILocation(line: 199, column: 60, scope: !113)
!117 = !{!"True"}
!118 = !DILocation(line: 199, column: 35, scope: !113)
!119 = !DILocation(line: 199, column: 97, scope: !113)
!120 = !DILocation(line: 199, column: 92, scope: !113)
!121 = !DILocation(line: 199, column: 82, scope: !113)
!122 = !DILocation(line: 199, column: 10, scope: !113)
!123 = !DILocation(line: 199, column: 8, scope: !106)
!124 = !DILocation(line: 200, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !64, line: 199, column: 113)
!126 = !DILocation(line: 207, column: 42, scope: !106)
!127 = !DILocation(line: 207, column: 58, scope: !106)
!128 = !DILocation(line: 207, column: 53, scope: !106)
!129 = !DILocation(line: 207, column: 51, scope: !106)
!130 = !DILocation(line: 207, column: 78, scope: !106)
!131 = !DILocation(line: 207, column: 73, scope: !106)
!132 = !DILocation(line: 207, column: 71, scope: !106)
!133 = !DILocation(line: 207, column: 26, scope: !106)
!134 = !DILocation(line: 207, column: 24, scope: !106)
!135 = !DILocation(line: 208, column: 4, scope: !106)
!136 = !DILocation(line: 229, column: 7, scope: !137)
!137 = distinct !DILexicalBlock(scope: !138, file: !64, line: 229, column: 7)
!138 = distinct !DILexicalBlock(scope: !100, file: !64, line: 228, column: 3)
!139 = !DILocation(line: 229, column: 19, scope: !137)
!140 = !DILocation(line: 229, column: 7, scope: !138)
!141 = !DILocation(line: 231, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !64, line: 230, column: 4)
!143 = !DILocation(line: 231, column: 29, scope: !142)
!144 = !DILocation(line: 231, column: 38, scope: !142)
!145 = !DILocation(line: 231, column: 37, scope: !142)
!146 = !DILocation(line: 231, column: 53, scope: !142)
!147 = !DILocation(line: 231, column: 51, scope: !142)
!148 = !DILocation(line: 231, column: 26, scope: !142)
!149 = !DILocation(line: 231, column: 66, scope: !142)
!150 = !DILocation(line: 231, column: 14, scope: !142)
!151 = !DILocation(line: 232, column: 16, scope: !142)
!152 = !DILocation(line: 232, column: 25, scope: !142)
!153 = !DILocation(line: 232, column: 24, scope: !142)
!154 = !DILocation(line: 232, column: 14, scope: !142)
!155 = !DILocation(line: 233, column: 16, scope: !142)
!156 = !DILocation(line: 233, column: 28, scope: !142)
!157 = !DILocation(line: 233, column: 37, scope: !142)
!158 = !DILocation(line: 233, column: 43, scope: !142)
!159 = !DILocation(line: 233, column: 42, scope: !142)
!160 = !DILocation(line: 233, column: 25, scope: !142)
!161 = !DILocation(line: 233, column: 14, scope: !142)
!162 = !DILocation(line: 234, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !142, file: !64, line: 234, column: 8)
!164 = !DILocation(line: 234, column: 17, scope: !163)
!165 = !DILocation(line: 234, column: 8, scope: !142)
!166 = !DILocation(line: 236, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !168, file: !64, line: 236, column: 9)
!168 = distinct !DILexicalBlock(scope: !163, file: !64, line: 235, column: 5)
!169 = !DILocation(line: 236, column: 18, scope: !167)
!170 = !DILocation(line: 236, column: 9, scope: !168)
!171 = !DILocation(line: 238, column: 19, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !64, line: 237, column: 6)
!173 = !DILocation(line: 238, column: 14, scope: !172)
!174 = !DILocation(line: 238, column: 7, scope: !172)
!175 = !DILocation(line: 242, column: 7, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !64, line: 241, column: 6)
!177 = !DILocation(line: 247, column: 6, scope: !178)
!178 = distinct !DILexicalBlock(scope: !163, file: !64, line: 246, column: 5)
!179 = !DILocation(line: 252, column: 5, scope: !180)
!180 = distinct !DILexicalBlock(scope: !137, file: !64, line: 251, column: 4)
!181 = !DILocation(line: 256, column: 1, scope: !63)
!182 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !30, file: !30, line: 84, type: !183, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!183 = !DISubroutineType(types: !184)
!184 = !{!11, !6}
!185 = !DILocalVariable(name: "left", arg: 1, scope: !182, file: !30, line: 84, type: !6)
!186 = !DILocation(line: 84, column: 51, scope: !182)
!187 = !DILocation(line: 86, column: 12, scope: !182)
!188 = !DILocation(line: 86, column: 17, scope: !182)
!189 = !DILocation(line: 86, column: 5, scope: !182)
!190 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !30, file: !30, line: 24, type: !183, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!191 = !DILocalVariable(name: "denominator", arg: 1, scope: !190, file: !30, line: 24, type: !6)
!192 = !DILocation(line: 24, column: 40, scope: !190)
!193 = !DILocation(line: 26, column: 12, scope: !190)
!194 = !DILocation(line: 26, column: 24, scope: !190)
!195 = !DILocation(line: 26, column: 5, scope: !190)
!196 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !197, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DISubroutineType(types: !198)
!198 = !{!11, !6, !6}
!199 = !DILocalVariable(name: "left", arg: 1, scope: !196, file: !30, line: 78, type: !6)
!200 = !DILocation(line: 78, column: 38, scope: !196)
!201 = !DILocalVariable(name: "right", arg: 2, scope: !196, file: !30, line: 78, type: !6)
!202 = !DILocation(line: 78, column: 52, scope: !196)
!203 = !DILocation(line: 80, column: 12, scope: !196)
!204 = !DILocation(line: 80, column: 19, scope: !196)
!205 = !DILocation(line: 80, column: 17, scope: !196)
!206 = !DILocation(line: 80, column: 25, scope: !196)
!207 = !DILocation(line: 80, column: 5, scope: !196)
!208 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !64, file: !64, line: 273, type: !209, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!209 = !DISubroutineType(types: !210)
!210 = !{!16, !12, !16}
!211 = !DILocalVariable(name: "numerator", arg: 1, scope: !208, file: !64, line: 273, type: !12)
!212 = !DILocation(line: 273, column: 25, scope: !208)
!213 = !DILocalVariable(name: "denominator", arg: 2, scope: !208, file: !64, line: 273, type: !16)
!214 = !DILocation(line: 273, column: 41, scope: !208)
!215 = !DILocalVariable(name: "s32Temp1", scope: !208, file: !64, line: 275, type: !12)
!216 = !DILocation(line: 275, column: 6, scope: !208)
!217 = !DILocalVariable(name: "s32Temp2", scope: !208, file: !64, line: 275, type: !12)
!218 = !DILocation(line: 275, column: 17, scope: !208)
!219 = !DILocation(line: 276, column: 13, scope: !208)
!220 = !DILocation(line: 276, column: 11, scope: !208)
!221 = !DILocation(line: 277, column: 5, scope: !222)
!222 = distinct !DILexicalBlock(scope: !208, file: !64, line: 277, column: 5)
!223 = !DILocation(line: 277, column: 17, scope: !222)
!224 = !DILocation(line: 277, column: 5, scope: !208)
!225 = !DILocation(line: 279, column: 7, scope: !226)
!226 = distinct !DILexicalBlock(scope: !227, file: !64, line: 279, column: 7)
!227 = distinct !DILexicalBlock(scope: !222, file: !64, line: 278, column: 2)
!228 = !DILocation(line: 279, column: 17, scope: !226)
!229 = !DILocation(line: 279, column: 7, scope: !227)
!230 = !DILocation(line: 281, column: 4, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !64, line: 280, column: 3)
!232 = !DILocation(line: 285, column: 4, scope: !233)
!233 = distinct !DILexicalBlock(scope: !226, file: !64, line: 284, column: 3)
!234 = !DILocation(line: 290, column: 6, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !64, line: 290, column: 6)
!236 = distinct !DILexicalBlock(scope: !222, file: !64, line: 289, column: 2)
!237 = !DILocation(line: 290, column: 16, scope: !235)
!238 = !DILocation(line: 290, column: 6, scope: !236)
!239 = !DILocation(line: 292, column: 16, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !64, line: 291, column: 3)
!241 = !DILocation(line: 292, column: 28, scope: !240)
!242 = !DILocation(line: 292, column: 37, scope: !240)
!243 = !DILocation(line: 292, column: 36, scope: !240)
!244 = !DILocation(line: 292, column: 52, scope: !240)
!245 = !DILocation(line: 292, column: 50, scope: !240)
!246 = !DILocation(line: 292, column: 25, scope: !240)
!247 = !DILocation(line: 292, column: 65, scope: !240)
!248 = !DILocation(line: 292, column: 13, scope: !240)
!249 = !DILocation(line: 293, column: 15, scope: !240)
!250 = !DILocation(line: 293, column: 24, scope: !240)
!251 = !DILocation(line: 293, column: 23, scope: !240)
!252 = !DILocation(line: 293, column: 13, scope: !240)
!253 = !DILocation(line: 294, column: 15, scope: !240)
!254 = !DILocation(line: 294, column: 27, scope: !240)
!255 = !DILocation(line: 294, column: 38, scope: !240)
!256 = !DILocation(line: 294, column: 37, scope: !240)
!257 = !DILocation(line: 294, column: 24, scope: !240)
!258 = !DILocation(line: 294, column: 13, scope: !240)
!259 = !DILocation(line: 295, column: 7, scope: !260)
!260 = distinct !DILexicalBlock(scope: !240, file: !64, line: 295, column: 7)
!261 = !DILocation(line: 295, column: 16, scope: !260)
!262 = !DILocation(line: 295, column: 7, scope: !240)
!263 = !DILocation(line: 297, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !265, file: !64, line: 297, column: 8)
!265 = distinct !DILexicalBlock(scope: !260, file: !64, line: 296, column: 4)
!266 = !DILocation(line: 297, column: 17, scope: !264)
!267 = !DILocation(line: 297, column: 8, scope: !265)
!268 = !DILocation(line: 299, column: 18, scope: !269)
!269 = distinct !DILexicalBlock(scope: !264, file: !64, line: 298, column: 5)
!270 = !DILocation(line: 299, column: 13, scope: !269)
!271 = !DILocation(line: 299, column: 6, scope: !269)
!272 = !DILocation(line: 303, column: 6, scope: !273)
!273 = distinct !DILexicalBlock(scope: !264, file: !64, line: 302, column: 5)
!274 = !DILocation(line: 308, column: 5, scope: !275)
!275 = distinct !DILexicalBlock(scope: !260, file: !64, line: 307, column: 4)
!276 = !DILocation(line: 313, column: 7, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !64, line: 313, column: 7)
!278 = distinct !DILexicalBlock(scope: !235, file: !64, line: 312, column: 3)
!279 = !DILocation(line: 313, column: 19, scope: !277)
!280 = !DILocation(line: 313, column: 7, scope: !278)
!281 = !DILocation(line: 315, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !64, line: 314, column: 4)
!283 = !DILocation(line: 315, column: 29, scope: !282)
!284 = !DILocation(line: 315, column: 38, scope: !282)
!285 = !DILocation(line: 315, column: 37, scope: !282)
!286 = !DILocation(line: 315, column: 53, scope: !282)
!287 = !DILocation(line: 315, column: 51, scope: !282)
!288 = !DILocation(line: 315, column: 26, scope: !282)
!289 = !DILocation(line: 315, column: 66, scope: !282)
!290 = !DILocation(line: 315, column: 14, scope: !282)
!291 = !DILocation(line: 316, column: 16, scope: !282)
!292 = !DILocation(line: 316, column: 25, scope: !282)
!293 = !DILocation(line: 316, column: 24, scope: !282)
!294 = !DILocation(line: 316, column: 14, scope: !282)
!295 = !DILocation(line: 317, column: 16, scope: !282)
!296 = !DILocation(line: 317, column: 28, scope: !282)
!297 = !DILocation(line: 317, column: 39, scope: !282)
!298 = !DILocation(line: 317, column: 38, scope: !282)
!299 = !DILocation(line: 317, column: 25, scope: !282)
!300 = !DILocation(line: 317, column: 14, scope: !282)
!301 = !DILocation(line: 318, column: 8, scope: !302)
!302 = distinct !DILexicalBlock(scope: !282, file: !64, line: 318, column: 8)
!303 = !DILocation(line: 318, column: 17, scope: !302)
!304 = !DILocation(line: 318, column: 8, scope: !282)
!305 = !DILocation(line: 320, column: 9, scope: !306)
!306 = distinct !DILexicalBlock(scope: !307, file: !64, line: 320, column: 9)
!307 = distinct !DILexicalBlock(scope: !302, file: !64, line: 319, column: 5)
!308 = !DILocation(line: 320, column: 18, scope: !306)
!309 = !DILocation(line: 320, column: 9, scope: !307)
!310 = !DILocation(line: 322, column: 19, scope: !311)
!311 = distinct !DILexicalBlock(scope: !306, file: !64, line: 321, column: 6)
!312 = !DILocation(line: 322, column: 14, scope: !311)
!313 = !DILocation(line: 322, column: 7, scope: !311)
!314 = !DILocation(line: 326, column: 7, scope: !315)
!315 = distinct !DILexicalBlock(scope: !306, file: !64, line: 325, column: 6)
!316 = !DILocation(line: 331, column: 6, scope: !317)
!317 = distinct !DILexicalBlock(scope: !302, file: !64, line: 330, column: 5)
!318 = !DILocation(line: 337, column: 5, scope: !319)
!319 = distinct !DILexicalBlock(scope: !277, file: !64, line: 336, column: 4)
!320 = !DILocation(line: 343, column: 1, scope: !208)
!321 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !64, file: !64, line: 361, type: !322, scopeLine: 362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!322 = !DISubroutineType(types: !323)
!323 = !{!16, !16, !25}
!324 = !DILocalVariable(name: "numerator", arg: 1, scope: !321, file: !64, line: 361, type: !16)
!325 = !DILocation(line: 361, column: 31, scope: !321)
!326 = !DILocalVariable(name: "denominator", arg: 2, scope: !321, file: !64, line: 361, type: !25)
!327 = !DILocation(line: 361, column: 47, scope: !321)
!328 = !DILocalVariable(name: "u16Temp1", scope: !321, file: !64, line: 363, type: !25)
!329 = !DILocation(line: 363, column: 6, scope: !321)
!330 = !DILocalVariable(name: "s32Temp1", scope: !321, file: !64, line: 364, type: !12)
!331 = !DILocation(line: 364, column: 6, scope: !321)
!332 = !DILocalVariable(name: "s32Temp2", scope: !321, file: !64, line: 364, type: !12)
!333 = !DILocation(line: 364, column: 15, scope: !321)
!334 = !DILocation(line: 365, column: 13, scope: !321)
!335 = !DILocation(line: 365, column: 25, scope: !321)
!336 = !DILocation(line: 365, column: 11, scope: !321)
!337 = !DILocation(line: 366, column: 13, scope: !321)
!338 = !DILocation(line: 366, column: 22, scope: !321)
!339 = !DILocation(line: 366, column: 11, scope: !321)
!340 = !DILocation(line: 367, column: 5, scope: !341)
!341 = distinct !DILexicalBlock(scope: !321, file: !64, line: 367, column: 5)
!342 = !DILocation(line: 367, column: 14, scope: !341)
!343 = !DILocation(line: 367, column: 5, scope: !321)
!344 = !DILocation(line: 369, column: 7, scope: !345)
!345 = distinct !DILexicalBlock(scope: !346, file: !64, line: 369, column: 7)
!346 = distinct !DILexicalBlock(scope: !341, file: !64, line: 368, column: 2)
!347 = !DILocation(line: 369, column: 17, scope: !345)
!348 = !DILocation(line: 369, column: 7, scope: !346)
!349 = !DILocation(line: 371, column: 4, scope: !350)
!350 = distinct !DILexicalBlock(scope: !345, file: !64, line: 370, column: 3)
!351 = !DILocation(line: 375, column: 4, scope: !352)
!352 = distinct !DILexicalBlock(scope: !345, file: !64, line: 374, column: 3)
!353 = !DILocation(line: 380, column: 15, scope: !354)
!354 = distinct !DILexicalBlock(scope: !341, file: !64, line: 379, column: 2)
!355 = !DILocation(line: 380, column: 24, scope: !354)
!356 = !DILocation(line: 380, column: 32, scope: !354)
!357 = !DILocation(line: 380, column: 41, scope: !354)
!358 = !DILocation(line: 380, column: 47, scope: !354)
!359 = !DILocation(line: 380, column: 46, scope: !354)
!360 = !DILocation(line: 380, column: 57, scope: !354)
!361 = !DILocation(line: 380, column: 56, scope: !354)
!362 = !DILocation(line: 380, column: 29, scope: !354)
!363 = !DILocation(line: 380, column: 12, scope: !354)
!364 = !DILocation(line: 381, column: 14, scope: !354)
!365 = !DILocation(line: 381, column: 22, scope: !354)
!366 = !DILocation(line: 381, column: 12, scope: !354)
!367 = !DILocation(line: 382, column: 14, scope: !354)
!368 = !DILocation(line: 382, column: 23, scope: !354)
!369 = !DILocation(line: 382, column: 22, scope: !354)
!370 = !DILocation(line: 382, column: 12, scope: !354)
!371 = !DILocation(line: 383, column: 16, scope: !354)
!372 = !DILocation(line: 383, column: 25, scope: !354)
!373 = !DILocation(line: 383, column: 31, scope: !354)
!374 = !DILocation(line: 383, column: 30, scope: !354)
!375 = !DILocation(line: 383, column: 43, scope: !354)
!376 = !DILocation(line: 383, column: 41, scope: !354)
!377 = !DILocation(line: 383, column: 12, scope: !354)
!378 = !DILocation(line: 384, column: 6, scope: !379)
!379 = distinct !DILexicalBlock(scope: !354, file: !64, line: 384, column: 6)
!380 = !DILocation(line: 384, column: 15, scope: !379)
!381 = !DILocation(line: 384, column: 6, scope: !354)
!382 = !DILocation(line: 386, column: 7, scope: !383)
!383 = distinct !DILexicalBlock(scope: !384, file: !64, line: 386, column: 7)
!384 = distinct !DILexicalBlock(scope: !379, file: !64, line: 385, column: 3)
!385 = !DILocation(line: 386, column: 16, scope: !383)
!386 = !DILocation(line: 386, column: 7, scope: !384)
!387 = !DILocation(line: 388, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !383, file: !64, line: 387, column: 4)
!389 = !DILocation(line: 388, column: 12, scope: !388)
!390 = !DILocation(line: 388, column: 5, scope: !388)
!391 = !DILocation(line: 392, column: 5, scope: !392)
!392 = distinct !DILexicalBlock(scope: !383, file: !64, line: 391, column: 4)
!393 = !DILocation(line: 397, column: 4, scope: !394)
!394 = distinct !DILexicalBlock(scope: !379, file: !64, line: 396, column: 3)
!395 = !DILocation(line: 400, column: 1, scope: !321)
!396 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !64, file: !64, line: 417, type: !322, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!397 = !DILocalVariable(name: "numerator", arg: 1, scope: !396, file: !64, line: 417, type: !16)
!398 = !DILocation(line: 417, column: 30, scope: !396)
!399 = !DILocalVariable(name: "denominator", arg: 2, scope: !396, file: !64, line: 417, type: !25)
!400 = !DILocation(line: 417, column: 45, scope: !396)
!401 = !DILocalVariable(name: "u16Temp1", scope: !396, file: !64, line: 419, type: !25)
!402 = !DILocation(line: 419, column: 6, scope: !396)
!403 = !DILocalVariable(name: "s32Temp1", scope: !396, file: !64, line: 420, type: !12)
!404 = !DILocation(line: 420, column: 6, scope: !396)
!405 = !DILocation(line: 421, column: 13, scope: !396)
!406 = !DILocation(line: 421, column: 25, scope: !396)
!407 = !DILocation(line: 421, column: 11, scope: !396)
!408 = !DILocation(line: 422, column: 5, scope: !409)
!409 = distinct !DILexicalBlock(scope: !396, file: !64, line: 422, column: 5)
!410 = !DILocation(line: 422, column: 13, scope: !409)
!411 = !DILocation(line: 422, column: 5, scope: !396)
!412 = !DILocation(line: 424, column: 6, scope: !413)
!413 = distinct !DILexicalBlock(scope: !414, file: !64, line: 424, column: 6)
!414 = distinct !DILexicalBlock(scope: !409, file: !64, line: 423, column: 2)
!415 = !DILocation(line: 424, column: 15, scope: !413)
!416 = !DILocation(line: 424, column: 6, scope: !414)
!417 = !DILocation(line: 426, column: 4, scope: !418)
!418 = distinct !DILexicalBlock(scope: !413, file: !64, line: 425, column: 3)
!419 = !DILocation(line: 430, column: 4, scope: !420)
!420 = distinct !DILexicalBlock(scope: !413, file: !64, line: 429, column: 3)
!421 = !DILocation(line: 436, column: 15, scope: !422)
!422 = distinct !DILexicalBlock(scope: !409, file: !64, line: 435, column: 2)
!423 = !DILocation(line: 436, column: 27, scope: !422)
!424 = !DILocation(line: 436, column: 37, scope: !422)
!425 = !DILocation(line: 436, column: 36, scope: !422)
!426 = !DILocation(line: 436, column: 49, scope: !422)
!427 = !DILocation(line: 436, column: 47, scope: !422)
!428 = !DILocation(line: 436, column: 25, scope: !422)
!429 = !DILocation(line: 436, column: 59, scope: !422)
!430 = !DILocation(line: 436, column: 12, scope: !422)
!431 = !DILocation(line: 437, column: 15, scope: !422)
!432 = !DILocation(line: 437, column: 24, scope: !422)
!433 = !DILocation(line: 437, column: 23, scope: !422)
!434 = !DILocation(line: 437, column: 37, scope: !422)
!435 = !DILocation(line: 437, column: 47, scope: !422)
!436 = !DILocation(line: 437, column: 46, scope: !422)
!437 = !DILocation(line: 437, column: 34, scope: !422)
!438 = !DILocation(line: 437, column: 12, scope: !422)
!439 = !DILocation(line: 438, column: 10, scope: !422)
!440 = !DILocation(line: 438, column: 3, scope: !422)
!441 = !DILocation(line: 440, column: 1, scope: !396)
!442 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !64, file: !64, line: 458, type: !443, scopeLine: 459, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!443 = !DISubroutineType(types: !444)
!444 = !{!20, !25, !25}
!445 = !DILocalVariable(name: "numerator", arg: 1, scope: !442, file: !64, line: 458, type: !25)
!446 = !DILocation(line: 458, column: 28, scope: !442)
!447 = !DILocalVariable(name: "denominator", arg: 2, scope: !442, file: !64, line: 458, type: !25)
!448 = !DILocation(line: 458, column: 43, scope: !442)
!449 = !DILocalVariable(name: "u32Temp1", scope: !442, file: !64, line: 460, type: !450)
!450 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !451)
!451 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !22, line: 26, baseType: !452)
!452 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !453)
!453 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!454 = !DILocation(line: 460, column: 6, scope: !442)
!455 = !DILocalVariable(name: "u32Temp2", scope: !442, file: !64, line: 460, type: !450)
!456 = !DILocation(line: 460, column: 20, scope: !442)
!457 = !DILocalVariable(name: "u32Temp3", scope: !442, file: !64, line: 460, type: !450)
!458 = !DILocation(line: 460, column: 33, scope: !442)
!459 = !DILocation(line: 461, column: 5, scope: !460)
!460 = distinct !DILexicalBlock(scope: !442, file: !64, line: 461, column: 5)
!461 = !DILocation(line: 461, column: 16, scope: !460)
!462 = !DILocation(line: 461, column: 5, scope: !442)
!463 = !DILocation(line: 463, column: 3, scope: !464)
!464 = distinct !DILexicalBlock(scope: !460, file: !64, line: 462, column: 2)
!465 = !DILocation(line: 467, column: 15, scope: !466)
!466 = distinct !DILexicalBlock(scope: !460, file: !64, line: 466, column: 2)
!467 = !DILocation(line: 467, column: 24, scope: !466)
!468 = !DILocation(line: 467, column: 12, scope: !466)
!469 = !DILocation(line: 468, column: 14, scope: !466)
!470 = !DILocation(line: 468, column: 25, scope: !466)
!471 = !DILocation(line: 468, column: 23, scope: !466)
!472 = !DILocation(line: 468, column: 12, scope: !466)
!473 = !DILocation(line: 469, column: 15, scope: !466)
!474 = !DILocation(line: 469, column: 24, scope: !466)
!475 = !DILocation(line: 469, column: 32, scope: !466)
!476 = !DILocation(line: 469, column: 12, scope: !466)
!477 = !DILocation(line: 470, column: 6, scope: !478)
!478 = distinct !DILexicalBlock(scope: !466, file: !64, line: 470, column: 6)
!479 = !DILocation(line: 470, column: 15, scope: !478)
!480 = !DILocation(line: 470, column: 6, scope: !466)
!481 = !DILocation(line: 472, column: 15, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !64, line: 471, column: 3)
!483 = !DILocation(line: 472, column: 11, scope: !482)
!484 = !DILocation(line: 472, column: 4, scope: !482)
!485 = !DILocation(line: 476, column: 4, scope: !486)
!486 = distinct !DILexicalBlock(scope: !478, file: !64, line: 475, column: 3)
!487 = !DILocation(line: 479, column: 1, scope: !442)
!488 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !64, file: !64, line: 496, type: !489, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!489 = !DISubroutineType(types: !490)
!490 = !{!25, !12, !25}
!491 = !DILocalVariable(name: "x_value", arg: 1, scope: !488, file: !64, line: 496, type: !12)
!492 = !DILocation(line: 496, column: 25, scope: !488)
!493 = !DILocalVariable(name: "y_value", arg: 2, scope: !488, file: !64, line: 496, type: !25)
!494 = !DILocation(line: 496, column: 38, scope: !488)
!495 = !DILocalVariable(name: "s32Temp1", scope: !488, file: !64, line: 498, type: !12)
!496 = !DILocation(line: 498, column: 6, scope: !488)
!497 = !DILocation(line: 499, column: 12, scope: !488)
!498 = !DILocation(line: 499, column: 20, scope: !488)
!499 = !DILocation(line: 499, column: 10, scope: !488)
!500 = !DILocation(line: 500, column: 6, scope: !501)
!501 = distinct !DILexicalBlock(scope: !488, file: !64, line: 500, column: 5)
!502 = !DILocation(line: 500, column: 14, scope: !501)
!503 = !DILocation(line: 500, column: 24, scope: !501)
!504 = !DILocation(line: 500, column: 5, scope: !488)
!505 = !DILocation(line: 502, column: 6, scope: !506)
!506 = distinct !DILexicalBlock(scope: !507, file: !64, line: 502, column: 6)
!507 = distinct !DILexicalBlock(scope: !501, file: !64, line: 501, column: 2)
!508 = !DILocation(line: 502, column: 14, scope: !506)
!509 = !DILocation(line: 502, column: 6, scope: !507)
!510 = !DILocation(line: 504, column: 4, scope: !511)
!511 = distinct !DILexicalBlock(scope: !506, file: !64, line: 503, column: 3)
!512 = !DILocation(line: 508, column: 4, scope: !513)
!513 = distinct !DILexicalBlock(scope: !506, file: !64, line: 507, column: 3)
!514 = !DILocation(line: 513, column: 15, scope: !515)
!515 = distinct !DILexicalBlock(scope: !501, file: !64, line: 512, column: 2)
!516 = !DILocation(line: 513, column: 27, scope: !515)
!517 = !DILocation(line: 513, column: 35, scope: !515)
!518 = !DILocation(line: 513, column: 34, scope: !515)
!519 = !DILocation(line: 513, column: 46, scope: !515)
!520 = !DILocation(line: 513, column: 44, scope: !515)
!521 = !DILocation(line: 513, column: 23, scope: !515)
!522 = !DILocation(line: 513, column: 56, scope: !515)
!523 = !DILocation(line: 513, column: 12, scope: !515)
!524 = !DILocation(line: 514, column: 15, scope: !515)
!525 = !DILocation(line: 514, column: 24, scope: !515)
!526 = !DILocation(line: 514, column: 23, scope: !515)
!527 = !DILocation(line: 514, column: 36, scope: !515)
!528 = !DILocation(line: 514, column: 44, scope: !515)
!529 = !DILocation(line: 514, column: 43, scope: !515)
!530 = !DILocation(line: 514, column: 33, scope: !515)
!531 = !DILocation(line: 514, column: 12, scope: !515)
!532 = !DILocation(line: 515, column: 6, scope: !533)
!533 = distinct !DILexicalBlock(scope: !515, file: !64, line: 515, column: 6)
!534 = !DILocation(line: 515, column: 15, scope: !533)
!535 = !DILocation(line: 515, column: 6, scope: !515)
!536 = !DILocation(line: 517, column: 7, scope: !537)
!537 = distinct !DILexicalBlock(scope: !538, file: !64, line: 517, column: 7)
!538 = distinct !DILexicalBlock(scope: !533, file: !64, line: 516, column: 3)
!539 = !DILocation(line: 517, column: 16, scope: !537)
!540 = !DILocation(line: 517, column: 7, scope: !538)
!541 = !DILocation(line: 519, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !537, file: !64, line: 518, column: 4)
!543 = !DILocation(line: 519, column: 12, scope: !542)
!544 = !DILocation(line: 519, column: 5, scope: !542)
!545 = !DILocation(line: 523, column: 5, scope: !546)
!546 = distinct !DILexicalBlock(scope: !537, file: !64, line: 522, column: 4)
!547 = !DILocation(line: 528, column: 4, scope: !548)
!548 = distinct !DILexicalBlock(scope: !533, file: !64, line: 527, column: 3)
!549 = !DILocation(line: 531, column: 1, scope: !488)
!550 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !64, file: !64, line: 549, type: !551, scopeLine: 550, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!551 = !DISubroutineType(types: !552)
!552 = !{!25, !25, !25}
!553 = !DILocalVariable(name: "numerator", arg: 1, scope: !550, file: !64, line: 549, type: !25)
!554 = !DILocation(line: 549, column: 31, scope: !550)
!555 = !DILocalVariable(name: "denominator", arg: 2, scope: !550, file: !64, line: 549, type: !25)
!556 = !DILocation(line: 549, column: 46, scope: !550)
!557 = !DILocalVariable(name: "u32Temp", scope: !550, file: !64, line: 551, type: !450)
!558 = !DILocation(line: 551, column: 6, scope: !550)
!559 = !DILocation(line: 552, column: 5, scope: !560)
!560 = distinct !DILexicalBlock(scope: !550, file: !64, line: 552, column: 5)
!561 = !DILocation(line: 552, column: 17, scope: !560)
!562 = !DILocation(line: 552, column: 5, scope: !550)
!563 = !DILocation(line: 554, column: 3, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !64, line: 553, column: 2)
!565 = !DILocation(line: 558, column: 14, scope: !566)
!566 = distinct !DILexicalBlock(scope: !560, file: !64, line: 557, column: 2)
!567 = !DILocation(line: 558, column: 23, scope: !566)
!568 = !DILocation(line: 558, column: 32, scope: !566)
!569 = !DILocation(line: 558, column: 44, scope: !566)
!570 = !DILocation(line: 558, column: 29, scope: !566)
!571 = !DILocation(line: 558, column: 11, scope: !566)
!572 = !DILocation(line: 559, column: 13, scope: !566)
!573 = !DILocation(line: 559, column: 21, scope: !566)
!574 = !DILocation(line: 559, column: 20, scope: !566)
!575 = !DILocation(line: 559, column: 11, scope: !566)
!576 = !DILocation(line: 560, column: 6, scope: !577)
!577 = distinct !DILexicalBlock(scope: !566, file: !64, line: 560, column: 6)
!578 = !DILocation(line: 560, column: 14, scope: !577)
!579 = !DILocation(line: 560, column: 6, scope: !566)
!580 = !DILocation(line: 562, column: 11, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !64, line: 561, column: 3)
!582 = !DILocation(line: 562, column: 19, scope: !581)
!583 = !DILocation(line: 562, column: 4, scope: !581)
!584 = !DILocation(line: 566, column: 4, scope: !585)
!585 = distinct !DILexicalBlock(scope: !577, file: !64, line: 565, column: 3)
!586 = !DILocation(line: 570, column: 1, scope: !550)
!587 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !64, file: !64, line: 587, type: !588, scopeLine: 588, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!588 = !DISubroutineType(types: !589)
!589 = !{!25, !450, !25}
!590 = !DILocalVariable(name: "x_value", arg: 1, scope: !587, file: !64, line: 587, type: !450)
!591 = !DILocation(line: 587, column: 25, scope: !587)
!592 = !DILocalVariable(name: "y_value", arg: 2, scope: !587, file: !64, line: 587, type: !25)
!593 = !DILocation(line: 587, column: 38, scope: !587)
!594 = !DILocalVariable(name: "u32Temp1", scope: !587, file: !64, line: 589, type: !450)
!595 = !DILocation(line: 589, column: 6, scope: !587)
!596 = !DILocalVariable(name: "u32Temp2", scope: !587, file: !64, line: 589, type: !450)
!597 = !DILocation(line: 589, column: 17, scope: !587)
!598 = !DILocation(line: 590, column: 12, scope: !587)
!599 = !DILocation(line: 590, column: 20, scope: !587)
!600 = !DILocation(line: 590, column: 10, scope: !587)
!601 = !DILocation(line: 591, column: 5, scope: !602)
!602 = distinct !DILexicalBlock(scope: !587, file: !64, line: 591, column: 5)
!603 = !DILocation(line: 591, column: 13, scope: !602)
!604 = !DILocation(line: 591, column: 5, scope: !587)
!605 = !DILocation(line: 593, column: 3, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !64, line: 592, column: 2)
!607 = !DILocation(line: 597, column: 14, scope: !608)
!608 = distinct !DILexicalBlock(scope: !602, file: !64, line: 596, column: 2)
!609 = !DILocation(line: 597, column: 22, scope: !608)
!610 = !DILocation(line: 597, column: 21, scope: !608)
!611 = !DILocation(line: 597, column: 12, scope: !608)
!612 = !DILocation(line: 598, column: 14, scope: !608)
!613 = !DILocation(line: 598, column: 25, scope: !608)
!614 = !DILocation(line: 598, column: 36, scope: !608)
!615 = !DILocation(line: 598, column: 34, scope: !608)
!616 = !DILocation(line: 598, column: 22, scope: !608)
!617 = !DILocation(line: 598, column: 45, scope: !608)
!618 = !DILocation(line: 598, column: 12, scope: !608)
!619 = !DILocation(line: 599, column: 15, scope: !608)
!620 = !DILocation(line: 599, column: 24, scope: !608)
!621 = !DILocation(line: 599, column: 23, scope: !608)
!622 = !DILocation(line: 599, column: 36, scope: !608)
!623 = !DILocation(line: 599, column: 44, scope: !608)
!624 = !DILocation(line: 599, column: 43, scope: !608)
!625 = !DILocation(line: 599, column: 33, scope: !608)
!626 = !DILocation(line: 599, column: 12, scope: !608)
!627 = !DILocation(line: 600, column: 6, scope: !628)
!628 = distinct !DILexicalBlock(scope: !608, file: !64, line: 600, column: 6)
!629 = !DILocation(line: 600, column: 15, scope: !628)
!630 = !DILocation(line: 600, column: 6, scope: !608)
!631 = !DILocation(line: 602, column: 11, scope: !632)
!632 = distinct !DILexicalBlock(scope: !628, file: !64, line: 601, column: 3)
!633 = !DILocation(line: 602, column: 20, scope: !632)
!634 = !DILocation(line: 602, column: 4, scope: !632)
!635 = !DILocation(line: 606, column: 4, scope: !636)
!636 = distinct !DILexicalBlock(scope: !628, file: !64, line: 605, column: 3)
!637 = !DILocation(line: 610, column: 1, scope: !587)
!638 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 629, type: !639, scopeLine: 630, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!639 = !DISubroutineType(types: !640)
!640 = !{!16, !16, !25, !16}
!641 = !DILocalVariable(name: "factor1", arg: 1, scope: !638, file: !64, line: 629, type: !16)
!642 = !DILocation(line: 629, column: 33, scope: !638)
!643 = !DILocalVariable(name: "factor2", arg: 2, scope: !638, file: !64, line: 629, type: !25)
!644 = !DILocation(line: 629, column: 46, scope: !638)
!645 = !DILocalVariable(name: "denominator", arg: 3, scope: !638, file: !64, line: 629, type: !16)
!646 = !DILocation(line: 629, column: 59, scope: !638)
!647 = !DILocalVariable(name: "s32Result", scope: !638, file: !64, line: 631, type: !12)
!648 = !DILocation(line: 631, column: 6, scope: !638)
!649 = !DILocalVariable(name: "s32Temp1", scope: !638, file: !64, line: 631, type: !12)
!650 = !DILocation(line: 631, column: 21, scope: !638)
!651 = !DILocation(line: 632, column: 14, scope: !638)
!652 = !DILocation(line: 632, column: 24, scope: !638)
!653 = !DILocation(line: 632, column: 22, scope: !638)
!654 = !DILocation(line: 632, column: 12, scope: !638)
!655 = !DILocation(line: 633, column: 5, scope: !656)
!656 = distinct !DILexicalBlock(scope: !638, file: !64, line: 633, column: 5)
!657 = !DILocation(line: 633, column: 17, scope: !656)
!658 = !DILocation(line: 633, column: 5, scope: !638)
!659 = !DILocation(line: 635, column: 6, scope: !660)
!660 = distinct !DILexicalBlock(scope: !661, file: !64, line: 635, column: 6)
!661 = distinct !DILexicalBlock(scope: !656, file: !64, line: 634, column: 2)
!662 = !DILocation(line: 635, column: 16, scope: !660)
!663 = !DILocation(line: 635, column: 6, scope: !661)
!664 = !DILocation(line: 637, column: 4, scope: !665)
!665 = distinct !DILexicalBlock(scope: !660, file: !64, line: 636, column: 3)
!666 = !DILocation(line: 641, column: 4, scope: !667)
!667 = distinct !DILexicalBlock(scope: !660, file: !64, line: 640, column: 3)
!668 = !DILocation(line: 646, column: 14, scope: !669)
!669 = distinct !DILexicalBlock(scope: !656, file: !64, line: 645, column: 2)
!670 = !DILocation(line: 646, column: 27, scope: !669)
!671 = !DILocation(line: 646, column: 37, scope: !669)
!672 = !DILocation(line: 646, column: 36, scope: !669)
!673 = !DILocation(line: 646, column: 50, scope: !669)
!674 = !DILocation(line: 646, column: 49, scope: !669)
!675 = !DILocation(line: 646, column: 24, scope: !669)
!676 = !DILocation(line: 646, column: 12, scope: !669)
!677 = !DILocation(line: 647, column: 14, scope: !669)
!678 = !DILocation(line: 647, column: 23, scope: !669)
!679 = !DILocation(line: 647, column: 12, scope: !669)
!680 = !DILocation(line: 648, column: 16, scope: !669)
!681 = !DILocation(line: 648, column: 25, scope: !669)
!682 = !DILocation(line: 648, column: 24, scope: !669)
!683 = !DILocation(line: 648, column: 41, scope: !669)
!684 = !DILocation(line: 648, column: 51, scope: !669)
!685 = !DILocation(line: 648, column: 50, scope: !669)
!686 = !DILocation(line: 648, column: 38, scope: !669)
!687 = !DILocation(line: 648, column: 13, scope: !669)
!688 = !DILocation(line: 649, column: 6, scope: !689)
!689 = distinct !DILexicalBlock(scope: !669, file: !64, line: 649, column: 6)
!690 = !DILocation(line: 649, column: 16, scope: !689)
!691 = !DILocation(line: 649, column: 6, scope: !669)
!692 = !DILocation(line: 651, column: 7, scope: !693)
!693 = distinct !DILexicalBlock(scope: !694, file: !64, line: 651, column: 7)
!694 = distinct !DILexicalBlock(scope: !689, file: !64, line: 650, column: 3)
!695 = !DILocation(line: 651, column: 17, scope: !693)
!696 = !DILocation(line: 651, column: 7, scope: !694)
!697 = !DILocation(line: 653, column: 17, scope: !698)
!698 = distinct !DILexicalBlock(scope: !693, file: !64, line: 652, column: 4)
!699 = !DILocation(line: 653, column: 12, scope: !698)
!700 = !DILocation(line: 653, column: 5, scope: !698)
!701 = !DILocation(line: 658, column: 5, scope: !702)
!702 = distinct !DILexicalBlock(scope: !693, file: !64, line: 657, column: 4)
!703 = !DILocation(line: 663, column: 4, scope: !704)
!704 = distinct !DILexicalBlock(scope: !689, file: !64, line: 662, column: 3)
!705 = !DILocation(line: 667, column: 1, scope: !638)
!706 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !64, file: !64, line: 685, type: !707, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!707 = !DISubroutineType(types: !708)
!708 = !{!16, !25, !16, !25}
!709 = !DILocalVariable(name: "factor1", arg: 1, scope: !706, file: !64, line: 685, type: !25)
!710 = !DILocation(line: 685, column: 33, scope: !706)
!711 = !DILocalVariable(name: "factor2", arg: 2, scope: !706, file: !64, line: 685, type: !16)
!712 = !DILocation(line: 685, column: 46, scope: !706)
!713 = !DILocalVariable(name: "denominator", arg: 3, scope: !706, file: !64, line: 685, type: !25)
!714 = !DILocation(line: 685, column: 59, scope: !706)
!715 = !DILocalVariable(name: "s32Result", scope: !706, file: !64, line: 687, type: !12)
!716 = !DILocation(line: 687, column: 6, scope: !706)
!717 = !DILocalVariable(name: "s32Temp1", scope: !706, file: !64, line: 687, type: !12)
!718 = !DILocation(line: 687, column: 21, scope: !706)
!719 = !DILocation(line: 688, column: 14, scope: !706)
!720 = !DILocation(line: 688, column: 24, scope: !706)
!721 = !DILocation(line: 688, column: 22, scope: !706)
!722 = !DILocation(line: 688, column: 12, scope: !706)
!723 = !DILocation(line: 689, column: 5, scope: !724)
!724 = distinct !DILexicalBlock(scope: !706, file: !64, line: 689, column: 5)
!725 = !DILocation(line: 689, column: 16, scope: !724)
!726 = !DILocation(line: 689, column: 5, scope: !706)
!727 = !DILocation(line: 691, column: 6, scope: !728)
!728 = distinct !DILexicalBlock(scope: !729, file: !64, line: 691, column: 6)
!729 = distinct !DILexicalBlock(scope: !724, file: !64, line: 690, column: 2)
!730 = !DILocation(line: 691, column: 16, scope: !728)
!731 = !DILocation(line: 691, column: 6, scope: !729)
!732 = !DILocation(line: 693, column: 4, scope: !733)
!733 = distinct !DILexicalBlock(scope: !728, file: !64, line: 692, column: 3)
!734 = !DILocation(line: 697, column: 4, scope: !735)
!735 = distinct !DILexicalBlock(scope: !728, file: !64, line: 696, column: 3)
!736 = !DILocation(line: 702, column: 14, scope: !737)
!737 = distinct !DILexicalBlock(scope: !724, file: !64, line: 701, column: 2)
!738 = !DILocation(line: 702, column: 28, scope: !737)
!739 = !DILocation(line: 702, column: 38, scope: !737)
!740 = !DILocation(line: 702, column: 37, scope: !737)
!741 = !DILocation(line: 702, column: 53, scope: !737)
!742 = !DILocation(line: 702, column: 51, scope: !737)
!743 = !DILocation(line: 702, column: 24, scope: !737)
!744 = !DILocation(line: 702, column: 66, scope: !737)
!745 = !DILocation(line: 702, column: 12, scope: !737)
!746 = !DILocation(line: 703, column: 16, scope: !737)
!747 = !DILocation(line: 703, column: 25, scope: !737)
!748 = !DILocation(line: 703, column: 24, scope: !737)
!749 = !DILocation(line: 703, column: 41, scope: !737)
!750 = !DILocation(line: 703, column: 51, scope: !737)
!751 = !DILocation(line: 703, column: 50, scope: !737)
!752 = !DILocation(line: 703, column: 38, scope: !737)
!753 = !DILocation(line: 703, column: 13, scope: !737)
!754 = !DILocation(line: 704, column: 6, scope: !755)
!755 = distinct !DILexicalBlock(scope: !737, file: !64, line: 704, column: 6)
!756 = !DILocation(line: 704, column: 16, scope: !755)
!757 = !DILocation(line: 704, column: 6, scope: !737)
!758 = !DILocation(line: 706, column: 7, scope: !759)
!759 = distinct !DILexicalBlock(scope: !760, file: !64, line: 706, column: 7)
!760 = distinct !DILexicalBlock(scope: !755, file: !64, line: 705, column: 3)
!761 = !DILocation(line: 706, column: 17, scope: !759)
!762 = !DILocation(line: 706, column: 7, scope: !760)
!763 = !DILocation(line: 708, column: 17, scope: !764)
!764 = distinct !DILexicalBlock(scope: !759, file: !64, line: 707, column: 4)
!765 = !DILocation(line: 708, column: 12, scope: !764)
!766 = !DILocation(line: 708, column: 5, scope: !764)
!767 = !DILocation(line: 712, column: 5, scope: !768)
!768 = distinct !DILexicalBlock(scope: !759, file: !64, line: 711, column: 4)
!769 = !DILocation(line: 717, column: 4, scope: !770)
!770 = distinct !DILexicalBlock(scope: !755, file: !64, line: 716, column: 3)
!771 = !DILocation(line: 720, column: 1, scope: !706)
!772 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 739, type: !773, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!773 = !DISubroutineType(types: !774)
!774 = !{!25, !16, !25, !16}
!775 = !DILocalVariable(name: "factor1", arg: 1, scope: !772, file: !64, line: 739, type: !16)
!776 = !DILocation(line: 739, column: 33, scope: !772)
!777 = !DILocalVariable(name: "factor2", arg: 2, scope: !772, file: !64, line: 739, type: !25)
!778 = !DILocation(line: 739, column: 46, scope: !772)
!779 = !DILocalVariable(name: "denominator", arg: 3, scope: !772, file: !64, line: 739, type: !16)
!780 = !DILocation(line: 739, column: 59, scope: !772)
!781 = !DILocalVariable(name: "u32Result", scope: !772, file: !64, line: 741, type: !450)
!782 = !DILocation(line: 741, column: 6, scope: !772)
!783 = !DILocalVariable(name: "u32Temp1", scope: !772, file: !64, line: 741, type: !450)
!784 = !DILocation(line: 741, column: 21, scope: !772)
!785 = !DILocalVariable(name: "s32Result", scope: !772, file: !64, line: 742, type: !12)
!786 = !DILocation(line: 742, column: 6, scope: !772)
!787 = !DILocalVariable(name: "s32Temp1", scope: !772, file: !64, line: 742, type: !12)
!788 = !DILocation(line: 742, column: 21, scope: !772)
!789 = !DILocation(line: 743, column: 14, scope: !772)
!790 = !DILocation(line: 743, column: 24, scope: !772)
!791 = !DILocation(line: 743, column: 22, scope: !772)
!792 = !DILocation(line: 743, column: 12, scope: !772)
!793 = !DILocation(line: 745, column: 5, scope: !794)
!794 = distinct !DILexicalBlock(scope: !772, file: !64, line: 745, column: 5)
!795 = !DILocation(line: 745, column: 17, scope: !794)
!796 = !DILocation(line: 745, column: 5, scope: !772)
!797 = !DILocation(line: 747, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !799, file: !64, line: 747, column: 6)
!799 = distinct !DILexicalBlock(scope: !794, file: !64, line: 746, column: 2)
!800 = !DILocation(line: 747, column: 16, scope: !798)
!801 = !DILocation(line: 747, column: 6, scope: !799)
!802 = !DILocation(line: 749, column: 4, scope: !803)
!803 = distinct !DILexicalBlock(scope: !798, file: !64, line: 748, column: 3)
!804 = !DILocation(line: 753, column: 4, scope: !805)
!805 = distinct !DILexicalBlock(scope: !798, file: !64, line: 752, column: 3)
!806 = !DILocation(line: 758, column: 15, scope: !807)
!807 = distinct !DILexicalBlock(scope: !794, file: !64, line: 757, column: 2)
!808 = !DILocation(line: 758, column: 29, scope: !807)
!809 = !DILocation(line: 758, column: 39, scope: !807)
!810 = !DILocation(line: 758, column: 38, scope: !807)
!811 = !DILocation(line: 758, column: 54, scope: !807)
!812 = !DILocation(line: 758, column: 52, scope: !807)
!813 = !DILocation(line: 758, column: 25, scope: !807)
!814 = !DILocation(line: 758, column: 68, scope: !807)
!815 = !DILocation(line: 758, column: 12, scope: !807)
!816 = !DILocation(line: 759, column: 16, scope: !807)
!817 = !DILocation(line: 759, column: 25, scope: !807)
!818 = !DILocation(line: 759, column: 24, scope: !807)
!819 = !DILocation(line: 759, column: 41, scope: !807)
!820 = !DILocation(line: 759, column: 51, scope: !807)
!821 = !DILocation(line: 759, column: 50, scope: !807)
!822 = !DILocation(line: 759, column: 38, scope: !807)
!823 = !DILocation(line: 759, column: 13, scope: !807)
!824 = !DILocation(line: 760, column: 6, scope: !825)
!825 = distinct !DILexicalBlock(scope: !807, file: !64, line: 760, column: 6)
!826 = !DILocation(line: 760, column: 16, scope: !825)
!827 = !DILocation(line: 760, column: 6, scope: !807)
!828 = !DILocation(line: 762, column: 7, scope: !829)
!829 = distinct !DILexicalBlock(scope: !830, file: !64, line: 762, column: 7)
!830 = distinct !DILexicalBlock(scope: !825, file: !64, line: 761, column: 3)
!831 = !DILocation(line: 762, column: 17, scope: !829)
!832 = !DILocation(line: 762, column: 7, scope: !830)
!833 = !DILocation(line: 764, column: 17, scope: !834)
!834 = distinct !DILexicalBlock(scope: !829, file: !64, line: 763, column: 4)
!835 = !DILocation(line: 764, column: 12, scope: !834)
!836 = !DILocation(line: 764, column: 5, scope: !834)
!837 = !DILocation(line: 768, column: 5, scope: !838)
!838 = distinct !DILexicalBlock(scope: !829, file: !64, line: 767, column: 4)
!839 = !DILocation(line: 773, column: 4, scope: !840)
!840 = distinct !DILexicalBlock(scope: !825, file: !64, line: 772, column: 3)
!841 = !DILocation(line: 776, column: 1, scope: !772)
!842 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !64, file: !64, line: 795, type: !843, scopeLine: 796, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!843 = !DISubroutineType(types: !844)
!844 = !{!25, !16, !25, !25}
!845 = !DILocalVariable(name: "factor1", arg: 1, scope: !842, file: !64, line: 795, type: !16)
!846 = !DILocation(line: 795, column: 33, scope: !842)
!847 = !DILocalVariable(name: "factor2", arg: 2, scope: !842, file: !64, line: 795, type: !25)
!848 = !DILocation(line: 795, column: 46, scope: !842)
!849 = !DILocalVariable(name: "denominator", arg: 3, scope: !842, file: !64, line: 795, type: !25)
!850 = !DILocation(line: 795, column: 59, scope: !842)
!851 = !DILocalVariable(name: "s32Result", scope: !842, file: !64, line: 797, type: !12)
!852 = !DILocation(line: 797, column: 6, scope: !842)
!853 = !DILocalVariable(name: "s32Temp1", scope: !842, file: !64, line: 797, type: !12)
!854 = !DILocation(line: 797, column: 21, scope: !842)
!855 = !DILocation(line: 798, column: 14, scope: !842)
!856 = !DILocation(line: 798, column: 24, scope: !842)
!857 = !DILocation(line: 798, column: 22, scope: !842)
!858 = !DILocation(line: 798, column: 12, scope: !842)
!859 = !DILocation(line: 800, column: 5, scope: !860)
!860 = distinct !DILexicalBlock(scope: !842, file: !64, line: 800, column: 5)
!861 = !DILocation(line: 800, column: 17, scope: !860)
!862 = !DILocation(line: 800, column: 5, scope: !842)
!863 = !DILocation(line: 802, column: 6, scope: !864)
!864 = distinct !DILexicalBlock(scope: !865, file: !64, line: 802, column: 6)
!865 = distinct !DILexicalBlock(scope: !860, file: !64, line: 801, column: 2)
!866 = !DILocation(line: 802, column: 16, scope: !864)
!867 = !DILocation(line: 802, column: 6, scope: !865)
!868 = !DILocation(line: 804, column: 4, scope: !869)
!869 = distinct !DILexicalBlock(scope: !864, file: !64, line: 803, column: 3)
!870 = !DILocation(line: 808, column: 4, scope: !871)
!871 = distinct !DILexicalBlock(scope: !864, file: !64, line: 807, column: 3)
!872 = !DILocation(line: 813, column: 15, scope: !873)
!873 = distinct !DILexicalBlock(scope: !860, file: !64, line: 812, column: 2)
!874 = !DILocation(line: 813, column: 29, scope: !873)
!875 = !DILocation(line: 813, column: 39, scope: !873)
!876 = !DILocation(line: 813, column: 38, scope: !873)
!877 = !DILocation(line: 813, column: 54, scope: !873)
!878 = !DILocation(line: 813, column: 52, scope: !873)
!879 = !DILocation(line: 813, column: 25, scope: !873)
!880 = !DILocation(line: 813, column: 68, scope: !873)
!881 = !DILocation(line: 813, column: 12, scope: !873)
!882 = !DILocation(line: 814, column: 16, scope: !873)
!883 = !DILocation(line: 814, column: 25, scope: !873)
!884 = !DILocation(line: 814, column: 24, scope: !873)
!885 = !DILocation(line: 814, column: 41, scope: !873)
!886 = !DILocation(line: 814, column: 51, scope: !873)
!887 = !DILocation(line: 814, column: 50, scope: !873)
!888 = !DILocation(line: 814, column: 38, scope: !873)
!889 = !DILocation(line: 814, column: 13, scope: !873)
!890 = !DILocation(line: 815, column: 6, scope: !891)
!891 = distinct !DILexicalBlock(scope: !873, file: !64, line: 815, column: 6)
!892 = !DILocation(line: 815, column: 16, scope: !891)
!893 = !DILocation(line: 815, column: 6, scope: !873)
!894 = !DILocation(line: 817, column: 7, scope: !895)
!895 = distinct !DILexicalBlock(scope: !896, file: !64, line: 817, column: 7)
!896 = distinct !DILexicalBlock(scope: !891, file: !64, line: 816, column: 3)
!897 = !DILocation(line: 817, column: 17, scope: !895)
!898 = !DILocation(line: 817, column: 7, scope: !896)
!899 = !DILocation(line: 819, column: 17, scope: !900)
!900 = distinct !DILexicalBlock(scope: !895, file: !64, line: 818, column: 4)
!901 = !DILocation(line: 819, column: 12, scope: !900)
!902 = !DILocation(line: 819, column: 5, scope: !900)
!903 = !DILocation(line: 823, column: 5, scope: !904)
!904 = distinct !DILexicalBlock(scope: !895, file: !64, line: 822, column: 4)
!905 = !DILocation(line: 828, column: 4, scope: !906)
!906 = distinct !DILexicalBlock(scope: !891, file: !64, line: 827, column: 3)
!907 = !DILocation(line: 832, column: 1, scope: !842)
!908 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !64, file: !64, line: 850, type: !909, scopeLine: 851, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!909 = !DISubroutineType(types: !910)
!910 = !{!25, !25, !25, !25}
!911 = !DILocalVariable(name: "factor1", arg: 1, scope: !908, file: !64, line: 850, type: !25)
!912 = !DILocation(line: 850, column: 33, scope: !908)
!913 = !DILocalVariable(name: "factor2", arg: 2, scope: !908, file: !64, line: 850, type: !25)
!914 = !DILocation(line: 850, column: 46, scope: !908)
!915 = !DILocalVariable(name: "denominator", arg: 3, scope: !908, file: !64, line: 850, type: !25)
!916 = !DILocation(line: 850, column: 59, scope: !908)
!917 = !DILocalVariable(name: "u32Temp1", scope: !908, file: !64, line: 852, type: !450)
!918 = !DILocation(line: 852, column: 6, scope: !908)
!919 = !DILocalVariable(name: "u16TempDenom", scope: !908, file: !64, line: 853, type: !25)
!920 = !DILocation(line: 853, column: 6, scope: !908)
!921 = !DILocation(line: 855, column: 5, scope: !922)
!922 = distinct !DILexicalBlock(scope: !908, file: !64, line: 855, column: 5)
!923 = !DILocation(line: 855, column: 17, scope: !922)
!924 = !DILocation(line: 855, column: 5, scope: !908)
!925 = !DILocation(line: 857, column: 3, scope: !926)
!926 = distinct !DILexicalBlock(scope: !922, file: !64, line: 856, column: 2)
!927 = !DILocation(line: 861, column: 14, scope: !928)
!928 = distinct !DILexicalBlock(scope: !922, file: !64, line: 860, column: 2)
!929 = !DILocation(line: 861, column: 24, scope: !928)
!930 = !DILocation(line: 861, column: 22, scope: !928)
!931 = !DILocation(line: 861, column: 12, scope: !928)
!932 = !DILocation(line: 862, column: 18, scope: !928)
!933 = !DILocation(line: 862, column: 30, scope: !928)
!934 = !DILocation(line: 862, column: 16, scope: !928)
!935 = !DILocation(line: 863, column: 14, scope: !928)
!936 = !DILocation(line: 863, column: 25, scope: !928)
!937 = !DILocation(line: 863, column: 23, scope: !928)
!938 = !DILocation(line: 863, column: 12, scope: !928)
!939 = !DILocation(line: 864, column: 14, scope: !928)
!940 = !DILocation(line: 864, column: 25, scope: !928)
!941 = !DILocation(line: 864, column: 23, scope: !928)
!942 = !DILocation(line: 864, column: 12, scope: !928)
!943 = !DILocation(line: 865, column: 6, scope: !944)
!944 = distinct !DILexicalBlock(scope: !928, file: !64, line: 865, column: 6)
!945 = !DILocation(line: 865, column: 15, scope: !944)
!946 = !DILocation(line: 865, column: 6, scope: !928)
!947 = !DILocation(line: 867, column: 12, scope: !948)
!948 = distinct !DILexicalBlock(scope: !944, file: !64, line: 866, column: 3)
!949 = !DILocation(line: 867, column: 21, scope: !948)
!950 = !DILocation(line: 867, column: 11, scope: !948)
!951 = !DILocation(line: 867, column: 4, scope: !948)
!952 = !DILocation(line: 872, column: 4, scope: !953)
!953 = distinct !DILexicalBlock(scope: !944, file: !64, line: 871, column: 3)
!954 = !DILocation(line: 877, column: 1, scope: !908)
!955 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !64, file: !64, line: 894, type: !956, scopeLine: 895, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!956 = !DISubroutineType(types: !957)
!957 = !{!25, !25, !25, !450}
!958 = !DILocalVariable(name: "factor1", arg: 1, scope: !955, file: !64, line: 894, type: !25)
!959 = !DILocation(line: 894, column: 33, scope: !955)
!960 = !DILocalVariable(name: "factor2", arg: 2, scope: !955, file: !64, line: 894, type: !25)
!961 = !DILocation(line: 894, column: 46, scope: !955)
!962 = !DILocalVariable(name: "denominator", arg: 3, scope: !955, file: !64, line: 894, type: !450)
!963 = !DILocation(line: 894, column: 59, scope: !955)
!964 = !DILocalVariable(name: "u32Temp1", scope: !955, file: !64, line: 896, type: !450)
!965 = !DILocation(line: 896, column: 6, scope: !955)
!966 = !DILocation(line: 897, column: 5, scope: !967)
!967 = distinct !DILexicalBlock(scope: !955, file: !64, line: 897, column: 5)
!968 = !DILocation(line: 897, column: 17, scope: !967)
!969 = !DILocation(line: 897, column: 5, scope: !955)
!970 = !DILocation(line: 899, column: 3, scope: !971)
!971 = distinct !DILexicalBlock(scope: !967, file: !64, line: 898, column: 2)
!972 = !DILocation(line: 903, column: 15, scope: !973)
!973 = distinct !DILexicalBlock(scope: !967, file: !64, line: 902, column: 2)
!974 = !DILocation(line: 903, column: 25, scope: !973)
!975 = !DILocation(line: 903, column: 23, scope: !973)
!976 = !DILocation(line: 903, column: 36, scope: !973)
!977 = !DILocation(line: 903, column: 34, scope: !973)
!978 = !DILocation(line: 903, column: 12, scope: !973)
!979 = !DILocation(line: 904, column: 8, scope: !980)
!980 = distinct !DILexicalBlock(scope: !973, file: !64, line: 904, column: 6)
!981 = !DILocation(line: 904, column: 18, scope: !980)
!982 = !DILocation(line: 904, column: 16, scope: !980)
!983 = !DILocation(line: 904, column: 28, scope: !980)
!984 = !DILocation(line: 904, column: 40, scope: !980)
!985 = !DILocation(line: 904, column: 39, scope: !980)
!986 = !DILocation(line: 904, column: 26, scope: !980)
!987 = !DILocation(line: 904, column: 53, scope: !980)
!988 = !DILocation(line: 904, column: 64, scope: !980)
!989 = !DILocation(line: 904, column: 50, scope: !980)
!990 = !DILocation(line: 904, column: 6, scope: !973)
!991 = !DILocation(line: 906, column: 12, scope: !992)
!992 = distinct !DILexicalBlock(scope: !980, file: !64, line: 905, column: 3)
!993 = !DILocation(line: 907, column: 3, scope: !992)
!994 = !DILocation(line: 908, column: 6, scope: !995)
!995 = distinct !DILexicalBlock(scope: !973, file: !64, line: 908, column: 6)
!996 = !DILocation(line: 908, column: 15, scope: !995)
!997 = !DILocation(line: 908, column: 6, scope: !973)
!998 = !DILocation(line: 910, column: 12, scope: !999)
!999 = distinct !DILexicalBlock(scope: !995, file: !64, line: 909, column: 3)
!1000 = !DILocation(line: 910, column: 21, scope: !999)
!1001 = !DILocation(line: 910, column: 11, scope: !999)
!1002 = !DILocation(line: 910, column: 4, scope: !999)
!1003 = !DILocation(line: 914, column: 4, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !995, file: !64, line: 913, column: 3)
!1005 = !DILocation(line: 917, column: 1, scope: !955)
!1006 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !64, file: !64, line: 934, type: !1007, scopeLine: 935, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!450, !450, !25}
!1009 = !DILocalVariable(name: "x_value", arg: 1, scope: !1006, file: !64, line: 934, type: !450)
!1010 = !DILocation(line: 934, column: 25, scope: !1006)
!1011 = !DILocalVariable(name: "y_value", arg: 2, scope: !1006, file: !64, line: 934, type: !25)
!1012 = !DILocation(line: 934, column: 38, scope: !1006)
!1013 = !DILocalVariable(name: "u32Temp1", scope: !1006, file: !64, line: 936, type: !450)
!1014 = !DILocation(line: 936, column: 6, scope: !1006)
!1015 = !DILocation(line: 937, column: 5, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1006, file: !64, line: 937, column: 5)
!1017 = !DILocation(line: 937, column: 13, scope: !1016)
!1018 = !DILocation(line: 937, column: 5, scope: !1006)
!1019 = !DILocation(line: 939, column: 3, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1016, file: !64, line: 938, column: 2)
!1021 = !DILocation(line: 943, column: 15, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1016, file: !64, line: 942, column: 2)
!1023 = !DILocation(line: 943, column: 26, scope: !1022)
!1024 = !DILocation(line: 943, column: 34, scope: !1022)
!1025 = !DILocation(line: 943, column: 33, scope: !1022)
!1026 = !DILocation(line: 943, column: 45, scope: !1022)
!1027 = !DILocation(line: 943, column: 43, scope: !1022)
!1028 = !DILocation(line: 943, column: 23, scope: !1022)
!1029 = !DILocation(line: 943, column: 54, scope: !1022)
!1030 = !DILocation(line: 943, column: 12, scope: !1022)
!1031 = !DILocation(line: 944, column: 15, scope: !1022)
!1032 = !DILocation(line: 944, column: 23, scope: !1022)
!1033 = !DILocation(line: 944, column: 22, scope: !1022)
!1034 = !DILocation(line: 944, column: 35, scope: !1022)
!1035 = !DILocation(line: 944, column: 44, scope: !1022)
!1036 = !DILocation(line: 944, column: 43, scope: !1022)
!1037 = !DILocation(line: 944, column: 32, scope: !1022)
!1038 = !DILocation(line: 944, column: 12, scope: !1022)
!1039 = !DILocation(line: 945, column: 10, scope: !1022)
!1040 = !DILocation(line: 945, column: 3, scope: !1022)
!1041 = !DILocation(line: 947, column: 1, scope: !1006)
!1042 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !64, file: !64, line: 965, type: !1043, scopeLine: 966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!16, !16, !16, !16}
!1045 = !DILocalVariable(name: "fak1", arg: 1, scope: !1042, file: !64, line: 965, type: !16)
!1046 = !DILocation(line: 965, column: 33, scope: !1042)
!1047 = !DILocalVariable(name: "fak2", arg: 2, scope: !1042, file: !64, line: 965, type: !16)
!1048 = !DILocation(line: 965, column: 43, scope: !1042)
!1049 = !DILocalVariable(name: "div", arg: 3, scope: !1042, file: !64, line: 965, type: !16)
!1050 = !DILocation(line: 965, column: 53, scope: !1042)
!1051 = !DILocalVariable(name: "s32Temp1", scope: !1042, file: !64, line: 967, type: !12)
!1052 = !DILocation(line: 967, column: 6, scope: !1042)
!1053 = !DILocalVariable(name: "s32Temp2", scope: !1042, file: !64, line: 967, type: !12)
!1054 = !DILocation(line: 967, column: 20, scope: !1042)
!1055 = !DILocalVariable(name: "s32Temp3", scope: !1042, file: !64, line: 967, type: !12)
!1056 = !DILocation(line: 967, column: 34, scope: !1042)
!1057 = !DILocation(line: 968, column: 13, scope: !1042)
!1058 = !DILocation(line: 968, column: 20, scope: !1042)
!1059 = !DILocation(line: 968, column: 18, scope: !1042)
!1060 = !DILocation(line: 968, column: 11, scope: !1042)
!1061 = !DILocation(line: 969, column: 5, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1042, file: !64, line: 969, column: 5)
!1063 = !DILocation(line: 969, column: 9, scope: !1062)
!1064 = !DILocation(line: 969, column: 5, scope: !1042)
!1065 = !DILocation(line: 971, column: 6, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1067, file: !64, line: 971, column: 6)
!1067 = distinct !DILexicalBlock(scope: !1062, file: !64, line: 970, column: 2)
!1068 = !DILocation(line: 971, column: 15, scope: !1066)
!1069 = !DILocation(line: 971, column: 6, scope: !1067)
!1070 = !DILocation(line: 973, column: 4, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1066, file: !64, line: 972, column: 3)
!1072 = !DILocation(line: 977, column: 4, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1066, file: !64, line: 976, column: 3)
!1074 = !DILocation(line: 982, column: 15, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1062, file: !64, line: 981, column: 2)
!1076 = !DILocation(line: 982, column: 28, scope: !1075)
!1077 = !DILocation(line: 982, column: 39, scope: !1075)
!1078 = !DILocation(line: 982, column: 37, scope: !1075)
!1079 = !DILocation(line: 982, column: 46, scope: !1075)
!1080 = !DILocation(line: 982, column: 44, scope: !1075)
!1081 = !DILocation(line: 982, column: 24, scope: !1075)
!1082 = !DILocation(line: 982, column: 52, scope: !1075)
!1083 = !DILocation(line: 982, column: 12, scope: !1075)
!1084 = !DILocation(line: 983, column: 15, scope: !1075)
!1085 = !DILocation(line: 983, column: 24, scope: !1075)
!1086 = !DILocation(line: 983, column: 23, scope: !1075)
!1087 = !DILocation(line: 983, column: 32, scope: !1075)
!1088 = !DILocation(line: 983, column: 41, scope: !1075)
!1089 = !DILocation(line: 983, column: 40, scope: !1075)
!1090 = !DILocation(line: 983, column: 29, scope: !1075)
!1091 = !DILocation(line: 983, column: 12, scope: !1075)
!1092 = !DILocation(line: 984, column: 6, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1075, file: !64, line: 984, column: 6)
!1094 = !DILocation(line: 984, column: 15, scope: !1093)
!1095 = !DILocation(line: 984, column: 6, scope: !1075)
!1096 = !DILocation(line: 986, column: 7, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1098, file: !64, line: 986, column: 7)
!1098 = distinct !DILexicalBlock(scope: !1093, file: !64, line: 985, column: 3)
!1099 = !DILocation(line: 986, column: 16, scope: !1097)
!1100 = !DILocation(line: 986, column: 7, scope: !1098)
!1101 = !DILocation(line: 988, column: 17, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1097, file: !64, line: 987, column: 4)
!1103 = !DILocation(line: 988, column: 12, scope: !1102)
!1104 = !DILocation(line: 988, column: 5, scope: !1102)
!1105 = !DILocation(line: 992, column: 5, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1097, file: !64, line: 991, column: 4)
!1107 = !DILocation(line: 997, column: 4, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1093, file: !64, line: 996, column: 3)
!1109 = !DILocation(line: 1000, column: 1, scope: !1042)
!1110 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !64, file: !64, line: 1018, type: !1111, scopeLine: 1019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{!16, !16, !16, !25}
!1113 = !DILocalVariable(name: "data1", arg: 1, scope: !1110, file: !64, line: 1018, type: !16)
!1114 = !DILocation(line: 1018, column: 33, scope: !1110)
!1115 = !DILocalVariable(name: "data2", arg: 2, scope: !1110, file: !64, line: 1018, type: !16)
!1116 = !DILocation(line: 1018, column: 43, scope: !1110)
!1117 = !DILocalVariable(name: "denominator", arg: 3, scope: !1110, file: !64, line: 1018, type: !25)
!1118 = !DILocation(line: 1018, column: 53, scope: !1110)
!1119 = !DILocalVariable(name: "s32Result", scope: !1110, file: !64, line: 1020, type: !12)
!1120 = !DILocation(line: 1020, column: 6, scope: !1110)
!1121 = !DILocalVariable(name: "s32Temp1", scope: !1110, file: !64, line: 1020, type: !12)
!1122 = !DILocation(line: 1020, column: 21, scope: !1110)
!1123 = !DILocation(line: 1021, column: 14, scope: !1110)
!1124 = !DILocation(line: 1021, column: 22, scope: !1110)
!1125 = !DILocation(line: 1021, column: 20, scope: !1110)
!1126 = !DILocation(line: 1021, column: 12, scope: !1110)
!1127 = !DILocation(line: 1023, column: 5, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1110, file: !64, line: 1023, column: 5)
!1129 = !DILocation(line: 1023, column: 17, scope: !1128)
!1130 = !DILocation(line: 1023, column: 5, scope: !1110)
!1131 = !DILocation(line: 1025, column: 6, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1133, file: !64, line: 1025, column: 6)
!1133 = distinct !DILexicalBlock(scope: !1128, file: !64, line: 1024, column: 2)
!1134 = !DILocation(line: 1025, column: 16, scope: !1132)
!1135 = !DILocation(line: 1025, column: 6, scope: !1133)
!1136 = !DILocation(line: 1027, column: 4, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1132, file: !64, line: 1026, column: 3)
!1138 = !DILocation(line: 1029, column: 11, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1132, file: !64, line: 1029, column: 11)
!1140 = !DILocation(line: 1029, column: 21, scope: !1139)
!1141 = !DILocation(line: 1029, column: 11, scope: !1132)
!1142 = !DILocation(line: 1031, column: 4, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1139, file: !64, line: 1030, column: 3)
!1144 = !DILocation(line: 1035, column: 4, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1139, file: !64, line: 1034, column: 3)
!1146 = !DILocation(line: 1040, column: 15, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1128, file: !64, line: 1039, column: 2)
!1148 = !DILocation(line: 1040, column: 28, scope: !1147)
!1149 = !DILocation(line: 1040, column: 38, scope: !1147)
!1150 = !DILocation(line: 1040, column: 37, scope: !1147)
!1151 = !DILocation(line: 1040, column: 51, scope: !1147)
!1152 = !DILocation(line: 1040, column: 50, scope: !1147)
!1153 = !DILocation(line: 1040, column: 25, scope: !1147)
!1154 = !DILocation(line: 1040, column: 64, scope: !1147)
!1155 = !DILocation(line: 1040, column: 12, scope: !1147)
!1156 = !DILocation(line: 1041, column: 16, scope: !1147)
!1157 = !DILocation(line: 1041, column: 25, scope: !1147)
!1158 = !DILocation(line: 1041, column: 24, scope: !1147)
!1159 = !DILocation(line: 1041, column: 41, scope: !1147)
!1160 = !DILocation(line: 1041, column: 51, scope: !1147)
!1161 = !DILocation(line: 1041, column: 50, scope: !1147)
!1162 = !DILocation(line: 1041, column: 38, scope: !1147)
!1163 = !DILocation(line: 1041, column: 13, scope: !1147)
!1164 = !DILocation(line: 1042, column: 6, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1147, file: !64, line: 1042, column: 6)
!1166 = !DILocation(line: 1042, column: 16, scope: !1165)
!1167 = !DILocation(line: 1042, column: 6, scope: !1147)
!1168 = !DILocation(line: 1044, column: 7, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1170, file: !64, line: 1044, column: 7)
!1170 = distinct !DILexicalBlock(scope: !1165, file: !64, line: 1043, column: 3)
!1171 = !DILocation(line: 1044, column: 17, scope: !1169)
!1172 = !DILocation(line: 1044, column: 7, scope: !1170)
!1173 = !DILocation(line: 1046, column: 17, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1169, file: !64, line: 1045, column: 4)
!1175 = !DILocation(line: 1046, column: 12, scope: !1174)
!1176 = !DILocation(line: 1046, column: 5, scope: !1174)
!1177 = !DILocation(line: 1050, column: 5, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1169, file: !64, line: 1049, column: 4)
!1179 = !DILocation(line: 1055, column: 4, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1165, file: !64, line: 1054, column: 3)
!1181 = !DILocation(line: 1059, column: 1, scope: !1110)
!1182 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !64, file: !64, line: 1076, type: !1183, scopeLine: 1077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!450, !450, !12}
!1185 = !DILocalVariable(name: "numerator", arg: 1, scope: !1182, file: !64, line: 1076, type: !450)
!1186 = !DILocation(line: 1076, column: 25, scope: !1182)
!1187 = !DILocalVariable(name: "denominator", arg: 2, scope: !1182, file: !64, line: 1076, type: !12)
!1188 = !DILocation(line: 1076, column: 40, scope: !1182)
!1189 = !DILocalVariable(name: "u32Temp1", scope: !1182, file: !64, line: 1078, type: !450)
!1190 = !DILocation(line: 1078, column: 6, scope: !1182)
!1191 = !DILocation(line: 1079, column: 5, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1182, file: !64, line: 1079, column: 5)
!1193 = !DILocation(line: 1079, column: 17, scope: !1192)
!1194 = !DILocation(line: 1079, column: 5, scope: !1182)
!1195 = !DILocation(line: 1081, column: 3, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1192, file: !64, line: 1080, column: 2)
!1197 = !DILocation(line: 1085, column: 6, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1199, file: !64, line: 1085, column: 6)
!1199 = distinct !DILexicalBlock(scope: !1192, file: !64, line: 1084, column: 2)
!1200 = !DILocation(line: 1085, column: 18, scope: !1198)
!1201 = !DILocation(line: 1085, column: 6, scope: !1199)
!1202 = !DILocation(line: 1087, column: 4, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1198, file: !64, line: 1086, column: 3)
!1204 = !DILocation(line: 1091, column: 16, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1198, file: !64, line: 1090, column: 3)
!1206 = !DILocation(line: 1091, column: 30, scope: !1205)
!1207 = !DILocation(line: 1091, column: 40, scope: !1205)
!1208 = !DILocation(line: 1091, column: 39, scope: !1205)
!1209 = !DILocation(line: 1091, column: 55, scope: !1205)
!1210 = !DILocation(line: 1091, column: 53, scope: !1205)
!1211 = !DILocation(line: 1091, column: 26, scope: !1205)
!1212 = !DILocation(line: 1091, column: 68, scope: !1205)
!1213 = !DILocation(line: 1091, column: 13, scope: !1205)
!1214 = !DILocation(line: 1092, column: 16, scope: !1205)
!1215 = !DILocation(line: 1092, column: 25, scope: !1205)
!1216 = !DILocation(line: 1092, column: 24, scope: !1205)
!1217 = !DILocation(line: 1092, column: 41, scope: !1205)
!1218 = !DILocation(line: 1092, column: 51, scope: !1205)
!1219 = !DILocation(line: 1092, column: 50, scope: !1205)
!1220 = !DILocation(line: 1092, column: 38, scope: !1205)
!1221 = !DILocation(line: 1092, column: 13, scope: !1205)
!1222 = !DILocation(line: 1093, column: 11, scope: !1205)
!1223 = !DILocation(line: 1093, column: 4, scope: !1205)
!1224 = !DILocation(line: 1096, column: 1, scope: !1182)
!1225 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !64, file: !64, line: 1113, type: !1226, scopeLine: 1114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1226 = !DISubroutineType(types: !1227)
!1227 = !{!450, !12, !450}
!1228 = !DILocalVariable(name: "numerator", arg: 1, scope: !1225, file: !64, line: 1113, type: !12)
!1229 = !DILocation(line: 1113, column: 25, scope: !1225)
!1230 = !DILocalVariable(name: "denominator", arg: 2, scope: !1225, file: !64, line: 1113, type: !450)
!1231 = !DILocation(line: 1113, column: 40, scope: !1225)
!1232 = !DILocalVariable(name: "s32Temp1", scope: !1225, file: !64, line: 1115, type: !12)
!1233 = !DILocation(line: 1115, column: 6, scope: !1225)
!1234 = !DILocation(line: 1116, column: 5, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1225, file: !64, line: 1116, column: 5)
!1236 = !DILocation(line: 1116, column: 17, scope: !1235)
!1237 = !DILocation(line: 1116, column: 5, scope: !1225)
!1238 = !DILocation(line: 1118, column: 6, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1240, file: !64, line: 1118, column: 6)
!1240 = distinct !DILexicalBlock(scope: !1235, file: !64, line: 1117, column: 2)
!1241 = !DILocation(line: 1118, column: 16, scope: !1239)
!1242 = !DILocation(line: 1118, column: 6, scope: !1240)
!1243 = !DILocation(line: 1120, column: 4, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1239, file: !64, line: 1119, column: 3)
!1245 = !DILocation(line: 1124, column: 4, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1239, file: !64, line: 1123, column: 3)
!1247 = !DILocation(line: 1129, column: 6, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1249, file: !64, line: 1129, column: 6)
!1249 = distinct !DILexicalBlock(scope: !1235, file: !64, line: 1128, column: 2)
!1250 = !DILocation(line: 1129, column: 16, scope: !1248)
!1251 = !DILocation(line: 1129, column: 6, scope: !1249)
!1252 = !DILocation(line: 1131, column: 17, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1248, file: !64, line: 1130, column: 3)
!1254 = !DILocation(line: 1131, column: 31, scope: !1253)
!1255 = !DILocation(line: 1131, column: 41, scope: !1253)
!1256 = !DILocation(line: 1131, column: 40, scope: !1253)
!1257 = !DILocation(line: 1131, column: 56, scope: !1253)
!1258 = !DILocation(line: 1131, column: 54, scope: !1253)
!1259 = !DILocation(line: 1131, column: 27, scope: !1253)
!1260 = !DILocation(line: 1131, column: 69, scope: !1253)
!1261 = !DILocation(line: 1131, column: 13, scope: !1253)
!1262 = !DILocation(line: 1132, column: 13, scope: !1253)
!1263 = !DILocation(line: 1132, column: 23, scope: !1253)
!1264 = !DILocation(line: 1132, column: 22, scope: !1253)
!1265 = !DILocation(line: 1132, column: 39, scope: !1253)
!1266 = !DILocation(line: 1132, column: 48, scope: !1253)
!1267 = !DILocation(line: 1132, column: 47, scope: !1253)
!1268 = !DILocation(line: 1132, column: 36, scope: !1253)
!1269 = !DILocation(line: 1132, column: 4, scope: !1253)
!1270 = !DILocation(line: 1136, column: 4, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1248, file: !64, line: 1135, column: 3)
!1272 = !DILocation(line: 1139, column: 1, scope: !1225)
!1273 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !64, file: !64, line: 1156, type: !1274, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{!450, !12, !12}
!1276 = !DILocalVariable(name: "numerator", arg: 1, scope: !1273, file: !64, line: 1156, type: !12)
!1277 = !DILocation(line: 1156, column: 25, scope: !1273)
!1278 = !DILocalVariable(name: "denominator", arg: 2, scope: !1273, file: !64, line: 1156, type: !12)
!1279 = !DILocation(line: 1156, column: 40, scope: !1273)
!1280 = !DILocalVariable(name: "u32Temp1", scope: !1273, file: !64, line: 1158, type: !450)
!1281 = !DILocation(line: 1158, column: 6, scope: !1273)
!1282 = !DILocalVariable(name: "u32Temp2", scope: !1273, file: !64, line: 1158, type: !450)
!1283 = !DILocation(line: 1158, column: 20, scope: !1273)
!1284 = !DILocation(line: 1159, column: 5, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1273, file: !64, line: 1159, column: 5)
!1286 = !DILocation(line: 1159, column: 17, scope: !1285)
!1287 = !DILocation(line: 1159, column: 5, scope: !1273)
!1288 = !DILocation(line: 1161, column: 6, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1290, file: !64, line: 1161, column: 6)
!1290 = distinct !DILexicalBlock(scope: !1285, file: !64, line: 1160, column: 2)
!1291 = !DILocation(line: 1161, column: 16, scope: !1289)
!1292 = !DILocation(line: 1161, column: 6, scope: !1290)
!1293 = !DILocation(line: 1163, column: 4, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1289, file: !64, line: 1162, column: 3)
!1295 = !DILocation(line: 1167, column: 4, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1289, file: !64, line: 1166, column: 3)
!1297 = !DILocation(line: 1172, column: 6, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1299, file: !64, line: 1172, column: 6)
!1299 = distinct !DILexicalBlock(scope: !1285, file: !64, line: 1171, column: 2)
!1300 = !DILocation(line: 1172, column: 16, scope: !1298)
!1301 = !DILocation(line: 1172, column: 6, scope: !1299)
!1302 = !DILocation(line: 1174, column: 7, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1304, file: !64, line: 1174, column: 7)
!1304 = distinct !DILexicalBlock(scope: !1298, file: !64, line: 1173, column: 3)
!1305 = !DILocation(line: 1174, column: 17, scope: !1303)
!1306 = !DILocation(line: 1174, column: 7, scope: !1304)
!1307 = !DILocation(line: 1176, column: 5, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1303, file: !64, line: 1175, column: 4)
!1309 = !DILocation(line: 1180, column: 8, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1311, file: !64, line: 1180, column: 8)
!1311 = distinct !DILexicalBlock(scope: !1303, file: !64, line: 1179, column: 4)
!1312 = !DILocation(line: 1180, column: 20, scope: !1310)
!1313 = !DILocation(line: 1180, column: 8, scope: !1311)
!1314 = !DILocation(line: 1182, column: 6, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1310, file: !64, line: 1181, column: 5)
!1316 = !DILocation(line: 1186, column: 18, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1310, file: !64, line: 1185, column: 5)
!1318 = !DILocation(line: 1186, column: 32, scope: !1317)
!1319 = !DILocation(line: 1186, column: 42, scope: !1317)
!1320 = !DILocation(line: 1186, column: 41, scope: !1317)
!1321 = !DILocation(line: 1186, column: 57, scope: !1317)
!1322 = !DILocation(line: 1186, column: 55, scope: !1317)
!1323 = !DILocation(line: 1186, column: 28, scope: !1317)
!1324 = !DILocation(line: 1186, column: 71, scope: !1317)
!1325 = !DILocation(line: 1186, column: 15, scope: !1317)
!1326 = !DILocation(line: 1187, column: 18, scope: !1317)
!1327 = !DILocation(line: 1187, column: 29, scope: !1317)
!1328 = !DILocation(line: 1187, column: 27, scope: !1317)
!1329 = !DILocation(line: 1187, column: 45, scope: !1317)
!1330 = !DILocation(line: 1187, column: 57, scope: !1317)
!1331 = !DILocation(line: 1187, column: 55, scope: !1317)
!1332 = !DILocation(line: 1187, column: 42, scope: !1317)
!1333 = !DILocation(line: 1187, column: 15, scope: !1317)
!1334 = !DILocation(line: 1188, column: 13, scope: !1317)
!1335 = !DILocation(line: 1188, column: 6, scope: !1317)
!1336 = !DILocation(line: 1194, column: 7, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1338, file: !64, line: 1194, column: 7)
!1338 = distinct !DILexicalBlock(scope: !1298, file: !64, line: 1193, column: 3)
!1339 = !DILocation(line: 1194, column: 19, scope: !1337)
!1340 = !DILocation(line: 1194, column: 7, scope: !1338)
!1341 = !DILocation(line: 1196, column: 5, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !64, line: 1195, column: 4)
!1343 = !DILocation(line: 1200, column: 18, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1337, file: !64, line: 1199, column: 4)
!1345 = !DILocation(line: 1200, column: 17, scope: !1344)
!1346 = !DILocation(line: 1200, column: 15, scope: !1344)
!1347 = !DILocation(line: 1201, column: 20, scope: !1344)
!1348 = !DILocation(line: 1201, column: 19, scope: !1344)
!1349 = !DILocation(line: 1201, column: 17, scope: !1344)
!1350 = !DILocation(line: 1202, column: 17, scope: !1344)
!1351 = !DILocation(line: 1202, column: 31, scope: !1344)
!1352 = !DILocation(line: 1202, column: 41, scope: !1344)
!1353 = !DILocation(line: 1202, column: 40, scope: !1344)
!1354 = !DILocation(line: 1202, column: 56, scope: !1344)
!1355 = !DILocation(line: 1202, column: 54, scope: !1344)
!1356 = !DILocation(line: 1202, column: 27, scope: !1344)
!1357 = !DILocation(line: 1202, column: 70, scope: !1344)
!1358 = !DILocation(line: 1202, column: 14, scope: !1344)
!1359 = !DILocation(line: 1203, column: 17, scope: !1344)
!1360 = !DILocation(line: 1203, column: 28, scope: !1344)
!1361 = !DILocation(line: 1203, column: 26, scope: !1344)
!1362 = !DILocation(line: 1203, column: 44, scope: !1344)
!1363 = !DILocation(line: 1203, column: 56, scope: !1344)
!1364 = !DILocation(line: 1203, column: 54, scope: !1344)
!1365 = !DILocation(line: 1203, column: 41, scope: !1344)
!1366 = !DILocation(line: 1203, column: 14, scope: !1344)
!1367 = !DILocation(line: 1204, column: 12, scope: !1344)
!1368 = !DILocation(line: 1204, column: 5, scope: !1344)
!1369 = !DILocation(line: 1209, column: 1, scope: !1273)
!1370 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !64, file: !64, line: 1226, type: !1371, scopeLine: 1227, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{!450, !450, !450}
!1373 = !DILocalVariable(name: "numerator", arg: 1, scope: !1370, file: !64, line: 1226, type: !450)
!1374 = !DILocation(line: 1226, column: 25, scope: !1370)
!1375 = !DILocalVariable(name: "denominator", arg: 2, scope: !1370, file: !64, line: 1226, type: !450)
!1376 = !DILocation(line: 1226, column: 40, scope: !1370)
!1377 = !DILocalVariable(name: "u32Temp1", scope: !1370, file: !64, line: 1229, type: !450)
!1378 = !DILocation(line: 1229, column: 6, scope: !1370)
!1379 = !DILocalVariable(name: "u32Temp2", scope: !1370, file: !64, line: 1229, type: !450)
!1380 = !DILocation(line: 1229, column: 20, scope: !1370)
!1381 = !DILocalVariable(name: "u32Temp3", scope: !1370, file: !64, line: 1229, type: !450)
!1382 = !DILocation(line: 1229, column: 34, scope: !1370)
!1383 = !DILocalVariable(name: "numerator_old", scope: !1370, file: !64, line: 1229, type: !450)
!1384 = !DILocation(line: 1229, column: 48, scope: !1370)
!1385 = !DILocation(line: 1230, column: 5, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1370, file: !64, line: 1230, column: 5)
!1387 = !DILocation(line: 1230, column: 16, scope: !1386)
!1388 = !DILocation(line: 1230, column: 5, scope: !1370)
!1389 = !DILocation(line: 1232, column: 3, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1386, file: !64, line: 1231, column: 2)
!1391 = !DILocation(line: 1236, column: 14, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1386, file: !64, line: 1235, column: 2)
!1393 = !DILocation(line: 1236, column: 26, scope: !1392)
!1394 = !DILocation(line: 1236, column: 41, scope: !1392)
!1395 = !DILocation(line: 1236, column: 51, scope: !1392)
!1396 = !DILocation(line: 1236, column: 50, scope: !1392)
!1397 = !DILocation(line: 1236, column: 38, scope: !1392)
!1398 = !DILocation(line: 1236, column: 24, scope: !1392)
!1399 = !DILocation(line: 1236, column: 12, scope: !1392)
!1400 = !DILocation(line: 1237, column: 7, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1392, file: !64, line: 1237, column: 6)
!1402 = !DILocation(line: 1237, column: 16, scope: !1401)
!1403 = !DILocation(line: 1237, column: 24, scope: !1401)
!1404 = !DILocation(line: 1237, column: 6, scope: !1392)
!1405 = !DILocation(line: 1239, column: 16, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !64, line: 1238, column: 3)
!1407 = !DILocation(line: 1239, column: 27, scope: !1406)
!1408 = !DILocation(line: 1239, column: 13, scope: !1406)
!1409 = !DILocation(line: 1240, column: 3, scope: !1406)
!1410 = !DILocation(line: 1243, column: 16, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1401, file: !64, line: 1242, column: 3)
!1412 = !DILocation(line: 1243, column: 27, scope: !1411)
!1413 = !DILocation(line: 1243, column: 32, scope: !1411)
!1414 = !DILocation(line: 1243, column: 13, scope: !1411)
!1415 = !DILocation(line: 1246, column: 6, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1392, file: !64, line: 1246, column: 6)
!1417 = !DILocation(line: 1246, column: 17, scope: !1416)
!1418 = !DILocation(line: 1246, column: 15, scope: !1416)
!1419 = !DILocation(line: 1246, column: 6, scope: !1392)
!1420 = !DILocation(line: 1248, column: 12, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1416, file: !64, line: 1247, column: 3)
!1422 = !DILocation(line: 1248, column: 22, scope: !1421)
!1423 = !DILocation(line: 1248, column: 21, scope: !1421)
!1424 = !DILocation(line: 1248, column: 4, scope: !1421)
!1425 = !DILocation(line: 1252, column: 13, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1416, file: !64, line: 1251, column: 3)
!1427 = !DILocation(line: 1252, column: 23, scope: !1426)
!1428 = !DILocation(line: 1252, column: 22, scope: !1426)
!1429 = !DILocation(line: 1252, column: 36, scope: !1426)
!1430 = !DILocation(line: 1252, column: 4, scope: !1426)
!1431 = !DILocation(line: 1257, column: 1, scope: !1370)
!1432 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !64, file: !64, line: 1274, type: !1433, scopeLine: 1275, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1433 = !DISubroutineType(types: !1434)
!1434 = !{!12, !450, !12}
!1435 = !DILocalVariable(name: "numerator", arg: 1, scope: !1432, file: !64, line: 1274, type: !450)
!1436 = !DILocation(line: 1274, column: 25, scope: !1432)
!1437 = !DILocalVariable(name: "denominator", arg: 2, scope: !1432, file: !64, line: 1274, type: !12)
!1438 = !DILocation(line: 1274, column: 40, scope: !1432)
!1439 = !DILocalVariable(name: "u32Temp1", scope: !1432, file: !64, line: 1276, type: !450)
!1440 = !DILocation(line: 1276, column: 6, scope: !1432)
!1441 = !DILocalVariable(name: "u32Temp2", scope: !1432, file: !64, line: 1276, type: !450)
!1442 = !DILocation(line: 1276, column: 20, scope: !1432)
!1443 = !DILocation(line: 1277, column: 5, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1432, file: !64, line: 1277, column: 5)
!1445 = !DILocation(line: 1277, column: 17, scope: !1444)
!1446 = !DILocation(line: 1277, column: 5, scope: !1432)
!1447 = !DILocation(line: 1279, column: 6, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1449, file: !64, line: 1279, column: 6)
!1449 = distinct !DILexicalBlock(scope: !1444, file: !64, line: 1278, column: 2)
!1450 = !DILocation(line: 1279, column: 18, scope: !1448)
!1451 = !DILocation(line: 1279, column: 6, scope: !1449)
!1452 = !DILocation(line: 1281, column: 4, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1448, file: !64, line: 1280, column: 3)
!1454 = !DILocation(line: 1285, column: 19, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1448, file: !64, line: 1284, column: 3)
!1456 = !DILocation(line: 1285, column: 18, scope: !1455)
!1457 = !DILocation(line: 1285, column: 16, scope: !1455)
!1458 = !DILocation(line: 1286, column: 16, scope: !1455)
!1459 = !DILocation(line: 1286, column: 30, scope: !1455)
!1460 = !DILocation(line: 1286, column: 40, scope: !1455)
!1461 = !DILocation(line: 1286, column: 39, scope: !1455)
!1462 = !DILocation(line: 1286, column: 55, scope: !1455)
!1463 = !DILocation(line: 1286, column: 53, scope: !1455)
!1464 = !DILocation(line: 1286, column: 26, scope: !1455)
!1465 = !DILocation(line: 1286, column: 69, scope: !1455)
!1466 = !DILocation(line: 1286, column: 13, scope: !1455)
!1467 = !DILocation(line: 1287, column: 16, scope: !1455)
!1468 = !DILocation(line: 1287, column: 25, scope: !1455)
!1469 = !DILocation(line: 1287, column: 24, scope: !1455)
!1470 = !DILocation(line: 1287, column: 41, scope: !1455)
!1471 = !DILocation(line: 1287, column: 51, scope: !1455)
!1472 = !DILocation(line: 1287, column: 50, scope: !1455)
!1473 = !DILocation(line: 1287, column: 38, scope: !1455)
!1474 = !DILocation(line: 1287, column: 13, scope: !1455)
!1475 = !DILocation(line: 1288, column: 7, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1455, file: !64, line: 1288, column: 7)
!1477 = !DILocation(line: 1288, column: 16, scope: !1476)
!1478 = !DILocation(line: 1288, column: 7, scope: !1455)
!1479 = !DILocation(line: 1290, column: 13, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1476, file: !64, line: 1289, column: 4)
!1481 = !DILocation(line: 1290, column: 12, scope: !1480)
!1482 = !DILocation(line: 1290, column: 5, scope: !1480)
!1483 = !DILocation(line: 1294, column: 5, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1476, file: !64, line: 1293, column: 4)
!1485 = !DILocation(line: 1300, column: 15, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1444, file: !64, line: 1299, column: 2)
!1487 = !DILocation(line: 1300, column: 29, scope: !1486)
!1488 = !DILocation(line: 1300, column: 39, scope: !1486)
!1489 = !DILocation(line: 1300, column: 38, scope: !1486)
!1490 = !DILocation(line: 1300, column: 54, scope: !1486)
!1491 = !DILocation(line: 1300, column: 52, scope: !1486)
!1492 = !DILocation(line: 1300, column: 25, scope: !1486)
!1493 = !DILocation(line: 1300, column: 68, scope: !1486)
!1494 = !DILocation(line: 1300, column: 12, scope: !1486)
!1495 = !DILocation(line: 1301, column: 15, scope: !1486)
!1496 = !DILocation(line: 1301, column: 24, scope: !1486)
!1497 = !DILocation(line: 1301, column: 23, scope: !1486)
!1498 = !DILocation(line: 1301, column: 40, scope: !1486)
!1499 = !DILocation(line: 1301, column: 50, scope: !1486)
!1500 = !DILocation(line: 1301, column: 49, scope: !1486)
!1501 = !DILocation(line: 1301, column: 37, scope: !1486)
!1502 = !DILocation(line: 1301, column: 12, scope: !1486)
!1503 = !DILocation(line: 1302, column: 6, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1486, file: !64, line: 1302, column: 6)
!1505 = !DILocation(line: 1302, column: 15, scope: !1504)
!1506 = !DILocation(line: 1302, column: 6, scope: !1486)
!1507 = !DILocation(line: 1304, column: 11, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1504, file: !64, line: 1303, column: 3)
!1509 = !DILocation(line: 1304, column: 4, scope: !1508)
!1510 = !DILocation(line: 1308, column: 4, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1504, file: !64, line: 1307, column: 3)
!1512 = !DILocation(line: 1311, column: 1, scope: !1432)
!1513 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !64, file: !64, line: 1329, type: !1514, scopeLine: 1330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!12, !12, !450}
!1516 = !DILocalVariable(name: "numerator", arg: 1, scope: !1513, file: !64, line: 1329, type: !12)
!1517 = !DILocation(line: 1329, column: 25, scope: !1513)
!1518 = !DILocalVariable(name: "denominator", arg: 2, scope: !1513, file: !64, line: 1329, type: !450)
!1519 = !DILocation(line: 1329, column: 40, scope: !1513)
!1520 = !DILocalVariable(name: "s32Temp1", scope: !1513, file: !64, line: 1331, type: !12)
!1521 = !DILocation(line: 1331, column: 6, scope: !1513)
!1522 = !DILocalVariable(name: "s32Temp2", scope: !1513, file: !64, line: 1331, type: !12)
!1523 = !DILocation(line: 1331, column: 20, scope: !1513)
!1524 = !DILocalVariable(name: "u32Temp0", scope: !1513, file: !64, line: 1332, type: !450)
!1525 = !DILocation(line: 1332, column: 6, scope: !1513)
!1526 = !DILocalVariable(name: "u32Temp1", scope: !1513, file: !64, line: 1332, type: !450)
!1527 = !DILocation(line: 1332, column: 20, scope: !1513)
!1528 = !DILocalVariable(name: "u32Temp2", scope: !1513, file: !64, line: 1332, type: !450)
!1529 = !DILocation(line: 1332, column: 34, scope: !1513)
!1530 = !DILocation(line: 1333, column: 5, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1513, file: !64, line: 1333, column: 5)
!1532 = !DILocation(line: 1333, column: 17, scope: !1531)
!1533 = !DILocation(line: 1333, column: 5, scope: !1513)
!1534 = !DILocation(line: 1335, column: 6, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1536, file: !64, line: 1335, column: 6)
!1536 = distinct !DILexicalBlock(scope: !1531, file: !64, line: 1334, column: 2)
!1537 = !DILocation(line: 1335, column: 16, scope: !1535)
!1538 = !DILocation(line: 1335, column: 6, scope: !1536)
!1539 = !DILocation(line: 1337, column: 4, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1535, file: !64, line: 1336, column: 3)
!1541 = !DILocation(line: 1341, column: 4, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1535, file: !64, line: 1340, column: 3)
!1543 = !DILocation(line: 1346, column: 6, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1545, file: !64, line: 1346, column: 6)
!1545 = distinct !DILexicalBlock(scope: !1531, file: !64, line: 1345, column: 2)
!1546 = !DILocation(line: 1346, column: 16, scope: !1544)
!1547 = !DILocation(line: 1346, column: 6, scope: !1545)
!1548 = !DILocation(line: 1348, column: 16, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1544, file: !64, line: 1347, column: 3)
!1550 = !DILocation(line: 1348, column: 15, scope: !1549)
!1551 = !DILocation(line: 1348, column: 13, scope: !1549)
!1552 = !DILocation(line: 1349, column: 16, scope: !1549)
!1553 = !DILocation(line: 1349, column: 25, scope: !1549)
!1554 = !DILocation(line: 1349, column: 24, scope: !1549)
!1555 = !DILocation(line: 1349, column: 13, scope: !1549)
!1556 = !DILocation(line: 1350, column: 15, scope: !1549)
!1557 = !DILocation(line: 1350, column: 28, scope: !1549)
!1558 = !DILocation(line: 1350, column: 37, scope: !1549)
!1559 = !DILocation(line: 1350, column: 36, scope: !1549)
!1560 = !DILocation(line: 1350, column: 52, scope: !1549)
!1561 = !DILocation(line: 1350, column: 50, scope: !1549)
!1562 = !DILocation(line: 1350, column: 24, scope: !1549)
!1563 = !DILocation(line: 1350, column: 13, scope: !1549)
!1564 = !DILocation(line: 1352, column: 8, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1549, file: !64, line: 1352, column: 7)
!1566 = !DILocation(line: 1352, column: 20, scope: !1565)
!1567 = !DILocation(line: 1352, column: 27, scope: !1565)
!1568 = !DILocation(line: 1352, column: 7, scope: !1549)
!1569 = !DILocation(line: 1354, column: 20, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1565, file: !64, line: 1353, column: 4)
!1571 = !DILocation(line: 1354, column: 32, scope: !1570)
!1572 = !DILocation(line: 1354, column: 17, scope: !1570)
!1573 = !DILocation(line: 1355, column: 4, scope: !1570)
!1574 = !DILocation(line: 1358, column: 20, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1565, file: !64, line: 1357, column: 4)
!1576 = !DILocation(line: 1358, column: 32, scope: !1575)
!1577 = !DILocation(line: 1358, column: 38, scope: !1575)
!1578 = !DILocation(line: 1358, column: 17, scope: !1575)
!1579 = !DILocation(line: 1362, column: 7, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1549, file: !64, line: 1362, column: 7)
!1581 = !DILocation(line: 1362, column: 18, scope: !1580)
!1582 = !DILocation(line: 1362, column: 16, scope: !1580)
!1583 = !DILocation(line: 1362, column: 7, scope: !1549)
!1584 = !DILocation(line: 1364, column: 14, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1580, file: !64, line: 1363, column: 4)
!1586 = !DILocation(line: 1364, column: 13, scope: !1585)
!1587 = !DILocation(line: 1364, column: 23, scope: !1585)
!1588 = !DILocation(line: 1364, column: 5, scope: !1585)
!1589 = !DILocation(line: 1368, column: 14, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1580, file: !64, line: 1367, column: 4)
!1591 = !DILocation(line: 1368, column: 23, scope: !1590)
!1592 = !DILocation(line: 1368, column: 12, scope: !1590)
!1593 = !DILocation(line: 1368, column: 27, scope: !1590)
!1594 = !DILocation(line: 1368, column: 5, scope: !1590)
!1595 = !DILocation(line: 1375, column: 16, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1544, file: !64, line: 1374, column: 3)
!1597 = !DILocation(line: 1375, column: 30, scope: !1596)
!1598 = !DILocation(line: 1375, column: 40, scope: !1596)
!1599 = !DILocation(line: 1375, column: 39, scope: !1596)
!1600 = !DILocation(line: 1375, column: 55, scope: !1596)
!1601 = !DILocation(line: 1375, column: 53, scope: !1596)
!1602 = !DILocation(line: 1375, column: 26, scope: !1596)
!1603 = !DILocation(line: 1375, column: 69, scope: !1596)
!1604 = !DILocation(line: 1375, column: 13, scope: !1596)
!1605 = !DILocation(line: 1376, column: 16, scope: !1596)
!1606 = !DILocation(line: 1376, column: 26, scope: !1596)
!1607 = !DILocation(line: 1376, column: 25, scope: !1596)
!1608 = !DILocation(line: 1376, column: 42, scope: !1596)
!1609 = !DILocation(line: 1376, column: 51, scope: !1596)
!1610 = !DILocation(line: 1376, column: 50, scope: !1596)
!1611 = !DILocation(line: 1376, column: 39, scope: !1596)
!1612 = !DILocation(line: 1376, column: 13, scope: !1596)
!1613 = !DILocation(line: 1377, column: 11, scope: !1596)
!1614 = !DILocation(line: 1377, column: 4, scope: !1596)
!1615 = !DILocation(line: 1380, column: 1, scope: !1513)
!1616 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !64, file: !64, line: 1397, type: !1617, scopeLine: 1398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1617 = !DISubroutineType(types: !1618)
!1618 = !{!12, !12, !12}
!1619 = !DILocalVariable(name: "numerator", arg: 1, scope: !1616, file: !64, line: 1397, type: !12)
!1620 = !DILocation(line: 1397, column: 25, scope: !1616)
!1621 = !DILocalVariable(name: "denominator", arg: 2, scope: !1616, file: !64, line: 1397, type: !12)
!1622 = !DILocation(line: 1397, column: 40, scope: !1616)
!1623 = !DILocalVariable(name: "s32Temp1", scope: !1616, file: !64, line: 1399, type: !12)
!1624 = !DILocation(line: 1399, column: 6, scope: !1616)
!1625 = !DILocalVariable(name: "s32Temp2", scope: !1616, file: !64, line: 1399, type: !12)
!1626 = !DILocation(line: 1399, column: 20, scope: !1616)
!1627 = !DILocalVariable(name: "denominator_prime", scope: !1616, file: !64, line: 1400, type: !450)
!1628 = !DILocation(line: 1400, column: 6, scope: !1616)
!1629 = !DILocalVariable(name: "u32Temp1", scope: !1616, file: !64, line: 1400, type: !450)
!1630 = !DILocation(line: 1400, column: 29, scope: !1616)
!1631 = !DILocalVariable(name: "u32Temp2", scope: !1616, file: !64, line: 1400, type: !450)
!1632 = !DILocation(line: 1400, column: 43, scope: !1616)
!1633 = !DILocalVariable(name: "u32numerator", scope: !1616, file: !64, line: 1401, type: !450)
!1634 = !DILocation(line: 1401, column: 6, scope: !1616)
!1635 = !DILocalVariable(name: "u32denominator", scope: !1616, file: !64, line: 1401, type: !450)
!1636 = !DILocation(line: 1401, column: 23, scope: !1616)
!1637 = !DILocation(line: 1402, column: 5, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1616, file: !64, line: 1402, column: 5)
!1639 = !DILocation(line: 1402, column: 15, scope: !1638)
!1640 = !DILocation(line: 1402, column: 5, scope: !1616)
!1641 = !DILocation(line: 1404, column: 6, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1643, file: !64, line: 1404, column: 6)
!1643 = distinct !DILexicalBlock(scope: !1638, file: !64, line: 1403, column: 2)
!1644 = !DILocation(line: 1404, column: 18, scope: !1642)
!1645 = !DILocation(line: 1404, column: 6, scope: !1643)
!1646 = !DILocation(line: 1406, column: 7, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1648, file: !64, line: 1406, column: 7)
!1648 = distinct !DILexicalBlock(scope: !1642, file: !64, line: 1405, column: 3)
!1649 = !DILocation(line: 1406, column: 19, scope: !1647)
!1650 = !DILocation(line: 1406, column: 7, scope: !1648)
!1651 = !DILocation(line: 1408, column: 5, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1647, file: !64, line: 1407, column: 4)
!1653 = !DILocation(line: 1412, column: 21, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1647, file: !64, line: 1411, column: 4)
!1655 = !DILocation(line: 1412, column: 20, scope: !1654)
!1656 = !DILocation(line: 1412, column: 18, scope: !1654)
!1657 = !DILocation(line: 1413, column: 23, scope: !1654)
!1658 = !DILocation(line: 1413, column: 22, scope: !1654)
!1659 = !DILocation(line: 1413, column: 20, scope: !1654)
!1660 = !DILocation(line: 1414, column: 16, scope: !1654)
!1661 = !DILocation(line: 1414, column: 33, scope: !1654)
!1662 = !DILocation(line: 1414, column: 46, scope: !1654)
!1663 = !DILocation(line: 1414, column: 45, scope: !1654)
!1664 = !DILocation(line: 1414, column: 64, scope: !1654)
!1665 = !DILocation(line: 1414, column: 62, scope: !1654)
!1666 = !DILocation(line: 1414, column: 29, scope: !1654)
!1667 = !DILocation(line: 1414, column: 81, scope: !1654)
!1668 = !DILocation(line: 1414, column: 14, scope: !1654)
!1669 = !DILocation(line: 1415, column: 17, scope: !1654)
!1670 = !DILocation(line: 1415, column: 30, scope: !1654)
!1671 = !DILocation(line: 1415, column: 29, scope: !1654)
!1672 = !DILocation(line: 1415, column: 49, scope: !1654)
!1673 = !DILocation(line: 1415, column: 58, scope: !1654)
!1674 = !DILocation(line: 1415, column: 57, scope: !1654)
!1675 = !DILocation(line: 1415, column: 46, scope: !1654)
!1676 = !DILocation(line: 1415, column: 14, scope: !1654)
!1677 = !DILocation(line: 1416, column: 8, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1654, file: !64, line: 1416, column: 8)
!1679 = !DILocation(line: 1416, column: 17, scope: !1678)
!1680 = !DILocation(line: 1416, column: 8, scope: !1654)
!1681 = !DILocation(line: 1418, column: 13, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1678, file: !64, line: 1417, column: 5)
!1683 = !DILocation(line: 1418, column: 6, scope: !1682)
!1684 = !DILocation(line: 1422, column: 6, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1678, file: !64, line: 1421, column: 5)
!1686 = !DILocation(line: 1428, column: 20, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1642, file: !64, line: 1427, column: 3)
!1688 = !DILocation(line: 1428, column: 19, scope: !1687)
!1689 = !DILocation(line: 1428, column: 29, scope: !1687)
!1690 = !DILocation(line: 1428, column: 17, scope: !1687)
!1691 = !DILocation(line: 1429, column: 16, scope: !1687)
!1692 = !DILocation(line: 1429, column: 33, scope: !1687)
!1693 = !DILocation(line: 1429, column: 46, scope: !1687)
!1694 = !DILocation(line: 1429, column: 45, scope: !1687)
!1695 = !DILocation(line: 1429, column: 61, scope: !1687)
!1696 = !DILocation(line: 1429, column: 59, scope: !1687)
!1697 = !DILocation(line: 1429, column: 29, scope: !1687)
!1698 = !DILocation(line: 1429, column: 75, scope: !1687)
!1699 = !DILocation(line: 1429, column: 13, scope: !1687)
!1700 = !DILocation(line: 1430, column: 16, scope: !1687)
!1701 = !DILocation(line: 1430, column: 29, scope: !1687)
!1702 = !DILocation(line: 1430, column: 28, scope: !1687)
!1703 = !DILocation(line: 1430, column: 45, scope: !1687)
!1704 = !DILocation(line: 1430, column: 54, scope: !1687)
!1705 = !DILocation(line: 1430, column: 53, scope: !1687)
!1706 = !DILocation(line: 1430, column: 42, scope: !1687)
!1707 = !DILocation(line: 1430, column: 13, scope: !1687)
!1708 = !DILocation(line: 1431, column: 13, scope: !1687)
!1709 = !DILocation(line: 1431, column: 12, scope: !1687)
!1710 = !DILocation(line: 1431, column: 22, scope: !1687)
!1711 = !DILocation(line: 1431, column: 4, scope: !1687)
!1712 = !DILocation(line: 1436, column: 6, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1714, file: !64, line: 1436, column: 6)
!1714 = distinct !DILexicalBlock(scope: !1638, file: !64, line: 1435, column: 2)
!1715 = !DILocation(line: 1436, column: 18, scope: !1713)
!1716 = !DILocation(line: 1436, column: 6, scope: !1714)
!1717 = !DILocation(line: 1438, column: 7, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1719, file: !64, line: 1438, column: 7)
!1719 = distinct !DILexicalBlock(scope: !1713, file: !64, line: 1437, column: 3)
!1720 = !DILocation(line: 1438, column: 19, scope: !1718)
!1721 = !DILocation(line: 1438, column: 7, scope: !1719)
!1722 = !DILocation(line: 1440, column: 5, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !64, line: 1439, column: 4)
!1724 = !DILocation(line: 1444, column: 23, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1718, file: !64, line: 1443, column: 4)
!1726 = !DILocation(line: 1444, column: 22, scope: !1725)
!1727 = !DILocation(line: 1444, column: 35, scope: !1725)
!1728 = !DILocation(line: 1444, column: 20, scope: !1725)
!1729 = !DILocation(line: 1445, column: 17, scope: !1725)
!1730 = !DILocation(line: 1445, column: 31, scope: !1725)
!1731 = !DILocation(line: 1445, column: 41, scope: !1725)
!1732 = !DILocation(line: 1445, column: 40, scope: !1725)
!1733 = !DILocation(line: 1445, column: 59, scope: !1725)
!1734 = !DILocation(line: 1445, column: 57, scope: !1725)
!1735 = !DILocation(line: 1445, column: 27, scope: !1725)
!1736 = !DILocation(line: 1445, column: 76, scope: !1725)
!1737 = !DILocation(line: 1445, column: 14, scope: !1725)
!1738 = !DILocation(line: 1446, column: 17, scope: !1725)
!1739 = !DILocation(line: 1446, column: 27, scope: !1725)
!1740 = !DILocation(line: 1446, column: 26, scope: !1725)
!1741 = !DILocation(line: 1446, column: 46, scope: !1725)
!1742 = !DILocation(line: 1446, column: 55, scope: !1725)
!1743 = !DILocation(line: 1446, column: 54, scope: !1725)
!1744 = !DILocation(line: 1446, column: 43, scope: !1725)
!1745 = !DILocation(line: 1446, column: 14, scope: !1725)
!1746 = !DILocation(line: 1447, column: 14, scope: !1725)
!1747 = !DILocation(line: 1447, column: 13, scope: !1725)
!1748 = !DILocation(line: 1447, column: 23, scope: !1725)
!1749 = !DILocation(line: 1447, column: 5, scope: !1725)
!1750 = !DILocation(line: 1452, column: 16, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1713, file: !64, line: 1451, column: 3)
!1752 = !DILocation(line: 1452, column: 30, scope: !1751)
!1753 = !DILocation(line: 1452, column: 40, scope: !1751)
!1754 = !DILocation(line: 1452, column: 39, scope: !1751)
!1755 = !DILocation(line: 1452, column: 55, scope: !1751)
!1756 = !DILocation(line: 1452, column: 53, scope: !1751)
!1757 = !DILocation(line: 1452, column: 26, scope: !1751)
!1758 = !DILocation(line: 1452, column: 69, scope: !1751)
!1759 = !DILocation(line: 1452, column: 13, scope: !1751)
!1760 = !DILocation(line: 1453, column: 16, scope: !1751)
!1761 = !DILocation(line: 1453, column: 26, scope: !1751)
!1762 = !DILocation(line: 1453, column: 25, scope: !1751)
!1763 = !DILocation(line: 1453, column: 42, scope: !1751)
!1764 = !DILocation(line: 1453, column: 51, scope: !1751)
!1765 = !DILocation(line: 1453, column: 50, scope: !1751)
!1766 = !DILocation(line: 1453, column: 39, scope: !1751)
!1767 = !DILocation(line: 1453, column: 13, scope: !1751)
!1768 = !DILocation(line: 1454, column: 11, scope: !1751)
!1769 = !DILocation(line: 1454, column: 4, scope: !1751)
!1770 = !DILocation(line: 1457, column: 1, scope: !1616)
!1771 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !64, file: !64, line: 1475, type: !1772, scopeLine: 1476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1772 = !DISubroutineType(types: !1773)
!1773 = !{!16, !12, !450}
!1774 = !DILocalVariable(name: "numerator", arg: 1, scope: !1771, file: !64, line: 1475, type: !12)
!1775 = !DILocation(line: 1475, column: 25, scope: !1771)
!1776 = !DILocalVariable(name: "denominator", arg: 2, scope: !1771, file: !64, line: 1475, type: !450)
!1777 = !DILocation(line: 1475, column: 40, scope: !1771)
!1778 = !DILocalVariable(name: "numerator_prime", scope: !1771, file: !64, line: 1478, type: !450)
!1779 = !DILocation(line: 1478, column: 6, scope: !1771)
!1780 = !DILocalVariable(name: "u32Temp1", scope: !1771, file: !64, line: 1478, type: !450)
!1781 = !DILocation(line: 1478, column: 27, scope: !1771)
!1782 = !DILocalVariable(name: "u32Temp2", scope: !1771, file: !64, line: 1478, type: !450)
!1783 = !DILocation(line: 1478, column: 41, scope: !1771)
!1784 = !DILocalVariable(name: "u32Temp3", scope: !1771, file: !64, line: 1478, type: !450)
!1785 = !DILocation(line: 1478, column: 55, scope: !1771)
!1786 = !DILocalVariable(name: "s32Temp1", scope: !1771, file: !64, line: 1479, type: !12)
!1787 = !DILocation(line: 1479, column: 6, scope: !1771)
!1788 = !DILocalVariable(name: "s32Temp2", scope: !1771, file: !64, line: 1479, type: !12)
!1789 = !DILocation(line: 1479, column: 20, scope: !1771)
!1790 = !DILocalVariable(name: "s32Temp3", scope: !1771, file: !64, line: 1479, type: !12)
!1791 = !DILocation(line: 1479, column: 34, scope: !1771)
!1792 = !DILocation(line: 1480, column: 5, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1771, file: !64, line: 1480, column: 5)
!1794 = !DILocation(line: 1480, column: 17, scope: !1793)
!1795 = !DILocation(line: 1480, column: 5, scope: !1771)
!1796 = !DILocation(line: 1482, column: 6, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1798, file: !64, line: 1482, column: 6)
!1798 = distinct !DILexicalBlock(scope: !1793, file: !64, line: 1481, column: 2)
!1799 = !DILocation(line: 1482, column: 15, scope: !1797)
!1800 = !DILocation(line: 1482, column: 6, scope: !1798)
!1801 = !DILocation(line: 1484, column: 4, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1797, file: !64, line: 1483, column: 3)
!1803 = !DILocation(line: 1488, column: 4, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1797, file: !64, line: 1487, column: 3)
!1805 = !DILocation(line: 1493, column: 6, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1807, file: !64, line: 1493, column: 6)
!1807 = distinct !DILexicalBlock(scope: !1793, file: !64, line: 1492, column: 2)
!1808 = !DILocation(line: 1493, column: 16, scope: !1806)
!1809 = !DILocation(line: 1493, column: 6, scope: !1807)
!1810 = !DILocation(line: 1495, column: 23, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1806, file: !64, line: 1494, column: 3)
!1812 = !DILocation(line: 1495, column: 22, scope: !1811)
!1813 = !DILocation(line: 1495, column: 20, scope: !1811)
!1814 = !DILocation(line: 1496, column: 16, scope: !1811)
!1815 = !DILocation(line: 1496, column: 32, scope: !1811)
!1816 = !DILocation(line: 1496, column: 31, scope: !1811)
!1817 = !DILocation(line: 1496, column: 13, scope: !1811)
!1818 = !DILocation(line: 1497, column: 15, scope: !1811)
!1819 = !DILocation(line: 1497, column: 34, scope: !1811)
!1820 = !DILocation(line: 1497, column: 45, scope: !1811)
!1821 = !DILocation(line: 1497, column: 43, scope: !1811)
!1822 = !DILocation(line: 1497, column: 31, scope: !1811)
!1823 = !DILocation(line: 1497, column: 13, scope: !1811)
!1824 = !DILocation(line: 1499, column: 8, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1811, file: !64, line: 1499, column: 7)
!1826 = !DILocation(line: 1499, column: 20, scope: !1825)
!1827 = !DILocation(line: 1499, column: 27, scope: !1825)
!1828 = !DILocation(line: 1499, column: 7, scope: !1811)
!1829 = !DILocation(line: 1501, column: 19, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1825, file: !64, line: 1500, column: 4)
!1831 = !DILocation(line: 1501, column: 31, scope: !1830)
!1832 = !DILocation(line: 1501, column: 17, scope: !1830)
!1833 = !DILocation(line: 1502, column: 4, scope: !1830)
!1834 = !DILocation(line: 1505, column: 20, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1825, file: !64, line: 1504, column: 4)
!1836 = !DILocation(line: 1505, column: 32, scope: !1835)
!1837 = !DILocation(line: 1505, column: 38, scope: !1835)
!1838 = !DILocation(line: 1505, column: 17, scope: !1835)
!1839 = !DILocation(line: 1508, column: 7, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1811, file: !64, line: 1508, column: 7)
!1841 = !DILocation(line: 1508, column: 18, scope: !1840)
!1842 = !DILocation(line: 1508, column: 16, scope: !1840)
!1843 = !DILocation(line: 1508, column: 7, scope: !1811)
!1844 = !DILocation(line: 1510, column: 18, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1840, file: !64, line: 1509, column: 4)
!1846 = !DILocation(line: 1510, column: 16, scope: !1845)
!1847 = !DILocation(line: 1510, column: 28, scope: !1845)
!1848 = !DILocation(line: 1510, column: 14, scope: !1845)
!1849 = !DILocation(line: 1511, column: 4, scope: !1845)
!1850 = !DILocation(line: 1514, column: 18, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1840, file: !64, line: 1513, column: 4)
!1852 = !DILocation(line: 1514, column: 26, scope: !1851)
!1853 = !DILocation(line: 1514, column: 16, scope: !1851)
!1854 = !DILocation(line: 1514, column: 30, scope: !1851)
!1855 = !DILocation(line: 1514, column: 14, scope: !1851)
!1856 = !DILocation(line: 1516, column: 8, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1811, file: !64, line: 1516, column: 7)
!1858 = !DILocation(line: 1516, column: 18, scope: !1857)
!1859 = !DILocation(line: 1516, column: 7, scope: !1811)
!1860 = !DILocation(line: 1518, column: 18, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1857, file: !64, line: 1517, column: 4)
!1862 = !DILocation(line: 1518, column: 12, scope: !1861)
!1863 = !DILocation(line: 1518, column: 5, scope: !1861)
!1864 = !DILocation(line: 1522, column: 5, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1857, file: !64, line: 1521, column: 4)
!1866 = !DILocation(line: 1527, column: 16, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1806, file: !64, line: 1526, column: 3)
!1868 = !DILocation(line: 1527, column: 26, scope: !1867)
!1869 = !DILocation(line: 1527, column: 25, scope: !1867)
!1870 = !DILocation(line: 1527, column: 41, scope: !1867)
!1871 = !DILocation(line: 1527, column: 39, scope: !1867)
!1872 = !DILocation(line: 1527, column: 13, scope: !1867)
!1873 = !DILocation(line: 1528, column: 16, scope: !1867)
!1874 = !DILocation(line: 1528, column: 30, scope: !1867)
!1875 = !DILocation(line: 1528, column: 40, scope: !1867)
!1876 = !DILocation(line: 1528, column: 39, scope: !1867)
!1877 = !DILocation(line: 1528, column: 55, scope: !1867)
!1878 = !DILocation(line: 1528, column: 53, scope: !1867)
!1879 = !DILocation(line: 1528, column: 26, scope: !1867)
!1880 = !DILocation(line: 1528, column: 68, scope: !1867)
!1881 = !DILocation(line: 1528, column: 13, scope: !1867)
!1882 = !DILocation(line: 1529, column: 16, scope: !1867)
!1883 = !DILocation(line: 1529, column: 25, scope: !1867)
!1884 = !DILocation(line: 1529, column: 24, scope: !1867)
!1885 = !DILocation(line: 1529, column: 41, scope: !1867)
!1886 = !DILocation(line: 1529, column: 51, scope: !1867)
!1887 = !DILocation(line: 1529, column: 50, scope: !1867)
!1888 = !DILocation(line: 1529, column: 38, scope: !1867)
!1889 = !DILocation(line: 1529, column: 13, scope: !1867)
!1890 = !DILocation(line: 1530, column: 7, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1867, file: !64, line: 1530, column: 7)
!1892 = !DILocation(line: 1530, column: 16, scope: !1891)
!1893 = !DILocation(line: 1530, column: 7, scope: !1867)
!1894 = !DILocation(line: 1532, column: 17, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1891, file: !64, line: 1531, column: 4)
!1896 = !DILocation(line: 1532, column: 12, scope: !1895)
!1897 = !DILocation(line: 1532, column: 5, scope: !1895)
!1898 = !DILocation(line: 1536, column: 5, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1891, file: !64, line: 1535, column: 4)
!1900 = !DILocation(line: 1540, column: 1, scope: !1771)
!1901 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1902, file: !1902, line: 12, type: !1903, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1906)
!1902 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1903 = !DISubroutineType(types: !1904)
!1904 = !{null, !1905}
!1905 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1906 = !{!1907}
!1907 = !DILocalVariable(name: "z", arg: 1, scope: !1901, file: !1902, line: 12, type: !1905)
!1908 = !DILocation(line: 0, scope: !1901)
!1909 = !DILocation(line: 13, column: 9, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1901, file: !1902, line: 13, column: 7)
!1911 = !DILocation(line: 13, column: 7, scope: !1901)
!1912 = !DILocation(line: 14, column: 5, scope: !1910)
!1913 = !DILocation(line: 15, column: 1, scope: !1901)
