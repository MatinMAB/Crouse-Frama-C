; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049/build/s16_fac05_div_s16_s16_alarm_0049.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0049: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0049.err\00", align 1
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
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i16* %numerator to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i16* %denominator to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i16, i16* %numerator, align 2, !dbg !62
  %3 = load i16, i16* %denominator, align 2, !dbg !63
  %call = call signext i16 @s16_fac05_div_s16_s16(i16 signext %2, i16 signext %3), !dbg !64
  store i16 %call, i16* %result, align 2, !dbg !65
  %4 = load i16, i16* %result, align 2, !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !68 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !80
  %conv = sext i16 %0 to i32, !dbg !82
  %conv1 = sext i32 %conv to i64, !dbg !83
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv1), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.end, label %if.then, !dbg !85

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !86
  br label %return, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !88
  %conv2 = sext i16 %1 to i32, !dbg !88
  %shl = shl i32 %conv2, 16, !dbg !89
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !90
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !91
  %conv3 = sext i16 %2 to i32, !dbg !91
  %cmp = icmp eq i32 %conv3, 0, !dbg !93
  br i1 %cmp, label %if.then5, label %if.else10, !dbg !94

if.then5:                                         ; preds = %if.end
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !95
  %conv6 = sext i16 %3 to i32, !dbg !95
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !98
  br i1 %cmp7, label %if.then9, label %if.else, !dbg !99

if.then9:                                         ; preds = %if.then5
  store i16 -32768, i16* %retval, align 2, !dbg !100
  br label %return, !dbg !100

if.else:                                          ; preds = %if.then5
  store i16 32767, i16* %retval, align 2, !dbg !102
  br label %return, !dbg !102

if.else10:                                        ; preds = %if.end
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !104
  %cmp11 = icmp ne i32 %4, -2147483648, !dbg !107
  br i1 %cmp11, label %if.then13, label %if.else59, !dbg !108

if.then13:                                        ; preds = %if.else10
  %5 = load i16, i16* %denominator.addr, align 2, !dbg !109
  %conv14 = sext i16 %5 to i64, !dbg !112
  %call15 = call i32 @klee_alarm_divisor_nonzero(i64 %conv14), !dbg !113
  %tobool16 = icmp ne i32 %call15, 0, !dbg !113
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !114

if.then17:                                        ; preds = %if.then13
  store i16 0, i16* %retval, align 2, !dbg !115
  br label %return, !dbg !115

if.end18:                                         ; preds = %if.then13
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !117
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !119
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !120
  %conv19 = sext i16 %8 to i32, !dbg !121
  %int_cast_to_i64 = zext i32 %conv19 to i64, !dbg !122
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !122
  %div = sdiv i32 %7, %conv19, !dbg !122, !klee.check.div !123
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !124
  %conv20 = sext i16 %9 to i32, !dbg !125
  %mul = mul nsw i32 %div, %conv20, !dbg !126
  %sub = sub nsw i32 %6, %mul, !dbg !127
  %conv21 = sext i32 %sub to i64, !dbg !128
  %call22 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv21), !dbg !129
  %tobool23 = icmp ne i32 %call22, 0, !dbg !129
  br i1 %tobool23, label %if.end25, label %if.then24, !dbg !130

if.then24:                                        ; preds = %if.end18
  store i16 0, i16* %retval, align 2, !dbg !131
  br label %return, !dbg !131

if.end25:                                         ; preds = %if.end18
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !133
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !135
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !136
  %conv26 = sext i16 %12 to i32, !dbg !137
  %int_cast_to_i641 = zext i32 %conv26 to i64, !dbg !138
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !138
  %div27 = sdiv i32 %11, %conv26, !dbg !138, !klee.check.div !123
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !139
  %conv28 = sext i16 %13 to i32, !dbg !140
  %mul29 = mul nsw i32 %div27, %conv28, !dbg !141
  %sub30 = sub nsw i32 %10, %mul29, !dbg !142
  %conv31 = sext i32 %sub30 to i64, !dbg !143
  %call32 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv31, i32 1), !dbg !144
  %tobool33 = icmp ne i32 %call32, 0, !dbg !144
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !145

if.then34:                                        ; preds = %if.end25
  store i16 0, i16* %retval, align 2, !dbg !146
  br label %return, !dbg !146

if.end35:                                         ; preds = %if.end25
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !148
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !150
  %conv36 = sext i16 %15 to i32, !dbg !151
  %int_cast_to_i642 = zext i32 %conv36 to i64, !dbg !152
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !152
  %div37 = sdiv i32 %14, %conv36, !dbg !152, !klee.check.div !123
  %conv38 = sext i32 %div37 to i64, !dbg !153
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !154
  %conv39 = sext i16 %16 to i32, !dbg !155
  %conv40 = sext i32 %conv39 to i64, !dbg !156
  %call41 = call i32 @klee_alarm_s32_mul_upper(i64 %conv38, i64 %conv40), !dbg !157
  %tobool42 = icmp ne i32 %call41, 0, !dbg !157
  br i1 %tobool42, label %if.end44, label %if.then43, !dbg !158

if.then43:                                        ; preds = %if.end35
  store i16 0, i16* %retval, align 2, !dbg !159
  br label %return, !dbg !159

if.end44:                                         ; preds = %if.end35
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !161
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !162
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !163
  %conv45 = sext i16 %19 to i32, !dbg !163
  %int_cast_to_i643 = zext i32 %conv45 to i64, !dbg !164
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !164
  %div46 = sdiv i32 %18, %conv45, !dbg !164, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !165
  %conv47 = sext i16 %20 to i32, !dbg !165
  %mul48 = mul nsw i32 %div46, %conv47, !dbg !166
  %sub49 = sub nsw i32 %17, %mul48, !dbg !167
  %shl50 = shl i32 %sub49, 1, !dbg !168
  store i32 %shl50, i32* %s32Temp2, align 4, !dbg !169
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !170
  %conv51 = sext i16 %21 to i64, !dbg !172
  %call52 = call i32 @klee_alarm_divisor_nonzero(i64 %conv51), !dbg !173
  %tobool53 = icmp ne i32 %call52, 0, !dbg !173
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !174

if.then54:                                        ; preds = %if.end44
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 215, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !175
  unreachable, !dbg !175

if.end55:                                         ; preds = %if.end44
  %22 = load i32, i32* %s32Temp2, align 4, !dbg !177
  %23 = load i16, i16* %denominator.addr, align 2, !dbg !178
  %conv56 = sext i16 %23 to i32, !dbg !178
  %int_cast_to_i644 = zext i32 %conv56 to i64, !dbg !179
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !179
  %div57 = sdiv i32 %22, %conv56, !dbg !179, !klee.check.div !123
  %conv58 = sext i32 %div57 to i64, !dbg !180
  store volatile i64 %conv58, i64* @klee_alarm_sink_s64, align 8, !dbg !181
  store i16 0, i16* %retval, align 2, !dbg !182
  br label %return, !dbg !182

if.else59:                                        ; preds = %if.else10
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !183
  %conv60 = sext i16 %24 to i32, !dbg !183
  %cmp61 = icmp ne i32 %conv60, -1, !dbg !186
  br i1 %cmp61, label %if.then63, label %if.else85, !dbg !187

if.then63:                                        ; preds = %if.else59
  %25 = load i32, i32* %s32Temp1, align 4, !dbg !188
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !190
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !191
  %conv64 = sext i16 %27 to i32, !dbg !191
  %int_cast_to_i645 = zext i32 %conv64 to i64, !dbg !192
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !192
  %div65 = sdiv i32 %26, %conv64, !dbg !192, !klee.check.div !123
  %28 = load i16, i16* %denominator.addr, align 2, !dbg !193
  %conv66 = sext i16 %28 to i32, !dbg !193
  %mul67 = mul nsw i32 %div65, %conv66, !dbg !194
  %sub68 = sub nsw i32 %25, %mul67, !dbg !195
  %shl69 = shl i32 %sub68, 1, !dbg !196
  store i32 %shl69, i32* %s32Temp2, align 4, !dbg !197
  %29 = load i32, i32* %s32Temp2, align 4, !dbg !198
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !199
  %conv70 = sext i16 %30 to i32, !dbg !199
  %int_cast_to_i646 = zext i32 %conv70 to i64, !dbg !200
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !200
  %div71 = sdiv i32 %29, %conv70, !dbg !200, !klee.check.div !123
  store i32 %div71, i32* %s32Temp1, align 4, !dbg !201
  %31 = load i32, i32* %s32Temp1, align 4, !dbg !202
  %32 = load i16, i16* %numerator.addr, align 2, !dbg !203
  %conv72 = sext i16 %32 to i32, !dbg !203
  %shl73 = shl i32 %conv72, 16, !dbg !204
  %33 = load i16, i16* %denominator.addr, align 2, !dbg !205
  %conv74 = sext i16 %33 to i32, !dbg !205
  %int_cast_to_i647 = zext i32 %conv74 to i64, !dbg !206
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !206
  %div75 = sdiv i32 %shl73, %conv74, !dbg !206, !klee.check.div !123
  %add = add nsw i32 %31, %div75, !dbg !207
  store i32 %add, i32* %s32Temp1, align 4, !dbg !208
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !209
  %cmp76 = icmp slt i32 %34, 32767, !dbg !211
  br i1 %cmp76, label %if.then78, label %if.else84, !dbg !212

if.then78:                                        ; preds = %if.then63
  %35 = load i32, i32* %s32Temp1, align 4, !dbg !213
  %cmp79 = icmp sgt i32 %35, -32768, !dbg !216
  br i1 %cmp79, label %if.then81, label %if.else83, !dbg !217

if.then81:                                        ; preds = %if.then78
  %36 = load i32, i32* %s32Temp1, align 4, !dbg !218
  %conv82 = trunc i32 %36 to i16, !dbg !220
  store i16 %conv82, i16* %retval, align 2, !dbg !221
  br label %return, !dbg !221

if.else83:                                        ; preds = %if.then78
  store i16 -32768, i16* %retval, align 2, !dbg !222
  br label %return, !dbg !222

if.else84:                                        ; preds = %if.then63
  store i16 32767, i16* %retval, align 2, !dbg !224
  br label %return, !dbg !224

if.else85:                                        ; preds = %if.else59
  store i16 32767, i16* %retval, align 2, !dbg !226
  br label %return, !dbg !226

