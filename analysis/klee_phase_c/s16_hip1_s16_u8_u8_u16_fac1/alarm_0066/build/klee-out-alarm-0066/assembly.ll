; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0066.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"yold\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"uold\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/hip_Ccode.c\00", align 1
@.str.1.5 = private unnamed_addr constant [75 x i8] c"KLEE-ALARM-0066: invalid LHS operand for left shift. assert 0 <= s32Temp2;\00", align 1
@.str.2.6 = private unnamed_addr constant [20 x i8] c"klee-alarm-0066.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.5 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.6 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.7 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !30 {
entry:
  %retval = alloca i32, align 4
  %yold = alloca i16, align 2
  %u = alloca i8, align 1
  %uold = alloca i8, align 1
  %m = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %yold, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i8* %u, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i8* %uold, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i16* %m, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i16* %result, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = bitcast i16* %yold to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @klee_make_symbolic(i8* %u, i64 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @klee_make_symbolic(i8* %uold, i64 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  %1 = bitcast i16* %m to i8*, !dbg !57
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  %2 = load i16, i16* %yold, align 2, !dbg !59
  %3 = load i8, i8* %u, align 1, !dbg !60
  %4 = load i8, i8* %uold, align 1, !dbg !61
  %5 = load i16, i16* %m, align 2, !dbg !62
  %call = call signext i16 @s16_hip1_s16_u8_u8_u16_fac1(i16 signext %2, i8 zeroext %3, i8 zeroext %4, i16 zeroext %5), !dbg !63
  store i16 %call, i16* %result, align 2, !dbg !64
  %6 = load i16, i16* %result, align 2, !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_hip1_s16_u8_u8_u16_fac1(i16 signext %yold, i8 zeroext %u, i8 zeroext %uold, i16 zeroext %m) #0 !dbg !67 {
entry:
  %retval = alloca i16, align 2
  %yold.addr = alloca i16, align 2
  %u.addr = alloca i8, align 1
  %uold.addr = alloca i8, align 1
  %m.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s16u = alloca i16, align 2
  %u16uold = alloca i16, align 2
  store i16 %yold, i16* %yold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !83, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %s32Temp1, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 0, i32* %s32Temp2, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata i16* %s16u, metadata !90, metadata !DIExpression()), !dbg !91
  store i16 0, i16* %s16u, align 2, !dbg !91
  call void @llvm.dbg.declare(metadata i16* %u16uold, metadata !92, metadata !DIExpression()), !dbg !93
  store i16 0, i16* %u16uold, align 2, !dbg !93
  %0 = load i8, i8* %u.addr, align 1, !dbg !94
  %conv = zext i8 %0 to i32, !dbg !96
  %1 = load i8, i8* %uold.addr, align 1, !dbg !97
  %conv1 = zext i8 %1 to i32, !dbg !98
  %sub = sub nsw i32 %conv, %conv1, !dbg !99
  %conv2 = sext i32 %sub to i64, !dbg !100
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv2), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.end, label %if.then, !dbg !102

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !103
  br label %return, !dbg !103

if.end:                                           ; preds = %entry
  %2 = load i8, i8* %u.addr, align 1, !dbg !105
  %conv3 = zext i8 %2 to i32, !dbg !105
  %3 = load i8, i8* %uold.addr, align 1, !dbg !106
  %conv4 = zext i8 %3 to i32, !dbg !106
  %sub5 = sub nsw i32 %conv3, %conv4, !dbg !107
  %shl = shl i32 %sub5, 7, !dbg !108
  %conv6 = trunc i32 %shl to i16, !dbg !109
  store i16 %conv6, i16* %u16uold, align 2, !dbg !110
  %4 = load i16, i16* %yold.addr, align 2, !dbg !111
  %conv7 = sext i16 %4 to i32, !dbg !111
  %5 = load i16, i16* %m.addr, align 2, !dbg !112
  %conv8 = zext i16 %5 to i32, !dbg !112
  %mul = mul nsw i32 %conv7, %conv8, !dbg !113
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !114
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !115
  %div = sdiv i32 %6, 65536, !dbg !116
  %mul9 = mul nsw i32 %div, 65536, !dbg !117
  store i32 %mul9, i32* %s32Temp2, align 4, !dbg !118
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !119
  %conv10 = sext i32 %7 to i64, !dbg !121
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !122
  %conv11 = sext i32 %8 to i64, !dbg !123
  %call12 = call i32 @klee_alarm_s32_sub_lower(i64 %conv10, i64 %conv11), !dbg !124
  %tobool13 = icmp ne i32 %call12, 0, !dbg !124
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !125

if.then14:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !126
  br label %return, !dbg !126

if.end15:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !128
  %conv16 = sext i32 %9 to i64, !dbg !130
  %10 = load i32, i32* %s32Temp2, align 4, !dbg !131
  %conv17 = sext i32 %10 to i64, !dbg !132
  %call18 = call i32 @klee_alarm_s32_sub_upper(i64 %conv16, i64 %conv17), !dbg !133
  %tobool19 = icmp ne i32 %call18, 0, !dbg !133
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !134

if.then20:                                        ; preds = %if.end15
  store i16 0, i16* %retval, align 2, !dbg !135
  br label %return, !dbg !135

if.end21:                                         ; preds = %if.end15
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !137
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !138
  %sub22 = sub nsw i32 %11, %12, !dbg !139
  store i32 %sub22, i32* %s32Temp2, align 4, !dbg !140
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !141
  %conv23 = sext i32 %13 to i64, !dbg !143
  %call24 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv23, i32 1), !dbg !144
  %tobool25 = icmp ne i32 %call24, 0, !dbg !144
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !145

if.then26:                                        ; preds = %if.end21
  store i16 0, i16* %retval, align 2, !dbg !146
  br label %return, !dbg !146

if.end27:                                         ; preds = %if.end21
  %14 = load i32, i32* %s32Temp2, align 4, !dbg !148
  %conv28 = sext i32 %14 to i64, !dbg !150
  %call29 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv28), !dbg !151
  %tobool30 = icmp ne i32 %call29, 0, !dbg !151
  br i1 %tobool30, label %if.end32, label %if.then31, !dbg !152

if.then31:                                        ; preds = %if.end27
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i32 73, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.6, i64 0, i64 0)) #5, !dbg !153
  unreachable, !dbg !153

if.end32:                                         ; preds = %if.end27
  %15 = load i32, i32* %s32Temp2, align 4, !dbg !155
  %shl33 = shl i32 %15, 1, !dbg !156
  %conv34 = sext i32 %shl33 to i64, !dbg !157
  store volatile i64 %conv34, i64* @klee_alarm_sink_s64, align 8, !dbg !158
  store i16 0, i16* %retval, align 2, !dbg !159
  br label %return, !dbg !159

