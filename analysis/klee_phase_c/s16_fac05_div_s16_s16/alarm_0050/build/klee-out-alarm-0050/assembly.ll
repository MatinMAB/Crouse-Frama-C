; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050/build/s16_fac05_div_s16_s16_alarm_0050.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0050: division by zero. assert (int)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0050.err\00", align 1
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
  br i1 %cmp11, label %if.then13, label %if.else68, !dbg !108

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
  store i16 0, i16* %retval, align 2, !dbg !175
  br label %return, !dbg !175

if.end55:                                         ; preds = %if.end44
  %22 = load i32, i32* %s32Temp2, align 4, !dbg !177
  %23 = load i16, i16* %denominator.addr, align 2, !dbg !178
  %conv56 = sext i16 %23 to i32, !dbg !178
  %int_cast_to_i644 = zext i32 %conv56 to i64, !dbg !179
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !179
  %div57 = sdiv i32 %22, %conv56, !dbg !179, !klee.check.div !123
  store i32 %div57, i32* %s32Temp1, align 4, !dbg !180
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !181
  %conv58 = sext i16 %24 to i64, !dbg !183
  %call59 = call i32 @klee_alarm_divisor_nonzero(i64 %conv58), !dbg !184
  %tobool60 = icmp ne i32 %call59, 0, !dbg !184
  br i1 %tobool60, label %if.end62, label %if.then61, !dbg !185

if.then61:                                        ; preds = %if.end55
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 220, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !186
  unreachable, !dbg !186

if.end62:                                         ; preds = %if.end55
  %25 = load i16, i16* %numerator.addr, align 2, !dbg !188
  %conv63 = sext i16 %25 to i32, !dbg !188
  %shl64 = shl i32 %conv63, 16, !dbg !189
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !190
  %conv65 = sext i16 %26 to i32, !dbg !190
  %int_cast_to_i645 = zext i32 %conv65 to i64, !dbg !191
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !191
  %div66 = sdiv i32 %shl64, %conv65, !dbg !191, !klee.check.div !123
  %conv67 = sext i32 %div66 to i64, !dbg !192
  store volatile i64 %conv67, i64* @klee_alarm_sink_s64, align 8, !dbg !193
  store i16 0, i16* %retval, align 2, !dbg !194
  br label %return, !dbg !194

if.else68:                                        ; preds = %if.else10
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !195
  %conv69 = sext i16 %27 to i32, !dbg !195
  %cmp70 = icmp ne i32 %conv69, -1, !dbg !198
  br i1 %cmp70, label %if.then72, label %if.else94, !dbg !199

if.then72:                                        ; preds = %if.else68
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !200
  %29 = load i32, i32* %s32Temp1, align 4, !dbg !202
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !203
  %conv73 = sext i16 %30 to i32, !dbg !203
  %int_cast_to_i646 = zext i32 %conv73 to i64, !dbg !204
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !204
  %div74 = sdiv i32 %29, %conv73, !dbg !204, !klee.check.div !123
  %31 = load i16, i16* %denominator.addr, align 2, !dbg !205
  %conv75 = sext i16 %31 to i32, !dbg !205
  %mul76 = mul nsw i32 %div74, %conv75, !dbg !206
  %sub77 = sub nsw i32 %28, %mul76, !dbg !207
  %shl78 = shl i32 %sub77, 1, !dbg !208
  store i32 %shl78, i32* %s32Temp2, align 4, !dbg !209
  %32 = load i32, i32* %s32Temp2, align 4, !dbg !210
  %33 = load i16, i16* %denominator.addr, align 2, !dbg !211
  %conv79 = sext i16 %33 to i32, !dbg !211
  %int_cast_to_i647 = zext i32 %conv79 to i64, !dbg !212
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !212
  %div80 = sdiv i32 %32, %conv79, !dbg !212, !klee.check.div !123
  store i32 %div80, i32* %s32Temp1, align 4, !dbg !213
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !214
  %35 = load i16, i16* %numerator.addr, align 2, !dbg !215
  %conv81 = sext i16 %35 to i32, !dbg !215
  %shl82 = shl i32 %conv81, 16, !dbg !216
  %36 = load i16, i16* %denominator.addr, align 2, !dbg !217
  %conv83 = sext i16 %36 to i32, !dbg !217
  %int_cast_to_i648 = zext i32 %conv83 to i64, !dbg !218
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !218
  %div84 = sdiv i32 %shl82, %conv83, !dbg !218, !klee.check.div !123
  %add = add nsw i32 %34, %div84, !dbg !219
  store i32 %add, i32* %s32Temp1, align 4, !dbg !220
  %37 = load i32, i32* %s32Temp1, align 4, !dbg !221
  %cmp85 = icmp slt i32 %37, 32767, !dbg !223
  br i1 %cmp85, label %if.then87, label %if.else93, !dbg !224

if.then87:                                        ; preds = %if.then72
  %38 = load i32, i32* %s32Temp1, align 4, !dbg !225
  %cmp88 = icmp sgt i32 %38, -32768, !dbg !228
  br i1 %cmp88, label %if.then90, label %if.else92, !dbg !229

if.then90:                                        ; preds = %if.then87
  %39 = load i32, i32* %s32Temp1, align 4, !dbg !230
  %conv91 = trunc i32 %39 to i16, !dbg !232
  store i16 %conv91, i16* %retval, align 2, !dbg !233
  br label %return, !dbg !233

if.else92:                                        ; preds = %if.then87
  store i16 -32768, i16* %retval, align 2, !dbg !234
  br label %return, !dbg !234

if.else93:                                        ; preds = %if.then72
  store i16 32767, i16* %retval, align 2, !dbg !236
  br label %return, !dbg !236

if.else94:                                        ; preds = %if.else68
  store i16 32767, i16* %retval, align 2, !dbg !238
  br label %return, !dbg !238

