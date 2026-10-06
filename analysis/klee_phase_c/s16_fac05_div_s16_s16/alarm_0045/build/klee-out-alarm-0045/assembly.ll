; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045/build/s16_fac05_div_s16_s16_alarm_0045.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0045: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0045.err\00", align 1
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
  %retval = alloca i16, align 2
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
  br i1 %cmp11, label %if.then13, label %if.else21, !dbg !103

if.then13:                                        ; preds = %if.else10
  %5 = load i16, i16* %denominator.addr, align 2, !dbg !104
  %conv14 = sext i16 %5 to i64, !dbg !107
  %call15 = call i32 @klee_alarm_divisor_nonzero(i64 %conv14), !dbg !108
  %tobool16 = icmp ne i32 %call15, 0, !dbg !108
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !109

if.then17:                                        ; preds = %if.then13
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 198, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !110
  unreachable, !dbg !110

if.end18:                                         ; preds = %if.then13
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !112
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !113
  %conv19 = sext i16 %7 to i32, !dbg !113
  %int_cast_to_i64 = zext i32 %conv19 to i64, !dbg !114
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !114
  %div = sdiv i32 %6, %conv19, !dbg !114, !klee.check.div !115
  %conv20 = sext i32 %div to i64, !dbg !116
  store volatile i64 %conv20, i64* @klee_alarm_sink_s64, align 8, !dbg !117
  store i16 0, i16* %retval, align 2, !dbg !118
  br label %return, !dbg !118

if.else21:                                        ; preds = %if.else10
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !119
  %conv22 = sext i16 %8 to i32, !dbg !119
  %cmp23 = icmp ne i32 %conv22, -1, !dbg !122
  br i1 %cmp23, label %if.then25, label %if.else45, !dbg !123

if.then25:                                        ; preds = %if.else21
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !124
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !126
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !127
  %conv26 = sext i16 %11 to i32, !dbg !127
  %int_cast_to_i641 = zext i32 %conv26 to i64, !dbg !128
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !128
  %div27 = sdiv i32 %10, %conv26, !dbg !128, !klee.check.div !115
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !129
  %conv28 = sext i16 %12 to i32, !dbg !129
  %mul = mul nsw i32 %div27, %conv28, !dbg !130
  %sub = sub nsw i32 %9, %mul, !dbg !131
  %shl29 = shl i32 %sub, 1, !dbg !132
  store i32 %shl29, i32* %s32Temp2, align 4, !dbg !133
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !134
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !135
  %conv30 = sext i16 %14 to i32, !dbg !135
  %int_cast_to_i642 = zext i32 %conv30 to i64, !dbg !136
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !136
  %div31 = sdiv i32 %13, %conv30, !dbg !136, !klee.check.div !115
  store i32 %div31, i32* %s32Temp1, align 4, !dbg !137
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !138
  %16 = load i16, i16* %numerator.addr, align 2, !dbg !139
  %conv32 = sext i16 %16 to i32, !dbg !139
  %shl33 = shl i32 %conv32, 16, !dbg !140
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !141
  %conv34 = sext i16 %17 to i32, !dbg !141
  %int_cast_to_i643 = zext i32 %conv34 to i64, !dbg !142
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !142
  %div35 = sdiv i32 %shl33, %conv34, !dbg !142, !klee.check.div !115
  %add = add nsw i32 %15, %div35, !dbg !143
  store i32 %add, i32* %s32Temp1, align 4, !dbg !144
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !145
  %cmp36 = icmp slt i32 %18, 32767, !dbg !147
  br i1 %cmp36, label %if.then38, label %if.else44, !dbg !148

if.then38:                                        ; preds = %if.then25
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !149
  %cmp39 = icmp sgt i32 %19, -32768, !dbg !152
  br i1 %cmp39, label %if.then41, label %if.else43, !dbg !153

if.then41:                                        ; preds = %if.then38
  %20 = load i32, i32* %s32Temp1, align 4, !dbg !154
  %conv42 = trunc i32 %20 to i16, !dbg !156
  store i16 %conv42, i16* %retval, align 2, !dbg !157
  br label %return, !dbg !157

if.else43:                                        ; preds = %if.then38
  store i16 -32768, i16* %retval, align 2, !dbg !158
  br label %return, !dbg !158

if.else44:                                        ; preds = %if.then25
  store i16 32767, i16* %retval, align 2, !dbg !160
  br label %return, !dbg !160

if.else45:                                        ; preds = %if.else21
  store i16 32767, i16* %retval, align 2, !dbg !162
  br label %return, !dbg !162