return:                                           ; preds = %if.end32, %if.then26, %if.then20, %if.then14, %if.then
  %16 = load i16, i16* %retval, align 2, !dbg !160
  ret i16 %16, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !161 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = load i64, i64* %left.addr, align 8, !dbg !166
  %cmp = icmp sge i64 %0, 0, !dbg !167
  %conv = zext i1 %cmp to i32, !dbg !167
  ret i32 %conv, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !169 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !172, metadata !DIExpression()), !dbg !173
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = load i64, i64* %left.addr, align 8, !dbg !176
  %1 = load i64, i64* %right.addr, align 8, !dbg !177
  %sub = sub nsw i64 %0, %1, !dbg !178
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !179
  %conv = zext i1 %cmp to i32, !dbg !179
  ret i32 %conv, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_upper(i64 %left, i64 %right) #0 !dbg !181 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !182, metadata !DIExpression()), !dbg !183
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !184, metadata !DIExpression()), !dbg !185
  %0 = load i64, i64* %left.addr, align 8, !dbg !186
  %1 = load i64, i64* %right.addr, align 8, !dbg !187
  %sub = sub nsw i64 %0, %1, !dbg !188
  %cmp = icmp sle i64 %sub, 2147483647, !dbg !189
  %conv = zext i1 %cmp to i32, !dbg !189
  ret i32 %conv, !dbg !190
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !191 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = load i32, i32* %count.addr, align 4, !dbg !198
  %cmp = icmp uge i32 %0, 63, !dbg !200
  br i1 %cmp, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !202
  br label %return, !dbg !202

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !204
  %2 = load i32, i32* %count.addr, align 4, !dbg !205
  %sh_prom = zext i32 %2 to i64, !dbg !206
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !206
  %shl = shl i64 1, %sh_prom, !dbg !206, !klee.check.shift !207
  %mul = mul nsw i64 %1, %shl, !dbg !208
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !209
  %conv = zext i1 %cmp1 to i32, !dbg !209
  store i32 %conv, i32* %retval, align 4, !dbg !210
  br label %return, !dbg !210

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !211
  ret i32 %3, !dbg !211
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_hip1_s16_s8_s8_u16_fac1(i16 signext %yold, i8 signext %u, i8 signext %uold, i16 zeroext %m) #0 !dbg !212 {
entry:
  %retval = alloca i16, align 2
  %yold.addr = alloca i16, align 2
  %u.addr = alloca i8, align 1
  %uold.addr = alloca i8, align 1
  %m.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s16u = alloca i32, align 4
  %s16uold = alloca i16, align 2
  store i16 %yold, i16* %yold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !219, metadata !DIExpression()), !dbg !220
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !221, metadata !DIExpression()), !dbg !222
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !223, metadata !DIExpression()), !dbg !224
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !225, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !227, metadata !DIExpression()), !dbg !228
  store i32 0, i32* %s32Temp1, align 4, !dbg !228
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !229, metadata !DIExpression()), !dbg !230
  store i32 0, i32* %s32Temp2, align 4, !dbg !230
  call void @llvm.dbg.declare(metadata i32* %s16u, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 0, i32* %s16u, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata i16* %s16uold, metadata !233, metadata !DIExpression()), !dbg !234
  store i16 0, i16* %s16uold, align 2, !dbg !234
  %0 = load i8, i8* %u.addr, align 1, !dbg !235
  %conv = sext i8 %0 to i32, !dbg !235
  %1 = load i8, i8* %uold.addr, align 1, !dbg !236
  %conv1 = sext i8 %1 to i32, !dbg !236
  %sub = sub nsw i32 %conv, %conv1, !dbg !237
  %shl = shl i32 %sub, 7, !dbg !238
  %conv2 = trunc i32 %shl to i16, !dbg !239
  store i16 %conv2, i16* %s16uold, align 2, !dbg !240
  %2 = load i16, i16* %yold.addr, align 2, !dbg !241
  %conv3 = sext i16 %2 to i32, !dbg !241
  %3 = load i16, i16* %m.addr, align 2, !dbg !242
  %conv4 = zext i16 %3 to i32, !dbg !242
  %mul = mul nsw i32 %conv3, %conv4, !dbg !243
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !244
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !245
  %div = sdiv i32 %4, 65536, !dbg !246
  %mul5 = mul nsw i32 %div, 65536, !dbg !247
  store i32 %mul5, i32* %s32Temp2, align 4, !dbg !248
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !249
  %6 = load i32, i32* %s32Temp2, align 4, !dbg !250
  %sub6 = sub nsw i32 %5, %6, !dbg !251
  store i32 %sub6, i32* %s32Temp2, align 4, !dbg !252
  %7 = load i32, i32* %s32Temp2, align 4, !dbg !253
  %shl7 = shl i32 %7, 1, !dbg !254
  store i32 %shl7, i32* %s32Temp2, align 4, !dbg !255
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !256
  %div8 = sdiv i32 %8, 65536, !dbg !257
  store i32 %div8, i32* %s32Temp2, align 4, !dbg !258
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !259
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !260
  %div9 = sdiv i32 %10, 65536, !dbg !261
  %add = add nsw i32 %9, %div9, !dbg !262
  store i32 %add, i32* %s32Temp2, align 4, !dbg !263
  %11 = load i16, i16* %yold.addr, align 2, !dbg !264
  %conv10 = sext i16 %11 to i32, !dbg !264
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !265
  %sub11 = sub nsw i32 %conv10, %12, !dbg !266
  store i32 %sub11, i32* %s32Temp2, align 4, !dbg !267
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !268
  %14 = load i16, i16* %s16uold, align 2, !dbg !269
  %conv12 = sext i16 %14 to i32, !dbg !269
  %add13 = add nsw i32 %13, %conv12, !dbg !270
  store i32 %add13, i32* %s16u, align 4, !dbg !271
  %15 = load i16, i16* %yold.addr, align 2, !dbg !272
  %conv14 = sext i16 %15 to i32, !dbg !272
  %16 = load i32, i32* %s16u, align 4, !dbg !274
  %cmp = icmp ne i32 %conv14, %16, !dbg !275
  br i1 %cmp, label %if.then, label %if.else24, !dbg !276

if.then:                                          ; preds = %entry
  %17 = load i32, i32* %s16u, align 4, !dbg !277
  %cmp16 = icmp sle i32 %17, 32767, !dbg !280
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !281

if.then18:                                        ; preds = %if.then
  %18 = load i32, i32* %s16u, align 4, !dbg !282
  %cmp19 = icmp sge i32 %18, -32768, !dbg !285
  br i1 %cmp19, label %if.then21, label %if.else, !dbg !286

if.then21:                                        ; preds = %if.then18
  %19 = load i32, i32* %s16u, align 4, !dbg !287
  %conv22 = trunc i32 %19 to i16, !dbg !287
  store i16 %conv22, i16* %retval, align 2, !dbg !289
  br label %return, !dbg !289

if.else:                                          ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !290
  br label %return, !dbg !290

if.else23:                                        ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !292
  br label %return, !dbg !292

if.else24:                                        ; preds = %entry
  %20 = load i16, i16* %yold.addr, align 2, !dbg !294
  %conv25 = sext i16 %20 to i32, !dbg !294
  %cmp26 = icmp sle i32 %conv25, 0, !dbg !297
  br i1 %cmp26, label %if.then28, label %if.else53, !dbg !298

if.then28:                                        ; preds = %if.else24
  %21 = load i16, i16* %yold.addr, align 2, !dbg !299
  %conv29 = sext i16 %21 to i32, !dbg !299
  %cmp30 = icmp eq i32 %conv29, 0, !dbg !302
  br i1 %cmp30, label %if.then32, label %if.else42, !dbg !303

if.then32:                                        ; preds = %if.then28
  %22 = load i32, i32* %s16u, align 4, !dbg !304
  %cmp33 = icmp sle i32 %22, 32767, !dbg !307
  br i1 %cmp33, label %if.then35, label %if.else41, !dbg !308

if.then35:                                        ; preds = %if.then32
  %23 = load i32, i32* %s16u, align 4, !dbg !309
  %cmp36 = icmp sge i32 %23, -32768, !dbg !312
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !313

if.then38:                                        ; preds = %if.then35
  %24 = load i32, i32* %s16u, align 4, !dbg !314
  %conv39 = trunc i32 %24 to i16, !dbg !314
  store i16 %conv39, i16* %retval, align 2, !dbg !316
  br label %return, !dbg !316

if.else40:                                        ; preds = %if.then35
  store i16 -32768, i16* %retval, align 2, !dbg !317
  br label %return, !dbg !317

if.else41:                                        ; preds = %if.then32
  store i16 32767, i16* %retval, align 2, !dbg !319
  br label %return, !dbg !319

if.else42:                                        ; preds = %if.then28
  %25 = load i32, i32* %s16u, align 4, !dbg !321
  %add43 = add nsw i32 %25, 1, !dbg !323
  store i32 %add43, i32* %s16u, align 4, !dbg !324
  %26 = load i32, i32* %s16u, align 4, !dbg !325
  %cmp44 = icmp sle i32 %26, 32767, !dbg !327
  br i1 %cmp44, label %if.then46, label %if.else52, !dbg !328

if.then46:                                        ; preds = %if.else42
  %27 = load i32, i32* %s16u, align 4, !dbg !329
  %cmp47 = icmp sge i32 %27, -32768, !dbg !332
  br i1 %cmp47, label %if.then49, label %if.else51, !dbg !333