return:                                           ; preds = %if.else94, %if.else93, %if.else92, %if.then90, %if.end62, %if.then54, %if.then43, %if.then34, %if.then24, %if.then17, %if.else, %if.then9, %if.then
  %40 = load i16, i16* %retval, align 2, !dbg !240
  ret i16 %40, !dbg !240
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !241 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !244, metadata !DIExpression()), !dbg !245
  %0 = load i64, i64* %left.addr, align 8, !dbg !246
  %cmp = icmp sge i64 %0, 0, !dbg !247
  %conv = zext i1 %cmp to i32, !dbg !247
  ret i32 %conv, !dbg !248
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !249 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !252
  %cmp = icmp ne i64 %0, 0, !dbg !253
  %conv = zext i1 %cmp to i32, !dbg !253
  ret i32 %conv, !dbg !254
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !255 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !260, metadata !DIExpression()), !dbg !261
  %0 = load i32, i32* %count.addr, align 4, !dbg !262
  %cmp = icmp uge i32 %0, 63, !dbg !264
  br i1 %cmp, label %if.then, label %if.end, !dbg !265

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !266
  br label %return, !dbg !266

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !268
  %2 = load i32, i32* %count.addr, align 4, !dbg !269
  %sh_prom = zext i32 %2 to i64, !dbg !270
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !270
  %shl = shl i64 1, %sh_prom, !dbg !270, !klee.check.shift !123
  %mul = mul nsw i64 %1, %shl, !dbg !271
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !272
  %conv = zext i1 %cmp1 to i32, !dbg !272
  store i32 %conv, i32* %retval, align 4, !dbg !273
  br label %return, !dbg !273

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !274
  ret i32 %3, !dbg !274
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !275 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !278, metadata !DIExpression()), !dbg !279
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !280, metadata !DIExpression()), !dbg !281
  %0 = load i64, i64* %left.addr, align 8, !dbg !282
  %1 = load i64, i64* %right.addr, align 8, !dbg !283
  %mul = mul nsw i64 %0, %1, !dbg !284
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !285
  %conv = zext i1 %cmp to i32, !dbg !285
  ret i32 %conv, !dbg !286
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !287 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !290, metadata !DIExpression()), !dbg !291
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !292, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !294, metadata !DIExpression()), !dbg !295
  store i32 0, i32* %s32Temp1, align 4, !dbg !295
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !296, metadata !DIExpression()), !dbg !297
  store i32 0, i32* %s32Temp2, align 4, !dbg !297
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !298
  store i32 %0, i32* %s32Temp1, align 4, !dbg !299
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !300
  %conv = sext i16 %1 to i32, !dbg !300
  %cmp = icmp eq i32 %conv, 0, !dbg !302
  br i1 %cmp, label %if.then, label %if.else5, !dbg !303

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !304
  %cmp2 = icmp slt i32 %2, 0, !dbg !307
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !308

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !309
  br label %return, !dbg !309

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !311
  br label %return, !dbg !311

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !313
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !316
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !317

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !318
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !320
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !321
  %conv9 = sext i16 %6 to i32, !dbg !321
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !322
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !322
  %div = sdiv i32 %5, %conv9, !dbg !322, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !323
  %conv10 = sext i16 %7 to i32, !dbg !323
  %mul = mul nsw i32 %div, %conv10, !dbg !324
  %sub = sub nsw i32 %4, %mul, !dbg !325
  %shl = shl i32 %sub, 1, !dbg !326
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !327
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !328
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !329
  %conv11 = sext i16 %9 to i32, !dbg !329
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !330
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !330
  %div12 = sdiv i32 %8, %conv11, !dbg !330, !klee.check.div !123
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !331
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !332
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !333
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !334
  %conv13 = sext i16 %12 to i32, !dbg !334
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !335
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !335
  %div14 = sdiv i32 %11, %conv13, !dbg !335, !klee.check.div !123
  %add = add nsw i32 %10, %div14, !dbg !336
  store i32 %add, i32* %s32Temp1, align 4, !dbg !337
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !338
  %cmp15 = icmp slt i32 %13, 32767, !dbg !340
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !341

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !342
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !345
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !346

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !347
  %conv21 = trunc i32 %15 to i16, !dbg !349
  store i16 %conv21, i16* %retval, align 2, !dbg !350
  br label %return, !dbg !350

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !351
  br label %return, !dbg !351

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !353
  br label %return, !dbg !353

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !355
  %conv25 = sext i16 %16 to i32, !dbg !355
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !358
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !359

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !360
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !362
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !363
  %conv29 = sext i16 %19 to i32, !dbg !363
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !364
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !364
  %div30 = sdiv i32 %18, %conv29, !dbg !364, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !365
  %conv31 = sext i16 %20 to i32, !dbg !365
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !366
  %sub33 = sub nsw i32 %17, %mul32, !dbg !367
  %shl34 = shl i32 %sub33, 1, !dbg !368
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !369
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !370
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !371
  %conv35 = sext i16 %22 to i32, !dbg !371
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !372
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !372
  %div36 = sdiv i32 %21, %conv35, !dbg !372, !klee.check.div !123
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !373
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !374
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !375
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !376
  %conv37 = sext i16 %25 to i32, !dbg !376
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !377
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !377
  %div38 = sdiv i32 %24, %conv37, !dbg !377, !klee.check.div !123
  %add39 = add nsw i32 %23, %div38, !dbg !378
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !379
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !380
  %cmp40 = icmp slt i32 %26, 32767, !dbg !382
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !383

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !384
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !387
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !388

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !389
  %conv46 = trunc i32 %28 to i16, !dbg !391
  store i16 %conv46, i16* %retval, align 2, !dbg !392
  br label %return, !dbg !392

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !393
  br label %return, !dbg !393

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !395
  br label %return, !dbg !395

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !397
  br label %return, !dbg !397

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !399
  ret i16 %29, !dbg !399
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !400 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !403, metadata !DIExpression()), !dbg !404
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !405, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !407, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !409, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !411, metadata !DIExpression()), !dbg !412
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !413
  %conv = zext i16 %0 to i32, !dbg !413
  %and = and i32 %conv, 65535, !dbg !414
  %conv1 = trunc i32 %and to i16, !dbg !413
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !415
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !416
  %conv2 = sext i16 %1 to i32, !dbg !416
  %shl = shl i32 %conv2, 16, !dbg !417
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !418
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !419
  %conv3 = zext i16 %2 to i32, !dbg !419
  %cmp = icmp eq i32 %conv3, 0, !dbg !421
  br i1 %cmp, label %if.then, label %if.else9, !dbg !422

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !423
  %conv5 = sext i16 %3 to i32, !dbg !423
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !426
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !427

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !428
  br label %return, !dbg !428

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !430
  br label %return, !dbg !430

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !432
  %conv10 = sext i16 %4 to i32, !dbg !432
  %shl11 = shl i32 %conv10, 16, !dbg !434
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !435
  %conv12 = sext i16 %5 to i32, !dbg !435
  %shl13 = shl i32 %conv12, 16, !dbg !436
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !437
  %conv14 = zext i16 %6 to i32, !dbg !437
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !438
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !438
  %div = sdiv i32 %shl13, %conv14, !dbg !438, !klee.check.div !123
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !439
  %conv15 = zext i16 %7 to i32, !dbg !439
  %mul = mul nsw i32 %div, %conv15, !dbg !440
  %sub = sub nsw i32 %shl11, %mul, !dbg !441
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !442
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !443
  %shl16 = shl i32 %8, 1, !dbg !444
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !445
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !446
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !447
  %conv17 = zext i16 %10 to i32, !dbg !447
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !448
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !448
  %div18 = sdiv i32 %9, %conv17, !dbg !448, !klee.check.div !123
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !449
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !450
  %conv19 = sext i16 %11 to i32, !dbg !450
  %shl20 = shl i32 %conv19, 16, !dbg !451
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !452
  %conv21 = zext i16 %12 to i32, !dbg !452
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !453
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !453
  %div22 = sdiv i32 %shl20, %conv21, !dbg !453, !klee.check.div !123
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !454
  %add = add nsw i32 %div22, %13, !dbg !455
  store i32 %add, i32* %s32Temp1, align 4, !dbg !456
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !457
  %cmp23 = icmp slt i32 %14, 32767, !dbg !459
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !460

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !461
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !464
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !465

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !466
  %conv29 = trunc i32 %16 to i16, !dbg !468
  store i16 %conv29, i16* %retval, align 2, !dbg !469
  br label %return, !dbg !469

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !470
  br label %return, !dbg !470

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !472
  br label %return, !dbg !472

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !474
  ret i16 %17, !dbg !474
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !475 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !476, metadata !DIExpression()), !dbg !477
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !478, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !480, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !482, metadata !DIExpression()), !dbg !483
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !484
  %conv = zext i16 %0 to i32, !dbg !484
  %and = and i32 %conv, 65535, !dbg !485
  %conv1 = trunc i32 %and to i16, !dbg !484
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !486
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !487
  %conv2 = zext i16 %1 to i32, !dbg !487
  %cmp = icmp eq i32 %conv2, 0, !dbg !489
  br i1 %cmp, label %if.then, label %if.else8, !dbg !490

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !491
  %conv4 = sext i16 %2 to i32, !dbg !491
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !494
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !495

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !496
  br label %return, !dbg !496

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !498
  br label %return, !dbg !498

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !500
  %conv9 = sext i16 %3 to i32, !dbg !500
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !502
  %conv10 = sext i16 %4 to i32, !dbg !502
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !503
  %conv11 = zext i16 %5 to i32, !dbg !503
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !504
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !504
  %div = sdiv i32 %conv10, %conv11, !dbg !504, !klee.check.div !123
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !505
  %conv12 = zext i16 %6 to i32, !dbg !505
  %mul = mul nsw i32 %div, %conv12, !dbg !506
  %sub = sub nsw i32 %conv9, %mul, !dbg !507
  %shl = shl i32 %sub, 1, !dbg !508
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !509
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !510
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !511
  %conv13 = zext i16 %8 to i32, !dbg !511
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !512
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !512
  %div14 = sdiv i32 %7, %conv13, !dbg !512, !klee.check.div !123
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !513
  %conv15 = sext i16 %9 to i32, !dbg !513
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !514
  %conv16 = zext i16 %10 to i32, !dbg !514
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !515
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !515
  %div17 = sdiv i32 %conv15, %conv16, !dbg !515, !klee.check.div !123
  %add = add nsw i32 %div14, %div17, !dbg !516
  store i32 %add, i32* %s32Temp1, align 4, !dbg !517
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !518
  %conv18 = trunc i32 %11 to i16, !dbg !518
  store i16 %conv18, i16* %retval, align 2, !dbg !519
  br label %return, !dbg !519

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !520
  ret i16 %12, !dbg !520
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !521 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !524, metadata !DIExpression()), !dbg !525
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !526, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !528, metadata !DIExpression()), !dbg !530
  store i32 0, i32* %u32Temp1, align 4, !dbg !530
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !531, metadata !DIExpression()), !dbg !532
  store i32 0, i32* %u32Temp2, align 4, !dbg !532
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !533, metadata !DIExpression()), !dbg !534
  store i32 0, i32* %u32Temp3, align 4, !dbg !534
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !535
  %conv = zext i16 %0 to i32, !dbg !535
  %cmp = icmp eq i32 %conv, 0, !dbg !537
  br i1 %cmp, label %if.then, label %if.else, !dbg !538

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !539
  br label %return, !dbg !539

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !541
  %conv2 = zext i16 %1 to i32, !dbg !541
  %shl = shl i32 %conv2, 16, !dbg !543
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !544
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !545
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !546
  %conv3 = zext i16 %3 to i32, !dbg !546
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !547
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !547
  %div = udiv i32 %2, %conv3, !dbg !547, !klee.check.div !123
  store i32 %div, i32* %u32Temp2, align 4, !dbg !548
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !549
  %add = add i32 %4, 128, !dbg !550
  %shr = lshr i32 %add, 8, !dbg !551
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !552
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !553
  %cmp4 = icmp ult i32 %5, 255, !dbg !555
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !556

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !557
  %conv7 = trunc i32 %6 to i8, !dbg !559
  store i8 %conv7, i8* %retval, align 1, !dbg !560
  br label %return, !dbg !560

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !561
  br label %return, !dbg !561

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !563
  ret i8 %7, !dbg !563
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !564 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !567, metadata !DIExpression()), !dbg !568
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !569, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !571, metadata !DIExpression()), !dbg !572
  store i32 0, i32* %s32Temp1, align 4, !dbg !572
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !573
  %conv = zext i16 %0 to i32, !dbg !573
  %and = and i32 %conv, 65535, !dbg !574
  %conv1 = trunc i32 %and to i16, !dbg !573
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !575
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !576
  %conv2 = zext i16 %1 to i32, !dbg !576
  %and3 = and i32 %conv2, 65535, !dbg !578
  %cmp = icmp eq i32 %and3, 0, !dbg !579
  br i1 %cmp, label %if.then, label %if.else8, !dbg !580

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !581
  %cmp5 = icmp sge i32 %2, 0, !dbg !584
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !585

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !586
  br label %return, !dbg !586

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !588
  br label %return, !dbg !588

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !590
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !592
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !593
  %conv9 = zext i16 %5 to i32, !dbg !593
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !594
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !594
  %div = sdiv i32 %4, %conv9, !dbg !594, !klee.check.div !123
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !595
  %conv10 = zext i16 %6 to i32, !dbg !595
  %mul = mul nsw i32 %div, %conv10, !dbg !596
  %sub = sub nsw i32 %3, %mul, !dbg !597
  %shl = shl i32 %sub, 1, !dbg !598
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !599
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !600
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !601
  %conv11 = zext i16 %8 to i32, !dbg !601
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !602
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !602
  %div12 = sdiv i32 %7, %conv11, !dbg !602, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !603
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !604
  %conv13 = zext i16 %10 to i32, !dbg !604
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !605
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !605
  %div14 = sdiv i32 %9, %conv13, !dbg !605, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !606
  store i32 %add, i32* %s32Temp1, align 4, !dbg !607
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !608
  %cmp15 = icmp slt i32 %11, 65535, !dbg !610
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !611

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !612
  %cmp18 = icmp sgt i32 %12, 0, !dbg !615
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !616

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !617
  %conv21 = trunc i32 %13 to i16, !dbg !619
  store i16 %conv21, i16* %retval, align 2, !dbg !620
  br label %return, !dbg !620

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !621
  br label %return, !dbg !621

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !623
  br label %return, !dbg !623

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !625
  ret i16 %14, !dbg !625
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !626 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !629, metadata !DIExpression()), !dbg !630
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !631, metadata !DIExpression()), !dbg !632
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !633, metadata !DIExpression()), !dbg !634
  store i32 0, i32* %u32Temp, align 4, !dbg !634
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !635
  %conv = zext i16 %0 to i32, !dbg !635
  %cmp = icmp eq i32 %conv, 0, !dbg !637
  br i1 %cmp, label %if.then, label %if.else, !dbg !638

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !641
  %conv2 = zext i16 %1 to i32, !dbg !641
  %shl = shl i32 %conv2, 16, !dbg !643
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !644
  %conv3 = zext i16 %2 to i32, !dbg !644
  %shr = ashr i32 %conv3, 1, !dbg !645
  %add = add nsw i32 %shl, %shr, !dbg !646
  store i32 %add, i32* %u32Temp, align 4, !dbg !647
  %3 = load i32, i32* %u32Temp, align 4, !dbg !648
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !649
  %conv4 = zext i16 %4 to i32, !dbg !649
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !650
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !650
  %div = udiv i32 %3, %conv4, !dbg !650, !klee.check.div !123
  store i32 %div, i32* %u32Temp, align 4, !dbg !651
  %5 = load i32, i32* %u32Temp, align 4, !dbg !652
  %cmp5 = icmp ult i32 %5, 65535, !dbg !654
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !655

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !656
  %and = and i32 %6, 65535, !dbg !658
  %conv8 = trunc i32 %and to i16, !dbg !656
  store i16 %conv8, i16* %retval, align 2, !dbg !659
  br label %return, !dbg !659

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !660
  br label %return, !dbg !660

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !662
  ret i16 %7, !dbg !662
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !663 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !666, metadata !DIExpression()), !dbg !667
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !668, metadata !DIExpression()), !dbg !669
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !670, metadata !DIExpression()), !dbg !671
  store i32 0, i32* %u32Temp1, align 4, !dbg !671
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !672, metadata !DIExpression()), !dbg !673
  store i32 0, i32* %u32Temp2, align 4, !dbg !673
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !674
  %conv = zext i16 %0 to i32, !dbg !674
  %and = and i32 %conv, 65535, !dbg !675
  %conv1 = trunc i32 %and to i16, !dbg !674
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !676
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !677
  %conv2 = zext i16 %1 to i32, !dbg !677
  %cmp = icmp eq i32 %conv2, 0, !dbg !679
  br i1 %cmp, label %if.then, label %if.else, !dbg !680

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !681
  br label %return, !dbg !681

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !683
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !685
  %conv4 = zext i16 %3 to i32, !dbg !685
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !686
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !686
  %div = udiv i32 %2, %conv4, !dbg !686, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !687
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !688
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !689
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !690
  %conv5 = zext i16 %6 to i32, !dbg !690
  %mul = mul i32 %5, %conv5, !dbg !691
  %sub = sub i32 %4, %mul, !dbg !692
  %shl = shl i32 %sub, 1, !dbg !693
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !694
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !695
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !696
  %conv6 = zext i16 %8 to i32, !dbg !696
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !697
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !697
  %div7 = udiv i32 %7, %conv6, !dbg !697, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !698
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !699
  %conv8 = zext i16 %10 to i32, !dbg !699
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !700
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !700
  %div9 = udiv i32 %9, %conv8, !dbg !700, !klee.check.div !123
  %add = add i32 %div7, %div9, !dbg !701
  store i32 %add, i32* %u32Temp2, align 4, !dbg !702
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !703
  %cmp10 = icmp ult i32 %11, 65535, !dbg !705
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !706

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !707
  %and13 = and i32 %12, 65535, !dbg !709
  %conv14 = trunc i32 %and13 to i16, !dbg !707
  store i16 %conv14, i16* %retval, align 2, !dbg !710
  br label %return, !dbg !710

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !711
  br label %return, !dbg !711

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !713
  ret i16 %13, !dbg !713
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !714 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !721, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !723, metadata !DIExpression()), !dbg !724
  store i32 0, i32* %s32Result, align 4, !dbg !724
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !725, metadata !DIExpression()), !dbg !726
  store i32 0, i32* %s32Temp1, align 4, !dbg !726
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !727
  %conv = sext i16 %0 to i32, !dbg !727
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !728
  %conv1 = zext i16 %1 to i32, !dbg !728
  %mul = mul nsw i32 %conv, %conv1, !dbg !729
  store i32 %mul, i32* %s32Result, align 4, !dbg !730
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !731
  %conv2 = sext i16 %2 to i32, !dbg !731
  %cmp = icmp eq i32 %conv2, 0, !dbg !733
  br i1 %cmp, label %if.then, label %if.else7, !dbg !734

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !735
  %cmp4 = icmp slt i32 %3, 0, !dbg !738
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !739

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !740
  br label %return, !dbg !740

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !742
  br label %return, !dbg !742

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !744
  %5 = load i32, i32* %s32Result, align 4, !dbg !746
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !747
  %conv8 = sext i16 %6 to i32, !dbg !747
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !748
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !748
  %div = sdiv i32 %5, %conv8, !dbg !748, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !749
  %conv9 = sext i16 %7 to i32, !dbg !749
  %mul10 = mul nsw i32 %div, %conv9, !dbg !750
  %sub = sub nsw i32 %4, %mul10, !dbg !751
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !752
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !753
  %shl = shl i32 %8, 1, !dbg !754
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !755
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !756
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !757
  %conv11 = sext i16 %10 to i32, !dbg !757
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !758
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !758
  %div12 = sdiv i32 %9, %conv11, !dbg !758, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !759
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !760
  %conv13 = sext i16 %12 to i32, !dbg !760
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !761
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !761
  %div14 = sdiv i32 %11, %conv13, !dbg !761, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !762
  store i32 %add, i32* %s32Result, align 4, !dbg !763
  %13 = load i32, i32* %s32Result, align 4, !dbg !764
  %cmp15 = icmp slt i32 %13, 32767, !dbg !766
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !767

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !768
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !771
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !772

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !773
  %conv21 = trunc i32 %15 to i16, !dbg !775
  store i16 %conv21, i16* %retval, align 2, !dbg !776
  br label %return, !dbg !776

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !777
  br label %return, !dbg !777

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !779
  br label %return, !dbg !779

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !781
  ret i16 %16, !dbg !781
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !782 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !785, metadata !DIExpression()), !dbg !786
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !787, metadata !DIExpression()), !dbg !788
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !789, metadata !DIExpression()), !dbg !790
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !791, metadata !DIExpression()), !dbg !792
  store i32 0, i32* %s32Result, align 4, !dbg !792
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !793, metadata !DIExpression()), !dbg !794
  store i32 0, i32* %s32Temp1, align 4, !dbg !794
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !795
  %conv = zext i16 %0 to i32, !dbg !795
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !796
  %conv1 = sext i16 %1 to i32, !dbg !796
  %mul = mul nsw i32 %conv, %conv1, !dbg !797
  store i32 %mul, i32* %s32Result, align 4, !dbg !798
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !799
  %conv2 = zext i16 %2 to i32, !dbg !799
  %cmp = icmp eq i32 %conv2, 0, !dbg !801
  br i1 %cmp, label %if.then, label %if.else7, !dbg !802

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !803
  %cmp4 = icmp slt i32 %3, 0, !dbg !806
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !807

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !808
  br label %return, !dbg !808

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !810
  br label %return, !dbg !810

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !812
  %5 = load i32, i32* %s32Result, align 4, !dbg !814
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !815
  %conv8 = zext i16 %6 to i32, !dbg !815
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !816
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !816
  %div = sdiv i32 %5, %conv8, !dbg !816, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !817
  %conv9 = zext i16 %7 to i32, !dbg !817
  %mul10 = mul nsw i32 %div, %conv9, !dbg !818
  %sub = sub nsw i32 %4, %mul10, !dbg !819
  %shl = shl i32 %sub, 1, !dbg !820
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !821
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !822
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !823
  %conv11 = zext i16 %9 to i32, !dbg !823
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !824
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !824
  %div12 = sdiv i32 %8, %conv11, !dbg !824, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !825
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !826
  %conv13 = zext i16 %11 to i32, !dbg !826
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !827
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !827
  %div14 = sdiv i32 %10, %conv13, !dbg !827, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !828
  store i32 %add, i32* %s32Result, align 4, !dbg !829
  %12 = load i32, i32* %s32Result, align 4, !dbg !830
  %cmp15 = icmp slt i32 %12, 32767, !dbg !832
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !833

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !834
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !837
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !838

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !839
  %conv21 = trunc i32 %14 to i16, !dbg !841
  store i16 %conv21, i16* %retval, align 2, !dbg !842
  br label %return, !dbg !842

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !843
  br label %return, !dbg !843

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !845
  br label %return, !dbg !845

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !847
  ret i16 %15, !dbg !847
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !848 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !851, metadata !DIExpression()), !dbg !852
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !853, metadata !DIExpression()), !dbg !854
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !855, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !857, metadata !DIExpression()), !dbg !858
  store i32 0, i32* %u32Result, align 4, !dbg !858
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !859, metadata !DIExpression()), !dbg !860
  store i32 0, i32* %u32Temp1, align 4, !dbg !860
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !861, metadata !DIExpression()), !dbg !862
  store i32 0, i32* %s32Result, align 4, !dbg !862
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !863, metadata !DIExpression()), !dbg !864
  store i32 0, i32* %s32Temp1, align 4, !dbg !864
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !865
  %conv = sext i16 %0 to i32, !dbg !865
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !866
  %conv1 = zext i16 %1 to i32, !dbg !866
  %mul = mul nsw i32 %conv, %conv1, !dbg !867
  store i32 %mul, i32* %s32Result, align 4, !dbg !868
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !869
  %conv2 = sext i16 %2 to i32, !dbg !869
  %cmp = icmp eq i32 %conv2, 0, !dbg !871
  br i1 %cmp, label %if.then, label %if.else7, !dbg !872

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !873
  %cmp4 = icmp sge i32 %3, 0, !dbg !876
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !877

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !878
  br label %return, !dbg !878

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !880
  br label %return, !dbg !880

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !882
  %5 = load i32, i32* %s32Result, align 4, !dbg !884
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !885
  %conv8 = sext i16 %6 to i32, !dbg !885
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !886
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !886
  %div = sdiv i32 %5, %conv8, !dbg !886, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !887
  %conv9 = sext i16 %7 to i32, !dbg !887
  %mul10 = mul nsw i32 %div, %conv9, !dbg !888
  %sub = sub nsw i32 %4, %mul10, !dbg !889
  %shl = shl i32 %sub, 1, !dbg !890
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !891
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !892
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !893
  %conv11 = sext i16 %9 to i32, !dbg !893
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !894
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !894
  %div12 = sdiv i32 %8, %conv11, !dbg !894, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !895
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !896
  %conv13 = sext i16 %11 to i32, !dbg !896
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !897
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !897
  %div14 = sdiv i32 %10, %conv13, !dbg !897, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !898
  store i32 %add, i32* %s32Result, align 4, !dbg !899
  %12 = load i32, i32* %s32Result, align 4, !dbg !900
  %cmp15 = icmp slt i32 %12, 65535, !dbg !902
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !903

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !904
  %cmp18 = icmp sgt i32 %13, 0, !dbg !907
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !908

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !909
  %conv21 = trunc i32 %14 to i16, !dbg !911
  store i16 %conv21, i16* %retval, align 2, !dbg !912
  br label %return, !dbg !912

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !913
  br label %return, !dbg !913

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !915
  br label %return, !dbg !915

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !917
  ret i16 %15, !dbg !917
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !918 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !921, metadata !DIExpression()), !dbg !922
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !923, metadata !DIExpression()), !dbg !924
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !925, metadata !DIExpression()), !dbg !926
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !927, metadata !DIExpression()), !dbg !928
  store i32 0, i32* %s32Result, align 4, !dbg !928
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !929, metadata !DIExpression()), !dbg !930
  store i32 0, i32* %s32Temp1, align 4, !dbg !930
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !931
  %conv = sext i16 %0 to i32, !dbg !931
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !932
  %conv1 = zext i16 %1 to i32, !dbg !932
  %mul = mul nsw i32 %conv, %conv1, !dbg !933
  store i32 %mul, i32* %s32Result, align 4, !dbg !934
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !935
  %conv2 = zext i16 %2 to i32, !dbg !935
  %cmp = icmp eq i32 %conv2, 0, !dbg !937
  br i1 %cmp, label %if.then, label %if.else7, !dbg !938

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !939
  %cmp4 = icmp sge i32 %3, 0, !dbg !942
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !943

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !944
  br label %return, !dbg !944

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !946
  br label %return, !dbg !946

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !948
  %5 = load i32, i32* %s32Result, align 4, !dbg !950
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !951
  %conv8 = zext i16 %6 to i32, !dbg !951
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !952
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !952
  %div = sdiv i32 %5, %conv8, !dbg !952, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !953
  %conv9 = zext i16 %7 to i32, !dbg !953
  %mul10 = mul nsw i32 %div, %conv9, !dbg !954
  %sub = sub nsw i32 %4, %mul10, !dbg !955
  %shl = shl i32 %sub, 1, !dbg !956
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !957
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !958
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !959
  %conv11 = zext i16 %9 to i32, !dbg !959
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !960
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !960
  %div12 = sdiv i32 %8, %conv11, !dbg !960, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !961
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !962
  %conv13 = zext i16 %11 to i32, !dbg !962
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !963
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !963
  %div14 = sdiv i32 %10, %conv13, !dbg !963, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !964
  store i32 %add, i32* %s32Result, align 4, !dbg !965
  %12 = load i32, i32* %s32Result, align 4, !dbg !966
  %cmp15 = icmp slt i32 %12, 65535, !dbg !968
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !969

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !970
  %cmp18 = icmp sgt i32 %13, 0, !dbg !973
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !974

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !975
  %conv21 = trunc i32 %14 to i16, !dbg !977
  store i16 %conv21, i16* %retval, align 2, !dbg !978
  br label %return, !dbg !978

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !979
  br label %return, !dbg !979

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !981
  br label %return, !dbg !981

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !983
  ret i16 %15, !dbg !983
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !984 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !991, metadata !DIExpression()), !dbg !992
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !993, metadata !DIExpression()), !dbg !994
  store i32 0, i32* %u32Temp1, align 4, !dbg !994
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !995, metadata !DIExpression()), !dbg !996
  store i16 0, i16* %u16TempDenom, align 2, !dbg !996
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !997
  %conv = zext i16 %0 to i32, !dbg !997
  %cmp = icmp eq i32 %conv, 0, !dbg !999
  br i1 %cmp, label %if.then, label %if.else, !dbg !1000

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1001
  br label %return, !dbg !1001

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1003
  %conv2 = zext i16 %1 to i32, !dbg !1003
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1005
  %conv3 = zext i16 %2 to i32, !dbg !1005
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1006
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1007
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1008
  %conv4 = zext i16 %3 to i32, !dbg !1008
  %shr = ashr i32 %conv4, 1, !dbg !1009
  %conv5 = trunc i32 %shr to i16, !dbg !1008
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1010
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1011
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1012
  %conv6 = zext i16 %5 to i32, !dbg !1012
  %add = add i32 %4, %conv6, !dbg !1013
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1014
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1015
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1016
  %conv7 = zext i16 %7 to i32, !dbg !1016
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1017
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1017
  %div = udiv i32 %6, %conv7, !dbg !1017, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1018
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1019
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1021
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1022

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1023
  %and = and i32 %9, 65535, !dbg !1025
  %conv11 = trunc i32 %and to i16, !dbg !1026
  store i16 %conv11, i16* %retval, align 2, !dbg !1027
  br label %return, !dbg !1027

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1028
  br label %return, !dbg !1028

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1030
  ret i16 %10, !dbg !1030
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1031 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1034, metadata !DIExpression()), !dbg !1035
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1036, metadata !DIExpression()), !dbg !1037
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1038, metadata !DIExpression()), !dbg !1039
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1040, metadata !DIExpression()), !dbg !1041
  store i32 0, i32* %u32Temp1, align 4, !dbg !1041
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1042
  %cmp = icmp eq i32 %0, 0, !dbg !1044
  br i1 %cmp, label %if.then, label %if.else, !dbg !1045

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1046
  br label %return, !dbg !1046

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1048
  %conv = zext i16 %1 to i32, !dbg !1048
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1050
  %conv1 = zext i16 %2 to i32, !dbg !1050
  %mul = mul nsw i32 %conv, %conv1, !dbg !1051
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1052
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1053
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1053
  %div = udiv i32 %mul, %3, !dbg !1053, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1054
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1055
  %conv2 = zext i16 %4 to i32, !dbg !1055
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1057
  %conv3 = zext i16 %5 to i32, !dbg !1057
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1058
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1059
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1060
  %mul5 = mul i32 %6, %7, !dbg !1061
  %sub = sub i32 %mul4, %mul5, !dbg !1062
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1063
  %div6 = udiv i32 %8, 2, !dbg !1064
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1065
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1066

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1067
  %inc = add i32 %9, 1, !dbg !1067
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1067
  br label %if.end, !dbg !1069

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1070
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1072
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1073

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1074
  %and = and i32 %11, 65535, !dbg !1076
  %conv13 = trunc i32 %and to i16, !dbg !1077
  store i16 %conv13, i16* %retval, align 2, !dbg !1078
  br label %return, !dbg !1078

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1079
  br label %return, !dbg !1079

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1081
  ret i16 %12, !dbg !1081
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1082 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1087, metadata !DIExpression()), !dbg !1088
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1089, metadata !DIExpression()), !dbg !1090
  store i32 0, i32* %u32Temp1, align 4, !dbg !1090
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1091
  %conv = zext i16 %0 to i32, !dbg !1091
  %cmp = icmp eq i32 %conv, 0, !dbg !1093
  br i1 %cmp, label %if.then, label %if.else, !dbg !1094

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1095
  br label %return, !dbg !1095

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1097
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1099
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1100
  %conv2 = zext i16 %3 to i32, !dbg !1100
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1101
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1101
  %div = udiv i32 %2, %conv2, !dbg !1101, !klee.check.div !123
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1102
  %conv3 = zext i16 %4 to i32, !dbg !1102
  %mul = mul i32 %div, %conv3, !dbg !1103
  %sub = sub i32 %1, %mul, !dbg !1104
  %shl = shl i32 %sub, 1, !dbg !1105
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1106
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1107
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1108
  %conv4 = zext i16 %6 to i32, !dbg !1108
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1109
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1109
  %div5 = udiv i32 %5, %conv4, !dbg !1109, !klee.check.div !123
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1110
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1111
  %conv6 = zext i16 %8 to i32, !dbg !1111
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1112
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1112
  %div7 = udiv i32 %7, %conv6, !dbg !1112, !klee.check.div !123
  %add = add i32 %div5, %div7, !dbg !1113
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1114
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1115
  store i32 %9, i32* %retval, align 4, !dbg !1116
  br label %return, !dbg !1116

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1117
  ret i32 %10, !dbg !1117
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1118 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1127, metadata !DIExpression()), !dbg !1128
  store i32 0, i32* %s32Temp1, align 4, !dbg !1128
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1129, metadata !DIExpression()), !dbg !1130
  store i32 0, i32* %s32Temp2, align 4, !dbg !1130
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1131, metadata !DIExpression()), !dbg !1132
  store i32 0, i32* %s32Temp3, align 4, !dbg !1132
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1133
  %conv = sext i16 %0 to i32, !dbg !1133
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1134
  %conv1 = sext i16 %1 to i32, !dbg !1134
  %mul = mul nsw i32 %conv, %conv1, !dbg !1135
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1136
  %2 = load i16, i16* %div.addr, align 2, !dbg !1137
  %conv2 = sext i16 %2 to i32, !dbg !1137
  %cmp = icmp eq i32 %conv2, 0, !dbg !1139
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1140

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1141
  %cmp4 = icmp slt i32 %3, 0, !dbg !1144
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1145

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1146
  br label %return, !dbg !1146

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1148
  br label %return, !dbg !1148

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1150
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1152
  %6 = load i16, i16* %div.addr, align 2, !dbg !1153
  %conv8 = sext i16 %6 to i32, !dbg !1153
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1154
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1154
  %div9 = sdiv i32 %5, %conv8, !dbg !1154, !klee.check.div !123
  %7 = load i16, i16* %div.addr, align 2, !dbg !1155
  %conv10 = sext i16 %7 to i32, !dbg !1155
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1156
  %sub = sub nsw i32 %4, %mul11, !dbg !1157
  %shl = shl i32 %sub, 1, !dbg !1158
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1159
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1160
  %9 = load i16, i16* %div.addr, align 2, !dbg !1161
  %conv12 = sext i16 %9 to i32, !dbg !1161
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1162
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1162
  %div13 = sdiv i32 %8, %conv12, !dbg !1162, !klee.check.div !123
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1163
  %11 = load i16, i16* %div.addr, align 2, !dbg !1164
  %conv14 = sext i16 %11 to i32, !dbg !1164
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1165
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1165
  %div15 = sdiv i32 %10, %conv14, !dbg !1165, !klee.check.div !123
  %add = add nsw i32 %div13, %div15, !dbg !1166
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1167
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1168
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1170
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1171

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1172
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1175
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1176

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1177
  %conv22 = trunc i32 %14 to i16, !dbg !1179
  store i16 %conv22, i16* %retval, align 2, !dbg !1180
  br label %return, !dbg !1180

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1181
  br label %return, !dbg !1181

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1183
  br label %return, !dbg !1183

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1185
  ret i16 %15, !dbg !1185
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1186 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1189, metadata !DIExpression()), !dbg !1190
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1191, metadata !DIExpression()), !dbg !1192
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i32 0, i32* %s32Result, align 4, !dbg !1196
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1197, metadata !DIExpression()), !dbg !1198
  store i32 0, i32* %s32Temp1, align 4, !dbg !1198
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1199
  %conv = sext i16 %0 to i32, !dbg !1199
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1200
  %conv1 = sext i16 %1 to i32, !dbg !1200
  %mul = mul nsw i32 %conv, %conv1, !dbg !1201
  store i32 %mul, i32* %s32Result, align 4, !dbg !1202
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1203
  %conv2 = zext i16 %2 to i32, !dbg !1203
  %cmp = icmp eq i32 %conv2, 0, !dbg !1205
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1206

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1207
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1210
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1211

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1212
  br label %return, !dbg !1212

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1214
  %cmp7 = icmp eq i32 %4, 0, !dbg !1216
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1217

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1218
  br label %return, !dbg !1218

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1220
  br label %return, !dbg !1220

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1222
  %6 = load i32, i32* %s32Result, align 4, !dbg !1224
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1225
  %conv12 = zext i16 %7 to i32, !dbg !1225
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1226
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1226
  %div = sdiv i32 %6, %conv12, !dbg !1226, !klee.check.div !123
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1227
  %conv13 = zext i16 %8 to i32, !dbg !1227
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1228
  %sub = sub nsw i32 %5, %mul14, !dbg !1229
  %shl = shl i32 %sub, 1, !dbg !1230
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1231
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1232
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1233
  %conv15 = zext i16 %10 to i32, !dbg !1233
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1234
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1234
  %div16 = sdiv i32 %9, %conv15, !dbg !1234, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !1235
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1236
  %conv17 = zext i16 %12 to i32, !dbg !1236
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1237
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1237
  %div18 = sdiv i32 %11, %conv17, !dbg !1237, !klee.check.div !123
  %add = add nsw i32 %div16, %div18, !dbg !1238
  store i32 %add, i32* %s32Result, align 4, !dbg !1239
  %13 = load i32, i32* %s32Result, align 4, !dbg !1240
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1242
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1243

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1244
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1247
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1248

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1249
  %conv25 = trunc i32 %15 to i16, !dbg !1251
  store i16 %conv25, i16* %retval, align 2, !dbg !1252
  br label %return, !dbg !1252

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1253
  br label %return, !dbg !1253

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1255
  br label %return, !dbg !1255

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1257
  ret i16 %16, !dbg !1257
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1258 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1261, metadata !DIExpression()), !dbg !1262
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1263, metadata !DIExpression()), !dbg !1264
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1265, metadata !DIExpression()), !dbg !1266
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1267
  %cmp = icmp eq i32 %0, 0, !dbg !1269
  br i1 %cmp, label %if.then, label %if.else, !dbg !1270

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1271
  br label %return, !dbg !1271

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1273
  %cmp1 = icmp sle i32 %1, 0, !dbg !1276
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1277

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1278
  br label %return, !dbg !1278

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1280
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1282
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1283
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1284
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1284
  %div = udiv i32 %3, %4, !dbg !1284, !klee.check.div !123
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1285
  %mul = mul i32 %div, %5, !dbg !1286
  %sub = sub i32 %2, %mul, !dbg !1287
  %shl = shl i32 %sub, 1, !dbg !1288
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1289
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1290
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1291
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1292
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1292
  %div4 = udiv i32 %6, %7, !dbg !1292, !klee.check.div !123
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1293
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1295
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1295
  %div5 = udiv i32 %8, %9, !dbg !1295, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1296
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1297
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1298
  store i32 %10, i32* %retval, align 4, !dbg !1299
  br label %return, !dbg !1299

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1300
  ret i32 %11, !dbg !1300
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1301 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1304, metadata !DIExpression()), !dbg !1305
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1306, metadata !DIExpression()), !dbg !1307
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i32 0, i32* %s32Temp1, align 4, !dbg !1309
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %cmp = icmp eq i32 %0, 0, !dbg !1312
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1313

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1314
  %cmp1 = icmp sge i32 %1, 0, !dbg !1317
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1318

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1319
  br label %return, !dbg !1319

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1321
  br label %return, !dbg !1321

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1323
  %cmp4 = icmp sge i32 %2, 0, !dbg !1326
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1327

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1328
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1330
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1331
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1332
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1332
  %div = udiv i32 %4, %5, !dbg !1332, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1333
  %mul = mul i32 %div, %6, !dbg !1334
  %sub = sub i32 %3, %mul, !dbg !1335
  %shl = shl i32 %sub, 1, !dbg !1336
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1337
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1338
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1339
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1340
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1340
  %div6 = udiv i32 %7, %8, !dbg !1340, !klee.check.div !123
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1341
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1342
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1343
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1343
  %div7 = udiv i32 %9, %10, !dbg !1343, !klee.check.div !123
  %add = add i32 %div6, %div7, !dbg !1344
  store i32 %add, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1346
  br label %return, !dbg !1346

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1348
  ret i32 %11, !dbg !1348
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1349 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1352, metadata !DIExpression()), !dbg !1353
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1354, metadata !DIExpression()), !dbg !1355
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1356, metadata !DIExpression()), !dbg !1357
  store i32 0, i32* %u32Temp1, align 4, !dbg !1357
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1358, metadata !DIExpression()), !dbg !1359
  store i32 0, i32* %u32Temp2, align 4, !dbg !1359
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1360
  %cmp = icmp eq i32 %0, 0, !dbg !1362
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1363

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1364
  %cmp1 = icmp slt i32 %1, 0, !dbg !1367
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1368

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1369
  br label %return, !dbg !1369

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1371
  br label %return, !dbg !1371

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1373
  %cmp4 = icmp sge i32 %2, 0, !dbg !1376
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1377

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1378
  %cmp6 = icmp eq i32 %3, 0, !dbg !1381
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1382

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1383
  br label %return, !dbg !1383

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %cmp9 = icmp sle i32 %4, 0, !dbg !1388
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1389

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1390
  br label %return, !dbg !1390

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1392
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1394
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1396
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1396
  %div = sdiv i32 %6, %7, !dbg !1396, !klee.check.div !123
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1397
  %mul = mul nsw i32 %div, %8, !dbg !1398
  %sub = sub nsw i32 %5, %mul, !dbg !1399
  %shl = shl i32 %sub, 1, !dbg !1400
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1401
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1402
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1403
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1404
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1404
  %div12 = udiv i32 %9, %10, !dbg !1404, !klee.check.div !123
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1405
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1406
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1407
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1407
  %div13 = sdiv i32 %11, %12, !dbg !1407, !klee.check.div !123
  %add = add i32 %div12, %div13, !dbg !1408
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1409
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1410
  store i32 %13, i32* %retval, align 4, !dbg !1411
  br label %return, !dbg !1411

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1415
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1416

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1417
  br label %return, !dbg !1417

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1419
  %sub18 = sub nsw i32 0, %15, !dbg !1421
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1422
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %sub19 = sub nsw i32 0, %16, !dbg !1424
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1425
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1426
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1427
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1428
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1429
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1429
  %div20 = sdiv i32 %18, %19, !dbg !1429, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1430
  %mul21 = mul nsw i32 %div20, %20, !dbg !1431
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1432
  %shl23 = shl i32 %sub22, 1, !dbg !1433
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1434
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1435
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1436
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1437
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1437
  %div24 = udiv i32 %21, %22, !dbg !1437, !klee.check.div !123
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1438
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1440
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1440
  %div25 = sdiv i32 %23, %24, !dbg !1440, !klee.check.div !123
  %add26 = add i32 %div24, %div25, !dbg !1441
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1442
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1443
  store i32 %25, i32* %retval, align 4, !dbg !1444
  br label %return, !dbg !1444

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1445
  ret i32 %26, !dbg !1445
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1446 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1449, metadata !DIExpression()), !dbg !1450
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1451, metadata !DIExpression()), !dbg !1452
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1453, metadata !DIExpression()), !dbg !1454
  store i32 0, i32* %u32Temp1, align 4, !dbg !1454
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1455, metadata !DIExpression()), !dbg !1456
  store i32 0, i32* %u32Temp2, align 4, !dbg !1456
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1457, metadata !DIExpression()), !dbg !1458
  store i32 0, i32* %u32Temp3, align 4, !dbg !1458
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1459, metadata !DIExpression()), !dbg !1460
  store i32 0, i32* %numerator_old, align 4, !dbg !1460
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1461
  %cmp = icmp eq i32 %0, 0, !dbg !1463
  br i1 %cmp, label %if.then, label %if.else, !dbg !1464

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1465
  br label %return, !dbg !1465

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1467
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1470
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1471
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1472
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1472
  %div = udiv i32 %3, %4, !dbg !1472, !klee.check.div !123
  %mul = mul i32 %2, %div, !dbg !1473
  %sub = sub i32 %1, %mul, !dbg !1474
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1475
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1476
  %and = and i32 %5, 1, !dbg !1478
  %cmp1 = icmp eq i32 %and, 0, !dbg !1479
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1480

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1481
  %shr = lshr i32 %6, 1, !dbg !1483
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1484
  br label %if.end, !dbg !1485

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %shr4 = lshr i32 %7, 1, !dbg !1488
  %add = add i32 %shr4, 1, !dbg !1489
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1490
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1491
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1493
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1494
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1495

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1496
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1499
  %div7 = udiv i32 %10, %11, !dbg !1499, !klee.check.div !123
  store i32 %div7, i32* %retval, align 4, !dbg !1500
  br label %return, !dbg !1500

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1501
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1504
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1504
  %div9 = udiv i32 %12, %13, !dbg !1504, !klee.check.div !123
  %add10 = add i32 %div9, 1, !dbg !1505
  store i32 %add10, i32* %retval, align 4, !dbg !1506
  br label %return, !dbg !1506

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1507
  ret i32 %14, !dbg !1507
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1508 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1511, metadata !DIExpression()), !dbg !1512
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1513, metadata !DIExpression()), !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 0, i32* %u32Temp1, align 4, !dbg !1516
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1517, metadata !DIExpression()), !dbg !1518
  store i32 0, i32* %u32Temp2, align 4, !dbg !1518
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1519
  %cmp = icmp sle i32 %0, 0, !dbg !1521
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1522

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %cmp1 = icmp sge i32 %1, 0, !dbg !1526
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1527

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1528
  br label %return, !dbg !1528

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1530
  %sub = sub nsw i32 0, %2, !dbg !1532
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1533
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1534
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1535
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1536
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1537
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1537
  %div = udiv i32 %4, %5, !dbg !1537, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1538
  %mul = mul i32 %div, %6, !dbg !1539
  %sub3 = sub i32 %3, %mul, !dbg !1540
  %shl = shl i32 %sub3, 1, !dbg !1541
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1542
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1543
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1544
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1545
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1545
  %div4 = udiv i32 %7, %8, !dbg !1545, !klee.check.div !123
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1546
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1547
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1548
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1548
  %div5 = udiv i32 %9, %10, !dbg !1548, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1549
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1550
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1551
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1553
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1554

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1555
  %sub8 = sub i32 0, %12, !dbg !1557
  store i32 %sub8, i32* %retval, align 4, !dbg !1558
  br label %return, !dbg !1558

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1559
  br label %return, !dbg !1559

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1561
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1564
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1565
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1565
  %div11 = udiv i32 %14, %15, !dbg !1565, !klee.check.div !123
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %mul12 = mul i32 %div11, %16, !dbg !1567
  %sub13 = sub i32 %13, %mul12, !dbg !1568
  %shl14 = shl i32 %sub13, 1, !dbg !1569
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1570
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1571
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1572
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1573
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1573
  %div15 = udiv i32 %17, %18, !dbg !1573, !klee.check.div !123
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1574
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1575
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1576
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1576
  %div16 = udiv i32 %19, %20, !dbg !1576, !klee.check.div !123
  %add17 = add i32 %div15, %div16, !dbg !1577
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1578
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1579
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1581
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1582

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1583
  store i32 %22, i32* %retval, align 4, !dbg !1585
  br label %return, !dbg !1585

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1586
  br label %return, !dbg !1586

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1588
  ret i32 %23, !dbg !1588
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1589 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1594, metadata !DIExpression()), !dbg !1595
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1596, metadata !DIExpression()), !dbg !1597
  store i32 0, i32* %s32Temp1, align 4, !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %s32Temp2, align 4, !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %u32Temp0, align 4, !dbg !1601
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1602, metadata !DIExpression()), !dbg !1603
  store i32 0, i32* %u32Temp1, align 4, !dbg !1603
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1604, metadata !DIExpression()), !dbg !1605
  store i32 0, i32* %u32Temp2, align 4, !dbg !1605
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %cmp = icmp eq i32 %0, 0, !dbg !1608
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1609

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1610
  %cmp1 = icmp slt i32 %1, 0, !dbg !1613
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1614

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1615
  br label %return, !dbg !1615

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1617
  br label %return, !dbg !1617

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1619
  %cmp4 = icmp sle i32 %2, 0, !dbg !1622
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1623

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1624
  %sub = sub nsw i32 0, %3, !dbg !1626
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1627
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1628
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1630
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1630
  %div = udiv i32 %4, %5, !dbg !1630, !klee.check.div !123
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1631
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1632
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1633
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1634
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1635
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1635
  %div6 = udiv i32 %7, %8, !dbg !1635, !klee.check.div !123
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1636
  %mul = mul i32 %div6, %9, !dbg !1637
  %sub7 = sub i32 %6, %mul, !dbg !1638
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1639
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1640
  %and = and i32 %10, 1, !dbg !1642
  %cmp8 = icmp eq i32 %and, 0, !dbg !1643
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1644

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1645
  %shr = lshr i32 %11, 1, !dbg !1647
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1648
  br label %if.end, !dbg !1649

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1650
  %shr11 = lshr i32 %12, 1, !dbg !1652
  %add = add i32 %shr11, 1, !dbg !1653
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1654
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1655
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1657
  %cmp12 = icmp ult i32 %13, %14, !dbg !1658
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1659

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1660
  %neg = xor i32 %15, -1, !dbg !1662
  %add14 = add i32 %neg, 1, !dbg !1663
  store i32 %add14, i32* %retval, align 4, !dbg !1664
  br label %return, !dbg !1664

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1665
  %add16 = add i32 %16, 1, !dbg !1667
  %neg17 = xor i32 %add16, -1, !dbg !1668
  %add18 = add i32 %neg17, 1, !dbg !1669
  store i32 %add18, i32* %retval, align 4, !dbg !1670
  br label %return, !dbg !1670

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1671
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1673
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1674
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1675
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1675
  %div20 = udiv i32 %18, %19, !dbg !1675, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1676
  %mul21 = mul i32 %div20, %20, !dbg !1677
  %sub22 = sub i32 %17, %mul21, !dbg !1678
  %shl = shl i32 %sub22, 1, !dbg !1679
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1680
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1681
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1682
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1683
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1683
  %div23 = udiv i32 %21, %22, !dbg !1683, !klee.check.div !123
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1684
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1685
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1686
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1686
  %div24 = udiv i32 %23, %24, !dbg !1686, !klee.check.div !123
  %add25 = add i32 %div23, %div24, !dbg !1687
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1688
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1689
  store i32 %25, i32* %retval, align 4, !dbg !1690
  br label %return, !dbg !1690

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1691
  ret i32 %26, !dbg !1691
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1692 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1695, metadata !DIExpression()), !dbg !1696
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1697, metadata !DIExpression()), !dbg !1698
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1699, metadata !DIExpression()), !dbg !1700
  store i32 0, i32* %s32Temp1, align 4, !dbg !1700
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1701, metadata !DIExpression()), !dbg !1702
  store i32 0, i32* %s32Temp2, align 4, !dbg !1702
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1703, metadata !DIExpression()), !dbg !1704
  store i32 0, i32* %denominator_prime, align 4, !dbg !1704
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1705, metadata !DIExpression()), !dbg !1706
  store i32 0, i32* %u32Temp1, align 4, !dbg !1706
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1707, metadata !DIExpression()), !dbg !1708
  store i32 0, i32* %u32Temp2, align 4, !dbg !1708
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1709, metadata !DIExpression()), !dbg !1710
  store i32 0, i32* %u32numerator, align 4, !dbg !1710
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1711, metadata !DIExpression()), !dbg !1712
  store i32 0, i32* %u32denominator, align 4, !dbg !1712
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1713
  %cmp = icmp slt i32 %0, 0, !dbg !1715
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1716

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %cmp1 = icmp sle i32 %1, 0, !dbg !1720
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1721

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1722
  %cmp3 = icmp sge i32 %2, 0, !dbg !1725
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1726

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1727
  br label %return, !dbg !1727

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1729
  %sub = sub nsw i32 0, %3, !dbg !1731
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1732
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1733
  %sub5 = sub nsw i32 0, %4, !dbg !1734
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1735
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1736
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1737
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1738
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1739
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1739
  %div = udiv i32 %6, %7, !dbg !1739, !klee.check.div !123
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1740
  %mul = mul i32 %div, %8, !dbg !1741
  %sub6 = sub i32 %5, %mul, !dbg !1742
  %shl = shl i32 %sub6, 1, !dbg !1743
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1744
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1745
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1746
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1747
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1747
  %div7 = udiv i32 %9, %10, !dbg !1747, !klee.check.div !123
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1748
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1749
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1750
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1750
  %div8 = udiv i32 %11, %12, !dbg !1750, !klee.check.div !123
  %add = add i32 %div7, %div8, !dbg !1751
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1752
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1753
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1755
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1756

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1757
  store i32 %14, i32* %retval, align 4, !dbg !1759
  br label %return, !dbg !1759

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1760
  br label %return, !dbg !1760

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1762
  %neg = xor i32 %15, -1, !dbg !1764
  %add13 = add nsw i32 %neg, 1, !dbg !1765
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1766
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1767
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1768
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1769
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1770
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1770
  %div14 = udiv i32 %17, %18, !dbg !1770, !klee.check.div !123
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1771
  %mul15 = mul i32 %div14, %19, !dbg !1772
  %sub16 = sub i32 %16, %mul15, !dbg !1773
  %shl17 = shl i32 %sub16, 1, !dbg !1774
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1775
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1776
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1777
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1778
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1778
  %div18 = udiv i32 %20, %21, !dbg !1778, !klee.check.div !123
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1779
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1780
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1781
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1781
  %div19 = sdiv i32 %22, %23, !dbg !1781, !klee.check.div !123
  %add20 = add i32 %div18, %div19, !dbg !1782
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1783
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1784
  %neg21 = xor i32 %24, -1, !dbg !1785
  %add22 = add nsw i32 %neg21, 1, !dbg !1786
  store i32 %add22, i32* %retval, align 4, !dbg !1787
  br label %return, !dbg !1787

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %cmp24 = icmp sle i32 %25, 0, !dbg !1791
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1792

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1793
  %cmp26 = icmp sge i32 %26, 0, !dbg !1796
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1797

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1798
  br label %return, !dbg !1798

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1800
  %neg29 = xor i32 %27, -1, !dbg !1802
  %add30 = add nsw i32 %neg29, 1, !dbg !1803
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1804
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1805
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1806
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1807
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1808
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1808
  %div31 = udiv i32 %29, %30, !dbg !1808, !klee.check.div !123
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1809
  %mul32 = mul i32 %div31, %31, !dbg !1810
  %sub33 = sub i32 %28, %mul32, !dbg !1811
  %shl34 = shl i32 %sub33, 1, !dbg !1812
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1813
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1814
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1815
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1816
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1816
  %div35 = udiv i32 %32, %33, !dbg !1816, !klee.check.div !123
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1817
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1818
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1819
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1819
  %div36 = udiv i32 %34, %35, !dbg !1819, !klee.check.div !123
  %add37 = add i32 %div35, %div36, !dbg !1820
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1821
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1822
  %neg38 = xor i32 %36, -1, !dbg !1823
  %add39 = add nsw i32 %neg38, 1, !dbg !1824
  store i32 %add39, i32* %retval, align 4, !dbg !1825
  br label %return, !dbg !1825

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1826
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1828
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1829
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1830
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1830
  %div41 = sdiv i32 %38, %39, !dbg !1830, !klee.check.div !123
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1831
  %mul42 = mul nsw i32 %div41, %40, !dbg !1832
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1833
  %shl44 = shl i32 %sub43, 1, !dbg !1834
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1835
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1836
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1837
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1838
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1838
  %div45 = sdiv i32 %41, %42, !dbg !1838, !klee.check.div !123
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1839
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1840
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1841
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1841
  %div46 = udiv i32 %43, %44, !dbg !1841, !klee.check.div !123
  %add47 = add i32 %div45, %div46, !dbg !1842
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1843
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1844
  store i32 %45, i32* %retval, align 4, !dbg !1845
  br label %return, !dbg !1845

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1846
  ret i32 %46, !dbg !1846
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1847 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1850, metadata !DIExpression()), !dbg !1851
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1852, metadata !DIExpression()), !dbg !1853
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1854, metadata !DIExpression()), !dbg !1855
  store i32 0, i32* %numerator_prime, align 4, !dbg !1855
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1856, metadata !DIExpression()), !dbg !1857
  store i32 0, i32* %u32Temp1, align 4, !dbg !1857
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1858, metadata !DIExpression()), !dbg !1859
  store i32 0, i32* %u32Temp2, align 4, !dbg !1859
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1860, metadata !DIExpression()), !dbg !1861
  store i32 0, i32* %u32Temp3, align 4, !dbg !1861
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1862, metadata !DIExpression()), !dbg !1863
  store i32 0, i32* %s32Temp1, align 4, !dbg !1863
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1864, metadata !DIExpression()), !dbg !1865
  store i32 0, i32* %s32Temp2, align 4, !dbg !1865
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1866, metadata !DIExpression()), !dbg !1867
  store i32 0, i32* %s32Temp3, align 4, !dbg !1867
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1868
  %cmp = icmp eq i32 %0, 0, !dbg !1870
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1871

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1872
  %cmp1 = icmp slt i32 %1, 0, !dbg !1875
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1876

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1877
  br label %return, !dbg !1877

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1879
  br label %return, !dbg !1879

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %cmp4 = icmp slt i32 %2, 0, !dbg !1884
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1885

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1886
  %sub = sub nsw i32 0, %3, !dbg !1888
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1889
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1890
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1891
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1892
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1892
  %div = udiv i32 %4, %5, !dbg !1892, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1893
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1894
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1895
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %mul = mul i32 %7, %8, !dbg !1897
  %sub6 = sub i32 %6, %mul, !dbg !1898
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1899
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1900
  %and = and i32 %9, 1, !dbg !1902
  %cmp7 = icmp eq i32 %and, 0, !dbg !1903
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1904

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1905
  %shr = lshr i32 %10, 1, !dbg !1907
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1908
  br label %if.end, !dbg !1909

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1910
  %shr10 = lshr i32 %11, 1, !dbg !1912
  %add = add i32 %shr10, 1, !dbg !1913
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1914
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1915
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1917
  %cmp11 = icmp ult i32 %12, %13, !dbg !1918
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1919

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1920
  %neg = xor i32 %14, -1, !dbg !1922
  %add13 = add i32 %neg, 1, !dbg !1923
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1924
  br label %if.end18, !dbg !1925

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1926
  %add15 = add i32 %15, 1, !dbg !1928
  %neg16 = xor i32 %add15, -1, !dbg !1929
  %add17 = add i32 %neg16, 1, !dbg !1930
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1931
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1932
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1934
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1935

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1936
  %conv = trunc i32 %17 to i16, !dbg !1938
  store i16 %conv, i16* %retval, align 2, !dbg !1939
  br label %return, !dbg !1939

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1940
  br label %return, !dbg !1940

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1942
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1944
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1945
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1945
  %div23 = udiv i32 %18, %19, !dbg !1945, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %mul24 = mul i32 %div23, %20, !dbg !1947
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1948
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1949
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1950
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1951
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1952
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1952
  %div25 = udiv i32 %22, %23, !dbg !1952, !klee.check.div !123
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1953
  %mul26 = mul i32 %div25, %24, !dbg !1954
  %sub27 = sub i32 %21, %mul26, !dbg !1955
  %shl = shl i32 %sub27, 1, !dbg !1956
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1957
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1958
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1959
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1960
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1960
  %div28 = udiv i32 %25, %26, !dbg !1960, !klee.check.div !123
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1961
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1962
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1963
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1963
  %div29 = udiv i32 %27, %28, !dbg !1963, !klee.check.div !123
  %add30 = add i32 %div28, %div29, !dbg !1964
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1965
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1966
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1968
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1969

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1970
  %conv34 = trunc i32 %30 to i16, !dbg !1972
  store i16 %conv34, i16* %retval, align 2, !dbg !1973
  br label %return, !dbg !1973

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1974
  br label %return, !dbg !1974

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1976
  ret i16 %31, !dbg !1976
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1977 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1983, metadata !DIExpression()), !dbg !1984
  %2 = icmp eq i64 %0, 0, !dbg !1985
  br i1 %2, label %3, label %4, !dbg !1987

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1988
  unreachable, !dbg !1988