return:                                           ; preds = %if.else85, %if.else84, %if.else83, %if.then81, %if.end55, %if.then43, %if.then34, %if.then24, %if.then17, %if.else, %if.then9, %if.then
  %37 = load i16, i16* %retval, align 2, !dbg !228
  ret i16 %37, !dbg !228
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !229 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !232, metadata !DIExpression()), !dbg !233
  %0 = load i64, i64* %left.addr, align 8, !dbg !234
  %cmp = icmp sge i64 %0, 0, !dbg !235
  %conv = zext i1 %cmp to i32, !dbg !235
  ret i32 %conv, !dbg !236
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !237 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !238, metadata !DIExpression()), !dbg !239
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !240
  %cmp = icmp ne i64 %0, 0, !dbg !241
  %conv = zext i1 %cmp to i32, !dbg !241
  ret i32 %conv, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !243 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !248, metadata !DIExpression()), !dbg !249
  %0 = load i32, i32* %count.addr, align 4, !dbg !250
  %cmp = icmp uge i32 %0, 63, !dbg !252
  br i1 %cmp, label %if.then, label %if.end, !dbg !253

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !254
  br label %return, !dbg !254

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !256
  %2 = load i32, i32* %count.addr, align 4, !dbg !257
  %sh_prom = zext i32 %2 to i64, !dbg !258
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !258
  %shl = shl i64 1, %sh_prom, !dbg !258, !klee.check.shift !123
  %mul = mul nsw i64 %1, %shl, !dbg !259
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !260
  %conv = zext i1 %cmp1 to i32, !dbg !260
  store i32 %conv, i32* %retval, align 4, !dbg !261
  br label %return, !dbg !261

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !262
  ret i32 %3, !dbg !262
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !263 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !266, metadata !DIExpression()), !dbg !267
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !268, metadata !DIExpression()), !dbg !269
  %0 = load i64, i64* %left.addr, align 8, !dbg !270
  %1 = load i64, i64* %right.addr, align 8, !dbg !271
  %mul = mul nsw i64 %0, %1, !dbg !272
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !273
  %conv = zext i1 %cmp to i32, !dbg !273
  ret i32 %conv, !dbg !274
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !275 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !278, metadata !DIExpression()), !dbg !279
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !280, metadata !DIExpression()), !dbg !281
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !282, metadata !DIExpression()), !dbg !283
  store i32 0, i32* %s32Temp1, align 4, !dbg !283
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 0, i32* %s32Temp2, align 4, !dbg !285
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !286
  store i32 %0, i32* %s32Temp1, align 4, !dbg !287
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !288
  %conv = sext i16 %1 to i32, !dbg !288
  %cmp = icmp eq i32 %conv, 0, !dbg !290
  br i1 %cmp, label %if.then, label %if.else5, !dbg !291

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !292
  %cmp2 = icmp slt i32 %2, 0, !dbg !295
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !296

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !297
  br label %return, !dbg !297

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !299
  br label %return, !dbg !299

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !301
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !304
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !305

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !306
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !308
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !309
  %conv9 = sext i16 %6 to i32, !dbg !309
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !310
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !310
  %div = sdiv i32 %5, %conv9, !dbg !310, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !311
  %conv10 = sext i16 %7 to i32, !dbg !311
  %mul = mul nsw i32 %div, %conv10, !dbg !312
  %sub = sub nsw i32 %4, %mul, !dbg !313
  %shl = shl i32 %sub, 1, !dbg !314
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !315
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !316
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !317
  %conv11 = sext i16 %9 to i32, !dbg !317
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !318
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !318
  %div12 = sdiv i32 %8, %conv11, !dbg !318, !klee.check.div !123
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !319
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !320
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !321
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !322
  %conv13 = sext i16 %12 to i32, !dbg !322
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !323
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !323
  %div14 = sdiv i32 %11, %conv13, !dbg !323, !klee.check.div !123
  %add = add nsw i32 %10, %div14, !dbg !324
  store i32 %add, i32* %s32Temp1, align 4, !dbg !325
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !326
  %cmp15 = icmp slt i32 %13, 32767, !dbg !328
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !329

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !330
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !333
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !334

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !335
  %conv21 = trunc i32 %15 to i16, !dbg !337
  store i16 %conv21, i16* %retval, align 2, !dbg !338
  br label %return, !dbg !338

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !339
  br label %return, !dbg !339

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !341
  br label %return, !dbg !341

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !343
  %conv25 = sext i16 %16 to i32, !dbg !343
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !346
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !347

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !348
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !350
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !351
  %conv29 = sext i16 %19 to i32, !dbg !351
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !352
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !352
  %div30 = sdiv i32 %18, %conv29, !dbg !352, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !353
  %conv31 = sext i16 %20 to i32, !dbg !353
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !354
  %sub33 = sub nsw i32 %17, %mul32, !dbg !355
  %shl34 = shl i32 %sub33, 1, !dbg !356
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !357
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !358
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !359
  %conv35 = sext i16 %22 to i32, !dbg !359
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !360
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !360
  %div36 = sdiv i32 %21, %conv35, !dbg !360, !klee.check.div !123
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !361
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !362
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !363
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !364
  %conv37 = sext i16 %25 to i32, !dbg !364
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !365
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !365
  %div38 = sdiv i32 %24, %conv37, !dbg !365, !klee.check.div !123
  %add39 = add nsw i32 %23, %div38, !dbg !366
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !367
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !368
  %cmp40 = icmp slt i32 %26, 32767, !dbg !370
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !371

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !372
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !375
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !376

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !377
  %conv46 = trunc i32 %28 to i16, !dbg !379
  store i16 %conv46, i16* %retval, align 2, !dbg !380
  br label %return, !dbg !380

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !381
  br label %return, !dbg !381

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !385
  br label %return, !dbg !385

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !387
  ret i16 %29, !dbg !387
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !388 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !391, metadata !DIExpression()), !dbg !392
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !393, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !395, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !397, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !399, metadata !DIExpression()), !dbg !400
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !401
  %conv = zext i16 %0 to i32, !dbg !401
  %and = and i32 %conv, 65535, !dbg !402
  %conv1 = trunc i32 %and to i16, !dbg !401
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !403
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !404
  %conv2 = sext i16 %1 to i32, !dbg !404
  %shl = shl i32 %conv2, 16, !dbg !405
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !406
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !407
  %conv3 = zext i16 %2 to i32, !dbg !407
  %cmp = icmp eq i32 %conv3, 0, !dbg !409
  br i1 %cmp, label %if.then, label %if.else9, !dbg !410

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !411
  %conv5 = sext i16 %3 to i32, !dbg !411
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !414
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !415

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !416
  br label %return, !dbg !416

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !418
  br label %return, !dbg !418

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !420
  %conv10 = sext i16 %4 to i32, !dbg !420
  %shl11 = shl i32 %conv10, 16, !dbg !422
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !423
  %conv12 = sext i16 %5 to i32, !dbg !423
  %shl13 = shl i32 %conv12, 16, !dbg !424
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !425
  %conv14 = zext i16 %6 to i32, !dbg !425
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !426
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !426
  %div = sdiv i32 %shl13, %conv14, !dbg !426, !klee.check.div !123
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !427
  %conv15 = zext i16 %7 to i32, !dbg !427
  %mul = mul nsw i32 %div, %conv15, !dbg !428
  %sub = sub nsw i32 %shl11, %mul, !dbg !429
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !430
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !431
  %shl16 = shl i32 %8, 1, !dbg !432
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !433
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !434
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !435
  %conv17 = zext i16 %10 to i32, !dbg !435
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !436
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !436
  %div18 = sdiv i32 %9, %conv17, !dbg !436, !klee.check.div !123
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !437
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !438
  %conv19 = sext i16 %11 to i32, !dbg !438
  %shl20 = shl i32 %conv19, 16, !dbg !439
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !440
  %conv21 = zext i16 %12 to i32, !dbg !440
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !441
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !441
  %div22 = sdiv i32 %shl20, %conv21, !dbg !441, !klee.check.div !123
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !442
  %add = add nsw i32 %div22, %13, !dbg !443
  store i32 %add, i32* %s32Temp1, align 4, !dbg !444
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !445
  %cmp23 = icmp slt i32 %14, 32767, !dbg !447
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !448

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !449
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !452
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !453

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !454
  %conv29 = trunc i32 %16 to i16, !dbg !456
  store i16 %conv29, i16* %retval, align 2, !dbg !457
  br label %return, !dbg !457

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !458
  br label %return, !dbg !458

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !460
  br label %return, !dbg !460

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !462
  ret i16 %17, !dbg !462
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !463 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !464, metadata !DIExpression()), !dbg !465
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !470, metadata !DIExpression()), !dbg !471
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !472
  %conv = zext i16 %0 to i32, !dbg !472
  %and = and i32 %conv, 65535, !dbg !473
  %conv1 = trunc i32 %and to i16, !dbg !472
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !474
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !475
  %conv2 = zext i16 %1 to i32, !dbg !475
  %cmp = icmp eq i32 %conv2, 0, !dbg !477
  br i1 %cmp, label %if.then, label %if.else8, !dbg !478

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !479
  %conv4 = sext i16 %2 to i32, !dbg !479
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !482
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !483

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !484
  br label %return, !dbg !484

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !486
  br label %return, !dbg !486

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !488
  %conv9 = sext i16 %3 to i32, !dbg !488
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !490
  %conv10 = sext i16 %4 to i32, !dbg !490
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !491
  %conv11 = zext i16 %5 to i32, !dbg !491
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !492
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !492
  %div = sdiv i32 %conv10, %conv11, !dbg !492, !klee.check.div !123
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !493
  %conv12 = zext i16 %6 to i32, !dbg !493
  %mul = mul nsw i32 %div, %conv12, !dbg !494
  %sub = sub nsw i32 %conv9, %mul, !dbg !495
  %shl = shl i32 %sub, 1, !dbg !496
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !497
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !498
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !499
  %conv13 = zext i16 %8 to i32, !dbg !499
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !500
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !500
  %div14 = sdiv i32 %7, %conv13, !dbg !500, !klee.check.div !123
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !501
  %conv15 = sext i16 %9 to i32, !dbg !501
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !502
  %conv16 = zext i16 %10 to i32, !dbg !502
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !503
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !503
  %div17 = sdiv i32 %conv15, %conv16, !dbg !503, !klee.check.div !123
  %add = add nsw i32 %div14, %div17, !dbg !504
  store i32 %add, i32* %s32Temp1, align 4, !dbg !505
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !506
  %conv18 = trunc i32 %11 to i16, !dbg !506
  store i16 %conv18, i16* %retval, align 2, !dbg !507
  br label %return, !dbg !507

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !508
  ret i16 %12, !dbg !508
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !509 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !512, metadata !DIExpression()), !dbg !513
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !514, metadata !DIExpression()), !dbg !515
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !516, metadata !DIExpression()), !dbg !518
  store i32 0, i32* %u32Temp1, align 4, !dbg !518
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !519, metadata !DIExpression()), !dbg !520
  store i32 0, i32* %u32Temp2, align 4, !dbg !520
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !521, metadata !DIExpression()), !dbg !522
  store i32 0, i32* %u32Temp3, align 4, !dbg !522
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !523
  %conv = zext i16 %0 to i32, !dbg !523
  %cmp = icmp eq i32 %conv, 0, !dbg !525
  br i1 %cmp, label %if.then, label %if.else, !dbg !526

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !527
  br label %return, !dbg !527

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !529
  %conv2 = zext i16 %1 to i32, !dbg !529
  %shl = shl i32 %conv2, 16, !dbg !531
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !532
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !533
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !534
  %conv3 = zext i16 %3 to i32, !dbg !534
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !535
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !535
  %div = udiv i32 %2, %conv3, !dbg !535, !klee.check.div !123
  store i32 %div, i32* %u32Temp2, align 4, !dbg !536
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !537
  %add = add i32 %4, 128, !dbg !538
  %shr = lshr i32 %add, 8, !dbg !539
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !540
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !541
  %cmp4 = icmp ult i32 %5, 255, !dbg !543
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !544

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !545
  %conv7 = trunc i32 %6 to i8, !dbg !547
  store i8 %conv7, i8* %retval, align 1, !dbg !548
  br label %return, !dbg !548

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !549
  br label %return, !dbg !549

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !551
  ret i8 %7, !dbg !551
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !552 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !555, metadata !DIExpression()), !dbg !556
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !557, metadata !DIExpression()), !dbg !558
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !559, metadata !DIExpression()), !dbg !560
  store i32 0, i32* %s32Temp1, align 4, !dbg !560
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !561
  %conv = zext i16 %0 to i32, !dbg !561
  %and = and i32 %conv, 65535, !dbg !562
  %conv1 = trunc i32 %and to i16, !dbg !561
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !563
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !564
  %conv2 = zext i16 %1 to i32, !dbg !564
  %and3 = and i32 %conv2, 65535, !dbg !566
  %cmp = icmp eq i32 %and3, 0, !dbg !567
  br i1 %cmp, label %if.then, label %if.else8, !dbg !568

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !569
  %cmp5 = icmp sge i32 %2, 0, !dbg !572
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !573

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !574
  br label %return, !dbg !574

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !576
  br label %return, !dbg !576

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !578
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !580
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !581
  %conv9 = zext i16 %5 to i32, !dbg !581
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !582
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !582
  %div = sdiv i32 %4, %conv9, !dbg !582, !klee.check.div !123
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !583
  %conv10 = zext i16 %6 to i32, !dbg !583
  %mul = mul nsw i32 %div, %conv10, !dbg !584
  %sub = sub nsw i32 %3, %mul, !dbg !585
  %shl = shl i32 %sub, 1, !dbg !586
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !587
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !588
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !589
  %conv11 = zext i16 %8 to i32, !dbg !589
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !590
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !590
  %div12 = sdiv i32 %7, %conv11, !dbg !590, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !591
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !592
  %conv13 = zext i16 %10 to i32, !dbg !592
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !593
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !593
  %div14 = sdiv i32 %9, %conv13, !dbg !593, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !594
  store i32 %add, i32* %s32Temp1, align 4, !dbg !595
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !596
  %cmp15 = icmp slt i32 %11, 65535, !dbg !598
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !599

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !600
  %cmp18 = icmp sgt i32 %12, 0, !dbg !603
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !604

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !605
  %conv21 = trunc i32 %13 to i16, !dbg !607
  store i16 %conv21, i16* %retval, align 2, !dbg !608
  br label %return, !dbg !608

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !609
  br label %return, !dbg !609

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !611
  br label %return, !dbg !611

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !613
  ret i16 %14, !dbg !613
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !614 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !617, metadata !DIExpression()), !dbg !618
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !619, metadata !DIExpression()), !dbg !620
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !621, metadata !DIExpression()), !dbg !622
  store i32 0, i32* %u32Temp, align 4, !dbg !622
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !623
  %conv = zext i16 %0 to i32, !dbg !623
  %cmp = icmp eq i32 %conv, 0, !dbg !625
  br i1 %cmp, label %if.then, label %if.else, !dbg !626

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !627
  br label %return, !dbg !627

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !629
  %conv2 = zext i16 %1 to i32, !dbg !629
  %shl = shl i32 %conv2, 16, !dbg !631
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !632
  %conv3 = zext i16 %2 to i32, !dbg !632
  %shr = ashr i32 %conv3, 1, !dbg !633
  %add = add nsw i32 %shl, %shr, !dbg !634
  store i32 %add, i32* %u32Temp, align 4, !dbg !635
  %3 = load i32, i32* %u32Temp, align 4, !dbg !636
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !637
  %conv4 = zext i16 %4 to i32, !dbg !637
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !638
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !638
  %div = udiv i32 %3, %conv4, !dbg !638, !klee.check.div !123
  store i32 %div, i32* %u32Temp, align 4, !dbg !639
  %5 = load i32, i32* %u32Temp, align 4, !dbg !640
  %cmp5 = icmp ult i32 %5, 65535, !dbg !642
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !643

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !644
  %and = and i32 %6, 65535, !dbg !646
  %conv8 = trunc i32 %and to i16, !dbg !644
  store i16 %conv8, i16* %retval, align 2, !dbg !647
  br label %return, !dbg !647

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !648
  br label %return, !dbg !648

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !650
  ret i16 %7, !dbg !650
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !651 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !654, metadata !DIExpression()), !dbg !655
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !656, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !658, metadata !DIExpression()), !dbg !659
  store i32 0, i32* %u32Temp1, align 4, !dbg !659
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !660, metadata !DIExpression()), !dbg !661
  store i32 0, i32* %u32Temp2, align 4, !dbg !661
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !662
  %conv = zext i16 %0 to i32, !dbg !662
  %and = and i32 %conv, 65535, !dbg !663
  %conv1 = trunc i32 %and to i16, !dbg !662
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !664
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !665
  %conv2 = zext i16 %1 to i32, !dbg !665
  %cmp = icmp eq i32 %conv2, 0, !dbg !667
  br i1 %cmp, label %if.then, label %if.else, !dbg !668

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !669
  br label %return, !dbg !669

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !671
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !673
  %conv4 = zext i16 %3 to i32, !dbg !673
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !674
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !674
  %div = udiv i32 %2, %conv4, !dbg !674, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !675
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !676
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !677
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !678
  %conv5 = zext i16 %6 to i32, !dbg !678
  %mul = mul i32 %5, %conv5, !dbg !679
  %sub = sub i32 %4, %mul, !dbg !680
  %shl = shl i32 %sub, 1, !dbg !681
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !682
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !683
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !684
  %conv6 = zext i16 %8 to i32, !dbg !684
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !685
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !685
  %div7 = udiv i32 %7, %conv6, !dbg !685, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !686
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !687
  %conv8 = zext i16 %10 to i32, !dbg !687
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !688
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !688
  %div9 = udiv i32 %9, %conv8, !dbg !688, !klee.check.div !123
  %add = add i32 %div7, %div9, !dbg !689
  store i32 %add, i32* %u32Temp2, align 4, !dbg !690
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !691
  %cmp10 = icmp ult i32 %11, 65535, !dbg !693
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !694

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !695
  %and13 = and i32 %12, 65535, !dbg !697
  %conv14 = trunc i32 %and13 to i16, !dbg !695
  store i16 %conv14, i16* %retval, align 2, !dbg !698
  br label %return, !dbg !698

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !699
  br label %return, !dbg !699

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !701
  ret i16 %13, !dbg !701
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !702 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !705, metadata !DIExpression()), !dbg !706
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !707, metadata !DIExpression()), !dbg !708
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !709, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !711, metadata !DIExpression()), !dbg !712
  store i32 0, i32* %s32Result, align 4, !dbg !712
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !713, metadata !DIExpression()), !dbg !714
  store i32 0, i32* %s32Temp1, align 4, !dbg !714
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !715
  %conv = sext i16 %0 to i32, !dbg !715
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !716
  %conv1 = zext i16 %1 to i32, !dbg !716
  %mul = mul nsw i32 %conv, %conv1, !dbg !717
  store i32 %mul, i32* %s32Result, align 4, !dbg !718
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !719
  %conv2 = sext i16 %2 to i32, !dbg !719
  %cmp = icmp eq i32 %conv2, 0, !dbg !721
  br i1 %cmp, label %if.then, label %if.else7, !dbg !722

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !723
  %cmp4 = icmp slt i32 %3, 0, !dbg !726
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !727

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !728
  br label %return, !dbg !728

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !730
  br label %return, !dbg !730

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !732
  %5 = load i32, i32* %s32Result, align 4, !dbg !734
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !735
  %conv8 = sext i16 %6 to i32, !dbg !735
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !736
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !736
  %div = sdiv i32 %5, %conv8, !dbg !736, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !737
  %conv9 = sext i16 %7 to i32, !dbg !737
  %mul10 = mul nsw i32 %div, %conv9, !dbg !738
  %sub = sub nsw i32 %4, %mul10, !dbg !739
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !740
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !741
  %shl = shl i32 %8, 1, !dbg !742
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !743
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !744
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !745
  %conv11 = sext i16 %10 to i32, !dbg !745
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !746
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !746
  %div12 = sdiv i32 %9, %conv11, !dbg !746, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !747
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !748
  %conv13 = sext i16 %12 to i32, !dbg !748
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !749
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !749
  %div14 = sdiv i32 %11, %conv13, !dbg !749, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !750
  store i32 %add, i32* %s32Result, align 4, !dbg !751
  %13 = load i32, i32* %s32Result, align 4, !dbg !752
  %cmp15 = icmp slt i32 %13, 32767, !dbg !754
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !755

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !756
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !759
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !760

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !761
  %conv21 = trunc i32 %15 to i16, !dbg !763
  store i16 %conv21, i16* %retval, align 2, !dbg !764
  br label %return, !dbg !764

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !765
  br label %return, !dbg !765

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !767
  br label %return, !dbg !767

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !769
  ret i16 %16, !dbg !769
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !770 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !773, metadata !DIExpression()), !dbg !774
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !775, metadata !DIExpression()), !dbg !776
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !777, metadata !DIExpression()), !dbg !778
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !779, metadata !DIExpression()), !dbg !780
  store i32 0, i32* %s32Result, align 4, !dbg !780
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !781, metadata !DIExpression()), !dbg !782
  store i32 0, i32* %s32Temp1, align 4, !dbg !782
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !783
  %conv = zext i16 %0 to i32, !dbg !783
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !784
  %conv1 = sext i16 %1 to i32, !dbg !784
  %mul = mul nsw i32 %conv, %conv1, !dbg !785
  store i32 %mul, i32* %s32Result, align 4, !dbg !786
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !787
  %conv2 = zext i16 %2 to i32, !dbg !787
  %cmp = icmp eq i32 %conv2, 0, !dbg !789
  br i1 %cmp, label %if.then, label %if.else7, !dbg !790

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !791
  %cmp4 = icmp slt i32 %3, 0, !dbg !794
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !795

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !796
  br label %return, !dbg !796

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !798
  br label %return, !dbg !798

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !800
  %5 = load i32, i32* %s32Result, align 4, !dbg !802
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !803
  %conv8 = zext i16 %6 to i32, !dbg !803
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !804
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !804
  %div = sdiv i32 %5, %conv8, !dbg !804, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !805
  %conv9 = zext i16 %7 to i32, !dbg !805
  %mul10 = mul nsw i32 %div, %conv9, !dbg !806
  %sub = sub nsw i32 %4, %mul10, !dbg !807
  %shl = shl i32 %sub, 1, !dbg !808
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !809
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !810
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv11 = zext i16 %9 to i32, !dbg !811
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !812
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !812
  %div12 = sdiv i32 %8, %conv11, !dbg !812, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !813
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !814
  %conv13 = zext i16 %11 to i32, !dbg !814
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !815
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !815
  %div14 = sdiv i32 %10, %conv13, !dbg !815, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !816
  store i32 %add, i32* %s32Result, align 4, !dbg !817
  %12 = load i32, i32* %s32Result, align 4, !dbg !818
  %cmp15 = icmp slt i32 %12, 32767, !dbg !820
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !821

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !822
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !825
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !826

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !827
  %conv21 = trunc i32 %14 to i16, !dbg !829
  store i16 %conv21, i16* %retval, align 2, !dbg !830
  br label %return, !dbg !830

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !831
  br label %return, !dbg !831

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !833
  br label %return, !dbg !833

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !835
  ret i16 %15, !dbg !835
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !836 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !839, metadata !DIExpression()), !dbg !840
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !841, metadata !DIExpression()), !dbg !842
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !843, metadata !DIExpression()), !dbg !844
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !845, metadata !DIExpression()), !dbg !846
  store i32 0, i32* %u32Result, align 4, !dbg !846
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !847, metadata !DIExpression()), !dbg !848
  store i32 0, i32* %u32Temp1, align 4, !dbg !848
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !849, metadata !DIExpression()), !dbg !850
  store i32 0, i32* %s32Result, align 4, !dbg !850
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !851, metadata !DIExpression()), !dbg !852
  store i32 0, i32* %s32Temp1, align 4, !dbg !852
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !853
  %conv = sext i16 %0 to i32, !dbg !853
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !854
  %conv1 = zext i16 %1 to i32, !dbg !854
  %mul = mul nsw i32 %conv, %conv1, !dbg !855
  store i32 %mul, i32* %s32Result, align 4, !dbg !856
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !857
  %conv2 = sext i16 %2 to i32, !dbg !857
  %cmp = icmp eq i32 %conv2, 0, !dbg !859
  br i1 %cmp, label %if.then, label %if.else7, !dbg !860

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !861
  %cmp4 = icmp sge i32 %3, 0, !dbg !864
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !865

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !866
  br label %return, !dbg !866

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !868
  br label %return, !dbg !868

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !870
  %5 = load i32, i32* %s32Result, align 4, !dbg !872
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !873
  %conv8 = sext i16 %6 to i32, !dbg !873
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !874
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !874
  %div = sdiv i32 %5, %conv8, !dbg !874, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !875
  %conv9 = sext i16 %7 to i32, !dbg !875
  %mul10 = mul nsw i32 %div, %conv9, !dbg !876
  %sub = sub nsw i32 %4, %mul10, !dbg !877
  %shl = shl i32 %sub, 1, !dbg !878
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !879
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !880
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !881
  %conv11 = sext i16 %9 to i32, !dbg !881
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !882
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !882
  %div12 = sdiv i32 %8, %conv11, !dbg !882, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !883
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !884
  %conv13 = sext i16 %11 to i32, !dbg !884
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !885
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !885
  %div14 = sdiv i32 %10, %conv13, !dbg !885, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !886
  store i32 %add, i32* %s32Result, align 4, !dbg !887
  %12 = load i32, i32* %s32Result, align 4, !dbg !888
  %cmp15 = icmp slt i32 %12, 65535, !dbg !890
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !891

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !892
  %cmp18 = icmp sgt i32 %13, 0, !dbg !895
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !896

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !897
  %conv21 = trunc i32 %14 to i16, !dbg !899
  store i16 %conv21, i16* %retval, align 2, !dbg !900
  br label %return, !dbg !900

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !901
  br label %return, !dbg !901

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !903
  br label %return, !dbg !903

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !905
  ret i16 %15, !dbg !905
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !906 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !909, metadata !DIExpression()), !dbg !910
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !911, metadata !DIExpression()), !dbg !912
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !913, metadata !DIExpression()), !dbg !914
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !915, metadata !DIExpression()), !dbg !916
  store i32 0, i32* %s32Result, align 4, !dbg !916
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !917, metadata !DIExpression()), !dbg !918
  store i32 0, i32* %s32Temp1, align 4, !dbg !918
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !919
  %conv = sext i16 %0 to i32, !dbg !919
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !920
  %conv1 = zext i16 %1 to i32, !dbg !920
  %mul = mul nsw i32 %conv, %conv1, !dbg !921
  store i32 %mul, i32* %s32Result, align 4, !dbg !922
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !923
  %conv2 = zext i16 %2 to i32, !dbg !923
  %cmp = icmp eq i32 %conv2, 0, !dbg !925
  br i1 %cmp, label %if.then, label %if.else7, !dbg !926

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !927
  %cmp4 = icmp sge i32 %3, 0, !dbg !930
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !931

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !932
  br label %return, !dbg !932

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !934
  br label %return, !dbg !934

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !936
  %5 = load i32, i32* %s32Result, align 4, !dbg !938
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !939
  %conv8 = zext i16 %6 to i32, !dbg !939
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !940
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !940
  %div = sdiv i32 %5, %conv8, !dbg !940, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !941
  %conv9 = zext i16 %7 to i32, !dbg !941
  %mul10 = mul nsw i32 %div, %conv9, !dbg !942
  %sub = sub nsw i32 %4, %mul10, !dbg !943
  %shl = shl i32 %sub, 1, !dbg !944
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !945
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !946
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !947
  %conv11 = zext i16 %9 to i32, !dbg !947
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !948
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !948
  %div12 = sdiv i32 %8, %conv11, !dbg !948, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !949
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !950
  %conv13 = zext i16 %11 to i32, !dbg !950
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !951
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !951
  %div14 = sdiv i32 %10, %conv13, !dbg !951, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !952
  store i32 %add, i32* %s32Result, align 4, !dbg !953
  %12 = load i32, i32* %s32Result, align 4, !dbg !954
  %cmp15 = icmp slt i32 %12, 65535, !dbg !956
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !957

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !958
  %cmp18 = icmp sgt i32 %13, 0, !dbg !961
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !962

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !963
  %conv21 = trunc i32 %14 to i16, !dbg !965
  store i16 %conv21, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !969
  br label %return, !dbg !969

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !971
  ret i16 %15, !dbg !971
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !972 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !975, metadata !DIExpression()), !dbg !976
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !977, metadata !DIExpression()), !dbg !978
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !979, metadata !DIExpression()), !dbg !980
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !981, metadata !DIExpression()), !dbg !982
  store i32 0, i32* %u32Temp1, align 4, !dbg !982
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !983, metadata !DIExpression()), !dbg !984
  store i16 0, i16* %u16TempDenom, align 2, !dbg !984
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !985
  %conv = zext i16 %0 to i32, !dbg !985
  %cmp = icmp eq i32 %conv, 0, !dbg !987
  br i1 %cmp, label %if.then, label %if.else, !dbg !988

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !989
  br label %return, !dbg !989

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !991
  %conv2 = zext i16 %1 to i32, !dbg !991
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !993
  %conv3 = zext i16 %2 to i32, !dbg !993
  %mul = mul nsw i32 %conv2, %conv3, !dbg !994
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !995
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !996
  %conv4 = zext i16 %3 to i32, !dbg !996
  %shr = ashr i32 %conv4, 1, !dbg !997
  %conv5 = trunc i32 %shr to i16, !dbg !996
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !998
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !999
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1000
  %conv6 = zext i16 %5 to i32, !dbg !1000
  %add = add i32 %4, %conv6, !dbg !1001
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1002
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1003
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1004
  %conv7 = zext i16 %7 to i32, !dbg !1004
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1005
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1005
  %div = udiv i32 %6, %conv7, !dbg !1005, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1006
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1007
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1009
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1010

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1011
  %and = and i32 %9, 65535, !dbg !1013
  %conv11 = trunc i32 %and to i16, !dbg !1014
  store i16 %conv11, i16* %retval, align 2, !dbg !1015
  br label %return, !dbg !1015

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1016
  br label %return, !dbg !1016

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1018
  ret i16 %10, !dbg !1018
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1019 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 0, i32* %u32Temp1, align 4, !dbg !1029
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1030
  %cmp = icmp eq i32 %0, 0, !dbg !1032
  br i1 %cmp, label %if.then, label %if.else, !dbg !1033

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1034
  br label %return, !dbg !1034

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1036
  %conv = zext i16 %1 to i32, !dbg !1036
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1038
  %conv1 = zext i16 %2 to i32, !dbg !1038
  %mul = mul nsw i32 %conv, %conv1, !dbg !1039
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1040
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1041
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1041
  %div = udiv i32 %mul, %3, !dbg !1041, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1042
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1043
  %conv2 = zext i16 %4 to i32, !dbg !1043
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1045
  %conv3 = zext i16 %5 to i32, !dbg !1045
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1046
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1047
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1048
  %mul5 = mul i32 %6, %7, !dbg !1049
  %sub = sub i32 %mul4, %mul5, !dbg !1050
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1051
  %div6 = udiv i32 %8, 2, !dbg !1052
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1053
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1054

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1055
  %inc = add i32 %9, 1, !dbg !1055
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1055
  br label %if.end, !dbg !1057

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1058
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1060
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1061

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1062
  %and = and i32 %11, 65535, !dbg !1064
  %conv13 = trunc i32 %and to i16, !dbg !1065
  store i16 %conv13, i16* %retval, align 2, !dbg !1066
  br label %return, !dbg !1066

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1067
  br label %return, !dbg !1067

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1069
  ret i16 %12, !dbg !1069
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1070 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i32 0, i32* %u32Temp1, align 4, !dbg !1078
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1079
  %conv = zext i16 %0 to i32, !dbg !1079
  %cmp = icmp eq i32 %conv, 0, !dbg !1081
  br i1 %cmp, label %if.then, label %if.else, !dbg !1082

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1083
  br label %return, !dbg !1083

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1085
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1087
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1088
  %conv2 = zext i16 %3 to i32, !dbg !1088
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1089
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1089
  %div = udiv i32 %2, %conv2, !dbg !1089, !klee.check.div !123
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1090
  %conv3 = zext i16 %4 to i32, !dbg !1090
  %mul = mul i32 %div, %conv3, !dbg !1091
  %sub = sub i32 %1, %mul, !dbg !1092
  %shl = shl i32 %sub, 1, !dbg !1093
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1094
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1095
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1096
  %conv4 = zext i16 %6 to i32, !dbg !1096
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1097
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1097
  %div5 = udiv i32 %5, %conv4, !dbg !1097, !klee.check.div !123
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1098
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1099
  %conv6 = zext i16 %8 to i32, !dbg !1099
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1100
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1100
  %div7 = udiv i32 %7, %conv6, !dbg !1100, !klee.check.div !123
  %add = add i32 %div5, %div7, !dbg !1101
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1102
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1103
  store i32 %9, i32* %retval, align 4, !dbg !1104
  br label %return, !dbg !1104

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1105
  ret i32 %10, !dbg !1105
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1106 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1109, metadata !DIExpression()), !dbg !1110
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1111, metadata !DIExpression()), !dbg !1112
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1113, metadata !DIExpression()), !dbg !1114
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1115, metadata !DIExpression()), !dbg !1116
  store i32 0, i32* %s32Temp1, align 4, !dbg !1116
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1117, metadata !DIExpression()), !dbg !1118
  store i32 0, i32* %s32Temp2, align 4, !dbg !1118
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1119, metadata !DIExpression()), !dbg !1120
  store i32 0, i32* %s32Temp3, align 4, !dbg !1120
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1121
  %conv = sext i16 %0 to i32, !dbg !1121
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1122
  %conv1 = sext i16 %1 to i32, !dbg !1122
  %mul = mul nsw i32 %conv, %conv1, !dbg !1123
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1124
  %2 = load i16, i16* %div.addr, align 2, !dbg !1125
  %conv2 = sext i16 %2 to i32, !dbg !1125
  %cmp = icmp eq i32 %conv2, 0, !dbg !1127
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1128

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1129
  %cmp4 = icmp slt i32 %3, 0, !dbg !1132
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1133

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1134
  br label %return, !dbg !1134

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1136
  br label %return, !dbg !1136

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1138
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1140
  %6 = load i16, i16* %div.addr, align 2, !dbg !1141
  %conv8 = sext i16 %6 to i32, !dbg !1141
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1142
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1142
  %div9 = sdiv i32 %5, %conv8, !dbg !1142, !klee.check.div !123
  %7 = load i16, i16* %div.addr, align 2, !dbg !1143
  %conv10 = sext i16 %7 to i32, !dbg !1143
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1144
  %sub = sub nsw i32 %4, %mul11, !dbg !1145
  %shl = shl i32 %sub, 1, !dbg !1146
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1147
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1148
  %9 = load i16, i16* %div.addr, align 2, !dbg !1149
  %conv12 = sext i16 %9 to i32, !dbg !1149
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1150
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1150
  %div13 = sdiv i32 %8, %conv12, !dbg !1150, !klee.check.div !123
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1151
  %11 = load i16, i16* %div.addr, align 2, !dbg !1152
  %conv14 = sext i16 %11 to i32, !dbg !1152
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1153
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1153
  %div15 = sdiv i32 %10, %conv14, !dbg !1153, !klee.check.div !123
  %add = add nsw i32 %div13, %div15, !dbg !1154
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1155
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1156
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1158
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1159

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1160
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1163
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1164

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1165
  %conv22 = trunc i32 %14 to i16, !dbg !1167
  store i16 %conv22, i16* %retval, align 2, !dbg !1168
  br label %return, !dbg !1168

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1169
  br label %return, !dbg !1169

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1171
  br label %return, !dbg !1171

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1173
  ret i16 %15, !dbg !1173
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1174 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1177, metadata !DIExpression()), !dbg !1178
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1179, metadata !DIExpression()), !dbg !1180
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1181, metadata !DIExpression()), !dbg !1182
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1183, metadata !DIExpression()), !dbg !1184
  store i32 0, i32* %s32Result, align 4, !dbg !1184
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1185, metadata !DIExpression()), !dbg !1186
  store i32 0, i32* %s32Temp1, align 4, !dbg !1186
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1187
  %conv = sext i16 %0 to i32, !dbg !1187
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1188
  %conv1 = sext i16 %1 to i32, !dbg !1188
  %mul = mul nsw i32 %conv, %conv1, !dbg !1189
  store i32 %mul, i32* %s32Result, align 4, !dbg !1190
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1191
  %conv2 = zext i16 %2 to i32, !dbg !1191
  %cmp = icmp eq i32 %conv2, 0, !dbg !1193
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1194

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1195
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1198
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1199

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1200
  br label %return, !dbg !1200

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1202
  %cmp7 = icmp eq i32 %4, 0, !dbg !1204
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1205

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1206
  br label %return, !dbg !1206

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1208
  br label %return, !dbg !1208

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1210
  %6 = load i32, i32* %s32Result, align 4, !dbg !1212
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1213
  %conv12 = zext i16 %7 to i32, !dbg !1213
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1214
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1214
  %div = sdiv i32 %6, %conv12, !dbg !1214, !klee.check.div !123
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1215
  %conv13 = zext i16 %8 to i32, !dbg !1215
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1216
  %sub = sub nsw i32 %5, %mul14, !dbg !1217
  %shl = shl i32 %sub, 1, !dbg !1218
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1219
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1220
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1221
  %conv15 = zext i16 %10 to i32, !dbg !1221
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1222
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1222
  %div16 = sdiv i32 %9, %conv15, !dbg !1222, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !1223
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1224
  %conv17 = zext i16 %12 to i32, !dbg !1224
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1225
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1225
  %div18 = sdiv i32 %11, %conv17, !dbg !1225, !klee.check.div !123
  %add = add nsw i32 %div16, %div18, !dbg !1226
  store i32 %add, i32* %s32Result, align 4, !dbg !1227
  %13 = load i32, i32* %s32Result, align 4, !dbg !1228
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1230
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1231

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1232
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1235
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1236

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1237
  %conv25 = trunc i32 %15 to i16, !dbg !1239
  store i16 %conv25, i16* %retval, align 2, !dbg !1240
  br label %return, !dbg !1240

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1241
  br label %return, !dbg !1241

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1243
  br label %return, !dbg !1243

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1245
  ret i16 %16, !dbg !1245
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1246 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1249, metadata !DIExpression()), !dbg !1250
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1251, metadata !DIExpression()), !dbg !1252
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1253, metadata !DIExpression()), !dbg !1254
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1255
  %cmp = icmp eq i32 %0, 0, !dbg !1257
  br i1 %cmp, label %if.then, label %if.else, !dbg !1258

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1259
  br label %return, !dbg !1259

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1261
  %cmp1 = icmp sle i32 %1, 0, !dbg !1264
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1265

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1266
  br label %return, !dbg !1266

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1268
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1270
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1271
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1272
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1272
  %div = udiv i32 %3, %4, !dbg !1272, !klee.check.div !123
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1273
  %mul = mul i32 %div, %5, !dbg !1274
  %sub = sub i32 %2, %mul, !dbg !1275
  %shl = shl i32 %sub, 1, !dbg !1276
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1277
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1278
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1279
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1280
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1280
  %div4 = udiv i32 %6, %7, !dbg !1280, !klee.check.div !123
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1281
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1282
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1283
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1283
  %div5 = udiv i32 %8, %9, !dbg !1283, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1284
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1285
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1286
  store i32 %10, i32* %retval, align 4, !dbg !1287
  br label %return, !dbg !1287

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1288
  ret i32 %11, !dbg !1288
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1289 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1292, metadata !DIExpression()), !dbg !1293
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1294, metadata !DIExpression()), !dbg !1295
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1296, metadata !DIExpression()), !dbg !1297
  store i32 0, i32* %s32Temp1, align 4, !dbg !1297
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1298
  %cmp = icmp eq i32 %0, 0, !dbg !1300
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1301

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1302
  %cmp1 = icmp sge i32 %1, 0, !dbg !1305
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1306

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1307
  br label %return, !dbg !1307

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1309
  br label %return, !dbg !1309

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1311
  %cmp4 = icmp sge i32 %2, 0, !dbg !1314
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1315

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1320
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1320
  %div = udiv i32 %4, %5, !dbg !1320, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %mul = mul i32 %div, %6, !dbg !1322
  %sub = sub i32 %3, %mul, !dbg !1323
  %shl = shl i32 %sub, 1, !dbg !1324
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1325
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1326
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1328
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1328
  %div6 = udiv i32 %7, %8, !dbg !1328, !klee.check.div !123
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1329
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1330
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1331
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1331
  %div7 = udiv i32 %9, %10, !dbg !1331, !klee.check.div !123
  %add = add i32 %div6, %div7, !dbg !1332
  store i32 %add, i32* %retval, align 4, !dbg !1333
  br label %return, !dbg !1333

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1334
  br label %return, !dbg !1334

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1336
  ret i32 %11, !dbg !1336
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1337 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1340, metadata !DIExpression()), !dbg !1341
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1342, metadata !DIExpression()), !dbg !1343
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1344, metadata !DIExpression()), !dbg !1345
  store i32 0, i32* %u32Temp1, align 4, !dbg !1345
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1346, metadata !DIExpression()), !dbg !1347
  store i32 0, i32* %u32Temp2, align 4, !dbg !1347
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1348
  %cmp = icmp eq i32 %0, 0, !dbg !1350
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1351

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1352
  %cmp1 = icmp slt i32 %1, 0, !dbg !1355
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1356

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1357
  br label %return, !dbg !1357

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1359
  br label %return, !dbg !1359

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1361
  %cmp4 = icmp sge i32 %2, 0, !dbg !1364
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1365

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1366
  %cmp6 = icmp eq i32 %3, 0, !dbg !1369
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1370

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1371
  br label %return, !dbg !1371

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1373
  %cmp9 = icmp sle i32 %4, 0, !dbg !1376
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1377

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1378
  br label %return, !dbg !1378

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1380
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1382
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1383
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1384
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1384
  %div = sdiv i32 %6, %7, !dbg !1384, !klee.check.div !123
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %mul = mul nsw i32 %div, %8, !dbg !1386
  %sub = sub nsw i32 %5, %mul, !dbg !1387
  %shl = shl i32 %sub, 1, !dbg !1388
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1389
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1390
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1391
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1392
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1392
  %div12 = udiv i32 %9, %10, !dbg !1392, !klee.check.div !123
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1393
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1394
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1395
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1395
  %div13 = sdiv i32 %11, %12, !dbg !1395, !klee.check.div !123
  %add = add i32 %div12, %div13, !dbg !1396
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1397
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1398
  store i32 %13, i32* %retval, align 4, !dbg !1399
  br label %return, !dbg !1399

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1403
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1404

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1407
  %sub18 = sub nsw i32 0, %15, !dbg !1409
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1410
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1411
  %sub19 = sub nsw i32 0, %16, !dbg !1412
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1413
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1414
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1415
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1416
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1417
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1417
  %div20 = sdiv i32 %18, %19, !dbg !1417, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %mul21 = mul nsw i32 %div20, %20, !dbg !1419
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1420
  %shl23 = shl i32 %sub22, 1, !dbg !1421
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1422
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1423
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1424
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1425
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1425
  %div24 = udiv i32 %21, %22, !dbg !1425, !klee.check.div !123
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1426
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1428
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1428
  %div25 = sdiv i32 %23, %24, !dbg !1428, !klee.check.div !123
  %add26 = add i32 %div24, %div25, !dbg !1429
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1430
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1431
  store i32 %25, i32* %retval, align 4, !dbg !1432
  br label %return, !dbg !1432

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1433
  ret i32 %26, !dbg !1433
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1434 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1437, metadata !DIExpression()), !dbg !1438
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1439, metadata !DIExpression()), !dbg !1440
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1441, metadata !DIExpression()), !dbg !1442
  store i32 0, i32* %u32Temp1, align 4, !dbg !1442
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1443, metadata !DIExpression()), !dbg !1444
  store i32 0, i32* %u32Temp2, align 4, !dbg !1444
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1445, metadata !DIExpression()), !dbg !1446
  store i32 0, i32* %u32Temp3, align 4, !dbg !1446
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1447, metadata !DIExpression()), !dbg !1448
  store i32 0, i32* %numerator_old, align 4, !dbg !1448
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1449
  %cmp = icmp eq i32 %0, 0, !dbg !1451
  br i1 %cmp, label %if.then, label %if.else, !dbg !1452

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1453
  br label %return, !dbg !1453

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1455
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1458
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1460
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1460
  %div = udiv i32 %3, %4, !dbg !1460, !klee.check.div !123
  %mul = mul i32 %2, %div, !dbg !1461
  %sub = sub i32 %1, %mul, !dbg !1462
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1463
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1464
  %and = and i32 %5, 1, !dbg !1466
  %cmp1 = icmp eq i32 %and, 0, !dbg !1467
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1468

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %shr = lshr i32 %6, 1, !dbg !1471
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1472
  br label %if.end, !dbg !1473

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1474
  %shr4 = lshr i32 %7, 1, !dbg !1476
  %add = add i32 %shr4, 1, !dbg !1477
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1478
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1479
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1481
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1482
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1483

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1484
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1487
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1487
  %div7 = udiv i32 %10, %11, !dbg !1487, !klee.check.div !123
  store i32 %div7, i32* %retval, align 4, !dbg !1488
  br label %return, !dbg !1488

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1489
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1491
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1492
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1492
  %div9 = udiv i32 %12, %13, !dbg !1492, !klee.check.div !123
  %add10 = add i32 %div9, 1, !dbg !1493
  store i32 %add10, i32* %retval, align 4, !dbg !1494
  br label %return, !dbg !1494

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1495
  ret i32 %14, !dbg !1495
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1496 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1499, metadata !DIExpression()), !dbg !1500
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1501, metadata !DIExpression()), !dbg !1502
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1503, metadata !DIExpression()), !dbg !1504
  store i32 0, i32* %u32Temp1, align 4, !dbg !1504
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1505, metadata !DIExpression()), !dbg !1506
  store i32 0, i32* %u32Temp2, align 4, !dbg !1506
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1507
  %cmp = icmp sle i32 %0, 0, !dbg !1509
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1510

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1511
  %cmp1 = icmp sge i32 %1, 0, !dbg !1514
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1515

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1516
  br label %return, !dbg !1516

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %sub = sub nsw i32 0, %2, !dbg !1520
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1521
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1522
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1524
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1525
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1525
  %div = udiv i32 %4, %5, !dbg !1525, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1526
  %mul = mul i32 %div, %6, !dbg !1527
  %sub3 = sub i32 %3, %mul, !dbg !1528
  %shl = shl i32 %sub3, 1, !dbg !1529
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1530
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1531
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1532
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1533
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1533
  %div4 = udiv i32 %7, %8, !dbg !1533, !klee.check.div !123
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1534
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1535
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1536
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1536
  %div5 = udiv i32 %9, %10, !dbg !1536, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1537
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1538
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1539
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1541
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1542

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1543
  %sub8 = sub i32 0, %12, !dbg !1545
  store i32 %sub8, i32* %retval, align 4, !dbg !1546
  br label %return, !dbg !1546

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1547
  br label %return, !dbg !1547

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1549
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1551
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1552
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1553
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1553
  %div11 = udiv i32 %14, %15, !dbg !1553, !klee.check.div !123
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1554
  %mul12 = mul i32 %div11, %16, !dbg !1555
  %sub13 = sub i32 %13, %mul12, !dbg !1556
  %shl14 = shl i32 %sub13, 1, !dbg !1557
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1558
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1559
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1560
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1561
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1561
  %div15 = udiv i32 %17, %18, !dbg !1561, !klee.check.div !123
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1562
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1563
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1564
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1564
  %div16 = udiv i32 %19, %20, !dbg !1564, !klee.check.div !123
  %add17 = add i32 %div15, %div16, !dbg !1565
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1566
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1567
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1569
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1570

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1571
  store i32 %22, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1574
  br label %return, !dbg !1574

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1576
  ret i32 %23, !dbg !1576
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1577 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1580, metadata !DIExpression()), !dbg !1581
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1582, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 0, i32* %s32Temp1, align 4, !dbg !1585
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1586, metadata !DIExpression()), !dbg !1587
  store i32 0, i32* %s32Temp2, align 4, !dbg !1587
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1588, metadata !DIExpression()), !dbg !1589
  store i32 0, i32* %u32Temp0, align 4, !dbg !1589
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1590, metadata !DIExpression()), !dbg !1591
  store i32 0, i32* %u32Temp1, align 4, !dbg !1591
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 0, i32* %u32Temp2, align 4, !dbg !1593
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1594
  %cmp = icmp eq i32 %0, 0, !dbg !1596
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1597

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1598
  %cmp1 = icmp slt i32 %1, 0, !dbg !1601
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1602

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1603
  br label %return, !dbg !1603

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1605
  br label %return, !dbg !1605

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1607
  %cmp4 = icmp sle i32 %2, 0, !dbg !1610
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1611

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1612
  %sub = sub nsw i32 0, %3, !dbg !1614
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1615
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1616
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1617
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1618
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1618
  %div = udiv i32 %4, %5, !dbg !1618, !klee.check.div !123
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1619
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1620
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1621
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1622
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1623
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1623
  %div6 = udiv i32 %7, %8, !dbg !1623, !klee.check.div !123
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %mul = mul i32 %div6, %9, !dbg !1625
  %sub7 = sub i32 %6, %mul, !dbg !1626
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1627
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1628
  %and = and i32 %10, 1, !dbg !1630
  %cmp8 = icmp eq i32 %and, 0, !dbg !1631
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1632

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %shr = lshr i32 %11, 1, !dbg !1635
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1636
  br label %if.end, !dbg !1637

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1638
  %shr11 = lshr i32 %12, 1, !dbg !1640
  %add = add i32 %shr11, 1, !dbg !1641
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1642
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1643
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1645
  %cmp12 = icmp ult i32 %13, %14, !dbg !1646
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1647

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1648
  %neg = xor i32 %15, -1, !dbg !1650
  %add14 = add i32 %neg, 1, !dbg !1651
  store i32 %add14, i32* %retval, align 4, !dbg !1652
  br label %return, !dbg !1652

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1653
  %add16 = add i32 %16, 1, !dbg !1655
  %neg17 = xor i32 %add16, -1, !dbg !1656
  %add18 = add i32 %neg17, 1, !dbg !1657
  store i32 %add18, i32* %retval, align 4, !dbg !1658
  br label %return, !dbg !1658

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1659
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1661
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1662
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1663
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1663
  %div20 = udiv i32 %18, %19, !dbg !1663, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1664
  %mul21 = mul i32 %div20, %20, !dbg !1665
  %sub22 = sub i32 %17, %mul21, !dbg !1666
  %shl = shl i32 %sub22, 1, !dbg !1667
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1668
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1669
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1670
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1671
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1671
  %div23 = udiv i32 %21, %22, !dbg !1671, !klee.check.div !123
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1672
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1673
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1674
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1674
  %div24 = udiv i32 %23, %24, !dbg !1674, !klee.check.div !123
  %add25 = add i32 %div23, %div24, !dbg !1675
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1676
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1677
  store i32 %25, i32* %retval, align 4, !dbg !1678
  br label %return, !dbg !1678

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1679
  ret i32 %26, !dbg !1679
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1680 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1683, metadata !DIExpression()), !dbg !1684
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1685, metadata !DIExpression()), !dbg !1686
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1687, metadata !DIExpression()), !dbg !1688
  store i32 0, i32* %s32Temp1, align 4, !dbg !1688
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1689, metadata !DIExpression()), !dbg !1690
  store i32 0, i32* %s32Temp2, align 4, !dbg !1690
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1691, metadata !DIExpression()), !dbg !1692
  store i32 0, i32* %denominator_prime, align 4, !dbg !1692
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1693, metadata !DIExpression()), !dbg !1694
  store i32 0, i32* %u32Temp1, align 4, !dbg !1694
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1695, metadata !DIExpression()), !dbg !1696
  store i32 0, i32* %u32Temp2, align 4, !dbg !1696
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1697, metadata !DIExpression()), !dbg !1698
  store i32 0, i32* %u32numerator, align 4, !dbg !1698
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1699, metadata !DIExpression()), !dbg !1700
  store i32 0, i32* %u32denominator, align 4, !dbg !1700
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1701
  %cmp = icmp slt i32 %0, 0, !dbg !1703
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1704

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1705
  %cmp1 = icmp sle i32 %1, 0, !dbg !1708
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1709

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1710
  %cmp3 = icmp sge i32 %2, 0, !dbg !1713
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1714

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1715
  br label %return, !dbg !1715

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1717
  %sub = sub nsw i32 0, %3, !dbg !1719
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1720
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1721
  %sub5 = sub nsw i32 0, %4, !dbg !1722
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1723
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1724
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1725
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1726
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1727
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1727
  %div = udiv i32 %6, %7, !dbg !1727, !klee.check.div !123
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1728
  %mul = mul i32 %div, %8, !dbg !1729
  %sub6 = sub i32 %5, %mul, !dbg !1730
  %shl = shl i32 %sub6, 1, !dbg !1731
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1732
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1733
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1734
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1735
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1735
  %div7 = udiv i32 %9, %10, !dbg !1735, !klee.check.div !123
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1736
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1737
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1738
  %div8 = udiv i32 %11, %12, !dbg !1738, !klee.check.div !123
  %add = add i32 %div7, %div8, !dbg !1739
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1740
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1741
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1743
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1744

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1745
  store i32 %14, i32* %retval, align 4, !dbg !1747
  br label %return, !dbg !1747

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1748
  br label %return, !dbg !1748

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1750
  %neg = xor i32 %15, -1, !dbg !1752
  %add13 = add nsw i32 %neg, 1, !dbg !1753
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1754
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1755
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1756
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1757
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1758
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1758
  %div14 = udiv i32 %17, %18, !dbg !1758, !klee.check.div !123
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1759
  %mul15 = mul i32 %div14, %19, !dbg !1760
  %sub16 = sub i32 %16, %mul15, !dbg !1761
  %shl17 = shl i32 %sub16, 1, !dbg !1762
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1763
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1764
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1766
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1766
  %div18 = udiv i32 %20, %21, !dbg !1766, !klee.check.div !123
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1767
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1768
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1769
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1769
  %div19 = sdiv i32 %22, %23, !dbg !1769, !klee.check.div !123
  %add20 = add i32 %div18, %div19, !dbg !1770
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1771
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1772
  %neg21 = xor i32 %24, -1, !dbg !1773
  %add22 = add nsw i32 %neg21, 1, !dbg !1774
  store i32 %add22, i32* %retval, align 4, !dbg !1775
  br label %return, !dbg !1775

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1776
  %cmp24 = icmp sle i32 %25, 0, !dbg !1779
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1780

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1781
  %cmp26 = icmp sge i32 %26, 0, !dbg !1784
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1785

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1786
  br label %return, !dbg !1786

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %neg29 = xor i32 %27, -1, !dbg !1790
  %add30 = add nsw i32 %neg29, 1, !dbg !1791
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1792
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1793
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1794
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1795
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1796
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1796
  %div31 = udiv i32 %29, %30, !dbg !1796, !klee.check.div !123
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1797
  %mul32 = mul i32 %div31, %31, !dbg !1798
  %sub33 = sub i32 %28, %mul32, !dbg !1799
  %shl34 = shl i32 %sub33, 1, !dbg !1800
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1801
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1802
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1803
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1804
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1804
  %div35 = udiv i32 %32, %33, !dbg !1804, !klee.check.div !123
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1805
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1806
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1807
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1807
  %div36 = udiv i32 %34, %35, !dbg !1807, !klee.check.div !123
  %add37 = add i32 %div35, %div36, !dbg !1808
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1809
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1810
  %neg38 = xor i32 %36, -1, !dbg !1811
  %add39 = add nsw i32 %neg38, 1, !dbg !1812
  store i32 %add39, i32* %retval, align 4, !dbg !1813
  br label %return, !dbg !1813

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1814
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1816
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1817
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1818
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1818
  %div41 = sdiv i32 %38, %39, !dbg !1818, !klee.check.div !123
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1819
  %mul42 = mul nsw i32 %div41, %40, !dbg !1820
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1821
  %shl44 = shl i32 %sub43, 1, !dbg !1822
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1823
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1824
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1825
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1826
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1826
  %div45 = sdiv i32 %41, %42, !dbg !1826, !klee.check.div !123
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1827
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1828
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1829
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1829
  %div46 = udiv i32 %43, %44, !dbg !1829, !klee.check.div !123
  %add47 = add i32 %div45, %div46, !dbg !1830
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1831
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1832
  store i32 %45, i32* %retval, align 4, !dbg !1833
  br label %return, !dbg !1833

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1834
  ret i32 %46, !dbg !1834
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1835 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1838, metadata !DIExpression()), !dbg !1839
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1840, metadata !DIExpression()), !dbg !1841
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1842, metadata !DIExpression()), !dbg !1843
  store i32 0, i32* %numerator_prime, align 4, !dbg !1843
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1844, metadata !DIExpression()), !dbg !1845
  store i32 0, i32* %u32Temp1, align 4, !dbg !1845
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1846, metadata !DIExpression()), !dbg !1847
  store i32 0, i32* %u32Temp2, align 4, !dbg !1847
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1848, metadata !DIExpression()), !dbg !1849
  store i32 0, i32* %u32Temp3, align 4, !dbg !1849
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1850, metadata !DIExpression()), !dbg !1851
  store i32 0, i32* %s32Temp1, align 4, !dbg !1851
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1852, metadata !DIExpression()), !dbg !1853
  store i32 0, i32* %s32Temp2, align 4, !dbg !1853
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1854, metadata !DIExpression()), !dbg !1855
  store i32 0, i32* %s32Temp3, align 4, !dbg !1855
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1856
  %cmp = icmp eq i32 %0, 0, !dbg !1858
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1859

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1860
  %cmp1 = icmp slt i32 %1, 0, !dbg !1863
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1864

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1865
  br label %return, !dbg !1865

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1867
  br label %return, !dbg !1867

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1869
  %cmp4 = icmp slt i32 %2, 0, !dbg !1872
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1873

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1874
  %sub = sub nsw i32 0, %3, !dbg !1876
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1877
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1878
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1879
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1880
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1880
  %div = udiv i32 %4, %5, !dbg !1880, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1881
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1882
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1883
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1884
  %mul = mul i32 %7, %8, !dbg !1885
  %sub6 = sub i32 %6, %mul, !dbg !1886
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1887
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1888
  %and = and i32 %9, 1, !dbg !1890
  %cmp7 = icmp eq i32 %and, 0, !dbg !1891
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1892

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1893
  %shr = lshr i32 %10, 1, !dbg !1895
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1896
  br label %if.end, !dbg !1897

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1898
  %shr10 = lshr i32 %11, 1, !dbg !1900
  %add = add i32 %shr10, 1, !dbg !1901
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1902
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1903
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1905
  %cmp11 = icmp ult i32 %12, %13, !dbg !1906
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1907

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1908
  %neg = xor i32 %14, -1, !dbg !1910
  %add13 = add i32 %neg, 1, !dbg !1911
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1912
  br label %if.end18, !dbg !1913

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1914
  %add15 = add i32 %15, 1, !dbg !1916
  %neg16 = xor i32 %add15, -1, !dbg !1917
  %add17 = add i32 %neg16, 1, !dbg !1918
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1919
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1920
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1922
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1923

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1924
  %conv = trunc i32 %17 to i16, !dbg !1926
  store i16 %conv, i16* %retval, align 2, !dbg !1927
  br label %return, !dbg !1927

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1928
  br label %return, !dbg !1928

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1930
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1933
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1933
  %div23 = udiv i32 %18, %19, !dbg !1933, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1934
  %mul24 = mul i32 %div23, %20, !dbg !1935
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1936
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1937
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1938
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1939
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1940
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1940
  %div25 = udiv i32 %22, %23, !dbg !1940, !klee.check.div !123
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1941
  %mul26 = mul i32 %div25, %24, !dbg !1942
  %sub27 = sub i32 %21, %mul26, !dbg !1943
  %shl = shl i32 %sub27, 1, !dbg !1944
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1945
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1946
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1947
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1948
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1948
  %div28 = udiv i32 %25, %26, !dbg !1948, !klee.check.div !123
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1949
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1950
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1951
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1951
  %div29 = udiv i32 %27, %28, !dbg !1951, !klee.check.div !123
  %add30 = add i32 %div28, %div29, !dbg !1952
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1953
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1954
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1956
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1957

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1958
  %conv34 = trunc i32 %30 to i16, !dbg !1960
  store i16 %conv34, i16* %retval, align 2, !dbg !1961
  br label %return, !dbg !1961

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1962
  br label %return, !dbg !1962

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1964
  ret i16 %31, !dbg !1964
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1965 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1971, metadata !DIExpression()), !dbg !1972
  %2 = icmp eq i64 %0, 0, !dbg !1973
  br i1 %2, label %3, label %4, !dbg !1975

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1976
  unreachable, !dbg !1976