if.then49:                                        ; preds = %if.then46
  %28 = load i32, i32* %s16u, align 4, !dbg !334
  %conv50 = trunc i32 %28 to i16, !dbg !334
  store i16 %conv50, i16* %retval, align 2, !dbg !336
  br label %return, !dbg !336

if.else51:                                        ; preds = %if.then46
  store i16 -32768, i16* %retval, align 2, !dbg !337
  br label %return, !dbg !337

if.else52:                                        ; preds = %if.else42
  store i16 32767, i16* %retval, align 2, !dbg !339
  br label %return, !dbg !339

if.else53:                                        ; preds = %if.else24
  %29 = load i32, i32* %s16u, align 4, !dbg !341
  %sub54 = sub nsw i32 %29, 1, !dbg !343
  store i32 %sub54, i32* %s16u, align 4, !dbg !344
  %30 = load i32, i32* %s16u, align 4, !dbg !345
  %cmp55 = icmp sle i32 %30, 32767, !dbg !347
  br i1 %cmp55, label %if.then57, label %if.else63, !dbg !348

if.then57:                                        ; preds = %if.else53
  %31 = load i32, i32* %s16u, align 4, !dbg !349
  %cmp58 = icmp sge i32 %31, -32768, !dbg !352
  br i1 %cmp58, label %if.then60, label %if.else62, !dbg !353

if.then60:                                        ; preds = %if.then57
  %32 = load i32, i32* %s16u, align 4, !dbg !354
  %conv61 = trunc i32 %32 to i16, !dbg !354
  store i16 %conv61, i16* %retval, align 2, !dbg !356
  br label %return, !dbg !356

if.else62:                                        ; preds = %if.then57
  store i16 -32768, i16* %retval, align 2, !dbg !357
  br label %return, !dbg !357

if.else63:                                        ; preds = %if.else53
  store i16 32767, i16* %retval, align 2, !dbg !359
  br label %return, !dbg !359

return:                                           ; preds = %if.else63, %if.else62, %if.then60, %if.else52, %if.else51, %if.then49, %if.else41, %if.else40, %if.then38, %if.else23, %if.else, %if.then21
  %33 = load i16, i16* %retval, align 2, !dbg !361
  ret i16 %33, !dbg !361
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_hip1_s32_u16_u16_u16_fac1(i32 %yold, i16 zeroext %u, i16 zeroext %uold, i16 zeroext %m) #0 !dbg !362 {
entry:
  %retval = alloca i32, align 4
  %yold.addr = alloca i32, align 4
  %u.addr = alloca i16, align 2
  %uold.addr = alloca i16, align 2
  %m.addr = alloca i16, align 2
  %s32TempHW = alloca i32, align 4
  %s32TempLW = alloca i32, align 4
  %s32Temp0 = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Result = alloca i32, align 4
  store i32 %yold, i32* %yold.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %yold.addr, metadata !365, metadata !DIExpression()), !dbg !366
  store i16 %u, i16* %u.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %u.addr, metadata !367, metadata !DIExpression()), !dbg !368
  store i16 %uold, i16* %uold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %uold.addr, metadata !369, metadata !DIExpression()), !dbg !370
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !371, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata i32* %s32TempHW, metadata !373, metadata !DIExpression()), !dbg !374
  store i32 0, i32* %s32TempHW, align 4, !dbg !374
  call void @llvm.dbg.declare(metadata i32* %s32TempLW, metadata !375, metadata !DIExpression()), !dbg !376
  store i32 0, i32* %s32TempLW, align 4, !dbg !376
  call void @llvm.dbg.declare(metadata i32* %s32Temp0, metadata !377, metadata !DIExpression()), !dbg !378
  store i32 0, i32* %s32Temp0, align 4, !dbg !378
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 0, i32* %s32Temp1, align 4, !dbg !380
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !381, metadata !DIExpression()), !dbg !382
  store i32 0, i32* %s32Result, align 4, !dbg !382
  %0 = load i16, i16* %m.addr, align 2, !dbg !383
  %conv = zext i16 %0 to i32, !dbg !383
  %and = and i32 %conv, 65535, !dbg !384
  %conv1 = trunc i32 %and to i16, !dbg !383
  store i16 %conv1, i16* %m.addr, align 2, !dbg !385
  %1 = load i32, i32* %yold.addr, align 4, !dbg !386
  %2 = load i16, i16* %m.addr, align 2, !dbg !387
  %conv2 = zext i16 %2 to i32, !dbg !387
  %call = call i32 @MulHighWord(i32 %1, i32 %conv2), !dbg !388
  store i32 %call, i32* %s32TempHW, align 4, !dbg !389
  %3 = load i32, i32* %yold.addr, align 4, !dbg !390
  %4 = load i16, i16* %m.addr, align 2, !dbg !391
  %conv3 = zext i16 %4 to i32, !dbg !391
  %mul = mul nsw i32 %3, %conv3, !dbg !392
  store i32 %mul, i32* %s32TempLW, align 4, !dbg !393
  %5 = load i32, i32* %s32TempHW, align 4, !dbg !394
  %call4 = call i32 @rotateRight(i32 %5, i32 16), !dbg !395
  %and5 = and i32 %call4, -65536, !dbg !396
  %6 = load i32, i32* %s32TempLW, align 4, !dbg !397
  %shr = ashr i32 %6, 16, !dbg !398
  %add = add i32 %and5, %shr, !dbg !399
  store i32 %add, i32* %s32Temp1, align 4, !dbg !400
  %7 = load i16, i16* %u.addr, align 2, !dbg !401
  %conv6 = zext i16 %7 to i32, !dbg !401
  %8 = load i16, i16* %uold.addr, align 2, !dbg !402
  %conv7 = zext i16 %8 to i32, !dbg !402
  %sub = sub nsw i32 %conv6, %conv7, !dbg !403
  store i32 %sub, i32* %s32Temp0, align 4, !dbg !404
  %9 = load i32, i32* %yold.addr, align 4, !dbg !405
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !406
  %sub8 = sub nsw i32 %9, %10, !dbg !407
  %11 = load i32, i32* %s32Temp0, align 4, !dbg !408
  %shl = shl i32 %11, 15, !dbg !409
  %add9 = add nsw i32 %sub8, %shl, !dbg !410
  store i32 %add9, i32* %s32Result, align 4, !dbg !411
  %12 = load i32, i32* %s32Result, align 4, !dbg !412
  %13 = load i32, i32* %yold.addr, align 4, !dbg !414
  %cmp = icmp eq i32 %12, %13, !dbg !415
  br i1 %cmp, label %if.then, label %if.else16, !dbg !416

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %yold.addr, align 4, !dbg !417
  %cmp11 = icmp sgt i32 %14, 0, !dbg !420
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !421

if.then13:                                        ; preds = %if.then
  %15 = load i32, i32* %s32Result, align 4, !dbg !422
  %add14 = add nsw i32 %15, 1, !dbg !424
  store i32 %add14, i32* %retval, align 4, !dbg !425
  br label %return, !dbg !425

if.else:                                          ; preds = %if.then
  %16 = load i32, i32* %s32Result, align 4, !dbg !426
  %sub15 = sub nsw i32 %16, 1, !dbg !428
  store i32 %sub15, i32* %retval, align 4, !dbg !429
  br label %return, !dbg !429

if.else16:                                        ; preds = %entry
  %17 = load i32, i32* %s32Result, align 4, !dbg !430
  store i32 %17, i32* %retval, align 4, !dbg !432
  br label %return, !dbg !432

return:                                           ; preds = %if.else16, %if.else, %if.then13
  %18 = load i32, i32* %retval, align 4, !dbg !433
  ret i32 %18, !dbg !433
}

declare dso_local i32 @MulHighWord(i32, i32) #2