4:                                                ; preds = %1
  ret void, !dbg !1989
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1990 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1996, metadata !DIExpression()), !dbg !1998
  call void @llvm.dbg.value(metadata i64 %1, metadata !1997, metadata !DIExpression()), !dbg !1998
  %3 = icmp ult i64 %1, %0, !dbg !1999
  br i1 %3, label %5, label %4, !dbg !2001

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2002
  unreachable, !dbg !2002

5:                                                ; preds = %2
  ret void, !dbg !2004
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050/div_Ccode_alarm_0050.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050")
!4 = !{}
!5 = !{!6, !11, !12, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !13, line: 11, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050")
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
!177 = !DILocation(line: 215, column: 15, scope: !111)
!178 = !DILocation(line: 215, column: 24, scope: !111)
!179 = !DILocation(line: 215, column: 23, scope: !111)
!180 = !DILocation(line: 215, column: 13, scope: !111)
!181 = !DILocation(line: 217, column: 47, scope: !182)
!182 = distinct !DILexicalBlock(scope: !111, file: !69, line: 217, column: 8)
!183 = !DILocation(line: 217, column: 37, scope: !182)
!184 = !DILocation(line: 217, column: 10, scope: !182)
!185 = !DILocation(line: 217, column: 8, scope: !111)
!186 = !DILocation(line: 218, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !69, line: 217, column: 63)
!188 = !DILocation(line: 225, column: 37, scope: !111)
!189 = !DILocation(line: 225, column: 46, scope: !111)
!190 = !DILocation(line: 225, column: 54, scope: !111)
!191 = !DILocation(line: 225, column: 52, scope: !111)
!192 = !DILocation(line: 225, column: 26, scope: !111)
!193 = !DILocation(line: 225, column: 24, scope: !111)
!194 = !DILocation(line: 226, column: 4, scope: !111)
!195 = !DILocation(line: 245, column: 7, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !69, line: 245, column: 7)
!197 = distinct !DILexicalBlock(scope: !105, file: !69, line: 244, column: 3)
!198 = !DILocation(line: 245, column: 19, scope: !196)
!199 = !DILocation(line: 245, column: 7, scope: !197)
!200 = !DILocation(line: 247, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !69, line: 246, column: 4)
!202 = !DILocation(line: 247, column: 29, scope: !201)
!203 = !DILocation(line: 247, column: 38, scope: !201)
!204 = !DILocation(line: 247, column: 37, scope: !201)
!205 = !DILocation(line: 247, column: 53, scope: !201)
!206 = !DILocation(line: 247, column: 51, scope: !201)
!207 = !DILocation(line: 247, column: 26, scope: !201)
!208 = !DILocation(line: 247, column: 66, scope: !201)
!209 = !DILocation(line: 247, column: 14, scope: !201)
!210 = !DILocation(line: 248, column: 16, scope: !201)
!211 = !DILocation(line: 248, column: 25, scope: !201)
!212 = !DILocation(line: 248, column: 24, scope: !201)
!213 = !DILocation(line: 248, column: 14, scope: !201)
!214 = !DILocation(line: 249, column: 16, scope: !201)
!215 = !DILocation(line: 249, column: 28, scope: !201)
!216 = !DILocation(line: 249, column: 37, scope: !201)
!217 = !DILocation(line: 249, column: 43, scope: !201)
!218 = !DILocation(line: 249, column: 42, scope: !201)
!219 = !DILocation(line: 249, column: 25, scope: !201)
!220 = !DILocation(line: 249, column: 14, scope: !201)
!221 = !DILocation(line: 250, column: 8, scope: !222)
!222 = distinct !DILexicalBlock(scope: !201, file: !69, line: 250, column: 8)
!223 = !DILocation(line: 250, column: 17, scope: !222)
!224 = !DILocation(line: 250, column: 8, scope: !201)
!225 = !DILocation(line: 252, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !227, file: !69, line: 252, column: 9)
!227 = distinct !DILexicalBlock(scope: !222, file: !69, line: 251, column: 5)
!228 = !DILocation(line: 252, column: 18, scope: !226)
!229 = !DILocation(line: 252, column: 9, scope: !227)
!230 = !DILocation(line: 254, column: 19, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !69, line: 253, column: 6)
!232 = !DILocation(line: 254, column: 14, scope: !231)
!233 = !DILocation(line: 254, column: 7, scope: !231)
!234 = !DILocation(line: 258, column: 7, scope: !235)
!235 = distinct !DILexicalBlock(scope: !226, file: !69, line: 257, column: 6)
!236 = !DILocation(line: 263, column: 6, scope: !237)
!237 = distinct !DILexicalBlock(scope: !222, file: !69, line: 262, column: 5)
!238 = !DILocation(line: 268, column: 5, scope: !239)
!239 = distinct !DILexicalBlock(scope: !196, file: !69, line: 267, column: 4)
!240 = !DILocation(line: 272, column: 1, scope: !68)
!241 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !242, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!242 = !DISubroutineType(types: !243)
!243 = !{!11, !6}
!244 = !DILocalVariable(name: "left", arg: 1, scope: !241, file: !33, line: 84, type: !6)
!245 = !DILocation(line: 84, column: 51, scope: !241)
!246 = !DILocation(line: 86, column: 12, scope: !241)
!247 = !DILocation(line: 86, column: 17, scope: !241)
!248 = !DILocation(line: 86, column: 5, scope: !241)
!249 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !242, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!250 = !DILocalVariable(name: "denominator", arg: 1, scope: !249, file: !33, line: 24, type: !6)
!251 = !DILocation(line: 24, column: 40, scope: !249)
!252 = !DILocation(line: 26, column: 12, scope: !249)
!253 = !DILocation(line: 26, column: 24, scope: !249)
!254 = !DILocation(line: 26, column: 5, scope: !249)
!255 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !256, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!256 = !DISubroutineType(types: !257)
!257 = !{!11, !6, !16}
!258 = !DILocalVariable(name: "left", arg: 1, scope: !255, file: !33, line: 90, type: !6)
!259 = !DILocation(line: 90, column: 41, scope: !255)
!260 = !DILocalVariable(name: "count", arg: 2, scope: !255, file: !33, line: 90, type: !16)
!261 = !DILocation(line: 90, column: 56, scope: !255)
!262 = !DILocation(line: 92, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !255, file: !33, line: 92, column: 9)
!264 = !DILocation(line: 92, column: 15, scope: !263)
!265 = !DILocation(line: 92, column: 9, scope: !255)
!266 = !DILocation(line: 93, column: 9, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !33, line: 92, column: 32)
!268 = !DILocation(line: 95, column: 12, scope: !255)
!269 = !DILocation(line: 95, column: 34, scope: !255)
!270 = !DILocation(line: 95, column: 31, scope: !255)
!271 = !DILocation(line: 95, column: 17, scope: !255)
!272 = !DILocation(line: 95, column: 41, scope: !255)
!273 = !DILocation(line: 95, column: 5, scope: !255)
!274 = !DILocation(line: 96, column: 1, scope: !255)
!275 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !276, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!276 = !DISubroutineType(types: !277)
!277 = !{!11, !6, !6}
!278 = !DILocalVariable(name: "left", arg: 1, scope: !275, file: !33, line: 78, type: !6)
!279 = !DILocation(line: 78, column: 38, scope: !275)
!280 = !DILocalVariable(name: "right", arg: 2, scope: !275, file: !33, line: 78, type: !6)
!281 = !DILocation(line: 78, column: 52, scope: !275)
!282 = !DILocation(line: 80, column: 12, scope: !275)
!283 = !DILocation(line: 80, column: 19, scope: !275)
!284 = !DILocation(line: 80, column: 17, scope: !275)
!285 = !DILocation(line: 80, column: 25, scope: !275)
!286 = !DILocation(line: 80, column: 5, scope: !275)
!287 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !69, file: !69, line: 289, type: !288, scopeLine: 290, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!288 = !DISubroutineType(types: !289)
!289 = !{!20, !12, !20}
!290 = !DILocalVariable(name: "numerator", arg: 1, scope: !287, file: !69, line: 289, type: !12)
!291 = !DILocation(line: 289, column: 25, scope: !287)
!292 = !DILocalVariable(name: "denominator", arg: 2, scope: !287, file: !69, line: 289, type: !20)
!293 = !DILocation(line: 289, column: 41, scope: !287)
!294 = !DILocalVariable(name: "s32Temp1", scope: !287, file: !69, line: 291, type: !12)
!295 = !DILocation(line: 291, column: 6, scope: !287)
!296 = !DILocalVariable(name: "s32Temp2", scope: !287, file: !69, line: 291, type: !12)
!297 = !DILocation(line: 291, column: 17, scope: !287)
!298 = !DILocation(line: 292, column: 13, scope: !287)
!299 = !DILocation(line: 292, column: 11, scope: !287)
!300 = !DILocation(line: 293, column: 5, scope: !301)
!301 = distinct !DILexicalBlock(scope: !287, file: !69, line: 293, column: 5)
!302 = !DILocation(line: 293, column: 17, scope: !301)
!303 = !DILocation(line: 293, column: 5, scope: !287)
!304 = !DILocation(line: 295, column: 7, scope: !305)
!305 = distinct !DILexicalBlock(scope: !306, file: !69, line: 295, column: 7)
!306 = distinct !DILexicalBlock(scope: !301, file: !69, line: 294, column: 2)
!307 = !DILocation(line: 295, column: 17, scope: !305)
!308 = !DILocation(line: 295, column: 7, scope: !306)
!309 = !DILocation(line: 297, column: 4, scope: !310)
!310 = distinct !DILexicalBlock(scope: !305, file: !69, line: 296, column: 3)
!311 = !DILocation(line: 301, column: 4, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !69, line: 300, column: 3)
!313 = !DILocation(line: 306, column: 6, scope: !314)
!314 = distinct !DILexicalBlock(scope: !315, file: !69, line: 306, column: 6)
!315 = distinct !DILexicalBlock(scope: !301, file: !69, line: 305, column: 2)
!316 = !DILocation(line: 306, column: 16, scope: !314)
!317 = !DILocation(line: 306, column: 6, scope: !315)
!318 = !DILocation(line: 308, column: 16, scope: !319)
!319 = distinct !DILexicalBlock(scope: !314, file: !69, line: 307, column: 3)
!320 = !DILocation(line: 308, column: 28, scope: !319)
!321 = !DILocation(line: 308, column: 37, scope: !319)
!322 = !DILocation(line: 308, column: 36, scope: !319)
!323 = !DILocation(line: 308, column: 52, scope: !319)
!324 = !DILocation(line: 308, column: 50, scope: !319)
!325 = !DILocation(line: 308, column: 25, scope: !319)
!326 = !DILocation(line: 308, column: 65, scope: !319)
!327 = !DILocation(line: 308, column: 13, scope: !319)
!328 = !DILocation(line: 309, column: 15, scope: !319)
!329 = !DILocation(line: 309, column: 24, scope: !319)
!330 = !DILocation(line: 309, column: 23, scope: !319)
!331 = !DILocation(line: 309, column: 13, scope: !319)
!332 = !DILocation(line: 310, column: 15, scope: !319)
!333 = !DILocation(line: 310, column: 27, scope: !319)
!334 = !DILocation(line: 310, column: 38, scope: !319)
!335 = !DILocation(line: 310, column: 37, scope: !319)
!336 = !DILocation(line: 310, column: 24, scope: !319)
!337 = !DILocation(line: 310, column: 13, scope: !319)
!338 = !DILocation(line: 311, column: 7, scope: !339)
!339 = distinct !DILexicalBlock(scope: !319, file: !69, line: 311, column: 7)
!340 = !DILocation(line: 311, column: 16, scope: !339)
!341 = !DILocation(line: 311, column: 7, scope: !319)
!342 = !DILocation(line: 313, column: 8, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !69, line: 313, column: 8)
!344 = distinct !DILexicalBlock(scope: !339, file: !69, line: 312, column: 4)
!345 = !DILocation(line: 313, column: 17, scope: !343)
!346 = !DILocation(line: 313, column: 8, scope: !344)
!347 = !DILocation(line: 315, column: 18, scope: !348)
!348 = distinct !DILexicalBlock(scope: !343, file: !69, line: 314, column: 5)
!349 = !DILocation(line: 315, column: 13, scope: !348)
!350 = !DILocation(line: 315, column: 6, scope: !348)
!351 = !DILocation(line: 319, column: 6, scope: !352)
!352 = distinct !DILexicalBlock(scope: !343, file: !69, line: 318, column: 5)
!353 = !DILocation(line: 324, column: 5, scope: !354)
!354 = distinct !DILexicalBlock(scope: !339, file: !69, line: 323, column: 4)
!355 = !DILocation(line: 329, column: 7, scope: !356)
!356 = distinct !DILexicalBlock(scope: !357, file: !69, line: 329, column: 7)
!357 = distinct !DILexicalBlock(scope: !314, file: !69, line: 328, column: 3)
!358 = !DILocation(line: 329, column: 19, scope: !356)
!359 = !DILocation(line: 329, column: 7, scope: !357)
!360 = !DILocation(line: 331, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !69, line: 330, column: 4)
!362 = !DILocation(line: 331, column: 29, scope: !361)
!363 = !DILocation(line: 331, column: 38, scope: !361)
!364 = !DILocation(line: 331, column: 37, scope: !361)
!365 = !DILocation(line: 331, column: 53, scope: !361)
!366 = !DILocation(line: 331, column: 51, scope: !361)
!367 = !DILocation(line: 331, column: 26, scope: !361)
!368 = !DILocation(line: 331, column: 66, scope: !361)
!369 = !DILocation(line: 331, column: 14, scope: !361)
!370 = !DILocation(line: 332, column: 16, scope: !361)
!371 = !DILocation(line: 332, column: 25, scope: !361)
!372 = !DILocation(line: 332, column: 24, scope: !361)
!373 = !DILocation(line: 332, column: 14, scope: !361)
!374 = !DILocation(line: 333, column: 16, scope: !361)
!375 = !DILocation(line: 333, column: 28, scope: !361)
!376 = !DILocation(line: 333, column: 39, scope: !361)
!377 = !DILocation(line: 333, column: 38, scope: !361)
!378 = !DILocation(line: 333, column: 25, scope: !361)
!379 = !DILocation(line: 333, column: 14, scope: !361)
!380 = !DILocation(line: 334, column: 8, scope: !381)
!381 = distinct !DILexicalBlock(scope: !361, file: !69, line: 334, column: 8)
!382 = !DILocation(line: 334, column: 17, scope: !381)
!383 = !DILocation(line: 334, column: 8, scope: !361)
!384 = !DILocation(line: 336, column: 9, scope: !385)
!385 = distinct !DILexicalBlock(scope: !386, file: !69, line: 336, column: 9)
!386 = distinct !DILexicalBlock(scope: !381, file: !69, line: 335, column: 5)
!387 = !DILocation(line: 336, column: 18, scope: !385)
!388 = !DILocation(line: 336, column: 9, scope: !386)
!389 = !DILocation(line: 338, column: 19, scope: !390)
!390 = distinct !DILexicalBlock(scope: !385, file: !69, line: 337, column: 6)
!391 = !DILocation(line: 338, column: 14, scope: !390)
!392 = !DILocation(line: 338, column: 7, scope: !390)
!393 = !DILocation(line: 342, column: 7, scope: !394)
!394 = distinct !DILexicalBlock(scope: !385, file: !69, line: 341, column: 6)
!395 = !DILocation(line: 347, column: 6, scope: !396)
!396 = distinct !DILexicalBlock(scope: !381, file: !69, line: 346, column: 5)
!397 = !DILocation(line: 353, column: 5, scope: !398)
!398 = distinct !DILexicalBlock(scope: !356, file: !69, line: 352, column: 4)
!399 = !DILocation(line: 359, column: 1, scope: !287)
!400 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 377, type: !401, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!401 = !DISubroutineType(types: !402)
!402 = !{!20, !20, !28}
!403 = !DILocalVariable(name: "numerator", arg: 1, scope: !400, file: !69, line: 377, type: !20)
!404 = !DILocation(line: 377, column: 31, scope: !400)
!405 = !DILocalVariable(name: "denominator", arg: 2, scope: !400, file: !69, line: 377, type: !28)
!406 = !DILocation(line: 377, column: 47, scope: !400)
!407 = !DILocalVariable(name: "u16Temp1", scope: !400, file: !69, line: 379, type: !28)
!408 = !DILocation(line: 379, column: 6, scope: !400)
!409 = !DILocalVariable(name: "s32Temp1", scope: !400, file: !69, line: 380, type: !12)
!410 = !DILocation(line: 380, column: 6, scope: !400)
!411 = !DILocalVariable(name: "s32Temp2", scope: !400, file: !69, line: 380, type: !12)
!412 = !DILocation(line: 380, column: 15, scope: !400)
!413 = !DILocation(line: 381, column: 13, scope: !400)
!414 = !DILocation(line: 381, column: 25, scope: !400)
!415 = !DILocation(line: 381, column: 11, scope: !400)
!416 = !DILocation(line: 382, column: 13, scope: !400)
!417 = !DILocation(line: 382, column: 22, scope: !400)
!418 = !DILocation(line: 382, column: 11, scope: !400)
!419 = !DILocation(line: 383, column: 5, scope: !420)
!420 = distinct !DILexicalBlock(scope: !400, file: !69, line: 383, column: 5)
!421 = !DILocation(line: 383, column: 14, scope: !420)
!422 = !DILocation(line: 383, column: 5, scope: !400)
!423 = !DILocation(line: 385, column: 7, scope: !424)
!424 = distinct !DILexicalBlock(scope: !425, file: !69, line: 385, column: 7)
!425 = distinct !DILexicalBlock(scope: !420, file: !69, line: 384, column: 2)
!426 = !DILocation(line: 385, column: 17, scope: !424)
!427 = !DILocation(line: 385, column: 7, scope: !425)
!428 = !DILocation(line: 387, column: 4, scope: !429)
!429 = distinct !DILexicalBlock(scope: !424, file: !69, line: 386, column: 3)
!430 = !DILocation(line: 391, column: 4, scope: !431)
!431 = distinct !DILexicalBlock(scope: !424, file: !69, line: 390, column: 3)
!432 = !DILocation(line: 396, column: 15, scope: !433)
!433 = distinct !DILexicalBlock(scope: !420, file: !69, line: 395, column: 2)
!434 = !DILocation(line: 396, column: 24, scope: !433)
!435 = !DILocation(line: 396, column: 32, scope: !433)
!436 = !DILocation(line: 396, column: 41, scope: !433)
!437 = !DILocation(line: 396, column: 47, scope: !433)
!438 = !DILocation(line: 396, column: 46, scope: !433)
!439 = !DILocation(line: 396, column: 57, scope: !433)
!440 = !DILocation(line: 396, column: 56, scope: !433)
!441 = !DILocation(line: 396, column: 29, scope: !433)
!442 = !DILocation(line: 396, column: 12, scope: !433)
!443 = !DILocation(line: 397, column: 14, scope: !433)
!444 = !DILocation(line: 397, column: 22, scope: !433)
!445 = !DILocation(line: 397, column: 12, scope: !433)
!446 = !DILocation(line: 398, column: 14, scope: !433)
!447 = !DILocation(line: 398, column: 23, scope: !433)
!448 = !DILocation(line: 398, column: 22, scope: !433)
!449 = !DILocation(line: 398, column: 12, scope: !433)
!450 = !DILocation(line: 399, column: 16, scope: !433)
!451 = !DILocation(line: 399, column: 25, scope: !433)
!452 = !DILocation(line: 399, column: 31, scope: !433)
!453 = !DILocation(line: 399, column: 30, scope: !433)
!454 = !DILocation(line: 399, column: 43, scope: !433)
!455 = !DILocation(line: 399, column: 41, scope: !433)
!456 = !DILocation(line: 399, column: 12, scope: !433)
!457 = !DILocation(line: 400, column: 6, scope: !458)
!458 = distinct !DILexicalBlock(scope: !433, file: !69, line: 400, column: 6)
!459 = !DILocation(line: 400, column: 15, scope: !458)
!460 = !DILocation(line: 400, column: 6, scope: !433)
!461 = !DILocation(line: 402, column: 7, scope: !462)
!462 = distinct !DILexicalBlock(scope: !463, file: !69, line: 402, column: 7)
!463 = distinct !DILexicalBlock(scope: !458, file: !69, line: 401, column: 3)
!464 = !DILocation(line: 402, column: 16, scope: !462)
!465 = !DILocation(line: 402, column: 7, scope: !463)
!466 = !DILocation(line: 404, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !462, file: !69, line: 403, column: 4)
!468 = !DILocation(line: 404, column: 12, scope: !467)
!469 = !DILocation(line: 404, column: 5, scope: !467)
!470 = !DILocation(line: 408, column: 5, scope: !471)
!471 = distinct !DILexicalBlock(scope: !462, file: !69, line: 407, column: 4)
!472 = !DILocation(line: 413, column: 4, scope: !473)
!473 = distinct !DILexicalBlock(scope: !458, file: !69, line: 412, column: 3)
!474 = !DILocation(line: 416, column: 1, scope: !400)
!475 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 433, type: !401, scopeLine: 434, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!476 = !DILocalVariable(name: "numerator", arg: 1, scope: !475, file: !69, line: 433, type: !20)
!477 = !DILocation(line: 433, column: 30, scope: !475)
!478 = !DILocalVariable(name: "denominator", arg: 2, scope: !475, file: !69, line: 433, type: !28)
!479 = !DILocation(line: 433, column: 45, scope: !475)
!480 = !DILocalVariable(name: "u16Temp1", scope: !475, file: !69, line: 435, type: !28)
!481 = !DILocation(line: 435, column: 6, scope: !475)
!482 = !DILocalVariable(name: "s32Temp1", scope: !475, file: !69, line: 436, type: !12)
!483 = !DILocation(line: 436, column: 6, scope: !475)
!484 = !DILocation(line: 437, column: 13, scope: !475)
!485 = !DILocation(line: 437, column: 25, scope: !475)
!486 = !DILocation(line: 437, column: 11, scope: !475)
!487 = !DILocation(line: 438, column: 5, scope: !488)
!488 = distinct !DILexicalBlock(scope: !475, file: !69, line: 438, column: 5)
!489 = !DILocation(line: 438, column: 13, scope: !488)
!490 = !DILocation(line: 438, column: 5, scope: !475)
!491 = !DILocation(line: 440, column: 6, scope: !492)
!492 = distinct !DILexicalBlock(scope: !493, file: !69, line: 440, column: 6)
!493 = distinct !DILexicalBlock(scope: !488, file: !69, line: 439, column: 2)
!494 = !DILocation(line: 440, column: 15, scope: !492)
!495 = !DILocation(line: 440, column: 6, scope: !493)
!496 = !DILocation(line: 442, column: 4, scope: !497)
!497 = distinct !DILexicalBlock(scope: !492, file: !69, line: 441, column: 3)
!498 = !DILocation(line: 446, column: 4, scope: !499)
!499 = distinct !DILexicalBlock(scope: !492, file: !69, line: 445, column: 3)
!500 = !DILocation(line: 452, column: 15, scope: !501)
!501 = distinct !DILexicalBlock(scope: !488, file: !69, line: 451, column: 2)
!502 = !DILocation(line: 452, column: 27, scope: !501)
!503 = !DILocation(line: 452, column: 37, scope: !501)
!504 = !DILocation(line: 452, column: 36, scope: !501)
!505 = !DILocation(line: 452, column: 49, scope: !501)
!506 = !DILocation(line: 452, column: 47, scope: !501)
!507 = !DILocation(line: 452, column: 25, scope: !501)
!508 = !DILocation(line: 452, column: 59, scope: !501)
!509 = !DILocation(line: 452, column: 12, scope: !501)
!510 = !DILocation(line: 453, column: 15, scope: !501)
!511 = !DILocation(line: 453, column: 24, scope: !501)
!512 = !DILocation(line: 453, column: 23, scope: !501)
!513 = !DILocation(line: 453, column: 37, scope: !501)
!514 = !DILocation(line: 453, column: 47, scope: !501)
!515 = !DILocation(line: 453, column: 46, scope: !501)
!516 = !DILocation(line: 453, column: 34, scope: !501)
!517 = !DILocation(line: 453, column: 12, scope: !501)
!518 = !DILocation(line: 454, column: 10, scope: !501)
!519 = !DILocation(line: 454, column: 3, scope: !501)
!520 = !DILocation(line: 456, column: 1, scope: !475)
!521 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 474, type: !522, scopeLine: 475, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!522 = !DISubroutineType(types: !523)
!523 = !{!24, !28, !28}
!524 = !DILocalVariable(name: "numerator", arg: 1, scope: !521, file: !69, line: 474, type: !28)
!525 = !DILocation(line: 474, column: 28, scope: !521)
!526 = !DILocalVariable(name: "denominator", arg: 2, scope: !521, file: !69, line: 474, type: !28)
!527 = !DILocation(line: 474, column: 43, scope: !521)
!528 = !DILocalVariable(name: "u32Temp1", scope: !521, file: !69, line: 476, type: !529)
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !16)
!530 = !DILocation(line: 476, column: 6, scope: !521)
!531 = !DILocalVariable(name: "u32Temp2", scope: !521, file: !69, line: 476, type: !529)
!532 = !DILocation(line: 476, column: 20, scope: !521)
!533 = !DILocalVariable(name: "u32Temp3", scope: !521, file: !69, line: 476, type: !529)
!534 = !DILocation(line: 476, column: 33, scope: !521)
!535 = !DILocation(line: 477, column: 5, scope: !536)
!536 = distinct !DILexicalBlock(scope: !521, file: !69, line: 477, column: 5)
!537 = !DILocation(line: 477, column: 16, scope: !536)
!538 = !DILocation(line: 477, column: 5, scope: !521)
!539 = !DILocation(line: 479, column: 3, scope: !540)
!540 = distinct !DILexicalBlock(scope: !536, file: !69, line: 478, column: 2)
!541 = !DILocation(line: 483, column: 15, scope: !542)
!542 = distinct !DILexicalBlock(scope: !536, file: !69, line: 482, column: 2)
!543 = !DILocation(line: 483, column: 24, scope: !542)
!544 = !DILocation(line: 483, column: 12, scope: !542)
!545 = !DILocation(line: 484, column: 14, scope: !542)
!546 = !DILocation(line: 484, column: 25, scope: !542)
!547 = !DILocation(line: 484, column: 23, scope: !542)
!548 = !DILocation(line: 484, column: 12, scope: !542)
!549 = !DILocation(line: 485, column: 15, scope: !542)
!550 = !DILocation(line: 485, column: 24, scope: !542)
!551 = !DILocation(line: 485, column: 32, scope: !542)
!552 = !DILocation(line: 485, column: 12, scope: !542)
!553 = !DILocation(line: 486, column: 6, scope: !554)
!554 = distinct !DILexicalBlock(scope: !542, file: !69, line: 486, column: 6)
!555 = !DILocation(line: 486, column: 15, scope: !554)
!556 = !DILocation(line: 486, column: 6, scope: !542)
!557 = !DILocation(line: 488, column: 15, scope: !558)
!558 = distinct !DILexicalBlock(scope: !554, file: !69, line: 487, column: 3)
!559 = !DILocation(line: 488, column: 11, scope: !558)
!560 = !DILocation(line: 488, column: 4, scope: !558)
!561 = !DILocation(line: 492, column: 4, scope: !562)
!562 = distinct !DILexicalBlock(scope: !554, file: !69, line: 491, column: 3)
!563 = !DILocation(line: 495, column: 1, scope: !521)
!564 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 512, type: !565, scopeLine: 513, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!565 = !DISubroutineType(types: !566)
!566 = !{!28, !12, !28}
!567 = !DILocalVariable(name: "x_value", arg: 1, scope: !564, file: !69, line: 512, type: !12)
!568 = !DILocation(line: 512, column: 25, scope: !564)
!569 = !DILocalVariable(name: "y_value", arg: 2, scope: !564, file: !69, line: 512, type: !28)
!570 = !DILocation(line: 512, column: 38, scope: !564)
!571 = !DILocalVariable(name: "s32Temp1", scope: !564, file: !69, line: 514, type: !12)
!572 = !DILocation(line: 514, column: 6, scope: !564)
!573 = !DILocation(line: 515, column: 12, scope: !564)
!574 = !DILocation(line: 515, column: 20, scope: !564)
!575 = !DILocation(line: 515, column: 10, scope: !564)
!576 = !DILocation(line: 516, column: 6, scope: !577)
!577 = distinct !DILexicalBlock(scope: !564, file: !69, line: 516, column: 5)
!578 = !DILocation(line: 516, column: 14, scope: !577)
!579 = !DILocation(line: 516, column: 24, scope: !577)
!580 = !DILocation(line: 516, column: 5, scope: !564)
!581 = !DILocation(line: 518, column: 6, scope: !582)
!582 = distinct !DILexicalBlock(scope: !583, file: !69, line: 518, column: 6)
!583 = distinct !DILexicalBlock(scope: !577, file: !69, line: 517, column: 2)
!584 = !DILocation(line: 518, column: 14, scope: !582)
!585 = !DILocation(line: 518, column: 6, scope: !583)
!586 = !DILocation(line: 520, column: 4, scope: !587)
!587 = distinct !DILexicalBlock(scope: !582, file: !69, line: 519, column: 3)
!588 = !DILocation(line: 524, column: 4, scope: !589)
!589 = distinct !DILexicalBlock(scope: !582, file: !69, line: 523, column: 3)
!590 = !DILocation(line: 529, column: 15, scope: !591)
!591 = distinct !DILexicalBlock(scope: !577, file: !69, line: 528, column: 2)
!592 = !DILocation(line: 529, column: 27, scope: !591)
!593 = !DILocation(line: 529, column: 35, scope: !591)
!594 = !DILocation(line: 529, column: 34, scope: !591)
!595 = !DILocation(line: 529, column: 46, scope: !591)
!596 = !DILocation(line: 529, column: 44, scope: !591)
!597 = !DILocation(line: 529, column: 23, scope: !591)
!598 = !DILocation(line: 529, column: 56, scope: !591)
!599 = !DILocation(line: 529, column: 12, scope: !591)
!600 = !DILocation(line: 530, column: 15, scope: !591)
!601 = !DILocation(line: 530, column: 24, scope: !591)
!602 = !DILocation(line: 530, column: 23, scope: !591)
!603 = !DILocation(line: 530, column: 36, scope: !591)
!604 = !DILocation(line: 530, column: 44, scope: !591)
!605 = !DILocation(line: 530, column: 43, scope: !591)
!606 = !DILocation(line: 530, column: 33, scope: !591)
!607 = !DILocation(line: 530, column: 12, scope: !591)
!608 = !DILocation(line: 531, column: 6, scope: !609)
!609 = distinct !DILexicalBlock(scope: !591, file: !69, line: 531, column: 6)
!610 = !DILocation(line: 531, column: 15, scope: !609)
!611 = !DILocation(line: 531, column: 6, scope: !591)
!612 = !DILocation(line: 533, column: 7, scope: !613)
!613 = distinct !DILexicalBlock(scope: !614, file: !69, line: 533, column: 7)
!614 = distinct !DILexicalBlock(scope: !609, file: !69, line: 532, column: 3)
!615 = !DILocation(line: 533, column: 16, scope: !613)
!616 = !DILocation(line: 533, column: 7, scope: !614)
!617 = !DILocation(line: 535, column: 17, scope: !618)
!618 = distinct !DILexicalBlock(scope: !613, file: !69, line: 534, column: 4)
!619 = !DILocation(line: 535, column: 12, scope: !618)
!620 = !DILocation(line: 535, column: 5, scope: !618)
!621 = !DILocation(line: 539, column: 5, scope: !622)
!622 = distinct !DILexicalBlock(scope: !613, file: !69, line: 538, column: 4)
!623 = !DILocation(line: 544, column: 4, scope: !624)
!624 = distinct !DILexicalBlock(scope: !609, file: !69, line: 543, column: 3)
!625 = !DILocation(line: 547, column: 1, scope: !564)
!626 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 565, type: !627, scopeLine: 566, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!627 = !DISubroutineType(types: !628)
!628 = !{!28, !28, !28}
!629 = !DILocalVariable(name: "numerator", arg: 1, scope: !626, file: !69, line: 565, type: !28)
!630 = !DILocation(line: 565, column: 31, scope: !626)
!631 = !DILocalVariable(name: "denominator", arg: 2, scope: !626, file: !69, line: 565, type: !28)
!632 = !DILocation(line: 565, column: 46, scope: !626)
!633 = !DILocalVariable(name: "u32Temp", scope: !626, file: !69, line: 567, type: !529)
!634 = !DILocation(line: 567, column: 6, scope: !626)
!635 = !DILocation(line: 568, column: 5, scope: !636)
!636 = distinct !DILexicalBlock(scope: !626, file: !69, line: 568, column: 5)
!637 = !DILocation(line: 568, column: 17, scope: !636)
!638 = !DILocation(line: 568, column: 5, scope: !626)
!639 = !DILocation(line: 570, column: 3, scope: !640)
!640 = distinct !DILexicalBlock(scope: !636, file: !69, line: 569, column: 2)
!641 = !DILocation(line: 574, column: 14, scope: !642)
!642 = distinct !DILexicalBlock(scope: !636, file: !69, line: 573, column: 2)
!643 = !DILocation(line: 574, column: 23, scope: !642)
!644 = !DILocation(line: 574, column: 32, scope: !642)
!645 = !DILocation(line: 574, column: 44, scope: !642)
!646 = !DILocation(line: 574, column: 29, scope: !642)
!647 = !DILocation(line: 574, column: 11, scope: !642)
!648 = !DILocation(line: 575, column: 13, scope: !642)
!649 = !DILocation(line: 575, column: 21, scope: !642)
!650 = !DILocation(line: 575, column: 20, scope: !642)
!651 = !DILocation(line: 575, column: 11, scope: !642)
!652 = !DILocation(line: 576, column: 6, scope: !653)
!653 = distinct !DILexicalBlock(scope: !642, file: !69, line: 576, column: 6)
!654 = !DILocation(line: 576, column: 14, scope: !653)
!655 = !DILocation(line: 576, column: 6, scope: !642)
!656 = !DILocation(line: 578, column: 11, scope: !657)
!657 = distinct !DILexicalBlock(scope: !653, file: !69, line: 577, column: 3)
!658 = !DILocation(line: 578, column: 19, scope: !657)
!659 = !DILocation(line: 578, column: 4, scope: !657)
!660 = !DILocation(line: 582, column: 4, scope: !661)
!661 = distinct !DILexicalBlock(scope: !653, file: !69, line: 581, column: 3)
!662 = !DILocation(line: 586, column: 1, scope: !626)
!663 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 603, type: !664, scopeLine: 604, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!664 = !DISubroutineType(types: !665)
!665 = !{!28, !529, !28}
!666 = !DILocalVariable(name: "x_value", arg: 1, scope: !663, file: !69, line: 603, type: !529)
!667 = !DILocation(line: 603, column: 25, scope: !663)
!668 = !DILocalVariable(name: "y_value", arg: 2, scope: !663, file: !69, line: 603, type: !28)
!669 = !DILocation(line: 603, column: 38, scope: !663)
!670 = !DILocalVariable(name: "u32Temp1", scope: !663, file: !69, line: 605, type: !529)
!671 = !DILocation(line: 605, column: 6, scope: !663)
!672 = !DILocalVariable(name: "u32Temp2", scope: !663, file: !69, line: 605, type: !529)
!673 = !DILocation(line: 605, column: 17, scope: !663)
!674 = !DILocation(line: 606, column: 12, scope: !663)
!675 = !DILocation(line: 606, column: 20, scope: !663)
!676 = !DILocation(line: 606, column: 10, scope: !663)
!677 = !DILocation(line: 607, column: 5, scope: !678)
!678 = distinct !DILexicalBlock(scope: !663, file: !69, line: 607, column: 5)
!679 = !DILocation(line: 607, column: 13, scope: !678)
!680 = !DILocation(line: 607, column: 5, scope: !663)
!681 = !DILocation(line: 609, column: 3, scope: !682)
!682 = distinct !DILexicalBlock(scope: !678, file: !69, line: 608, column: 2)
!683 = !DILocation(line: 613, column: 14, scope: !684)
!684 = distinct !DILexicalBlock(scope: !678, file: !69, line: 612, column: 2)
!685 = !DILocation(line: 613, column: 22, scope: !684)
!686 = !DILocation(line: 613, column: 21, scope: !684)
!687 = !DILocation(line: 613, column: 12, scope: !684)
!688 = !DILocation(line: 614, column: 14, scope: !684)
!689 = !DILocation(line: 614, column: 25, scope: !684)
!690 = !DILocation(line: 614, column: 36, scope: !684)
!691 = !DILocation(line: 614, column: 34, scope: !684)
!692 = !DILocation(line: 614, column: 22, scope: !684)
!693 = !DILocation(line: 614, column: 45, scope: !684)
!694 = !DILocation(line: 614, column: 12, scope: !684)
!695 = !DILocation(line: 615, column: 15, scope: !684)
!696 = !DILocation(line: 615, column: 24, scope: !684)
!697 = !DILocation(line: 615, column: 23, scope: !684)
!698 = !DILocation(line: 615, column: 36, scope: !684)
!699 = !DILocation(line: 615, column: 44, scope: !684)
!700 = !DILocation(line: 615, column: 43, scope: !684)
!701 = !DILocation(line: 615, column: 33, scope: !684)
!702 = !DILocation(line: 615, column: 12, scope: !684)
!703 = !DILocation(line: 616, column: 6, scope: !704)
!704 = distinct !DILexicalBlock(scope: !684, file: !69, line: 616, column: 6)
!705 = !DILocation(line: 616, column: 15, scope: !704)
!706 = !DILocation(line: 616, column: 6, scope: !684)
!707 = !DILocation(line: 618, column: 11, scope: !708)
!708 = distinct !DILexicalBlock(scope: !704, file: !69, line: 617, column: 3)
!709 = !DILocation(line: 618, column: 20, scope: !708)
!710 = !DILocation(line: 618, column: 4, scope: !708)
!711 = !DILocation(line: 622, column: 4, scope: !712)
!712 = distinct !DILexicalBlock(scope: !704, file: !69, line: 621, column: 3)
!713 = !DILocation(line: 626, column: 1, scope: !663)
!714 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 645, type: !715, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!715 = !DISubroutineType(types: !716)
!716 = !{!20, !20, !28, !20}
!717 = !DILocalVariable(name: "factor1", arg: 1, scope: !714, file: !69, line: 645, type: !20)
!718 = !DILocation(line: 645, column: 33, scope: !714)
!719 = !DILocalVariable(name: "factor2", arg: 2, scope: !714, file: !69, line: 645, type: !28)
!720 = !DILocation(line: 645, column: 46, scope: !714)
!721 = !DILocalVariable(name: "denominator", arg: 3, scope: !714, file: !69, line: 645, type: !20)
!722 = !DILocation(line: 645, column: 59, scope: !714)
!723 = !DILocalVariable(name: "s32Result", scope: !714, file: !69, line: 647, type: !12)
!724 = !DILocation(line: 647, column: 6, scope: !714)
!725 = !DILocalVariable(name: "s32Temp1", scope: !714, file: !69, line: 647, type: !12)
!726 = !DILocation(line: 647, column: 21, scope: !714)
!727 = !DILocation(line: 648, column: 14, scope: !714)
!728 = !DILocation(line: 648, column: 24, scope: !714)
!729 = !DILocation(line: 648, column: 22, scope: !714)
!730 = !DILocation(line: 648, column: 12, scope: !714)
!731 = !DILocation(line: 649, column: 5, scope: !732)
!732 = distinct !DILexicalBlock(scope: !714, file: !69, line: 649, column: 5)
!733 = !DILocation(line: 649, column: 17, scope: !732)
!734 = !DILocation(line: 649, column: 5, scope: !714)
!735 = !DILocation(line: 651, column: 6, scope: !736)
!736 = distinct !DILexicalBlock(scope: !737, file: !69, line: 651, column: 6)
!737 = distinct !DILexicalBlock(scope: !732, file: !69, line: 650, column: 2)
!738 = !DILocation(line: 651, column: 16, scope: !736)
!739 = !DILocation(line: 651, column: 6, scope: !737)
!740 = !DILocation(line: 653, column: 4, scope: !741)
!741 = distinct !DILexicalBlock(scope: !736, file: !69, line: 652, column: 3)
!742 = !DILocation(line: 657, column: 4, scope: !743)
!743 = distinct !DILexicalBlock(scope: !736, file: !69, line: 656, column: 3)
!744 = !DILocation(line: 662, column: 14, scope: !745)
!745 = distinct !DILexicalBlock(scope: !732, file: !69, line: 661, column: 2)
!746 = !DILocation(line: 662, column: 27, scope: !745)
!747 = !DILocation(line: 662, column: 37, scope: !745)
!748 = !DILocation(line: 662, column: 36, scope: !745)
!749 = !DILocation(line: 662, column: 50, scope: !745)
!750 = !DILocation(line: 662, column: 49, scope: !745)
!751 = !DILocation(line: 662, column: 24, scope: !745)
!752 = !DILocation(line: 662, column: 12, scope: !745)
!753 = !DILocation(line: 663, column: 14, scope: !745)
!754 = !DILocation(line: 663, column: 23, scope: !745)
!755 = !DILocation(line: 663, column: 12, scope: !745)
!756 = !DILocation(line: 664, column: 16, scope: !745)
!757 = !DILocation(line: 664, column: 25, scope: !745)
!758 = !DILocation(line: 664, column: 24, scope: !745)
!759 = !DILocation(line: 664, column: 41, scope: !745)
!760 = !DILocation(line: 664, column: 51, scope: !745)
!761 = !DILocation(line: 664, column: 50, scope: !745)
!762 = !DILocation(line: 664, column: 38, scope: !745)
!763 = !DILocation(line: 664, column: 13, scope: !745)
!764 = !DILocation(line: 665, column: 6, scope: !765)
!765 = distinct !DILexicalBlock(scope: !745, file: !69, line: 665, column: 6)
!766 = !DILocation(line: 665, column: 16, scope: !765)
!767 = !DILocation(line: 665, column: 6, scope: !745)
!768 = !DILocation(line: 667, column: 7, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !69, line: 667, column: 7)
!770 = distinct !DILexicalBlock(scope: !765, file: !69, line: 666, column: 3)
!771 = !DILocation(line: 667, column: 17, scope: !769)
!772 = !DILocation(line: 667, column: 7, scope: !770)
!773 = !DILocation(line: 669, column: 17, scope: !774)
!774 = distinct !DILexicalBlock(scope: !769, file: !69, line: 668, column: 4)
!775 = !DILocation(line: 669, column: 12, scope: !774)
!776 = !DILocation(line: 669, column: 5, scope: !774)
!777 = !DILocation(line: 674, column: 5, scope: !778)
!778 = distinct !DILexicalBlock(scope: !769, file: !69, line: 673, column: 4)
!779 = !DILocation(line: 679, column: 4, scope: !780)
!780 = distinct !DILexicalBlock(scope: !765, file: !69, line: 678, column: 3)
!781 = !DILocation(line: 683, column: 1, scope: !714)
!782 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 701, type: !783, scopeLine: 702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!783 = !DISubroutineType(types: !784)
!784 = !{!20, !28, !20, !28}
!785 = !DILocalVariable(name: "factor1", arg: 1, scope: !782, file: !69, line: 701, type: !28)
!786 = !DILocation(line: 701, column: 33, scope: !782)
!787 = !DILocalVariable(name: "factor2", arg: 2, scope: !782, file: !69, line: 701, type: !20)
!788 = !DILocation(line: 701, column: 46, scope: !782)
!789 = !DILocalVariable(name: "denominator", arg: 3, scope: !782, file: !69, line: 701, type: !28)
!790 = !DILocation(line: 701, column: 59, scope: !782)
!791 = !DILocalVariable(name: "s32Result", scope: !782, file: !69, line: 703, type: !12)
!792 = !DILocation(line: 703, column: 6, scope: !782)
!793 = !DILocalVariable(name: "s32Temp1", scope: !782, file: !69, line: 703, type: !12)
!794 = !DILocation(line: 703, column: 21, scope: !782)
!795 = !DILocation(line: 704, column: 14, scope: !782)
!796 = !DILocation(line: 704, column: 24, scope: !782)
!797 = !DILocation(line: 704, column: 22, scope: !782)
!798 = !DILocation(line: 704, column: 12, scope: !782)
!799 = !DILocation(line: 705, column: 5, scope: !800)
!800 = distinct !DILexicalBlock(scope: !782, file: !69, line: 705, column: 5)
!801 = !DILocation(line: 705, column: 16, scope: !800)
!802 = !DILocation(line: 705, column: 5, scope: !782)
!803 = !DILocation(line: 707, column: 6, scope: !804)
!804 = distinct !DILexicalBlock(scope: !805, file: !69, line: 707, column: 6)
!805 = distinct !DILexicalBlock(scope: !800, file: !69, line: 706, column: 2)
!806 = !DILocation(line: 707, column: 16, scope: !804)
!807 = !DILocation(line: 707, column: 6, scope: !805)
!808 = !DILocation(line: 709, column: 4, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !69, line: 708, column: 3)
!810 = !DILocation(line: 713, column: 4, scope: !811)
!811 = distinct !DILexicalBlock(scope: !804, file: !69, line: 712, column: 3)
!812 = !DILocation(line: 718, column: 14, scope: !813)
!813 = distinct !DILexicalBlock(scope: !800, file: !69, line: 717, column: 2)
!814 = !DILocation(line: 718, column: 28, scope: !813)
!815 = !DILocation(line: 718, column: 38, scope: !813)
!816 = !DILocation(line: 718, column: 37, scope: !813)
!817 = !DILocation(line: 718, column: 53, scope: !813)
!818 = !DILocation(line: 718, column: 51, scope: !813)
!819 = !DILocation(line: 718, column: 24, scope: !813)
!820 = !DILocation(line: 718, column: 66, scope: !813)
!821 = !DILocation(line: 718, column: 12, scope: !813)
!822 = !DILocation(line: 719, column: 16, scope: !813)
!823 = !DILocation(line: 719, column: 25, scope: !813)
!824 = !DILocation(line: 719, column: 24, scope: !813)
!825 = !DILocation(line: 719, column: 41, scope: !813)
!826 = !DILocation(line: 719, column: 51, scope: !813)
!827 = !DILocation(line: 719, column: 50, scope: !813)
!828 = !DILocation(line: 719, column: 38, scope: !813)
!829 = !DILocation(line: 719, column: 13, scope: !813)
!830 = !DILocation(line: 720, column: 6, scope: !831)
!831 = distinct !DILexicalBlock(scope: !813, file: !69, line: 720, column: 6)
!832 = !DILocation(line: 720, column: 16, scope: !831)
!833 = !DILocation(line: 720, column: 6, scope: !813)
!834 = !DILocation(line: 722, column: 7, scope: !835)
!835 = distinct !DILexicalBlock(scope: !836, file: !69, line: 722, column: 7)
!836 = distinct !DILexicalBlock(scope: !831, file: !69, line: 721, column: 3)
!837 = !DILocation(line: 722, column: 17, scope: !835)
!838 = !DILocation(line: 722, column: 7, scope: !836)
!839 = !DILocation(line: 724, column: 17, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !69, line: 723, column: 4)
!841 = !DILocation(line: 724, column: 12, scope: !840)
!842 = !DILocation(line: 724, column: 5, scope: !840)
!843 = !DILocation(line: 728, column: 5, scope: !844)
!844 = distinct !DILexicalBlock(scope: !835, file: !69, line: 727, column: 4)
!845 = !DILocation(line: 733, column: 4, scope: !846)
!846 = distinct !DILexicalBlock(scope: !831, file: !69, line: 732, column: 3)
!847 = !DILocation(line: 736, column: 1, scope: !782)
!848 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 755, type: !849, scopeLine: 756, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!849 = !DISubroutineType(types: !850)
!850 = !{!28, !20, !28, !20}
!851 = !DILocalVariable(name: "factor1", arg: 1, scope: !848, file: !69, line: 755, type: !20)
!852 = !DILocation(line: 755, column: 33, scope: !848)
!853 = !DILocalVariable(name: "factor2", arg: 2, scope: !848, file: !69, line: 755, type: !28)
!854 = !DILocation(line: 755, column: 46, scope: !848)
!855 = !DILocalVariable(name: "denominator", arg: 3, scope: !848, file: !69, line: 755, type: !20)
!856 = !DILocation(line: 755, column: 59, scope: !848)
!857 = !DILocalVariable(name: "u32Result", scope: !848, file: !69, line: 757, type: !529)
!858 = !DILocation(line: 757, column: 6, scope: !848)
!859 = !DILocalVariable(name: "u32Temp1", scope: !848, file: !69, line: 757, type: !529)
!860 = !DILocation(line: 757, column: 21, scope: !848)
!861 = !DILocalVariable(name: "s32Result", scope: !848, file: !69, line: 758, type: !12)
!862 = !DILocation(line: 758, column: 6, scope: !848)
!863 = !DILocalVariable(name: "s32Temp1", scope: !848, file: !69, line: 758, type: !12)
!864 = !DILocation(line: 758, column: 21, scope: !848)
!865 = !DILocation(line: 759, column: 14, scope: !848)
!866 = !DILocation(line: 759, column: 24, scope: !848)
!867 = !DILocation(line: 759, column: 22, scope: !848)
!868 = !DILocation(line: 759, column: 12, scope: !848)
!869 = !DILocation(line: 761, column: 5, scope: !870)
!870 = distinct !DILexicalBlock(scope: !848, file: !69, line: 761, column: 5)
!871 = !DILocation(line: 761, column: 17, scope: !870)
!872 = !DILocation(line: 761, column: 5, scope: !848)
!873 = !DILocation(line: 763, column: 6, scope: !874)
!874 = distinct !DILexicalBlock(scope: !875, file: !69, line: 763, column: 6)
!875 = distinct !DILexicalBlock(scope: !870, file: !69, line: 762, column: 2)
!876 = !DILocation(line: 763, column: 16, scope: !874)
!877 = !DILocation(line: 763, column: 6, scope: !875)
!878 = !DILocation(line: 765, column: 4, scope: !879)
!879 = distinct !DILexicalBlock(scope: !874, file: !69, line: 764, column: 3)
!880 = !DILocation(line: 769, column: 4, scope: !881)
!881 = distinct !DILexicalBlock(scope: !874, file: !69, line: 768, column: 3)
!882 = !DILocation(line: 774, column: 15, scope: !883)
!883 = distinct !DILexicalBlock(scope: !870, file: !69, line: 773, column: 2)
!884 = !DILocation(line: 774, column: 29, scope: !883)
!885 = !DILocation(line: 774, column: 39, scope: !883)
!886 = !DILocation(line: 774, column: 38, scope: !883)
!887 = !DILocation(line: 774, column: 54, scope: !883)
!888 = !DILocation(line: 774, column: 52, scope: !883)
!889 = !DILocation(line: 774, column: 25, scope: !883)
!890 = !DILocation(line: 774, column: 68, scope: !883)
!891 = !DILocation(line: 774, column: 12, scope: !883)
!892 = !DILocation(line: 775, column: 16, scope: !883)
!893 = !DILocation(line: 775, column: 25, scope: !883)
!894 = !DILocation(line: 775, column: 24, scope: !883)
!895 = !DILocation(line: 775, column: 41, scope: !883)
!896 = !DILocation(line: 775, column: 51, scope: !883)
!897 = !DILocation(line: 775, column: 50, scope: !883)
!898 = !DILocation(line: 775, column: 38, scope: !883)
!899 = !DILocation(line: 775, column: 13, scope: !883)
!900 = !DILocation(line: 776, column: 6, scope: !901)
!901 = distinct !DILexicalBlock(scope: !883, file: !69, line: 776, column: 6)
!902 = !DILocation(line: 776, column: 16, scope: !901)
!903 = !DILocation(line: 776, column: 6, scope: !883)
!904 = !DILocation(line: 778, column: 7, scope: !905)
!905 = distinct !DILexicalBlock(scope: !906, file: !69, line: 778, column: 7)
!906 = distinct !DILexicalBlock(scope: !901, file: !69, line: 777, column: 3)
!907 = !DILocation(line: 778, column: 17, scope: !905)
!908 = !DILocation(line: 778, column: 7, scope: !906)
!909 = !DILocation(line: 780, column: 17, scope: !910)
!910 = distinct !DILexicalBlock(scope: !905, file: !69, line: 779, column: 4)
!911 = !DILocation(line: 780, column: 12, scope: !910)
!912 = !DILocation(line: 780, column: 5, scope: !910)
!913 = !DILocation(line: 784, column: 5, scope: !914)
!914 = distinct !DILexicalBlock(scope: !905, file: !69, line: 783, column: 4)
!915 = !DILocation(line: 789, column: 4, scope: !916)
!916 = distinct !DILexicalBlock(scope: !901, file: !69, line: 788, column: 3)
!917 = !DILocation(line: 792, column: 1, scope: !848)
!918 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 811, type: !919, scopeLine: 812, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!919 = !DISubroutineType(types: !920)
!920 = !{!28, !20, !28, !28}
!921 = !DILocalVariable(name: "factor1", arg: 1, scope: !918, file: !69, line: 811, type: !20)
!922 = !DILocation(line: 811, column: 33, scope: !918)
!923 = !DILocalVariable(name: "factor2", arg: 2, scope: !918, file: !69, line: 811, type: !28)
!924 = !DILocation(line: 811, column: 46, scope: !918)
!925 = !DILocalVariable(name: "denominator", arg: 3, scope: !918, file: !69, line: 811, type: !28)
!926 = !DILocation(line: 811, column: 59, scope: !918)
!927 = !DILocalVariable(name: "s32Result", scope: !918, file: !69, line: 813, type: !12)
!928 = !DILocation(line: 813, column: 6, scope: !918)
!929 = !DILocalVariable(name: "s32Temp1", scope: !918, file: !69, line: 813, type: !12)
!930 = !DILocation(line: 813, column: 21, scope: !918)
!931 = !DILocation(line: 814, column: 14, scope: !918)
!932 = !DILocation(line: 814, column: 24, scope: !918)
!933 = !DILocation(line: 814, column: 22, scope: !918)
!934 = !DILocation(line: 814, column: 12, scope: !918)
!935 = !DILocation(line: 816, column: 5, scope: !936)
!936 = distinct !DILexicalBlock(scope: !918, file: !69, line: 816, column: 5)
!937 = !DILocation(line: 816, column: 17, scope: !936)
!938 = !DILocation(line: 816, column: 5, scope: !918)
!939 = !DILocation(line: 818, column: 6, scope: !940)
!940 = distinct !DILexicalBlock(scope: !941, file: !69, line: 818, column: 6)
!941 = distinct !DILexicalBlock(scope: !936, file: !69, line: 817, column: 2)
!942 = !DILocation(line: 818, column: 16, scope: !940)
!943 = !DILocation(line: 818, column: 6, scope: !941)
!944 = !DILocation(line: 820, column: 4, scope: !945)
!945 = distinct !DILexicalBlock(scope: !940, file: !69, line: 819, column: 3)
!946 = !DILocation(line: 824, column: 4, scope: !947)
!947 = distinct !DILexicalBlock(scope: !940, file: !69, line: 823, column: 3)
!948 = !DILocation(line: 829, column: 15, scope: !949)
!949 = distinct !DILexicalBlock(scope: !936, file: !69, line: 828, column: 2)
!950 = !DILocation(line: 829, column: 29, scope: !949)
!951 = !DILocation(line: 829, column: 39, scope: !949)
!952 = !DILocation(line: 829, column: 38, scope: !949)
!953 = !DILocation(line: 829, column: 54, scope: !949)
!954 = !DILocation(line: 829, column: 52, scope: !949)
!955 = !DILocation(line: 829, column: 25, scope: !949)
!956 = !DILocation(line: 829, column: 68, scope: !949)
!957 = !DILocation(line: 829, column: 12, scope: !949)
!958 = !DILocation(line: 830, column: 16, scope: !949)
!959 = !DILocation(line: 830, column: 25, scope: !949)
!960 = !DILocation(line: 830, column: 24, scope: !949)
!961 = !DILocation(line: 830, column: 41, scope: !949)
!962 = !DILocation(line: 830, column: 51, scope: !949)
!963 = !DILocation(line: 830, column: 50, scope: !949)
!964 = !DILocation(line: 830, column: 38, scope: !949)
!965 = !DILocation(line: 830, column: 13, scope: !949)
!966 = !DILocation(line: 831, column: 6, scope: !967)
!967 = distinct !DILexicalBlock(scope: !949, file: !69, line: 831, column: 6)
!968 = !DILocation(line: 831, column: 16, scope: !967)
!969 = !DILocation(line: 831, column: 6, scope: !949)
!970 = !DILocation(line: 833, column: 7, scope: !971)
!971 = distinct !DILexicalBlock(scope: !972, file: !69, line: 833, column: 7)
!972 = distinct !DILexicalBlock(scope: !967, file: !69, line: 832, column: 3)
!973 = !DILocation(line: 833, column: 17, scope: !971)
!974 = !DILocation(line: 833, column: 7, scope: !972)
!975 = !DILocation(line: 835, column: 17, scope: !976)
!976 = distinct !DILexicalBlock(scope: !971, file: !69, line: 834, column: 4)
!977 = !DILocation(line: 835, column: 12, scope: !976)
!978 = !DILocation(line: 835, column: 5, scope: !976)
!979 = !DILocation(line: 839, column: 5, scope: !980)
!980 = distinct !DILexicalBlock(scope: !971, file: !69, line: 838, column: 4)
!981 = !DILocation(line: 844, column: 4, scope: !982)
!982 = distinct !DILexicalBlock(scope: !967, file: !69, line: 843, column: 3)
!983 = !DILocation(line: 848, column: 1, scope: !918)
!984 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 866, type: !985, scopeLine: 867, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!985 = !DISubroutineType(types: !986)
!986 = !{!28, !28, !28, !28}
!987 = !DILocalVariable(name: "factor1", arg: 1, scope: !984, file: !69, line: 866, type: !28)
!988 = !DILocation(line: 866, column: 33, scope: !984)
!989 = !DILocalVariable(name: "factor2", arg: 2, scope: !984, file: !69, line: 866, type: !28)
!990 = !DILocation(line: 866, column: 46, scope: !984)
!991 = !DILocalVariable(name: "denominator", arg: 3, scope: !984, file: !69, line: 866, type: !28)
!992 = !DILocation(line: 866, column: 59, scope: !984)
!993 = !DILocalVariable(name: "u32Temp1", scope: !984, file: !69, line: 868, type: !529)
!994 = !DILocation(line: 868, column: 6, scope: !984)
!995 = !DILocalVariable(name: "u16TempDenom", scope: !984, file: !69, line: 869, type: !28)
!996 = !DILocation(line: 869, column: 6, scope: !984)
!997 = !DILocation(line: 871, column: 5, scope: !998)
!998 = distinct !DILexicalBlock(scope: !984, file: !69, line: 871, column: 5)
!999 = !DILocation(line: 871, column: 17, scope: !998)
!1000 = !DILocation(line: 871, column: 5, scope: !984)
!1001 = !DILocation(line: 873, column: 3, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !998, file: !69, line: 872, column: 2)
!1003 = !DILocation(line: 877, column: 14, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !998, file: !69, line: 876, column: 2)
!1005 = !DILocation(line: 877, column: 24, scope: !1004)
!1006 = !DILocation(line: 877, column: 22, scope: !1004)
!1007 = !DILocation(line: 877, column: 12, scope: !1004)
!1008 = !DILocation(line: 878, column: 18, scope: !1004)
!1009 = !DILocation(line: 878, column: 30, scope: !1004)
!1010 = !DILocation(line: 878, column: 16, scope: !1004)
!1011 = !DILocation(line: 879, column: 14, scope: !1004)
!1012 = !DILocation(line: 879, column: 25, scope: !1004)
!1013 = !DILocation(line: 879, column: 23, scope: !1004)
!1014 = !DILocation(line: 879, column: 12, scope: !1004)
!1015 = !DILocation(line: 880, column: 14, scope: !1004)
!1016 = !DILocation(line: 880, column: 25, scope: !1004)
!1017 = !DILocation(line: 880, column: 23, scope: !1004)
!1018 = !DILocation(line: 880, column: 12, scope: !1004)
!1019 = !DILocation(line: 881, column: 6, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1004, file: !69, line: 881, column: 6)
!1021 = !DILocation(line: 881, column: 15, scope: !1020)
!1022 = !DILocation(line: 881, column: 6, scope: !1004)
!1023 = !DILocation(line: 883, column: 12, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1020, file: !69, line: 882, column: 3)
!1025 = !DILocation(line: 883, column: 21, scope: !1024)
!1026 = !DILocation(line: 883, column: 11, scope: !1024)
!1027 = !DILocation(line: 883, column: 4, scope: !1024)
!1028 = !DILocation(line: 888, column: 4, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1020, file: !69, line: 887, column: 3)
!1030 = !DILocation(line: 893, column: 1, scope: !984)
!1031 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 910, type: !1032, scopeLine: 911, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!28, !28, !28, !529}
!1034 = !DILocalVariable(name: "factor1", arg: 1, scope: !1031, file: !69, line: 910, type: !28)
!1035 = !DILocation(line: 910, column: 33, scope: !1031)
!1036 = !DILocalVariable(name: "factor2", arg: 2, scope: !1031, file: !69, line: 910, type: !28)
!1037 = !DILocation(line: 910, column: 46, scope: !1031)
!1038 = !DILocalVariable(name: "denominator", arg: 3, scope: !1031, file: !69, line: 910, type: !529)
!1039 = !DILocation(line: 910, column: 59, scope: !1031)
!1040 = !DILocalVariable(name: "u32Temp1", scope: !1031, file: !69, line: 912, type: !529)
!1041 = !DILocation(line: 912, column: 6, scope: !1031)
!1042 = !DILocation(line: 913, column: 5, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1031, file: !69, line: 913, column: 5)
!1044 = !DILocation(line: 913, column: 17, scope: !1043)
!1045 = !DILocation(line: 913, column: 5, scope: !1031)
!1046 = !DILocation(line: 915, column: 3, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1043, file: !69, line: 914, column: 2)
!1048 = !DILocation(line: 919, column: 15, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1043, file: !69, line: 918, column: 2)
!1050 = !DILocation(line: 919, column: 25, scope: !1049)
!1051 = !DILocation(line: 919, column: 23, scope: !1049)
!1052 = !DILocation(line: 919, column: 36, scope: !1049)
!1053 = !DILocation(line: 919, column: 34, scope: !1049)
!1054 = !DILocation(line: 919, column: 12, scope: !1049)
!1055 = !DILocation(line: 920, column: 8, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1049, file: !69, line: 920, column: 6)
!1057 = !DILocation(line: 920, column: 18, scope: !1056)
!1058 = !DILocation(line: 920, column: 16, scope: !1056)
!1059 = !DILocation(line: 920, column: 28, scope: !1056)
!1060 = !DILocation(line: 920, column: 40, scope: !1056)
!1061 = !DILocation(line: 920, column: 39, scope: !1056)
!1062 = !DILocation(line: 920, column: 26, scope: !1056)
!1063 = !DILocation(line: 920, column: 53, scope: !1056)
!1064 = !DILocation(line: 920, column: 64, scope: !1056)
!1065 = !DILocation(line: 920, column: 50, scope: !1056)
!1066 = !DILocation(line: 920, column: 6, scope: !1049)
!1067 = !DILocation(line: 922, column: 12, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1056, file: !69, line: 921, column: 3)
!1069 = !DILocation(line: 923, column: 3, scope: !1068)
!1070 = !DILocation(line: 924, column: 6, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1049, file: !69, line: 924, column: 6)
!1072 = !DILocation(line: 924, column: 15, scope: !1071)
!1073 = !DILocation(line: 924, column: 6, scope: !1049)
!1074 = !DILocation(line: 926, column: 12, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 925, column: 3)
!1076 = !DILocation(line: 926, column: 21, scope: !1075)
!1077 = !DILocation(line: 926, column: 11, scope: !1075)
!1078 = !DILocation(line: 926, column: 4, scope: !1075)
!1079 = !DILocation(line: 930, column: 4, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 929, column: 3)
!1081 = !DILocation(line: 933, column: 1, scope: !1031)
!1082 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 950, type: !1083, scopeLine: 951, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!529, !529, !28}
!1085 = !DILocalVariable(name: "x_value", arg: 1, scope: !1082, file: !69, line: 950, type: !529)
!1086 = !DILocation(line: 950, column: 25, scope: !1082)
!1087 = !DILocalVariable(name: "y_value", arg: 2, scope: !1082, file: !69, line: 950, type: !28)
!1088 = !DILocation(line: 950, column: 38, scope: !1082)
!1089 = !DILocalVariable(name: "u32Temp1", scope: !1082, file: !69, line: 952, type: !529)
!1090 = !DILocation(line: 952, column: 6, scope: !1082)
!1091 = !DILocation(line: 953, column: 5, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1082, file: !69, line: 953, column: 5)
!1093 = !DILocation(line: 953, column: 13, scope: !1092)
!1094 = !DILocation(line: 953, column: 5, scope: !1082)
!1095 = !DILocation(line: 955, column: 3, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1092, file: !69, line: 954, column: 2)
!1097 = !DILocation(line: 959, column: 15, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1092, file: !69, line: 958, column: 2)
!1099 = !DILocation(line: 959, column: 26, scope: !1098)
!1100 = !DILocation(line: 959, column: 34, scope: !1098)
!1101 = !DILocation(line: 959, column: 33, scope: !1098)
!1102 = !DILocation(line: 959, column: 45, scope: !1098)
!1103 = !DILocation(line: 959, column: 43, scope: !1098)
!1104 = !DILocation(line: 959, column: 23, scope: !1098)
!1105 = !DILocation(line: 959, column: 54, scope: !1098)
!1106 = !DILocation(line: 959, column: 12, scope: !1098)
!1107 = !DILocation(line: 960, column: 15, scope: !1098)
!1108 = !DILocation(line: 960, column: 23, scope: !1098)
!1109 = !DILocation(line: 960, column: 22, scope: !1098)
!1110 = !DILocation(line: 960, column: 35, scope: !1098)
!1111 = !DILocation(line: 960, column: 44, scope: !1098)
!1112 = !DILocation(line: 960, column: 43, scope: !1098)
!1113 = !DILocation(line: 960, column: 32, scope: !1098)
!1114 = !DILocation(line: 960, column: 12, scope: !1098)
!1115 = !DILocation(line: 961, column: 10, scope: !1098)
!1116 = !DILocation(line: 961, column: 3, scope: !1098)
!1117 = !DILocation(line: 963, column: 1, scope: !1082)
!1118 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 981, type: !1119, scopeLine: 982, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!20, !20, !20, !20}
!1121 = !DILocalVariable(name: "fak1", arg: 1, scope: !1118, file: !69, line: 981, type: !20)
!1122 = !DILocation(line: 981, column: 33, scope: !1118)
!1123 = !DILocalVariable(name: "fak2", arg: 2, scope: !1118, file: !69, line: 981, type: !20)
!1124 = !DILocation(line: 981, column: 43, scope: !1118)
!1125 = !DILocalVariable(name: "div", arg: 3, scope: !1118, file: !69, line: 981, type: !20)
!1126 = !DILocation(line: 981, column: 53, scope: !1118)
!1127 = !DILocalVariable(name: "s32Temp1", scope: !1118, file: !69, line: 983, type: !12)
!1128 = !DILocation(line: 983, column: 6, scope: !1118)
!1129 = !DILocalVariable(name: "s32Temp2", scope: !1118, file: !69, line: 983, type: !12)
!1130 = !DILocation(line: 983, column: 20, scope: !1118)
!1131 = !DILocalVariable(name: "s32Temp3", scope: !1118, file: !69, line: 983, type: !12)
!1132 = !DILocation(line: 983, column: 34, scope: !1118)
!1133 = !DILocation(line: 984, column: 13, scope: !1118)
!1134 = !DILocation(line: 984, column: 20, scope: !1118)
!1135 = !DILocation(line: 984, column: 18, scope: !1118)
!1136 = !DILocation(line: 984, column: 11, scope: !1118)
!1137 = !DILocation(line: 985, column: 5, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1118, file: !69, line: 985, column: 5)
!1139 = !DILocation(line: 985, column: 9, scope: !1138)
!1140 = !DILocation(line: 985, column: 5, scope: !1118)
!1141 = !DILocation(line: 987, column: 6, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1143, file: !69, line: 987, column: 6)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !69, line: 986, column: 2)
!1144 = !DILocation(line: 987, column: 15, scope: !1142)
!1145 = !DILocation(line: 987, column: 6, scope: !1143)
!1146 = !DILocation(line: 989, column: 4, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1142, file: !69, line: 988, column: 3)
!1148 = !DILocation(line: 993, column: 4, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1142, file: !69, line: 992, column: 3)
!1150 = !DILocation(line: 998, column: 15, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1138, file: !69, line: 997, column: 2)
!1152 = !DILocation(line: 998, column: 28, scope: !1151)
!1153 = !DILocation(line: 998, column: 39, scope: !1151)
!1154 = !DILocation(line: 998, column: 37, scope: !1151)
!1155 = !DILocation(line: 998, column: 46, scope: !1151)
!1156 = !DILocation(line: 998, column: 44, scope: !1151)
!1157 = !DILocation(line: 998, column: 24, scope: !1151)
!1158 = !DILocation(line: 998, column: 52, scope: !1151)
!1159 = !DILocation(line: 998, column: 12, scope: !1151)
!1160 = !DILocation(line: 999, column: 15, scope: !1151)
!1161 = !DILocation(line: 999, column: 24, scope: !1151)
!1162 = !DILocation(line: 999, column: 23, scope: !1151)
!1163 = !DILocation(line: 999, column: 32, scope: !1151)
!1164 = !DILocation(line: 999, column: 41, scope: !1151)
!1165 = !DILocation(line: 999, column: 40, scope: !1151)
!1166 = !DILocation(line: 999, column: 29, scope: !1151)
!1167 = !DILocation(line: 999, column: 12, scope: !1151)
!1168 = !DILocation(line: 1000, column: 6, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1151, file: !69, line: 1000, column: 6)
!1170 = !DILocation(line: 1000, column: 15, scope: !1169)
!1171 = !DILocation(line: 1000, column: 6, scope: !1151)
!1172 = !DILocation(line: 1002, column: 7, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1174, file: !69, line: 1002, column: 7)
!1174 = distinct !DILexicalBlock(scope: !1169, file: !69, line: 1001, column: 3)
!1175 = !DILocation(line: 1002, column: 16, scope: !1173)
!1176 = !DILocation(line: 1002, column: 7, scope: !1174)
!1177 = !DILocation(line: 1004, column: 17, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 1003, column: 4)
!1179 = !DILocation(line: 1004, column: 12, scope: !1178)
!1180 = !DILocation(line: 1004, column: 5, scope: !1178)
!1181 = !DILocation(line: 1008, column: 5, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 1007, column: 4)
!1183 = !DILocation(line: 1013, column: 4, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1169, file: !69, line: 1012, column: 3)
!1185 = !DILocation(line: 1016, column: 1, scope: !1118)
!1186 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1034, type: !1187, scopeLine: 1035, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!20, !20, !20, !28}
!1189 = !DILocalVariable(name: "data1", arg: 1, scope: !1186, file: !69, line: 1034, type: !20)
!1190 = !DILocation(line: 1034, column: 33, scope: !1186)
!1191 = !DILocalVariable(name: "data2", arg: 2, scope: !1186, file: !69, line: 1034, type: !20)
!1192 = !DILocation(line: 1034, column: 43, scope: !1186)
!1193 = !DILocalVariable(name: "denominator", arg: 3, scope: !1186, file: !69, line: 1034, type: !28)
!1194 = !DILocation(line: 1034, column: 53, scope: !1186)
!1195 = !DILocalVariable(name: "s32Result", scope: !1186, file: !69, line: 1036, type: !12)
!1196 = !DILocation(line: 1036, column: 6, scope: !1186)
!1197 = !DILocalVariable(name: "s32Temp1", scope: !1186, file: !69, line: 1036, type: !12)
!1198 = !DILocation(line: 1036, column: 21, scope: !1186)
!1199 = !DILocation(line: 1037, column: 14, scope: !1186)
!1200 = !DILocation(line: 1037, column: 22, scope: !1186)
!1201 = !DILocation(line: 1037, column: 20, scope: !1186)
!1202 = !DILocation(line: 1037, column: 12, scope: !1186)
!1203 = !DILocation(line: 1039, column: 5, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1186, file: !69, line: 1039, column: 5)
!1205 = !DILocation(line: 1039, column: 17, scope: !1204)
!1206 = !DILocation(line: 1039, column: 5, scope: !1186)
!1207 = !DILocation(line: 1041, column: 6, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 1041, column: 6)
!1209 = distinct !DILexicalBlock(scope: !1204, file: !69, line: 1040, column: 2)
!1210 = !DILocation(line: 1041, column: 16, scope: !1208)
!1211 = !DILocation(line: 1041, column: 6, scope: !1209)
!1212 = !DILocation(line: 1043, column: 4, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1208, file: !69, line: 1042, column: 3)
!1214 = !DILocation(line: 1045, column: 11, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1208, file: !69, line: 1045, column: 11)
!1216 = !DILocation(line: 1045, column: 21, scope: !1215)
!1217 = !DILocation(line: 1045, column: 11, scope: !1208)
!1218 = !DILocation(line: 1047, column: 4, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1215, file: !69, line: 1046, column: 3)
!1220 = !DILocation(line: 1051, column: 4, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1215, file: !69, line: 1050, column: 3)
!1222 = !DILocation(line: 1056, column: 15, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1204, file: !69, line: 1055, column: 2)
!1224 = !DILocation(line: 1056, column: 28, scope: !1223)
!1225 = !DILocation(line: 1056, column: 38, scope: !1223)
!1226 = !DILocation(line: 1056, column: 37, scope: !1223)
!1227 = !DILocation(line: 1056, column: 51, scope: !1223)
!1228 = !DILocation(line: 1056, column: 50, scope: !1223)
!1229 = !DILocation(line: 1056, column: 25, scope: !1223)
!1230 = !DILocation(line: 1056, column: 64, scope: !1223)
!1231 = !DILocation(line: 1056, column: 12, scope: !1223)
!1232 = !DILocation(line: 1057, column: 16, scope: !1223)
!1233 = !DILocation(line: 1057, column: 25, scope: !1223)
!1234 = !DILocation(line: 1057, column: 24, scope: !1223)
!1235 = !DILocation(line: 1057, column: 41, scope: !1223)
!1236 = !DILocation(line: 1057, column: 51, scope: !1223)
!1237 = !DILocation(line: 1057, column: 50, scope: !1223)
!1238 = !DILocation(line: 1057, column: 38, scope: !1223)
!1239 = !DILocation(line: 1057, column: 13, scope: !1223)
!1240 = !DILocation(line: 1058, column: 6, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1223, file: !69, line: 1058, column: 6)
!1242 = !DILocation(line: 1058, column: 16, scope: !1241)
!1243 = !DILocation(line: 1058, column: 6, scope: !1223)
!1244 = !DILocation(line: 1060, column: 7, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1246, file: !69, line: 1060, column: 7)
!1246 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1059, column: 3)
!1247 = !DILocation(line: 1060, column: 17, scope: !1245)
!1248 = !DILocation(line: 1060, column: 7, scope: !1246)
!1249 = !DILocation(line: 1062, column: 17, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1061, column: 4)
!1251 = !DILocation(line: 1062, column: 12, scope: !1250)
!1252 = !DILocation(line: 1062, column: 5, scope: !1250)
!1253 = !DILocation(line: 1066, column: 5, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1065, column: 4)
!1255 = !DILocation(line: 1071, column: 4, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1070, column: 3)
!1257 = !DILocation(line: 1075, column: 1, scope: !1186)
!1258 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1092, type: !1259, scopeLine: 1093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!529, !529, !12}
!1261 = !DILocalVariable(name: "numerator", arg: 1, scope: !1258, file: !69, line: 1092, type: !529)
!1262 = !DILocation(line: 1092, column: 25, scope: !1258)
!1263 = !DILocalVariable(name: "denominator", arg: 2, scope: !1258, file: !69, line: 1092, type: !12)
!1264 = !DILocation(line: 1092, column: 40, scope: !1258)
!1265 = !DILocalVariable(name: "u32Temp1", scope: !1258, file: !69, line: 1094, type: !529)
!1266 = !DILocation(line: 1094, column: 6, scope: !1258)
!1267 = !DILocation(line: 1095, column: 5, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1258, file: !69, line: 1095, column: 5)
!1269 = !DILocation(line: 1095, column: 17, scope: !1268)
!1270 = !DILocation(line: 1095, column: 5, scope: !1258)
!1271 = !DILocation(line: 1097, column: 3, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1268, file: !69, line: 1096, column: 2)
!1273 = !DILocation(line: 1101, column: 6, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1101, column: 6)
!1275 = distinct !DILexicalBlock(scope: !1268, file: !69, line: 1100, column: 2)
!1276 = !DILocation(line: 1101, column: 18, scope: !1274)
!1277 = !DILocation(line: 1101, column: 6, scope: !1275)
!1278 = !DILocation(line: 1103, column: 4, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1274, file: !69, line: 1102, column: 3)
!1280 = !DILocation(line: 1107, column: 16, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1274, file: !69, line: 1106, column: 3)
!1282 = !DILocation(line: 1107, column: 30, scope: !1281)
!1283 = !DILocation(line: 1107, column: 40, scope: !1281)
!1284 = !DILocation(line: 1107, column: 39, scope: !1281)
!1285 = !DILocation(line: 1107, column: 55, scope: !1281)
!1286 = !DILocation(line: 1107, column: 53, scope: !1281)
!1287 = !DILocation(line: 1107, column: 26, scope: !1281)
!1288 = !DILocation(line: 1107, column: 68, scope: !1281)
!1289 = !DILocation(line: 1107, column: 13, scope: !1281)
!1290 = !DILocation(line: 1108, column: 16, scope: !1281)
!1291 = !DILocation(line: 1108, column: 25, scope: !1281)
!1292 = !DILocation(line: 1108, column: 24, scope: !1281)
!1293 = !DILocation(line: 1108, column: 41, scope: !1281)
!1294 = !DILocation(line: 1108, column: 51, scope: !1281)
!1295 = !DILocation(line: 1108, column: 50, scope: !1281)
!1296 = !DILocation(line: 1108, column: 38, scope: !1281)
!1297 = !DILocation(line: 1108, column: 13, scope: !1281)
!1298 = !DILocation(line: 1109, column: 11, scope: !1281)
!1299 = !DILocation(line: 1109, column: 4, scope: !1281)
!1300 = !DILocation(line: 1112, column: 1, scope: !1258)
!1301 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1129, type: !1302, scopeLine: 1130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1302 = !DISubroutineType(types: !1303)
!1303 = !{!529, !12, !529}
!1304 = !DILocalVariable(name: "numerator", arg: 1, scope: !1301, file: !69, line: 1129, type: !12)
!1305 = !DILocation(line: 1129, column: 25, scope: !1301)
!1306 = !DILocalVariable(name: "denominator", arg: 2, scope: !1301, file: !69, line: 1129, type: !529)
!1307 = !DILocation(line: 1129, column: 40, scope: !1301)
!1308 = !DILocalVariable(name: "s32Temp1", scope: !1301, file: !69, line: 1131, type: !12)
!1309 = !DILocation(line: 1131, column: 6, scope: !1301)
!1310 = !DILocation(line: 1132, column: 5, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1301, file: !69, line: 1132, column: 5)
!1312 = !DILocation(line: 1132, column: 17, scope: !1311)
!1313 = !DILocation(line: 1132, column: 5, scope: !1301)
!1314 = !DILocation(line: 1134, column: 6, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1316, file: !69, line: 1134, column: 6)
!1316 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1133, column: 2)
!1317 = !DILocation(line: 1134, column: 16, scope: !1315)
!1318 = !DILocation(line: 1134, column: 6, scope: !1316)
!1319 = !DILocation(line: 1136, column: 4, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1315, file: !69, line: 1135, column: 3)
!1321 = !DILocation(line: 1140, column: 4, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1315, file: !69, line: 1139, column: 3)
!1323 = !DILocation(line: 1145, column: 6, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1325, file: !69, line: 1145, column: 6)
!1325 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1144, column: 2)
!1326 = !DILocation(line: 1145, column: 16, scope: !1324)
!1327 = !DILocation(line: 1145, column: 6, scope: !1325)
!1328 = !DILocation(line: 1147, column: 17, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1324, file: !69, line: 1146, column: 3)
!1330 = !DILocation(line: 1147, column: 31, scope: !1329)
!1331 = !DILocation(line: 1147, column: 41, scope: !1329)
!1332 = !DILocation(line: 1147, column: 40, scope: !1329)
!1333 = !DILocation(line: 1147, column: 56, scope: !1329)
!1334 = !DILocation(line: 1147, column: 54, scope: !1329)
!1335 = !DILocation(line: 1147, column: 27, scope: !1329)
!1336 = !DILocation(line: 1147, column: 69, scope: !1329)
!1337 = !DILocation(line: 1147, column: 13, scope: !1329)
!1338 = !DILocation(line: 1148, column: 13, scope: !1329)
!1339 = !DILocation(line: 1148, column: 23, scope: !1329)
!1340 = !DILocation(line: 1148, column: 22, scope: !1329)
!1341 = !DILocation(line: 1148, column: 39, scope: !1329)
!1342 = !DILocation(line: 1148, column: 48, scope: !1329)
!1343 = !DILocation(line: 1148, column: 47, scope: !1329)
!1344 = !DILocation(line: 1148, column: 36, scope: !1329)
!1345 = !DILocation(line: 1148, column: 4, scope: !1329)
!1346 = !DILocation(line: 1152, column: 4, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1324, file: !69, line: 1151, column: 3)
!1348 = !DILocation(line: 1155, column: 1, scope: !1301)
!1349 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1172, type: !1350, scopeLine: 1173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1350 = !DISubroutineType(types: !1351)
!1351 = !{!529, !12, !12}
!1352 = !DILocalVariable(name: "numerator", arg: 1, scope: !1349, file: !69, line: 1172, type: !12)
!1353 = !DILocation(line: 1172, column: 25, scope: !1349)
!1354 = !DILocalVariable(name: "denominator", arg: 2, scope: !1349, file: !69, line: 1172, type: !12)
!1355 = !DILocation(line: 1172, column: 40, scope: !1349)
!1356 = !DILocalVariable(name: "u32Temp1", scope: !1349, file: !69, line: 1174, type: !529)
!1357 = !DILocation(line: 1174, column: 6, scope: !1349)
!1358 = !DILocalVariable(name: "u32Temp2", scope: !1349, file: !69, line: 1174, type: !529)
!1359 = !DILocation(line: 1174, column: 20, scope: !1349)
!1360 = !DILocation(line: 1175, column: 5, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1175, column: 5)
!1362 = !DILocation(line: 1175, column: 17, scope: !1361)
!1363 = !DILocation(line: 1175, column: 5, scope: !1349)
!1364 = !DILocation(line: 1177, column: 6, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1177, column: 6)
!1366 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1176, column: 2)
!1367 = !DILocation(line: 1177, column: 16, scope: !1365)
!1368 = !DILocation(line: 1177, column: 6, scope: !1366)
!1369 = !DILocation(line: 1179, column: 4, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1178, column: 3)
!1371 = !DILocation(line: 1183, column: 4, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1182, column: 3)
!1373 = !DILocation(line: 1188, column: 6, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1375, file: !69, line: 1188, column: 6)
!1375 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1187, column: 2)
!1376 = !DILocation(line: 1188, column: 16, scope: !1374)
!1377 = !DILocation(line: 1188, column: 6, scope: !1375)
!1378 = !DILocation(line: 1190, column: 7, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1380, file: !69, line: 1190, column: 7)
!1380 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1189, column: 3)
!1381 = !DILocation(line: 1190, column: 17, scope: !1379)
!1382 = !DILocation(line: 1190, column: 7, scope: !1380)
!1383 = !DILocation(line: 1192, column: 5, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1379, file: !69, line: 1191, column: 4)
!1385 = !DILocation(line: 1196, column: 8, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1387, file: !69, line: 1196, column: 8)
!1387 = distinct !DILexicalBlock(scope: !1379, file: !69, line: 1195, column: 4)
!1388 = !DILocation(line: 1196, column: 20, scope: !1386)
!1389 = !DILocation(line: 1196, column: 8, scope: !1387)
!1390 = !DILocation(line: 1198, column: 6, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1386, file: !69, line: 1197, column: 5)
!1392 = !DILocation(line: 1202, column: 18, scope: !1393)
!1393 = distinct !DILexicalBlock(scope: !1386, file: !69, line: 1201, column: 5)
!1394 = !DILocation(line: 1202, column: 32, scope: !1393)
!1395 = !DILocation(line: 1202, column: 42, scope: !1393)
!1396 = !DILocation(line: 1202, column: 41, scope: !1393)
!1397 = !DILocation(line: 1202, column: 57, scope: !1393)
!1398 = !DILocation(line: 1202, column: 55, scope: !1393)
!1399 = !DILocation(line: 1202, column: 28, scope: !1393)
!1400 = !DILocation(line: 1202, column: 71, scope: !1393)
!1401 = !DILocation(line: 1202, column: 15, scope: !1393)
!1402 = !DILocation(line: 1203, column: 18, scope: !1393)
!1403 = !DILocation(line: 1203, column: 29, scope: !1393)
!1404 = !DILocation(line: 1203, column: 27, scope: !1393)
!1405 = !DILocation(line: 1203, column: 45, scope: !1393)
!1406 = !DILocation(line: 1203, column: 57, scope: !1393)
!1407 = !DILocation(line: 1203, column: 55, scope: !1393)
!1408 = !DILocation(line: 1203, column: 42, scope: !1393)
!1409 = !DILocation(line: 1203, column: 15, scope: !1393)
!1410 = !DILocation(line: 1204, column: 13, scope: !1393)
!1411 = !DILocation(line: 1204, column: 6, scope: !1393)
!1412 = !DILocation(line: 1210, column: 7, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1210, column: 7)
!1414 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1209, column: 3)
!1415 = !DILocation(line: 1210, column: 19, scope: !1413)
!1416 = !DILocation(line: 1210, column: 7, scope: !1414)
!1417 = !DILocation(line: 1212, column: 5, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1413, file: !69, line: 1211, column: 4)
!1419 = !DILocation(line: 1216, column: 18, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1413, file: !69, line: 1215, column: 4)
!1421 = !DILocation(line: 1216, column: 17, scope: !1420)
!1422 = !DILocation(line: 1216, column: 15, scope: !1420)
!1423 = !DILocation(line: 1217, column: 20, scope: !1420)
!1424 = !DILocation(line: 1217, column: 19, scope: !1420)
!1425 = !DILocation(line: 1217, column: 17, scope: !1420)
!1426 = !DILocation(line: 1218, column: 17, scope: !1420)
!1427 = !DILocation(line: 1218, column: 31, scope: !1420)
!1428 = !DILocation(line: 1218, column: 41, scope: !1420)
!1429 = !DILocation(line: 1218, column: 40, scope: !1420)
!1430 = !DILocation(line: 1218, column: 56, scope: !1420)
!1431 = !DILocation(line: 1218, column: 54, scope: !1420)
!1432 = !DILocation(line: 1218, column: 27, scope: !1420)
!1433 = !DILocation(line: 1218, column: 70, scope: !1420)
!1434 = !DILocation(line: 1218, column: 14, scope: !1420)
!1435 = !DILocation(line: 1219, column: 17, scope: !1420)
!1436 = !DILocation(line: 1219, column: 28, scope: !1420)
!1437 = !DILocation(line: 1219, column: 26, scope: !1420)
!1438 = !DILocation(line: 1219, column: 44, scope: !1420)
!1439 = !DILocation(line: 1219, column: 56, scope: !1420)
!1440 = !DILocation(line: 1219, column: 54, scope: !1420)
!1441 = !DILocation(line: 1219, column: 41, scope: !1420)
!1442 = !DILocation(line: 1219, column: 14, scope: !1420)
!1443 = !DILocation(line: 1220, column: 12, scope: !1420)
!1444 = !DILocation(line: 1220, column: 5, scope: !1420)
!1445 = !DILocation(line: 1225, column: 1, scope: !1349)
!1446 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1242, type: !1447, scopeLine: 1243, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!529, !529, !529}
!1449 = !DILocalVariable(name: "numerator", arg: 1, scope: !1446, file: !69, line: 1242, type: !529)
!1450 = !DILocation(line: 1242, column: 25, scope: !1446)
!1451 = !DILocalVariable(name: "denominator", arg: 2, scope: !1446, file: !69, line: 1242, type: !529)
!1452 = !DILocation(line: 1242, column: 40, scope: !1446)
!1453 = !DILocalVariable(name: "u32Temp1", scope: !1446, file: !69, line: 1245, type: !529)
!1454 = !DILocation(line: 1245, column: 6, scope: !1446)
!1455 = !DILocalVariable(name: "u32Temp2", scope: !1446, file: !69, line: 1245, type: !529)
!1456 = !DILocation(line: 1245, column: 20, scope: !1446)
!1457 = !DILocalVariable(name: "u32Temp3", scope: !1446, file: !69, line: 1245, type: !529)
!1458 = !DILocation(line: 1245, column: 34, scope: !1446)
!1459 = !DILocalVariable(name: "numerator_old", scope: !1446, file: !69, line: 1245, type: !529)
!1460 = !DILocation(line: 1245, column: 48, scope: !1446)
!1461 = !DILocation(line: 1246, column: 5, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1246, column: 5)
!1463 = !DILocation(line: 1246, column: 16, scope: !1462)
!1464 = !DILocation(line: 1246, column: 5, scope: !1446)
!1465 = !DILocation(line: 1248, column: 3, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1462, file: !69, line: 1247, column: 2)
!1467 = !DILocation(line: 1252, column: 14, scope: !1468)
!1468 = distinct !DILexicalBlock(scope: !1462, file: !69, line: 1251, column: 2)
!1469 = !DILocation(line: 1252, column: 26, scope: !1468)
!1470 = !DILocation(line: 1252, column: 41, scope: !1468)
!1471 = !DILocation(line: 1252, column: 51, scope: !1468)
!1472 = !DILocation(line: 1252, column: 50, scope: !1468)
!1473 = !DILocation(line: 1252, column: 38, scope: !1468)
!1474 = !DILocation(line: 1252, column: 24, scope: !1468)
!1475 = !DILocation(line: 1252, column: 12, scope: !1468)
!1476 = !DILocation(line: 1253, column: 7, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1468, file: !69, line: 1253, column: 6)
!1478 = !DILocation(line: 1253, column: 16, scope: !1477)
!1479 = !DILocation(line: 1253, column: 24, scope: !1477)
!1480 = !DILocation(line: 1253, column: 6, scope: !1468)
!1481 = !DILocation(line: 1255, column: 16, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1254, column: 3)
!1483 = !DILocation(line: 1255, column: 27, scope: !1482)
!1484 = !DILocation(line: 1255, column: 13, scope: !1482)
!1485 = !DILocation(line: 1256, column: 3, scope: !1482)
!1486 = !DILocation(line: 1259, column: 16, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1258, column: 3)
!1488 = !DILocation(line: 1259, column: 27, scope: !1487)
!1489 = !DILocation(line: 1259, column: 32, scope: !1487)
!1490 = !DILocation(line: 1259, column: 13, scope: !1487)
!1491 = !DILocation(line: 1262, column: 6, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1468, file: !69, line: 1262, column: 6)
!1493 = !DILocation(line: 1262, column: 17, scope: !1492)
!1494 = !DILocation(line: 1262, column: 15, scope: !1492)
!1495 = !DILocation(line: 1262, column: 6, scope: !1468)
!1496 = !DILocation(line: 1264, column: 12, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1263, column: 3)
!1498 = !DILocation(line: 1264, column: 22, scope: !1497)
!1499 = !DILocation(line: 1264, column: 21, scope: !1497)
!1500 = !DILocation(line: 1264, column: 4, scope: !1497)
!1501 = !DILocation(line: 1268, column: 13, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1267, column: 3)
!1503 = !DILocation(line: 1268, column: 23, scope: !1502)
!1504 = !DILocation(line: 1268, column: 22, scope: !1502)
!1505 = !DILocation(line: 1268, column: 36, scope: !1502)
!1506 = !DILocation(line: 1268, column: 4, scope: !1502)
!1507 = !DILocation(line: 1273, column: 1, scope: !1446)
!1508 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1290, type: !1509, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1509 = !DISubroutineType(types: !1510)
!1510 = !{!12, !529, !12}
!1511 = !DILocalVariable(name: "numerator", arg: 1, scope: !1508, file: !69, line: 1290, type: !529)
!1512 = !DILocation(line: 1290, column: 25, scope: !1508)
!1513 = !DILocalVariable(name: "denominator", arg: 2, scope: !1508, file: !69, line: 1290, type: !12)
!1514 = !DILocation(line: 1290, column: 40, scope: !1508)
!1515 = !DILocalVariable(name: "u32Temp1", scope: !1508, file: !69, line: 1292, type: !529)
!1516 = !DILocation(line: 1292, column: 6, scope: !1508)
!1517 = !DILocalVariable(name: "u32Temp2", scope: !1508, file: !69, line: 1292, type: !529)
!1518 = !DILocation(line: 1292, column: 20, scope: !1508)
!1519 = !DILocation(line: 1293, column: 5, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1293, column: 5)
!1521 = !DILocation(line: 1293, column: 17, scope: !1520)
!1522 = !DILocation(line: 1293, column: 5, scope: !1508)
!1523 = !DILocation(line: 1295, column: 6, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1525, file: !69, line: 1295, column: 6)
!1525 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1294, column: 2)
!1526 = !DILocation(line: 1295, column: 18, scope: !1524)
!1527 = !DILocation(line: 1295, column: 6, scope: !1525)
!1528 = !DILocation(line: 1297, column: 4, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1296, column: 3)
!1530 = !DILocation(line: 1301, column: 19, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1300, column: 3)
!1532 = !DILocation(line: 1301, column: 18, scope: !1531)
!1533 = !DILocation(line: 1301, column: 16, scope: !1531)
!1534 = !DILocation(line: 1302, column: 16, scope: !1531)
!1535 = !DILocation(line: 1302, column: 30, scope: !1531)
!1536 = !DILocation(line: 1302, column: 40, scope: !1531)
!1537 = !DILocation(line: 1302, column: 39, scope: !1531)
!1538 = !DILocation(line: 1302, column: 55, scope: !1531)
!1539 = !DILocation(line: 1302, column: 53, scope: !1531)
!1540 = !DILocation(line: 1302, column: 26, scope: !1531)
!1541 = !DILocation(line: 1302, column: 69, scope: !1531)
!1542 = !DILocation(line: 1302, column: 13, scope: !1531)
!1543 = !DILocation(line: 1303, column: 16, scope: !1531)
!1544 = !DILocation(line: 1303, column: 25, scope: !1531)
!1545 = !DILocation(line: 1303, column: 24, scope: !1531)
!1546 = !DILocation(line: 1303, column: 41, scope: !1531)
!1547 = !DILocation(line: 1303, column: 51, scope: !1531)
!1548 = !DILocation(line: 1303, column: 50, scope: !1531)
!1549 = !DILocation(line: 1303, column: 38, scope: !1531)
!1550 = !DILocation(line: 1303, column: 13, scope: !1531)
!1551 = !DILocation(line: 1304, column: 7, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1531, file: !69, line: 1304, column: 7)
!1553 = !DILocation(line: 1304, column: 16, scope: !1552)
!1554 = !DILocation(line: 1304, column: 7, scope: !1531)
!1555 = !DILocation(line: 1306, column: 13, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1552, file: !69, line: 1305, column: 4)
!1557 = !DILocation(line: 1306, column: 12, scope: !1556)
!1558 = !DILocation(line: 1306, column: 5, scope: !1556)
!1559 = !DILocation(line: 1310, column: 5, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1552, file: !69, line: 1309, column: 4)
!1561 = !DILocation(line: 1316, column: 15, scope: !1562)
!1562 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1315, column: 2)
!1563 = !DILocation(line: 1316, column: 29, scope: !1562)
!1564 = !DILocation(line: 1316, column: 39, scope: !1562)
!1565 = !DILocation(line: 1316, column: 38, scope: !1562)
!1566 = !DILocation(line: 1316, column: 54, scope: !1562)
!1567 = !DILocation(line: 1316, column: 52, scope: !1562)
!1568 = !DILocation(line: 1316, column: 25, scope: !1562)
!1569 = !DILocation(line: 1316, column: 68, scope: !1562)
!1570 = !DILocation(line: 1316, column: 12, scope: !1562)
!1571 = !DILocation(line: 1317, column: 15, scope: !1562)
!1572 = !DILocation(line: 1317, column: 24, scope: !1562)
!1573 = !DILocation(line: 1317, column: 23, scope: !1562)
!1574 = !DILocation(line: 1317, column: 40, scope: !1562)
!1575 = !DILocation(line: 1317, column: 50, scope: !1562)
!1576 = !DILocation(line: 1317, column: 49, scope: !1562)
!1577 = !DILocation(line: 1317, column: 37, scope: !1562)
!1578 = !DILocation(line: 1317, column: 12, scope: !1562)
!1579 = !DILocation(line: 1318, column: 6, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1562, file: !69, line: 1318, column: 6)
!1581 = !DILocation(line: 1318, column: 15, scope: !1580)
!1582 = !DILocation(line: 1318, column: 6, scope: !1562)
!1583 = !DILocation(line: 1320, column: 11, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1319, column: 3)
!1585 = !DILocation(line: 1320, column: 4, scope: !1584)
!1586 = !DILocation(line: 1324, column: 4, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1323, column: 3)
!1588 = !DILocation(line: 1327, column: 1, scope: !1508)
!1589 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1345, type: !1590, scopeLine: 1346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{!12, !12, !529}
!1592 = !DILocalVariable(name: "numerator", arg: 1, scope: !1589, file: !69, line: 1345, type: !12)
!1593 = !DILocation(line: 1345, column: 25, scope: !1589)
!1594 = !DILocalVariable(name: "denominator", arg: 2, scope: !1589, file: !69, line: 1345, type: !529)
!1595 = !DILocation(line: 1345, column: 40, scope: !1589)
!1596 = !DILocalVariable(name: "s32Temp1", scope: !1589, file: !69, line: 1347, type: !12)
!1597 = !DILocation(line: 1347, column: 6, scope: !1589)
!1598 = !DILocalVariable(name: "s32Temp2", scope: !1589, file: !69, line: 1347, type: !12)
!1599 = !DILocation(line: 1347, column: 20, scope: !1589)
!1600 = !DILocalVariable(name: "u32Temp0", scope: !1589, file: !69, line: 1348, type: !529)
!1601 = !DILocation(line: 1348, column: 6, scope: !1589)
!1602 = !DILocalVariable(name: "u32Temp1", scope: !1589, file: !69, line: 1348, type: !529)
!1603 = !DILocation(line: 1348, column: 20, scope: !1589)
!1604 = !DILocalVariable(name: "u32Temp2", scope: !1589, file: !69, line: 1348, type: !529)
!1605 = !DILocation(line: 1348, column: 34, scope: !1589)
!1606 = !DILocation(line: 1349, column: 5, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1589, file: !69, line: 1349, column: 5)
!1608 = !DILocation(line: 1349, column: 17, scope: !1607)
!1609 = !DILocation(line: 1349, column: 5, scope: !1589)
!1610 = !DILocation(line: 1351, column: 6, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1612, file: !69, line: 1351, column: 6)
!1612 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1350, column: 2)
!1613 = !DILocation(line: 1351, column: 16, scope: !1611)
!1614 = !DILocation(line: 1351, column: 6, scope: !1612)
!1615 = !DILocation(line: 1353, column: 4, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1611, file: !69, line: 1352, column: 3)
!1617 = !DILocation(line: 1357, column: 4, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1611, file: !69, line: 1356, column: 3)
!1619 = !DILocation(line: 1362, column: 6, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1621, file: !69, line: 1362, column: 6)
!1621 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1361, column: 2)
!1622 = !DILocation(line: 1362, column: 16, scope: !1620)
!1623 = !DILocation(line: 1362, column: 6, scope: !1621)
!1624 = !DILocation(line: 1364, column: 16, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !69, line: 1363, column: 3)
!1626 = !DILocation(line: 1364, column: 15, scope: !1625)
!1627 = !DILocation(line: 1364, column: 13, scope: !1625)
!1628 = !DILocation(line: 1365, column: 16, scope: !1625)
!1629 = !DILocation(line: 1365, column: 25, scope: !1625)
!1630 = !DILocation(line: 1365, column: 24, scope: !1625)
!1631 = !DILocation(line: 1365, column: 13, scope: !1625)
!1632 = !DILocation(line: 1366, column: 15, scope: !1625)
!1633 = !DILocation(line: 1366, column: 28, scope: !1625)
!1634 = !DILocation(line: 1366, column: 37, scope: !1625)
!1635 = !DILocation(line: 1366, column: 36, scope: !1625)
!1636 = !DILocation(line: 1366, column: 52, scope: !1625)
!1637 = !DILocation(line: 1366, column: 50, scope: !1625)
!1638 = !DILocation(line: 1366, column: 24, scope: !1625)
!1639 = !DILocation(line: 1366, column: 13, scope: !1625)
!1640 = !DILocation(line: 1368, column: 8, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1625, file: !69, line: 1368, column: 7)
!1642 = !DILocation(line: 1368, column: 20, scope: !1641)
!1643 = !DILocation(line: 1368, column: 27, scope: !1641)
!1644 = !DILocation(line: 1368, column: 7, scope: !1625)
!1645 = !DILocation(line: 1370, column: 20, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1641, file: !69, line: 1369, column: 4)
!1647 = !DILocation(line: 1370, column: 32, scope: !1646)
!1648 = !DILocation(line: 1370, column: 17, scope: !1646)
!1649 = !DILocation(line: 1371, column: 4, scope: !1646)
!1650 = !DILocation(line: 1374, column: 20, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1641, file: !69, line: 1373, column: 4)
!1652 = !DILocation(line: 1374, column: 32, scope: !1651)
!1653 = !DILocation(line: 1374, column: 38, scope: !1651)
!1654 = !DILocation(line: 1374, column: 17, scope: !1651)
!1655 = !DILocation(line: 1378, column: 7, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1625, file: !69, line: 1378, column: 7)
!1657 = !DILocation(line: 1378, column: 18, scope: !1656)
!1658 = !DILocation(line: 1378, column: 16, scope: !1656)
!1659 = !DILocation(line: 1378, column: 7, scope: !1625)
!1660 = !DILocation(line: 1380, column: 14, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1379, column: 4)
!1662 = !DILocation(line: 1380, column: 13, scope: !1661)
!1663 = !DILocation(line: 1380, column: 23, scope: !1661)
!1664 = !DILocation(line: 1380, column: 5, scope: !1661)
!1665 = !DILocation(line: 1384, column: 14, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1383, column: 4)
!1667 = !DILocation(line: 1384, column: 23, scope: !1666)
!1668 = !DILocation(line: 1384, column: 12, scope: !1666)
!1669 = !DILocation(line: 1384, column: 27, scope: !1666)
!1670 = !DILocation(line: 1384, column: 5, scope: !1666)
!1671 = !DILocation(line: 1391, column: 16, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1620, file: !69, line: 1390, column: 3)
!1673 = !DILocation(line: 1391, column: 30, scope: !1672)
!1674 = !DILocation(line: 1391, column: 40, scope: !1672)
!1675 = !DILocation(line: 1391, column: 39, scope: !1672)
!1676 = !DILocation(line: 1391, column: 55, scope: !1672)
!1677 = !DILocation(line: 1391, column: 53, scope: !1672)
!1678 = !DILocation(line: 1391, column: 26, scope: !1672)
!1679 = !DILocation(line: 1391, column: 69, scope: !1672)
!1680 = !DILocation(line: 1391, column: 13, scope: !1672)
!1681 = !DILocation(line: 1392, column: 16, scope: !1672)
!1682 = !DILocation(line: 1392, column: 26, scope: !1672)
!1683 = !DILocation(line: 1392, column: 25, scope: !1672)
!1684 = !DILocation(line: 1392, column: 42, scope: !1672)
!1685 = !DILocation(line: 1392, column: 51, scope: !1672)
!1686 = !DILocation(line: 1392, column: 50, scope: !1672)
!1687 = !DILocation(line: 1392, column: 39, scope: !1672)
!1688 = !DILocation(line: 1392, column: 13, scope: !1672)
!1689 = !DILocation(line: 1393, column: 11, scope: !1672)
!1690 = !DILocation(line: 1393, column: 4, scope: !1672)
!1691 = !DILocation(line: 1396, column: 1, scope: !1589)
!1692 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1413, type: !1693, scopeLine: 1414, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1693 = !DISubroutineType(types: !1694)
!1694 = !{!12, !12, !12}
!1695 = !DILocalVariable(name: "numerator", arg: 1, scope: !1692, file: !69, line: 1413, type: !12)
!1696 = !DILocation(line: 1413, column: 25, scope: !1692)
!1697 = !DILocalVariable(name: "denominator", arg: 2, scope: !1692, file: !69, line: 1413, type: !12)
!1698 = !DILocation(line: 1413, column: 40, scope: !1692)
!1699 = !DILocalVariable(name: "s32Temp1", scope: !1692, file: !69, line: 1415, type: !12)
!1700 = !DILocation(line: 1415, column: 6, scope: !1692)
!1701 = !DILocalVariable(name: "s32Temp2", scope: !1692, file: !69, line: 1415, type: !12)
!1702 = !DILocation(line: 1415, column: 20, scope: !1692)
!1703 = !DILocalVariable(name: "denominator_prime", scope: !1692, file: !69, line: 1416, type: !529)
!1704 = !DILocation(line: 1416, column: 6, scope: !1692)
!1705 = !DILocalVariable(name: "u32Temp1", scope: !1692, file: !69, line: 1416, type: !529)
!1706 = !DILocation(line: 1416, column: 29, scope: !1692)
!1707 = !DILocalVariable(name: "u32Temp2", scope: !1692, file: !69, line: 1416, type: !529)
!1708 = !DILocation(line: 1416, column: 43, scope: !1692)
!1709 = !DILocalVariable(name: "u32numerator", scope: !1692, file: !69, line: 1417, type: !529)
!1710 = !DILocation(line: 1417, column: 6, scope: !1692)
!1711 = !DILocalVariable(name: "u32denominator", scope: !1692, file: !69, line: 1417, type: !529)
!1712 = !DILocation(line: 1417, column: 23, scope: !1692)
!1713 = !DILocation(line: 1418, column: 5, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1692, file: !69, line: 1418, column: 5)
!1715 = !DILocation(line: 1418, column: 15, scope: !1714)
!1716 = !DILocation(line: 1418, column: 5, scope: !1692)
!1717 = !DILocation(line: 1420, column: 6, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1719, file: !69, line: 1420, column: 6)
!1719 = distinct !DILexicalBlock(scope: !1714, file: !69, line: 1419, column: 2)
!1720 = !DILocation(line: 1420, column: 18, scope: !1718)
!1721 = !DILocation(line: 1420, column: 6, scope: !1719)
!1722 = !DILocation(line: 1422, column: 7, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !69, line: 1422, column: 7)
!1724 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1421, column: 3)
!1725 = !DILocation(line: 1422, column: 19, scope: !1723)
!1726 = !DILocation(line: 1422, column: 7, scope: !1724)
!1727 = !DILocation(line: 1424, column: 5, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1423, column: 4)
!1729 = !DILocation(line: 1428, column: 21, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1427, column: 4)
!1731 = !DILocation(line: 1428, column: 20, scope: !1730)
!1732 = !DILocation(line: 1428, column: 18, scope: !1730)
!1733 = !DILocation(line: 1429, column: 23, scope: !1730)
!1734 = !DILocation(line: 1429, column: 22, scope: !1730)
!1735 = !DILocation(line: 1429, column: 20, scope: !1730)
!1736 = !DILocation(line: 1430, column: 16, scope: !1730)
!1737 = !DILocation(line: 1430, column: 33, scope: !1730)
!1738 = !DILocation(line: 1430, column: 46, scope: !1730)
!1739 = !DILocation(line: 1430, column: 45, scope: !1730)
!1740 = !DILocation(line: 1430, column: 64, scope: !1730)
!1741 = !DILocation(line: 1430, column: 62, scope: !1730)
!1742 = !DILocation(line: 1430, column: 29, scope: !1730)
!1743 = !DILocation(line: 1430, column: 81, scope: !1730)
!1744 = !DILocation(line: 1430, column: 14, scope: !1730)
!1745 = !DILocation(line: 1431, column: 17, scope: !1730)
!1746 = !DILocation(line: 1431, column: 30, scope: !1730)
!1747 = !DILocation(line: 1431, column: 29, scope: !1730)
!1748 = !DILocation(line: 1431, column: 49, scope: !1730)
!1749 = !DILocation(line: 1431, column: 58, scope: !1730)
!1750 = !DILocation(line: 1431, column: 57, scope: !1730)
!1751 = !DILocation(line: 1431, column: 46, scope: !1730)
!1752 = !DILocation(line: 1431, column: 14, scope: !1730)
!1753 = !DILocation(line: 1432, column: 8, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1730, file: !69, line: 1432, column: 8)
!1755 = !DILocation(line: 1432, column: 17, scope: !1754)
!1756 = !DILocation(line: 1432, column: 8, scope: !1730)
!1757 = !DILocation(line: 1434, column: 13, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1754, file: !69, line: 1433, column: 5)
!1759 = !DILocation(line: 1434, column: 6, scope: !1758)
!1760 = !DILocation(line: 1438, column: 6, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1754, file: !69, line: 1437, column: 5)
!1762 = !DILocation(line: 1444, column: 20, scope: !1763)
!1763 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1443, column: 3)
!1764 = !DILocation(line: 1444, column: 19, scope: !1763)
!1765 = !DILocation(line: 1444, column: 29, scope: !1763)
!1766 = !DILocation(line: 1444, column: 17, scope: !1763)
!1767 = !DILocation(line: 1445, column: 16, scope: !1763)
!1768 = !DILocation(line: 1445, column: 33, scope: !1763)
!1769 = !DILocation(line: 1445, column: 46, scope: !1763)
!1770 = !DILocation(line: 1445, column: 45, scope: !1763)
!1771 = !DILocation(line: 1445, column: 61, scope: !1763)
!1772 = !DILocation(line: 1445, column: 59, scope: !1763)
!1773 = !DILocation(line: 1445, column: 29, scope: !1763)
!1774 = !DILocation(line: 1445, column: 75, scope: !1763)
!1775 = !DILocation(line: 1445, column: 13, scope: !1763)
!1776 = !DILocation(line: 1446, column: 16, scope: !1763)
!1777 = !DILocation(line: 1446, column: 29, scope: !1763)
!1778 = !DILocation(line: 1446, column: 28, scope: !1763)
!1779 = !DILocation(line: 1446, column: 45, scope: !1763)
!1780 = !DILocation(line: 1446, column: 54, scope: !1763)
!1781 = !DILocation(line: 1446, column: 53, scope: !1763)
!1782 = !DILocation(line: 1446, column: 42, scope: !1763)
!1783 = !DILocation(line: 1446, column: 13, scope: !1763)
!1784 = !DILocation(line: 1447, column: 13, scope: !1763)
!1785 = !DILocation(line: 1447, column: 12, scope: !1763)
!1786 = !DILocation(line: 1447, column: 22, scope: !1763)
!1787 = !DILocation(line: 1447, column: 4, scope: !1763)
!1788 = !DILocation(line: 1452, column: 6, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1790, file: !69, line: 1452, column: 6)
!1790 = distinct !DILexicalBlock(scope: !1714, file: !69, line: 1451, column: 2)
!1791 = !DILocation(line: 1452, column: 18, scope: !1789)
!1792 = !DILocation(line: 1452, column: 6, scope: !1790)
!1793 = !DILocation(line: 1454, column: 7, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1795, file: !69, line: 1454, column: 7)
!1795 = distinct !DILexicalBlock(scope: !1789, file: !69, line: 1453, column: 3)
!1796 = !DILocation(line: 1454, column: 19, scope: !1794)
!1797 = !DILocation(line: 1454, column: 7, scope: !1795)
!1798 = !DILocation(line: 1456, column: 5, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1794, file: !69, line: 1455, column: 4)
!1800 = !DILocation(line: 1460, column: 23, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1794, file: !69, line: 1459, column: 4)
!1802 = !DILocation(line: 1460, column: 22, scope: !1801)
!1803 = !DILocation(line: 1460, column: 35, scope: !1801)
!1804 = !DILocation(line: 1460, column: 20, scope: !1801)
!1805 = !DILocation(line: 1461, column: 17, scope: !1801)
!1806 = !DILocation(line: 1461, column: 31, scope: !1801)
!1807 = !DILocation(line: 1461, column: 41, scope: !1801)
!1808 = !DILocation(line: 1461, column: 40, scope: !1801)
!1809 = !DILocation(line: 1461, column: 59, scope: !1801)
!1810 = !DILocation(line: 1461, column: 57, scope: !1801)
!1811 = !DILocation(line: 1461, column: 27, scope: !1801)
!1812 = !DILocation(line: 1461, column: 76, scope: !1801)
!1813 = !DILocation(line: 1461, column: 14, scope: !1801)
!1814 = !DILocation(line: 1462, column: 17, scope: !1801)
!1815 = !DILocation(line: 1462, column: 27, scope: !1801)
!1816 = !DILocation(line: 1462, column: 26, scope: !1801)
!1817 = !DILocation(line: 1462, column: 46, scope: !1801)
!1818 = !DILocation(line: 1462, column: 55, scope: !1801)
!1819 = !DILocation(line: 1462, column: 54, scope: !1801)
!1820 = !DILocation(line: 1462, column: 43, scope: !1801)
!1821 = !DILocation(line: 1462, column: 14, scope: !1801)
!1822 = !DILocation(line: 1463, column: 14, scope: !1801)
!1823 = !DILocation(line: 1463, column: 13, scope: !1801)
!1824 = !DILocation(line: 1463, column: 23, scope: !1801)
!1825 = !DILocation(line: 1463, column: 5, scope: !1801)
!1826 = !DILocation(line: 1468, column: 16, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1789, file: !69, line: 1467, column: 3)
!1828 = !DILocation(line: 1468, column: 30, scope: !1827)
!1829 = !DILocation(line: 1468, column: 40, scope: !1827)
!1830 = !DILocation(line: 1468, column: 39, scope: !1827)
!1831 = !DILocation(line: 1468, column: 55, scope: !1827)
!1832 = !DILocation(line: 1468, column: 53, scope: !1827)
!1833 = !DILocation(line: 1468, column: 26, scope: !1827)
!1834 = !DILocation(line: 1468, column: 69, scope: !1827)
!1835 = !DILocation(line: 1468, column: 13, scope: !1827)
!1836 = !DILocation(line: 1469, column: 16, scope: !1827)
!1837 = !DILocation(line: 1469, column: 26, scope: !1827)
!1838 = !DILocation(line: 1469, column: 25, scope: !1827)
!1839 = !DILocation(line: 1469, column: 42, scope: !1827)
!1840 = !DILocation(line: 1469, column: 51, scope: !1827)
!1841 = !DILocation(line: 1469, column: 50, scope: !1827)
!1842 = !DILocation(line: 1469, column: 39, scope: !1827)
!1843 = !DILocation(line: 1469, column: 13, scope: !1827)
!1844 = !DILocation(line: 1470, column: 11, scope: !1827)
!1845 = !DILocation(line: 1470, column: 4, scope: !1827)
!1846 = !DILocation(line: 1473, column: 1, scope: !1692)
!1847 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1491, type: !1848, scopeLine: 1492, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1848 = !DISubroutineType(types: !1849)
!1849 = !{!20, !12, !529}
!1850 = !DILocalVariable(name: "numerator", arg: 1, scope: !1847, file: !69, line: 1491, type: !12)
!1851 = !DILocation(line: 1491, column: 25, scope: !1847)
!1852 = !DILocalVariable(name: "denominator", arg: 2, scope: !1847, file: !69, line: 1491, type: !529)
!1853 = !DILocation(line: 1491, column: 40, scope: !1847)
!1854 = !DILocalVariable(name: "numerator_prime", scope: !1847, file: !69, line: 1494, type: !529)
!1855 = !DILocation(line: 1494, column: 6, scope: !1847)
!1856 = !DILocalVariable(name: "u32Temp1", scope: !1847, file: !69, line: 1494, type: !529)
!1857 = !DILocation(line: 1494, column: 27, scope: !1847)
!1858 = !DILocalVariable(name: "u32Temp2", scope: !1847, file: !69, line: 1494, type: !529)
!1859 = !DILocation(line: 1494, column: 41, scope: !1847)
!1860 = !DILocalVariable(name: "u32Temp3", scope: !1847, file: !69, line: 1494, type: !529)
!1861 = !DILocation(line: 1494, column: 55, scope: !1847)
!1862 = !DILocalVariable(name: "s32Temp1", scope: !1847, file: !69, line: 1495, type: !12)
!1863 = !DILocation(line: 1495, column: 6, scope: !1847)
!1864 = !DILocalVariable(name: "s32Temp2", scope: !1847, file: !69, line: 1495, type: !12)
!1865 = !DILocation(line: 1495, column: 20, scope: !1847)
!1866 = !DILocalVariable(name: "s32Temp3", scope: !1847, file: !69, line: 1495, type: !12)
!1867 = !DILocation(line: 1495, column: 34, scope: !1847)
!1868 = !DILocation(line: 1496, column: 5, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1847, file: !69, line: 1496, column: 5)
!1870 = !DILocation(line: 1496, column: 17, scope: !1869)
!1871 = !DILocation(line: 1496, column: 5, scope: !1847)
!1872 = !DILocation(line: 1498, column: 6, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1498, column: 6)
!1874 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1497, column: 2)
!1875 = !DILocation(line: 1498, column: 15, scope: !1873)
!1876 = !DILocation(line: 1498, column: 6, scope: !1874)
!1877 = !DILocation(line: 1500, column: 4, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1873, file: !69, line: 1499, column: 3)
!1879 = !DILocation(line: 1504, column: 4, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1873, file: !69, line: 1503, column: 3)
!1881 = !DILocation(line: 1509, column: 6, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1883, file: !69, line: 1509, column: 6)
!1883 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1508, column: 2)
!1884 = !DILocation(line: 1509, column: 16, scope: !1882)
!1885 = !DILocation(line: 1509, column: 6, scope: !1883)
!1886 = !DILocation(line: 1511, column: 23, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1882, file: !69, line: 1510, column: 3)
!1888 = !DILocation(line: 1511, column: 22, scope: !1887)
!1889 = !DILocation(line: 1511, column: 20, scope: !1887)
!1890 = !DILocation(line: 1512, column: 16, scope: !1887)
!1891 = !DILocation(line: 1512, column: 32, scope: !1887)
!1892 = !DILocation(line: 1512, column: 31, scope: !1887)
!1893 = !DILocation(line: 1512, column: 13, scope: !1887)
!1894 = !DILocation(line: 1513, column: 15, scope: !1887)
!1895 = !DILocation(line: 1513, column: 34, scope: !1887)
!1896 = !DILocation(line: 1513, column: 45, scope: !1887)
!1897 = !DILocation(line: 1513, column: 43, scope: !1887)
!1898 = !DILocation(line: 1513, column: 31, scope: !1887)
!1899 = !DILocation(line: 1513, column: 13, scope: !1887)
!1900 = !DILocation(line: 1515, column: 8, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1887, file: !69, line: 1515, column: 7)
!1902 = !DILocation(line: 1515, column: 20, scope: !1901)
!1903 = !DILocation(line: 1515, column: 27, scope: !1901)
!1904 = !DILocation(line: 1515, column: 7, scope: !1887)
!1905 = !DILocation(line: 1517, column: 19, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1901, file: !69, line: 1516, column: 4)
!1907 = !DILocation(line: 1517, column: 31, scope: !1906)
!1908 = !DILocation(line: 1517, column: 17, scope: !1906)
!1909 = !DILocation(line: 1518, column: 4, scope: !1906)
!1910 = !DILocation(line: 1521, column: 20, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1901, file: !69, line: 1520, column: 4)
!1912 = !DILocation(line: 1521, column: 32, scope: !1911)
!1913 = !DILocation(line: 1521, column: 38, scope: !1911)
!1914 = !DILocation(line: 1521, column: 17, scope: !1911)
!1915 = !DILocation(line: 1524, column: 7, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1887, file: !69, line: 1524, column: 7)
!1917 = !DILocation(line: 1524, column: 18, scope: !1916)
!1918 = !DILocation(line: 1524, column: 16, scope: !1916)
!1919 = !DILocation(line: 1524, column: 7, scope: !1887)
!1920 = !DILocation(line: 1526, column: 18, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1916, file: !69, line: 1525, column: 4)
!1922 = !DILocation(line: 1526, column: 16, scope: !1921)
!1923 = !DILocation(line: 1526, column: 28, scope: !1921)
!1924 = !DILocation(line: 1526, column: 14, scope: !1921)
!1925 = !DILocation(line: 1527, column: 4, scope: !1921)
!1926 = !DILocation(line: 1530, column: 18, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1916, file: !69, line: 1529, column: 4)
!1928 = !DILocation(line: 1530, column: 26, scope: !1927)
!1929 = !DILocation(line: 1530, column: 16, scope: !1927)
!1930 = !DILocation(line: 1530, column: 30, scope: !1927)
!1931 = !DILocation(line: 1530, column: 14, scope: !1927)
!1932 = !DILocation(line: 1532, column: 8, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1887, file: !69, line: 1532, column: 7)
!1934 = !DILocation(line: 1532, column: 18, scope: !1933)
!1935 = !DILocation(line: 1532, column: 7, scope: !1887)
!1936 = !DILocation(line: 1534, column: 18, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1933, file: !69, line: 1533, column: 4)
!1938 = !DILocation(line: 1534, column: 12, scope: !1937)
!1939 = !DILocation(line: 1534, column: 5, scope: !1937)
!1940 = !DILocation(line: 1538, column: 5, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1933, file: !69, line: 1537, column: 4)
!1942 = !DILocation(line: 1543, column: 16, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1882, file: !69, line: 1542, column: 3)
!1944 = !DILocation(line: 1543, column: 26, scope: !1943)
!1945 = !DILocation(line: 1543, column: 25, scope: !1943)
!1946 = !DILocation(line: 1543, column: 41, scope: !1943)
!1947 = !DILocation(line: 1543, column: 39, scope: !1943)
!1948 = !DILocation(line: 1543, column: 13, scope: !1943)
!1949 = !DILocation(line: 1544, column: 16, scope: !1943)
!1950 = !DILocation(line: 1544, column: 30, scope: !1943)
!1951 = !DILocation(line: 1544, column: 40, scope: !1943)
!1952 = !DILocation(line: 1544, column: 39, scope: !1943)
!1953 = !DILocation(line: 1544, column: 55, scope: !1943)
!1954 = !DILocation(line: 1544, column: 53, scope: !1943)
!1955 = !DILocation(line: 1544, column: 26, scope: !1943)
!1956 = !DILocation(line: 1544, column: 68, scope: !1943)
!1957 = !DILocation(line: 1544, column: 13, scope: !1943)
!1958 = !DILocation(line: 1545, column: 16, scope: !1943)
!1959 = !DILocation(line: 1545, column: 25, scope: !1943)
!1960 = !DILocation(line: 1545, column: 24, scope: !1943)
!1961 = !DILocation(line: 1545, column: 41, scope: !1943)
!1962 = !DILocation(line: 1545, column: 51, scope: !1943)
!1963 = !DILocation(line: 1545, column: 50, scope: !1943)
!1964 = !DILocation(line: 1545, column: 38, scope: !1943)
!1965 = !DILocation(line: 1545, column: 13, scope: !1943)
!1966 = !DILocation(line: 1546, column: 7, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1943, file: !69, line: 1546, column: 7)
!1968 = !DILocation(line: 1546, column: 16, scope: !1967)
!1969 = !DILocation(line: 1546, column: 7, scope: !1943)
!1970 = !DILocation(line: 1548, column: 17, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1967, file: !69, line: 1547, column: 4)
!1972 = !DILocation(line: 1548, column: 12, scope: !1971)
!1973 = !DILocation(line: 1548, column: 5, scope: !1971)
!1974 = !DILocation(line: 1552, column: 5, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1967, file: !69, line: 1551, column: 4)
!1976 = !DILocation(line: 1556, column: 1, scope: !1847)
!1977 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1978, file: !1978, line: 12, type: !1979, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1982)
!1978 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1979 = !DISubroutineType(types: !1980)
!1980 = !{null, !1981}
!1981 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1982 = !{!1983}
!1983 = !DILocalVariable(name: "z", arg: 1, scope: !1977, file: !1978, line: 12, type: !1981)
!1984 = !DILocation(line: 0, scope: !1977)
!1985 = !DILocation(line: 13, column: 9, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1977, file: !1978, line: 13, column: 7)
!1987 = !DILocation(line: 13, column: 7, scope: !1977)
!1988 = !DILocation(line: 14, column: 5, scope: !1986)
!1989 = !DILocation(line: 15, column: 1, scope: !1977)
!1990 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1991, file: !1991, line: 20, type: !1992, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1995)
!1991 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1992 = !DISubroutineType(types: !1993)
!1993 = !{null, !1994, !1994}
!1994 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1995 = !{!1996, !1997}
!1996 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1990, file: !1991, line: 20, type: !1994)
!1997 = !DILocalVariable(name: "shift", arg: 2, scope: !1990, file: !1991, line: 20, type: !1994)
!1998 = !DILocation(line: 0, scope: !1990)
!1999 = !DILocation(line: 21, column: 13, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1990, file: !1991, line: 21, column: 7)
!2001 = !DILocation(line: 21, column: 7, scope: !1990)
!2002 = !DILocation(line: 27, column: 5, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !2000, file: !1991, line: 21, column: 26)
!2004 = !DILocation(line: 29, column: 1, scope: !1990)