return:                                           ; preds = %if.else45, %if.else44, %if.else43, %if.then41, %if.end18, %if.else, %if.then9, %if.then
  %21 = load i16, i16* %retval, align 2, !dbg !164
  ret i16 %21, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !165 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = load i64, i64* %left.addr, align 8, !dbg !170
  %cmp = icmp sge i64 %0, 0, !dbg !171
  %conv = zext i1 %cmp to i32, !dbg !171
  ret i32 %conv, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !173 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !176
  %cmp = icmp ne i64 %0, 0, !dbg !177
  %conv = zext i1 %cmp to i32, !dbg !177
  ret i32 %conv, !dbg !178
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !179 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !182, metadata !DIExpression()), !dbg !183
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 0, i32* %s32Temp1, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 0, i32* %s32Temp2, align 4, !dbg !189
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !190
  store i32 %0, i32* %s32Temp1, align 4, !dbg !191
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !192
  %conv = sext i16 %1 to i32, !dbg !192
  %cmp = icmp eq i32 %conv, 0, !dbg !194
  br i1 %cmp, label %if.then, label %if.else5, !dbg !195

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !196
  %cmp2 = icmp slt i32 %2, 0, !dbg !199
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !200

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !201
  br label %return, !dbg !201

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !203
  br label %return, !dbg !203

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !205
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !208
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !209

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !210
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !212
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !213
  %conv9 = sext i16 %6 to i32, !dbg !213
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !214
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !214
  %div = sdiv i32 %5, %conv9, !dbg !214, !klee.check.div !115
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !215
  %conv10 = sext i16 %7 to i32, !dbg !215
  %mul = mul nsw i32 %div, %conv10, !dbg !216
  %sub = sub nsw i32 %4, %mul, !dbg !217
  %shl = shl i32 %sub, 1, !dbg !218
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !219
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !220
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !221
  %conv11 = sext i16 %9 to i32, !dbg !221
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !222
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !222
  %div12 = sdiv i32 %8, %conv11, !dbg !222, !klee.check.div !115
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !223
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !224
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !225
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !226
  %conv13 = sext i16 %12 to i32, !dbg !226
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !227
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !227
  %div14 = sdiv i32 %11, %conv13, !dbg !227, !klee.check.div !115
  %add = add nsw i32 %10, %div14, !dbg !228
  store i32 %add, i32* %s32Temp1, align 4, !dbg !229
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !230
  %cmp15 = icmp slt i32 %13, 32767, !dbg !232
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !233

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !234
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !237
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !238

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !239
  %conv21 = trunc i32 %15 to i16, !dbg !241
  store i16 %conv21, i16* %retval, align 2, !dbg !242
  br label %return, !dbg !242

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !243
  br label %return, !dbg !243

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !245
  br label %return, !dbg !245

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !247
  %conv25 = sext i16 %16 to i32, !dbg !247
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !250
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !251

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !252
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !254
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !255
  %conv29 = sext i16 %19 to i32, !dbg !255
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !256
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !256
  %div30 = sdiv i32 %18, %conv29, !dbg !256, !klee.check.div !115
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !257
  %conv31 = sext i16 %20 to i32, !dbg !257
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !258
  %sub33 = sub nsw i32 %17, %mul32, !dbg !259
  %shl34 = shl i32 %sub33, 1, !dbg !260
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !261
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !262
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !263
  %conv35 = sext i16 %22 to i32, !dbg !263
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !264
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !264
  %div36 = sdiv i32 %21, %conv35, !dbg !264, !klee.check.div !115
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !265
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !266
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !267
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !268
  %conv37 = sext i16 %25 to i32, !dbg !268
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !269
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !269
  %div38 = sdiv i32 %24, %conv37, !dbg !269, !klee.check.div !115
  %add39 = add nsw i32 %23, %div38, !dbg !270
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !271
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !272
  %cmp40 = icmp slt i32 %26, 32767, !dbg !274
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !275

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !276
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !279
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !280

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !281
  %conv46 = trunc i32 %28 to i16, !dbg !283
  store i16 %conv46, i16* %retval, align 2, !dbg !284
  br label %return, !dbg !284

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !285
  br label %return, !dbg !285

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !287
  br label %return, !dbg !287

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !289
  br label %return, !dbg !289

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !291
  ret i16 %29, !dbg !291
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !292 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !295, metadata !DIExpression()), !dbg !296
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !299, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !301, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !303, metadata !DIExpression()), !dbg !304
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !305
  %conv = zext i16 %0 to i32, !dbg !305
  %and = and i32 %conv, 65535, !dbg !306
  %conv1 = trunc i32 %and to i16, !dbg !305
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !307
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !308
  %conv2 = sext i16 %1 to i32, !dbg !308
  %shl = shl i32 %conv2, 16, !dbg !309
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !310
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !311
  %conv3 = zext i16 %2 to i32, !dbg !311
  %cmp = icmp eq i32 %conv3, 0, !dbg !313
  br i1 %cmp, label %if.then, label %if.else9, !dbg !314

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !315
  %conv5 = sext i16 %3 to i32, !dbg !315
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !318
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !319

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !320
  br label %return, !dbg !320

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !322
  br label %return, !dbg !322

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !324
  %conv10 = sext i16 %4 to i32, !dbg !324
  %shl11 = shl i32 %conv10, 16, !dbg !326
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !327
  %conv12 = sext i16 %5 to i32, !dbg !327
  %shl13 = shl i32 %conv12, 16, !dbg !328
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !329
  %conv14 = zext i16 %6 to i32, !dbg !329
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !330
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !330
  %div = sdiv i32 %shl13, %conv14, !dbg !330, !klee.check.div !115
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !331
  %conv15 = zext i16 %7 to i32, !dbg !331
  %mul = mul nsw i32 %div, %conv15, !dbg !332
  %sub = sub nsw i32 %shl11, %mul, !dbg !333
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !334
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !335
  %shl16 = shl i32 %8, 1, !dbg !336
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !337
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !338
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !339
  %conv17 = zext i16 %10 to i32, !dbg !339
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !340
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !340
  %div18 = sdiv i32 %9, %conv17, !dbg !340, !klee.check.div !115
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !341
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !342
  %conv19 = sext i16 %11 to i32, !dbg !342
  %shl20 = shl i32 %conv19, 16, !dbg !343
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !344
  %conv21 = zext i16 %12 to i32, !dbg !344
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !345
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !345
  %div22 = sdiv i32 %shl20, %conv21, !dbg !345, !klee.check.div !115
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !346
  %add = add nsw i32 %div22, %13, !dbg !347
  store i32 %add, i32* %s32Temp1, align 4, !dbg !348
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !349
  %cmp23 = icmp slt i32 %14, 32767, !dbg !351
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !352

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !353
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !356
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !357

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !358
  %conv29 = trunc i32 %16 to i16, !dbg !360
  store i16 %conv29, i16* %retval, align 2, !dbg !361
  br label %return, !dbg !361

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !362
  br label %return, !dbg !362

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !364
  br label %return, !dbg !364

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !366
  ret i16 %17, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !367 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !368, metadata !DIExpression()), !dbg !369
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !370, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !374, metadata !DIExpression()), !dbg !375
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !376
  %conv = zext i16 %0 to i32, !dbg !376
  %and = and i32 %conv, 65535, !dbg !377
  %conv1 = trunc i32 %and to i16, !dbg !376
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !378
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !379
  %conv2 = zext i16 %1 to i32, !dbg !379
  %cmp = icmp eq i32 %conv2, 0, !dbg !381
  br i1 %cmp, label %if.then, label %if.else8, !dbg !382

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !383
  %conv4 = sext i16 %2 to i32, !dbg !383
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !386
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !387

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !388
  br label %return, !dbg !388

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !390
  br label %return, !dbg !390

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !392
  %conv9 = sext i16 %3 to i32, !dbg !392
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !394
  %conv10 = sext i16 %4 to i32, !dbg !394
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !395
  %conv11 = zext i16 %5 to i32, !dbg !395
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !396
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !396
  %div = sdiv i32 %conv10, %conv11, !dbg !396, !klee.check.div !115
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !397
  %conv12 = zext i16 %6 to i32, !dbg !397
  %mul = mul nsw i32 %div, %conv12, !dbg !398
  %sub = sub nsw i32 %conv9, %mul, !dbg !399
  %shl = shl i32 %sub, 1, !dbg !400
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !401
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !402
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !403
  %conv13 = zext i16 %8 to i32, !dbg !403
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !404
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !404
  %div14 = sdiv i32 %7, %conv13, !dbg !404, !klee.check.div !115
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !405
  %conv15 = sext i16 %9 to i32, !dbg !405
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !406
  %conv16 = zext i16 %10 to i32, !dbg !406
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !407
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !407
  %div17 = sdiv i32 %conv15, %conv16, !dbg !407, !klee.check.div !115
  %add = add nsw i32 %div14, %div17, !dbg !408
  store i32 %add, i32* %s32Temp1, align 4, !dbg !409
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !410
  %conv18 = trunc i32 %11 to i16, !dbg !410
  store i16 %conv18, i16* %retval, align 2, !dbg !411
  br label %return, !dbg !411

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !412
  ret i16 %12, !dbg !412
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !413 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !416, metadata !DIExpression()), !dbg !417
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !418, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !420, metadata !DIExpression()), !dbg !425
  store i32 0, i32* %u32Temp1, align 4, !dbg !425
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !426, metadata !DIExpression()), !dbg !427
  store i32 0, i32* %u32Temp2, align 4, !dbg !427
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !428, metadata !DIExpression()), !dbg !429
  store i32 0, i32* %u32Temp3, align 4, !dbg !429
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !430
  %conv = zext i16 %0 to i32, !dbg !430
  %cmp = icmp eq i32 %conv, 0, !dbg !432
  br i1 %cmp, label %if.then, label %if.else, !dbg !433

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !434
  br label %return, !dbg !434

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !436
  %conv2 = zext i16 %1 to i32, !dbg !436
  %shl = shl i32 %conv2, 16, !dbg !438
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !439
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !440
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !441
  %conv3 = zext i16 %3 to i32, !dbg !441
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !442
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !442
  %div = udiv i32 %2, %conv3, !dbg !442, !klee.check.div !115
  store i32 %div, i32* %u32Temp2, align 4, !dbg !443
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !444
  %add = add i32 %4, 128, !dbg !445
  %shr = lshr i32 %add, 8, !dbg !446
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !447
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !448
  %cmp4 = icmp ult i32 %5, 255, !dbg !450
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !451

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !452
  %conv7 = trunc i32 %6 to i8, !dbg !454
  store i8 %conv7, i8* %retval, align 1, !dbg !455
  br label %return, !dbg !455

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !456
  br label %return, !dbg !456

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !458
  ret i8 %7, !dbg !458
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !459 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !462, metadata !DIExpression()), !dbg !463
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !464, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !466, metadata !DIExpression()), !dbg !467
  store i32 0, i32* %s32Temp1, align 4, !dbg !467
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !468
  %conv = zext i16 %0 to i32, !dbg !468
  %and = and i32 %conv, 65535, !dbg !469
  %conv1 = trunc i32 %and to i16, !dbg !468
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !470
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !471
  %conv2 = zext i16 %1 to i32, !dbg !471
  %and3 = and i32 %conv2, 65535, !dbg !473
  %cmp = icmp eq i32 %and3, 0, !dbg !474
  br i1 %cmp, label %if.then, label %if.else8, !dbg !475

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !476
  %cmp5 = icmp sge i32 %2, 0, !dbg !479
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !480

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !481
  br label %return, !dbg !481

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !483
  br label %return, !dbg !483

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !485
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !487
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !488
  %conv9 = zext i16 %5 to i32, !dbg !488
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !489
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !489
  %div = sdiv i32 %4, %conv9, !dbg !489, !klee.check.div !115
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !490
  %conv10 = zext i16 %6 to i32, !dbg !490
  %mul = mul nsw i32 %div, %conv10, !dbg !491
  %sub = sub nsw i32 %3, %mul, !dbg !492
  %shl = shl i32 %sub, 1, !dbg !493
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !494
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !495
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !496
  %conv11 = zext i16 %8 to i32, !dbg !496
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !497
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !497
  %div12 = sdiv i32 %7, %conv11, !dbg !497, !klee.check.div !115
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !498
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !499
  %conv13 = zext i16 %10 to i32, !dbg !499
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !500
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !500
  %div14 = sdiv i32 %9, %conv13, !dbg !500, !klee.check.div !115
  %add = add nsw i32 %div12, %div14, !dbg !501
  store i32 %add, i32* %s32Temp1, align 4, !dbg !502
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !503
  %cmp15 = icmp slt i32 %11, 65535, !dbg !505
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !506

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !507
  %cmp18 = icmp sgt i32 %12, 0, !dbg !510
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !511

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !512
  %conv21 = trunc i32 %13 to i16, !dbg !514
  store i16 %conv21, i16* %retval, align 2, !dbg !515
  br label %return, !dbg !515

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !516
  br label %return, !dbg !516

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !518
  br label %return, !dbg !518

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !520
  ret i16 %14, !dbg !520
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !521 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !524, metadata !DIExpression()), !dbg !525
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !526, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !528, metadata !DIExpression()), !dbg !529
  store i32 0, i32* %u32Temp, align 4, !dbg !529
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !530
  %conv = zext i16 %0 to i32, !dbg !530
  %cmp = icmp eq i32 %conv, 0, !dbg !532
  br i1 %cmp, label %if.then, label %if.else, !dbg !533

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !534
  br label %return, !dbg !534

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !536
  %conv2 = zext i16 %1 to i32, !dbg !536
  %shl = shl i32 %conv2, 16, !dbg !538
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !539
  %conv3 = zext i16 %2 to i32, !dbg !539
  %shr = ashr i32 %conv3, 1, !dbg !540
  %add = add nsw i32 %shl, %shr, !dbg !541
  store i32 %add, i32* %u32Temp, align 4, !dbg !542
  %3 = load i32, i32* %u32Temp, align 4, !dbg !543
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !544
  %conv4 = zext i16 %4 to i32, !dbg !544
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !545
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !545
  %div = udiv i32 %3, %conv4, !dbg !545, !klee.check.div !115
  store i32 %div, i32* %u32Temp, align 4, !dbg !546
  %5 = load i32, i32* %u32Temp, align 4, !dbg !547
  %cmp5 = icmp ult i32 %5, 65535, !dbg !549
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !550

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !551
  %and = and i32 %6, 65535, !dbg !553
  %conv8 = trunc i32 %and to i16, !dbg !551
  store i16 %conv8, i16* %retval, align 2, !dbg !554
  br label %return, !dbg !554

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !555
  br label %return, !dbg !555

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !557
  ret i16 %7, !dbg !557
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !558 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !561, metadata !DIExpression()), !dbg !562
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !563, metadata !DIExpression()), !dbg !564
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !565, metadata !DIExpression()), !dbg !566
  store i32 0, i32* %u32Temp1, align 4, !dbg !566
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !567, metadata !DIExpression()), !dbg !568
  store i32 0, i32* %u32Temp2, align 4, !dbg !568
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !569
  %conv = zext i16 %0 to i32, !dbg !569
  %and = and i32 %conv, 65535, !dbg !570
  %conv1 = trunc i32 %and to i16, !dbg !569
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !571
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !572
  %conv2 = zext i16 %1 to i32, !dbg !572
  %cmp = icmp eq i32 %conv2, 0, !dbg !574
  br i1 %cmp, label %if.then, label %if.else, !dbg !575

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !576
  br label %return, !dbg !576

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !578
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !580
  %conv4 = zext i16 %3 to i32, !dbg !580
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !581
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !581
  %div = udiv i32 %2, %conv4, !dbg !581, !klee.check.div !115
  store i32 %div, i32* %u32Temp1, align 4, !dbg !582
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !583
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !584
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !585
  %conv5 = zext i16 %6 to i32, !dbg !585
  %mul = mul i32 %5, %conv5, !dbg !586
  %sub = sub i32 %4, %mul, !dbg !587
  %shl = shl i32 %sub, 1, !dbg !588
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !589
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !590
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !591
  %conv6 = zext i16 %8 to i32, !dbg !591
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !592
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !592
  %div7 = udiv i32 %7, %conv6, !dbg !592, !klee.check.div !115
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !593
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !594
  %conv8 = zext i16 %10 to i32, !dbg !594
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !595
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !595
  %div9 = udiv i32 %9, %conv8, !dbg !595, !klee.check.div !115
  %add = add i32 %div7, %div9, !dbg !596
  store i32 %add, i32* %u32Temp2, align 4, !dbg !597
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !598
  %cmp10 = icmp ult i32 %11, 65535, !dbg !600
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !601

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !602
  %and13 = and i32 %12, 65535, !dbg !604
  %conv14 = trunc i32 %and13 to i16, !dbg !602
  store i16 %conv14, i16* %retval, align 2, !dbg !605
  br label %return, !dbg !605

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !606
  br label %return, !dbg !606

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !608
  ret i16 %13, !dbg !608
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !609 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !612, metadata !DIExpression()), !dbg !613
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !614, metadata !DIExpression()), !dbg !615
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !616, metadata !DIExpression()), !dbg !617
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !618, metadata !DIExpression()), !dbg !619
  store i32 0, i32* %s32Result, align 4, !dbg !619
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 0, i32* %s32Temp1, align 4, !dbg !621
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !622
  %conv = sext i16 %0 to i32, !dbg !622
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !623
  %conv1 = zext i16 %1 to i32, !dbg !623
  %mul = mul nsw i32 %conv, %conv1, !dbg !624
  store i32 %mul, i32* %s32Result, align 4, !dbg !625
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !626
  %conv2 = sext i16 %2 to i32, !dbg !626
  %cmp = icmp eq i32 %conv2, 0, !dbg !628
  br i1 %cmp, label %if.then, label %if.else7, !dbg !629

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !630
  %cmp4 = icmp slt i32 %3, 0, !dbg !633
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !634

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !635
  br label %return, !dbg !635

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !637
  br label %return, !dbg !637

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !639
  %5 = load i32, i32* %s32Result, align 4, !dbg !641
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !642
  %conv8 = sext i16 %6 to i32, !dbg !642
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !643
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !643
  %div = sdiv i32 %5, %conv8, !dbg !643, !klee.check.div !115
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !644
  %conv9 = sext i16 %7 to i32, !dbg !644
  %mul10 = mul nsw i32 %div, %conv9, !dbg !645
  %sub = sub nsw i32 %4, %mul10, !dbg !646
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !647
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !648
  %shl = shl i32 %8, 1, !dbg !649
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !650
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !651
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !652
  %conv11 = sext i16 %10 to i32, !dbg !652
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !653
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !653
  %div12 = sdiv i32 %9, %conv11, !dbg !653, !klee.check.div !115
  %11 = load i32, i32* %s32Result, align 4, !dbg !654
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !655
  %conv13 = sext i16 %12 to i32, !dbg !655
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !656
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !656
  %div14 = sdiv i32 %11, %conv13, !dbg !656, !klee.check.div !115
  %add = add nsw i32 %div12, %div14, !dbg !657
  store i32 %add, i32* %s32Result, align 4, !dbg !658
  %13 = load i32, i32* %s32Result, align 4, !dbg !659
  %cmp15 = icmp slt i32 %13, 32767, !dbg !661
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !662

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !663
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !666
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !667

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !668
  %conv21 = trunc i32 %15 to i16, !dbg !670
  store i16 %conv21, i16* %retval, align 2, !dbg !671
  br label %return, !dbg !671

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !672
  br label %return, !dbg !672

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !674
  br label %return, !dbg !674

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !676
  ret i16 %16, !dbg !676
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !677 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !680, metadata !DIExpression()), !dbg !681
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !682, metadata !DIExpression()), !dbg !683
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !684, metadata !DIExpression()), !dbg !685
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !686, metadata !DIExpression()), !dbg !687
  store i32 0, i32* %s32Result, align 4, !dbg !687
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !688, metadata !DIExpression()), !dbg !689
  store i32 0, i32* %s32Temp1, align 4, !dbg !689
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !690
  %conv = zext i16 %0 to i32, !dbg !690
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !691
  %conv1 = sext i16 %1 to i32, !dbg !691
  %mul = mul nsw i32 %conv, %conv1, !dbg !692
  store i32 %mul, i32* %s32Result, align 4, !dbg !693
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !694
  %conv2 = zext i16 %2 to i32, !dbg !694
  %cmp = icmp eq i32 %conv2, 0, !dbg !696
  br i1 %cmp, label %if.then, label %if.else7, !dbg !697

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !698
  %cmp4 = icmp slt i32 %3, 0, !dbg !701
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !702

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !703
  br label %return, !dbg !703

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !705
  br label %return, !dbg !705

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !707
  %5 = load i32, i32* %s32Result, align 4, !dbg !709
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !710
  %conv8 = zext i16 %6 to i32, !dbg !710
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !711
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !711
  %div = sdiv i32 %5, %conv8, !dbg !711, !klee.check.div !115
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !712
  %conv9 = zext i16 %7 to i32, !dbg !712
  %mul10 = mul nsw i32 %div, %conv9, !dbg !713
  %sub = sub nsw i32 %4, %mul10, !dbg !714
  %shl = shl i32 %sub, 1, !dbg !715
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !716
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !717
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !718
  %conv11 = zext i16 %9 to i32, !dbg !718
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !719
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !719
  %div12 = sdiv i32 %8, %conv11, !dbg !719, !klee.check.div !115
  %10 = load i32, i32* %s32Result, align 4, !dbg !720
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !721
  %conv13 = zext i16 %11 to i32, !dbg !721
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !722
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !722
  %div14 = sdiv i32 %10, %conv13, !dbg !722, !klee.check.div !115
  %add = add nsw i32 %div12, %div14, !dbg !723
  store i32 %add, i32* %s32Result, align 4, !dbg !724
  %12 = load i32, i32* %s32Result, align 4, !dbg !725
  %cmp15 = icmp slt i32 %12, 32767, !dbg !727
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !728

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !729
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !732
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !733

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !734
  %conv21 = trunc i32 %14 to i16, !dbg !736
  store i16 %conv21, i16* %retval, align 2, !dbg !737
  br label %return, !dbg !737

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !738
  br label %return, !dbg !738

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !740
  br label %return, !dbg !740

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !742
  ret i16 %15, !dbg !742
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !743 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !746, metadata !DIExpression()), !dbg !747
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !748, metadata !DIExpression()), !dbg !749
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !750, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !752, metadata !DIExpression()), !dbg !753
  store i32 0, i32* %u32Result, align 4, !dbg !753
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !754, metadata !DIExpression()), !dbg !755
  store i32 0, i32* %u32Temp1, align 4, !dbg !755
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !756, metadata !DIExpression()), !dbg !757
  store i32 0, i32* %s32Result, align 4, !dbg !757
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !758, metadata !DIExpression()), !dbg !759
  store i32 0, i32* %s32Temp1, align 4, !dbg !759
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !760
  %conv = sext i16 %0 to i32, !dbg !760
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !761
  %conv1 = zext i16 %1 to i32, !dbg !761
  %mul = mul nsw i32 %conv, %conv1, !dbg !762
  store i32 %mul, i32* %s32Result, align 4, !dbg !763
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !764
  %conv2 = sext i16 %2 to i32, !dbg !764
  %cmp = icmp eq i32 %conv2, 0, !dbg !766
  br i1 %cmp, label %if.then, label %if.else7, !dbg !767

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !768
  %cmp4 = icmp sge i32 %3, 0, !dbg !771
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !772

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !773
  br label %return, !dbg !773

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !775
  br label %return, !dbg !775

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !777
  %5 = load i32, i32* %s32Result, align 4, !dbg !779
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !780
  %conv8 = sext i16 %6 to i32, !dbg !780
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !781
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !781
  %div = sdiv i32 %5, %conv8, !dbg !781, !klee.check.div !115
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !782
  %conv9 = sext i16 %7 to i32, !dbg !782
  %mul10 = mul nsw i32 %div, %conv9, !dbg !783
  %sub = sub nsw i32 %4, %mul10, !dbg !784
  %shl = shl i32 %sub, 1, !dbg !785
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !786
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !787
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !788
  %conv11 = sext i16 %9 to i32, !dbg !788
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !789
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !789
  %div12 = sdiv i32 %8, %conv11, !dbg !789, !klee.check.div !115
  %10 = load i32, i32* %s32Result, align 4, !dbg !790
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !791
  %conv13 = sext i16 %11 to i32, !dbg !791
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !792
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !792
  %div14 = sdiv i32 %10, %conv13, !dbg !792, !klee.check.div !115
  %add = add nsw i32 %div12, %div14, !dbg !793
  store i32 %add, i32* %s32Result, align 4, !dbg !794
  %12 = load i32, i32* %s32Result, align 4, !dbg !795
  %cmp15 = icmp slt i32 %12, 65535, !dbg !797
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !798

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !799
  %cmp18 = icmp sgt i32 %13, 0, !dbg !802
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !803

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !804
  %conv21 = trunc i32 %14 to i16, !dbg !806
  store i16 %conv21, i16* %retval, align 2, !dbg !807
  br label %return, !dbg !807

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !808
  br label %return, !dbg !808

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !810
  br label %return, !dbg !810

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !812
  ret i16 %15, !dbg !812
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !813 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !816, metadata !DIExpression()), !dbg !817
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !818, metadata !DIExpression()), !dbg !819
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !820, metadata !DIExpression()), !dbg !821
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !822, metadata !DIExpression()), !dbg !823
  store i32 0, i32* %s32Result, align 4, !dbg !823
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !824, metadata !DIExpression()), !dbg !825
  store i32 0, i32* %s32Temp1, align 4, !dbg !825
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !826
  %conv = sext i16 %0 to i32, !dbg !826
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !827
  %conv1 = zext i16 %1 to i32, !dbg !827
  %mul = mul nsw i32 %conv, %conv1, !dbg !828
  store i32 %mul, i32* %s32Result, align 4, !dbg !829
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !830
  %conv2 = zext i16 %2 to i32, !dbg !830
  %cmp = icmp eq i32 %conv2, 0, !dbg !832
  br i1 %cmp, label %if.then, label %if.else7, !dbg !833

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !834
  %cmp4 = icmp sge i32 %3, 0, !dbg !837
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !838

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !839
  br label %return, !dbg !839

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !841
  br label %return, !dbg !841

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !843
  %5 = load i32, i32* %s32Result, align 4, !dbg !845
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !846
  %conv8 = zext i16 %6 to i32, !dbg !846
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !847
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !847
  %div = sdiv i32 %5, %conv8, !dbg !847, !klee.check.div !115
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !848
  %conv9 = zext i16 %7 to i32, !dbg !848
  %mul10 = mul nsw i32 %div, %conv9, !dbg !849
  %sub = sub nsw i32 %4, %mul10, !dbg !850
  %shl = shl i32 %sub, 1, !dbg !851
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !852
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !853
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !854
  %conv11 = zext i16 %9 to i32, !dbg !854
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !855
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !855
  %div12 = sdiv i32 %8, %conv11, !dbg !855, !klee.check.div !115
  %10 = load i32, i32* %s32Result, align 4, !dbg !856
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !857
  %conv13 = zext i16 %11 to i32, !dbg !857
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !858
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !858
  %div14 = sdiv i32 %10, %conv13, !dbg !858, !klee.check.div !115
  %add = add nsw i32 %div12, %div14, !dbg !859
  store i32 %add, i32* %s32Result, align 4, !dbg !860
  %12 = load i32, i32* %s32Result, align 4, !dbg !861
  %cmp15 = icmp slt i32 %12, 65535, !dbg !863
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !864

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !865
  %cmp18 = icmp sgt i32 %13, 0, !dbg !868
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !869

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !870
  %conv21 = trunc i32 %14 to i16, !dbg !872
  store i16 %conv21, i16* %retval, align 2, !dbg !873
  br label %return, !dbg !873

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !874
  br label %return, !dbg !874

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !876
  br label %return, !dbg !876

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !878
  ret i16 %15, !dbg !878
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !879 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !882, metadata !DIExpression()), !dbg !883
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !884, metadata !DIExpression()), !dbg !885
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !886, metadata !DIExpression()), !dbg !887
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !888, metadata !DIExpression()), !dbg !889
  store i32 0, i32* %u32Temp1, align 4, !dbg !889
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !890, metadata !DIExpression()), !dbg !891
  store i16 0, i16* %u16TempDenom, align 2, !dbg !891
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !892
  %conv = zext i16 %0 to i32, !dbg !892
  %cmp = icmp eq i32 %conv, 0, !dbg !894
  br i1 %cmp, label %if.then, label %if.else, !dbg !895

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !898
  %conv2 = zext i16 %1 to i32, !dbg !898
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !900
  %conv3 = zext i16 %2 to i32, !dbg !900
  %mul = mul nsw i32 %conv2, %conv3, !dbg !901
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !902
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !903
  %conv4 = zext i16 %3 to i32, !dbg !903
  %shr = ashr i32 %conv4, 1, !dbg !904
  %conv5 = trunc i32 %shr to i16, !dbg !903
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !905
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !906
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !907
  %conv6 = zext i16 %5 to i32, !dbg !907
  %add = add i32 %4, %conv6, !dbg !908
  store i32 %add, i32* %u32Temp1, align 4, !dbg !909
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !910
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !911
  %conv7 = zext i16 %7 to i32, !dbg !911
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !912
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !912
  %div = udiv i32 %6, %conv7, !dbg !912, !klee.check.div !115
  store i32 %div, i32* %u32Temp1, align 4, !dbg !913
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !914
  %cmp8 = icmp ult i32 %8, 65535, !dbg !916
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !917

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !918
  %and = and i32 %9, 65535, !dbg !920
  %conv11 = trunc i32 %and to i16, !dbg !921
  store i16 %conv11, i16* %retval, align 2, !dbg !922
  br label %return, !dbg !922

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !923
  br label %return, !dbg !923

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !925
  ret i16 %10, !dbg !925
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !926 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !929, metadata !DIExpression()), !dbg !930
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !931, metadata !DIExpression()), !dbg !932
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !933, metadata !DIExpression()), !dbg !934
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !935, metadata !DIExpression()), !dbg !936
  store i32 0, i32* %u32Temp1, align 4, !dbg !936
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !937
  %cmp = icmp eq i32 %0, 0, !dbg !939
  br i1 %cmp, label %if.then, label %if.else, !dbg !940

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !941
  br label %return, !dbg !941

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !943
  %conv = zext i16 %1 to i32, !dbg !943
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !945
  %conv1 = zext i16 %2 to i32, !dbg !945
  %mul = mul nsw i32 %conv, %conv1, !dbg !946
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !947
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !948
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !948
  %div = udiv i32 %mul, %3, !dbg !948, !klee.check.div !115
  store i32 %div, i32* %u32Temp1, align 4, !dbg !949
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !950
  %conv2 = zext i16 %4 to i32, !dbg !950
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !952
  %conv3 = zext i16 %5 to i32, !dbg !952
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !953
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !954
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !955
  %mul5 = mul i32 %6, %7, !dbg !956
  %sub = sub i32 %mul4, %mul5, !dbg !957
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !958
  %div6 = udiv i32 %8, 2, !dbg !959
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !960
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !961

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !962
  %inc = add i32 %9, 1, !dbg !962
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !962
  br label %if.end, !dbg !964

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !965
  %cmp10 = icmp ult i32 %10, 65535, !dbg !967
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !968

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !969
  %and = and i32 %11, 65535, !dbg !971
  %conv13 = trunc i32 %and to i16, !dbg !972
  store i16 %conv13, i16* %retval, align 2, !dbg !973
  br label %return, !dbg !973

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !974
  br label %return, !dbg !974

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !976
  ret i16 %12, !dbg !976
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !977 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !980, metadata !DIExpression()), !dbg !981
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !982, metadata !DIExpression()), !dbg !983
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !984, metadata !DIExpression()), !dbg !985
  store i32 0, i32* %u32Temp1, align 4, !dbg !985
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !986
  %conv = zext i16 %0 to i32, !dbg !986
  %cmp = icmp eq i32 %conv, 0, !dbg !988
  br i1 %cmp, label %if.then, label %if.else, !dbg !989

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !990
  br label %return, !dbg !990

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !992
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !994
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !995
  %conv2 = zext i16 %3 to i32, !dbg !995
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !996
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !996
  %div = udiv i32 %2, %conv2, !dbg !996, !klee.check.div !115
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !997
  %conv3 = zext i16 %4 to i32, !dbg !997
  %mul = mul i32 %div, %conv3, !dbg !998
  %sub = sub i32 %1, %mul, !dbg !999
  %shl = shl i32 %sub, 1, !dbg !1000
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1001
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1002
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1003
  %conv4 = zext i16 %6 to i32, !dbg !1003
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1004
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1004
  %div5 = udiv i32 %5, %conv4, !dbg !1004, !klee.check.div !115
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1005
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1006
  %conv6 = zext i16 %8 to i32, !dbg !1006
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1007
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1007
  %div7 = udiv i32 %7, %conv6, !dbg !1007, !klee.check.div !115
  %add = add i32 %div5, %div7, !dbg !1008
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1009
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1010
  store i32 %9, i32* %retval, align 4, !dbg !1011
  br label %return, !dbg !1011

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1012
  ret i32 %10, !dbg !1012
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1013 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1016, metadata !DIExpression()), !dbg !1017
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i32 0, i32* %s32Temp1, align 4, !dbg !1023
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i32 0, i32* %s32Temp2, align 4, !dbg !1025
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 0, i32* %s32Temp3, align 4, !dbg !1027
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1028
  %conv = sext i16 %0 to i32, !dbg !1028
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1029
  %conv1 = sext i16 %1 to i32, !dbg !1029
  %mul = mul nsw i32 %conv, %conv1, !dbg !1030
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1031
  %2 = load i16, i16* %div.addr, align 2, !dbg !1032
  %conv2 = sext i16 %2 to i32, !dbg !1032
  %cmp = icmp eq i32 %conv2, 0, !dbg !1034
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1035

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1036
  %cmp4 = icmp slt i32 %3, 0, !dbg !1039
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1040

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1041
  br label %return, !dbg !1041

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1043
  br label %return, !dbg !1043

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1045
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1047
  %6 = load i16, i16* %div.addr, align 2, !dbg !1048
  %conv8 = sext i16 %6 to i32, !dbg !1048
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1049
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1049
  %div9 = sdiv i32 %5, %conv8, !dbg !1049, !klee.check.div !115
  %7 = load i16, i16* %div.addr, align 2, !dbg !1050
  %conv10 = sext i16 %7 to i32, !dbg !1050
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1051
  %sub = sub nsw i32 %4, %mul11, !dbg !1052
  %shl = shl i32 %sub, 1, !dbg !1053
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1054
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1055
  %9 = load i16, i16* %div.addr, align 2, !dbg !1056
  %conv12 = sext i16 %9 to i32, !dbg !1056
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1057
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1057
  %div13 = sdiv i32 %8, %conv12, !dbg !1057, !klee.check.div !115
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1058
  %11 = load i16, i16* %div.addr, align 2, !dbg !1059
  %conv14 = sext i16 %11 to i32, !dbg !1059
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1060
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1060
  %div15 = sdiv i32 %10, %conv14, !dbg !1060, !klee.check.div !115
  %add = add nsw i32 %div13, %div15, !dbg !1061
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1062
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1063
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1065
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1066

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1067
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1070
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1071

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1072
  %conv22 = trunc i32 %14 to i16, !dbg !1074
  store i16 %conv22, i16* %retval, align 2, !dbg !1075
  br label %return, !dbg !1075

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1076
  br label %return, !dbg !1076

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1078
  br label %return, !dbg !1078

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1080
  ret i16 %15, !dbg !1080
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1081 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1084, metadata !DIExpression()), !dbg !1085
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1086, metadata !DIExpression()), !dbg !1087
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1088, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1090, metadata !DIExpression()), !dbg !1091
  store i32 0, i32* %s32Result, align 4, !dbg !1091
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1092, metadata !DIExpression()), !dbg !1093
  store i32 0, i32* %s32Temp1, align 4, !dbg !1093
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1094
  %conv = sext i16 %0 to i32, !dbg !1094
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1095
  %conv1 = sext i16 %1 to i32, !dbg !1095
  %mul = mul nsw i32 %conv, %conv1, !dbg !1096
  store i32 %mul, i32* %s32Result, align 4, !dbg !1097
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1098
  %conv2 = zext i16 %2 to i32, !dbg !1098
  %cmp = icmp eq i32 %conv2, 0, !dbg !1100
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1101

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1102
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1105
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1106

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1107
  br label %return, !dbg !1107

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1109
  %cmp7 = icmp eq i32 %4, 0, !dbg !1111
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1112

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1113
  br label %return, !dbg !1113

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1117
  %6 = load i32, i32* %s32Result, align 4, !dbg !1119
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1120
  %conv12 = zext i16 %7 to i32, !dbg !1120
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1121
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1121
  %div = sdiv i32 %6, %conv12, !dbg !1121, !klee.check.div !115
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1122
  %conv13 = zext i16 %8 to i32, !dbg !1122
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1123
  %sub = sub nsw i32 %5, %mul14, !dbg !1124
  %shl = shl i32 %sub, 1, !dbg !1125
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1126
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1127
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1128
  %conv15 = zext i16 %10 to i32, !dbg !1128
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1129
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1129
  %div16 = sdiv i32 %9, %conv15, !dbg !1129, !klee.check.div !115
  %11 = load i32, i32* %s32Result, align 4, !dbg !1130
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1131
  %conv17 = zext i16 %12 to i32, !dbg !1131
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1132
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1132
  %div18 = sdiv i32 %11, %conv17, !dbg !1132, !klee.check.div !115
  %add = add nsw i32 %div16, %div18, !dbg !1133
  store i32 %add, i32* %s32Result, align 4, !dbg !1134
  %13 = load i32, i32* %s32Result, align 4, !dbg !1135
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1137
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1138

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1139
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1142
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1143

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1144
  %conv25 = trunc i32 %15 to i16, !dbg !1146
  store i16 %conv25, i16* %retval, align 2, !dbg !1147
  br label %return, !dbg !1147

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1148
  br label %return, !dbg !1148

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1150
  br label %return, !dbg !1150

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1152
  ret i16 %16, !dbg !1152
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1153 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1158, metadata !DIExpression()), !dbg !1159
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1160, metadata !DIExpression()), !dbg !1161
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1162
  %cmp = icmp eq i32 %0, 0, !dbg !1164
  br i1 %cmp, label %if.then, label %if.else, !dbg !1165

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1166
  br label %return, !dbg !1166

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1168
  %cmp1 = icmp sle i32 %1, 0, !dbg !1171
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1172

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1173
  br label %return, !dbg !1173

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1175
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1177
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1178
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1179
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1179
  %div = udiv i32 %3, %4, !dbg !1179, !klee.check.div !115
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1180
  %mul = mul i32 %div, %5, !dbg !1181
  %sub = sub i32 %2, %mul, !dbg !1182
  %shl = shl i32 %sub, 1, !dbg !1183
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1184
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1185
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1186
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1187
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1187
  %div4 = udiv i32 %6, %7, !dbg !1187, !klee.check.div !115
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1188
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1189
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1190
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1190
  %div5 = udiv i32 %8, %9, !dbg !1190, !klee.check.div !115
  %add = add i32 %div4, %div5, !dbg !1191
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1192
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1193
  store i32 %10, i32* %retval, align 4, !dbg !1194
  br label %return, !dbg !1194

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1195
  ret i32 %11, !dbg !1195
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1196 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1199, metadata !DIExpression()), !dbg !1200
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1201, metadata !DIExpression()), !dbg !1202
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1203, metadata !DIExpression()), !dbg !1204
  store i32 0, i32* %s32Temp1, align 4, !dbg !1204
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1205
  %cmp = icmp eq i32 %0, 0, !dbg !1207
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1208

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1209
  %cmp1 = icmp sge i32 %1, 0, !dbg !1212
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1213

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1214
  br label %return, !dbg !1214

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1216
  br label %return, !dbg !1216

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1218
  %cmp4 = icmp sge i32 %2, 0, !dbg !1221
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1222

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1223
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1225
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1226
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1227
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1227
  %div = udiv i32 %4, %5, !dbg !1227, !klee.check.div !115
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1228
  %mul = mul i32 %div, %6, !dbg !1229
  %sub = sub i32 %3, %mul, !dbg !1230
  %shl = shl i32 %sub, 1, !dbg !1231
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1232
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1233
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1234
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1235
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1235
  %div6 = udiv i32 %7, %8, !dbg !1235, !klee.check.div !115
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1236
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1237
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1238
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1238
  %div7 = udiv i32 %9, %10, !dbg !1238, !klee.check.div !115
  %add = add i32 %div6, %div7, !dbg !1239
  store i32 %add, i32* %retval, align 4, !dbg !1240
  br label %return, !dbg !1240

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1241
  br label %return, !dbg !1241

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1243
  ret i32 %11, !dbg !1243
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1244 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1247, metadata !DIExpression()), !dbg !1248
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1249, metadata !DIExpression()), !dbg !1250
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1251, metadata !DIExpression()), !dbg !1252
  store i32 0, i32* %u32Temp1, align 4, !dbg !1252
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1253, metadata !DIExpression()), !dbg !1254
  store i32 0, i32* %u32Temp2, align 4, !dbg !1254
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1255
  %cmp = icmp eq i32 %0, 0, !dbg !1257
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1258

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1259
  %cmp1 = icmp slt i32 %1, 0, !dbg !1262
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1263

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1264
  br label %return, !dbg !1264

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1266
  br label %return, !dbg !1266

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1268
  %cmp4 = icmp sge i32 %2, 0, !dbg !1271
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1272

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1273
  %cmp6 = icmp eq i32 %3, 0, !dbg !1276
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1277

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1278
  br label %return, !dbg !1278

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1280
  %cmp9 = icmp sle i32 %4, 0, !dbg !1283
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1284

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1285
  br label %return, !dbg !1285

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1287
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1289
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1290
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1291
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1291
  %div = sdiv i32 %6, %7, !dbg !1291, !klee.check.div !115
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1292
  %mul = mul nsw i32 %div, %8, !dbg !1293
  %sub = sub nsw i32 %5, %mul, !dbg !1294
  %shl = shl i32 %sub, 1, !dbg !1295
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1296
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1297
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1298
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1299
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1299
  %div12 = udiv i32 %9, %10, !dbg !1299, !klee.check.div !115
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1300
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1301
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1302
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1302
  %div13 = sdiv i32 %11, %12, !dbg !1302, !klee.check.div !115
  %add = add i32 %div12, %div13, !dbg !1303
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1304
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1305
  store i32 %13, i32* %retval, align 4, !dbg !1306
  br label %return, !dbg !1306

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1307
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1310
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1311

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1312
  br label %return, !dbg !1312

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1314
  %sub18 = sub nsw i32 0, %15, !dbg !1316
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1317
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %sub19 = sub nsw i32 0, %16, !dbg !1319
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1320
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1321
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1322
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1323
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1324
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1324
  %div20 = sdiv i32 %18, %19, !dbg !1324, !klee.check.div !115
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1325
  %mul21 = mul nsw i32 %div20, %20, !dbg !1326
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1327
  %shl23 = shl i32 %sub22, 1, !dbg !1328
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1329
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1330
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1331
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1332
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1332
  %div24 = udiv i32 %21, %22, !dbg !1332, !klee.check.div !115
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1333
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1335
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1335
  %div25 = sdiv i32 %23, %24, !dbg !1335, !klee.check.div !115
  %add26 = add i32 %div24, %div25, !dbg !1336
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1337
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1338
  store i32 %25, i32* %retval, align 4, !dbg !1339
  br label %return, !dbg !1339

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1340
  ret i32 %26, !dbg !1340
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1341 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1344, metadata !DIExpression()), !dbg !1345
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1346, metadata !DIExpression()), !dbg !1347
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1348, metadata !DIExpression()), !dbg !1349
  store i32 0, i32* %u32Temp1, align 4, !dbg !1349
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1350, metadata !DIExpression()), !dbg !1351
  store i32 0, i32* %u32Temp2, align 4, !dbg !1351
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1352, metadata !DIExpression()), !dbg !1353
  store i32 0, i32* %u32Temp3, align 4, !dbg !1353
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1354, metadata !DIExpression()), !dbg !1355
  store i32 0, i32* %numerator_old, align 4, !dbg !1355
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %cmp = icmp eq i32 %0, 0, !dbg !1358
  br i1 %cmp, label %if.then, label %if.else, !dbg !1359

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1360
  br label %return, !dbg !1360

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1362
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1364
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1365
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1366
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1367
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1367
  %div = udiv i32 %3, %4, !dbg !1367, !klee.check.div !115
  %mul = mul i32 %2, %div, !dbg !1368
  %sub = sub i32 %1, %mul, !dbg !1369
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1370
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1371
  %and = and i32 %5, 1, !dbg !1373
  %cmp1 = icmp eq i32 %and, 0, !dbg !1374
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1375

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1376
  %shr = lshr i32 %6, 1, !dbg !1378
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1379
  br label %if.end, !dbg !1380

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1381
  %shr4 = lshr i32 %7, 1, !dbg !1383
  %add = add i32 %shr4, 1, !dbg !1384
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1385
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1386
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1388
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1389
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1390

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1391
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1393
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1394
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1394
  %div7 = udiv i32 %10, %11, !dbg !1394, !klee.check.div !115
  store i32 %div7, i32* %retval, align 4, !dbg !1395
  br label %return, !dbg !1395

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1396
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1399
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1399
  %div9 = udiv i32 %12, %13, !dbg !1399, !klee.check.div !115
  %add10 = add i32 %div9, 1, !dbg !1400
  store i32 %add10, i32* %retval, align 4, !dbg !1401
  br label %return, !dbg !1401

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1402
  ret i32 %14, !dbg !1402
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1403 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1406, metadata !DIExpression()), !dbg !1407
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1408, metadata !DIExpression()), !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1410, metadata !DIExpression()), !dbg !1411
  store i32 0, i32* %u32Temp1, align 4, !dbg !1411
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1412, metadata !DIExpression()), !dbg !1413
  store i32 0, i32* %u32Temp2, align 4, !dbg !1413
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1414
  %cmp = icmp sle i32 %0, 0, !dbg !1416
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1417

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %cmp1 = icmp sge i32 %1, 0, !dbg !1421
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1422

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1423
  br label %return, !dbg !1423

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1425
  %sub = sub nsw i32 0, %2, !dbg !1427
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1428
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1429
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1430
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1431
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1432
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1432
  %div = udiv i32 %4, %5, !dbg !1432, !klee.check.div !115
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1433
  %mul = mul i32 %div, %6, !dbg !1434
  %sub3 = sub i32 %3, %mul, !dbg !1435
  %shl = shl i32 %sub3, 1, !dbg !1436
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1437
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1438
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1440
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1440
  %div4 = udiv i32 %7, %8, !dbg !1440, !klee.check.div !115
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1441
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1442
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1443
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1443
  %div5 = udiv i32 %9, %10, !dbg !1443, !klee.check.div !115
  %add = add i32 %div4, %div5, !dbg !1444
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1445
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1446
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1448
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1449

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1450
  %sub8 = sub i32 0, %12, !dbg !1452
  store i32 %sub8, i32* %retval, align 4, !dbg !1453
  br label %return, !dbg !1453

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1454
  br label %return, !dbg !1454

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1456
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1458
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1460
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1460
  %div11 = udiv i32 %14, %15, !dbg !1460, !klee.check.div !115
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1461
  %mul12 = mul i32 %div11, %16, !dbg !1462
  %sub13 = sub i32 %13, %mul12, !dbg !1463
  %shl14 = shl i32 %sub13, 1, !dbg !1464
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1465
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1466
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1467
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1468
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1468
  %div15 = udiv i32 %17, %18, !dbg !1468, !klee.check.div !115
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1469
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1471
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1471
  %div16 = udiv i32 %19, %20, !dbg !1471, !klee.check.div !115
  %add17 = add i32 %div15, %div16, !dbg !1472
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1473
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1474
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1476
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1477

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1478
  store i32 %22, i32* %retval, align 4, !dbg !1480
  br label %return, !dbg !1480

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1481
  br label %return, !dbg !1481

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1483
  ret i32 %23, !dbg !1483
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1484 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1487, metadata !DIExpression()), !dbg !1488
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1489, metadata !DIExpression()), !dbg !1490
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1491, metadata !DIExpression()), !dbg !1492
  store i32 0, i32* %s32Temp1, align 4, !dbg !1492
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1493, metadata !DIExpression()), !dbg !1494
  store i32 0, i32* %s32Temp2, align 4, !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 0, i32* %u32Temp0, align 4, !dbg !1496
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1497, metadata !DIExpression()), !dbg !1498
  store i32 0, i32* %u32Temp1, align 4, !dbg !1498
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1499, metadata !DIExpression()), !dbg !1500
  store i32 0, i32* %u32Temp2, align 4, !dbg !1500
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1501
  %cmp = icmp eq i32 %0, 0, !dbg !1503
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1504

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1505
  %cmp1 = icmp slt i32 %1, 0, !dbg !1508
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1509

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1510
  br label %return, !dbg !1510

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1514
  %cmp4 = icmp sle i32 %2, 0, !dbg !1517
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1518

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1519
  %sub = sub nsw i32 0, %3, !dbg !1521
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1522
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1523
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1524
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1525
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1525
  %div = udiv i32 %4, %5, !dbg !1525, !klee.check.div !115
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1526
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1527
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1528
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1529
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1530
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1530
  %div6 = udiv i32 %7, %8, !dbg !1530, !klee.check.div !115
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %mul = mul i32 %div6, %9, !dbg !1532
  %sub7 = sub i32 %6, %mul, !dbg !1533
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1534
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1535
  %and = and i32 %10, 1, !dbg !1537
  %cmp8 = icmp eq i32 %and, 0, !dbg !1538
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1539

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %shr = lshr i32 %11, 1, !dbg !1542
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1543
  br label %if.end, !dbg !1544

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %shr11 = lshr i32 %12, 1, !dbg !1547
  %add = add i32 %shr11, 1, !dbg !1548
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1549
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1550
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1552
  %cmp12 = icmp ult i32 %13, %14, !dbg !1553
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1554

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1555
  %neg = xor i32 %15, -1, !dbg !1557
  %add14 = add i32 %neg, 1, !dbg !1558
  store i32 %add14, i32* %retval, align 4, !dbg !1559
  br label %return, !dbg !1559

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1560
  %add16 = add i32 %16, 1, !dbg !1562
  %neg17 = xor i32 %add16, -1, !dbg !1563
  %add18 = add i32 %neg17, 1, !dbg !1564
  store i32 %add18, i32* %retval, align 4, !dbg !1565
  br label %return, !dbg !1565

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1566
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1568
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1569
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1570
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1570
  %div20 = udiv i32 %18, %19, !dbg !1570, !klee.check.div !115
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %mul21 = mul i32 %div20, %20, !dbg !1572
  %sub22 = sub i32 %17, %mul21, !dbg !1573
  %shl = shl i32 %sub22, 1, !dbg !1574
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1575
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1576
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1577
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1578
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1578
  %div23 = udiv i32 %21, %22, !dbg !1578, !klee.check.div !115
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1579
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1580
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1581
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1581
  %div24 = udiv i32 %23, %24, !dbg !1581, !klee.check.div !115
  %add25 = add i32 %div23, %div24, !dbg !1582
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1583
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1584
  store i32 %25, i32* %retval, align 4, !dbg !1585
  br label %return, !dbg !1585

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1586
  ret i32 %26, !dbg !1586
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1587 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1590, metadata !DIExpression()), !dbg !1591
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1592, metadata !DIExpression()), !dbg !1593
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1594, metadata !DIExpression()), !dbg !1595
  store i32 0, i32* %s32Temp1, align 4, !dbg !1595
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1596, metadata !DIExpression()), !dbg !1597
  store i32 0, i32* %s32Temp2, align 4, !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %denominator_prime, align 4, !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %u32Temp1, align 4, !dbg !1601
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1602, metadata !DIExpression()), !dbg !1603
  store i32 0, i32* %u32Temp2, align 4, !dbg !1603
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1604, metadata !DIExpression()), !dbg !1605
  store i32 0, i32* %u32numerator, align 4, !dbg !1605
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1606, metadata !DIExpression()), !dbg !1607
  store i32 0, i32* %u32denominator, align 4, !dbg !1607
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1608
  %cmp = icmp slt i32 %0, 0, !dbg !1610
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1611

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1612
  %cmp1 = icmp sle i32 %1, 0, !dbg !1615
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1616

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1617
  %cmp3 = icmp sge i32 %2, 0, !dbg !1620
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1621

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1622
  br label %return, !dbg !1622

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1624
  %sub = sub nsw i32 0, %3, !dbg !1626
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1627
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1628
  %sub5 = sub nsw i32 0, %4, !dbg !1629
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1630
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1631
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1632
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1633
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1634
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1634
  %div = udiv i32 %6, %7, !dbg !1634, !klee.check.div !115
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1635
  %mul = mul i32 %div, %8, !dbg !1636
  %sub6 = sub i32 %5, %mul, !dbg !1637
  %shl = shl i32 %sub6, 1, !dbg !1638
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1639
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1640
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1641
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1642
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1642
  %div7 = udiv i32 %9, %10, !dbg !1642, !klee.check.div !115
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1643
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1644
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1645
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1645
  %div8 = udiv i32 %11, %12, !dbg !1645, !klee.check.div !115
  %add = add i32 %div7, %div8, !dbg !1646
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1647
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1648
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1650
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1651

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1652
  store i32 %14, i32* %retval, align 4, !dbg !1654
  br label %return, !dbg !1654

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1655
  br label %return, !dbg !1655

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1657
  %neg = xor i32 %15, -1, !dbg !1659
  %add13 = add nsw i32 %neg, 1, !dbg !1660
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1661
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1662
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1663
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1664
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1665
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1665
  %div14 = udiv i32 %17, %18, !dbg !1665, !klee.check.div !115
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1666
  %mul15 = mul i32 %div14, %19, !dbg !1667
  %sub16 = sub i32 %16, %mul15, !dbg !1668
  %shl17 = shl i32 %sub16, 1, !dbg !1669
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1670
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1671
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1673
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1673
  %div18 = udiv i32 %20, %21, !dbg !1673, !klee.check.div !115
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1674
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1675
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1676
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1676
  %div19 = sdiv i32 %22, %23, !dbg !1676, !klee.check.div !115
  %add20 = add i32 %div18, %div19, !dbg !1677
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1678
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1679
  %neg21 = xor i32 %24, -1, !dbg !1680
  %add22 = add nsw i32 %neg21, 1, !dbg !1681
  store i32 %add22, i32* %retval, align 4, !dbg !1682
  br label %return, !dbg !1682

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1683
  %cmp24 = icmp sle i32 %25, 0, !dbg !1686
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1687

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1688
  %cmp26 = icmp sge i32 %26, 0, !dbg !1691
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1692

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1693
  br label %return, !dbg !1693

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1695
  %neg29 = xor i32 %27, -1, !dbg !1697
  %add30 = add nsw i32 %neg29, 1, !dbg !1698
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1699
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1700
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1701
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1702
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1703
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1703
  %div31 = udiv i32 %29, %30, !dbg !1703, !klee.check.div !115
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1704
  %mul32 = mul i32 %div31, %31, !dbg !1705
  %sub33 = sub i32 %28, %mul32, !dbg !1706
  %shl34 = shl i32 %sub33, 1, !dbg !1707
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1708
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1709
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1710
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1711
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1711
  %div35 = udiv i32 %32, %33, !dbg !1711, !klee.check.div !115
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1712
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1713
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1714
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1714
  %div36 = udiv i32 %34, %35, !dbg !1714, !klee.check.div !115
  %add37 = add i32 %div35, %div36, !dbg !1715
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1716
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1717
  %neg38 = xor i32 %36, -1, !dbg !1718
  %add39 = add nsw i32 %neg38, 1, !dbg !1719
  store i32 %add39, i32* %retval, align 4, !dbg !1720
  br label %return, !dbg !1720

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1721
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1723
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1725
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1725
  %div41 = sdiv i32 %38, %39, !dbg !1725, !klee.check.div !115
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %mul42 = mul nsw i32 %div41, %40, !dbg !1727
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1728
  %shl44 = shl i32 %sub43, 1, !dbg !1729
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1730
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1731
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1732
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1733
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1733
  %div45 = sdiv i32 %41, %42, !dbg !1733, !klee.check.div !115
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1734
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1735
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1736
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1736
  %div46 = udiv i32 %43, %44, !dbg !1736, !klee.check.div !115
  %add47 = add i32 %div45, %div46, !dbg !1737
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1738
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1739
  store i32 %45, i32* %retval, align 4, !dbg !1740
  br label %return, !dbg !1740

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1741
  ret i32 %46, !dbg !1741
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1742 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1745, metadata !DIExpression()), !dbg !1746
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1747, metadata !DIExpression()), !dbg !1748
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1749, metadata !DIExpression()), !dbg !1750
  store i32 0, i32* %numerator_prime, align 4, !dbg !1750
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1751, metadata !DIExpression()), !dbg !1752
  store i32 0, i32* %u32Temp1, align 4, !dbg !1752
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1753, metadata !DIExpression()), !dbg !1754
  store i32 0, i32* %u32Temp2, align 4, !dbg !1754
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1755, metadata !DIExpression()), !dbg !1756
  store i32 0, i32* %u32Temp3, align 4, !dbg !1756
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1757, metadata !DIExpression()), !dbg !1758
  store i32 0, i32* %s32Temp1, align 4, !dbg !1758
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1759, metadata !DIExpression()), !dbg !1760
  store i32 0, i32* %s32Temp2, align 4, !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1761, metadata !DIExpression()), !dbg !1762
  store i32 0, i32* %s32Temp3, align 4, !dbg !1762
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1763
  %cmp = icmp eq i32 %0, 0, !dbg !1765
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1766

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1767
  %cmp1 = icmp slt i32 %1, 0, !dbg !1770
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1771

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1772
  br label %return, !dbg !1772

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1774
  br label %return, !dbg !1774

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1776
  %cmp4 = icmp slt i32 %2, 0, !dbg !1779
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1780

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1781
  %sub = sub nsw i32 0, %3, !dbg !1783
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1784
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1785
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1786
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1787
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1787
  %div = udiv i32 %4, %5, !dbg !1787, !klee.check.div !115
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1788
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1789
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1790
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1791
  %mul = mul i32 %7, %8, !dbg !1792
  %sub6 = sub i32 %6, %mul, !dbg !1793
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1794
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1795
  %and = and i32 %9, 1, !dbg !1797
  %cmp7 = icmp eq i32 %and, 0, !dbg !1798
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1799

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1800
  %shr = lshr i32 %10, 1, !dbg !1802
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1803
  br label %if.end, !dbg !1804

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1805
  %shr10 = lshr i32 %11, 1, !dbg !1807
  %add = add i32 %shr10, 1, !dbg !1808
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1809
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1810
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1812
  %cmp11 = icmp ult i32 %12, %13, !dbg !1813
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1814

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1815
  %neg = xor i32 %14, -1, !dbg !1817
  %add13 = add i32 %neg, 1, !dbg !1818
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1819
  br label %if.end18, !dbg !1820

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1821
  %add15 = add i32 %15, 1, !dbg !1823
  %neg16 = xor i32 %add15, -1, !dbg !1824
  %add17 = add i32 %neg16, 1, !dbg !1825
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1826
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1827
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1829
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1830

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1831
  %conv = trunc i32 %17 to i16, !dbg !1833
  store i16 %conv, i16* %retval, align 2, !dbg !1834
  br label %return, !dbg !1834

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1835
  br label %return, !dbg !1835

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1837
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1839
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1840
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1840
  %div23 = udiv i32 %18, %19, !dbg !1840, !klee.check.div !115
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %mul24 = mul i32 %div23, %20, !dbg !1842
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1843
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1844
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1845
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1846
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1847
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1847
  %div25 = udiv i32 %22, %23, !dbg !1847, !klee.check.div !115
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1848
  %mul26 = mul i32 %div25, %24, !dbg !1849
  %sub27 = sub i32 %21, %mul26, !dbg !1850
  %shl = shl i32 %sub27, 1, !dbg !1851
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1852
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1853
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1854
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1855
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1855
  %div28 = udiv i32 %25, %26, !dbg !1855, !klee.check.div !115
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1856
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1857
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1858
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1858
  %div29 = udiv i32 %27, %28, !dbg !1858, !klee.check.div !115
  %add30 = add i32 %div28, %div29, !dbg !1859
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1860
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1861
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1863
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1864

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1865
  %conv34 = trunc i32 %30 to i16, !dbg !1867
  store i16 %conv34, i16* %retval, align 2, !dbg !1868
  br label %return, !dbg !1868

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1869
  br label %return, !dbg !1869

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1871
  ret i16 %31, !dbg !1871
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1872 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1878, metadata !DIExpression()), !dbg !1879
  %2 = icmp eq i64 %0, 0, !dbg !1880
  br i1 %2, label %3, label %4, !dbg !1882

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1883
  unreachable, !dbg !1883