declare dso_local i32 @rotateRight(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_hip1_s32_s16_s16_u16_fac1(i32 %yold, i16 signext %u, i16 signext %uold, i16 zeroext %m) #0 !dbg !434 {
entry:
  %retval = alloca i32, align 4
  %yold.addr = alloca i32, align 4
  %u.addr = alloca i16, align 2
  %uold.addr = alloca i16, align 2
  %m.addr = alloca i16, align 2
  %s32TempHW = alloca i32, align 4
  %s32TempLW = alloca i32, align 4
  %s32Temp0 = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Result = alloca i32, align 4
  store i32 %yold, i32* %yold.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %yold.addr, metadata !437, metadata !DIExpression()), !dbg !438
  store i16 %u, i16* %u.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %u.addr, metadata !439, metadata !DIExpression()), !dbg !440
  store i16 %uold, i16* %uold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %uold.addr, metadata !441, metadata !DIExpression()), !dbg !442
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !443, metadata !DIExpression()), !dbg !444
  call void @llvm.dbg.declare(metadata i32* %s32TempHW, metadata !445, metadata !DIExpression()), !dbg !446
  store i32 0, i32* %s32TempHW, align 4, !dbg !446
  call void @llvm.dbg.declare(metadata i32* %s32TempLW, metadata !447, metadata !DIExpression()), !dbg !448
  store i32 0, i32* %s32TempLW, align 4, !dbg !448
  call void @llvm.dbg.declare(metadata i32* %s32Temp0, metadata !449, metadata !DIExpression()), !dbg !450
  store i32 0, i32* %s32Temp0, align 4, !dbg !450
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !451, metadata !DIExpression()), !dbg !452
  store i32 0, i32* %s32Temp1, align 4, !dbg !452
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !453, metadata !DIExpression()), !dbg !454
  store i32 0, i32* %s32Result, align 4, !dbg !454
  %0 = load i16, i16* %m.addr, align 2, !dbg !455
  %conv = zext i16 %0 to i32, !dbg !455
  %and = and i32 %conv, 65535, !dbg !456
  %conv1 = trunc i32 %and to i16, !dbg !455
  store i16 %conv1, i16* %m.addr, align 2, !dbg !457
  %1 = load i32, i32* %yold.addr, align 4, !dbg !458
  %2 = load i16, i16* %m.addr, align 2, !dbg !459
  %conv2 = zext i16 %2 to i32, !dbg !459
  %call = call i32 @MulHighWord(i32 %1, i32 %conv2), !dbg !460
  store i32 %call, i32* %s32TempHW, align 4, !dbg !461
  %3 = load i32, i32* %yold.addr, align 4, !dbg !462
  %4 = load i16, i16* %m.addr, align 2, !dbg !463
  %conv3 = zext i16 %4 to i32, !dbg !463
  %mul = mul nsw i32 %3, %conv3, !dbg !464
  store i32 %mul, i32* %s32TempLW, align 4, !dbg !465
  %5 = load i32, i32* %s32TempHW, align 4, !dbg !466
  %call4 = call i32 @rotateRight(i32 %5, i32 16), !dbg !467
  %and5 = and i32 %call4, -65536, !dbg !468
  %6 = load i32, i32* %s32TempLW, align 4, !dbg !469
  %shr = ashr i32 %6, 16, !dbg !470
  %add = add i32 %and5, %shr, !dbg !471
  store i32 %add, i32* %s32Temp1, align 4, !dbg !472
  %7 = load i16, i16* %u.addr, align 2, !dbg !473
  %conv6 = sext i16 %7 to i32, !dbg !473
  %8 = load i16, i16* %uold.addr, align 2, !dbg !474
  %conv7 = sext i16 %8 to i32, !dbg !474
  %sub = sub nsw i32 %conv6, %conv7, !dbg !475
  store i32 %sub, i32* %s32Temp0, align 4, !dbg !476
  %9 = load i32, i32* %yold.addr, align 4, !dbg !477
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !478
  %sub8 = sub nsw i32 %9, %10, !dbg !479
  %11 = load i32, i32* %s32Temp0, align 4, !dbg !480
  %shl = shl i32 %11, 15, !dbg !481
  %add9 = add nsw i32 %sub8, %shl, !dbg !482
  store i32 %add9, i32* %s32Result, align 4, !dbg !483
  %12 = load i32, i32* %s32Result, align 4, !dbg !484
  %13 = load i32, i32* %yold.addr, align 4, !dbg !486
  %cmp = icmp eq i32 %12, %13, !dbg !487
  br i1 %cmp, label %if.then, label %if.else16, !dbg !488

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %yold.addr, align 4, !dbg !489
  %cmp11 = icmp sgt i32 %14, 0, !dbg !492
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !493

if.then13:                                        ; preds = %if.then
  %15 = load i32, i32* %s32Result, align 4, !dbg !494
  %add14 = add nsw i32 %15, 1, !dbg !496
  store i32 %add14, i32* %retval, align 4, !dbg !497
  br label %return, !dbg !497

if.else:                                          ; preds = %if.then
  %16 = load i32, i32* %s32Result, align 4, !dbg !498
  %sub15 = sub nsw i32 %16, 1, !dbg !500
  store i32 %sub15, i32* %retval, align 4, !dbg !501
  br label %return, !dbg !501

if.else16:                                        ; preds = %entry
  %17 = load i32, i32* %s32Result, align 4, !dbg !502
  store i32 %17, i32* %retval, align 4, !dbg !504
  br label %return, !dbg !504

return:                                           ; preds = %if.else16, %if.else, %if.then13
  %18 = load i32, i32* %retval, align 4, !dbg !505
  ret i32 %18, !dbg !505
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !506 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !512, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i64 %1, metadata !513, metadata !DIExpression()), !dbg !514
  %3 = icmp ult i64 %1, %0, !dbg !515
  br i1 %3, label %5, label %4, !dbg !517

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.6, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.7, i64 0, i64 0)) #6, !dbg !518
  unreachable, !dbg !518

5:                                                ; preds = %2
  ret void, !dbg !520
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