4:                                                ; preds = %1
  ret void, !dbg !1977
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1978 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1984, metadata !DIExpression()), !dbg !1986
  call void @llvm.dbg.value(metadata i64 %1, metadata !1985, metadata !DIExpression()), !dbg !1986
  %3 = icmp ult i64 %1, %0, !dbg !1987
  br i1 %3, label %5, label %4, !dbg !1989

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1990
  unreachable, !dbg !1990

5:                                                ; preds = %2
  ret void, !dbg !1992
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049/div_Ccode_alarm_0049.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049")
!4 = !{}
!5 = !{!6, !11, !12, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !13, line: 11, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !17, line: 26, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !19)
!19 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !13, line: 9, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !23)
!23 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !13, line: 6, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !17, line: 24, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !13, line: 8, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !17, line: 25, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !31)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049")
!50 = !DISubroutineType(types: !51)
!51 = !{!11}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !21)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !21)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !21)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocation(line: 13, column: 24, scope: !48)
!59 = !DILocation(line: 13, column: 5, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 16, column: 36, scope: !48)
!63 = !DILocation(line: 16, column: 47, scope: !48)
!64 = !DILocation(line: 16, column: 14, scope: !48)
!65 = !DILocation(line: 16, column: 12, scope: !48)
!66 = !DILocation(line: 18, column: 11, scope: !48)
!67 = !DILocation(line: 19, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049")
!70 = !DISubroutineType(types: !71)
!71 = !{!20, !20, !20}
!72 = !DILocalVariable(name: "numerator", arg: 1, scope: !68, file: !69, line: 170, type: !20)
!73 = !DILocation(line: 170, column: 31, scope: !68)
!74 = !DILocalVariable(name: "denominator", arg: 2, scope: !68, file: !69, line: 170, type: !20)
!75 = !DILocation(line: 170, column: 47, scope: !68)
!76 = !DILocalVariable(name: "s32Temp1", scope: !68, file: !69, line: 172, type: !12)
!77 = !DILocation(line: 172, column: 6, scope: !68)
!78 = !DILocalVariable(name: "s32Temp2", scope: !68, file: !69, line: 172, type: !12)
!79 = !DILocation(line: 172, column: 15, scope: !68)
!80 = !DILocation(line: 174, column: 61, scope: !81)
!81 = distinct !DILexicalBlock(scope: !68, file: !69, line: 174, column: 6)
!82 = !DILocation(line: 174, column: 56, scope: !81)
!83 = !DILocation(line: 174, column: 46, scope: !81)
!84 = !DILocation(line: 174, column: 8, scope: !81)
!85 = !DILocation(line: 174, column: 6, scope: !68)
!86 = !DILocation(line: 175, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !69, line: 174, column: 75)
!88 = !DILocation(line: 177, column: 13, scope: !68)
!89 = !DILocation(line: 177, column: 22, scope: !68)
!90 = !DILocation(line: 177, column: 11, scope: !68)
!91 = !DILocation(line: 179, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !68, file: !69, line: 179, column: 6)
!93 = !DILocation(line: 179, column: 18, scope: !92)
!94 = !DILocation(line: 179, column: 6, scope: !68)
!95 = !DILocation(line: 181, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !69, line: 181, column: 7)
!97 = distinct !DILexicalBlock(scope: !92, file: !69, line: 180, column: 2)
!98 = !DILocation(line: 181, column: 17, scope: !96)
!99 = !DILocation(line: 181, column: 7, scope: !97)
!100 = !DILocation(line: 183, column: 4, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !69, line: 182, column: 3)
!102 = !DILocation(line: 187, column: 4, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !69, line: 186, column: 3)
!104 = !DILocation(line: 192, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !69, line: 192, column: 7)
!106 = distinct !DILexicalBlock(scope: !92, file: !69, line: 191, column: 2)
!107 = !DILocation(line: 192, column: 16, scope: !105)
!108 = !DILocation(line: 192, column: 7, scope: !106)
!109 = !DILocation(line: 195, column: 47, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !69, line: 195, column: 8)
!111 = distinct !DILexicalBlock(scope: !105, file: !69, line: 193, column: 3)
!112 = !DILocation(line: 195, column: 37, scope: !110)
!113 = !DILocation(line: 195, column: 10, scope: !110)
!114 = !DILocation(line: 195, column: 8, scope: !111)
!115 = !DILocation(line: 196, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !69, line: 195, column: 63)
!117 = !DILocation(line: 199, column: 64, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !69, line: 199, column: 8)
!119 = !DILocation(line: 199, column: 87, scope: !118)
!120 = !DILocation(line: 199, column: 103, scope: !118)
!121 = !DILocation(line: 199, column: 98, scope: !118)
!122 = !DILocation(line: 199, column: 96, scope: !118)
!123 = !{!"True"}
!124 = !DILocation(line: 199, column: 123, scope: !118)
!125 = !DILocation(line: 199, column: 118, scope: !118)
!126 = !DILocation(line: 199, column: 116, scope: !118)
!127 = !DILocation(line: 199, column: 73, scope: !118)
!128 = !DILocation(line: 199, column: 48, scope: !118)
!129 = !DILocation(line: 199, column: 10, scope: !118)
!130 = !DILocation(line: 199, column: 8, scope: !111)
!131 = !DILocation(line: 200, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !118, file: !69, line: 199, column: 141)
!133 = !DILocation(line: 203, column: 54, scope: !134)
!134 = distinct !DILexicalBlock(scope: !111, file: !69, line: 203, column: 8)
!135 = !DILocation(line: 203, column: 77, scope: !134)
!136 = !DILocation(line: 203, column: 93, scope: !134)
!137 = !DILocation(line: 203, column: 88, scope: !134)
!138 = !DILocation(line: 203, column: 86, scope: !134)
!139 = !DILocation(line: 203, column: 113, scope: !134)
!140 = !DILocation(line: 203, column: 108, scope: !134)
!141 = !DILocation(line: 203, column: 106, scope: !134)
!142 = !DILocation(line: 203, column: 63, scope: !134)
!143 = !DILocation(line: 203, column: 38, scope: !134)
!144 = !DILocation(line: 203, column: 10, scope: !134)
!145 = !DILocation(line: 203, column: 8, scope: !111)
!146 = !DILocation(line: 204, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !69, line: 203, column: 146)
!148 = !DILocation(line: 207, column: 51, scope: !149)
!149 = distinct !DILexicalBlock(scope: !111, file: !69, line: 207, column: 8)
!150 = !DILocation(line: 207, column: 67, scope: !149)
!151 = !DILocation(line: 207, column: 62, scope: !149)
!152 = !DILocation(line: 207, column: 60, scope: !149)
!153 = !DILocation(line: 207, column: 35, scope: !149)
!154 = !DILocation(line: 207, column: 97, scope: !149)
!155 = !DILocation(line: 207, column: 92, scope: !149)
!156 = !DILocation(line: 207, column: 82, scope: !149)
!157 = !DILocation(line: 207, column: 10, scope: !149)
!158 = !DILocation(line: 207, column: 8, scope: !111)
!159 = !DILocation(line: 208, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !149, file: !69, line: 207, column: 113)
!161 = !DILocation(line: 210, column: 16, scope: !111)
!162 = !DILocation(line: 210, column: 28, scope: !111)
!163 = !DILocation(line: 210, column: 37, scope: !111)
!164 = !DILocation(line: 210, column: 36, scope: !111)
!165 = !DILocation(line: 210, column: 52, scope: !111)
!166 = !DILocation(line: 210, column: 50, scope: !111)
!167 = !DILocation(line: 210, column: 25, scope: !111)
!168 = !DILocation(line: 210, column: 65, scope: !111)
!169 = !DILocation(line: 210, column: 13, scope: !111)
!170 = !DILocation(line: 212, column: 47, scope: !171)
!171 = distinct !DILexicalBlock(scope: !111, file: !69, line: 212, column: 8)
!172 = !DILocation(line: 212, column: 37, scope: !171)
!173 = !DILocation(line: 212, column: 10, scope: !171)
!174 = !DILocation(line: 212, column: 8, scope: !111)
!175 = !DILocation(line: 213, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !69, line: 212, column: 63)
!177 = !DILocation(line: 220, column: 36, scope: !111)
!178 = !DILocation(line: 220, column: 47, scope: !111)
!179 = !DILocation(line: 220, column: 45, scope: !111)
!180 = !DILocation(line: 220, column: 26, scope: !111)
!181 = !DILocation(line: 220, column: 24, scope: !111)
!182 = !DILocation(line: 221, column: 4, scope: !111)
!183 = !DILocation(line: 241, column: 7, scope: !184)
!184 = distinct !DILexicalBlock(scope: !185, file: !69, line: 241, column: 7)
!185 = distinct !DILexicalBlock(scope: !105, file: !69, line: 240, column: 3)
!186 = !DILocation(line: 241, column: 19, scope: !184)
!187 = !DILocation(line: 241, column: 7, scope: !185)
!188 = !DILocation(line: 243, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !69, line: 242, column: 4)
!190 = !DILocation(line: 243, column: 29, scope: !189)
!191 = !DILocation(line: 243, column: 38, scope: !189)
!192 = !DILocation(line: 243, column: 37, scope: !189)
!193 = !DILocation(line: 243, column: 53, scope: !189)
!194 = !DILocation(line: 243, column: 51, scope: !189)
!195 = !DILocation(line: 243, column: 26, scope: !189)
!196 = !DILocation(line: 243, column: 66, scope: !189)
!197 = !DILocation(line: 243, column: 14, scope: !189)
!198 = !DILocation(line: 244, column: 16, scope: !189)
!199 = !DILocation(line: 244, column: 25, scope: !189)
!200 = !DILocation(line: 244, column: 24, scope: !189)
!201 = !DILocation(line: 244, column: 14, scope: !189)
!202 = !DILocation(line: 245, column: 16, scope: !189)
!203 = !DILocation(line: 245, column: 28, scope: !189)
!204 = !DILocation(line: 245, column: 37, scope: !189)
!205 = !DILocation(line: 245, column: 43, scope: !189)
!206 = !DILocation(line: 245, column: 42, scope: !189)
!207 = !DILocation(line: 245, column: 25, scope: !189)
!208 = !DILocation(line: 245, column: 14, scope: !189)
!209 = !DILocation(line: 246, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !189, file: !69, line: 246, column: 8)
!211 = !DILocation(line: 246, column: 17, scope: !210)
!212 = !DILocation(line: 246, column: 8, scope: !189)
!213 = !DILocation(line: 248, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !69, line: 248, column: 9)
!215 = distinct !DILexicalBlock(scope: !210, file: !69, line: 247, column: 5)
!216 = !DILocation(line: 248, column: 18, scope: !214)
!217 = !DILocation(line: 248, column: 9, scope: !215)
!218 = !DILocation(line: 250, column: 19, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !69, line: 249, column: 6)
!220 = !DILocation(line: 250, column: 14, scope: !219)
!221 = !DILocation(line: 250, column: 7, scope: !219)
!222 = !DILocation(line: 254, column: 7, scope: !223)
!223 = distinct !DILexicalBlock(scope: !214, file: !69, line: 253, column: 6)
!224 = !DILocation(line: 259, column: 6, scope: !225)
!225 = distinct !DILexicalBlock(scope: !210, file: !69, line: 258, column: 5)
!226 = !DILocation(line: 264, column: 5, scope: !227)
!227 = distinct !DILexicalBlock(scope: !184, file: !69, line: 263, column: 4)
!228 = !DILocation(line: 268, column: 1, scope: !68)
!229 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !230, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!230 = !DISubroutineType(types: !231)
!231 = !{!11, !6}
!232 = !DILocalVariable(name: "left", arg: 1, scope: !229, file: !33, line: 84, type: !6)
!233 = !DILocation(line: 84, column: 51, scope: !229)
!234 = !DILocation(line: 86, column: 12, scope: !229)
!235 = !DILocation(line: 86, column: 17, scope: !229)
!236 = !DILocation(line: 86, column: 5, scope: !229)
!237 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !230, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!238 = !DILocalVariable(name: "denominator", arg: 1, scope: !237, file: !33, line: 24, type: !6)
!239 = !DILocation(line: 24, column: 40, scope: !237)
!240 = !DILocation(line: 26, column: 12, scope: !237)
!241 = !DILocation(line: 26, column: 24, scope: !237)
!242 = !DILocation(line: 26, column: 5, scope: !237)
!243 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !244, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!244 = !DISubroutineType(types: !245)
!245 = !{!11, !6, !16}
!246 = !DILocalVariable(name: "left", arg: 1, scope: !243, file: !33, line: 90, type: !6)
!247 = !DILocation(line: 90, column: 41, scope: !243)
!248 = !DILocalVariable(name: "count", arg: 2, scope: !243, file: !33, line: 90, type: !16)
!249 = !DILocation(line: 90, column: 56, scope: !243)
!250 = !DILocation(line: 92, column: 9, scope: !251)
!251 = distinct !DILexicalBlock(scope: !243, file: !33, line: 92, column: 9)
!252 = !DILocation(line: 92, column: 15, scope: !251)
!253 = !DILocation(line: 92, column: 9, scope: !243)
!254 = !DILocation(line: 93, column: 9, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !33, line: 92, column: 32)
!256 = !DILocation(line: 95, column: 12, scope: !243)
!257 = !DILocation(line: 95, column: 34, scope: !243)
!258 = !DILocation(line: 95, column: 31, scope: !243)
!259 = !DILocation(line: 95, column: 17, scope: !243)
!260 = !DILocation(line: 95, column: 41, scope: !243)
!261 = !DILocation(line: 95, column: 5, scope: !243)
!262 = !DILocation(line: 96, column: 1, scope: !243)
!263 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !264, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!264 = !DISubroutineType(types: !265)
!265 = !{!11, !6, !6}
!266 = !DILocalVariable(name: "left", arg: 1, scope: !263, file: !33, line: 78, type: !6)
!267 = !DILocation(line: 78, column: 38, scope: !263)
!268 = !DILocalVariable(name: "right", arg: 2, scope: !263, file: !33, line: 78, type: !6)
!269 = !DILocation(line: 78, column: 52, scope: !263)
!270 = !DILocation(line: 80, column: 12, scope: !263)
!271 = !DILocation(line: 80, column: 19, scope: !263)
!272 = !DILocation(line: 80, column: 17, scope: !263)
!273 = !DILocation(line: 80, column: 25, scope: !263)
!274 = !DILocation(line: 80, column: 5, scope: !263)
!275 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !69, file: !69, line: 285, type: !276, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!276 = !DISubroutineType(types: !277)
!277 = !{!20, !12, !20}
!278 = !DILocalVariable(name: "numerator", arg: 1, scope: !275, file: !69, line: 285, type: !12)
!279 = !DILocation(line: 285, column: 25, scope: !275)
!280 = !DILocalVariable(name: "denominator", arg: 2, scope: !275, file: !69, line: 285, type: !20)
!281 = !DILocation(line: 285, column: 41, scope: !275)
!282 = !DILocalVariable(name: "s32Temp1", scope: !275, file: !69, line: 287, type: !12)
!283 = !DILocation(line: 287, column: 6, scope: !275)
!284 = !DILocalVariable(name: "s32Temp2", scope: !275, file: !69, line: 287, type: !12)
!285 = !DILocation(line: 287, column: 17, scope: !275)
!286 = !DILocation(line: 288, column: 13, scope: !275)
!287 = !DILocation(line: 288, column: 11, scope: !275)
!288 = !DILocation(line: 289, column: 5, scope: !289)
!289 = distinct !DILexicalBlock(scope: !275, file: !69, line: 289, column: 5)
!290 = !DILocation(line: 289, column: 17, scope: !289)
!291 = !DILocation(line: 289, column: 5, scope: !275)
!292 = !DILocation(line: 291, column: 7, scope: !293)
!293 = distinct !DILexicalBlock(scope: !294, file: !69, line: 291, column: 7)
!294 = distinct !DILexicalBlock(scope: !289, file: !69, line: 290, column: 2)
!295 = !DILocation(line: 291, column: 17, scope: !293)
!296 = !DILocation(line: 291, column: 7, scope: !294)
!297 = !DILocation(line: 293, column: 4, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !69, line: 292, column: 3)
!299 = !DILocation(line: 297, column: 4, scope: !300)
!300 = distinct !DILexicalBlock(scope: !293, file: !69, line: 296, column: 3)
!301 = !DILocation(line: 302, column: 6, scope: !302)
!302 = distinct !DILexicalBlock(scope: !303, file: !69, line: 302, column: 6)
!303 = distinct !DILexicalBlock(scope: !289, file: !69, line: 301, column: 2)
!304 = !DILocation(line: 302, column: 16, scope: !302)
!305 = !DILocation(line: 302, column: 6, scope: !303)
!306 = !DILocation(line: 304, column: 16, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !69, line: 303, column: 3)
!308 = !DILocation(line: 304, column: 28, scope: !307)
!309 = !DILocation(line: 304, column: 37, scope: !307)
!310 = !DILocation(line: 304, column: 36, scope: !307)
!311 = !DILocation(line: 304, column: 52, scope: !307)
!312 = !DILocation(line: 304, column: 50, scope: !307)
!313 = !DILocation(line: 304, column: 25, scope: !307)
!314 = !DILocation(line: 304, column: 65, scope: !307)
!315 = !DILocation(line: 304, column: 13, scope: !307)
!316 = !DILocation(line: 305, column: 15, scope: !307)
!317 = !DILocation(line: 305, column: 24, scope: !307)
!318 = !DILocation(line: 305, column: 23, scope: !307)
!319 = !DILocation(line: 305, column: 13, scope: !307)
!320 = !DILocation(line: 306, column: 15, scope: !307)
!321 = !DILocation(line: 306, column: 27, scope: !307)
!322 = !DILocation(line: 306, column: 38, scope: !307)
!323 = !DILocation(line: 306, column: 37, scope: !307)
!324 = !DILocation(line: 306, column: 24, scope: !307)
!325 = !DILocation(line: 306, column: 13, scope: !307)
!326 = !DILocation(line: 307, column: 7, scope: !327)
!327 = distinct !DILexicalBlock(scope: !307, file: !69, line: 307, column: 7)
!328 = !DILocation(line: 307, column: 16, scope: !327)
!329 = !DILocation(line: 307, column: 7, scope: !307)
!330 = !DILocation(line: 309, column: 8, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !69, line: 309, column: 8)
!332 = distinct !DILexicalBlock(scope: !327, file: !69, line: 308, column: 4)
!333 = !DILocation(line: 309, column: 17, scope: !331)
!334 = !DILocation(line: 309, column: 8, scope: !332)
!335 = !DILocation(line: 311, column: 18, scope: !336)
!336 = distinct !DILexicalBlock(scope: !331, file: !69, line: 310, column: 5)
!337 = !DILocation(line: 311, column: 13, scope: !336)
!338 = !DILocation(line: 311, column: 6, scope: !336)
!339 = !DILocation(line: 315, column: 6, scope: !340)
!340 = distinct !DILexicalBlock(scope: !331, file: !69, line: 314, column: 5)
!341 = !DILocation(line: 320, column: 5, scope: !342)
!342 = distinct !DILexicalBlock(scope: !327, file: !69, line: 319, column: 4)
!343 = !DILocation(line: 325, column: 7, scope: !344)
!344 = distinct !DILexicalBlock(scope: !345, file: !69, line: 325, column: 7)
!345 = distinct !DILexicalBlock(scope: !302, file: !69, line: 324, column: 3)
!346 = !DILocation(line: 325, column: 19, scope: !344)
!347 = !DILocation(line: 325, column: 7, scope: !345)
!348 = !DILocation(line: 327, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !344, file: !69, line: 326, column: 4)
!350 = !DILocation(line: 327, column: 29, scope: !349)
!351 = !DILocation(line: 327, column: 38, scope: !349)
!352 = !DILocation(line: 327, column: 37, scope: !349)
!353 = !DILocation(line: 327, column: 53, scope: !349)
!354 = !DILocation(line: 327, column: 51, scope: !349)
!355 = !DILocation(line: 327, column: 26, scope: !349)
!356 = !DILocation(line: 327, column: 66, scope: !349)
!357 = !DILocation(line: 327, column: 14, scope: !349)
!358 = !DILocation(line: 328, column: 16, scope: !349)
!359 = !DILocation(line: 328, column: 25, scope: !349)
!360 = !DILocation(line: 328, column: 24, scope: !349)
!361 = !DILocation(line: 328, column: 14, scope: !349)
!362 = !DILocation(line: 329, column: 16, scope: !349)
!363 = !DILocation(line: 329, column: 28, scope: !349)
!364 = !DILocation(line: 329, column: 39, scope: !349)
!365 = !DILocation(line: 329, column: 38, scope: !349)
!366 = !DILocation(line: 329, column: 25, scope: !349)
!367 = !DILocation(line: 329, column: 14, scope: !349)
!368 = !DILocation(line: 330, column: 8, scope: !369)
!369 = distinct !DILexicalBlock(scope: !349, file: !69, line: 330, column: 8)
!370 = !DILocation(line: 330, column: 17, scope: !369)
!371 = !DILocation(line: 330, column: 8, scope: !349)
!372 = !DILocation(line: 332, column: 9, scope: !373)
!373 = distinct !DILexicalBlock(scope: !374, file: !69, line: 332, column: 9)
!374 = distinct !DILexicalBlock(scope: !369, file: !69, line: 331, column: 5)
!375 = !DILocation(line: 332, column: 18, scope: !373)
!376 = !DILocation(line: 332, column: 9, scope: !374)
!377 = !DILocation(line: 334, column: 19, scope: !378)
!378 = distinct !DILexicalBlock(scope: !373, file: !69, line: 333, column: 6)
!379 = !DILocation(line: 334, column: 14, scope: !378)
!380 = !DILocation(line: 334, column: 7, scope: !378)
!381 = !DILocation(line: 338, column: 7, scope: !382)
!382 = distinct !DILexicalBlock(scope: !373, file: !69, line: 337, column: 6)
!383 = !DILocation(line: 343, column: 6, scope: !384)
!384 = distinct !DILexicalBlock(scope: !369, file: !69, line: 342, column: 5)
!385 = !DILocation(line: 349, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !344, file: !69, line: 348, column: 4)
!387 = !DILocation(line: 355, column: 1, scope: !275)
!388 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 373, type: !389, scopeLine: 374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DISubroutineType(types: !390)
!390 = !{!20, !20, !28}
!391 = !DILocalVariable(name: "numerator", arg: 1, scope: !388, file: !69, line: 373, type: !20)
!392 = !DILocation(line: 373, column: 31, scope: !388)
!393 = !DILocalVariable(name: "denominator", arg: 2, scope: !388, file: !69, line: 373, type: !28)
!394 = !DILocation(line: 373, column: 47, scope: !388)
!395 = !DILocalVariable(name: "u16Temp1", scope: !388, file: !69, line: 375, type: !28)
!396 = !DILocation(line: 375, column: 6, scope: !388)
!397 = !DILocalVariable(name: "s32Temp1", scope: !388, file: !69, line: 376, type: !12)
!398 = !DILocation(line: 376, column: 6, scope: !388)
!399 = !DILocalVariable(name: "s32Temp2", scope: !388, file: !69, line: 376, type: !12)
!400 = !DILocation(line: 376, column: 15, scope: !388)
!401 = !DILocation(line: 377, column: 13, scope: !388)
!402 = !DILocation(line: 377, column: 25, scope: !388)
!403 = !DILocation(line: 377, column: 11, scope: !388)
!404 = !DILocation(line: 378, column: 13, scope: !388)
!405 = !DILocation(line: 378, column: 22, scope: !388)
!406 = !DILocation(line: 378, column: 11, scope: !388)
!407 = !DILocation(line: 379, column: 5, scope: !408)
!408 = distinct !DILexicalBlock(scope: !388, file: !69, line: 379, column: 5)
!409 = !DILocation(line: 379, column: 14, scope: !408)
!410 = !DILocation(line: 379, column: 5, scope: !388)
!411 = !DILocation(line: 381, column: 7, scope: !412)
!412 = distinct !DILexicalBlock(scope: !413, file: !69, line: 381, column: 7)
!413 = distinct !DILexicalBlock(scope: !408, file: !69, line: 380, column: 2)
!414 = !DILocation(line: 381, column: 17, scope: !412)
!415 = !DILocation(line: 381, column: 7, scope: !413)
!416 = !DILocation(line: 383, column: 4, scope: !417)
!417 = distinct !DILexicalBlock(scope: !412, file: !69, line: 382, column: 3)
!418 = !DILocation(line: 387, column: 4, scope: !419)
!419 = distinct !DILexicalBlock(scope: !412, file: !69, line: 386, column: 3)
!420 = !DILocation(line: 392, column: 15, scope: !421)
!421 = distinct !DILexicalBlock(scope: !408, file: !69, line: 391, column: 2)
!422 = !DILocation(line: 392, column: 24, scope: !421)
!423 = !DILocation(line: 392, column: 32, scope: !421)
!424 = !DILocation(line: 392, column: 41, scope: !421)
!425 = !DILocation(line: 392, column: 47, scope: !421)
!426 = !DILocation(line: 392, column: 46, scope: !421)
!427 = !DILocation(line: 392, column: 57, scope: !421)
!428 = !DILocation(line: 392, column: 56, scope: !421)
!429 = !DILocation(line: 392, column: 29, scope: !421)
!430 = !DILocation(line: 392, column: 12, scope: !421)
!431 = !DILocation(line: 393, column: 14, scope: !421)
!432 = !DILocation(line: 393, column: 22, scope: !421)
!433 = !DILocation(line: 393, column: 12, scope: !421)
!434 = !DILocation(line: 394, column: 14, scope: !421)
!435 = !DILocation(line: 394, column: 23, scope: !421)
!436 = !DILocation(line: 394, column: 22, scope: !421)
!437 = !DILocation(line: 394, column: 12, scope: !421)
!438 = !DILocation(line: 395, column: 16, scope: !421)
!439 = !DILocation(line: 395, column: 25, scope: !421)
!440 = !DILocation(line: 395, column: 31, scope: !421)
!441 = !DILocation(line: 395, column: 30, scope: !421)
!442 = !DILocation(line: 395, column: 43, scope: !421)
!443 = !DILocation(line: 395, column: 41, scope: !421)
!444 = !DILocation(line: 395, column: 12, scope: !421)
!445 = !DILocation(line: 396, column: 6, scope: !446)
!446 = distinct !DILexicalBlock(scope: !421, file: !69, line: 396, column: 6)
!447 = !DILocation(line: 396, column: 15, scope: !446)
!448 = !DILocation(line: 396, column: 6, scope: !421)
!449 = !DILocation(line: 398, column: 7, scope: !450)
!450 = distinct !DILexicalBlock(scope: !451, file: !69, line: 398, column: 7)
!451 = distinct !DILexicalBlock(scope: !446, file: !69, line: 397, column: 3)
!452 = !DILocation(line: 398, column: 16, scope: !450)
!453 = !DILocation(line: 398, column: 7, scope: !451)
!454 = !DILocation(line: 400, column: 17, scope: !455)
!455 = distinct !DILexicalBlock(scope: !450, file: !69, line: 399, column: 4)
!456 = !DILocation(line: 400, column: 12, scope: !455)
!457 = !DILocation(line: 400, column: 5, scope: !455)
!458 = !DILocation(line: 404, column: 5, scope: !459)
!459 = distinct !DILexicalBlock(scope: !450, file: !69, line: 403, column: 4)
!460 = !DILocation(line: 409, column: 4, scope: !461)
!461 = distinct !DILexicalBlock(scope: !446, file: !69, line: 408, column: 3)
!462 = !DILocation(line: 412, column: 1, scope: !388)
!463 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 429, type: !389, scopeLine: 430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!464 = !DILocalVariable(name: "numerator", arg: 1, scope: !463, file: !69, line: 429, type: !20)
!465 = !DILocation(line: 429, column: 30, scope: !463)
!466 = !DILocalVariable(name: "denominator", arg: 2, scope: !463, file: !69, line: 429, type: !28)
!467 = !DILocation(line: 429, column: 45, scope: !463)
!468 = !DILocalVariable(name: "u16Temp1", scope: !463, file: !69, line: 431, type: !28)
!469 = !DILocation(line: 431, column: 6, scope: !463)
!470 = !DILocalVariable(name: "s32Temp1", scope: !463, file: !69, line: 432, type: !12)
!471 = !DILocation(line: 432, column: 6, scope: !463)
!472 = !DILocation(line: 433, column: 13, scope: !463)
!473 = !DILocation(line: 433, column: 25, scope: !463)
!474 = !DILocation(line: 433, column: 11, scope: !463)
!475 = !DILocation(line: 434, column: 5, scope: !476)
!476 = distinct !DILexicalBlock(scope: !463, file: !69, line: 434, column: 5)
!477 = !DILocation(line: 434, column: 13, scope: !476)
!478 = !DILocation(line: 434, column: 5, scope: !463)
!479 = !DILocation(line: 436, column: 6, scope: !480)
!480 = distinct !DILexicalBlock(scope: !481, file: !69, line: 436, column: 6)
!481 = distinct !DILexicalBlock(scope: !476, file: !69, line: 435, column: 2)
!482 = !DILocation(line: 436, column: 15, scope: !480)
!483 = !DILocation(line: 436, column: 6, scope: !481)
!484 = !DILocation(line: 438, column: 4, scope: !485)
!485 = distinct !DILexicalBlock(scope: !480, file: !69, line: 437, column: 3)
!486 = !DILocation(line: 442, column: 4, scope: !487)
!487 = distinct !DILexicalBlock(scope: !480, file: !69, line: 441, column: 3)
!488 = !DILocation(line: 448, column: 15, scope: !489)
!489 = distinct !DILexicalBlock(scope: !476, file: !69, line: 447, column: 2)
!490 = !DILocation(line: 448, column: 27, scope: !489)
!491 = !DILocation(line: 448, column: 37, scope: !489)
!492 = !DILocation(line: 448, column: 36, scope: !489)
!493 = !DILocation(line: 448, column: 49, scope: !489)
!494 = !DILocation(line: 448, column: 47, scope: !489)
!495 = !DILocation(line: 448, column: 25, scope: !489)
!496 = !DILocation(line: 448, column: 59, scope: !489)
!497 = !DILocation(line: 448, column: 12, scope: !489)
!498 = !DILocation(line: 449, column: 15, scope: !489)
!499 = !DILocation(line: 449, column: 24, scope: !489)
!500 = !DILocation(line: 449, column: 23, scope: !489)
!501 = !DILocation(line: 449, column: 37, scope: !489)
!502 = !DILocation(line: 449, column: 47, scope: !489)
!503 = !DILocation(line: 449, column: 46, scope: !489)
!504 = !DILocation(line: 449, column: 34, scope: !489)
!505 = !DILocation(line: 449, column: 12, scope: !489)
!506 = !DILocation(line: 450, column: 10, scope: !489)
!507 = !DILocation(line: 450, column: 3, scope: !489)
!508 = !DILocation(line: 452, column: 1, scope: !463)
!509 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 470, type: !510, scopeLine: 471, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!510 = !DISubroutineType(types: !511)
!511 = !{!24, !28, !28}
!512 = !DILocalVariable(name: "numerator", arg: 1, scope: !509, file: !69, line: 470, type: !28)
!513 = !DILocation(line: 470, column: 28, scope: !509)
!514 = !DILocalVariable(name: "denominator", arg: 2, scope: !509, file: !69, line: 470, type: !28)
!515 = !DILocation(line: 470, column: 43, scope: !509)
!516 = !DILocalVariable(name: "u32Temp1", scope: !509, file: !69, line: 472, type: !517)
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !16)
!518 = !DILocation(line: 472, column: 6, scope: !509)
!519 = !DILocalVariable(name: "u32Temp2", scope: !509, file: !69, line: 472, type: !517)
!520 = !DILocation(line: 472, column: 20, scope: !509)
!521 = !DILocalVariable(name: "u32Temp3", scope: !509, file: !69, line: 472, type: !517)
!522 = !DILocation(line: 472, column: 33, scope: !509)
!523 = !DILocation(line: 473, column: 5, scope: !524)
!524 = distinct !DILexicalBlock(scope: !509, file: !69, line: 473, column: 5)
!525 = !DILocation(line: 473, column: 16, scope: !524)
!526 = !DILocation(line: 473, column: 5, scope: !509)
!527 = !DILocation(line: 475, column: 3, scope: !528)
!528 = distinct !DILexicalBlock(scope: !524, file: !69, line: 474, column: 2)
!529 = !DILocation(line: 479, column: 15, scope: !530)
!530 = distinct !DILexicalBlock(scope: !524, file: !69, line: 478, column: 2)
!531 = !DILocation(line: 479, column: 24, scope: !530)
!532 = !DILocation(line: 479, column: 12, scope: !530)
!533 = !DILocation(line: 480, column: 14, scope: !530)
!534 = !DILocation(line: 480, column: 25, scope: !530)
!535 = !DILocation(line: 480, column: 23, scope: !530)
!536 = !DILocation(line: 480, column: 12, scope: !530)
!537 = !DILocation(line: 481, column: 15, scope: !530)
!538 = !DILocation(line: 481, column: 24, scope: !530)
!539 = !DILocation(line: 481, column: 32, scope: !530)
!540 = !DILocation(line: 481, column: 12, scope: !530)
!541 = !DILocation(line: 482, column: 6, scope: !542)
!542 = distinct !DILexicalBlock(scope: !530, file: !69, line: 482, column: 6)
!543 = !DILocation(line: 482, column: 15, scope: !542)
!544 = !DILocation(line: 482, column: 6, scope: !530)
!545 = !DILocation(line: 484, column: 15, scope: !546)
!546 = distinct !DILexicalBlock(scope: !542, file: !69, line: 483, column: 3)
!547 = !DILocation(line: 484, column: 11, scope: !546)
!548 = !DILocation(line: 484, column: 4, scope: !546)
!549 = !DILocation(line: 488, column: 4, scope: !550)
!550 = distinct !DILexicalBlock(scope: !542, file: !69, line: 487, column: 3)
!551 = !DILocation(line: 491, column: 1, scope: !509)
!552 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 508, type: !553, scopeLine: 509, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!553 = !DISubroutineType(types: !554)
!554 = !{!28, !12, !28}
!555 = !DILocalVariable(name: "x_value", arg: 1, scope: !552, file: !69, line: 508, type: !12)
!556 = !DILocation(line: 508, column: 25, scope: !552)
!557 = !DILocalVariable(name: "y_value", arg: 2, scope: !552, file: !69, line: 508, type: !28)
!558 = !DILocation(line: 508, column: 38, scope: !552)
!559 = !DILocalVariable(name: "s32Temp1", scope: !552, file: !69, line: 510, type: !12)
!560 = !DILocation(line: 510, column: 6, scope: !552)
!561 = !DILocation(line: 511, column: 12, scope: !552)
!562 = !DILocation(line: 511, column: 20, scope: !552)
!563 = !DILocation(line: 511, column: 10, scope: !552)
!564 = !DILocation(line: 512, column: 6, scope: !565)
!565 = distinct !DILexicalBlock(scope: !552, file: !69, line: 512, column: 5)
!566 = !DILocation(line: 512, column: 14, scope: !565)
!567 = !DILocation(line: 512, column: 24, scope: !565)
!568 = !DILocation(line: 512, column: 5, scope: !552)
!569 = !DILocation(line: 514, column: 6, scope: !570)
!570 = distinct !DILexicalBlock(scope: !571, file: !69, line: 514, column: 6)
!571 = distinct !DILexicalBlock(scope: !565, file: !69, line: 513, column: 2)
!572 = !DILocation(line: 514, column: 14, scope: !570)
!573 = !DILocation(line: 514, column: 6, scope: !571)
!574 = !DILocation(line: 516, column: 4, scope: !575)
!575 = distinct !DILexicalBlock(scope: !570, file: !69, line: 515, column: 3)
!576 = !DILocation(line: 520, column: 4, scope: !577)
!577 = distinct !DILexicalBlock(scope: !570, file: !69, line: 519, column: 3)
!578 = !DILocation(line: 525, column: 15, scope: !579)
!579 = distinct !DILexicalBlock(scope: !565, file: !69, line: 524, column: 2)
!580 = !DILocation(line: 525, column: 27, scope: !579)
!581 = !DILocation(line: 525, column: 35, scope: !579)
!582 = !DILocation(line: 525, column: 34, scope: !579)
!583 = !DILocation(line: 525, column: 46, scope: !579)
!584 = !DILocation(line: 525, column: 44, scope: !579)
!585 = !DILocation(line: 525, column: 23, scope: !579)
!586 = !DILocation(line: 525, column: 56, scope: !579)
!587 = !DILocation(line: 525, column: 12, scope: !579)
!588 = !DILocation(line: 526, column: 15, scope: !579)
!589 = !DILocation(line: 526, column: 24, scope: !579)
!590 = !DILocation(line: 526, column: 23, scope: !579)
!591 = !DILocation(line: 526, column: 36, scope: !579)
!592 = !DILocation(line: 526, column: 44, scope: !579)
!593 = !DILocation(line: 526, column: 43, scope: !579)
!594 = !DILocation(line: 526, column: 33, scope: !579)
!595 = !DILocation(line: 526, column: 12, scope: !579)
!596 = !DILocation(line: 527, column: 6, scope: !597)
!597 = distinct !DILexicalBlock(scope: !579, file: !69, line: 527, column: 6)
!598 = !DILocation(line: 527, column: 15, scope: !597)
!599 = !DILocation(line: 527, column: 6, scope: !579)
!600 = !DILocation(line: 529, column: 7, scope: !601)
!601 = distinct !DILexicalBlock(scope: !602, file: !69, line: 529, column: 7)
!602 = distinct !DILexicalBlock(scope: !597, file: !69, line: 528, column: 3)
!603 = !DILocation(line: 529, column: 16, scope: !601)
!604 = !DILocation(line: 529, column: 7, scope: !602)
!605 = !DILocation(line: 531, column: 17, scope: !606)
!606 = distinct !DILexicalBlock(scope: !601, file: !69, line: 530, column: 4)
!607 = !DILocation(line: 531, column: 12, scope: !606)
!608 = !DILocation(line: 531, column: 5, scope: !606)
!609 = !DILocation(line: 535, column: 5, scope: !610)
!610 = distinct !DILexicalBlock(scope: !601, file: !69, line: 534, column: 4)
!611 = !DILocation(line: 540, column: 4, scope: !612)
!612 = distinct !DILexicalBlock(scope: !597, file: !69, line: 539, column: 3)
!613 = !DILocation(line: 543, column: 1, scope: !552)
!614 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 561, type: !615, scopeLine: 562, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!615 = !DISubroutineType(types: !616)
!616 = !{!28, !28, !28}
!617 = !DILocalVariable(name: "numerator", arg: 1, scope: !614, file: !69, line: 561, type: !28)
!618 = !DILocation(line: 561, column: 31, scope: !614)
!619 = !DILocalVariable(name: "denominator", arg: 2, scope: !614, file: !69, line: 561, type: !28)
!620 = !DILocation(line: 561, column: 46, scope: !614)
!621 = !DILocalVariable(name: "u32Temp", scope: !614, file: !69, line: 563, type: !517)
!622 = !DILocation(line: 563, column: 6, scope: !614)
!623 = !DILocation(line: 564, column: 5, scope: !624)
!624 = distinct !DILexicalBlock(scope: !614, file: !69, line: 564, column: 5)
!625 = !DILocation(line: 564, column: 17, scope: !624)
!626 = !DILocation(line: 564, column: 5, scope: !614)
!627 = !DILocation(line: 566, column: 3, scope: !628)
!628 = distinct !DILexicalBlock(scope: !624, file: !69, line: 565, column: 2)
!629 = !DILocation(line: 570, column: 14, scope: !630)
!630 = distinct !DILexicalBlock(scope: !624, file: !69, line: 569, column: 2)
!631 = !DILocation(line: 570, column: 23, scope: !630)
!632 = !DILocation(line: 570, column: 32, scope: !630)
!633 = !DILocation(line: 570, column: 44, scope: !630)
!634 = !DILocation(line: 570, column: 29, scope: !630)
!635 = !DILocation(line: 570, column: 11, scope: !630)
!636 = !DILocation(line: 571, column: 13, scope: !630)
!637 = !DILocation(line: 571, column: 21, scope: !630)
!638 = !DILocation(line: 571, column: 20, scope: !630)
!639 = !DILocation(line: 571, column: 11, scope: !630)
!640 = !DILocation(line: 572, column: 6, scope: !641)
!641 = distinct !DILexicalBlock(scope: !630, file: !69, line: 572, column: 6)
!642 = !DILocation(line: 572, column: 14, scope: !641)
!643 = !DILocation(line: 572, column: 6, scope: !630)
!644 = !DILocation(line: 574, column: 11, scope: !645)
!645 = distinct !DILexicalBlock(scope: !641, file: !69, line: 573, column: 3)
!646 = !DILocation(line: 574, column: 19, scope: !645)
!647 = !DILocation(line: 574, column: 4, scope: !645)
!648 = !DILocation(line: 578, column: 4, scope: !649)
!649 = distinct !DILexicalBlock(scope: !641, file: !69, line: 577, column: 3)
!650 = !DILocation(line: 582, column: 1, scope: !614)
!651 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 599, type: !652, scopeLine: 600, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!652 = !DISubroutineType(types: !653)
!653 = !{!28, !517, !28}
!654 = !DILocalVariable(name: "x_value", arg: 1, scope: !651, file: !69, line: 599, type: !517)
!655 = !DILocation(line: 599, column: 25, scope: !651)
!656 = !DILocalVariable(name: "y_value", arg: 2, scope: !651, file: !69, line: 599, type: !28)
!657 = !DILocation(line: 599, column: 38, scope: !651)
!658 = !DILocalVariable(name: "u32Temp1", scope: !651, file: !69, line: 601, type: !517)
!659 = !DILocation(line: 601, column: 6, scope: !651)
!660 = !DILocalVariable(name: "u32Temp2", scope: !651, file: !69, line: 601, type: !517)
!661 = !DILocation(line: 601, column: 17, scope: !651)
!662 = !DILocation(line: 602, column: 12, scope: !651)
!663 = !DILocation(line: 602, column: 20, scope: !651)
!664 = !DILocation(line: 602, column: 10, scope: !651)
!665 = !DILocation(line: 603, column: 5, scope: !666)
!666 = distinct !DILexicalBlock(scope: !651, file: !69, line: 603, column: 5)
!667 = !DILocation(line: 603, column: 13, scope: !666)
!668 = !DILocation(line: 603, column: 5, scope: !651)
!669 = !DILocation(line: 605, column: 3, scope: !670)
!670 = distinct !DILexicalBlock(scope: !666, file: !69, line: 604, column: 2)
!671 = !DILocation(line: 609, column: 14, scope: !672)
!672 = distinct !DILexicalBlock(scope: !666, file: !69, line: 608, column: 2)
!673 = !DILocation(line: 609, column: 22, scope: !672)
!674 = !DILocation(line: 609, column: 21, scope: !672)
!675 = !DILocation(line: 609, column: 12, scope: !672)
!676 = !DILocation(line: 610, column: 14, scope: !672)
!677 = !DILocation(line: 610, column: 25, scope: !672)
!678 = !DILocation(line: 610, column: 36, scope: !672)
!679 = !DILocation(line: 610, column: 34, scope: !672)
!680 = !DILocation(line: 610, column: 22, scope: !672)
!681 = !DILocation(line: 610, column: 45, scope: !672)
!682 = !DILocation(line: 610, column: 12, scope: !672)
!683 = !DILocation(line: 611, column: 15, scope: !672)
!684 = !DILocation(line: 611, column: 24, scope: !672)
!685 = !DILocation(line: 611, column: 23, scope: !672)
!686 = !DILocation(line: 611, column: 36, scope: !672)
!687 = !DILocation(line: 611, column: 44, scope: !672)
!688 = !DILocation(line: 611, column: 43, scope: !672)
!689 = !DILocation(line: 611, column: 33, scope: !672)
!690 = !DILocation(line: 611, column: 12, scope: !672)
!691 = !DILocation(line: 612, column: 6, scope: !692)
!692 = distinct !DILexicalBlock(scope: !672, file: !69, line: 612, column: 6)
!693 = !DILocation(line: 612, column: 15, scope: !692)
!694 = !DILocation(line: 612, column: 6, scope: !672)
!695 = !DILocation(line: 614, column: 11, scope: !696)
!696 = distinct !DILexicalBlock(scope: !692, file: !69, line: 613, column: 3)
!697 = !DILocation(line: 614, column: 20, scope: !696)
!698 = !DILocation(line: 614, column: 4, scope: !696)
!699 = !DILocation(line: 618, column: 4, scope: !700)
!700 = distinct !DILexicalBlock(scope: !692, file: !69, line: 617, column: 3)
!701 = !DILocation(line: 622, column: 1, scope: !651)
!702 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 641, type: !703, scopeLine: 642, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!703 = !DISubroutineType(types: !704)
!704 = !{!20, !20, !28, !20}
!705 = !DILocalVariable(name: "factor1", arg: 1, scope: !702, file: !69, line: 641, type: !20)
!706 = !DILocation(line: 641, column: 33, scope: !702)
!707 = !DILocalVariable(name: "factor2", arg: 2, scope: !702, file: !69, line: 641, type: !28)
!708 = !DILocation(line: 641, column: 46, scope: !702)
!709 = !DILocalVariable(name: "denominator", arg: 3, scope: !702, file: !69, line: 641, type: !20)
!710 = !DILocation(line: 641, column: 59, scope: !702)
!711 = !DILocalVariable(name: "s32Result", scope: !702, file: !69, line: 643, type: !12)
!712 = !DILocation(line: 643, column: 6, scope: !702)
!713 = !DILocalVariable(name: "s32Temp1", scope: !702, file: !69, line: 643, type: !12)
!714 = !DILocation(line: 643, column: 21, scope: !702)
!715 = !DILocation(line: 644, column: 14, scope: !702)
!716 = !DILocation(line: 644, column: 24, scope: !702)
!717 = !DILocation(line: 644, column: 22, scope: !702)
!718 = !DILocation(line: 644, column: 12, scope: !702)
!719 = !DILocation(line: 645, column: 5, scope: !720)
!720 = distinct !DILexicalBlock(scope: !702, file: !69, line: 645, column: 5)
!721 = !DILocation(line: 645, column: 17, scope: !720)
!722 = !DILocation(line: 645, column: 5, scope: !702)
!723 = !DILocation(line: 647, column: 6, scope: !724)
!724 = distinct !DILexicalBlock(scope: !725, file: !69, line: 647, column: 6)
!725 = distinct !DILexicalBlock(scope: !720, file: !69, line: 646, column: 2)
!726 = !DILocation(line: 647, column: 16, scope: !724)
!727 = !DILocation(line: 647, column: 6, scope: !725)
!728 = !DILocation(line: 649, column: 4, scope: !729)
!729 = distinct !DILexicalBlock(scope: !724, file: !69, line: 648, column: 3)
!730 = !DILocation(line: 653, column: 4, scope: !731)
!731 = distinct !DILexicalBlock(scope: !724, file: !69, line: 652, column: 3)
!732 = !DILocation(line: 658, column: 14, scope: !733)
!733 = distinct !DILexicalBlock(scope: !720, file: !69, line: 657, column: 2)
!734 = !DILocation(line: 658, column: 27, scope: !733)
!735 = !DILocation(line: 658, column: 37, scope: !733)
!736 = !DILocation(line: 658, column: 36, scope: !733)
!737 = !DILocation(line: 658, column: 50, scope: !733)
!738 = !DILocation(line: 658, column: 49, scope: !733)
!739 = !DILocation(line: 658, column: 24, scope: !733)
!740 = !DILocation(line: 658, column: 12, scope: !733)
!741 = !DILocation(line: 659, column: 14, scope: !733)
!742 = !DILocation(line: 659, column: 23, scope: !733)
!743 = !DILocation(line: 659, column: 12, scope: !733)
!744 = !DILocation(line: 660, column: 16, scope: !733)
!745 = !DILocation(line: 660, column: 25, scope: !733)
!746 = !DILocation(line: 660, column: 24, scope: !733)
!747 = !DILocation(line: 660, column: 41, scope: !733)
!748 = !DILocation(line: 660, column: 51, scope: !733)
!749 = !DILocation(line: 660, column: 50, scope: !733)
!750 = !DILocation(line: 660, column: 38, scope: !733)
!751 = !DILocation(line: 660, column: 13, scope: !733)
!752 = !DILocation(line: 661, column: 6, scope: !753)
!753 = distinct !DILexicalBlock(scope: !733, file: !69, line: 661, column: 6)
!754 = !DILocation(line: 661, column: 16, scope: !753)
!755 = !DILocation(line: 661, column: 6, scope: !733)
!756 = !DILocation(line: 663, column: 7, scope: !757)
!757 = distinct !DILexicalBlock(scope: !758, file: !69, line: 663, column: 7)
!758 = distinct !DILexicalBlock(scope: !753, file: !69, line: 662, column: 3)
!759 = !DILocation(line: 663, column: 17, scope: !757)
!760 = !DILocation(line: 663, column: 7, scope: !758)
!761 = !DILocation(line: 665, column: 17, scope: !762)
!762 = distinct !DILexicalBlock(scope: !757, file: !69, line: 664, column: 4)
!763 = !DILocation(line: 665, column: 12, scope: !762)
!764 = !DILocation(line: 665, column: 5, scope: !762)
!765 = !DILocation(line: 670, column: 5, scope: !766)
!766 = distinct !DILexicalBlock(scope: !757, file: !69, line: 669, column: 4)
!767 = !DILocation(line: 675, column: 4, scope: !768)
!768 = distinct !DILexicalBlock(scope: !753, file: !69, line: 674, column: 3)
!769 = !DILocation(line: 679, column: 1, scope: !702)
!770 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 697, type: !771, scopeLine: 698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!771 = !DISubroutineType(types: !772)
!772 = !{!20, !28, !20, !28}
!773 = !DILocalVariable(name: "factor1", arg: 1, scope: !770, file: !69, line: 697, type: !28)
!774 = !DILocation(line: 697, column: 33, scope: !770)
!775 = !DILocalVariable(name: "factor2", arg: 2, scope: !770, file: !69, line: 697, type: !20)
!776 = !DILocation(line: 697, column: 46, scope: !770)
!777 = !DILocalVariable(name: "denominator", arg: 3, scope: !770, file: !69, line: 697, type: !28)
!778 = !DILocation(line: 697, column: 59, scope: !770)
!779 = !DILocalVariable(name: "s32Result", scope: !770, file: !69, line: 699, type: !12)
!780 = !DILocation(line: 699, column: 6, scope: !770)
!781 = !DILocalVariable(name: "s32Temp1", scope: !770, file: !69, line: 699, type: !12)
!782 = !DILocation(line: 699, column: 21, scope: !770)
!783 = !DILocation(line: 700, column: 14, scope: !770)
!784 = !DILocation(line: 700, column: 24, scope: !770)
!785 = !DILocation(line: 700, column: 22, scope: !770)
!786 = !DILocation(line: 700, column: 12, scope: !770)
!787 = !DILocation(line: 701, column: 5, scope: !788)
!788 = distinct !DILexicalBlock(scope: !770, file: !69, line: 701, column: 5)
!789 = !DILocation(line: 701, column: 16, scope: !788)
!790 = !DILocation(line: 701, column: 5, scope: !770)
!791 = !DILocation(line: 703, column: 6, scope: !792)
!792 = distinct !DILexicalBlock(scope: !793, file: !69, line: 703, column: 6)
!793 = distinct !DILexicalBlock(scope: !788, file: !69, line: 702, column: 2)
!794 = !DILocation(line: 703, column: 16, scope: !792)
!795 = !DILocation(line: 703, column: 6, scope: !793)
!796 = !DILocation(line: 705, column: 4, scope: !797)
!797 = distinct !DILexicalBlock(scope: !792, file: !69, line: 704, column: 3)
!798 = !DILocation(line: 709, column: 4, scope: !799)
!799 = distinct !DILexicalBlock(scope: !792, file: !69, line: 708, column: 3)
!800 = !DILocation(line: 714, column: 14, scope: !801)
!801 = distinct !DILexicalBlock(scope: !788, file: !69, line: 713, column: 2)
!802 = !DILocation(line: 714, column: 28, scope: !801)
!803 = !DILocation(line: 714, column: 38, scope: !801)
!804 = !DILocation(line: 714, column: 37, scope: !801)
!805 = !DILocation(line: 714, column: 53, scope: !801)
!806 = !DILocation(line: 714, column: 51, scope: !801)
!807 = !DILocation(line: 714, column: 24, scope: !801)
!808 = !DILocation(line: 714, column: 66, scope: !801)
!809 = !DILocation(line: 714, column: 12, scope: !801)
!810 = !DILocation(line: 715, column: 16, scope: !801)
!811 = !DILocation(line: 715, column: 25, scope: !801)
!812 = !DILocation(line: 715, column: 24, scope: !801)
!813 = !DILocation(line: 715, column: 41, scope: !801)
!814 = !DILocation(line: 715, column: 51, scope: !801)
!815 = !DILocation(line: 715, column: 50, scope: !801)
!816 = !DILocation(line: 715, column: 38, scope: !801)
!817 = !DILocation(line: 715, column: 13, scope: !801)
!818 = !DILocation(line: 716, column: 6, scope: !819)
!819 = distinct !DILexicalBlock(scope: !801, file: !69, line: 716, column: 6)
!820 = !DILocation(line: 716, column: 16, scope: !819)
!821 = !DILocation(line: 716, column: 6, scope: !801)
!822 = !DILocation(line: 718, column: 7, scope: !823)
!823 = distinct !DILexicalBlock(scope: !824, file: !69, line: 718, column: 7)
!824 = distinct !DILexicalBlock(scope: !819, file: !69, line: 717, column: 3)
!825 = !DILocation(line: 718, column: 17, scope: !823)
!826 = !DILocation(line: 718, column: 7, scope: !824)
!827 = !DILocation(line: 720, column: 17, scope: !828)
!828 = distinct !DILexicalBlock(scope: !823, file: !69, line: 719, column: 4)
!829 = !DILocation(line: 720, column: 12, scope: !828)
!830 = !DILocation(line: 720, column: 5, scope: !828)
!831 = !DILocation(line: 724, column: 5, scope: !832)
!832 = distinct !DILexicalBlock(scope: !823, file: !69, line: 723, column: 4)
!833 = !DILocation(line: 729, column: 4, scope: !834)
!834 = distinct !DILexicalBlock(scope: !819, file: !69, line: 728, column: 3)
!835 = !DILocation(line: 732, column: 1, scope: !770)
!836 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 751, type: !837, scopeLine: 752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!837 = !DISubroutineType(types: !838)
!838 = !{!28, !20, !28, !20}
!839 = !DILocalVariable(name: "factor1", arg: 1, scope: !836, file: !69, line: 751, type: !20)
!840 = !DILocation(line: 751, column: 33, scope: !836)
!841 = !DILocalVariable(name: "factor2", arg: 2, scope: !836, file: !69, line: 751, type: !28)
!842 = !DILocation(line: 751, column: 46, scope: !836)
!843 = !DILocalVariable(name: "denominator", arg: 3, scope: !836, file: !69, line: 751, type: !20)
!844 = !DILocation(line: 751, column: 59, scope: !836)
!845 = !DILocalVariable(name: "u32Result", scope: !836, file: !69, line: 753, type: !517)
!846 = !DILocation(line: 753, column: 6, scope: !836)
!847 = !DILocalVariable(name: "u32Temp1", scope: !836, file: !69, line: 753, type: !517)
!848 = !DILocation(line: 753, column: 21, scope: !836)
!849 = !DILocalVariable(name: "s32Result", scope: !836, file: !69, line: 754, type: !12)
!850 = !DILocation(line: 754, column: 6, scope: !836)
!851 = !DILocalVariable(name: "s32Temp1", scope: !836, file: !69, line: 754, type: !12)
!852 = !DILocation(line: 754, column: 21, scope: !836)
!853 = !DILocation(line: 755, column: 14, scope: !836)
!854 = !DILocation(line: 755, column: 24, scope: !836)
!855 = !DILocation(line: 755, column: 22, scope: !836)
!856 = !DILocation(line: 755, column: 12, scope: !836)
!857 = !DILocation(line: 757, column: 5, scope: !858)
!858 = distinct !DILexicalBlock(scope: !836, file: !69, line: 757, column: 5)
!859 = !DILocation(line: 757, column: 17, scope: !858)
!860 = !DILocation(line: 757, column: 5, scope: !836)
!861 = !DILocation(line: 759, column: 6, scope: !862)
!862 = distinct !DILexicalBlock(scope: !863, file: !69, line: 759, column: 6)
!863 = distinct !DILexicalBlock(scope: !858, file: !69, line: 758, column: 2)
!864 = !DILocation(line: 759, column: 16, scope: !862)
!865 = !DILocation(line: 759, column: 6, scope: !863)
!866 = !DILocation(line: 761, column: 4, scope: !867)
!867 = distinct !DILexicalBlock(scope: !862, file: !69, line: 760, column: 3)
!868 = !DILocation(line: 765, column: 4, scope: !869)
!869 = distinct !DILexicalBlock(scope: !862, file: !69, line: 764, column: 3)
!870 = !DILocation(line: 770, column: 15, scope: !871)
!871 = distinct !DILexicalBlock(scope: !858, file: !69, line: 769, column: 2)
!872 = !DILocation(line: 770, column: 29, scope: !871)
!873 = !DILocation(line: 770, column: 39, scope: !871)
!874 = !DILocation(line: 770, column: 38, scope: !871)
!875 = !DILocation(line: 770, column: 54, scope: !871)
!876 = !DILocation(line: 770, column: 52, scope: !871)
!877 = !DILocation(line: 770, column: 25, scope: !871)
!878 = !DILocation(line: 770, column: 68, scope: !871)
!879 = !DILocation(line: 770, column: 12, scope: !871)
!880 = !DILocation(line: 771, column: 16, scope: !871)
!881 = !DILocation(line: 771, column: 25, scope: !871)
!882 = !DILocation(line: 771, column: 24, scope: !871)
!883 = !DILocation(line: 771, column: 41, scope: !871)
!884 = !DILocation(line: 771, column: 51, scope: !871)
!885 = !DILocation(line: 771, column: 50, scope: !871)
!886 = !DILocation(line: 771, column: 38, scope: !871)
!887 = !DILocation(line: 771, column: 13, scope: !871)
!888 = !DILocation(line: 772, column: 6, scope: !889)
!889 = distinct !DILexicalBlock(scope: !871, file: !69, line: 772, column: 6)
!890 = !DILocation(line: 772, column: 16, scope: !889)
!891 = !DILocation(line: 772, column: 6, scope: !871)
!892 = !DILocation(line: 774, column: 7, scope: !893)
!893 = distinct !DILexicalBlock(scope: !894, file: !69, line: 774, column: 7)
!894 = distinct !DILexicalBlock(scope: !889, file: !69, line: 773, column: 3)
!895 = !DILocation(line: 774, column: 17, scope: !893)
!896 = !DILocation(line: 774, column: 7, scope: !894)
!897 = !DILocation(line: 776, column: 17, scope: !898)
!898 = distinct !DILexicalBlock(scope: !893, file: !69, line: 775, column: 4)
!899 = !DILocation(line: 776, column: 12, scope: !898)
!900 = !DILocation(line: 776, column: 5, scope: !898)
!901 = !DILocation(line: 780, column: 5, scope: !902)
!902 = distinct !DILexicalBlock(scope: !893, file: !69, line: 779, column: 4)
!903 = !DILocation(line: 785, column: 4, scope: !904)
!904 = distinct !DILexicalBlock(scope: !889, file: !69, line: 784, column: 3)
!905 = !DILocation(line: 788, column: 1, scope: !836)
!906 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 807, type: !907, scopeLine: 808, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!907 = !DISubroutineType(types: !908)
!908 = !{!28, !20, !28, !28}
!909 = !DILocalVariable(name: "factor1", arg: 1, scope: !906, file: !69, line: 807, type: !20)
!910 = !DILocation(line: 807, column: 33, scope: !906)
!911 = !DILocalVariable(name: "factor2", arg: 2, scope: !906, file: !69, line: 807, type: !28)
!912 = !DILocation(line: 807, column: 46, scope: !906)
!913 = !DILocalVariable(name: "denominator", arg: 3, scope: !906, file: !69, line: 807, type: !28)
!914 = !DILocation(line: 807, column: 59, scope: !906)
!915 = !DILocalVariable(name: "s32Result", scope: !906, file: !69, line: 809, type: !12)
!916 = !DILocation(line: 809, column: 6, scope: !906)
!917 = !DILocalVariable(name: "s32Temp1", scope: !906, file: !69, line: 809, type: !12)
!918 = !DILocation(line: 809, column: 21, scope: !906)
!919 = !DILocation(line: 810, column: 14, scope: !906)
!920 = !DILocation(line: 810, column: 24, scope: !906)
!921 = !DILocation(line: 810, column: 22, scope: !906)
!922 = !DILocation(line: 810, column: 12, scope: !906)
!923 = !DILocation(line: 812, column: 5, scope: !924)
!924 = distinct !DILexicalBlock(scope: !906, file: !69, line: 812, column: 5)
!925 = !DILocation(line: 812, column: 17, scope: !924)
!926 = !DILocation(line: 812, column: 5, scope: !906)
!927 = !DILocation(line: 814, column: 6, scope: !928)
!928 = distinct !DILexicalBlock(scope: !929, file: !69, line: 814, column: 6)
!929 = distinct !DILexicalBlock(scope: !924, file: !69, line: 813, column: 2)
!930 = !DILocation(line: 814, column: 16, scope: !928)
!931 = !DILocation(line: 814, column: 6, scope: !929)
!932 = !DILocation(line: 816, column: 4, scope: !933)
!933 = distinct !DILexicalBlock(scope: !928, file: !69, line: 815, column: 3)
!934 = !DILocation(line: 820, column: 4, scope: !935)
!935 = distinct !DILexicalBlock(scope: !928, file: !69, line: 819, column: 3)
!936 = !DILocation(line: 825, column: 15, scope: !937)
!937 = distinct !DILexicalBlock(scope: !924, file: !69, line: 824, column: 2)
!938 = !DILocation(line: 825, column: 29, scope: !937)
!939 = !DILocation(line: 825, column: 39, scope: !937)
!940 = !DILocation(line: 825, column: 38, scope: !937)
!941 = !DILocation(line: 825, column: 54, scope: !937)
!942 = !DILocation(line: 825, column: 52, scope: !937)
!943 = !DILocation(line: 825, column: 25, scope: !937)
!944 = !DILocation(line: 825, column: 68, scope: !937)
!945 = !DILocation(line: 825, column: 12, scope: !937)
!946 = !DILocation(line: 826, column: 16, scope: !937)
!947 = !DILocation(line: 826, column: 25, scope: !937)
!948 = !DILocation(line: 826, column: 24, scope: !937)
!949 = !DILocation(line: 826, column: 41, scope: !937)
!950 = !DILocation(line: 826, column: 51, scope: !937)
!951 = !DILocation(line: 826, column: 50, scope: !937)
!952 = !DILocation(line: 826, column: 38, scope: !937)
!953 = !DILocation(line: 826, column: 13, scope: !937)
!954 = !DILocation(line: 827, column: 6, scope: !955)
!955 = distinct !DILexicalBlock(scope: !937, file: !69, line: 827, column: 6)
!956 = !DILocation(line: 827, column: 16, scope: !955)
!957 = !DILocation(line: 827, column: 6, scope: !937)
!958 = !DILocation(line: 829, column: 7, scope: !959)
!959 = distinct !DILexicalBlock(scope: !960, file: !69, line: 829, column: 7)
!960 = distinct !DILexicalBlock(scope: !955, file: !69, line: 828, column: 3)
!961 = !DILocation(line: 829, column: 17, scope: !959)
!962 = !DILocation(line: 829, column: 7, scope: !960)
!963 = !DILocation(line: 831, column: 17, scope: !964)
!964 = distinct !DILexicalBlock(scope: !959, file: !69, line: 830, column: 4)
!965 = !DILocation(line: 831, column: 12, scope: !964)
!966 = !DILocation(line: 831, column: 5, scope: !964)
!967 = !DILocation(line: 835, column: 5, scope: !968)
!968 = distinct !DILexicalBlock(scope: !959, file: !69, line: 834, column: 4)
!969 = !DILocation(line: 840, column: 4, scope: !970)
!970 = distinct !DILexicalBlock(scope: !955, file: !69, line: 839, column: 3)
!971 = !DILocation(line: 844, column: 1, scope: !906)
!972 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 862, type: !973, scopeLine: 863, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!973 = !DISubroutineType(types: !974)
!974 = !{!28, !28, !28, !28}
!975 = !DILocalVariable(name: "factor1", arg: 1, scope: !972, file: !69, line: 862, type: !28)
!976 = !DILocation(line: 862, column: 33, scope: !972)
!977 = !DILocalVariable(name: "factor2", arg: 2, scope: !972, file: !69, line: 862, type: !28)
!978 = !DILocation(line: 862, column: 46, scope: !972)
!979 = !DILocalVariable(name: "denominator", arg: 3, scope: !972, file: !69, line: 862, type: !28)
!980 = !DILocation(line: 862, column: 59, scope: !972)
!981 = !DILocalVariable(name: "u32Temp1", scope: !972, file: !69, line: 864, type: !517)
!982 = !DILocation(line: 864, column: 6, scope: !972)
!983 = !DILocalVariable(name: "u16TempDenom", scope: !972, file: !69, line: 865, type: !28)
!984 = !DILocation(line: 865, column: 6, scope: !972)
!985 = !DILocation(line: 867, column: 5, scope: !986)
!986 = distinct !DILexicalBlock(scope: !972, file: !69, line: 867, column: 5)
!987 = !DILocation(line: 867, column: 17, scope: !986)
!988 = !DILocation(line: 867, column: 5, scope: !972)
!989 = !DILocation(line: 869, column: 3, scope: !990)
!990 = distinct !DILexicalBlock(scope: !986, file: !69, line: 868, column: 2)
!991 = !DILocation(line: 873, column: 14, scope: !992)
!992 = distinct !DILexicalBlock(scope: !986, file: !69, line: 872, column: 2)
!993 = !DILocation(line: 873, column: 24, scope: !992)
!994 = !DILocation(line: 873, column: 22, scope: !992)
!995 = !DILocation(line: 873, column: 12, scope: !992)
!996 = !DILocation(line: 874, column: 18, scope: !992)
!997 = !DILocation(line: 874, column: 30, scope: !992)
!998 = !DILocation(line: 874, column: 16, scope: !992)
!999 = !DILocation(line: 875, column: 14, scope: !992)
!1000 = !DILocation(line: 875, column: 25, scope: !992)
!1001 = !DILocation(line: 875, column: 23, scope: !992)
!1002 = !DILocation(line: 875, column: 12, scope: !992)
!1003 = !DILocation(line: 876, column: 14, scope: !992)
!1004 = !DILocation(line: 876, column: 25, scope: !992)
!1005 = !DILocation(line: 876, column: 23, scope: !992)
!1006 = !DILocation(line: 876, column: 12, scope: !992)
!1007 = !DILocation(line: 877, column: 6, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !992, file: !69, line: 877, column: 6)
!1009 = !DILocation(line: 877, column: 15, scope: !1008)
!1010 = !DILocation(line: 877, column: 6, scope: !992)
!1011 = !DILocation(line: 879, column: 12, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 878, column: 3)
!1013 = !DILocation(line: 879, column: 21, scope: !1012)
!1014 = !DILocation(line: 879, column: 11, scope: !1012)
!1015 = !DILocation(line: 879, column: 4, scope: !1012)
!1016 = !DILocation(line: 884, column: 4, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 883, column: 3)
!1018 = !DILocation(line: 889, column: 1, scope: !972)
!1019 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 906, type: !1020, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!28, !28, !28, !517}
!1022 = !DILocalVariable(name: "factor1", arg: 1, scope: !1019, file: !69, line: 906, type: !28)
!1023 = !DILocation(line: 906, column: 33, scope: !1019)
!1024 = !DILocalVariable(name: "factor2", arg: 2, scope: !1019, file: !69, line: 906, type: !28)
!1025 = !DILocation(line: 906, column: 46, scope: !1019)
!1026 = !DILocalVariable(name: "denominator", arg: 3, scope: !1019, file: !69, line: 906, type: !517)
!1027 = !DILocation(line: 906, column: 59, scope: !1019)
!1028 = !DILocalVariable(name: "u32Temp1", scope: !1019, file: !69, line: 908, type: !517)
!1029 = !DILocation(line: 908, column: 6, scope: !1019)
!1030 = !DILocation(line: 909, column: 5, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 909, column: 5)
!1032 = !DILocation(line: 909, column: 17, scope: !1031)
!1033 = !DILocation(line: 909, column: 5, scope: !1019)
!1034 = !DILocation(line: 911, column: 3, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1031, file: !69, line: 910, column: 2)
!1036 = !DILocation(line: 915, column: 15, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1031, file: !69, line: 914, column: 2)
!1038 = !DILocation(line: 915, column: 25, scope: !1037)
!1039 = !DILocation(line: 915, column: 23, scope: !1037)
!1040 = !DILocation(line: 915, column: 36, scope: !1037)
!1041 = !DILocation(line: 915, column: 34, scope: !1037)
!1042 = !DILocation(line: 915, column: 12, scope: !1037)
!1043 = !DILocation(line: 916, column: 8, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 916, column: 6)
!1045 = !DILocation(line: 916, column: 18, scope: !1044)
!1046 = !DILocation(line: 916, column: 16, scope: !1044)
!1047 = !DILocation(line: 916, column: 28, scope: !1044)
!1048 = !DILocation(line: 916, column: 40, scope: !1044)
!1049 = !DILocation(line: 916, column: 39, scope: !1044)
!1050 = !DILocation(line: 916, column: 26, scope: !1044)
!1051 = !DILocation(line: 916, column: 53, scope: !1044)
!1052 = !DILocation(line: 916, column: 64, scope: !1044)
!1053 = !DILocation(line: 916, column: 50, scope: !1044)
!1054 = !DILocation(line: 916, column: 6, scope: !1037)
!1055 = !DILocation(line: 918, column: 12, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1044, file: !69, line: 917, column: 3)
!1057 = !DILocation(line: 919, column: 3, scope: !1056)
!1058 = !DILocation(line: 920, column: 6, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 920, column: 6)
!1060 = !DILocation(line: 920, column: 15, scope: !1059)
!1061 = !DILocation(line: 920, column: 6, scope: !1037)
!1062 = !DILocation(line: 922, column: 12, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1059, file: !69, line: 921, column: 3)
!1064 = !DILocation(line: 922, column: 21, scope: !1063)
!1065 = !DILocation(line: 922, column: 11, scope: !1063)
!1066 = !DILocation(line: 922, column: 4, scope: !1063)
!1067 = !DILocation(line: 926, column: 4, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1059, file: !69, line: 925, column: 3)
!1069 = !DILocation(line: 929, column: 1, scope: !1019)
!1070 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 946, type: !1071, scopeLine: 947, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!517, !517, !28}
!1073 = !DILocalVariable(name: "x_value", arg: 1, scope: !1070, file: !69, line: 946, type: !517)
!1074 = !DILocation(line: 946, column: 25, scope: !1070)
!1075 = !DILocalVariable(name: "y_value", arg: 2, scope: !1070, file: !69, line: 946, type: !28)
!1076 = !DILocation(line: 946, column: 38, scope: !1070)
!1077 = !DILocalVariable(name: "u32Temp1", scope: !1070, file: !69, line: 948, type: !517)
!1078 = !DILocation(line: 948, column: 6, scope: !1070)
!1079 = !DILocation(line: 949, column: 5, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1070, file: !69, line: 949, column: 5)
!1081 = !DILocation(line: 949, column: 13, scope: !1080)
!1082 = !DILocation(line: 949, column: 5, scope: !1070)
!1083 = !DILocation(line: 951, column: 3, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1080, file: !69, line: 950, column: 2)
!1085 = !DILocation(line: 955, column: 15, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1080, file: !69, line: 954, column: 2)
!1087 = !DILocation(line: 955, column: 26, scope: !1086)
!1088 = !DILocation(line: 955, column: 34, scope: !1086)
!1089 = !DILocation(line: 955, column: 33, scope: !1086)
!1090 = !DILocation(line: 955, column: 45, scope: !1086)
!1091 = !DILocation(line: 955, column: 43, scope: !1086)
!1092 = !DILocation(line: 955, column: 23, scope: !1086)
!1093 = !DILocation(line: 955, column: 54, scope: !1086)
!1094 = !DILocation(line: 955, column: 12, scope: !1086)
!1095 = !DILocation(line: 956, column: 15, scope: !1086)
!1096 = !DILocation(line: 956, column: 23, scope: !1086)
!1097 = !DILocation(line: 956, column: 22, scope: !1086)
!1098 = !DILocation(line: 956, column: 35, scope: !1086)
!1099 = !DILocation(line: 956, column: 44, scope: !1086)
!1100 = !DILocation(line: 956, column: 43, scope: !1086)
!1101 = !DILocation(line: 956, column: 32, scope: !1086)
!1102 = !DILocation(line: 956, column: 12, scope: !1086)
!1103 = !DILocation(line: 957, column: 10, scope: !1086)
!1104 = !DILocation(line: 957, column: 3, scope: !1086)
!1105 = !DILocation(line: 959, column: 1, scope: !1070)
!1106 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 977, type: !1107, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!20, !20, !20, !20}
!1109 = !DILocalVariable(name: "fak1", arg: 1, scope: !1106, file: !69, line: 977, type: !20)
!1110 = !DILocation(line: 977, column: 33, scope: !1106)
!1111 = !DILocalVariable(name: "fak2", arg: 2, scope: !1106, file: !69, line: 977, type: !20)
!1112 = !DILocation(line: 977, column: 43, scope: !1106)
!1113 = !DILocalVariable(name: "div", arg: 3, scope: !1106, file: !69, line: 977, type: !20)
!1114 = !DILocation(line: 977, column: 53, scope: !1106)
!1115 = !DILocalVariable(name: "s32Temp1", scope: !1106, file: !69, line: 979, type: !12)
!1116 = !DILocation(line: 979, column: 6, scope: !1106)
!1117 = !DILocalVariable(name: "s32Temp2", scope: !1106, file: !69, line: 979, type: !12)
!1118 = !DILocation(line: 979, column: 20, scope: !1106)
!1119 = !DILocalVariable(name: "s32Temp3", scope: !1106, file: !69, line: 979, type: !12)
!1120 = !DILocation(line: 979, column: 34, scope: !1106)
!1121 = !DILocation(line: 980, column: 13, scope: !1106)
!1122 = !DILocation(line: 980, column: 20, scope: !1106)
!1123 = !DILocation(line: 980, column: 18, scope: !1106)
!1124 = !DILocation(line: 980, column: 11, scope: !1106)
!1125 = !DILocation(line: 981, column: 5, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1106, file: !69, line: 981, column: 5)
!1127 = !DILocation(line: 981, column: 9, scope: !1126)
!1128 = !DILocation(line: 981, column: 5, scope: !1106)
!1129 = !DILocation(line: 983, column: 6, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1131, file: !69, line: 983, column: 6)
!1131 = distinct !DILexicalBlock(scope: !1126, file: !69, line: 982, column: 2)
!1132 = !DILocation(line: 983, column: 15, scope: !1130)
!1133 = !DILocation(line: 983, column: 6, scope: !1131)
!1134 = !DILocation(line: 985, column: 4, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1130, file: !69, line: 984, column: 3)
!1136 = !DILocation(line: 989, column: 4, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1130, file: !69, line: 988, column: 3)
!1138 = !DILocation(line: 994, column: 15, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1126, file: !69, line: 993, column: 2)
!1140 = !DILocation(line: 994, column: 28, scope: !1139)
!1141 = !DILocation(line: 994, column: 39, scope: !1139)
!1142 = !DILocation(line: 994, column: 37, scope: !1139)
!1143 = !DILocation(line: 994, column: 46, scope: !1139)
!1144 = !DILocation(line: 994, column: 44, scope: !1139)
!1145 = !DILocation(line: 994, column: 24, scope: !1139)
!1146 = !DILocation(line: 994, column: 52, scope: !1139)
!1147 = !DILocation(line: 994, column: 12, scope: !1139)
!1148 = !DILocation(line: 995, column: 15, scope: !1139)
!1149 = !DILocation(line: 995, column: 24, scope: !1139)
!1150 = !DILocation(line: 995, column: 23, scope: !1139)
!1151 = !DILocation(line: 995, column: 32, scope: !1139)
!1152 = !DILocation(line: 995, column: 41, scope: !1139)
!1153 = !DILocation(line: 995, column: 40, scope: !1139)
!1154 = !DILocation(line: 995, column: 29, scope: !1139)
!1155 = !DILocation(line: 995, column: 12, scope: !1139)
!1156 = !DILocation(line: 996, column: 6, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1139, file: !69, line: 996, column: 6)
!1158 = !DILocation(line: 996, column: 15, scope: !1157)
!1159 = !DILocation(line: 996, column: 6, scope: !1139)
!1160 = !DILocation(line: 998, column: 7, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1162, file: !69, line: 998, column: 7)
!1162 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 997, column: 3)
!1163 = !DILocation(line: 998, column: 16, scope: !1161)
!1164 = !DILocation(line: 998, column: 7, scope: !1162)
!1165 = !DILocation(line: 1000, column: 17, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1161, file: !69, line: 999, column: 4)
!1167 = !DILocation(line: 1000, column: 12, scope: !1166)
!1168 = !DILocation(line: 1000, column: 5, scope: !1166)
!1169 = !DILocation(line: 1004, column: 5, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1161, file: !69, line: 1003, column: 4)
!1171 = !DILocation(line: 1009, column: 4, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 1008, column: 3)
!1173 = !DILocation(line: 1012, column: 1, scope: !1106)
!1174 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1030, type: !1175, scopeLine: 1031, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!20, !20, !20, !28}
!1177 = !DILocalVariable(name: "data1", arg: 1, scope: !1174, file: !69, line: 1030, type: !20)
!1178 = !DILocation(line: 1030, column: 33, scope: !1174)
!1179 = !DILocalVariable(name: "data2", arg: 2, scope: !1174, file: !69, line: 1030, type: !20)
!1180 = !DILocation(line: 1030, column: 43, scope: !1174)
!1181 = !DILocalVariable(name: "denominator", arg: 3, scope: !1174, file: !69, line: 1030, type: !28)
!1182 = !DILocation(line: 1030, column: 53, scope: !1174)
!1183 = !DILocalVariable(name: "s32Result", scope: !1174, file: !69, line: 1032, type: !12)
!1184 = !DILocation(line: 1032, column: 6, scope: !1174)
!1185 = !DILocalVariable(name: "s32Temp1", scope: !1174, file: !69, line: 1032, type: !12)
!1186 = !DILocation(line: 1032, column: 21, scope: !1174)
!1187 = !DILocation(line: 1033, column: 14, scope: !1174)
!1188 = !DILocation(line: 1033, column: 22, scope: !1174)
!1189 = !DILocation(line: 1033, column: 20, scope: !1174)
!1190 = !DILocation(line: 1033, column: 12, scope: !1174)
!1191 = !DILocation(line: 1035, column: 5, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1174, file: !69, line: 1035, column: 5)
!1193 = !DILocation(line: 1035, column: 17, scope: !1192)
!1194 = !DILocation(line: 1035, column: 5, scope: !1174)
!1195 = !DILocation(line: 1037, column: 6, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1197, file: !69, line: 1037, column: 6)
!1197 = distinct !DILexicalBlock(scope: !1192, file: !69, line: 1036, column: 2)
!1198 = !DILocation(line: 1037, column: 16, scope: !1196)
!1199 = !DILocation(line: 1037, column: 6, scope: !1197)
!1200 = !DILocation(line: 1039, column: 4, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1196, file: !69, line: 1038, column: 3)
!1202 = !DILocation(line: 1041, column: 11, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1196, file: !69, line: 1041, column: 11)
!1204 = !DILocation(line: 1041, column: 21, scope: !1203)
!1205 = !DILocation(line: 1041, column: 11, scope: !1196)
!1206 = !DILocation(line: 1043, column: 4, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 1042, column: 3)
!1208 = !DILocation(line: 1047, column: 4, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 1046, column: 3)
!1210 = !DILocation(line: 1052, column: 15, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1192, file: !69, line: 1051, column: 2)
!1212 = !DILocation(line: 1052, column: 28, scope: !1211)
!1213 = !DILocation(line: 1052, column: 38, scope: !1211)
!1214 = !DILocation(line: 1052, column: 37, scope: !1211)
!1215 = !DILocation(line: 1052, column: 51, scope: !1211)
!1216 = !DILocation(line: 1052, column: 50, scope: !1211)
!1217 = !DILocation(line: 1052, column: 25, scope: !1211)
!1218 = !DILocation(line: 1052, column: 64, scope: !1211)
!1219 = !DILocation(line: 1052, column: 12, scope: !1211)
!1220 = !DILocation(line: 1053, column: 16, scope: !1211)
!1221 = !DILocation(line: 1053, column: 25, scope: !1211)
!1222 = !DILocation(line: 1053, column: 24, scope: !1211)
!1223 = !DILocation(line: 1053, column: 41, scope: !1211)
!1224 = !DILocation(line: 1053, column: 51, scope: !1211)
!1225 = !DILocation(line: 1053, column: 50, scope: !1211)
!1226 = !DILocation(line: 1053, column: 38, scope: !1211)
!1227 = !DILocation(line: 1053, column: 13, scope: !1211)
!1228 = !DILocation(line: 1054, column: 6, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1211, file: !69, line: 1054, column: 6)
!1230 = !DILocation(line: 1054, column: 16, scope: !1229)
!1231 = !DILocation(line: 1054, column: 6, scope: !1211)
!1232 = !DILocation(line: 1056, column: 7, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1234, file: !69, line: 1056, column: 7)
!1234 = distinct !DILexicalBlock(scope: !1229, file: !69, line: 1055, column: 3)
!1235 = !DILocation(line: 1056, column: 17, scope: !1233)
!1236 = !DILocation(line: 1056, column: 7, scope: !1234)
!1237 = !DILocation(line: 1058, column: 17, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1233, file: !69, line: 1057, column: 4)
!1239 = !DILocation(line: 1058, column: 12, scope: !1238)
!1240 = !DILocation(line: 1058, column: 5, scope: !1238)
!1241 = !DILocation(line: 1062, column: 5, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1233, file: !69, line: 1061, column: 4)
!1243 = !DILocation(line: 1067, column: 4, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1229, file: !69, line: 1066, column: 3)
!1245 = !DILocation(line: 1071, column: 1, scope: !1174)
!1246 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1088, type: !1247, scopeLine: 1089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!517, !517, !12}
!1249 = !DILocalVariable(name: "numerator", arg: 1, scope: !1246, file: !69, line: 1088, type: !517)
!1250 = !DILocation(line: 1088, column: 25, scope: !1246)
!1251 = !DILocalVariable(name: "denominator", arg: 2, scope: !1246, file: !69, line: 1088, type: !12)
!1252 = !DILocation(line: 1088, column: 40, scope: !1246)
!1253 = !DILocalVariable(name: "u32Temp1", scope: !1246, file: !69, line: 1090, type: !517)
!1254 = !DILocation(line: 1090, column: 6, scope: !1246)
!1255 = !DILocation(line: 1091, column: 5, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1246, file: !69, line: 1091, column: 5)
!1257 = !DILocation(line: 1091, column: 17, scope: !1256)
!1258 = !DILocation(line: 1091, column: 5, scope: !1246)
!1259 = !DILocation(line: 1093, column: 3, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1256, file: !69, line: 1092, column: 2)
!1261 = !DILocation(line: 1097, column: 6, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1097, column: 6)
!1263 = distinct !DILexicalBlock(scope: !1256, file: !69, line: 1096, column: 2)
!1264 = !DILocation(line: 1097, column: 18, scope: !1262)
!1265 = !DILocation(line: 1097, column: 6, scope: !1263)
!1266 = !DILocation(line: 1099, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1098, column: 3)
!1268 = !DILocation(line: 1103, column: 16, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1102, column: 3)
!1270 = !DILocation(line: 1103, column: 30, scope: !1269)
!1271 = !DILocation(line: 1103, column: 40, scope: !1269)
!1272 = !DILocation(line: 1103, column: 39, scope: !1269)
!1273 = !DILocation(line: 1103, column: 55, scope: !1269)
!1274 = !DILocation(line: 1103, column: 53, scope: !1269)
!1275 = !DILocation(line: 1103, column: 26, scope: !1269)
!1276 = !DILocation(line: 1103, column: 68, scope: !1269)
!1277 = !DILocation(line: 1103, column: 13, scope: !1269)
!1278 = !DILocation(line: 1104, column: 16, scope: !1269)
!1279 = !DILocation(line: 1104, column: 25, scope: !1269)
!1280 = !DILocation(line: 1104, column: 24, scope: !1269)
!1281 = !DILocation(line: 1104, column: 41, scope: !1269)
!1282 = !DILocation(line: 1104, column: 51, scope: !1269)
!1283 = !DILocation(line: 1104, column: 50, scope: !1269)
!1284 = !DILocation(line: 1104, column: 38, scope: !1269)
!1285 = !DILocation(line: 1104, column: 13, scope: !1269)
!1286 = !DILocation(line: 1105, column: 11, scope: !1269)
!1287 = !DILocation(line: 1105, column: 4, scope: !1269)
!1288 = !DILocation(line: 1108, column: 1, scope: !1246)
!1289 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1125, type: !1290, scopeLine: 1126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!517, !12, !517}
!1292 = !DILocalVariable(name: "numerator", arg: 1, scope: !1289, file: !69, line: 1125, type: !12)
!1293 = !DILocation(line: 1125, column: 25, scope: !1289)
!1294 = !DILocalVariable(name: "denominator", arg: 2, scope: !1289, file: !69, line: 1125, type: !517)
!1295 = !DILocation(line: 1125, column: 40, scope: !1289)
!1296 = !DILocalVariable(name: "s32Temp1", scope: !1289, file: !69, line: 1127, type: !12)
!1297 = !DILocation(line: 1127, column: 6, scope: !1289)
!1298 = !DILocation(line: 1128, column: 5, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1289, file: !69, line: 1128, column: 5)
!1300 = !DILocation(line: 1128, column: 17, scope: !1299)
!1301 = !DILocation(line: 1128, column: 5, scope: !1289)
!1302 = !DILocation(line: 1130, column: 6, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1304, file: !69, line: 1130, column: 6)
!1304 = distinct !DILexicalBlock(scope: !1299, file: !69, line: 1129, column: 2)
!1305 = !DILocation(line: 1130, column: 16, scope: !1303)
!1306 = !DILocation(line: 1130, column: 6, scope: !1304)
!1307 = !DILocation(line: 1132, column: 4, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1131, column: 3)
!1309 = !DILocation(line: 1136, column: 4, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1135, column: 3)
!1311 = !DILocation(line: 1141, column: 6, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !69, line: 1141, column: 6)
!1313 = distinct !DILexicalBlock(scope: !1299, file: !69, line: 1140, column: 2)
!1314 = !DILocation(line: 1141, column: 16, scope: !1312)
!1315 = !DILocation(line: 1141, column: 6, scope: !1313)
!1316 = !DILocation(line: 1143, column: 17, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1142, column: 3)
!1318 = !DILocation(line: 1143, column: 31, scope: !1317)
!1319 = !DILocation(line: 1143, column: 41, scope: !1317)
!1320 = !DILocation(line: 1143, column: 40, scope: !1317)
!1321 = !DILocation(line: 1143, column: 56, scope: !1317)
!1322 = !DILocation(line: 1143, column: 54, scope: !1317)
!1323 = !DILocation(line: 1143, column: 27, scope: !1317)
!1324 = !DILocation(line: 1143, column: 69, scope: !1317)
!1325 = !DILocation(line: 1143, column: 13, scope: !1317)
!1326 = !DILocation(line: 1144, column: 13, scope: !1317)
!1327 = !DILocation(line: 1144, column: 23, scope: !1317)
!1328 = !DILocation(line: 1144, column: 22, scope: !1317)
!1329 = !DILocation(line: 1144, column: 39, scope: !1317)
!1330 = !DILocation(line: 1144, column: 48, scope: !1317)
!1331 = !DILocation(line: 1144, column: 47, scope: !1317)
!1332 = !DILocation(line: 1144, column: 36, scope: !1317)
!1333 = !DILocation(line: 1144, column: 4, scope: !1317)
!1334 = !DILocation(line: 1148, column: 4, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1147, column: 3)
!1336 = !DILocation(line: 1151, column: 1, scope: !1289)
!1337 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1168, type: !1338, scopeLine: 1169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{!517, !12, !12}
!1340 = !DILocalVariable(name: "numerator", arg: 1, scope: !1337, file: !69, line: 1168, type: !12)
!1341 = !DILocation(line: 1168, column: 25, scope: !1337)
!1342 = !DILocalVariable(name: "denominator", arg: 2, scope: !1337, file: !69, line: 1168, type: !12)
!1343 = !DILocation(line: 1168, column: 40, scope: !1337)
!1344 = !DILocalVariable(name: "u32Temp1", scope: !1337, file: !69, line: 1170, type: !517)
!1345 = !DILocation(line: 1170, column: 6, scope: !1337)
!1346 = !DILocalVariable(name: "u32Temp2", scope: !1337, file: !69, line: 1170, type: !517)
!1347 = !DILocation(line: 1170, column: 20, scope: !1337)
!1348 = !DILocation(line: 1171, column: 5, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1337, file: !69, line: 1171, column: 5)
!1350 = !DILocation(line: 1171, column: 17, scope: !1349)
!1351 = !DILocation(line: 1171, column: 5, scope: !1337)
!1352 = !DILocation(line: 1173, column: 6, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1354, file: !69, line: 1173, column: 6)
!1354 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1172, column: 2)
!1355 = !DILocation(line: 1173, column: 16, scope: !1353)
!1356 = !DILocation(line: 1173, column: 6, scope: !1354)
!1357 = !DILocation(line: 1175, column: 4, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1174, column: 3)
!1359 = !DILocation(line: 1179, column: 4, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1178, column: 3)
!1361 = !DILocation(line: 1184, column: 6, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1363, file: !69, line: 1184, column: 6)
!1363 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1183, column: 2)
!1364 = !DILocation(line: 1184, column: 16, scope: !1362)
!1365 = !DILocation(line: 1184, column: 6, scope: !1363)
!1366 = !DILocation(line: 1186, column: 7, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1186, column: 7)
!1368 = distinct !DILexicalBlock(scope: !1362, file: !69, line: 1185, column: 3)
!1369 = !DILocation(line: 1186, column: 17, scope: !1367)
!1370 = !DILocation(line: 1186, column: 7, scope: !1368)
!1371 = !DILocation(line: 1188, column: 5, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1187, column: 4)
!1373 = !DILocation(line: 1192, column: 8, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1375, file: !69, line: 1192, column: 8)
!1375 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1191, column: 4)
!1376 = !DILocation(line: 1192, column: 20, scope: !1374)
!1377 = !DILocation(line: 1192, column: 8, scope: !1375)
!1378 = !DILocation(line: 1194, column: 6, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1193, column: 5)
!1380 = !DILocation(line: 1198, column: 18, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1197, column: 5)
!1382 = !DILocation(line: 1198, column: 32, scope: !1381)
!1383 = !DILocation(line: 1198, column: 42, scope: !1381)
!1384 = !DILocation(line: 1198, column: 41, scope: !1381)
!1385 = !DILocation(line: 1198, column: 57, scope: !1381)
!1386 = !DILocation(line: 1198, column: 55, scope: !1381)
!1387 = !DILocation(line: 1198, column: 28, scope: !1381)
!1388 = !DILocation(line: 1198, column: 71, scope: !1381)
!1389 = !DILocation(line: 1198, column: 15, scope: !1381)
!1390 = !DILocation(line: 1199, column: 18, scope: !1381)
!1391 = !DILocation(line: 1199, column: 29, scope: !1381)
!1392 = !DILocation(line: 1199, column: 27, scope: !1381)
!1393 = !DILocation(line: 1199, column: 45, scope: !1381)
!1394 = !DILocation(line: 1199, column: 57, scope: !1381)
!1395 = !DILocation(line: 1199, column: 55, scope: !1381)
!1396 = !DILocation(line: 1199, column: 42, scope: !1381)
!1397 = !DILocation(line: 1199, column: 15, scope: !1381)
!1398 = !DILocation(line: 1200, column: 13, scope: !1381)
!1399 = !DILocation(line: 1200, column: 6, scope: !1381)
!1400 = !DILocation(line: 1206, column: 7, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !69, line: 1206, column: 7)
!1402 = distinct !DILexicalBlock(scope: !1362, file: !69, line: 1205, column: 3)
!1403 = !DILocation(line: 1206, column: 19, scope: !1401)
!1404 = !DILocation(line: 1206, column: 7, scope: !1402)
!1405 = !DILocation(line: 1208, column: 5, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1207, column: 4)
!1407 = !DILocation(line: 1212, column: 18, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1211, column: 4)
!1409 = !DILocation(line: 1212, column: 17, scope: !1408)
!1410 = !DILocation(line: 1212, column: 15, scope: !1408)
!1411 = !DILocation(line: 1213, column: 20, scope: !1408)
!1412 = !DILocation(line: 1213, column: 19, scope: !1408)
!1413 = !DILocation(line: 1213, column: 17, scope: !1408)
!1414 = !DILocation(line: 1214, column: 17, scope: !1408)
!1415 = !DILocation(line: 1214, column: 31, scope: !1408)
!1416 = !DILocation(line: 1214, column: 41, scope: !1408)
!1417 = !DILocation(line: 1214, column: 40, scope: !1408)
!1418 = !DILocation(line: 1214, column: 56, scope: !1408)
!1419 = !DILocation(line: 1214, column: 54, scope: !1408)
!1420 = !DILocation(line: 1214, column: 27, scope: !1408)
!1421 = !DILocation(line: 1214, column: 70, scope: !1408)
!1422 = !DILocation(line: 1214, column: 14, scope: !1408)
!1423 = !DILocation(line: 1215, column: 17, scope: !1408)
!1424 = !DILocation(line: 1215, column: 28, scope: !1408)
!1425 = !DILocation(line: 1215, column: 26, scope: !1408)
!1426 = !DILocation(line: 1215, column: 44, scope: !1408)
!1427 = !DILocation(line: 1215, column: 56, scope: !1408)
!1428 = !DILocation(line: 1215, column: 54, scope: !1408)
!1429 = !DILocation(line: 1215, column: 41, scope: !1408)
!1430 = !DILocation(line: 1215, column: 14, scope: !1408)
!1431 = !DILocation(line: 1216, column: 12, scope: !1408)
!1432 = !DILocation(line: 1216, column: 5, scope: !1408)
!1433 = !DILocation(line: 1221, column: 1, scope: !1337)
!1434 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1238, type: !1435, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{!517, !517, !517}
!1437 = !DILocalVariable(name: "numerator", arg: 1, scope: !1434, file: !69, line: 1238, type: !517)
!1438 = !DILocation(line: 1238, column: 25, scope: !1434)
!1439 = !DILocalVariable(name: "denominator", arg: 2, scope: !1434, file: !69, line: 1238, type: !517)
!1440 = !DILocation(line: 1238, column: 40, scope: !1434)
!1441 = !DILocalVariable(name: "u32Temp1", scope: !1434, file: !69, line: 1241, type: !517)
!1442 = !DILocation(line: 1241, column: 6, scope: !1434)
!1443 = !DILocalVariable(name: "u32Temp2", scope: !1434, file: !69, line: 1241, type: !517)
!1444 = !DILocation(line: 1241, column: 20, scope: !1434)
!1445 = !DILocalVariable(name: "u32Temp3", scope: !1434, file: !69, line: 1241, type: !517)
!1446 = !DILocation(line: 1241, column: 34, scope: !1434)
!1447 = !DILocalVariable(name: "numerator_old", scope: !1434, file: !69, line: 1241, type: !517)
!1448 = !DILocation(line: 1241, column: 48, scope: !1434)
!1449 = !DILocation(line: 1242, column: 5, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1434, file: !69, line: 1242, column: 5)
!1451 = !DILocation(line: 1242, column: 16, scope: !1450)
!1452 = !DILocation(line: 1242, column: 5, scope: !1434)
!1453 = !DILocation(line: 1244, column: 3, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1450, file: !69, line: 1243, column: 2)
!1455 = !DILocation(line: 1248, column: 14, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1450, file: !69, line: 1247, column: 2)
!1457 = !DILocation(line: 1248, column: 26, scope: !1456)
!1458 = !DILocation(line: 1248, column: 41, scope: !1456)
!1459 = !DILocation(line: 1248, column: 51, scope: !1456)
!1460 = !DILocation(line: 1248, column: 50, scope: !1456)
!1461 = !DILocation(line: 1248, column: 38, scope: !1456)
!1462 = !DILocation(line: 1248, column: 24, scope: !1456)
!1463 = !DILocation(line: 1248, column: 12, scope: !1456)
!1464 = !DILocation(line: 1249, column: 7, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1456, file: !69, line: 1249, column: 6)
!1466 = !DILocation(line: 1249, column: 16, scope: !1465)
!1467 = !DILocation(line: 1249, column: 24, scope: !1465)
!1468 = !DILocation(line: 1249, column: 6, scope: !1456)
!1469 = !DILocation(line: 1251, column: 16, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1465, file: !69, line: 1250, column: 3)
!1471 = !DILocation(line: 1251, column: 27, scope: !1470)
!1472 = !DILocation(line: 1251, column: 13, scope: !1470)
!1473 = !DILocation(line: 1252, column: 3, scope: !1470)
!1474 = !DILocation(line: 1255, column: 16, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1465, file: !69, line: 1254, column: 3)
!1476 = !DILocation(line: 1255, column: 27, scope: !1475)
!1477 = !DILocation(line: 1255, column: 32, scope: !1475)
!1478 = !DILocation(line: 1255, column: 13, scope: !1475)
!1479 = !DILocation(line: 1258, column: 6, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1456, file: !69, line: 1258, column: 6)
!1481 = !DILocation(line: 1258, column: 17, scope: !1480)
!1482 = !DILocation(line: 1258, column: 15, scope: !1480)
!1483 = !DILocation(line: 1258, column: 6, scope: !1456)
!1484 = !DILocation(line: 1260, column: 12, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1480, file: !69, line: 1259, column: 3)
!1486 = !DILocation(line: 1260, column: 22, scope: !1485)
!1487 = !DILocation(line: 1260, column: 21, scope: !1485)
!1488 = !DILocation(line: 1260, column: 4, scope: !1485)
!1489 = !DILocation(line: 1264, column: 13, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1480, file: !69, line: 1263, column: 3)
!1491 = !DILocation(line: 1264, column: 23, scope: !1490)
!1492 = !DILocation(line: 1264, column: 22, scope: !1490)
!1493 = !DILocation(line: 1264, column: 36, scope: !1490)
!1494 = !DILocation(line: 1264, column: 4, scope: !1490)
!1495 = !DILocation(line: 1269, column: 1, scope: !1434)
!1496 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1286, type: !1497, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1497 = !DISubroutineType(types: !1498)
!1498 = !{!12, !517, !12}
!1499 = !DILocalVariable(name: "numerator", arg: 1, scope: !1496, file: !69, line: 1286, type: !517)
!1500 = !DILocation(line: 1286, column: 25, scope: !1496)
!1501 = !DILocalVariable(name: "denominator", arg: 2, scope: !1496, file: !69, line: 1286, type: !12)
!1502 = !DILocation(line: 1286, column: 40, scope: !1496)
!1503 = !DILocalVariable(name: "u32Temp1", scope: !1496, file: !69, line: 1288, type: !517)
!1504 = !DILocation(line: 1288, column: 6, scope: !1496)
!1505 = !DILocalVariable(name: "u32Temp2", scope: !1496, file: !69, line: 1288, type: !517)
!1506 = !DILocation(line: 1288, column: 20, scope: !1496)
!1507 = !DILocation(line: 1289, column: 5, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1496, file: !69, line: 1289, column: 5)
!1509 = !DILocation(line: 1289, column: 17, scope: !1508)
!1510 = !DILocation(line: 1289, column: 5, scope: !1496)
!1511 = !DILocation(line: 1291, column: 6, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1513, file: !69, line: 1291, column: 6)
!1513 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1290, column: 2)
!1514 = !DILocation(line: 1291, column: 18, scope: !1512)
!1515 = !DILocation(line: 1291, column: 6, scope: !1513)
!1516 = !DILocation(line: 1293, column: 4, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1512, file: !69, line: 1292, column: 3)
!1518 = !DILocation(line: 1297, column: 19, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1512, file: !69, line: 1296, column: 3)
!1520 = !DILocation(line: 1297, column: 18, scope: !1519)
!1521 = !DILocation(line: 1297, column: 16, scope: !1519)
!1522 = !DILocation(line: 1298, column: 16, scope: !1519)
!1523 = !DILocation(line: 1298, column: 30, scope: !1519)
!1524 = !DILocation(line: 1298, column: 40, scope: !1519)
!1525 = !DILocation(line: 1298, column: 39, scope: !1519)
!1526 = !DILocation(line: 1298, column: 55, scope: !1519)
!1527 = !DILocation(line: 1298, column: 53, scope: !1519)
!1528 = !DILocation(line: 1298, column: 26, scope: !1519)
!1529 = !DILocation(line: 1298, column: 69, scope: !1519)
!1530 = !DILocation(line: 1298, column: 13, scope: !1519)
!1531 = !DILocation(line: 1299, column: 16, scope: !1519)
!1532 = !DILocation(line: 1299, column: 25, scope: !1519)
!1533 = !DILocation(line: 1299, column: 24, scope: !1519)
!1534 = !DILocation(line: 1299, column: 41, scope: !1519)
!1535 = !DILocation(line: 1299, column: 51, scope: !1519)
!1536 = !DILocation(line: 1299, column: 50, scope: !1519)
!1537 = !DILocation(line: 1299, column: 38, scope: !1519)
!1538 = !DILocation(line: 1299, column: 13, scope: !1519)
!1539 = !DILocation(line: 1300, column: 7, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1300, column: 7)
!1541 = !DILocation(line: 1300, column: 16, scope: !1540)
!1542 = !DILocation(line: 1300, column: 7, scope: !1519)
!1543 = !DILocation(line: 1302, column: 13, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1540, file: !69, line: 1301, column: 4)
!1545 = !DILocation(line: 1302, column: 12, scope: !1544)
!1546 = !DILocation(line: 1302, column: 5, scope: !1544)
!1547 = !DILocation(line: 1306, column: 5, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1540, file: !69, line: 1305, column: 4)
!1549 = !DILocation(line: 1312, column: 15, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1311, column: 2)
!1551 = !DILocation(line: 1312, column: 29, scope: !1550)
!1552 = !DILocation(line: 1312, column: 39, scope: !1550)
!1553 = !DILocation(line: 1312, column: 38, scope: !1550)
!1554 = !DILocation(line: 1312, column: 54, scope: !1550)
!1555 = !DILocation(line: 1312, column: 52, scope: !1550)
!1556 = !DILocation(line: 1312, column: 25, scope: !1550)
!1557 = !DILocation(line: 1312, column: 68, scope: !1550)
!1558 = !DILocation(line: 1312, column: 12, scope: !1550)
!1559 = !DILocation(line: 1313, column: 15, scope: !1550)
!1560 = !DILocation(line: 1313, column: 24, scope: !1550)
!1561 = !DILocation(line: 1313, column: 23, scope: !1550)
!1562 = !DILocation(line: 1313, column: 40, scope: !1550)
!1563 = !DILocation(line: 1313, column: 50, scope: !1550)
!1564 = !DILocation(line: 1313, column: 49, scope: !1550)
!1565 = !DILocation(line: 1313, column: 37, scope: !1550)
!1566 = !DILocation(line: 1313, column: 12, scope: !1550)
!1567 = !DILocation(line: 1314, column: 6, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1550, file: !69, line: 1314, column: 6)
!1569 = !DILocation(line: 1314, column: 15, scope: !1568)
!1570 = !DILocation(line: 1314, column: 6, scope: !1550)
!1571 = !DILocation(line: 1316, column: 11, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1568, file: !69, line: 1315, column: 3)
!1573 = !DILocation(line: 1316, column: 4, scope: !1572)
!1574 = !DILocation(line: 1320, column: 4, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1568, file: !69, line: 1319, column: 3)
!1576 = !DILocation(line: 1323, column: 1, scope: !1496)
!1577 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1341, type: !1578, scopeLine: 1342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1578 = !DISubroutineType(types: !1579)
!1579 = !{!12, !12, !517}
!1580 = !DILocalVariable(name: "numerator", arg: 1, scope: !1577, file: !69, line: 1341, type: !12)
!1581 = !DILocation(line: 1341, column: 25, scope: !1577)
!1582 = !DILocalVariable(name: "denominator", arg: 2, scope: !1577, file: !69, line: 1341, type: !517)
!1583 = !DILocation(line: 1341, column: 40, scope: !1577)
!1584 = !DILocalVariable(name: "s32Temp1", scope: !1577, file: !69, line: 1343, type: !12)
!1585 = !DILocation(line: 1343, column: 6, scope: !1577)
!1586 = !DILocalVariable(name: "s32Temp2", scope: !1577, file: !69, line: 1343, type: !12)
!1587 = !DILocation(line: 1343, column: 20, scope: !1577)
!1588 = !DILocalVariable(name: "u32Temp0", scope: !1577, file: !69, line: 1344, type: !517)
!1589 = !DILocation(line: 1344, column: 6, scope: !1577)
!1590 = !DILocalVariable(name: "u32Temp1", scope: !1577, file: !69, line: 1344, type: !517)
!1591 = !DILocation(line: 1344, column: 20, scope: !1577)
!1592 = !DILocalVariable(name: "u32Temp2", scope: !1577, file: !69, line: 1344, type: !517)
!1593 = !DILocation(line: 1344, column: 34, scope: !1577)
!1594 = !DILocation(line: 1345, column: 5, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1577, file: !69, line: 1345, column: 5)
!1596 = !DILocation(line: 1345, column: 17, scope: !1595)
!1597 = !DILocation(line: 1345, column: 5, scope: !1577)
!1598 = !DILocation(line: 1347, column: 6, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1600, file: !69, line: 1347, column: 6)
!1600 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1346, column: 2)
!1601 = !DILocation(line: 1347, column: 16, scope: !1599)
!1602 = !DILocation(line: 1347, column: 6, scope: !1600)
!1603 = !DILocation(line: 1349, column: 4, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1599, file: !69, line: 1348, column: 3)
!1605 = !DILocation(line: 1353, column: 4, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1599, file: !69, line: 1352, column: 3)
!1607 = !DILocation(line: 1358, column: 6, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1358, column: 6)
!1609 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1357, column: 2)
!1610 = !DILocation(line: 1358, column: 16, scope: !1608)
!1611 = !DILocation(line: 1358, column: 6, scope: !1609)
!1612 = !DILocation(line: 1360, column: 16, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1608, file: !69, line: 1359, column: 3)
!1614 = !DILocation(line: 1360, column: 15, scope: !1613)
!1615 = !DILocation(line: 1360, column: 13, scope: !1613)
!1616 = !DILocation(line: 1361, column: 16, scope: !1613)
!1617 = !DILocation(line: 1361, column: 25, scope: !1613)
!1618 = !DILocation(line: 1361, column: 24, scope: !1613)
!1619 = !DILocation(line: 1361, column: 13, scope: !1613)
!1620 = !DILocation(line: 1362, column: 15, scope: !1613)
!1621 = !DILocation(line: 1362, column: 28, scope: !1613)
!1622 = !DILocation(line: 1362, column: 37, scope: !1613)
!1623 = !DILocation(line: 1362, column: 36, scope: !1613)
!1624 = !DILocation(line: 1362, column: 52, scope: !1613)
!1625 = !DILocation(line: 1362, column: 50, scope: !1613)
!1626 = !DILocation(line: 1362, column: 24, scope: !1613)
!1627 = !DILocation(line: 1362, column: 13, scope: !1613)
!1628 = !DILocation(line: 1364, column: 8, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1364, column: 7)
!1630 = !DILocation(line: 1364, column: 20, scope: !1629)
!1631 = !DILocation(line: 1364, column: 27, scope: !1629)
!1632 = !DILocation(line: 1364, column: 7, scope: !1613)
!1633 = !DILocation(line: 1366, column: 20, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1365, column: 4)
!1635 = !DILocation(line: 1366, column: 32, scope: !1634)
!1636 = !DILocation(line: 1366, column: 17, scope: !1634)
!1637 = !DILocation(line: 1367, column: 4, scope: !1634)
!1638 = !DILocation(line: 1370, column: 20, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1369, column: 4)
!1640 = !DILocation(line: 1370, column: 32, scope: !1639)
!1641 = !DILocation(line: 1370, column: 38, scope: !1639)
!1642 = !DILocation(line: 1370, column: 17, scope: !1639)
!1643 = !DILocation(line: 1374, column: 7, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1374, column: 7)
!1645 = !DILocation(line: 1374, column: 18, scope: !1644)
!1646 = !DILocation(line: 1374, column: 16, scope: !1644)
!1647 = !DILocation(line: 1374, column: 7, scope: !1613)
!1648 = !DILocation(line: 1376, column: 14, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1644, file: !69, line: 1375, column: 4)
!1650 = !DILocation(line: 1376, column: 13, scope: !1649)
!1651 = !DILocation(line: 1376, column: 23, scope: !1649)
!1652 = !DILocation(line: 1376, column: 5, scope: !1649)
!1653 = !DILocation(line: 1380, column: 14, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1644, file: !69, line: 1379, column: 4)
!1655 = !DILocation(line: 1380, column: 23, scope: !1654)
!1656 = !DILocation(line: 1380, column: 12, scope: !1654)
!1657 = !DILocation(line: 1380, column: 27, scope: !1654)
!1658 = !DILocation(line: 1380, column: 5, scope: !1654)
!1659 = !DILocation(line: 1387, column: 16, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1608, file: !69, line: 1386, column: 3)
!1661 = !DILocation(line: 1387, column: 30, scope: !1660)
!1662 = !DILocation(line: 1387, column: 40, scope: !1660)
!1663 = !DILocation(line: 1387, column: 39, scope: !1660)
!1664 = !DILocation(line: 1387, column: 55, scope: !1660)
!1665 = !DILocation(line: 1387, column: 53, scope: !1660)
!1666 = !DILocation(line: 1387, column: 26, scope: !1660)
!1667 = !DILocation(line: 1387, column: 69, scope: !1660)
!1668 = !DILocation(line: 1387, column: 13, scope: !1660)
!1669 = !DILocation(line: 1388, column: 16, scope: !1660)
!1670 = !DILocation(line: 1388, column: 26, scope: !1660)
!1671 = !DILocation(line: 1388, column: 25, scope: !1660)
!1672 = !DILocation(line: 1388, column: 42, scope: !1660)
!1673 = !DILocation(line: 1388, column: 51, scope: !1660)
!1674 = !DILocation(line: 1388, column: 50, scope: !1660)
!1675 = !DILocation(line: 1388, column: 39, scope: !1660)
!1676 = !DILocation(line: 1388, column: 13, scope: !1660)
!1677 = !DILocation(line: 1389, column: 11, scope: !1660)
!1678 = !DILocation(line: 1389, column: 4, scope: !1660)
!1679 = !DILocation(line: 1392, column: 1, scope: !1577)
!1680 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1409, type: !1681, scopeLine: 1410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1681 = !DISubroutineType(types: !1682)
!1682 = !{!12, !12, !12}
!1683 = !DILocalVariable(name: "numerator", arg: 1, scope: !1680, file: !69, line: 1409, type: !12)
!1684 = !DILocation(line: 1409, column: 25, scope: !1680)
!1685 = !DILocalVariable(name: "denominator", arg: 2, scope: !1680, file: !69, line: 1409, type: !12)
!1686 = !DILocation(line: 1409, column: 40, scope: !1680)
!1687 = !DILocalVariable(name: "s32Temp1", scope: !1680, file: !69, line: 1411, type: !12)
!1688 = !DILocation(line: 1411, column: 6, scope: !1680)
!1689 = !DILocalVariable(name: "s32Temp2", scope: !1680, file: !69, line: 1411, type: !12)
!1690 = !DILocation(line: 1411, column: 20, scope: !1680)
!1691 = !DILocalVariable(name: "denominator_prime", scope: !1680, file: !69, line: 1412, type: !517)
!1692 = !DILocation(line: 1412, column: 6, scope: !1680)
!1693 = !DILocalVariable(name: "u32Temp1", scope: !1680, file: !69, line: 1412, type: !517)
!1694 = !DILocation(line: 1412, column: 29, scope: !1680)
!1695 = !DILocalVariable(name: "u32Temp2", scope: !1680, file: !69, line: 1412, type: !517)
!1696 = !DILocation(line: 1412, column: 43, scope: !1680)
!1697 = !DILocalVariable(name: "u32numerator", scope: !1680, file: !69, line: 1413, type: !517)
!1698 = !DILocation(line: 1413, column: 6, scope: !1680)
!1699 = !DILocalVariable(name: "u32denominator", scope: !1680, file: !69, line: 1413, type: !517)
!1700 = !DILocation(line: 1413, column: 23, scope: !1680)
!1701 = !DILocation(line: 1414, column: 5, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1414, column: 5)
!1703 = !DILocation(line: 1414, column: 15, scope: !1702)
!1704 = !DILocation(line: 1414, column: 5, scope: !1680)
!1705 = !DILocation(line: 1416, column: 6, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1416, column: 6)
!1707 = distinct !DILexicalBlock(scope: !1702, file: !69, line: 1415, column: 2)
!1708 = !DILocation(line: 1416, column: 18, scope: !1706)
!1709 = !DILocation(line: 1416, column: 6, scope: !1707)
!1710 = !DILocation(line: 1418, column: 7, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1712, file: !69, line: 1418, column: 7)
!1712 = distinct !DILexicalBlock(scope: !1706, file: !69, line: 1417, column: 3)
!1713 = !DILocation(line: 1418, column: 19, scope: !1711)
!1714 = !DILocation(line: 1418, column: 7, scope: !1712)
!1715 = !DILocation(line: 1420, column: 5, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1711, file: !69, line: 1419, column: 4)
!1717 = !DILocation(line: 1424, column: 21, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1711, file: !69, line: 1423, column: 4)
!1719 = !DILocation(line: 1424, column: 20, scope: !1718)
!1720 = !DILocation(line: 1424, column: 18, scope: !1718)
!1721 = !DILocation(line: 1425, column: 23, scope: !1718)
!1722 = !DILocation(line: 1425, column: 22, scope: !1718)
!1723 = !DILocation(line: 1425, column: 20, scope: !1718)
!1724 = !DILocation(line: 1426, column: 16, scope: !1718)
!1725 = !DILocation(line: 1426, column: 33, scope: !1718)
!1726 = !DILocation(line: 1426, column: 46, scope: !1718)
!1727 = !DILocation(line: 1426, column: 45, scope: !1718)
!1728 = !DILocation(line: 1426, column: 64, scope: !1718)
!1729 = !DILocation(line: 1426, column: 62, scope: !1718)
!1730 = !DILocation(line: 1426, column: 29, scope: !1718)
!1731 = !DILocation(line: 1426, column: 81, scope: !1718)
!1732 = !DILocation(line: 1426, column: 14, scope: !1718)
!1733 = !DILocation(line: 1427, column: 17, scope: !1718)
!1734 = !DILocation(line: 1427, column: 30, scope: !1718)
!1735 = !DILocation(line: 1427, column: 29, scope: !1718)
!1736 = !DILocation(line: 1427, column: 49, scope: !1718)
!1737 = !DILocation(line: 1427, column: 58, scope: !1718)
!1738 = !DILocation(line: 1427, column: 57, scope: !1718)
!1739 = !DILocation(line: 1427, column: 46, scope: !1718)
!1740 = !DILocation(line: 1427, column: 14, scope: !1718)
!1741 = !DILocation(line: 1428, column: 8, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1428, column: 8)
!1743 = !DILocation(line: 1428, column: 17, scope: !1742)
!1744 = !DILocation(line: 1428, column: 8, scope: !1718)
!1745 = !DILocation(line: 1430, column: 13, scope: !1746)
!1746 = distinct !DILexicalBlock(scope: !1742, file: !69, line: 1429, column: 5)
!1747 = !DILocation(line: 1430, column: 6, scope: !1746)
!1748 = !DILocation(line: 1434, column: 6, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1742, file: !69, line: 1433, column: 5)
!1750 = !DILocation(line: 1440, column: 20, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1706, file: !69, line: 1439, column: 3)
!1752 = !DILocation(line: 1440, column: 19, scope: !1751)
!1753 = !DILocation(line: 1440, column: 29, scope: !1751)
!1754 = !DILocation(line: 1440, column: 17, scope: !1751)
!1755 = !DILocation(line: 1441, column: 16, scope: !1751)
!1756 = !DILocation(line: 1441, column: 33, scope: !1751)
!1757 = !DILocation(line: 1441, column: 46, scope: !1751)
!1758 = !DILocation(line: 1441, column: 45, scope: !1751)
!1759 = !DILocation(line: 1441, column: 61, scope: !1751)
!1760 = !DILocation(line: 1441, column: 59, scope: !1751)
!1761 = !DILocation(line: 1441, column: 29, scope: !1751)
!1762 = !DILocation(line: 1441, column: 75, scope: !1751)
!1763 = !DILocation(line: 1441, column: 13, scope: !1751)
!1764 = !DILocation(line: 1442, column: 16, scope: !1751)
!1765 = !DILocation(line: 1442, column: 29, scope: !1751)
!1766 = !DILocation(line: 1442, column: 28, scope: !1751)
!1767 = !DILocation(line: 1442, column: 45, scope: !1751)
!1768 = !DILocation(line: 1442, column: 54, scope: !1751)
!1769 = !DILocation(line: 1442, column: 53, scope: !1751)
!1770 = !DILocation(line: 1442, column: 42, scope: !1751)
!1771 = !DILocation(line: 1442, column: 13, scope: !1751)
!1772 = !DILocation(line: 1443, column: 13, scope: !1751)
!1773 = !DILocation(line: 1443, column: 12, scope: !1751)
!1774 = !DILocation(line: 1443, column: 22, scope: !1751)
!1775 = !DILocation(line: 1443, column: 4, scope: !1751)
!1776 = !DILocation(line: 1448, column: 6, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1778, file: !69, line: 1448, column: 6)
!1778 = distinct !DILexicalBlock(scope: !1702, file: !69, line: 1447, column: 2)
!1779 = !DILocation(line: 1448, column: 18, scope: !1777)
!1780 = !DILocation(line: 1448, column: 6, scope: !1778)
!1781 = !DILocation(line: 1450, column: 7, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1783, file: !69, line: 1450, column: 7)
!1783 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1449, column: 3)
!1784 = !DILocation(line: 1450, column: 19, scope: !1782)
!1785 = !DILocation(line: 1450, column: 7, scope: !1783)
!1786 = !DILocation(line: 1452, column: 5, scope: !1787)
!1787 = distinct !DILexicalBlock(scope: !1782, file: !69, line: 1451, column: 4)
!1788 = !DILocation(line: 1456, column: 23, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1782, file: !69, line: 1455, column: 4)
!1790 = !DILocation(line: 1456, column: 22, scope: !1789)
!1791 = !DILocation(line: 1456, column: 35, scope: !1789)
!1792 = !DILocation(line: 1456, column: 20, scope: !1789)
!1793 = !DILocation(line: 1457, column: 17, scope: !1789)
!1794 = !DILocation(line: 1457, column: 31, scope: !1789)
!1795 = !DILocation(line: 1457, column: 41, scope: !1789)
!1796 = !DILocation(line: 1457, column: 40, scope: !1789)
!1797 = !DILocation(line: 1457, column: 59, scope: !1789)
!1798 = !DILocation(line: 1457, column: 57, scope: !1789)
!1799 = !DILocation(line: 1457, column: 27, scope: !1789)
!1800 = !DILocation(line: 1457, column: 76, scope: !1789)
!1801 = !DILocation(line: 1457, column: 14, scope: !1789)
!1802 = !DILocation(line: 1458, column: 17, scope: !1789)
!1803 = !DILocation(line: 1458, column: 27, scope: !1789)
!1804 = !DILocation(line: 1458, column: 26, scope: !1789)
!1805 = !DILocation(line: 1458, column: 46, scope: !1789)
!1806 = !DILocation(line: 1458, column: 55, scope: !1789)
!1807 = !DILocation(line: 1458, column: 54, scope: !1789)
!1808 = !DILocation(line: 1458, column: 43, scope: !1789)
!1809 = !DILocation(line: 1458, column: 14, scope: !1789)
!1810 = !DILocation(line: 1459, column: 14, scope: !1789)
!1811 = !DILocation(line: 1459, column: 13, scope: !1789)
!1812 = !DILocation(line: 1459, column: 23, scope: !1789)
!1813 = !DILocation(line: 1459, column: 5, scope: !1789)
!1814 = !DILocation(line: 1464, column: 16, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1463, column: 3)
!1816 = !DILocation(line: 1464, column: 30, scope: !1815)
!1817 = !DILocation(line: 1464, column: 40, scope: !1815)
!1818 = !DILocation(line: 1464, column: 39, scope: !1815)
!1819 = !DILocation(line: 1464, column: 55, scope: !1815)
!1820 = !DILocation(line: 1464, column: 53, scope: !1815)
!1821 = !DILocation(line: 1464, column: 26, scope: !1815)
!1822 = !DILocation(line: 1464, column: 69, scope: !1815)
!1823 = !DILocation(line: 1464, column: 13, scope: !1815)
!1824 = !DILocation(line: 1465, column: 16, scope: !1815)
!1825 = !DILocation(line: 1465, column: 26, scope: !1815)
!1826 = !DILocation(line: 1465, column: 25, scope: !1815)
!1827 = !DILocation(line: 1465, column: 42, scope: !1815)
!1828 = !DILocation(line: 1465, column: 51, scope: !1815)
!1829 = !DILocation(line: 1465, column: 50, scope: !1815)
!1830 = !DILocation(line: 1465, column: 39, scope: !1815)
!1831 = !DILocation(line: 1465, column: 13, scope: !1815)
!1832 = !DILocation(line: 1466, column: 11, scope: !1815)
!1833 = !DILocation(line: 1466, column: 4, scope: !1815)
!1834 = !DILocation(line: 1469, column: 1, scope: !1680)
!1835 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1487, type: !1836, scopeLine: 1488, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1836 = !DISubroutineType(types: !1837)
!1837 = !{!20, !12, !517}
!1838 = !DILocalVariable(name: "numerator", arg: 1, scope: !1835, file: !69, line: 1487, type: !12)
!1839 = !DILocation(line: 1487, column: 25, scope: !1835)
!1840 = !DILocalVariable(name: "denominator", arg: 2, scope: !1835, file: !69, line: 1487, type: !517)
!1841 = !DILocation(line: 1487, column: 40, scope: !1835)
!1842 = !DILocalVariable(name: "numerator_prime", scope: !1835, file: !69, line: 1490, type: !517)
!1843 = !DILocation(line: 1490, column: 6, scope: !1835)
!1844 = !DILocalVariable(name: "u32Temp1", scope: !1835, file: !69, line: 1490, type: !517)
!1845 = !DILocation(line: 1490, column: 27, scope: !1835)
!1846 = !DILocalVariable(name: "u32Temp2", scope: !1835, file: !69, line: 1490, type: !517)
!1847 = !DILocation(line: 1490, column: 41, scope: !1835)
!1848 = !DILocalVariable(name: "u32Temp3", scope: !1835, file: !69, line: 1490, type: !517)
!1849 = !DILocation(line: 1490, column: 55, scope: !1835)
!1850 = !DILocalVariable(name: "s32Temp1", scope: !1835, file: !69, line: 1491, type: !12)
!1851 = !DILocation(line: 1491, column: 6, scope: !1835)
!1852 = !DILocalVariable(name: "s32Temp2", scope: !1835, file: !69, line: 1491, type: !12)
!1853 = !DILocation(line: 1491, column: 20, scope: !1835)
!1854 = !DILocalVariable(name: "s32Temp3", scope: !1835, file: !69, line: 1491, type: !12)
!1855 = !DILocation(line: 1491, column: 34, scope: !1835)
!1856 = !DILocation(line: 1492, column: 5, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1835, file: !69, line: 1492, column: 5)
!1858 = !DILocation(line: 1492, column: 17, scope: !1857)
!1859 = !DILocation(line: 1492, column: 5, scope: !1835)
!1860 = !DILocation(line: 1494, column: 6, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1862, file: !69, line: 1494, column: 6)
!1862 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1493, column: 2)
!1863 = !DILocation(line: 1494, column: 15, scope: !1861)
!1864 = !DILocation(line: 1494, column: 6, scope: !1862)
!1865 = !DILocation(line: 1496, column: 4, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1495, column: 3)
!1867 = !DILocation(line: 1500, column: 4, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1499, column: 3)
!1869 = !DILocation(line: 1505, column: 6, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1871, file: !69, line: 1505, column: 6)
!1871 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1504, column: 2)
!1872 = !DILocation(line: 1505, column: 16, scope: !1870)
!1873 = !DILocation(line: 1505, column: 6, scope: !1871)
!1874 = !DILocation(line: 1507, column: 23, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1870, file: !69, line: 1506, column: 3)
!1876 = !DILocation(line: 1507, column: 22, scope: !1875)
!1877 = !DILocation(line: 1507, column: 20, scope: !1875)
!1878 = !DILocation(line: 1508, column: 16, scope: !1875)
!1879 = !DILocation(line: 1508, column: 32, scope: !1875)
!1880 = !DILocation(line: 1508, column: 31, scope: !1875)
!1881 = !DILocation(line: 1508, column: 13, scope: !1875)
!1882 = !DILocation(line: 1509, column: 15, scope: !1875)
!1883 = !DILocation(line: 1509, column: 34, scope: !1875)
!1884 = !DILocation(line: 1509, column: 45, scope: !1875)
!1885 = !DILocation(line: 1509, column: 43, scope: !1875)
!1886 = !DILocation(line: 1509, column: 31, scope: !1875)
!1887 = !DILocation(line: 1509, column: 13, scope: !1875)
!1888 = !DILocation(line: 1511, column: 8, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1875, file: !69, line: 1511, column: 7)
!1890 = !DILocation(line: 1511, column: 20, scope: !1889)
!1891 = !DILocation(line: 1511, column: 27, scope: !1889)
!1892 = !DILocation(line: 1511, column: 7, scope: !1875)
!1893 = !DILocation(line: 1513, column: 19, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1889, file: !69, line: 1512, column: 4)
!1895 = !DILocation(line: 1513, column: 31, scope: !1894)
!1896 = !DILocation(line: 1513, column: 17, scope: !1894)
!1897 = !DILocation(line: 1514, column: 4, scope: !1894)
!1898 = !DILocation(line: 1517, column: 20, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1889, file: !69, line: 1516, column: 4)
!1900 = !DILocation(line: 1517, column: 32, scope: !1899)
!1901 = !DILocation(line: 1517, column: 38, scope: !1899)
!1902 = !DILocation(line: 1517, column: 17, scope: !1899)
!1903 = !DILocation(line: 1520, column: 7, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1875, file: !69, line: 1520, column: 7)
!1905 = !DILocation(line: 1520, column: 18, scope: !1904)
!1906 = !DILocation(line: 1520, column: 16, scope: !1904)
!1907 = !DILocation(line: 1520, column: 7, scope: !1875)
!1908 = !DILocation(line: 1522, column: 18, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1904, file: !69, line: 1521, column: 4)
!1910 = !DILocation(line: 1522, column: 16, scope: !1909)
!1911 = !DILocation(line: 1522, column: 28, scope: !1909)
!1912 = !DILocation(line: 1522, column: 14, scope: !1909)
!1913 = !DILocation(line: 1523, column: 4, scope: !1909)
!1914 = !DILocation(line: 1526, column: 18, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1904, file: !69, line: 1525, column: 4)
!1916 = !DILocation(line: 1526, column: 26, scope: !1915)
!1917 = !DILocation(line: 1526, column: 16, scope: !1915)
!1918 = !DILocation(line: 1526, column: 30, scope: !1915)
!1919 = !DILocation(line: 1526, column: 14, scope: !1915)
!1920 = !DILocation(line: 1528, column: 8, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1875, file: !69, line: 1528, column: 7)
!1922 = !DILocation(line: 1528, column: 18, scope: !1921)
!1923 = !DILocation(line: 1528, column: 7, scope: !1875)
!1924 = !DILocation(line: 1530, column: 18, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1921, file: !69, line: 1529, column: 4)
!1926 = !DILocation(line: 1530, column: 12, scope: !1925)
!1927 = !DILocation(line: 1530, column: 5, scope: !1925)
!1928 = !DILocation(line: 1534, column: 5, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1921, file: !69, line: 1533, column: 4)
!1930 = !DILocation(line: 1539, column: 16, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1870, file: !69, line: 1538, column: 3)
!1932 = !DILocation(line: 1539, column: 26, scope: !1931)
!1933 = !DILocation(line: 1539, column: 25, scope: !1931)
!1934 = !DILocation(line: 1539, column: 41, scope: !1931)
!1935 = !DILocation(line: 1539, column: 39, scope: !1931)
!1936 = !DILocation(line: 1539, column: 13, scope: !1931)
!1937 = !DILocation(line: 1540, column: 16, scope: !1931)
!1938 = !DILocation(line: 1540, column: 30, scope: !1931)
!1939 = !DILocation(line: 1540, column: 40, scope: !1931)
!1940 = !DILocation(line: 1540, column: 39, scope: !1931)
!1941 = !DILocation(line: 1540, column: 55, scope: !1931)
!1942 = !DILocation(line: 1540, column: 53, scope: !1931)
!1943 = !DILocation(line: 1540, column: 26, scope: !1931)
!1944 = !DILocation(line: 1540, column: 68, scope: !1931)
!1945 = !DILocation(line: 1540, column: 13, scope: !1931)
!1946 = !DILocation(line: 1541, column: 16, scope: !1931)
!1947 = !DILocation(line: 1541, column: 25, scope: !1931)
!1948 = !DILocation(line: 1541, column: 24, scope: !1931)
!1949 = !DILocation(line: 1541, column: 41, scope: !1931)
!1950 = !DILocation(line: 1541, column: 51, scope: !1931)
!1951 = !DILocation(line: 1541, column: 50, scope: !1931)
!1952 = !DILocation(line: 1541, column: 38, scope: !1931)
!1953 = !DILocation(line: 1541, column: 13, scope: !1931)
!1954 = !DILocation(line: 1542, column: 7, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1542, column: 7)
!1956 = !DILocation(line: 1542, column: 16, scope: !1955)
!1957 = !DILocation(line: 1542, column: 7, scope: !1931)
!1958 = !DILocation(line: 1544, column: 17, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1955, file: !69, line: 1543, column: 4)
!1960 = !DILocation(line: 1544, column: 12, scope: !1959)
!1961 = !DILocation(line: 1544, column: 5, scope: !1959)
!1962 = !DILocation(line: 1548, column: 5, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1955, file: !69, line: 1547, column: 4)
!1964 = !DILocation(line: 1552, column: 1, scope: !1835)
!1965 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1966, file: !1966, line: 12, type: !1967, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1970)
!1966 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1967 = !DISubroutineType(types: !1968)
!1968 = !{null, !1969}
!1969 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1970 = !{!1971}
!1971 = !DILocalVariable(name: "z", arg: 1, scope: !1965, file: !1966, line: 12, type: !1969)
!1972 = !DILocation(line: 0, scope: !1965)
!1973 = !DILocation(line: 13, column: 9, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1965, file: !1966, line: 13, column: 7)
!1975 = !DILocation(line: 13, column: 7, scope: !1965)
!1976 = !DILocation(line: 14, column: 5, scope: !1974)
!1977 = !DILocation(line: 15, column: 1, scope: !1965)
!1978 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1979, file: !1979, line: 20, type: !1980, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1983)
!1979 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1980 = !DISubroutineType(types: !1981)
!1981 = !{null, !1982, !1982}
!1982 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1983 = !{!1984, !1985}
!1984 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1978, file: !1979, line: 20, type: !1982)
!1985 = !DILocalVariable(name: "shift", arg: 2, scope: !1978, file: !1979, line: 20, type: !1982)
!1986 = !DILocation(line: 0, scope: !1978)
!1987 = !DILocation(line: 21, column: 13, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1978, file: !1979, line: 21, column: 7)
!1989 = !DILocation(line: 21, column: 7, scope: !1978)
!1990 = !DILocation(line: 27, column: 5, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1988, file: !1979, line: 21, column: 26)
!1992 = !DILocation(line: 29, column: 1, scope: !1978)