4:                                                ; preds = %1
  ret void, !dbg !1884
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045/div_Ccode_alarm_0045.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045")
!4 = !{}
!5 = !{!6, !11, !12, !17, !22}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !13, line: 9, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045")
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
!27 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045")
!28 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!29 = distinct !DICompileUnit(language: DW_LANG_C99, file: !30, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!30 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045")
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
!41 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045")
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
!61 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045")
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
!83 = !DILocation(line: 177, column: 13, scope: !60)
!84 = !DILocation(line: 177, column: 22, scope: !60)
!85 = !DILocation(line: 177, column: 11, scope: !60)
!86 = !DILocation(line: 179, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !60, file: !61, line: 179, column: 6)
!88 = !DILocation(line: 179, column: 18, scope: !87)
!89 = !DILocation(line: 179, column: 6, scope: !60)
!90 = !DILocation(line: 181, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !61, line: 181, column: 7)
!92 = distinct !DILexicalBlock(scope: !87, file: !61, line: 180, column: 2)
!93 = !DILocation(line: 181, column: 17, scope: !91)
!94 = !DILocation(line: 181, column: 7, scope: !92)
!95 = !DILocation(line: 183, column: 4, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !61, line: 182, column: 3)
!97 = !DILocation(line: 187, column: 4, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !61, line: 186, column: 3)
!99 = !DILocation(line: 192, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !61, line: 192, column: 7)
!101 = distinct !DILexicalBlock(scope: !87, file: !61, line: 191, column: 2)
!102 = !DILocation(line: 192, column: 16, scope: !100)
!103 = !DILocation(line: 192, column: 7, scope: !101)
!104 = !DILocation(line: 195, column: 47, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !61, line: 195, column: 8)
!106 = distinct !DILexicalBlock(scope: !100, file: !61, line: 193, column: 3)
!107 = !DILocation(line: 195, column: 37, scope: !105)
!108 = !DILocation(line: 195, column: 10, scope: !105)
!109 = !DILocation(line: 195, column: 8, scope: !106)
!110 = !DILocation(line: 196, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !61, line: 195, column: 63)
!112 = !DILocation(line: 203, column: 36, scope: !106)
!113 = !DILocation(line: 203, column: 47, scope: !106)
!114 = !DILocation(line: 203, column: 45, scope: !106)
!115 = !{!"True"}
!116 = !DILocation(line: 203, column: 26, scope: !106)
!117 = !DILocation(line: 203, column: 24, scope: !106)
!118 = !DILocation(line: 204, column: 4, scope: !106)
!119 = !DILocation(line: 225, column: 7, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !61, line: 225, column: 7)
!121 = distinct !DILexicalBlock(scope: !100, file: !61, line: 224, column: 3)
!122 = !DILocation(line: 225, column: 19, scope: !120)
!123 = !DILocation(line: 225, column: 7, scope: !121)
!124 = !DILocation(line: 227, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !61, line: 226, column: 4)
!126 = !DILocation(line: 227, column: 29, scope: !125)
!127 = !DILocation(line: 227, column: 38, scope: !125)
!128 = !DILocation(line: 227, column: 37, scope: !125)
!129 = !DILocation(line: 227, column: 53, scope: !125)
!130 = !DILocation(line: 227, column: 51, scope: !125)
!131 = !DILocation(line: 227, column: 26, scope: !125)
!132 = !DILocation(line: 227, column: 66, scope: !125)
!133 = !DILocation(line: 227, column: 14, scope: !125)
!134 = !DILocation(line: 228, column: 16, scope: !125)
!135 = !DILocation(line: 228, column: 25, scope: !125)
!136 = !DILocation(line: 228, column: 24, scope: !125)
!137 = !DILocation(line: 228, column: 14, scope: !125)
!138 = !DILocation(line: 229, column: 16, scope: !125)
!139 = !DILocation(line: 229, column: 28, scope: !125)
!140 = !DILocation(line: 229, column: 37, scope: !125)
!141 = !DILocation(line: 229, column: 43, scope: !125)
!142 = !DILocation(line: 229, column: 42, scope: !125)
!143 = !DILocation(line: 229, column: 25, scope: !125)
!144 = !DILocation(line: 229, column: 14, scope: !125)
!145 = !DILocation(line: 230, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !125, file: !61, line: 230, column: 8)
!147 = !DILocation(line: 230, column: 17, scope: !146)
!148 = !DILocation(line: 230, column: 8, scope: !125)
!149 = !DILocation(line: 232, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !61, line: 232, column: 9)
!151 = distinct !DILexicalBlock(scope: !146, file: !61, line: 231, column: 5)
!152 = !DILocation(line: 232, column: 18, scope: !150)
!153 = !DILocation(line: 232, column: 9, scope: !151)
!154 = !DILocation(line: 234, column: 19, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !61, line: 233, column: 6)
!156 = !DILocation(line: 234, column: 14, scope: !155)
!157 = !DILocation(line: 234, column: 7, scope: !155)
!158 = !DILocation(line: 238, column: 7, scope: !159)
!159 = distinct !DILexicalBlock(scope: !150, file: !61, line: 237, column: 6)
!160 = !DILocation(line: 243, column: 6, scope: !161)
!161 = distinct !DILexicalBlock(scope: !146, file: !61, line: 242, column: 5)
!162 = !DILocation(line: 248, column: 5, scope: !163)
!163 = distinct !DILexicalBlock(scope: !120, file: !61, line: 247, column: 4)
!164 = !DILocation(line: 252, column: 1, scope: !60)
!165 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !27, file: !27, line: 84, type: !166, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!166 = !DISubroutineType(types: !167)
!167 = !{!11, !6}
!168 = !DILocalVariable(name: "left", arg: 1, scope: !165, file: !27, line: 84, type: !6)
!169 = !DILocation(line: 84, column: 51, scope: !165)
!170 = !DILocation(line: 86, column: 12, scope: !165)
!171 = !DILocation(line: 86, column: 17, scope: !165)
!172 = !DILocation(line: 86, column: 5, scope: !165)
!173 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !27, file: !27, line: 24, type: !166, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!174 = !DILocalVariable(name: "denominator", arg: 1, scope: !173, file: !27, line: 24, type: !6)
!175 = !DILocation(line: 24, column: 40, scope: !173)
!176 = !DILocation(line: 26, column: 12, scope: !173)
!177 = !DILocation(line: 26, column: 24, scope: !173)
!178 = !DILocation(line: 26, column: 5, scope: !173)
!179 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !61, file: !61, line: 269, type: !180, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!180 = !DISubroutineType(types: !181)
!181 = !{!12, !69, !12}
!182 = !DILocalVariable(name: "numerator", arg: 1, scope: !179, file: !61, line: 269, type: !69)
!183 = !DILocation(line: 269, column: 25, scope: !179)
!184 = !DILocalVariable(name: "denominator", arg: 2, scope: !179, file: !61, line: 269, type: !12)
!185 = !DILocation(line: 269, column: 41, scope: !179)
!186 = !DILocalVariable(name: "s32Temp1", scope: !179, file: !61, line: 271, type: !69)
!187 = !DILocation(line: 271, column: 6, scope: !179)
!188 = !DILocalVariable(name: "s32Temp2", scope: !179, file: !61, line: 271, type: !69)
!189 = !DILocation(line: 271, column: 17, scope: !179)
!190 = !DILocation(line: 272, column: 13, scope: !179)
!191 = !DILocation(line: 272, column: 11, scope: !179)
!192 = !DILocation(line: 273, column: 5, scope: !193)
!193 = distinct !DILexicalBlock(scope: !179, file: !61, line: 273, column: 5)
!194 = !DILocation(line: 273, column: 17, scope: !193)
!195 = !DILocation(line: 273, column: 5, scope: !179)
!196 = !DILocation(line: 275, column: 7, scope: !197)
!197 = distinct !DILexicalBlock(scope: !198, file: !61, line: 275, column: 7)
!198 = distinct !DILexicalBlock(scope: !193, file: !61, line: 274, column: 2)
!199 = !DILocation(line: 275, column: 17, scope: !197)
!200 = !DILocation(line: 275, column: 7, scope: !198)
!201 = !DILocation(line: 277, column: 4, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !61, line: 276, column: 3)
!203 = !DILocation(line: 281, column: 4, scope: !204)
!204 = distinct !DILexicalBlock(scope: !197, file: !61, line: 280, column: 3)
!205 = !DILocation(line: 286, column: 6, scope: !206)
!206 = distinct !DILexicalBlock(scope: !207, file: !61, line: 286, column: 6)
!207 = distinct !DILexicalBlock(scope: !193, file: !61, line: 285, column: 2)
!208 = !DILocation(line: 286, column: 16, scope: !206)
!209 = !DILocation(line: 286, column: 6, scope: !207)
!210 = !DILocation(line: 288, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !61, line: 287, column: 3)
!212 = !DILocation(line: 288, column: 28, scope: !211)
!213 = !DILocation(line: 288, column: 37, scope: !211)
!214 = !DILocation(line: 288, column: 36, scope: !211)
!215 = !DILocation(line: 288, column: 52, scope: !211)
!216 = !DILocation(line: 288, column: 50, scope: !211)
!217 = !DILocation(line: 288, column: 25, scope: !211)
!218 = !DILocation(line: 288, column: 65, scope: !211)
!219 = !DILocation(line: 288, column: 13, scope: !211)
!220 = !DILocation(line: 289, column: 15, scope: !211)
!221 = !DILocation(line: 289, column: 24, scope: !211)
!222 = !DILocation(line: 289, column: 23, scope: !211)
!223 = !DILocation(line: 289, column: 13, scope: !211)
!224 = !DILocation(line: 290, column: 15, scope: !211)
!225 = !DILocation(line: 290, column: 27, scope: !211)
!226 = !DILocation(line: 290, column: 38, scope: !211)
!227 = !DILocation(line: 290, column: 37, scope: !211)
!228 = !DILocation(line: 290, column: 24, scope: !211)
!229 = !DILocation(line: 290, column: 13, scope: !211)
!230 = !DILocation(line: 291, column: 7, scope: !231)
!231 = distinct !DILexicalBlock(scope: !211, file: !61, line: 291, column: 7)
!232 = !DILocation(line: 291, column: 16, scope: !231)
!233 = !DILocation(line: 291, column: 7, scope: !211)
!234 = !DILocation(line: 293, column: 8, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !61, line: 293, column: 8)
!236 = distinct !DILexicalBlock(scope: !231, file: !61, line: 292, column: 4)
!237 = !DILocation(line: 293, column: 17, scope: !235)
!238 = !DILocation(line: 293, column: 8, scope: !236)
!239 = !DILocation(line: 295, column: 18, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !61, line: 294, column: 5)
!241 = !DILocation(line: 295, column: 13, scope: !240)
!242 = !DILocation(line: 295, column: 6, scope: !240)
!243 = !DILocation(line: 299, column: 6, scope: !244)
!244 = distinct !DILexicalBlock(scope: !235, file: !61, line: 298, column: 5)
!245 = !DILocation(line: 304, column: 5, scope: !246)
!246 = distinct !DILexicalBlock(scope: !231, file: !61, line: 303, column: 4)
!247 = !DILocation(line: 309, column: 7, scope: !248)
!248 = distinct !DILexicalBlock(scope: !249, file: !61, line: 309, column: 7)
!249 = distinct !DILexicalBlock(scope: !206, file: !61, line: 308, column: 3)
!250 = !DILocation(line: 309, column: 19, scope: !248)
!251 = !DILocation(line: 309, column: 7, scope: !249)
!252 = !DILocation(line: 311, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !248, file: !61, line: 310, column: 4)
!254 = !DILocation(line: 311, column: 29, scope: !253)
!255 = !DILocation(line: 311, column: 38, scope: !253)
!256 = !DILocation(line: 311, column: 37, scope: !253)
!257 = !DILocation(line: 311, column: 53, scope: !253)
!258 = !DILocation(line: 311, column: 51, scope: !253)
!259 = !DILocation(line: 311, column: 26, scope: !253)
!260 = !DILocation(line: 311, column: 66, scope: !253)
!261 = !DILocation(line: 311, column: 14, scope: !253)
!262 = !DILocation(line: 312, column: 16, scope: !253)
!263 = !DILocation(line: 312, column: 25, scope: !253)
!264 = !DILocation(line: 312, column: 24, scope: !253)
!265 = !DILocation(line: 312, column: 14, scope: !253)
!266 = !DILocation(line: 313, column: 16, scope: !253)
!267 = !DILocation(line: 313, column: 28, scope: !253)
!268 = !DILocation(line: 313, column: 39, scope: !253)
!269 = !DILocation(line: 313, column: 38, scope: !253)
!270 = !DILocation(line: 313, column: 25, scope: !253)
!271 = !DILocation(line: 313, column: 14, scope: !253)
!272 = !DILocation(line: 314, column: 8, scope: !273)
!273 = distinct !DILexicalBlock(scope: !253, file: !61, line: 314, column: 8)
!274 = !DILocation(line: 314, column: 17, scope: !273)
!275 = !DILocation(line: 314, column: 8, scope: !253)
!276 = !DILocation(line: 316, column: 9, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !61, line: 316, column: 9)
!278 = distinct !DILexicalBlock(scope: !273, file: !61, line: 315, column: 5)
!279 = !DILocation(line: 316, column: 18, scope: !277)
!280 = !DILocation(line: 316, column: 9, scope: !278)
!281 = !DILocation(line: 318, column: 19, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !61, line: 317, column: 6)
!283 = !DILocation(line: 318, column: 14, scope: !282)
!284 = !DILocation(line: 318, column: 7, scope: !282)
!285 = !DILocation(line: 322, column: 7, scope: !286)
!286 = distinct !DILexicalBlock(scope: !277, file: !61, line: 321, column: 6)
!287 = !DILocation(line: 327, column: 6, scope: !288)
!288 = distinct !DILexicalBlock(scope: !273, file: !61, line: 326, column: 5)
!289 = !DILocation(line: 333, column: 5, scope: !290)
!290 = distinct !DILexicalBlock(scope: !248, file: !61, line: 332, column: 4)
!291 = !DILocation(line: 339, column: 1, scope: !179)
!292 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !61, file: !61, line: 357, type: !293, scopeLine: 358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!293 = !DISubroutineType(types: !294)
!294 = !{!12, !12, !22}
!295 = !DILocalVariable(name: "numerator", arg: 1, scope: !292, file: !61, line: 357, type: !12)
!296 = !DILocation(line: 357, column: 31, scope: !292)
!297 = !DILocalVariable(name: "denominator", arg: 2, scope: !292, file: !61, line: 357, type: !22)
!298 = !DILocation(line: 357, column: 47, scope: !292)
!299 = !DILocalVariable(name: "u16Temp1", scope: !292, file: !61, line: 359, type: !22)
!300 = !DILocation(line: 359, column: 6, scope: !292)
!301 = !DILocalVariable(name: "s32Temp1", scope: !292, file: !61, line: 360, type: !69)
!302 = !DILocation(line: 360, column: 6, scope: !292)
!303 = !DILocalVariable(name: "s32Temp2", scope: !292, file: !61, line: 360, type: !69)
!304 = !DILocation(line: 360, column: 15, scope: !292)
!305 = !DILocation(line: 361, column: 13, scope: !292)
!306 = !DILocation(line: 361, column: 25, scope: !292)
!307 = !DILocation(line: 361, column: 11, scope: !292)
!308 = !DILocation(line: 362, column: 13, scope: !292)
!309 = !DILocation(line: 362, column: 22, scope: !292)
!310 = !DILocation(line: 362, column: 11, scope: !292)
!311 = !DILocation(line: 363, column: 5, scope: !312)
!312 = distinct !DILexicalBlock(scope: !292, file: !61, line: 363, column: 5)
!313 = !DILocation(line: 363, column: 14, scope: !312)
!314 = !DILocation(line: 363, column: 5, scope: !292)
!315 = !DILocation(line: 365, column: 7, scope: !316)
!316 = distinct !DILexicalBlock(scope: !317, file: !61, line: 365, column: 7)
!317 = distinct !DILexicalBlock(scope: !312, file: !61, line: 364, column: 2)
!318 = !DILocation(line: 365, column: 17, scope: !316)
!319 = !DILocation(line: 365, column: 7, scope: !317)
!320 = !DILocation(line: 367, column: 4, scope: !321)
!321 = distinct !DILexicalBlock(scope: !316, file: !61, line: 366, column: 3)
!322 = !DILocation(line: 371, column: 4, scope: !323)
!323 = distinct !DILexicalBlock(scope: !316, file: !61, line: 370, column: 3)
!324 = !DILocation(line: 376, column: 15, scope: !325)
!325 = distinct !DILexicalBlock(scope: !312, file: !61, line: 375, column: 2)
!326 = !DILocation(line: 376, column: 24, scope: !325)
!327 = !DILocation(line: 376, column: 32, scope: !325)
!328 = !DILocation(line: 376, column: 41, scope: !325)
!329 = !DILocation(line: 376, column: 47, scope: !325)
!330 = !DILocation(line: 376, column: 46, scope: !325)
!331 = !DILocation(line: 376, column: 57, scope: !325)
!332 = !DILocation(line: 376, column: 56, scope: !325)
!333 = !DILocation(line: 376, column: 29, scope: !325)
!334 = !DILocation(line: 376, column: 12, scope: !325)
!335 = !DILocation(line: 377, column: 14, scope: !325)
!336 = !DILocation(line: 377, column: 22, scope: !325)
!337 = !DILocation(line: 377, column: 12, scope: !325)
!338 = !DILocation(line: 378, column: 14, scope: !325)
!339 = !DILocation(line: 378, column: 23, scope: !325)
!340 = !DILocation(line: 378, column: 22, scope: !325)
!341 = !DILocation(line: 378, column: 12, scope: !325)
!342 = !DILocation(line: 379, column: 16, scope: !325)
!343 = !DILocation(line: 379, column: 25, scope: !325)
!344 = !DILocation(line: 379, column: 31, scope: !325)
!345 = !DILocation(line: 379, column: 30, scope: !325)
!346 = !DILocation(line: 379, column: 43, scope: !325)
!347 = !DILocation(line: 379, column: 41, scope: !325)
!348 = !DILocation(line: 379, column: 12, scope: !325)
!349 = !DILocation(line: 380, column: 6, scope: !350)
!350 = distinct !DILexicalBlock(scope: !325, file: !61, line: 380, column: 6)
!351 = !DILocation(line: 380, column: 15, scope: !350)
!352 = !DILocation(line: 380, column: 6, scope: !325)
!353 = !DILocation(line: 382, column: 7, scope: !354)
!354 = distinct !DILexicalBlock(scope: !355, file: !61, line: 382, column: 7)
!355 = distinct !DILexicalBlock(scope: !350, file: !61, line: 381, column: 3)
!356 = !DILocation(line: 382, column: 16, scope: !354)
!357 = !DILocation(line: 382, column: 7, scope: !355)
!358 = !DILocation(line: 384, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !354, file: !61, line: 383, column: 4)
!360 = !DILocation(line: 384, column: 12, scope: !359)
!361 = !DILocation(line: 384, column: 5, scope: !359)
!362 = !DILocation(line: 388, column: 5, scope: !363)
!363 = distinct !DILexicalBlock(scope: !354, file: !61, line: 387, column: 4)
!364 = !DILocation(line: 393, column: 4, scope: !365)
!365 = distinct !DILexicalBlock(scope: !350, file: !61, line: 392, column: 3)
!366 = !DILocation(line: 396, column: 1, scope: !292)
!367 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !61, file: !61, line: 413, type: !293, scopeLine: 414, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!368 = !DILocalVariable(name: "numerator", arg: 1, scope: !367, file: !61, line: 413, type: !12)
!369 = !DILocation(line: 413, column: 30, scope: !367)
!370 = !DILocalVariable(name: "denominator", arg: 2, scope: !367, file: !61, line: 413, type: !22)
!371 = !DILocation(line: 413, column: 45, scope: !367)
!372 = !DILocalVariable(name: "u16Temp1", scope: !367, file: !61, line: 415, type: !22)
!373 = !DILocation(line: 415, column: 6, scope: !367)
!374 = !DILocalVariable(name: "s32Temp1", scope: !367, file: !61, line: 416, type: !69)
!375 = !DILocation(line: 416, column: 6, scope: !367)
!376 = !DILocation(line: 417, column: 13, scope: !367)
!377 = !DILocation(line: 417, column: 25, scope: !367)
!378 = !DILocation(line: 417, column: 11, scope: !367)
!379 = !DILocation(line: 418, column: 5, scope: !380)
!380 = distinct !DILexicalBlock(scope: !367, file: !61, line: 418, column: 5)
!381 = !DILocation(line: 418, column: 13, scope: !380)
!382 = !DILocation(line: 418, column: 5, scope: !367)
!383 = !DILocation(line: 420, column: 6, scope: !384)
!384 = distinct !DILexicalBlock(scope: !385, file: !61, line: 420, column: 6)
!385 = distinct !DILexicalBlock(scope: !380, file: !61, line: 419, column: 2)
!386 = !DILocation(line: 420, column: 15, scope: !384)
!387 = !DILocation(line: 420, column: 6, scope: !385)
!388 = !DILocation(line: 422, column: 4, scope: !389)
!389 = distinct !DILexicalBlock(scope: !384, file: !61, line: 421, column: 3)
!390 = !DILocation(line: 426, column: 4, scope: !391)
!391 = distinct !DILexicalBlock(scope: !384, file: !61, line: 425, column: 3)
!392 = !DILocation(line: 432, column: 15, scope: !393)
!393 = distinct !DILexicalBlock(scope: !380, file: !61, line: 431, column: 2)
!394 = !DILocation(line: 432, column: 27, scope: !393)
!395 = !DILocation(line: 432, column: 37, scope: !393)
!396 = !DILocation(line: 432, column: 36, scope: !393)
!397 = !DILocation(line: 432, column: 49, scope: !393)
!398 = !DILocation(line: 432, column: 47, scope: !393)
!399 = !DILocation(line: 432, column: 25, scope: !393)
!400 = !DILocation(line: 432, column: 59, scope: !393)
!401 = !DILocation(line: 432, column: 12, scope: !393)
!402 = !DILocation(line: 433, column: 15, scope: !393)
!403 = !DILocation(line: 433, column: 24, scope: !393)
!404 = !DILocation(line: 433, column: 23, scope: !393)
!405 = !DILocation(line: 433, column: 37, scope: !393)
!406 = !DILocation(line: 433, column: 47, scope: !393)
!407 = !DILocation(line: 433, column: 46, scope: !393)
!408 = !DILocation(line: 433, column: 34, scope: !393)
!409 = !DILocation(line: 433, column: 12, scope: !393)
!410 = !DILocation(line: 434, column: 10, scope: !393)
!411 = !DILocation(line: 434, column: 3, scope: !393)
!412 = !DILocation(line: 436, column: 1, scope: !367)
!413 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !61, file: !61, line: 454, type: !414, scopeLine: 455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!414 = !DISubroutineType(types: !415)
!415 = !{!17, !22, !22}
!416 = !DILocalVariable(name: "numerator", arg: 1, scope: !413, file: !61, line: 454, type: !22)
!417 = !DILocation(line: 454, column: 28, scope: !413)
!418 = !DILocalVariable(name: "denominator", arg: 2, scope: !413, file: !61, line: 454, type: !22)
!419 = !DILocation(line: 454, column: 43, scope: !413)
!420 = !DILocalVariable(name: "u32Temp1", scope: !413, file: !61, line: 456, type: !421)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !422)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !423)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !424)
!424 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!425 = !DILocation(line: 456, column: 6, scope: !413)
!426 = !DILocalVariable(name: "u32Temp2", scope: !413, file: !61, line: 456, type: !421)
!427 = !DILocation(line: 456, column: 20, scope: !413)
!428 = !DILocalVariable(name: "u32Temp3", scope: !413, file: !61, line: 456, type: !421)
!429 = !DILocation(line: 456, column: 33, scope: !413)
!430 = !DILocation(line: 457, column: 5, scope: !431)
!431 = distinct !DILexicalBlock(scope: !413, file: !61, line: 457, column: 5)
!432 = !DILocation(line: 457, column: 16, scope: !431)
!433 = !DILocation(line: 457, column: 5, scope: !413)
!434 = !DILocation(line: 459, column: 3, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !61, line: 458, column: 2)
!436 = !DILocation(line: 463, column: 15, scope: !437)
!437 = distinct !DILexicalBlock(scope: !431, file: !61, line: 462, column: 2)
!438 = !DILocation(line: 463, column: 24, scope: !437)
!439 = !DILocation(line: 463, column: 12, scope: !437)
!440 = !DILocation(line: 464, column: 14, scope: !437)
!441 = !DILocation(line: 464, column: 25, scope: !437)
!442 = !DILocation(line: 464, column: 23, scope: !437)
!443 = !DILocation(line: 464, column: 12, scope: !437)
!444 = !DILocation(line: 465, column: 15, scope: !437)
!445 = !DILocation(line: 465, column: 24, scope: !437)
!446 = !DILocation(line: 465, column: 32, scope: !437)
!447 = !DILocation(line: 465, column: 12, scope: !437)
!448 = !DILocation(line: 466, column: 6, scope: !449)
!449 = distinct !DILexicalBlock(scope: !437, file: !61, line: 466, column: 6)
!450 = !DILocation(line: 466, column: 15, scope: !449)
!451 = !DILocation(line: 466, column: 6, scope: !437)
!452 = !DILocation(line: 468, column: 15, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !61, line: 467, column: 3)
!454 = !DILocation(line: 468, column: 11, scope: !453)
!455 = !DILocation(line: 468, column: 4, scope: !453)
!456 = !DILocation(line: 472, column: 4, scope: !457)
!457 = distinct !DILexicalBlock(scope: !449, file: !61, line: 471, column: 3)
!458 = !DILocation(line: 475, column: 1, scope: !413)
!459 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !61, file: !61, line: 492, type: !460, scopeLine: 493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!460 = !DISubroutineType(types: !461)
!461 = !{!22, !69, !22}
!462 = !DILocalVariable(name: "x_value", arg: 1, scope: !459, file: !61, line: 492, type: !69)
!463 = !DILocation(line: 492, column: 25, scope: !459)
!464 = !DILocalVariable(name: "y_value", arg: 2, scope: !459, file: !61, line: 492, type: !22)
!465 = !DILocation(line: 492, column: 38, scope: !459)
!466 = !DILocalVariable(name: "s32Temp1", scope: !459, file: !61, line: 494, type: !69)
!467 = !DILocation(line: 494, column: 6, scope: !459)
!468 = !DILocation(line: 495, column: 12, scope: !459)
!469 = !DILocation(line: 495, column: 20, scope: !459)
!470 = !DILocation(line: 495, column: 10, scope: !459)
!471 = !DILocation(line: 496, column: 6, scope: !472)
!472 = distinct !DILexicalBlock(scope: !459, file: !61, line: 496, column: 5)
!473 = !DILocation(line: 496, column: 14, scope: !472)
!474 = !DILocation(line: 496, column: 24, scope: !472)
!475 = !DILocation(line: 496, column: 5, scope: !459)
!476 = !DILocation(line: 498, column: 6, scope: !477)
!477 = distinct !DILexicalBlock(scope: !478, file: !61, line: 498, column: 6)
!478 = distinct !DILexicalBlock(scope: !472, file: !61, line: 497, column: 2)
!479 = !DILocation(line: 498, column: 14, scope: !477)
!480 = !DILocation(line: 498, column: 6, scope: !478)
!481 = !DILocation(line: 500, column: 4, scope: !482)
!482 = distinct !DILexicalBlock(scope: !477, file: !61, line: 499, column: 3)
!483 = !DILocation(line: 504, column: 4, scope: !484)
!484 = distinct !DILexicalBlock(scope: !477, file: !61, line: 503, column: 3)
!485 = !DILocation(line: 509, column: 15, scope: !486)
!486 = distinct !DILexicalBlock(scope: !472, file: !61, line: 508, column: 2)
!487 = !DILocation(line: 509, column: 27, scope: !486)
!488 = !DILocation(line: 509, column: 35, scope: !486)
!489 = !DILocation(line: 509, column: 34, scope: !486)
!490 = !DILocation(line: 509, column: 46, scope: !486)
!491 = !DILocation(line: 509, column: 44, scope: !486)
!492 = !DILocation(line: 509, column: 23, scope: !486)
!493 = !DILocation(line: 509, column: 56, scope: !486)
!494 = !DILocation(line: 509, column: 12, scope: !486)
!495 = !DILocation(line: 510, column: 15, scope: !486)
!496 = !DILocation(line: 510, column: 24, scope: !486)
!497 = !DILocation(line: 510, column: 23, scope: !486)
!498 = !DILocation(line: 510, column: 36, scope: !486)
!499 = !DILocation(line: 510, column: 44, scope: !486)
!500 = !DILocation(line: 510, column: 43, scope: !486)
!501 = !DILocation(line: 510, column: 33, scope: !486)
!502 = !DILocation(line: 510, column: 12, scope: !486)
!503 = !DILocation(line: 511, column: 6, scope: !504)
!504 = distinct !DILexicalBlock(scope: !486, file: !61, line: 511, column: 6)
!505 = !DILocation(line: 511, column: 15, scope: !504)
!506 = !DILocation(line: 511, column: 6, scope: !486)
!507 = !DILocation(line: 513, column: 7, scope: !508)
!508 = distinct !DILexicalBlock(scope: !509, file: !61, line: 513, column: 7)
!509 = distinct !DILexicalBlock(scope: !504, file: !61, line: 512, column: 3)
!510 = !DILocation(line: 513, column: 16, scope: !508)
!511 = !DILocation(line: 513, column: 7, scope: !509)
!512 = !DILocation(line: 515, column: 17, scope: !513)
!513 = distinct !DILexicalBlock(scope: !508, file: !61, line: 514, column: 4)
!514 = !DILocation(line: 515, column: 12, scope: !513)
!515 = !DILocation(line: 515, column: 5, scope: !513)
!516 = !DILocation(line: 519, column: 5, scope: !517)
!517 = distinct !DILexicalBlock(scope: !508, file: !61, line: 518, column: 4)
!518 = !DILocation(line: 524, column: 4, scope: !519)
!519 = distinct !DILexicalBlock(scope: !504, file: !61, line: 523, column: 3)
!520 = !DILocation(line: 527, column: 1, scope: !459)
!521 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !61, file: !61, line: 545, type: !522, scopeLine: 546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!522 = !DISubroutineType(types: !523)
!523 = !{!22, !22, !22}
!524 = !DILocalVariable(name: "numerator", arg: 1, scope: !521, file: !61, line: 545, type: !22)
!525 = !DILocation(line: 545, column: 31, scope: !521)
!526 = !DILocalVariable(name: "denominator", arg: 2, scope: !521, file: !61, line: 545, type: !22)
!527 = !DILocation(line: 545, column: 46, scope: !521)
!528 = !DILocalVariable(name: "u32Temp", scope: !521, file: !61, line: 547, type: !421)
!529 = !DILocation(line: 547, column: 6, scope: !521)
!530 = !DILocation(line: 548, column: 5, scope: !531)
!531 = distinct !DILexicalBlock(scope: !521, file: !61, line: 548, column: 5)
!532 = !DILocation(line: 548, column: 17, scope: !531)
!533 = !DILocation(line: 548, column: 5, scope: !521)
!534 = !DILocation(line: 550, column: 3, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !61, line: 549, column: 2)
!536 = !DILocation(line: 554, column: 14, scope: !537)
!537 = distinct !DILexicalBlock(scope: !531, file: !61, line: 553, column: 2)
!538 = !DILocation(line: 554, column: 23, scope: !537)
!539 = !DILocation(line: 554, column: 32, scope: !537)
!540 = !DILocation(line: 554, column: 44, scope: !537)
!541 = !DILocation(line: 554, column: 29, scope: !537)
!542 = !DILocation(line: 554, column: 11, scope: !537)
!543 = !DILocation(line: 555, column: 13, scope: !537)
!544 = !DILocation(line: 555, column: 21, scope: !537)
!545 = !DILocation(line: 555, column: 20, scope: !537)
!546 = !DILocation(line: 555, column: 11, scope: !537)
!547 = !DILocation(line: 556, column: 6, scope: !548)
!548 = distinct !DILexicalBlock(scope: !537, file: !61, line: 556, column: 6)
!549 = !DILocation(line: 556, column: 14, scope: !548)
!550 = !DILocation(line: 556, column: 6, scope: !537)
!551 = !DILocation(line: 558, column: 11, scope: !552)
!552 = distinct !DILexicalBlock(scope: !548, file: !61, line: 557, column: 3)
!553 = !DILocation(line: 558, column: 19, scope: !552)
!554 = !DILocation(line: 558, column: 4, scope: !552)
!555 = !DILocation(line: 562, column: 4, scope: !556)
!556 = distinct !DILexicalBlock(scope: !548, file: !61, line: 561, column: 3)
!557 = !DILocation(line: 566, column: 1, scope: !521)
!558 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !61, file: !61, line: 583, type: !559, scopeLine: 584, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!559 = !DISubroutineType(types: !560)
!560 = !{!22, !421, !22}
!561 = !DILocalVariable(name: "x_value", arg: 1, scope: !558, file: !61, line: 583, type: !421)
!562 = !DILocation(line: 583, column: 25, scope: !558)
!563 = !DILocalVariable(name: "y_value", arg: 2, scope: !558, file: !61, line: 583, type: !22)
!564 = !DILocation(line: 583, column: 38, scope: !558)
!565 = !DILocalVariable(name: "u32Temp1", scope: !558, file: !61, line: 585, type: !421)
!566 = !DILocation(line: 585, column: 6, scope: !558)
!567 = !DILocalVariable(name: "u32Temp2", scope: !558, file: !61, line: 585, type: !421)
!568 = !DILocation(line: 585, column: 17, scope: !558)
!569 = !DILocation(line: 586, column: 12, scope: !558)
!570 = !DILocation(line: 586, column: 20, scope: !558)
!571 = !DILocation(line: 586, column: 10, scope: !558)
!572 = !DILocation(line: 587, column: 5, scope: !573)
!573 = distinct !DILexicalBlock(scope: !558, file: !61, line: 587, column: 5)
!574 = !DILocation(line: 587, column: 13, scope: !573)
!575 = !DILocation(line: 587, column: 5, scope: !558)
!576 = !DILocation(line: 589, column: 3, scope: !577)
!577 = distinct !DILexicalBlock(scope: !573, file: !61, line: 588, column: 2)
!578 = !DILocation(line: 593, column: 14, scope: !579)
!579 = distinct !DILexicalBlock(scope: !573, file: !61, line: 592, column: 2)
!580 = !DILocation(line: 593, column: 22, scope: !579)
!581 = !DILocation(line: 593, column: 21, scope: !579)
!582 = !DILocation(line: 593, column: 12, scope: !579)
!583 = !DILocation(line: 594, column: 14, scope: !579)
!584 = !DILocation(line: 594, column: 25, scope: !579)
!585 = !DILocation(line: 594, column: 36, scope: !579)
!586 = !DILocation(line: 594, column: 34, scope: !579)
!587 = !DILocation(line: 594, column: 22, scope: !579)
!588 = !DILocation(line: 594, column: 45, scope: !579)
!589 = !DILocation(line: 594, column: 12, scope: !579)
!590 = !DILocation(line: 595, column: 15, scope: !579)
!591 = !DILocation(line: 595, column: 24, scope: !579)
!592 = !DILocation(line: 595, column: 23, scope: !579)
!593 = !DILocation(line: 595, column: 36, scope: !579)
!594 = !DILocation(line: 595, column: 44, scope: !579)
!595 = !DILocation(line: 595, column: 43, scope: !579)
!596 = !DILocation(line: 595, column: 33, scope: !579)
!597 = !DILocation(line: 595, column: 12, scope: !579)
!598 = !DILocation(line: 596, column: 6, scope: !599)
!599 = distinct !DILexicalBlock(scope: !579, file: !61, line: 596, column: 6)
!600 = !DILocation(line: 596, column: 15, scope: !599)
!601 = !DILocation(line: 596, column: 6, scope: !579)
!602 = !DILocation(line: 598, column: 11, scope: !603)
!603 = distinct !DILexicalBlock(scope: !599, file: !61, line: 597, column: 3)
!604 = !DILocation(line: 598, column: 20, scope: !603)
!605 = !DILocation(line: 598, column: 4, scope: !603)
!606 = !DILocation(line: 602, column: 4, scope: !607)
!607 = distinct !DILexicalBlock(scope: !599, file: !61, line: 601, column: 3)
!608 = !DILocation(line: 606, column: 1, scope: !558)
!609 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 625, type: !610, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!610 = !DISubroutineType(types: !611)
!611 = !{!12, !12, !22, !12}
!612 = !DILocalVariable(name: "factor1", arg: 1, scope: !609, file: !61, line: 625, type: !12)
!613 = !DILocation(line: 625, column: 33, scope: !609)
!614 = !DILocalVariable(name: "factor2", arg: 2, scope: !609, file: !61, line: 625, type: !22)
!615 = !DILocation(line: 625, column: 46, scope: !609)
!616 = !DILocalVariable(name: "denominator", arg: 3, scope: !609, file: !61, line: 625, type: !12)
!617 = !DILocation(line: 625, column: 59, scope: !609)
!618 = !DILocalVariable(name: "s32Result", scope: !609, file: !61, line: 627, type: !69)
!619 = !DILocation(line: 627, column: 6, scope: !609)
!620 = !DILocalVariable(name: "s32Temp1", scope: !609, file: !61, line: 627, type: !69)
!621 = !DILocation(line: 627, column: 21, scope: !609)
!622 = !DILocation(line: 628, column: 14, scope: !609)
!623 = !DILocation(line: 628, column: 24, scope: !609)
!624 = !DILocation(line: 628, column: 22, scope: !609)
!625 = !DILocation(line: 628, column: 12, scope: !609)
!626 = !DILocation(line: 629, column: 5, scope: !627)
!627 = distinct !DILexicalBlock(scope: !609, file: !61, line: 629, column: 5)
!628 = !DILocation(line: 629, column: 17, scope: !627)
!629 = !DILocation(line: 629, column: 5, scope: !609)
!630 = !DILocation(line: 631, column: 6, scope: !631)
!631 = distinct !DILexicalBlock(scope: !632, file: !61, line: 631, column: 6)
!632 = distinct !DILexicalBlock(scope: !627, file: !61, line: 630, column: 2)
!633 = !DILocation(line: 631, column: 16, scope: !631)
!634 = !DILocation(line: 631, column: 6, scope: !632)
!635 = !DILocation(line: 633, column: 4, scope: !636)
!636 = distinct !DILexicalBlock(scope: !631, file: !61, line: 632, column: 3)
!637 = !DILocation(line: 637, column: 4, scope: !638)
!638 = distinct !DILexicalBlock(scope: !631, file: !61, line: 636, column: 3)
!639 = !DILocation(line: 642, column: 14, scope: !640)
!640 = distinct !DILexicalBlock(scope: !627, file: !61, line: 641, column: 2)
!641 = !DILocation(line: 642, column: 27, scope: !640)
!642 = !DILocation(line: 642, column: 37, scope: !640)
!643 = !DILocation(line: 642, column: 36, scope: !640)
!644 = !DILocation(line: 642, column: 50, scope: !640)
!645 = !DILocation(line: 642, column: 49, scope: !640)
!646 = !DILocation(line: 642, column: 24, scope: !640)
!647 = !DILocation(line: 642, column: 12, scope: !640)
!648 = !DILocation(line: 643, column: 14, scope: !640)
!649 = !DILocation(line: 643, column: 23, scope: !640)
!650 = !DILocation(line: 643, column: 12, scope: !640)
!651 = !DILocation(line: 644, column: 16, scope: !640)
!652 = !DILocation(line: 644, column: 25, scope: !640)
!653 = !DILocation(line: 644, column: 24, scope: !640)
!654 = !DILocation(line: 644, column: 41, scope: !640)
!655 = !DILocation(line: 644, column: 51, scope: !640)
!656 = !DILocation(line: 644, column: 50, scope: !640)
!657 = !DILocation(line: 644, column: 38, scope: !640)
!658 = !DILocation(line: 644, column: 13, scope: !640)
!659 = !DILocation(line: 645, column: 6, scope: !660)
!660 = distinct !DILexicalBlock(scope: !640, file: !61, line: 645, column: 6)
!661 = !DILocation(line: 645, column: 16, scope: !660)
!662 = !DILocation(line: 645, column: 6, scope: !640)
!663 = !DILocation(line: 647, column: 7, scope: !664)
!664 = distinct !DILexicalBlock(scope: !665, file: !61, line: 647, column: 7)
!665 = distinct !DILexicalBlock(scope: !660, file: !61, line: 646, column: 3)
!666 = !DILocation(line: 647, column: 17, scope: !664)
!667 = !DILocation(line: 647, column: 7, scope: !665)
!668 = !DILocation(line: 649, column: 17, scope: !669)
!669 = distinct !DILexicalBlock(scope: !664, file: !61, line: 648, column: 4)
!670 = !DILocation(line: 649, column: 12, scope: !669)
!671 = !DILocation(line: 649, column: 5, scope: !669)
!672 = !DILocation(line: 654, column: 5, scope: !673)
!673 = distinct !DILexicalBlock(scope: !664, file: !61, line: 653, column: 4)
!674 = !DILocation(line: 659, column: 4, scope: !675)
!675 = distinct !DILexicalBlock(scope: !660, file: !61, line: 658, column: 3)
!676 = !DILocation(line: 663, column: 1, scope: !609)
!677 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !61, file: !61, line: 681, type: !678, scopeLine: 682, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!678 = !DISubroutineType(types: !679)
!679 = !{!12, !22, !12, !22}
!680 = !DILocalVariable(name: "factor1", arg: 1, scope: !677, file: !61, line: 681, type: !22)
!681 = !DILocation(line: 681, column: 33, scope: !677)
!682 = !DILocalVariable(name: "factor2", arg: 2, scope: !677, file: !61, line: 681, type: !12)
!683 = !DILocation(line: 681, column: 46, scope: !677)
!684 = !DILocalVariable(name: "denominator", arg: 3, scope: !677, file: !61, line: 681, type: !22)
!685 = !DILocation(line: 681, column: 59, scope: !677)
!686 = !DILocalVariable(name: "s32Result", scope: !677, file: !61, line: 683, type: !69)
!687 = !DILocation(line: 683, column: 6, scope: !677)
!688 = !DILocalVariable(name: "s32Temp1", scope: !677, file: !61, line: 683, type: !69)
!689 = !DILocation(line: 683, column: 21, scope: !677)
!690 = !DILocation(line: 684, column: 14, scope: !677)
!691 = !DILocation(line: 684, column: 24, scope: !677)
!692 = !DILocation(line: 684, column: 22, scope: !677)
!693 = !DILocation(line: 684, column: 12, scope: !677)
!694 = !DILocation(line: 685, column: 5, scope: !695)
!695 = distinct !DILexicalBlock(scope: !677, file: !61, line: 685, column: 5)
!696 = !DILocation(line: 685, column: 16, scope: !695)
!697 = !DILocation(line: 685, column: 5, scope: !677)
!698 = !DILocation(line: 687, column: 6, scope: !699)
!699 = distinct !DILexicalBlock(scope: !700, file: !61, line: 687, column: 6)
!700 = distinct !DILexicalBlock(scope: !695, file: !61, line: 686, column: 2)
!701 = !DILocation(line: 687, column: 16, scope: !699)
!702 = !DILocation(line: 687, column: 6, scope: !700)
!703 = !DILocation(line: 689, column: 4, scope: !704)
!704 = distinct !DILexicalBlock(scope: !699, file: !61, line: 688, column: 3)
!705 = !DILocation(line: 693, column: 4, scope: !706)
!706 = distinct !DILexicalBlock(scope: !699, file: !61, line: 692, column: 3)
!707 = !DILocation(line: 698, column: 14, scope: !708)
!708 = distinct !DILexicalBlock(scope: !695, file: !61, line: 697, column: 2)
!709 = !DILocation(line: 698, column: 28, scope: !708)
!710 = !DILocation(line: 698, column: 38, scope: !708)
!711 = !DILocation(line: 698, column: 37, scope: !708)
!712 = !DILocation(line: 698, column: 53, scope: !708)
!713 = !DILocation(line: 698, column: 51, scope: !708)
!714 = !DILocation(line: 698, column: 24, scope: !708)
!715 = !DILocation(line: 698, column: 66, scope: !708)
!716 = !DILocation(line: 698, column: 12, scope: !708)
!717 = !DILocation(line: 699, column: 16, scope: !708)
!718 = !DILocation(line: 699, column: 25, scope: !708)
!719 = !DILocation(line: 699, column: 24, scope: !708)
!720 = !DILocation(line: 699, column: 41, scope: !708)
!721 = !DILocation(line: 699, column: 51, scope: !708)
!722 = !DILocation(line: 699, column: 50, scope: !708)
!723 = !DILocation(line: 699, column: 38, scope: !708)
!724 = !DILocation(line: 699, column: 13, scope: !708)
!725 = !DILocation(line: 700, column: 6, scope: !726)
!726 = distinct !DILexicalBlock(scope: !708, file: !61, line: 700, column: 6)
!727 = !DILocation(line: 700, column: 16, scope: !726)
!728 = !DILocation(line: 700, column: 6, scope: !708)
!729 = !DILocation(line: 702, column: 7, scope: !730)
!730 = distinct !DILexicalBlock(scope: !731, file: !61, line: 702, column: 7)
!731 = distinct !DILexicalBlock(scope: !726, file: !61, line: 701, column: 3)
!732 = !DILocation(line: 702, column: 17, scope: !730)
!733 = !DILocation(line: 702, column: 7, scope: !731)
!734 = !DILocation(line: 704, column: 17, scope: !735)
!735 = distinct !DILexicalBlock(scope: !730, file: !61, line: 703, column: 4)
!736 = !DILocation(line: 704, column: 12, scope: !735)
!737 = !DILocation(line: 704, column: 5, scope: !735)
!738 = !DILocation(line: 708, column: 5, scope: !739)
!739 = distinct !DILexicalBlock(scope: !730, file: !61, line: 707, column: 4)
!740 = !DILocation(line: 713, column: 4, scope: !741)
!741 = distinct !DILexicalBlock(scope: !726, file: !61, line: 712, column: 3)
!742 = !DILocation(line: 716, column: 1, scope: !677)
!743 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 735, type: !744, scopeLine: 736, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!744 = !DISubroutineType(types: !745)
!745 = !{!22, !12, !22, !12}
!746 = !DILocalVariable(name: "factor1", arg: 1, scope: !743, file: !61, line: 735, type: !12)
!747 = !DILocation(line: 735, column: 33, scope: !743)
!748 = !DILocalVariable(name: "factor2", arg: 2, scope: !743, file: !61, line: 735, type: !22)
!749 = !DILocation(line: 735, column: 46, scope: !743)
!750 = !DILocalVariable(name: "denominator", arg: 3, scope: !743, file: !61, line: 735, type: !12)
!751 = !DILocation(line: 735, column: 59, scope: !743)
!752 = !DILocalVariable(name: "u32Result", scope: !743, file: !61, line: 737, type: !421)
!753 = !DILocation(line: 737, column: 6, scope: !743)
!754 = !DILocalVariable(name: "u32Temp1", scope: !743, file: !61, line: 737, type: !421)
!755 = !DILocation(line: 737, column: 21, scope: !743)
!756 = !DILocalVariable(name: "s32Result", scope: !743, file: !61, line: 738, type: !69)
!757 = !DILocation(line: 738, column: 6, scope: !743)
!758 = !DILocalVariable(name: "s32Temp1", scope: !743, file: !61, line: 738, type: !69)
!759 = !DILocation(line: 738, column: 21, scope: !743)
!760 = !DILocation(line: 739, column: 14, scope: !743)
!761 = !DILocation(line: 739, column: 24, scope: !743)
!762 = !DILocation(line: 739, column: 22, scope: !743)
!763 = !DILocation(line: 739, column: 12, scope: !743)
!764 = !DILocation(line: 741, column: 5, scope: !765)
!765 = distinct !DILexicalBlock(scope: !743, file: !61, line: 741, column: 5)
!766 = !DILocation(line: 741, column: 17, scope: !765)
!767 = !DILocation(line: 741, column: 5, scope: !743)
!768 = !DILocation(line: 743, column: 6, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !61, line: 743, column: 6)
!770 = distinct !DILexicalBlock(scope: !765, file: !61, line: 742, column: 2)
!771 = !DILocation(line: 743, column: 16, scope: !769)
!772 = !DILocation(line: 743, column: 6, scope: !770)
!773 = !DILocation(line: 745, column: 4, scope: !774)
!774 = distinct !DILexicalBlock(scope: !769, file: !61, line: 744, column: 3)
!775 = !DILocation(line: 749, column: 4, scope: !776)
!776 = distinct !DILexicalBlock(scope: !769, file: !61, line: 748, column: 3)
!777 = !DILocation(line: 754, column: 15, scope: !778)
!778 = distinct !DILexicalBlock(scope: !765, file: !61, line: 753, column: 2)
!779 = !DILocation(line: 754, column: 29, scope: !778)
!780 = !DILocation(line: 754, column: 39, scope: !778)
!781 = !DILocation(line: 754, column: 38, scope: !778)
!782 = !DILocation(line: 754, column: 54, scope: !778)
!783 = !DILocation(line: 754, column: 52, scope: !778)
!784 = !DILocation(line: 754, column: 25, scope: !778)
!785 = !DILocation(line: 754, column: 68, scope: !778)
!786 = !DILocation(line: 754, column: 12, scope: !778)
!787 = !DILocation(line: 755, column: 16, scope: !778)
!788 = !DILocation(line: 755, column: 25, scope: !778)
!789 = !DILocation(line: 755, column: 24, scope: !778)
!790 = !DILocation(line: 755, column: 41, scope: !778)
!791 = !DILocation(line: 755, column: 51, scope: !778)
!792 = !DILocation(line: 755, column: 50, scope: !778)
!793 = !DILocation(line: 755, column: 38, scope: !778)
!794 = !DILocation(line: 755, column: 13, scope: !778)
!795 = !DILocation(line: 756, column: 6, scope: !796)
!796 = distinct !DILexicalBlock(scope: !778, file: !61, line: 756, column: 6)
!797 = !DILocation(line: 756, column: 16, scope: !796)
!798 = !DILocation(line: 756, column: 6, scope: !778)
!799 = !DILocation(line: 758, column: 7, scope: !800)
!800 = distinct !DILexicalBlock(scope: !801, file: !61, line: 758, column: 7)
!801 = distinct !DILexicalBlock(scope: !796, file: !61, line: 757, column: 3)
!802 = !DILocation(line: 758, column: 17, scope: !800)
!803 = !DILocation(line: 758, column: 7, scope: !801)
!804 = !DILocation(line: 760, column: 17, scope: !805)
!805 = distinct !DILexicalBlock(scope: !800, file: !61, line: 759, column: 4)
!806 = !DILocation(line: 760, column: 12, scope: !805)
!807 = !DILocation(line: 760, column: 5, scope: !805)
!808 = !DILocation(line: 764, column: 5, scope: !809)
!809 = distinct !DILexicalBlock(scope: !800, file: !61, line: 763, column: 4)
!810 = !DILocation(line: 769, column: 4, scope: !811)
!811 = distinct !DILexicalBlock(scope: !796, file: !61, line: 768, column: 3)
!812 = !DILocation(line: 772, column: 1, scope: !743)
!813 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !61, file: !61, line: 791, type: !814, scopeLine: 792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!814 = !DISubroutineType(types: !815)
!815 = !{!22, !12, !22, !22}
!816 = !DILocalVariable(name: "factor1", arg: 1, scope: !813, file: !61, line: 791, type: !12)
!817 = !DILocation(line: 791, column: 33, scope: !813)
!818 = !DILocalVariable(name: "factor2", arg: 2, scope: !813, file: !61, line: 791, type: !22)
!819 = !DILocation(line: 791, column: 46, scope: !813)
!820 = !DILocalVariable(name: "denominator", arg: 3, scope: !813, file: !61, line: 791, type: !22)
!821 = !DILocation(line: 791, column: 59, scope: !813)
!822 = !DILocalVariable(name: "s32Result", scope: !813, file: !61, line: 793, type: !69)
!823 = !DILocation(line: 793, column: 6, scope: !813)
!824 = !DILocalVariable(name: "s32Temp1", scope: !813, file: !61, line: 793, type: !69)
!825 = !DILocation(line: 793, column: 21, scope: !813)
!826 = !DILocation(line: 794, column: 14, scope: !813)
!827 = !DILocation(line: 794, column: 24, scope: !813)
!828 = !DILocation(line: 794, column: 22, scope: !813)
!829 = !DILocation(line: 794, column: 12, scope: !813)
!830 = !DILocation(line: 796, column: 5, scope: !831)
!831 = distinct !DILexicalBlock(scope: !813, file: !61, line: 796, column: 5)
!832 = !DILocation(line: 796, column: 17, scope: !831)
!833 = !DILocation(line: 796, column: 5, scope: !813)
!834 = !DILocation(line: 798, column: 6, scope: !835)
!835 = distinct !DILexicalBlock(scope: !836, file: !61, line: 798, column: 6)
!836 = distinct !DILexicalBlock(scope: !831, file: !61, line: 797, column: 2)
!837 = !DILocation(line: 798, column: 16, scope: !835)
!838 = !DILocation(line: 798, column: 6, scope: !836)
!839 = !DILocation(line: 800, column: 4, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !61, line: 799, column: 3)
!841 = !DILocation(line: 804, column: 4, scope: !842)
!842 = distinct !DILexicalBlock(scope: !835, file: !61, line: 803, column: 3)
!843 = !DILocation(line: 809, column: 15, scope: !844)
!844 = distinct !DILexicalBlock(scope: !831, file: !61, line: 808, column: 2)
!845 = !DILocation(line: 809, column: 29, scope: !844)
!846 = !DILocation(line: 809, column: 39, scope: !844)
!847 = !DILocation(line: 809, column: 38, scope: !844)
!848 = !DILocation(line: 809, column: 54, scope: !844)
!849 = !DILocation(line: 809, column: 52, scope: !844)
!850 = !DILocation(line: 809, column: 25, scope: !844)
!851 = !DILocation(line: 809, column: 68, scope: !844)
!852 = !DILocation(line: 809, column: 12, scope: !844)
!853 = !DILocation(line: 810, column: 16, scope: !844)
!854 = !DILocation(line: 810, column: 25, scope: !844)
!855 = !DILocation(line: 810, column: 24, scope: !844)
!856 = !DILocation(line: 810, column: 41, scope: !844)
!857 = !DILocation(line: 810, column: 51, scope: !844)
!858 = !DILocation(line: 810, column: 50, scope: !844)
!859 = !DILocation(line: 810, column: 38, scope: !844)
!860 = !DILocation(line: 810, column: 13, scope: !844)
!861 = !DILocation(line: 811, column: 6, scope: !862)
!862 = distinct !DILexicalBlock(scope: !844, file: !61, line: 811, column: 6)
!863 = !DILocation(line: 811, column: 16, scope: !862)
!864 = !DILocation(line: 811, column: 6, scope: !844)
!865 = !DILocation(line: 813, column: 7, scope: !866)
!866 = distinct !DILexicalBlock(scope: !867, file: !61, line: 813, column: 7)
!867 = distinct !DILexicalBlock(scope: !862, file: !61, line: 812, column: 3)
!868 = !DILocation(line: 813, column: 17, scope: !866)
!869 = !DILocation(line: 813, column: 7, scope: !867)
!870 = !DILocation(line: 815, column: 17, scope: !871)
!871 = distinct !DILexicalBlock(scope: !866, file: !61, line: 814, column: 4)
!872 = !DILocation(line: 815, column: 12, scope: !871)
!873 = !DILocation(line: 815, column: 5, scope: !871)
!874 = !DILocation(line: 819, column: 5, scope: !875)
!875 = distinct !DILexicalBlock(scope: !866, file: !61, line: 818, column: 4)
!876 = !DILocation(line: 824, column: 4, scope: !877)
!877 = distinct !DILexicalBlock(scope: !862, file: !61, line: 823, column: 3)
!878 = !DILocation(line: 828, column: 1, scope: !813)
!879 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !61, file: !61, line: 846, type: !880, scopeLine: 847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!880 = !DISubroutineType(types: !881)
!881 = !{!22, !22, !22, !22}
!882 = !DILocalVariable(name: "factor1", arg: 1, scope: !879, file: !61, line: 846, type: !22)
!883 = !DILocation(line: 846, column: 33, scope: !879)
!884 = !DILocalVariable(name: "factor2", arg: 2, scope: !879, file: !61, line: 846, type: !22)
!885 = !DILocation(line: 846, column: 46, scope: !879)
!886 = !DILocalVariable(name: "denominator", arg: 3, scope: !879, file: !61, line: 846, type: !22)
!887 = !DILocation(line: 846, column: 59, scope: !879)
!888 = !DILocalVariable(name: "u32Temp1", scope: !879, file: !61, line: 848, type: !421)
!889 = !DILocation(line: 848, column: 6, scope: !879)
!890 = !DILocalVariable(name: "u16TempDenom", scope: !879, file: !61, line: 849, type: !22)
!891 = !DILocation(line: 849, column: 6, scope: !879)
!892 = !DILocation(line: 851, column: 5, scope: !893)
!893 = distinct !DILexicalBlock(scope: !879, file: !61, line: 851, column: 5)
!894 = !DILocation(line: 851, column: 17, scope: !893)
!895 = !DILocation(line: 851, column: 5, scope: !879)
!896 = !DILocation(line: 853, column: 3, scope: !897)
!897 = distinct !DILexicalBlock(scope: !893, file: !61, line: 852, column: 2)
!898 = !DILocation(line: 857, column: 14, scope: !899)
!899 = distinct !DILexicalBlock(scope: !893, file: !61, line: 856, column: 2)
!900 = !DILocation(line: 857, column: 24, scope: !899)
!901 = !DILocation(line: 857, column: 22, scope: !899)
!902 = !DILocation(line: 857, column: 12, scope: !899)
!903 = !DILocation(line: 858, column: 18, scope: !899)
!904 = !DILocation(line: 858, column: 30, scope: !899)
!905 = !DILocation(line: 858, column: 16, scope: !899)
!906 = !DILocation(line: 859, column: 14, scope: !899)
!907 = !DILocation(line: 859, column: 25, scope: !899)
!908 = !DILocation(line: 859, column: 23, scope: !899)
!909 = !DILocation(line: 859, column: 12, scope: !899)
!910 = !DILocation(line: 860, column: 14, scope: !899)
!911 = !DILocation(line: 860, column: 25, scope: !899)
!912 = !DILocation(line: 860, column: 23, scope: !899)
!913 = !DILocation(line: 860, column: 12, scope: !899)
!914 = !DILocation(line: 861, column: 6, scope: !915)
!915 = distinct !DILexicalBlock(scope: !899, file: !61, line: 861, column: 6)
!916 = !DILocation(line: 861, column: 15, scope: !915)
!917 = !DILocation(line: 861, column: 6, scope: !899)
!918 = !DILocation(line: 863, column: 12, scope: !919)
!919 = distinct !DILexicalBlock(scope: !915, file: !61, line: 862, column: 3)
!920 = !DILocation(line: 863, column: 21, scope: !919)
!921 = !DILocation(line: 863, column: 11, scope: !919)
!922 = !DILocation(line: 863, column: 4, scope: !919)
!923 = !DILocation(line: 868, column: 4, scope: !924)
!924 = distinct !DILexicalBlock(scope: !915, file: !61, line: 867, column: 3)
!925 = !DILocation(line: 873, column: 1, scope: !879)
!926 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !61, file: !61, line: 890, type: !927, scopeLine: 891, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!927 = !DISubroutineType(types: !928)
!928 = !{!22, !22, !22, !421}
!929 = !DILocalVariable(name: "factor1", arg: 1, scope: !926, file: !61, line: 890, type: !22)
!930 = !DILocation(line: 890, column: 33, scope: !926)
!931 = !DILocalVariable(name: "factor2", arg: 2, scope: !926, file: !61, line: 890, type: !22)
!932 = !DILocation(line: 890, column: 46, scope: !926)
!933 = !DILocalVariable(name: "denominator", arg: 3, scope: !926, file: !61, line: 890, type: !421)
!934 = !DILocation(line: 890, column: 59, scope: !926)
!935 = !DILocalVariable(name: "u32Temp1", scope: !926, file: !61, line: 892, type: !421)
!936 = !DILocation(line: 892, column: 6, scope: !926)
!937 = !DILocation(line: 893, column: 5, scope: !938)
!938 = distinct !DILexicalBlock(scope: !926, file: !61, line: 893, column: 5)
!939 = !DILocation(line: 893, column: 17, scope: !938)
!940 = !DILocation(line: 893, column: 5, scope: !926)
!941 = !DILocation(line: 895, column: 3, scope: !942)
!942 = distinct !DILexicalBlock(scope: !938, file: !61, line: 894, column: 2)
!943 = !DILocation(line: 899, column: 15, scope: !944)
!944 = distinct !DILexicalBlock(scope: !938, file: !61, line: 898, column: 2)
!945 = !DILocation(line: 899, column: 25, scope: !944)
!946 = !DILocation(line: 899, column: 23, scope: !944)
!947 = !DILocation(line: 899, column: 36, scope: !944)
!948 = !DILocation(line: 899, column: 34, scope: !944)
!949 = !DILocation(line: 899, column: 12, scope: !944)
!950 = !DILocation(line: 900, column: 8, scope: !951)
!951 = distinct !DILexicalBlock(scope: !944, file: !61, line: 900, column: 6)
!952 = !DILocation(line: 900, column: 18, scope: !951)
!953 = !DILocation(line: 900, column: 16, scope: !951)
!954 = !DILocation(line: 900, column: 28, scope: !951)
!955 = !DILocation(line: 900, column: 40, scope: !951)
!956 = !DILocation(line: 900, column: 39, scope: !951)
!957 = !DILocation(line: 900, column: 26, scope: !951)
!958 = !DILocation(line: 900, column: 53, scope: !951)
!959 = !DILocation(line: 900, column: 64, scope: !951)
!960 = !DILocation(line: 900, column: 50, scope: !951)
!961 = !DILocation(line: 900, column: 6, scope: !944)
!962 = !DILocation(line: 902, column: 12, scope: !963)
!963 = distinct !DILexicalBlock(scope: !951, file: !61, line: 901, column: 3)
!964 = !DILocation(line: 903, column: 3, scope: !963)
!965 = !DILocation(line: 904, column: 6, scope: !966)
!966 = distinct !DILexicalBlock(scope: !944, file: !61, line: 904, column: 6)
!967 = !DILocation(line: 904, column: 15, scope: !966)
!968 = !DILocation(line: 904, column: 6, scope: !944)
!969 = !DILocation(line: 906, column: 12, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !61, line: 905, column: 3)
!971 = !DILocation(line: 906, column: 21, scope: !970)
!972 = !DILocation(line: 906, column: 11, scope: !970)
!973 = !DILocation(line: 906, column: 4, scope: !970)
!974 = !DILocation(line: 910, column: 4, scope: !975)
!975 = distinct !DILexicalBlock(scope: !966, file: !61, line: 909, column: 3)
!976 = !DILocation(line: 913, column: 1, scope: !926)
!977 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !61, file: !61, line: 930, type: !978, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!978 = !DISubroutineType(types: !979)
!979 = !{!421, !421, !22}
!980 = !DILocalVariable(name: "x_value", arg: 1, scope: !977, file: !61, line: 930, type: !421)
!981 = !DILocation(line: 930, column: 25, scope: !977)
!982 = !DILocalVariable(name: "y_value", arg: 2, scope: !977, file: !61, line: 930, type: !22)
!983 = !DILocation(line: 930, column: 38, scope: !977)
!984 = !DILocalVariable(name: "u32Temp1", scope: !977, file: !61, line: 932, type: !421)
!985 = !DILocation(line: 932, column: 6, scope: !977)
!986 = !DILocation(line: 933, column: 5, scope: !987)
!987 = distinct !DILexicalBlock(scope: !977, file: !61, line: 933, column: 5)
!988 = !DILocation(line: 933, column: 13, scope: !987)
!989 = !DILocation(line: 933, column: 5, scope: !977)
!990 = !DILocation(line: 935, column: 3, scope: !991)
!991 = distinct !DILexicalBlock(scope: !987, file: !61, line: 934, column: 2)
!992 = !DILocation(line: 939, column: 15, scope: !993)
!993 = distinct !DILexicalBlock(scope: !987, file: !61, line: 938, column: 2)
!994 = !DILocation(line: 939, column: 26, scope: !993)
!995 = !DILocation(line: 939, column: 34, scope: !993)
!996 = !DILocation(line: 939, column: 33, scope: !993)
!997 = !DILocation(line: 939, column: 45, scope: !993)
!998 = !DILocation(line: 939, column: 43, scope: !993)
!999 = !DILocation(line: 939, column: 23, scope: !993)
!1000 = !DILocation(line: 939, column: 54, scope: !993)
!1001 = !DILocation(line: 939, column: 12, scope: !993)
!1002 = !DILocation(line: 940, column: 15, scope: !993)
!1003 = !DILocation(line: 940, column: 23, scope: !993)
!1004 = !DILocation(line: 940, column: 22, scope: !993)
!1005 = !DILocation(line: 940, column: 35, scope: !993)
!1006 = !DILocation(line: 940, column: 44, scope: !993)
!1007 = !DILocation(line: 940, column: 43, scope: !993)
!1008 = !DILocation(line: 940, column: 32, scope: !993)
!1009 = !DILocation(line: 940, column: 12, scope: !993)
!1010 = !DILocation(line: 941, column: 10, scope: !993)
!1011 = !DILocation(line: 941, column: 3, scope: !993)
!1012 = !DILocation(line: 943, column: 1, scope: !977)
!1013 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !61, file: !61, line: 961, type: !1014, scopeLine: 962, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{!12, !12, !12, !12}
!1016 = !DILocalVariable(name: "fak1", arg: 1, scope: !1013, file: !61, line: 961, type: !12)
!1017 = !DILocation(line: 961, column: 33, scope: !1013)
!1018 = !DILocalVariable(name: "fak2", arg: 2, scope: !1013, file: !61, line: 961, type: !12)
!1019 = !DILocation(line: 961, column: 43, scope: !1013)
!1020 = !DILocalVariable(name: "div", arg: 3, scope: !1013, file: !61, line: 961, type: !12)
!1021 = !DILocation(line: 961, column: 53, scope: !1013)
!1022 = !DILocalVariable(name: "s32Temp1", scope: !1013, file: !61, line: 963, type: !69)
!1023 = !DILocation(line: 963, column: 6, scope: !1013)
!1024 = !DILocalVariable(name: "s32Temp2", scope: !1013, file: !61, line: 963, type: !69)
!1025 = !DILocation(line: 963, column: 20, scope: !1013)
!1026 = !DILocalVariable(name: "s32Temp3", scope: !1013, file: !61, line: 963, type: !69)
!1027 = !DILocation(line: 963, column: 34, scope: !1013)
!1028 = !DILocation(line: 964, column: 13, scope: !1013)
!1029 = !DILocation(line: 964, column: 20, scope: !1013)
!1030 = !DILocation(line: 964, column: 18, scope: !1013)
!1031 = !DILocation(line: 964, column: 11, scope: !1013)
!1032 = !DILocation(line: 965, column: 5, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1013, file: !61, line: 965, column: 5)
!1034 = !DILocation(line: 965, column: 9, scope: !1033)
!1035 = !DILocation(line: 965, column: 5, scope: !1013)
!1036 = !DILocation(line: 967, column: 6, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1038, file: !61, line: 967, column: 6)
!1038 = distinct !DILexicalBlock(scope: !1033, file: !61, line: 966, column: 2)
!1039 = !DILocation(line: 967, column: 15, scope: !1037)
!1040 = !DILocation(line: 967, column: 6, scope: !1038)
!1041 = !DILocation(line: 969, column: 4, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1037, file: !61, line: 968, column: 3)
!1043 = !DILocation(line: 973, column: 4, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1037, file: !61, line: 972, column: 3)
!1045 = !DILocation(line: 978, column: 15, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1033, file: !61, line: 977, column: 2)
!1047 = !DILocation(line: 978, column: 28, scope: !1046)
!1048 = !DILocation(line: 978, column: 39, scope: !1046)
!1049 = !DILocation(line: 978, column: 37, scope: !1046)
!1050 = !DILocation(line: 978, column: 46, scope: !1046)
!1051 = !DILocation(line: 978, column: 44, scope: !1046)
!1052 = !DILocation(line: 978, column: 24, scope: !1046)
!1053 = !DILocation(line: 978, column: 52, scope: !1046)
!1054 = !DILocation(line: 978, column: 12, scope: !1046)
!1055 = !DILocation(line: 979, column: 15, scope: !1046)
!1056 = !DILocation(line: 979, column: 24, scope: !1046)
!1057 = !DILocation(line: 979, column: 23, scope: !1046)
!1058 = !DILocation(line: 979, column: 32, scope: !1046)
!1059 = !DILocation(line: 979, column: 41, scope: !1046)
!1060 = !DILocation(line: 979, column: 40, scope: !1046)
!1061 = !DILocation(line: 979, column: 29, scope: !1046)
!1062 = !DILocation(line: 979, column: 12, scope: !1046)
!1063 = !DILocation(line: 980, column: 6, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1046, file: !61, line: 980, column: 6)
!1065 = !DILocation(line: 980, column: 15, scope: !1064)
!1066 = !DILocation(line: 980, column: 6, scope: !1046)
!1067 = !DILocation(line: 982, column: 7, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1069, file: !61, line: 982, column: 7)
!1069 = distinct !DILexicalBlock(scope: !1064, file: !61, line: 981, column: 3)
!1070 = !DILocation(line: 982, column: 16, scope: !1068)
!1071 = !DILocation(line: 982, column: 7, scope: !1069)
!1072 = !DILocation(line: 984, column: 17, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1068, file: !61, line: 983, column: 4)
!1074 = !DILocation(line: 984, column: 12, scope: !1073)
!1075 = !DILocation(line: 984, column: 5, scope: !1073)
!1076 = !DILocation(line: 988, column: 5, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1068, file: !61, line: 987, column: 4)
!1078 = !DILocation(line: 993, column: 4, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1064, file: !61, line: 992, column: 3)
!1080 = !DILocation(line: 996, column: 1, scope: !1013)
!1081 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !61, file: !61, line: 1014, type: !1082, scopeLine: 1015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{!12, !12, !12, !22}
!1084 = !DILocalVariable(name: "data1", arg: 1, scope: !1081, file: !61, line: 1014, type: !12)
!1085 = !DILocation(line: 1014, column: 33, scope: !1081)
!1086 = !DILocalVariable(name: "data2", arg: 2, scope: !1081, file: !61, line: 1014, type: !12)
!1087 = !DILocation(line: 1014, column: 43, scope: !1081)
!1088 = !DILocalVariable(name: "denominator", arg: 3, scope: !1081, file: !61, line: 1014, type: !22)
!1089 = !DILocation(line: 1014, column: 53, scope: !1081)
!1090 = !DILocalVariable(name: "s32Result", scope: !1081, file: !61, line: 1016, type: !69)
!1091 = !DILocation(line: 1016, column: 6, scope: !1081)
!1092 = !DILocalVariable(name: "s32Temp1", scope: !1081, file: !61, line: 1016, type: !69)
!1093 = !DILocation(line: 1016, column: 21, scope: !1081)
!1094 = !DILocation(line: 1017, column: 14, scope: !1081)
!1095 = !DILocation(line: 1017, column: 22, scope: !1081)
!1096 = !DILocation(line: 1017, column: 20, scope: !1081)
!1097 = !DILocation(line: 1017, column: 12, scope: !1081)
!1098 = !DILocation(line: 1019, column: 5, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1081, file: !61, line: 1019, column: 5)
!1100 = !DILocation(line: 1019, column: 17, scope: !1099)
!1101 = !DILocation(line: 1019, column: 5, scope: !1081)
!1102 = !DILocation(line: 1021, column: 6, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1104, file: !61, line: 1021, column: 6)
!1104 = distinct !DILexicalBlock(scope: !1099, file: !61, line: 1020, column: 2)
!1105 = !DILocation(line: 1021, column: 16, scope: !1103)
!1106 = !DILocation(line: 1021, column: 6, scope: !1104)
!1107 = !DILocation(line: 1023, column: 4, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1103, file: !61, line: 1022, column: 3)
!1109 = !DILocation(line: 1025, column: 11, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1103, file: !61, line: 1025, column: 11)
!1111 = !DILocation(line: 1025, column: 21, scope: !1110)
!1112 = !DILocation(line: 1025, column: 11, scope: !1103)
!1113 = !DILocation(line: 1027, column: 4, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1110, file: !61, line: 1026, column: 3)
!1115 = !DILocation(line: 1031, column: 4, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1110, file: !61, line: 1030, column: 3)
!1117 = !DILocation(line: 1036, column: 15, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1099, file: !61, line: 1035, column: 2)
!1119 = !DILocation(line: 1036, column: 28, scope: !1118)
!1120 = !DILocation(line: 1036, column: 38, scope: !1118)
!1121 = !DILocation(line: 1036, column: 37, scope: !1118)
!1122 = !DILocation(line: 1036, column: 51, scope: !1118)
!1123 = !DILocation(line: 1036, column: 50, scope: !1118)
!1124 = !DILocation(line: 1036, column: 25, scope: !1118)
!1125 = !DILocation(line: 1036, column: 64, scope: !1118)
!1126 = !DILocation(line: 1036, column: 12, scope: !1118)
!1127 = !DILocation(line: 1037, column: 16, scope: !1118)
!1128 = !DILocation(line: 1037, column: 25, scope: !1118)
!1129 = !DILocation(line: 1037, column: 24, scope: !1118)
!1130 = !DILocation(line: 1037, column: 41, scope: !1118)
!1131 = !DILocation(line: 1037, column: 51, scope: !1118)
!1132 = !DILocation(line: 1037, column: 50, scope: !1118)
!1133 = !DILocation(line: 1037, column: 38, scope: !1118)
!1134 = !DILocation(line: 1037, column: 13, scope: !1118)
!1135 = !DILocation(line: 1038, column: 6, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1118, file: !61, line: 1038, column: 6)
!1137 = !DILocation(line: 1038, column: 16, scope: !1136)
!1138 = !DILocation(line: 1038, column: 6, scope: !1118)
!1139 = !DILocation(line: 1040, column: 7, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1141, file: !61, line: 1040, column: 7)
!1141 = distinct !DILexicalBlock(scope: !1136, file: !61, line: 1039, column: 3)
!1142 = !DILocation(line: 1040, column: 17, scope: !1140)
!1143 = !DILocation(line: 1040, column: 7, scope: !1141)
!1144 = !DILocation(line: 1042, column: 17, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1140, file: !61, line: 1041, column: 4)
!1146 = !DILocation(line: 1042, column: 12, scope: !1145)
!1147 = !DILocation(line: 1042, column: 5, scope: !1145)
!1148 = !DILocation(line: 1046, column: 5, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1140, file: !61, line: 1045, column: 4)
!1150 = !DILocation(line: 1051, column: 4, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1136, file: !61, line: 1050, column: 3)
!1152 = !DILocation(line: 1055, column: 1, scope: !1081)
!1153 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !61, file: !61, line: 1072, type: !1154, scopeLine: 1073, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!421, !421, !69}
!1156 = !DILocalVariable(name: "numerator", arg: 1, scope: !1153, file: !61, line: 1072, type: !421)
!1157 = !DILocation(line: 1072, column: 25, scope: !1153)
!1158 = !DILocalVariable(name: "denominator", arg: 2, scope: !1153, file: !61, line: 1072, type: !69)
!1159 = !DILocation(line: 1072, column: 40, scope: !1153)
!1160 = !DILocalVariable(name: "u32Temp1", scope: !1153, file: !61, line: 1074, type: !421)
!1161 = !DILocation(line: 1074, column: 6, scope: !1153)
!1162 = !DILocation(line: 1075, column: 5, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1153, file: !61, line: 1075, column: 5)
!1164 = !DILocation(line: 1075, column: 17, scope: !1163)
!1165 = !DILocation(line: 1075, column: 5, scope: !1153)
!1166 = !DILocation(line: 1077, column: 3, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1163, file: !61, line: 1076, column: 2)
!1168 = !DILocation(line: 1081, column: 6, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1170, file: !61, line: 1081, column: 6)
!1170 = distinct !DILexicalBlock(scope: !1163, file: !61, line: 1080, column: 2)
!1171 = !DILocation(line: 1081, column: 18, scope: !1169)
!1172 = !DILocation(line: 1081, column: 6, scope: !1170)
!1173 = !DILocation(line: 1083, column: 4, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1169, file: !61, line: 1082, column: 3)
!1175 = !DILocation(line: 1087, column: 16, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1169, file: !61, line: 1086, column: 3)
!1177 = !DILocation(line: 1087, column: 30, scope: !1176)
!1178 = !DILocation(line: 1087, column: 40, scope: !1176)
!1179 = !DILocation(line: 1087, column: 39, scope: !1176)
!1180 = !DILocation(line: 1087, column: 55, scope: !1176)
!1181 = !DILocation(line: 1087, column: 53, scope: !1176)
!1182 = !DILocation(line: 1087, column: 26, scope: !1176)
!1183 = !DILocation(line: 1087, column: 68, scope: !1176)
!1184 = !DILocation(line: 1087, column: 13, scope: !1176)
!1185 = !DILocation(line: 1088, column: 16, scope: !1176)
!1186 = !DILocation(line: 1088, column: 25, scope: !1176)
!1187 = !DILocation(line: 1088, column: 24, scope: !1176)
!1188 = !DILocation(line: 1088, column: 41, scope: !1176)
!1189 = !DILocation(line: 1088, column: 51, scope: !1176)
!1190 = !DILocation(line: 1088, column: 50, scope: !1176)
!1191 = !DILocation(line: 1088, column: 38, scope: !1176)
!1192 = !DILocation(line: 1088, column: 13, scope: !1176)
!1193 = !DILocation(line: 1089, column: 11, scope: !1176)
!1194 = !DILocation(line: 1089, column: 4, scope: !1176)
!1195 = !DILocation(line: 1092, column: 1, scope: !1153)
!1196 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !61, file: !61, line: 1109, type: !1197, scopeLine: 1110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1197 = !DISubroutineType(types: !1198)
!1198 = !{!421, !69, !421}
!1199 = !DILocalVariable(name: "numerator", arg: 1, scope: !1196, file: !61, line: 1109, type: !69)
!1200 = !DILocation(line: 1109, column: 25, scope: !1196)
!1201 = !DILocalVariable(name: "denominator", arg: 2, scope: !1196, file: !61, line: 1109, type: !421)
!1202 = !DILocation(line: 1109, column: 40, scope: !1196)
!1203 = !DILocalVariable(name: "s32Temp1", scope: !1196, file: !61, line: 1111, type: !69)
!1204 = !DILocation(line: 1111, column: 6, scope: !1196)
!1205 = !DILocation(line: 1112, column: 5, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1196, file: !61, line: 1112, column: 5)
!1207 = !DILocation(line: 1112, column: 17, scope: !1206)
!1208 = !DILocation(line: 1112, column: 5, scope: !1196)
!1209 = !DILocation(line: 1114, column: 6, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1211, file: !61, line: 1114, column: 6)
!1211 = distinct !DILexicalBlock(scope: !1206, file: !61, line: 1113, column: 2)
!1212 = !DILocation(line: 1114, column: 16, scope: !1210)
!1213 = !DILocation(line: 1114, column: 6, scope: !1211)
!1214 = !DILocation(line: 1116, column: 4, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1210, file: !61, line: 1115, column: 3)
!1216 = !DILocation(line: 1120, column: 4, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1210, file: !61, line: 1119, column: 3)
!1218 = !DILocation(line: 1125, column: 6, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1220, file: !61, line: 1125, column: 6)
!1220 = distinct !DILexicalBlock(scope: !1206, file: !61, line: 1124, column: 2)
!1221 = !DILocation(line: 1125, column: 16, scope: !1219)
!1222 = !DILocation(line: 1125, column: 6, scope: !1220)
!1223 = !DILocation(line: 1127, column: 17, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1219, file: !61, line: 1126, column: 3)
!1225 = !DILocation(line: 1127, column: 31, scope: !1224)
!1226 = !DILocation(line: 1127, column: 41, scope: !1224)
!1227 = !DILocation(line: 1127, column: 40, scope: !1224)
!1228 = !DILocation(line: 1127, column: 56, scope: !1224)
!1229 = !DILocation(line: 1127, column: 54, scope: !1224)
!1230 = !DILocation(line: 1127, column: 27, scope: !1224)
!1231 = !DILocation(line: 1127, column: 69, scope: !1224)
!1232 = !DILocation(line: 1127, column: 13, scope: !1224)
!1233 = !DILocation(line: 1128, column: 13, scope: !1224)
!1234 = !DILocation(line: 1128, column: 23, scope: !1224)
!1235 = !DILocation(line: 1128, column: 22, scope: !1224)
!1236 = !DILocation(line: 1128, column: 39, scope: !1224)
!1237 = !DILocation(line: 1128, column: 48, scope: !1224)
!1238 = !DILocation(line: 1128, column: 47, scope: !1224)
!1239 = !DILocation(line: 1128, column: 36, scope: !1224)
!1240 = !DILocation(line: 1128, column: 4, scope: !1224)
!1241 = !DILocation(line: 1132, column: 4, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1219, file: !61, line: 1131, column: 3)
!1243 = !DILocation(line: 1135, column: 1, scope: !1196)
!1244 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !61, file: !61, line: 1152, type: !1245, scopeLine: 1153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!421, !69, !69}
!1247 = !DILocalVariable(name: "numerator", arg: 1, scope: !1244, file: !61, line: 1152, type: !69)
!1248 = !DILocation(line: 1152, column: 25, scope: !1244)
!1249 = !DILocalVariable(name: "denominator", arg: 2, scope: !1244, file: !61, line: 1152, type: !69)
!1250 = !DILocation(line: 1152, column: 40, scope: !1244)
!1251 = !DILocalVariable(name: "u32Temp1", scope: !1244, file: !61, line: 1154, type: !421)
!1252 = !DILocation(line: 1154, column: 6, scope: !1244)
!1253 = !DILocalVariable(name: "u32Temp2", scope: !1244, file: !61, line: 1154, type: !421)
!1254 = !DILocation(line: 1154, column: 20, scope: !1244)
!1255 = !DILocation(line: 1155, column: 5, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1244, file: !61, line: 1155, column: 5)
!1257 = !DILocation(line: 1155, column: 17, scope: !1256)
!1258 = !DILocation(line: 1155, column: 5, scope: !1244)
!1259 = !DILocation(line: 1157, column: 6, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1261, file: !61, line: 1157, column: 6)
!1261 = distinct !DILexicalBlock(scope: !1256, file: !61, line: 1156, column: 2)
!1262 = !DILocation(line: 1157, column: 16, scope: !1260)
!1263 = !DILocation(line: 1157, column: 6, scope: !1261)
!1264 = !DILocation(line: 1159, column: 4, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1260, file: !61, line: 1158, column: 3)
!1266 = !DILocation(line: 1163, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1260, file: !61, line: 1162, column: 3)
!1268 = !DILocation(line: 1168, column: 6, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1270, file: !61, line: 1168, column: 6)
!1270 = distinct !DILexicalBlock(scope: !1256, file: !61, line: 1167, column: 2)
!1271 = !DILocation(line: 1168, column: 16, scope: !1269)
!1272 = !DILocation(line: 1168, column: 6, scope: !1270)
!1273 = !DILocation(line: 1170, column: 7, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1275, file: !61, line: 1170, column: 7)
!1275 = distinct !DILexicalBlock(scope: !1269, file: !61, line: 1169, column: 3)
!1276 = !DILocation(line: 1170, column: 17, scope: !1274)
!1277 = !DILocation(line: 1170, column: 7, scope: !1275)
!1278 = !DILocation(line: 1172, column: 5, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1274, file: !61, line: 1171, column: 4)
!1280 = !DILocation(line: 1176, column: 8, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1282, file: !61, line: 1176, column: 8)
!1282 = distinct !DILexicalBlock(scope: !1274, file: !61, line: 1175, column: 4)
!1283 = !DILocation(line: 1176, column: 20, scope: !1281)
!1284 = !DILocation(line: 1176, column: 8, scope: !1282)
!1285 = !DILocation(line: 1178, column: 6, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1281, file: !61, line: 1177, column: 5)
!1287 = !DILocation(line: 1182, column: 18, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1281, file: !61, line: 1181, column: 5)
!1289 = !DILocation(line: 1182, column: 32, scope: !1288)
!1290 = !DILocation(line: 1182, column: 42, scope: !1288)
!1291 = !DILocation(line: 1182, column: 41, scope: !1288)
!1292 = !DILocation(line: 1182, column: 57, scope: !1288)
!1293 = !DILocation(line: 1182, column: 55, scope: !1288)
!1294 = !DILocation(line: 1182, column: 28, scope: !1288)
!1295 = !DILocation(line: 1182, column: 71, scope: !1288)
!1296 = !DILocation(line: 1182, column: 15, scope: !1288)
!1297 = !DILocation(line: 1183, column: 18, scope: !1288)
!1298 = !DILocation(line: 1183, column: 29, scope: !1288)
!1299 = !DILocation(line: 1183, column: 27, scope: !1288)
!1300 = !DILocation(line: 1183, column: 45, scope: !1288)
!1301 = !DILocation(line: 1183, column: 57, scope: !1288)
!1302 = !DILocation(line: 1183, column: 55, scope: !1288)
!1303 = !DILocation(line: 1183, column: 42, scope: !1288)
!1304 = !DILocation(line: 1183, column: 15, scope: !1288)
!1305 = !DILocation(line: 1184, column: 13, scope: !1288)
!1306 = !DILocation(line: 1184, column: 6, scope: !1288)
!1307 = !DILocation(line: 1190, column: 7, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1309, file: !61, line: 1190, column: 7)
!1309 = distinct !DILexicalBlock(scope: !1269, file: !61, line: 1189, column: 3)
!1310 = !DILocation(line: 1190, column: 19, scope: !1308)
!1311 = !DILocation(line: 1190, column: 7, scope: !1309)
!1312 = !DILocation(line: 1192, column: 5, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !61, line: 1191, column: 4)
!1314 = !DILocation(line: 1196, column: 18, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1308, file: !61, line: 1195, column: 4)
!1316 = !DILocation(line: 1196, column: 17, scope: !1315)
!1317 = !DILocation(line: 1196, column: 15, scope: !1315)
!1318 = !DILocation(line: 1197, column: 20, scope: !1315)
!1319 = !DILocation(line: 1197, column: 19, scope: !1315)
!1320 = !DILocation(line: 1197, column: 17, scope: !1315)
!1321 = !DILocation(line: 1198, column: 17, scope: !1315)
!1322 = !DILocation(line: 1198, column: 31, scope: !1315)
!1323 = !DILocation(line: 1198, column: 41, scope: !1315)
!1324 = !DILocation(line: 1198, column: 40, scope: !1315)
!1325 = !DILocation(line: 1198, column: 56, scope: !1315)
!1326 = !DILocation(line: 1198, column: 54, scope: !1315)
!1327 = !DILocation(line: 1198, column: 27, scope: !1315)
!1328 = !DILocation(line: 1198, column: 70, scope: !1315)
!1329 = !DILocation(line: 1198, column: 14, scope: !1315)
!1330 = !DILocation(line: 1199, column: 17, scope: !1315)
!1331 = !DILocation(line: 1199, column: 28, scope: !1315)
!1332 = !DILocation(line: 1199, column: 26, scope: !1315)
!1333 = !DILocation(line: 1199, column: 44, scope: !1315)
!1334 = !DILocation(line: 1199, column: 56, scope: !1315)
!1335 = !DILocation(line: 1199, column: 54, scope: !1315)
!1336 = !DILocation(line: 1199, column: 41, scope: !1315)
!1337 = !DILocation(line: 1199, column: 14, scope: !1315)
!1338 = !DILocation(line: 1200, column: 12, scope: !1315)
!1339 = !DILocation(line: 1200, column: 5, scope: !1315)
!1340 = !DILocation(line: 1205, column: 1, scope: !1244)
!1341 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !61, file: !61, line: 1222, type: !1342, scopeLine: 1223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1342 = !DISubroutineType(types: !1343)
!1343 = !{!421, !421, !421}
!1344 = !DILocalVariable(name: "numerator", arg: 1, scope: !1341, file: !61, line: 1222, type: !421)
!1345 = !DILocation(line: 1222, column: 25, scope: !1341)
!1346 = !DILocalVariable(name: "denominator", arg: 2, scope: !1341, file: !61, line: 1222, type: !421)
!1347 = !DILocation(line: 1222, column: 40, scope: !1341)
!1348 = !DILocalVariable(name: "u32Temp1", scope: !1341, file: !61, line: 1225, type: !421)
!1349 = !DILocation(line: 1225, column: 6, scope: !1341)
!1350 = !DILocalVariable(name: "u32Temp2", scope: !1341, file: !61, line: 1225, type: !421)
!1351 = !DILocation(line: 1225, column: 20, scope: !1341)
!1352 = !DILocalVariable(name: "u32Temp3", scope: !1341, file: !61, line: 1225, type: !421)
!1353 = !DILocation(line: 1225, column: 34, scope: !1341)
!1354 = !DILocalVariable(name: "numerator_old", scope: !1341, file: !61, line: 1225, type: !421)
!1355 = !DILocation(line: 1225, column: 48, scope: !1341)
!1356 = !DILocation(line: 1226, column: 5, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1341, file: !61, line: 1226, column: 5)
!1358 = !DILocation(line: 1226, column: 16, scope: !1357)
!1359 = !DILocation(line: 1226, column: 5, scope: !1341)
!1360 = !DILocation(line: 1228, column: 3, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1357, file: !61, line: 1227, column: 2)
!1362 = !DILocation(line: 1232, column: 14, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1357, file: !61, line: 1231, column: 2)
!1364 = !DILocation(line: 1232, column: 26, scope: !1363)
!1365 = !DILocation(line: 1232, column: 41, scope: !1363)
!1366 = !DILocation(line: 1232, column: 51, scope: !1363)
!1367 = !DILocation(line: 1232, column: 50, scope: !1363)
!1368 = !DILocation(line: 1232, column: 38, scope: !1363)
!1369 = !DILocation(line: 1232, column: 24, scope: !1363)
!1370 = !DILocation(line: 1232, column: 12, scope: !1363)
!1371 = !DILocation(line: 1233, column: 7, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1363, file: !61, line: 1233, column: 6)
!1373 = !DILocation(line: 1233, column: 16, scope: !1372)
!1374 = !DILocation(line: 1233, column: 24, scope: !1372)
!1375 = !DILocation(line: 1233, column: 6, scope: !1363)
!1376 = !DILocation(line: 1235, column: 16, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1372, file: !61, line: 1234, column: 3)
!1378 = !DILocation(line: 1235, column: 27, scope: !1377)
!1379 = !DILocation(line: 1235, column: 13, scope: !1377)
!1380 = !DILocation(line: 1236, column: 3, scope: !1377)
!1381 = !DILocation(line: 1239, column: 16, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1372, file: !61, line: 1238, column: 3)
!1383 = !DILocation(line: 1239, column: 27, scope: !1382)
!1384 = !DILocation(line: 1239, column: 32, scope: !1382)
!1385 = !DILocation(line: 1239, column: 13, scope: !1382)
!1386 = !DILocation(line: 1242, column: 6, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1363, file: !61, line: 1242, column: 6)
!1388 = !DILocation(line: 1242, column: 17, scope: !1387)
!1389 = !DILocation(line: 1242, column: 15, scope: !1387)
!1390 = !DILocation(line: 1242, column: 6, scope: !1363)
!1391 = !DILocation(line: 1244, column: 12, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1387, file: !61, line: 1243, column: 3)
!1393 = !DILocation(line: 1244, column: 22, scope: !1392)
!1394 = !DILocation(line: 1244, column: 21, scope: !1392)
!1395 = !DILocation(line: 1244, column: 4, scope: !1392)
!1396 = !DILocation(line: 1248, column: 13, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1387, file: !61, line: 1247, column: 3)
!1398 = !DILocation(line: 1248, column: 23, scope: !1397)
!1399 = !DILocation(line: 1248, column: 22, scope: !1397)
!1400 = !DILocation(line: 1248, column: 36, scope: !1397)
!1401 = !DILocation(line: 1248, column: 4, scope: !1397)
!1402 = !DILocation(line: 1253, column: 1, scope: !1341)
!1403 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !61, file: !61, line: 1270, type: !1404, scopeLine: 1271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!69, !421, !69}
!1406 = !DILocalVariable(name: "numerator", arg: 1, scope: !1403, file: !61, line: 1270, type: !421)
!1407 = !DILocation(line: 1270, column: 25, scope: !1403)
!1408 = !DILocalVariable(name: "denominator", arg: 2, scope: !1403, file: !61, line: 1270, type: !69)
!1409 = !DILocation(line: 1270, column: 40, scope: !1403)
!1410 = !DILocalVariable(name: "u32Temp1", scope: !1403, file: !61, line: 1272, type: !421)
!1411 = !DILocation(line: 1272, column: 6, scope: !1403)
!1412 = !DILocalVariable(name: "u32Temp2", scope: !1403, file: !61, line: 1272, type: !421)
!1413 = !DILocation(line: 1272, column: 20, scope: !1403)
!1414 = !DILocation(line: 1273, column: 5, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1403, file: !61, line: 1273, column: 5)
!1416 = !DILocation(line: 1273, column: 17, scope: !1415)
!1417 = !DILocation(line: 1273, column: 5, scope: !1403)
!1418 = !DILocation(line: 1275, column: 6, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1420, file: !61, line: 1275, column: 6)
!1420 = distinct !DILexicalBlock(scope: !1415, file: !61, line: 1274, column: 2)
!1421 = !DILocation(line: 1275, column: 18, scope: !1419)
!1422 = !DILocation(line: 1275, column: 6, scope: !1420)
!1423 = !DILocation(line: 1277, column: 4, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1419, file: !61, line: 1276, column: 3)
!1425 = !DILocation(line: 1281, column: 19, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1419, file: !61, line: 1280, column: 3)
!1427 = !DILocation(line: 1281, column: 18, scope: !1426)
!1428 = !DILocation(line: 1281, column: 16, scope: !1426)
!1429 = !DILocation(line: 1282, column: 16, scope: !1426)
!1430 = !DILocation(line: 1282, column: 30, scope: !1426)
!1431 = !DILocation(line: 1282, column: 40, scope: !1426)
!1432 = !DILocation(line: 1282, column: 39, scope: !1426)
!1433 = !DILocation(line: 1282, column: 55, scope: !1426)
!1434 = !DILocation(line: 1282, column: 53, scope: !1426)
!1435 = !DILocation(line: 1282, column: 26, scope: !1426)
!1436 = !DILocation(line: 1282, column: 69, scope: !1426)
!1437 = !DILocation(line: 1282, column: 13, scope: !1426)
!1438 = !DILocation(line: 1283, column: 16, scope: !1426)
!1439 = !DILocation(line: 1283, column: 25, scope: !1426)
!1440 = !DILocation(line: 1283, column: 24, scope: !1426)
!1441 = !DILocation(line: 1283, column: 41, scope: !1426)
!1442 = !DILocation(line: 1283, column: 51, scope: !1426)
!1443 = !DILocation(line: 1283, column: 50, scope: !1426)
!1444 = !DILocation(line: 1283, column: 38, scope: !1426)
!1445 = !DILocation(line: 1283, column: 13, scope: !1426)
!1446 = !DILocation(line: 1284, column: 7, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1426, file: !61, line: 1284, column: 7)
!1448 = !DILocation(line: 1284, column: 16, scope: !1447)
!1449 = !DILocation(line: 1284, column: 7, scope: !1426)
!1450 = !DILocation(line: 1286, column: 13, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1447, file: !61, line: 1285, column: 4)
!1452 = !DILocation(line: 1286, column: 12, scope: !1451)
!1453 = !DILocation(line: 1286, column: 5, scope: !1451)
!1454 = !DILocation(line: 1290, column: 5, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1447, file: !61, line: 1289, column: 4)
!1456 = !DILocation(line: 1296, column: 15, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1415, file: !61, line: 1295, column: 2)
!1458 = !DILocation(line: 1296, column: 29, scope: !1457)
!1459 = !DILocation(line: 1296, column: 39, scope: !1457)
!1460 = !DILocation(line: 1296, column: 38, scope: !1457)
!1461 = !DILocation(line: 1296, column: 54, scope: !1457)
!1462 = !DILocation(line: 1296, column: 52, scope: !1457)
!1463 = !DILocation(line: 1296, column: 25, scope: !1457)
!1464 = !DILocation(line: 1296, column: 68, scope: !1457)
!1465 = !DILocation(line: 1296, column: 12, scope: !1457)
!1466 = !DILocation(line: 1297, column: 15, scope: !1457)
!1467 = !DILocation(line: 1297, column: 24, scope: !1457)
!1468 = !DILocation(line: 1297, column: 23, scope: !1457)
!1469 = !DILocation(line: 1297, column: 40, scope: !1457)
!1470 = !DILocation(line: 1297, column: 50, scope: !1457)
!1471 = !DILocation(line: 1297, column: 49, scope: !1457)
!1472 = !DILocation(line: 1297, column: 37, scope: !1457)
!1473 = !DILocation(line: 1297, column: 12, scope: !1457)
!1474 = !DILocation(line: 1298, column: 6, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1457, file: !61, line: 1298, column: 6)
!1476 = !DILocation(line: 1298, column: 15, scope: !1475)
!1477 = !DILocation(line: 1298, column: 6, scope: !1457)
!1478 = !DILocation(line: 1300, column: 11, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1475, file: !61, line: 1299, column: 3)
!1480 = !DILocation(line: 1300, column: 4, scope: !1479)
!1481 = !DILocation(line: 1304, column: 4, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1475, file: !61, line: 1303, column: 3)
!1483 = !DILocation(line: 1307, column: 1, scope: !1403)
!1484 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !61, file: !61, line: 1325, type: !1485, scopeLine: 1326, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1485 = !DISubroutineType(types: !1486)
!1486 = !{!69, !69, !421}
!1487 = !DILocalVariable(name: "numerator", arg: 1, scope: !1484, file: !61, line: 1325, type: !69)
!1488 = !DILocation(line: 1325, column: 25, scope: !1484)
!1489 = !DILocalVariable(name: "denominator", arg: 2, scope: !1484, file: !61, line: 1325, type: !421)
!1490 = !DILocation(line: 1325, column: 40, scope: !1484)
!1491 = !DILocalVariable(name: "s32Temp1", scope: !1484, file: !61, line: 1327, type: !69)
!1492 = !DILocation(line: 1327, column: 6, scope: !1484)
!1493 = !DILocalVariable(name: "s32Temp2", scope: !1484, file: !61, line: 1327, type: !69)
!1494 = !DILocation(line: 1327, column: 20, scope: !1484)
!1495 = !DILocalVariable(name: "u32Temp0", scope: !1484, file: !61, line: 1328, type: !421)
!1496 = !DILocation(line: 1328, column: 6, scope: !1484)
!1497 = !DILocalVariable(name: "u32Temp1", scope: !1484, file: !61, line: 1328, type: !421)
!1498 = !DILocation(line: 1328, column: 20, scope: !1484)
!1499 = !DILocalVariable(name: "u32Temp2", scope: !1484, file: !61, line: 1328, type: !421)
!1500 = !DILocation(line: 1328, column: 34, scope: !1484)
!1501 = !DILocation(line: 1329, column: 5, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1484, file: !61, line: 1329, column: 5)
!1503 = !DILocation(line: 1329, column: 17, scope: !1502)
!1504 = !DILocation(line: 1329, column: 5, scope: !1484)
!1505 = !DILocation(line: 1331, column: 6, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1507, file: !61, line: 1331, column: 6)
!1507 = distinct !DILexicalBlock(scope: !1502, file: !61, line: 1330, column: 2)
!1508 = !DILocation(line: 1331, column: 16, scope: !1506)
!1509 = !DILocation(line: 1331, column: 6, scope: !1507)
!1510 = !DILocation(line: 1333, column: 4, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1506, file: !61, line: 1332, column: 3)
!1512 = !DILocation(line: 1337, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1506, file: !61, line: 1336, column: 3)
!1514 = !DILocation(line: 1342, column: 6, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1516, file: !61, line: 1342, column: 6)
!1516 = distinct !DILexicalBlock(scope: !1502, file: !61, line: 1341, column: 2)
!1517 = !DILocation(line: 1342, column: 16, scope: !1515)
!1518 = !DILocation(line: 1342, column: 6, scope: !1516)
!1519 = !DILocation(line: 1344, column: 16, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1515, file: !61, line: 1343, column: 3)
!1521 = !DILocation(line: 1344, column: 15, scope: !1520)
!1522 = !DILocation(line: 1344, column: 13, scope: !1520)
!1523 = !DILocation(line: 1345, column: 16, scope: !1520)
!1524 = !DILocation(line: 1345, column: 25, scope: !1520)
!1525 = !DILocation(line: 1345, column: 24, scope: !1520)
!1526 = !DILocation(line: 1345, column: 13, scope: !1520)
!1527 = !DILocation(line: 1346, column: 15, scope: !1520)
!1528 = !DILocation(line: 1346, column: 28, scope: !1520)
!1529 = !DILocation(line: 1346, column: 37, scope: !1520)
!1530 = !DILocation(line: 1346, column: 36, scope: !1520)
!1531 = !DILocation(line: 1346, column: 52, scope: !1520)
!1532 = !DILocation(line: 1346, column: 50, scope: !1520)
!1533 = !DILocation(line: 1346, column: 24, scope: !1520)
!1534 = !DILocation(line: 1346, column: 13, scope: !1520)
!1535 = !DILocation(line: 1348, column: 8, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1520, file: !61, line: 1348, column: 7)
!1537 = !DILocation(line: 1348, column: 20, scope: !1536)
!1538 = !DILocation(line: 1348, column: 27, scope: !1536)
!1539 = !DILocation(line: 1348, column: 7, scope: !1520)
!1540 = !DILocation(line: 1350, column: 20, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1536, file: !61, line: 1349, column: 4)
!1542 = !DILocation(line: 1350, column: 32, scope: !1541)
!1543 = !DILocation(line: 1350, column: 17, scope: !1541)
!1544 = !DILocation(line: 1351, column: 4, scope: !1541)
!1545 = !DILocation(line: 1354, column: 20, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1536, file: !61, line: 1353, column: 4)
!1547 = !DILocation(line: 1354, column: 32, scope: !1546)
!1548 = !DILocation(line: 1354, column: 38, scope: !1546)
!1549 = !DILocation(line: 1354, column: 17, scope: !1546)
!1550 = !DILocation(line: 1358, column: 7, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1520, file: !61, line: 1358, column: 7)
!1552 = !DILocation(line: 1358, column: 18, scope: !1551)
!1553 = !DILocation(line: 1358, column: 16, scope: !1551)
!1554 = !DILocation(line: 1358, column: 7, scope: !1520)
!1555 = !DILocation(line: 1360, column: 14, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1551, file: !61, line: 1359, column: 4)
!1557 = !DILocation(line: 1360, column: 13, scope: !1556)
!1558 = !DILocation(line: 1360, column: 23, scope: !1556)
!1559 = !DILocation(line: 1360, column: 5, scope: !1556)
!1560 = !DILocation(line: 1364, column: 14, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1551, file: !61, line: 1363, column: 4)
!1562 = !DILocation(line: 1364, column: 23, scope: !1561)
!1563 = !DILocation(line: 1364, column: 12, scope: !1561)
!1564 = !DILocation(line: 1364, column: 27, scope: !1561)
!1565 = !DILocation(line: 1364, column: 5, scope: !1561)
!1566 = !DILocation(line: 1371, column: 16, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1515, file: !61, line: 1370, column: 3)
!1568 = !DILocation(line: 1371, column: 30, scope: !1567)
!1569 = !DILocation(line: 1371, column: 40, scope: !1567)
!1570 = !DILocation(line: 1371, column: 39, scope: !1567)
!1571 = !DILocation(line: 1371, column: 55, scope: !1567)
!1572 = !DILocation(line: 1371, column: 53, scope: !1567)
!1573 = !DILocation(line: 1371, column: 26, scope: !1567)
!1574 = !DILocation(line: 1371, column: 69, scope: !1567)
!1575 = !DILocation(line: 1371, column: 13, scope: !1567)
!1576 = !DILocation(line: 1372, column: 16, scope: !1567)
!1577 = !DILocation(line: 1372, column: 26, scope: !1567)
!1578 = !DILocation(line: 1372, column: 25, scope: !1567)
!1579 = !DILocation(line: 1372, column: 42, scope: !1567)
!1580 = !DILocation(line: 1372, column: 51, scope: !1567)
!1581 = !DILocation(line: 1372, column: 50, scope: !1567)
!1582 = !DILocation(line: 1372, column: 39, scope: !1567)
!1583 = !DILocation(line: 1372, column: 13, scope: !1567)
!1584 = !DILocation(line: 1373, column: 11, scope: !1567)
!1585 = !DILocation(line: 1373, column: 4, scope: !1567)
!1586 = !DILocation(line: 1376, column: 1, scope: !1484)
!1587 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !61, file: !61, line: 1393, type: !1588, scopeLine: 1394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1588 = !DISubroutineType(types: !1589)
!1589 = !{!69, !69, !69}
!1590 = !DILocalVariable(name: "numerator", arg: 1, scope: !1587, file: !61, line: 1393, type: !69)
!1591 = !DILocation(line: 1393, column: 25, scope: !1587)
!1592 = !DILocalVariable(name: "denominator", arg: 2, scope: !1587, file: !61, line: 1393, type: !69)
!1593 = !DILocation(line: 1393, column: 40, scope: !1587)
!1594 = !DILocalVariable(name: "s32Temp1", scope: !1587, file: !61, line: 1395, type: !69)
!1595 = !DILocation(line: 1395, column: 6, scope: !1587)
!1596 = !DILocalVariable(name: "s32Temp2", scope: !1587, file: !61, line: 1395, type: !69)
!1597 = !DILocation(line: 1395, column: 20, scope: !1587)
!1598 = !DILocalVariable(name: "denominator_prime", scope: !1587, file: !61, line: 1396, type: !421)
!1599 = !DILocation(line: 1396, column: 6, scope: !1587)
!1600 = !DILocalVariable(name: "u32Temp1", scope: !1587, file: !61, line: 1396, type: !421)
!1601 = !DILocation(line: 1396, column: 29, scope: !1587)
!1602 = !DILocalVariable(name: "u32Temp2", scope: !1587, file: !61, line: 1396, type: !421)
!1603 = !DILocation(line: 1396, column: 43, scope: !1587)
!1604 = !DILocalVariable(name: "u32numerator", scope: !1587, file: !61, line: 1397, type: !421)
!1605 = !DILocation(line: 1397, column: 6, scope: !1587)
!1606 = !DILocalVariable(name: "u32denominator", scope: !1587, file: !61, line: 1397, type: !421)
!1607 = !DILocation(line: 1397, column: 23, scope: !1587)
!1608 = !DILocation(line: 1398, column: 5, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1587, file: !61, line: 1398, column: 5)
!1610 = !DILocation(line: 1398, column: 15, scope: !1609)
!1611 = !DILocation(line: 1398, column: 5, scope: !1587)
!1612 = !DILocation(line: 1400, column: 6, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1614, file: !61, line: 1400, column: 6)
!1614 = distinct !DILexicalBlock(scope: !1609, file: !61, line: 1399, column: 2)
!1615 = !DILocation(line: 1400, column: 18, scope: !1613)
!1616 = !DILocation(line: 1400, column: 6, scope: !1614)
!1617 = !DILocation(line: 1402, column: 7, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1619, file: !61, line: 1402, column: 7)
!1619 = distinct !DILexicalBlock(scope: !1613, file: !61, line: 1401, column: 3)
!1620 = !DILocation(line: 1402, column: 19, scope: !1618)
!1621 = !DILocation(line: 1402, column: 7, scope: !1619)
!1622 = !DILocation(line: 1404, column: 5, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1618, file: !61, line: 1403, column: 4)
!1624 = !DILocation(line: 1408, column: 21, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1618, file: !61, line: 1407, column: 4)
!1626 = !DILocation(line: 1408, column: 20, scope: !1625)
!1627 = !DILocation(line: 1408, column: 18, scope: !1625)
!1628 = !DILocation(line: 1409, column: 23, scope: !1625)
!1629 = !DILocation(line: 1409, column: 22, scope: !1625)
!1630 = !DILocation(line: 1409, column: 20, scope: !1625)
!1631 = !DILocation(line: 1410, column: 16, scope: !1625)
!1632 = !DILocation(line: 1410, column: 33, scope: !1625)
!1633 = !DILocation(line: 1410, column: 46, scope: !1625)
!1634 = !DILocation(line: 1410, column: 45, scope: !1625)
!1635 = !DILocation(line: 1410, column: 64, scope: !1625)
!1636 = !DILocation(line: 1410, column: 62, scope: !1625)
!1637 = !DILocation(line: 1410, column: 29, scope: !1625)
!1638 = !DILocation(line: 1410, column: 81, scope: !1625)
!1639 = !DILocation(line: 1410, column: 14, scope: !1625)
!1640 = !DILocation(line: 1411, column: 17, scope: !1625)
!1641 = !DILocation(line: 1411, column: 30, scope: !1625)
!1642 = !DILocation(line: 1411, column: 29, scope: !1625)
!1643 = !DILocation(line: 1411, column: 49, scope: !1625)
!1644 = !DILocation(line: 1411, column: 58, scope: !1625)
!1645 = !DILocation(line: 1411, column: 57, scope: !1625)
!1646 = !DILocation(line: 1411, column: 46, scope: !1625)
!1647 = !DILocation(line: 1411, column: 14, scope: !1625)
!1648 = !DILocation(line: 1412, column: 8, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1625, file: !61, line: 1412, column: 8)
!1650 = !DILocation(line: 1412, column: 17, scope: !1649)
!1651 = !DILocation(line: 1412, column: 8, scope: !1625)
!1652 = !DILocation(line: 1414, column: 13, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1649, file: !61, line: 1413, column: 5)
!1654 = !DILocation(line: 1414, column: 6, scope: !1653)
!1655 = !DILocation(line: 1418, column: 6, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1649, file: !61, line: 1417, column: 5)
!1657 = !DILocation(line: 1424, column: 20, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1613, file: !61, line: 1423, column: 3)
!1659 = !DILocation(line: 1424, column: 19, scope: !1658)
!1660 = !DILocation(line: 1424, column: 29, scope: !1658)
!1661 = !DILocation(line: 1424, column: 17, scope: !1658)
!1662 = !DILocation(line: 1425, column: 16, scope: !1658)
!1663 = !DILocation(line: 1425, column: 33, scope: !1658)
!1664 = !DILocation(line: 1425, column: 46, scope: !1658)
!1665 = !DILocation(line: 1425, column: 45, scope: !1658)
!1666 = !DILocation(line: 1425, column: 61, scope: !1658)
!1667 = !DILocation(line: 1425, column: 59, scope: !1658)
!1668 = !DILocation(line: 1425, column: 29, scope: !1658)
!1669 = !DILocation(line: 1425, column: 75, scope: !1658)
!1670 = !DILocation(line: 1425, column: 13, scope: !1658)
!1671 = !DILocation(line: 1426, column: 16, scope: !1658)
!1672 = !DILocation(line: 1426, column: 29, scope: !1658)
!1673 = !DILocation(line: 1426, column: 28, scope: !1658)
!1674 = !DILocation(line: 1426, column: 45, scope: !1658)
!1675 = !DILocation(line: 1426, column: 54, scope: !1658)
!1676 = !DILocation(line: 1426, column: 53, scope: !1658)
!1677 = !DILocation(line: 1426, column: 42, scope: !1658)
!1678 = !DILocation(line: 1426, column: 13, scope: !1658)
!1679 = !DILocation(line: 1427, column: 13, scope: !1658)
!1680 = !DILocation(line: 1427, column: 12, scope: !1658)
!1681 = !DILocation(line: 1427, column: 22, scope: !1658)
!1682 = !DILocation(line: 1427, column: 4, scope: !1658)
!1683 = !DILocation(line: 1432, column: 6, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1685, file: !61, line: 1432, column: 6)
!1685 = distinct !DILexicalBlock(scope: !1609, file: !61, line: 1431, column: 2)
!1686 = !DILocation(line: 1432, column: 18, scope: !1684)
!1687 = !DILocation(line: 1432, column: 6, scope: !1685)
!1688 = !DILocation(line: 1434, column: 7, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1690, file: !61, line: 1434, column: 7)
!1690 = distinct !DILexicalBlock(scope: !1684, file: !61, line: 1433, column: 3)
!1691 = !DILocation(line: 1434, column: 19, scope: !1689)
!1692 = !DILocation(line: 1434, column: 7, scope: !1690)
!1693 = !DILocation(line: 1436, column: 5, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1689, file: !61, line: 1435, column: 4)
!1695 = !DILocation(line: 1440, column: 23, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1689, file: !61, line: 1439, column: 4)
!1697 = !DILocation(line: 1440, column: 22, scope: !1696)
!1698 = !DILocation(line: 1440, column: 35, scope: !1696)
!1699 = !DILocation(line: 1440, column: 20, scope: !1696)
!1700 = !DILocation(line: 1441, column: 17, scope: !1696)
!1701 = !DILocation(line: 1441, column: 31, scope: !1696)
!1702 = !DILocation(line: 1441, column: 41, scope: !1696)
!1703 = !DILocation(line: 1441, column: 40, scope: !1696)
!1704 = !DILocation(line: 1441, column: 59, scope: !1696)
!1705 = !DILocation(line: 1441, column: 57, scope: !1696)
!1706 = !DILocation(line: 1441, column: 27, scope: !1696)
!1707 = !DILocation(line: 1441, column: 76, scope: !1696)
!1708 = !DILocation(line: 1441, column: 14, scope: !1696)
!1709 = !DILocation(line: 1442, column: 17, scope: !1696)
!1710 = !DILocation(line: 1442, column: 27, scope: !1696)
!1711 = !DILocation(line: 1442, column: 26, scope: !1696)
!1712 = !DILocation(line: 1442, column: 46, scope: !1696)
!1713 = !DILocation(line: 1442, column: 55, scope: !1696)
!1714 = !DILocation(line: 1442, column: 54, scope: !1696)
!1715 = !DILocation(line: 1442, column: 43, scope: !1696)
!1716 = !DILocation(line: 1442, column: 14, scope: !1696)
!1717 = !DILocation(line: 1443, column: 14, scope: !1696)
!1718 = !DILocation(line: 1443, column: 13, scope: !1696)
!1719 = !DILocation(line: 1443, column: 23, scope: !1696)
!1720 = !DILocation(line: 1443, column: 5, scope: !1696)
!1721 = !DILocation(line: 1448, column: 16, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1684, file: !61, line: 1447, column: 3)
!1723 = !DILocation(line: 1448, column: 30, scope: !1722)
!1724 = !DILocation(line: 1448, column: 40, scope: !1722)
!1725 = !DILocation(line: 1448, column: 39, scope: !1722)
!1726 = !DILocation(line: 1448, column: 55, scope: !1722)
!1727 = !DILocation(line: 1448, column: 53, scope: !1722)
!1728 = !DILocation(line: 1448, column: 26, scope: !1722)
!1729 = !DILocation(line: 1448, column: 69, scope: !1722)
!1730 = !DILocation(line: 1448, column: 13, scope: !1722)
!1731 = !DILocation(line: 1449, column: 16, scope: !1722)
!1732 = !DILocation(line: 1449, column: 26, scope: !1722)
!1733 = !DILocation(line: 1449, column: 25, scope: !1722)
!1734 = !DILocation(line: 1449, column: 42, scope: !1722)
!1735 = !DILocation(line: 1449, column: 51, scope: !1722)
!1736 = !DILocation(line: 1449, column: 50, scope: !1722)
!1737 = !DILocation(line: 1449, column: 39, scope: !1722)
!1738 = !DILocation(line: 1449, column: 13, scope: !1722)
!1739 = !DILocation(line: 1450, column: 11, scope: !1722)
!1740 = !DILocation(line: 1450, column: 4, scope: !1722)
!1741 = !DILocation(line: 1453, column: 1, scope: !1587)
!1742 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !61, file: !61, line: 1471, type: !1743, scopeLine: 1472, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1743 = !DISubroutineType(types: !1744)
!1744 = !{!12, !69, !421}
!1745 = !DILocalVariable(name: "numerator", arg: 1, scope: !1742, file: !61, line: 1471, type: !69)
!1746 = !DILocation(line: 1471, column: 25, scope: !1742)
!1747 = !DILocalVariable(name: "denominator", arg: 2, scope: !1742, file: !61, line: 1471, type: !421)
!1748 = !DILocation(line: 1471, column: 40, scope: !1742)
!1749 = !DILocalVariable(name: "numerator_prime", scope: !1742, file: !61, line: 1474, type: !421)
!1750 = !DILocation(line: 1474, column: 6, scope: !1742)
!1751 = !DILocalVariable(name: "u32Temp1", scope: !1742, file: !61, line: 1474, type: !421)
!1752 = !DILocation(line: 1474, column: 27, scope: !1742)
!1753 = !DILocalVariable(name: "u32Temp2", scope: !1742, file: !61, line: 1474, type: !421)
!1754 = !DILocation(line: 1474, column: 41, scope: !1742)
!1755 = !DILocalVariable(name: "u32Temp3", scope: !1742, file: !61, line: 1474, type: !421)
!1756 = !DILocation(line: 1474, column: 55, scope: !1742)
!1757 = !DILocalVariable(name: "s32Temp1", scope: !1742, file: !61, line: 1475, type: !69)
!1758 = !DILocation(line: 1475, column: 6, scope: !1742)
!1759 = !DILocalVariable(name: "s32Temp2", scope: !1742, file: !61, line: 1475, type: !69)
!1760 = !DILocation(line: 1475, column: 20, scope: !1742)
!1761 = !DILocalVariable(name: "s32Temp3", scope: !1742, file: !61, line: 1475, type: !69)
!1762 = !DILocation(line: 1475, column: 34, scope: !1742)
!1763 = !DILocation(line: 1476, column: 5, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1742, file: !61, line: 1476, column: 5)
!1765 = !DILocation(line: 1476, column: 17, scope: !1764)
!1766 = !DILocation(line: 1476, column: 5, scope: !1742)
!1767 = !DILocation(line: 1478, column: 6, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1769, file: !61, line: 1478, column: 6)
!1769 = distinct !DILexicalBlock(scope: !1764, file: !61, line: 1477, column: 2)
!1770 = !DILocation(line: 1478, column: 15, scope: !1768)
!1771 = !DILocation(line: 1478, column: 6, scope: !1769)
!1772 = !DILocation(line: 1480, column: 4, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1768, file: !61, line: 1479, column: 3)
!1774 = !DILocation(line: 1484, column: 4, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1768, file: !61, line: 1483, column: 3)
!1776 = !DILocation(line: 1489, column: 6, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1778, file: !61, line: 1489, column: 6)
!1778 = distinct !DILexicalBlock(scope: !1764, file: !61, line: 1488, column: 2)
!1779 = !DILocation(line: 1489, column: 16, scope: !1777)
!1780 = !DILocation(line: 1489, column: 6, scope: !1778)
!1781 = !DILocation(line: 1491, column: 23, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1777, file: !61, line: 1490, column: 3)
!1783 = !DILocation(line: 1491, column: 22, scope: !1782)
!1784 = !DILocation(line: 1491, column: 20, scope: !1782)
!1785 = !DILocation(line: 1492, column: 16, scope: !1782)
!1786 = !DILocation(line: 1492, column: 32, scope: !1782)
!1787 = !DILocation(line: 1492, column: 31, scope: !1782)
!1788 = !DILocation(line: 1492, column: 13, scope: !1782)
!1789 = !DILocation(line: 1493, column: 15, scope: !1782)
!1790 = !DILocation(line: 1493, column: 34, scope: !1782)
!1791 = !DILocation(line: 1493, column: 45, scope: !1782)
!1792 = !DILocation(line: 1493, column: 43, scope: !1782)
!1793 = !DILocation(line: 1493, column: 31, scope: !1782)
!1794 = !DILocation(line: 1493, column: 13, scope: !1782)
!1795 = !DILocation(line: 1495, column: 8, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1782, file: !61, line: 1495, column: 7)
!1797 = !DILocation(line: 1495, column: 20, scope: !1796)
!1798 = !DILocation(line: 1495, column: 27, scope: !1796)
!1799 = !DILocation(line: 1495, column: 7, scope: !1782)
!1800 = !DILocation(line: 1497, column: 19, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1796, file: !61, line: 1496, column: 4)
!1802 = !DILocation(line: 1497, column: 31, scope: !1801)
!1803 = !DILocation(line: 1497, column: 17, scope: !1801)
!1804 = !DILocation(line: 1498, column: 4, scope: !1801)
!1805 = !DILocation(line: 1501, column: 20, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1796, file: !61, line: 1500, column: 4)
!1807 = !DILocation(line: 1501, column: 32, scope: !1806)
!1808 = !DILocation(line: 1501, column: 38, scope: !1806)
!1809 = !DILocation(line: 1501, column: 17, scope: !1806)
!1810 = !DILocation(line: 1504, column: 7, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1782, file: !61, line: 1504, column: 7)
!1812 = !DILocation(line: 1504, column: 18, scope: !1811)
!1813 = !DILocation(line: 1504, column: 16, scope: !1811)
!1814 = !DILocation(line: 1504, column: 7, scope: !1782)
!1815 = !DILocation(line: 1506, column: 18, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1811, file: !61, line: 1505, column: 4)
!1817 = !DILocation(line: 1506, column: 16, scope: !1816)
!1818 = !DILocation(line: 1506, column: 28, scope: !1816)
!1819 = !DILocation(line: 1506, column: 14, scope: !1816)
!1820 = !DILocation(line: 1507, column: 4, scope: !1816)
!1821 = !DILocation(line: 1510, column: 18, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1811, file: !61, line: 1509, column: 4)
!1823 = !DILocation(line: 1510, column: 26, scope: !1822)
!1824 = !DILocation(line: 1510, column: 16, scope: !1822)
!1825 = !DILocation(line: 1510, column: 30, scope: !1822)
!1826 = !DILocation(line: 1510, column: 14, scope: !1822)
!1827 = !DILocation(line: 1512, column: 8, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1782, file: !61, line: 1512, column: 7)
!1829 = !DILocation(line: 1512, column: 18, scope: !1828)
!1830 = !DILocation(line: 1512, column: 7, scope: !1782)
!1831 = !DILocation(line: 1514, column: 18, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1828, file: !61, line: 1513, column: 4)
!1833 = !DILocation(line: 1514, column: 12, scope: !1832)
!1834 = !DILocation(line: 1514, column: 5, scope: !1832)
!1835 = !DILocation(line: 1518, column: 5, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1828, file: !61, line: 1517, column: 4)
!1837 = !DILocation(line: 1523, column: 16, scope: !1838)
!1838 = distinct !DILexicalBlock(scope: !1777, file: !61, line: 1522, column: 3)
!1839 = !DILocation(line: 1523, column: 26, scope: !1838)
!1840 = !DILocation(line: 1523, column: 25, scope: !1838)
!1841 = !DILocation(line: 1523, column: 41, scope: !1838)
!1842 = !DILocation(line: 1523, column: 39, scope: !1838)
!1843 = !DILocation(line: 1523, column: 13, scope: !1838)
!1844 = !DILocation(line: 1524, column: 16, scope: !1838)
!1845 = !DILocation(line: 1524, column: 30, scope: !1838)
!1846 = !DILocation(line: 1524, column: 40, scope: !1838)
!1847 = !DILocation(line: 1524, column: 39, scope: !1838)
!1848 = !DILocation(line: 1524, column: 55, scope: !1838)
!1849 = !DILocation(line: 1524, column: 53, scope: !1838)
!1850 = !DILocation(line: 1524, column: 26, scope: !1838)
!1851 = !DILocation(line: 1524, column: 68, scope: !1838)
!1852 = !DILocation(line: 1524, column: 13, scope: !1838)
!1853 = !DILocation(line: 1525, column: 16, scope: !1838)
!1854 = !DILocation(line: 1525, column: 25, scope: !1838)
!1855 = !DILocation(line: 1525, column: 24, scope: !1838)
!1856 = !DILocation(line: 1525, column: 41, scope: !1838)
!1857 = !DILocation(line: 1525, column: 51, scope: !1838)
!1858 = !DILocation(line: 1525, column: 50, scope: !1838)
!1859 = !DILocation(line: 1525, column: 38, scope: !1838)
!1860 = !DILocation(line: 1525, column: 13, scope: !1838)
!1861 = !DILocation(line: 1526, column: 7, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !1838, file: !61, line: 1526, column: 7)
!1863 = !DILocation(line: 1526, column: 16, scope: !1862)
!1864 = !DILocation(line: 1526, column: 7, scope: !1838)
!1865 = !DILocation(line: 1528, column: 17, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1862, file: !61, line: 1527, column: 4)
!1867 = !DILocation(line: 1528, column: 12, scope: !1866)
!1868 = !DILocation(line: 1528, column: 5, scope: !1866)
!1869 = !DILocation(line: 1532, column: 5, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1862, file: !61, line: 1531, column: 4)
!1871 = !DILocation(line: 1536, column: 1, scope: !1742)
!1872 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1873, file: !1873, line: 12, type: !1874, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !1877)
!1873 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1874 = !DISubroutineType(types: !1875)
!1875 = !{null, !1876}
!1876 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1877 = !{!1878}
!1878 = !DILocalVariable(name: "z", arg: 1, scope: !1872, file: !1873, line: 12, type: !1876)
!1879 = !DILocation(line: 0, scope: !1872)
!1880 = !DILocation(line: 13, column: 9, scope: !1881)
!1881 = distinct !DILexicalBlock(scope: !1872, file: !1873, line: 13, column: 7)
!1882 = !DILocation(line: 13, column: 7, scope: !1872)
!1883 = !DILocation(line: 14, column: 5, scope: !1881)
!1884 = !DILocation(line: 15, column: 1, scope: !1872)