!llvm.dbg.cu = !{!19, !2, !21}
!llvm.ident = !{!23, !23, !24}
!llvm.module.flags = !{!25, !26, !27, !28, !29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !17, line: 21, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/hip_Ccode_alarm_0066.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066")
!4 = !{}
!5 = !{!6, !11, !12}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !13, line: 26, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !15)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0}
!17 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066")
!18 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066")
!21 = distinct !DICompileUnit(language: DW_LANG_C89, file: !22, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!22 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!23 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!24 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = distinct !DISubprogram(name: "main", scope: !31, file: !31, line: 7, type: !32, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !4)
!31 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066")
!32 = !DISubroutineType(types: !33)
!33 = !{!11}
!34 = !DILocalVariable(name: "yold", scope: !30, file: !31, line: 9, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !37)
!37 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!38 = !DILocation(line: 9, column: 13, scope: !30)
!39 = !DILocalVariable(name: "u", scope: !30, file: !31, line: 10, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !13, line: 24, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !42)
!42 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!43 = !DILocation(line: 10, column: 13, scope: !30)
!44 = !DILocalVariable(name: "uold", scope: !30, file: !31, line: 11, type: !40)
!45 = !DILocation(line: 11, column: 13, scope: !30)
!46 = !DILocalVariable(name: "m", scope: !30, file: !31, line: 12, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !13, line: 25, baseType: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !49)
!49 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 12, column: 14, scope: !30)
!51 = !DILocalVariable(name: "result", scope: !30, file: !31, line: 13, type: !35)
!52 = !DILocation(line: 13, column: 13, scope: !30)
!53 = !DILocation(line: 15, column: 24, scope: !30)
!54 = !DILocation(line: 15, column: 5, scope: !30)
!55 = !DILocation(line: 16, column: 5, scope: !30)
!56 = !DILocation(line: 17, column: 5, scope: !30)
!57 = !DILocation(line: 18, column: 24, scope: !30)
!58 = !DILocation(line: 18, column: 5, scope: !30)
!59 = !DILocation(line: 20, column: 42, scope: !30)
!60 = !DILocation(line: 20, column: 48, scope: !30)
!61 = !DILocation(line: 20, column: 51, scope: !30)
!62 = !DILocation(line: 20, column: 57, scope: !30)
!63 = !DILocation(line: 20, column: 14, scope: !30)
!64 = !DILocation(line: 20, column: 12, scope: !30)
!65 = !DILocation(line: 22, column: 11, scope: !30)
!66 = !DILocation(line: 23, column: 5, scope: !30)
!67 = distinct !DISubprogram(name: "s16_hip1_s16_u8_u8_u16_fac1", scope: !68, file: !68, line: 44, type: !69, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DIFile(filename: "src_analysis/sources/hip_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066")
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !73, !73, !74}
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !72, line: 9, baseType: !35)
!72 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !72, line: 6, baseType: !40)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !72, line: 8, baseType: !47)
!75 = !DILocalVariable(name: "yold", arg: 1, scope: !67, file: !68, line: 44, type: !71)
!76 = !DILocation(line: 44, column: 37, scope: !67)
!77 = !DILocalVariable(name: "u", arg: 2, scope: !67, file: !68, line: 44, type: !73)
!78 = !DILocation(line: 44, column: 46, scope: !67)
!79 = !DILocalVariable(name: "uold", arg: 3, scope: !67, file: !68, line: 44, type: !73)
!80 = !DILocation(line: 44, column: 52, scope: !67)
!81 = !DILocalVariable(name: "m", arg: 4, scope: !67, file: !68, line: 44, type: !74)
!82 = !DILocation(line: 44, column: 62, scope: !67)
!83 = !DILocalVariable(name: "s32Temp1", scope: !67, file: !68, line: 46, type: !84)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !72, line: 11, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !86)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!87 = !DILocation(line: 46, column: 6, scope: !67)
!88 = !DILocalVariable(name: "s32Temp2", scope: !67, file: !68, line: 46, type: !84)
!89 = !DILocation(line: 46, column: 20, scope: !67)
!90 = !DILocalVariable(name: "s16u", scope: !67, file: !68, line: 47, type: !71)
!91 = !DILocation(line: 47, column: 6, scope: !67)
!92 = !DILocalVariable(name: "u16uold", scope: !67, file: !68, line: 48, type: !74)
!93 = !DILocation(line: 48, column: 6, scope: !67)
!94 = !DILocation(line: 50, column: 67, scope: !95)
!95 = distinct !DILexicalBlock(scope: !67, file: !68, line: 50, column: 6)
!96 = !DILocation(line: 50, column: 62, scope: !95)
!97 = !DILocation(line: 50, column: 76, scope: !95)
!98 = !DILocation(line: 50, column: 71, scope: !95)
!99 = !DILocation(line: 50, column: 69, scope: !95)
!100 = !DILocation(line: 50, column: 46, scope: !95)
!101 = !DILocation(line: 50, column: 8, scope: !95)
!102 = !DILocation(line: 50, column: 6, scope: !67)
!103 = !DILocation(line: 51, column: 6, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !68, line: 50, column: 86)
!105 = !DILocation(line: 53, column: 13, scope: !67)
!106 = !DILocation(line: 53, column: 17, scope: !67)
!107 = !DILocation(line: 53, column: 15, scope: !67)
!108 = !DILocation(line: 53, column: 23, scope: !67)
!109 = !DILocation(line: 53, column: 12, scope: !67)
!110 = !DILocation(line: 53, column: 10, scope: !67)
!111 = !DILocation(line: 54, column: 13, scope: !67)
!112 = !DILocation(line: 54, column: 20, scope: !67)
!113 = !DILocation(line: 54, column: 18, scope: !67)
!114 = !DILocation(line: 54, column: 11, scope: !67)
!115 = !DILocation(line: 55, column: 14, scope: !67)
!116 = !DILocation(line: 55, column: 22, scope: !67)
!117 = !DILocation(line: 55, column: 32, scope: !67)
!118 = !DILocation(line: 55, column: 11, scope: !67)
!119 = !DILocation(line: 57, column: 43, scope: !120)
!120 = distinct !DILexicalBlock(scope: !67, file: !68, line: 57, column: 6)
!121 = !DILocation(line: 57, column: 33, scope: !120)
!122 = !DILocation(line: 57, column: 64, scope: !120)
!123 = !DILocation(line: 57, column: 54, scope: !120)
!124 = !DILocation(line: 57, column: 8, scope: !120)
!125 = !DILocation(line: 57, column: 6, scope: !67)
!126 = !DILocation(line: 58, column: 6, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !68, line: 57, column: 77)
!128 = !DILocation(line: 61, column: 43, scope: !129)
!129 = distinct !DILexicalBlock(scope: !67, file: !68, line: 61, column: 6)
!130 = !DILocation(line: 61, column: 33, scope: !129)
!131 = !DILocation(line: 61, column: 64, scope: !129)
!132 = !DILocation(line: 61, column: 54, scope: !129)
!133 = !DILocation(line: 61, column: 8, scope: !129)
!134 = !DILocation(line: 61, column: 6, scope: !67)
!135 = !DILocation(line: 62, column: 6, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !68, line: 61, column: 77)
!137 = !DILocation(line: 64, column: 13, scope: !67)
!138 = !DILocation(line: 64, column: 24, scope: !67)
!139 = !DILocation(line: 64, column: 22, scope: !67)
!140 = !DILocation(line: 64, column: 11, scope: !67)
!141 = !DILocation(line: 66, column: 46, scope: !142)
!142 = distinct !DILexicalBlock(scope: !67, file: !68, line: 66, column: 6)
!143 = !DILocation(line: 66, column: 36, scope: !142)
!144 = !DILocation(line: 66, column: 8, scope: !142)
!145 = !DILocation(line: 66, column: 6, scope: !67)
!146 = !DILocation(line: 67, column: 6, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !68, line: 66, column: 74)
!148 = !DILocation(line: 70, column: 56, scope: !149)
!149 = distinct !DILexicalBlock(scope: !67, file: !68, line: 70, column: 6)
!150 = !DILocation(line: 70, column: 46, scope: !149)
!151 = !DILocation(line: 70, column: 8, scope: !149)
!152 = !DILocation(line: 70, column: 6, scope: !67)
!153 = !DILocation(line: 71, column: 6, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !68, line: 70, column: 69)
!155 = !DILocation(line: 78, column: 34, scope: !67)
!156 = !DILocation(line: 78, column: 43, scope: !67)
!157 = !DILocation(line: 78, column: 24, scope: !67)
!158 = !DILocation(line: 78, column: 22, scope: !67)
!159 = !DILocation(line: 79, column: 2, scope: !67)
!160 = !DILocation(line: 164, column: 1, scope: !67)
!161 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !17, file: !17, line: 84, type: !162, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DISubroutineType(types: !163)
!163 = !{!11, !6}
!164 = !DILocalVariable(name: "left", arg: 1, scope: !161, file: !17, line: 84, type: !6)
!165 = !DILocation(line: 84, column: 51, scope: !161)
!166 = !DILocation(line: 86, column: 12, scope: !161)
!167 = !DILocation(line: 86, column: 17, scope: !161)
!168 = !DILocation(line: 86, column: 5, scope: !161)
!169 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !17, file: !17, line: 60, type: !170, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DISubroutineType(types: !171)
!171 = !{!11, !6, !6}
!172 = !DILocalVariable(name: "left", arg: 1, scope: !169, file: !17, line: 60, type: !6)
!173 = !DILocation(line: 60, column: 38, scope: !169)
!174 = !DILocalVariable(name: "right", arg: 2, scope: !169, file: !17, line: 60, type: !6)
!175 = !DILocation(line: 60, column: 52, scope: !169)
!176 = !DILocation(line: 62, column: 12, scope: !169)
!177 = !DILocation(line: 62, column: 19, scope: !169)
!178 = !DILocation(line: 62, column: 17, scope: !169)
!179 = !DILocation(line: 62, column: 25, scope: !169)
!180 = !DILocation(line: 62, column: 5, scope: !169)
!181 = distinct !DISubprogram(name: "klee_alarm_s32_sub_upper", scope: !17, file: !17, line: 66, type: !170, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DILocalVariable(name: "left", arg: 1, scope: !181, file: !17, line: 66, type: !6)
!183 = !DILocation(line: 66, column: 38, scope: !181)
!184 = !DILocalVariable(name: "right", arg: 2, scope: !181, file: !17, line: 66, type: !6)
!185 = !DILocation(line: 66, column: 52, scope: !181)
!186 = !DILocation(line: 68, column: 12, scope: !181)
!187 = !DILocation(line: 68, column: 19, scope: !181)
!188 = !DILocation(line: 68, column: 17, scope: !181)
!189 = !DILocation(line: 68, column: 25, scope: !181)
!190 = !DILocation(line: 68, column: 5, scope: !181)
!191 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !17, file: !17, line: 90, type: !192, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!192 = !DISubroutineType(types: !193)
!193 = !{!11, !6, !12}
!194 = !DILocalVariable(name: "left", arg: 1, scope: !191, file: !17, line: 90, type: !6)
!195 = !DILocation(line: 90, column: 41, scope: !191)
!196 = !DILocalVariable(name: "count", arg: 2, scope: !191, file: !17, line: 90, type: !12)
!197 = !DILocation(line: 90, column: 56, scope: !191)
!198 = !DILocation(line: 92, column: 9, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !17, line: 92, column: 9)
!200 = !DILocation(line: 92, column: 15, scope: !199)
!201 = !DILocation(line: 92, column: 9, scope: !191)
!202 = !DILocation(line: 93, column: 9, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !17, line: 92, column: 32)
!204 = !DILocation(line: 95, column: 12, scope: !191)
!205 = !DILocation(line: 95, column: 34, scope: !191)
!206 = !DILocation(line: 95, column: 31, scope: !191)
!207 = !{!"True"}
!208 = !DILocation(line: 95, column: 17, scope: !191)
!209 = !DILocation(line: 95, column: 41, scope: !191)
!210 = !DILocation(line: 95, column: 5, scope: !191)
!211 = !DILocation(line: 96, column: 1, scope: !191)
!212 = distinct !DISubprogram(name: "s16_hip1_s16_s8_s8_u16_fac1", scope: !68, file: !68, line: 184, type: !213, scopeLine: 185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!213 = !DISubroutineType(types: !214)
!214 = !{!71, !71, !215, !215, !74}
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !72, line: 7, baseType: !216)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 24, baseType: !217)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 37, baseType: !218)
!218 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!219 = !DILocalVariable(name: "yold", arg: 1, scope: !212, file: !68, line: 184, type: !71)
!220 = !DILocation(line: 184, column: 37, scope: !212)
!221 = !DILocalVariable(name: "u", arg: 2, scope: !212, file: !68, line: 184, type: !215)
!222 = !DILocation(line: 184, column: 46, scope: !212)
!223 = !DILocalVariable(name: "uold", arg: 3, scope: !212, file: !68, line: 184, type: !215)
!224 = !DILocation(line: 184, column: 52, scope: !212)
!225 = !DILocalVariable(name: "m", arg: 4, scope: !212, file: !68, line: 184, type: !74)
!226 = !DILocation(line: 184, column: 62, scope: !212)
!227 = !DILocalVariable(name: "s32Temp1", scope: !212, file: !68, line: 186, type: !84)
!228 = !DILocation(line: 186, column: 6, scope: !212)
!229 = !DILocalVariable(name: "s32Temp2", scope: !212, file: !68, line: 186, type: !84)
!230 = !DILocation(line: 186, column: 20, scope: !212)
!231 = !DILocalVariable(name: "s16u", scope: !212, file: !68, line: 187, type: !84)
!232 = !DILocation(line: 187, column: 6, scope: !212)
!233 = !DILocalVariable(name: "s16uold", scope: !212, file: !68, line: 188, type: !71)
!234 = !DILocation(line: 188, column: 6, scope: !212)
!235 = !DILocation(line: 189, column: 13, scope: !212)
!236 = !DILocation(line: 189, column: 17, scope: !212)
!237 = !DILocation(line: 189, column: 15, scope: !212)
!238 = !DILocation(line: 189, column: 23, scope: !212)
!239 = !DILocation(line: 189, column: 12, scope: !212)
!240 = !DILocation(line: 189, column: 10, scope: !212)
!241 = !DILocation(line: 190, column: 13, scope: !212)
!242 = !DILocation(line: 190, column: 20, scope: !212)
!243 = !DILocation(line: 190, column: 18, scope: !212)
!244 = !DILocation(line: 190, column: 11, scope: !212)
!245 = !DILocation(line: 191, column: 14, scope: !212)
!246 = !DILocation(line: 191, column: 22, scope: !212)
!247 = !DILocation(line: 191, column: 32, scope: !212)
!248 = !DILocation(line: 191, column: 11, scope: !212)
!249 = !DILocation(line: 192, column: 13, scope: !212)
!250 = !DILocation(line: 192, column: 24, scope: !212)
!251 = !DILocation(line: 192, column: 22, scope: !212)
!252 = !DILocation(line: 192, column: 11, scope: !212)
!253 = !DILocation(line: 193, column: 13, scope: !212)
!254 = !DILocation(line: 193, column: 22, scope: !212)
!255 = !DILocation(line: 193, column: 11, scope: !212)
!256 = !DILocation(line: 194, column: 13, scope: !212)
!257 = !DILocation(line: 194, column: 22, scope: !212)
!258 = !DILocation(line: 194, column: 11, scope: !212)
!259 = !DILocation(line: 195, column: 13, scope: !212)
!260 = !DILocation(line: 195, column: 25, scope: !212)
!261 = !DILocation(line: 195, column: 33, scope: !212)
!262 = !DILocation(line: 195, column: 22, scope: !212)
!263 = !DILocation(line: 195, column: 11, scope: !212)
!264 = !DILocation(line: 196, column: 13, scope: !212)
!265 = !DILocation(line: 196, column: 20, scope: !212)
!266 = !DILocation(line: 196, column: 18, scope: !212)
!267 = !DILocation(line: 196, column: 11, scope: !212)
!268 = !DILocation(line: 197, column: 9, scope: !212)
!269 = !DILocation(line: 197, column: 20, scope: !212)
!270 = !DILocation(line: 197, column: 18, scope: !212)
!271 = !DILocation(line: 197, column: 7, scope: !212)
!272 = !DILocation(line: 198, column: 5, scope: !273)
!273 = distinct !DILexicalBlock(scope: !212, file: !68, line: 198, column: 5)
!274 = !DILocation(line: 198, column: 13, scope: !273)
!275 = !DILocation(line: 198, column: 10, scope: !273)
!276 = !DILocation(line: 198, column: 5, scope: !212)
!277 = !DILocation(line: 200, column: 6, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !68, line: 200, column: 6)
!279 = distinct !DILexicalBlock(scope: !273, file: !68, line: 199, column: 2)
!280 = !DILocation(line: 200, column: 11, scope: !278)
!281 = !DILocation(line: 200, column: 6, scope: !279)
!282 = !DILocation(line: 202, column: 7, scope: !283)
!283 = distinct !DILexicalBlock(scope: !284, file: !68, line: 202, column: 7)
!284 = distinct !DILexicalBlock(scope: !278, file: !68, line: 201, column: 3)
!285 = !DILocation(line: 202, column: 12, scope: !283)
!286 = !DILocation(line: 202, column: 7, scope: !284)
!287 = !DILocation(line: 204, column: 12, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !68, line: 203, column: 4)
!289 = !DILocation(line: 204, column: 5, scope: !288)
!290 = !DILocation(line: 208, column: 5, scope: !291)
!291 = distinct !DILexicalBlock(scope: !283, file: !68, line: 207, column: 4)
!292 = !DILocation(line: 213, column: 4, scope: !293)
!293 = distinct !DILexicalBlock(scope: !278, file: !68, line: 212, column: 3)
!294 = !DILocation(line: 218, column: 6, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !68, line: 218, column: 6)
!296 = distinct !DILexicalBlock(scope: !273, file: !68, line: 217, column: 2)
!297 = !DILocation(line: 218, column: 11, scope: !295)
!298 = !DILocation(line: 218, column: 6, scope: !296)
!299 = !DILocation(line: 220, column: 7, scope: !300)
!300 = distinct !DILexicalBlock(scope: !301, file: !68, line: 220, column: 7)
!301 = distinct !DILexicalBlock(scope: !295, file: !68, line: 219, column: 3)
!302 = !DILocation(line: 220, column: 12, scope: !300)
!303 = !DILocation(line: 220, column: 7, scope: !301)
!304 = !DILocation(line: 222, column: 8, scope: !305)
!305 = distinct !DILexicalBlock(scope: !306, file: !68, line: 222, column: 8)
!306 = distinct !DILexicalBlock(scope: !300, file: !68, line: 221, column: 4)
!307 = !DILocation(line: 222, column: 13, scope: !305)
!308 = !DILocation(line: 222, column: 8, scope: !306)
!309 = !DILocation(line: 224, column: 9, scope: !310)
!310 = distinct !DILexicalBlock(scope: !311, file: !68, line: 224, column: 9)
!311 = distinct !DILexicalBlock(scope: !305, file: !68, line: 223, column: 5)
!312 = !DILocation(line: 224, column: 14, scope: !310)
!313 = !DILocation(line: 224, column: 9, scope: !311)
!314 = !DILocation(line: 226, column: 14, scope: !315)
!315 = distinct !DILexicalBlock(scope: !310, file: !68, line: 225, column: 6)
!316 = !DILocation(line: 226, column: 7, scope: !315)
!317 = !DILocation(line: 230, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !310, file: !68, line: 229, column: 6)
!319 = !DILocation(line: 235, column: 6, scope: !320)
!320 = distinct !DILexicalBlock(scope: !305, file: !68, line: 234, column: 5)
!321 = !DILocation(line: 240, column: 12, scope: !322)
!322 = distinct !DILexicalBlock(scope: !300, file: !68, line: 239, column: 4)
!323 = !DILocation(line: 240, column: 17, scope: !322)
!324 = !DILocation(line: 240, column: 10, scope: !322)
!325 = !DILocation(line: 241, column: 8, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !68, line: 241, column: 8)
!327 = !DILocation(line: 241, column: 13, scope: !326)
!328 = !DILocation(line: 241, column: 8, scope: !322)
!329 = !DILocation(line: 243, column: 9, scope: !330)
!330 = distinct !DILexicalBlock(scope: !331, file: !68, line: 243, column: 9)
!331 = distinct !DILexicalBlock(scope: !326, file: !68, line: 242, column: 5)
!332 = !DILocation(line: 243, column: 14, scope: !330)
!333 = !DILocation(line: 243, column: 9, scope: !331)
!334 = !DILocation(line: 245, column: 14, scope: !335)
!335 = distinct !DILexicalBlock(scope: !330, file: !68, line: 244, column: 6)
!336 = !DILocation(line: 245, column: 7, scope: !335)
!337 = !DILocation(line: 249, column: 7, scope: !338)
!338 = distinct !DILexicalBlock(scope: !330, file: !68, line: 248, column: 6)
!339 = !DILocation(line: 254, column: 6, scope: !340)
!340 = distinct !DILexicalBlock(scope: !326, file: !68, line: 253, column: 5)
!341 = !DILocation(line: 260, column: 11, scope: !342)
!342 = distinct !DILexicalBlock(scope: !295, file: !68, line: 259, column: 3)
!343 = !DILocation(line: 260, column: 16, scope: !342)
!344 = !DILocation(line: 260, column: 9, scope: !342)
!345 = !DILocation(line: 261, column: 7, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !68, line: 261, column: 7)
!347 = !DILocation(line: 261, column: 12, scope: !346)
!348 = !DILocation(line: 261, column: 7, scope: !342)
!349 = !DILocation(line: 263, column: 8, scope: !350)
!350 = distinct !DILexicalBlock(scope: !351, file: !68, line: 263, column: 8)
!351 = distinct !DILexicalBlock(scope: !346, file: !68, line: 262, column: 4)
!352 = !DILocation(line: 263, column: 13, scope: !350)
!353 = !DILocation(line: 263, column: 8, scope: !351)
!354 = !DILocation(line: 265, column: 13, scope: !355)
!355 = distinct !DILexicalBlock(scope: !350, file: !68, line: 264, column: 5)
!356 = !DILocation(line: 265, column: 6, scope: !355)
!357 = !DILocation(line: 269, column: 6, scope: !358)
!358 = distinct !DILexicalBlock(scope: !350, file: !68, line: 268, column: 5)
!359 = !DILocation(line: 274, column: 5, scope: !360)
!360 = distinct !DILexicalBlock(scope: !346, file: !68, line: 273, column: 4)
!361 = !DILocation(line: 278, column: 1, scope: !212)
!362 = distinct !DISubprogram(name: "s32_hip1_s32_u16_u16_u16_fac1", scope: !68, file: !68, line: 298, type: !363, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!363 = !DISubroutineType(types: !364)
!364 = !{!84, !84, !74, !74, !74}
!365 = !DILocalVariable(name: "yold", arg: 1, scope: !362, file: !68, line: 298, type: !84)
!366 = !DILocation(line: 298, column: 39, scope: !362)
!367 = !DILocalVariable(name: "u", arg: 2, scope: !362, file: !68, line: 298, type: !74)
!368 = !DILocation(line: 298, column: 49, scope: !362)
!369 = !DILocalVariable(name: "uold", arg: 3, scope: !362, file: !68, line: 298, type: !74)
!370 = !DILocation(line: 298, column: 56, scope: !362)
!371 = !DILocalVariable(name: "m", arg: 4, scope: !362, file: !68, line: 298, type: !74)
!372 = !DILocation(line: 298, column: 66, scope: !362)
!373 = !DILocalVariable(name: "s32TempHW", scope: !362, file: !68, line: 300, type: !84)
!374 = !DILocation(line: 300, column: 6, scope: !362)
!375 = !DILocalVariable(name: "s32TempLW", scope: !362, file: !68, line: 300, type: !84)
!376 = !DILocation(line: 300, column: 21, scope: !362)
!377 = !DILocalVariable(name: "s32Temp0", scope: !362, file: !68, line: 300, type: !84)
!378 = !DILocation(line: 300, column: 37, scope: !362)
!379 = !DILocalVariable(name: "s32Temp1", scope: !362, file: !68, line: 300, type: !84)
!380 = !DILocation(line: 300, column: 52, scope: !362)
!381 = !DILocalVariable(name: "s32Result", scope: !362, file: !68, line: 300, type: !84)
!382 = !DILocation(line: 300, column: 66, scope: !362)
!383 = !DILocation(line: 301, column: 6, scope: !362)
!384 = !DILocation(line: 301, column: 8, scope: !362)
!385 = !DILocation(line: 301, column: 4, scope: !362)
!386 = !DILocation(line: 302, column: 26, scope: !362)
!387 = !DILocation(line: 302, column: 31, scope: !362)
!388 = !DILocation(line: 302, column: 14, scope: !362)
!389 = !DILocation(line: 302, column: 12, scope: !362)
!390 = !DILocation(line: 303, column: 14, scope: !362)
!391 = !DILocation(line: 303, column: 21, scope: !362)
!392 = !DILocation(line: 303, column: 19, scope: !362)
!393 = !DILocation(line: 303, column: 12, scope: !362)
!394 = !DILocation(line: 304, column: 26, scope: !362)
!395 = !DILocation(line: 304, column: 14, scope: !362)
!396 = !DILocation(line: 304, column: 42, scope: !362)
!397 = !DILocation(line: 304, column: 59, scope: !362)
!398 = !DILocation(line: 304, column: 69, scope: !362)
!399 = !DILocation(line: 304, column: 56, scope: !362)
!400 = !DILocation(line: 304, column: 11, scope: !362)
!401 = !DILocation(line: 305, column: 14, scope: !362)
!402 = !DILocation(line: 305, column: 18, scope: !362)
!403 = !DILocation(line: 305, column: 16, scope: !362)
!404 = !DILocation(line: 305, column: 11, scope: !362)
!405 = !DILocation(line: 306, column: 14, scope: !362)
!406 = !DILocation(line: 306, column: 21, scope: !362)
!407 = !DILocation(line: 306, column: 19, scope: !362)
!408 = !DILocation(line: 306, column: 33, scope: !362)
!409 = !DILocation(line: 306, column: 42, scope: !362)
!410 = !DILocation(line: 306, column: 30, scope: !362)
!411 = !DILocation(line: 306, column: 12, scope: !362)
!412 = !DILocation(line: 307, column: 5, scope: !413)
!413 = distinct !DILexicalBlock(scope: !362, file: !68, line: 307, column: 5)
!414 = !DILocation(line: 307, column: 18, scope: !413)
!415 = !DILocation(line: 307, column: 15, scope: !413)
!416 = !DILocation(line: 307, column: 5, scope: !362)
!417 = !DILocation(line: 309, column: 6, scope: !418)
!418 = distinct !DILexicalBlock(scope: !419, file: !68, line: 309, column: 6)
!419 = distinct !DILexicalBlock(scope: !413, file: !68, line: 308, column: 2)
!420 = !DILocation(line: 309, column: 11, scope: !418)
!421 = !DILocation(line: 309, column: 6, scope: !419)
!422 = !DILocation(line: 311, column: 12, scope: !423)
!423 = distinct !DILexicalBlock(scope: !418, file: !68, line: 310, column: 3)
!424 = !DILocation(line: 311, column: 22, scope: !423)
!425 = !DILocation(line: 311, column: 4, scope: !423)
!426 = !DILocation(line: 315, column: 12, scope: !427)
!427 = distinct !DILexicalBlock(scope: !418, file: !68, line: 314, column: 3)
!428 = !DILocation(line: 315, column: 22, scope: !427)
!429 = !DILocation(line: 315, column: 4, scope: !427)
!430 = !DILocation(line: 320, column: 10, scope: !431)
!431 = distinct !DILexicalBlock(scope: !413, file: !68, line: 319, column: 2)
!432 = !DILocation(line: 320, column: 3, scope: !431)
!433 = !DILocation(line: 322, column: 1, scope: !362)
!434 = distinct !DISubprogram(name: "s32_hip1_s32_s16_s16_u16_fac1", scope: !68, file: !68, line: 342, type: !435, scopeLine: 343, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!435 = !DISubroutineType(types: !436)
!436 = !{!84, !84, !71, !71, !74}
!437 = !DILocalVariable(name: "yold", arg: 1, scope: !434, file: !68, line: 342, type: !84)
!438 = !DILocation(line: 342, column: 39, scope: !434)
!439 = !DILocalVariable(name: "u", arg: 2, scope: !434, file: !68, line: 342, type: !71)
!440 = !DILocation(line: 342, column: 49, scope: !434)
!441 = !DILocalVariable(name: "uold", arg: 3, scope: !434, file: !68, line: 342, type: !71)
!442 = !DILocation(line: 342, column: 56, scope: !434)
!443 = !DILocalVariable(name: "m", arg: 4, scope: !434, file: !68, line: 342, type: !74)
!444 = !DILocation(line: 342, column: 66, scope: !434)
!445 = !DILocalVariable(name: "s32TempHW", scope: !434, file: !68, line: 344, type: !84)
!446 = !DILocation(line: 344, column: 6, scope: !434)
!447 = !DILocalVariable(name: "s32TempLW", scope: !434, file: !68, line: 344, type: !84)
!448 = !DILocation(line: 344, column: 21, scope: !434)
!449 = !DILocalVariable(name: "s32Temp0", scope: !434, file: !68, line: 344, type: !84)
!450 = !DILocation(line: 344, column: 37, scope: !434)
!451 = !DILocalVariable(name: "s32Temp1", scope: !434, file: !68, line: 344, type: !84)
!452 = !DILocation(line: 344, column: 52, scope: !434)
!453 = !DILocalVariable(name: "s32Result", scope: !434, file: !68, line: 344, type: !84)
!454 = !DILocation(line: 344, column: 66, scope: !434)
!455 = !DILocation(line: 345, column: 6, scope: !434)
!456 = !DILocation(line: 345, column: 8, scope: !434)
!457 = !DILocation(line: 345, column: 4, scope: !434)
!458 = !DILocation(line: 346, column: 26, scope: !434)
!459 = !DILocation(line: 346, column: 31, scope: !434)
!460 = !DILocation(line: 346, column: 14, scope: !434)
!461 = !DILocation(line: 346, column: 12, scope: !434)
!462 = !DILocation(line: 347, column: 14, scope: !434)
!463 = !DILocation(line: 347, column: 21, scope: !434)
!464 = !DILocation(line: 347, column: 19, scope: !434)
!465 = !DILocation(line: 347, column: 12, scope: !434)
!466 = !DILocation(line: 348, column: 26, scope: !434)
!467 = !DILocation(line: 348, column: 14, scope: !434)
!468 = !DILocation(line: 348, column: 42, scope: !434)
!469 = !DILocation(line: 348, column: 59, scope: !434)
!470 = !DILocation(line: 348, column: 69, scope: !434)
!471 = !DILocation(line: 348, column: 56, scope: !434)
!472 = !DILocation(line: 348, column: 11, scope: !434)
!473 = !DILocation(line: 349, column: 14, scope: !434)
!474 = !DILocation(line: 349, column: 18, scope: !434)
!475 = !DILocation(line: 349, column: 16, scope: !434)
!476 = !DILocation(line: 349, column: 11, scope: !434)
!477 = !DILocation(line: 350, column: 14, scope: !434)
!478 = !DILocation(line: 350, column: 21, scope: !434)
!479 = !DILocation(line: 350, column: 19, scope: !434)
!480 = !DILocation(line: 350, column: 33, scope: !434)
!481 = !DILocation(line: 350, column: 42, scope: !434)
!482 = !DILocation(line: 350, column: 30, scope: !434)
!483 = !DILocation(line: 350, column: 12, scope: !434)
!484 = !DILocation(line: 351, column: 5, scope: !485)
!485 = distinct !DILexicalBlock(scope: !434, file: !68, line: 351, column: 5)
!486 = !DILocation(line: 351, column: 18, scope: !485)
!487 = !DILocation(line: 351, column: 15, scope: !485)
!488 = !DILocation(line: 351, column: 5, scope: !434)
!489 = !DILocation(line: 353, column: 6, scope: !490)
!490 = distinct !DILexicalBlock(scope: !491, file: !68, line: 353, column: 6)
!491 = distinct !DILexicalBlock(scope: !485, file: !68, line: 352, column: 2)
!492 = !DILocation(line: 353, column: 11, scope: !490)
!493 = !DILocation(line: 353, column: 6, scope: !491)
!494 = !DILocation(line: 355, column: 12, scope: !495)
!495 = distinct !DILexicalBlock(scope: !490, file: !68, line: 354, column: 3)
!496 = !DILocation(line: 355, column: 22, scope: !495)
!497 = !DILocation(line: 355, column: 4, scope: !495)
!498 = !DILocation(line: 359, column: 12, scope: !499)
!499 = distinct !DILexicalBlock(scope: !490, file: !68, line: 358, column: 3)
!500 = !DILocation(line: 359, column: 22, scope: !499)
!501 = !DILocation(line: 359, column: 4, scope: !499)
!502 = !DILocation(line: 364, column: 10, scope: !503)
!503 = distinct !DILexicalBlock(scope: !485, file: !68, line: 363, column: 2)
!504 = !DILocation(line: 364, column: 3, scope: !503)
!505 = !DILocation(line: 366, column: 1, scope: !434)
!506 = distinct !DISubprogram(name: "klee_overshift_check", scope: !507, file: !507, line: 20, type: !508, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !21, retainedNodes: !511)
!507 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!508 = !DISubroutineType(types: !509)
!509 = !{null, !510, !510}
!510 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!511 = !{!512, !513}
!512 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !506, file: !507, line: 20, type: !510)
!513 = !DILocalVariable(name: "shift", arg: 2, scope: !506, file: !507, line: 20, type: !510)
!514 = !DILocation(line: 0, scope: !506)
!515 = !DILocation(line: 21, column: 13, scope: !516)
!516 = distinct !DILexicalBlock(scope: !506, file: !507, line: 21, column: 7)
!517 = !DILocation(line: 21, column: 7, scope: !506)
!518 = !DILocation(line: 27, column: 5, scope: !519)
!519 = distinct !DILexicalBlock(scope: !516, file: !507, line: 21, column: 26)
!520 = !DILocation(line: 29, column: 1, scope: !506)
