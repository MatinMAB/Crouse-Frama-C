; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0062.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"yold\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"uold\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/hip_Ccode.c\00", align 1
@.str.1.5 = private unnamed_addr constant [70 x i8] c"KLEE-ALARM-0062: signed overflow. assert s32Temp2 << 1 <= 2147483647;\00", align 1
@.str.2.6 = private unnamed_addr constant [20 x i8] c"klee-alarm-0062.err\00", align 1
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
  %call = call signext i16 @s16_hip1_s16_s8_s8_u16_fac1(i16 signext %2, i8 signext %3, i8 signext %4, i16 zeroext %5), !dbg !63
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
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !86, metadata !DIExpression()), !dbg !90
  store i32 0, i32* %s32Temp1, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !91, metadata !DIExpression()), !dbg !92
  store i32 0, i32* %s32Temp2, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i16* %s16u, metadata !93, metadata !DIExpression()), !dbg !94
  store i16 0, i16* %s16u, align 2, !dbg !94
  call void @llvm.dbg.declare(metadata i16* %u16uold, metadata !95, metadata !DIExpression()), !dbg !96
  store i16 0, i16* %u16uold, align 2, !dbg !96
  %0 = load i8, i8* %u.addr, align 1, !dbg !97
  %conv = zext i8 %0 to i32, !dbg !97
  %1 = load i8, i8* %uold.addr, align 1, !dbg !98
  %conv1 = zext i8 %1 to i32, !dbg !98
  %sub = sub nsw i32 %conv, %conv1, !dbg !99
  %shl = shl i32 %sub, 7, !dbg !100
  %conv2 = trunc i32 %shl to i16, !dbg !101
  store i16 %conv2, i16* %u16uold, align 2, !dbg !102
  %2 = load i16, i16* %yold.addr, align 2, !dbg !103
  %conv3 = sext i16 %2 to i32, !dbg !103
  %3 = load i16, i16* %m.addr, align 2, !dbg !104
  %conv4 = zext i16 %3 to i32, !dbg !104
  %mul = mul nsw i32 %conv3, %conv4, !dbg !105
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !106
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !107
  %div = sdiv i32 %4, 65536, !dbg !108
  %mul5 = mul nsw i32 %div, 65536, !dbg !109
  store i32 %mul5, i32* %s32Temp2, align 4, !dbg !110
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !111
  %6 = load i32, i32* %s32Temp2, align 4, !dbg !112
  %sub6 = sub nsw i32 %5, %6, !dbg !113
  store i32 %sub6, i32* %s32Temp2, align 4, !dbg !114
  %7 = load i32, i32* %s32Temp2, align 4, !dbg !115
  %shl7 = shl i32 %7, 1, !dbg !116
  store i32 %shl7, i32* %s32Temp2, align 4, !dbg !117
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !118
  %div8 = sdiv i32 %8, 65536, !dbg !119
  store i32 %div8, i32* %s32Temp2, align 4, !dbg !120
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !121
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !122
  %div9 = sdiv i32 %10, 65536, !dbg !123
  %add = add nsw i32 %9, %div9, !dbg !124
  store i32 %add, i32* %s32Temp2, align 4, !dbg !125
  %11 = load i16, i16* %yold.addr, align 2, !dbg !126
  %conv10 = sext i16 %11 to i32, !dbg !126
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !127
  %sub11 = sub nsw i32 %conv10, %12, !dbg !128
  store i32 %sub11, i32* %s32Temp2, align 4, !dbg !129
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !130
  %14 = load i16, i16* %u16uold, align 2, !dbg !131
  %conv12 = zext i16 %14 to i32, !dbg !131
  %add13 = add nsw i32 %13, %conv12, !dbg !132
  %conv14 = trunc i32 %add13 to i16, !dbg !130
  store i16 %conv14, i16* %s16u, align 2, !dbg !133
  %15 = load i16, i16* %yold.addr, align 2, !dbg !134
  %conv15 = sext i16 %15 to i32, !dbg !134
  %16 = load i16, i16* %s16u, align 2, !dbg !136
  %conv16 = sext i16 %16 to i32, !dbg !136
  %cmp = icmp ne i32 %conv15, %conv16, !dbg !137
  br i1 %cmp, label %if.then, label %if.else27, !dbg !138

if.then:                                          ; preds = %entry
  %17 = load i16, i16* %s16u, align 2, !dbg !139
  %conv18 = sext i16 %17 to i32, !dbg !139
  %cmp19 = icmp sle i32 %conv18, 32767, !dbg !142
  br i1 %cmp19, label %if.then21, label %if.else26, !dbg !143

if.then21:                                        ; preds = %if.then
  %18 = load i16, i16* %s16u, align 2, !dbg !144
  %conv22 = sext i16 %18 to i32, !dbg !144
  %cmp23 = icmp sge i32 %conv22, -32768, !dbg !147
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !148

if.then25:                                        ; preds = %if.then21
  %19 = load i16, i16* %s16u, align 2, !dbg !149
  store i16 %19, i16* %retval, align 2, !dbg !151
  br label %return, !dbg !151

if.else:                                          ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !152
  br label %return, !dbg !152

if.else26:                                        ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !154
  br label %return, !dbg !154

if.else27:                                        ; preds = %entry
  %20 = load i16, i16* %yold.addr, align 2, !dbg !156
  %conv28 = sext i16 %20 to i32, !dbg !156
  %cmp29 = icmp sle i32 %conv28, 0, !dbg !159
  br i1 %cmp29, label %if.then31, label %if.else60, !dbg !160

if.then31:                                        ; preds = %if.else27
  %21 = load i16, i16* %yold.addr, align 2, !dbg !161
  %conv32 = sext i16 %21 to i32, !dbg !161
  %cmp33 = icmp eq i32 %conv32, 0, !dbg !164
  br i1 %cmp33, label %if.then35, label %if.else46, !dbg !165

if.then35:                                        ; preds = %if.then31
  %22 = load i16, i16* %s16u, align 2, !dbg !166
  %conv36 = sext i16 %22 to i32, !dbg !166
  %cmp37 = icmp sle i32 %conv36, 32767, !dbg !169
  br i1 %cmp37, label %if.then39, label %if.else45, !dbg !170

if.then39:                                        ; preds = %if.then35
  %23 = load i16, i16* %s16u, align 2, !dbg !171
  %conv40 = sext i16 %23 to i32, !dbg !171
  %cmp41 = icmp sge i32 %conv40, -32768, !dbg !174
  br i1 %cmp41, label %if.then43, label %if.else44, !dbg !175

if.then43:                                        ; preds = %if.then39
  %24 = load i16, i16* %s16u, align 2, !dbg !176
  store i16 %24, i16* %retval, align 2, !dbg !178
  br label %return, !dbg !178

if.else44:                                        ; preds = %if.then39
  store i16 -32768, i16* %retval, align 2, !dbg !179
  br label %return, !dbg !179

if.else45:                                        ; preds = %if.then35
  store i16 32767, i16* %retval, align 2, !dbg !181
  br label %return, !dbg !181

if.else46:                                        ; preds = %if.then31
  %25 = load i16, i16* %s16u, align 2, !dbg !183
  %conv47 = sext i16 %25 to i32, !dbg !183
  %add48 = add nsw i32 %conv47, 1, !dbg !185
  %conv49 = trunc i32 %add48 to i16, !dbg !183
  store i16 %conv49, i16* %s16u, align 2, !dbg !186
  %26 = load i16, i16* %s16u, align 2, !dbg !187
  %conv50 = sext i16 %26 to i32, !dbg !187
  %cmp51 = icmp sle i32 %conv50, 32767, !dbg !189
  br i1 %cmp51, label %if.then53, label %if.else59, !dbg !190

if.then53:                                        ; preds = %if.else46
  %27 = load i16, i16* %s16u, align 2, !dbg !191
  %conv54 = sext i16 %27 to i32, !dbg !191
  %cmp55 = icmp sge i32 %conv54, -32768, !dbg !194
  br i1 %cmp55, label %if.then57, label %if.else58, !dbg !195

if.then57:                                        ; preds = %if.then53
  %28 = load i16, i16* %s16u, align 2, !dbg !196
  store i16 %28, i16* %retval, align 2, !dbg !198
  br label %return, !dbg !198

if.else58:                                        ; preds = %if.then53
  store i16 -32768, i16* %retval, align 2, !dbg !199
  br label %return, !dbg !199

if.else59:                                        ; preds = %if.else46
  store i16 32767, i16* %retval, align 2, !dbg !201
  br label %return, !dbg !201

if.else60:                                        ; preds = %if.else27
  %29 = load i16, i16* %s16u, align 2, !dbg !203
  %conv61 = sext i16 %29 to i32, !dbg !203
  %sub62 = sub nsw i32 %conv61, 1, !dbg !205
  %conv63 = trunc i32 %sub62 to i16, !dbg !203
  store i16 %conv63, i16* %s16u, align 2, !dbg !206
  %30 = load i16, i16* %s16u, align 2, !dbg !207
  %conv64 = sext i16 %30 to i32, !dbg !207
  %cmp65 = icmp sle i32 %conv64, 32767, !dbg !209
  br i1 %cmp65, label %if.then67, label %if.else73, !dbg !210

if.then67:                                        ; preds = %if.else60
  %31 = load i16, i16* %s16u, align 2, !dbg !211
  %conv68 = sext i16 %31 to i32, !dbg !211
  %cmp69 = icmp sge i32 %conv68, -32768, !dbg !214
  br i1 %cmp69, label %if.then71, label %if.else72, !dbg !215

if.then71:                                        ; preds = %if.then67
  %32 = load i16, i16* %s16u, align 2, !dbg !216
  store i16 %32, i16* %retval, align 2, !dbg !218
  br label %return, !dbg !218

if.else72:                                        ; preds = %if.then67
  store i16 -32768, i16* %retval, align 2, !dbg !219
  br label %return, !dbg !219

if.else73:                                        ; preds = %if.else60
  store i16 32767, i16* %retval, align 2, !dbg !221
  br label %return, !dbg !221

return:                                           ; preds = %if.else73, %if.else72, %if.then71, %if.else59, %if.else58, %if.then57, %if.else45, %if.else44, %if.then43, %if.else26, %if.else, %if.then25
  %33 = load i16, i16* %retval, align 2, !dbg !223
  ret i16 %33, !dbg !223
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_hip1_s16_s8_s8_u16_fac1(i16 signext %yold, i8 signext %u, i8 signext %uold, i16 zeroext %m) #0 !dbg !224 {
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
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !228, metadata !DIExpression()), !dbg !229
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !230, metadata !DIExpression()), !dbg !231
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !232, metadata !DIExpression()), !dbg !233
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 0, i32* %s32Temp1, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 0, i32* %s32Temp2, align 4, !dbg !239
  call void @llvm.dbg.declare(metadata i32* %s16u, metadata !240, metadata !DIExpression()), !dbg !241
  store i32 0, i32* %s16u, align 4, !dbg !241
  call void @llvm.dbg.declare(metadata i16* %s16uold, metadata !242, metadata !DIExpression()), !dbg !243
  store i16 0, i16* %s16uold, align 2, !dbg !243
  %0 = load i8, i8* %u.addr, align 1, !dbg !244
  %conv = sext i8 %0 to i32, !dbg !246
  %1 = load i8, i8* %uold.addr, align 1, !dbg !247
  %conv1 = sext i8 %1 to i32, !dbg !248
  %sub = sub nsw i32 %conv, %conv1, !dbg !249
  %conv2 = sext i32 %sub to i64, !dbg !250
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv2), !dbg !251
  %tobool = icmp ne i32 %call, 0, !dbg !251
  br i1 %tobool, label %if.end, label %if.then, !dbg !252

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !253
  br label %return, !dbg !253

if.end:                                           ; preds = %entry
  %2 = load i8, i8* %u.addr, align 1, !dbg !255
  %conv3 = sext i8 %2 to i32, !dbg !255
  %3 = load i8, i8* %uold.addr, align 1, !dbg !256
  %conv4 = sext i8 %3 to i32, !dbg !256
  %sub5 = sub nsw i32 %conv3, %conv4, !dbg !257
  %shl = shl i32 %sub5, 7, !dbg !258
  %conv6 = trunc i32 %shl to i16, !dbg !259
  store i16 %conv6, i16* %s16uold, align 2, !dbg !260
  %4 = load i16, i16* %yold.addr, align 2, !dbg !261
  %conv7 = sext i16 %4 to i32, !dbg !261
  %5 = load i16, i16* %m.addr, align 2, !dbg !262
  %conv8 = zext i16 %5 to i32, !dbg !262
  %mul = mul nsw i32 %conv7, %conv8, !dbg !263
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !264
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !265
  %div = sdiv i32 %6, 65536, !dbg !266
  %mul9 = mul nsw i32 %div, 65536, !dbg !267
  store i32 %mul9, i32* %s32Temp2, align 4, !dbg !268
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !269
  %conv10 = sext i32 %7 to i64, !dbg !271
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !272
  %conv11 = sext i32 %8 to i64, !dbg !273
  %call12 = call i32 @klee_alarm_s32_sub_lower(i64 %conv10, i64 %conv11), !dbg !274
  %tobool13 = icmp ne i32 %call12, 0, !dbg !274
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !275

if.then14:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !276
  br label %return, !dbg !276

if.end15:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !278
  %conv16 = sext i32 %9 to i64, !dbg !280
  %10 = load i32, i32* %s32Temp2, align 4, !dbg !281
  %conv17 = sext i32 %10 to i64, !dbg !282
  %call18 = call i32 @klee_alarm_s32_sub_upper(i64 %conv16, i64 %conv17), !dbg !283
  %tobool19 = icmp ne i32 %call18, 0, !dbg !283
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !284

if.then20:                                        ; preds = %if.end15
  store i16 0, i16* %retval, align 2, !dbg !285
  br label %return, !dbg !285

if.end21:                                         ; preds = %if.end15
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !287
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !288
  %sub22 = sub nsw i32 %11, %12, !dbg !289
  store i32 %sub22, i32* %s32Temp2, align 4, !dbg !290
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !291
  %conv23 = sext i32 %13 to i64, !dbg !293
  %call24 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv23), !dbg !294
  %tobool25 = icmp ne i32 %call24, 0, !dbg !294
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !295

if.then26:                                        ; preds = %if.end21
  store i16 0, i16* %retval, align 2, !dbg !296
  br label %return, !dbg !296

if.end27:                                         ; preds = %if.end21
  %14 = load i32, i32* %s32Temp2, align 4, !dbg !298
  %conv28 = sext i32 %14 to i64, !dbg !300
  %call29 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv28, i32 1), !dbg !301
  %tobool30 = icmp ne i32 %call29, 0, !dbg !301
  br i1 %tobool30, label %if.end32, label %if.then31, !dbg !302

if.then31:                                        ; preds = %if.end27
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i32 187, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.6, i64 0, i64 0)) #5, !dbg !303
  unreachable, !dbg !303

if.end32:                                         ; preds = %if.end27
  %15 = load i32, i32* %s32Temp2, align 4, !dbg !305
  %shl33 = shl i32 %15, 1, !dbg !306
  %conv34 = sext i32 %shl33 to i64, !dbg !307
  store volatile i64 %conv34, i64* @klee_alarm_sink_s64, align 8, !dbg !308
  store i16 0, i16* %retval, align 2, !dbg !309
  br label %return, !dbg !309

return:                                           ; preds = %if.end32, %if.then26, %if.then20, %if.then14, %if.then
  %16 = load i16, i16* %retval, align 2, !dbg !310
  ret i16 %16, !dbg !310
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !311 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !314, metadata !DIExpression()), !dbg !315
  %0 = load i64, i64* %left.addr, align 8, !dbg !316
  %cmp = icmp sge i64 %0, 0, !dbg !317
  %conv = zext i1 %cmp to i32, !dbg !317
  ret i32 %conv, !dbg !318
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !319 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !322, metadata !DIExpression()), !dbg !323
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !324, metadata !DIExpression()), !dbg !325
  %0 = load i64, i64* %left.addr, align 8, !dbg !326
  %1 = load i64, i64* %right.addr, align 8, !dbg !327
  %sub = sub nsw i64 %0, %1, !dbg !328
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !329
  %conv = zext i1 %cmp to i32, !dbg !329
  ret i32 %conv, !dbg !330
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_upper(i64 %left, i64 %right) #0 !dbg !331 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !332, metadata !DIExpression()), !dbg !333
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !334, metadata !DIExpression()), !dbg !335
  %0 = load i64, i64* %left.addr, align 8, !dbg !336
  %1 = load i64, i64* %right.addr, align 8, !dbg !337
  %sub = sub nsw i64 %0, %1, !dbg !338
  %cmp = icmp sle i64 %sub, 2147483647, !dbg !339
  %conv = zext i1 %cmp to i32, !dbg !339
  ret i32 %conv, !dbg !340
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !341 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !344, metadata !DIExpression()), !dbg !345
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !346, metadata !DIExpression()), !dbg !347
  %0 = load i32, i32* %count.addr, align 4, !dbg !348
  %cmp = icmp uge i32 %0, 63, !dbg !350
  br i1 %cmp, label %if.then, label %if.end, !dbg !351

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !352
  br label %return, !dbg !352

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !354
  %2 = load i32, i32* %count.addr, align 4, !dbg !355
  %sh_prom = zext i32 %2 to i64, !dbg !356
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !356
  %shl = shl i64 1, %sh_prom, !dbg !356, !klee.check.shift !357
  %mul = mul nsw i64 %1, %shl, !dbg !358
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !359
  %conv = zext i1 %cmp1 to i32, !dbg !359
  store i32 %conv, i32* %retval, align 4, !dbg !360
  br label %return, !dbg !360

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !361
  ret i32 %3, !dbg !361
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062/hip_Ccode_alarm_0062.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062")
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
!17 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062")
!18 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062")
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
!31 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062")
!32 = !DISubroutineType(types: !33)
!33 = !{!11}
!34 = !DILocalVariable(name: "yold", scope: !30, file: !31, line: 9, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !37)
!37 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!38 = !DILocation(line: 9, column: 13, scope: !30)
!39 = !DILocalVariable(name: "u", scope: !30, file: !31, line: 10, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 24, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 37, baseType: !42)
!42 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocation(line: 10, column: 12, scope: !30)
!44 = !DILocalVariable(name: "uold", scope: !30, file: !31, line: 11, type: !40)
!45 = !DILocation(line: 11, column: 12, scope: !30)
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
!68 = !DIFile(filename: "src_analysis/sources/hip_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062")
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !73, !73, !77}
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !72, line: 9, baseType: !35)
!72 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !72, line: 6, baseType: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !13, line: 24, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !76)
!76 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !72, line: 8, baseType: !47)
!78 = !DILocalVariable(name: "yold", arg: 1, scope: !67, file: !68, line: 44, type: !71)
!79 = !DILocation(line: 44, column: 37, scope: !67)
!80 = !DILocalVariable(name: "u", arg: 2, scope: !67, file: !68, line: 44, type: !73)
!81 = !DILocation(line: 44, column: 46, scope: !67)
!82 = !DILocalVariable(name: "uold", arg: 3, scope: !67, file: !68, line: 44, type: !73)
!83 = !DILocation(line: 44, column: 52, scope: !67)
!84 = !DILocalVariable(name: "m", arg: 4, scope: !67, file: !68, line: 44, type: !77)
!85 = !DILocation(line: 44, column: 62, scope: !67)
!86 = !DILocalVariable(name: "s32Temp1", scope: !67, file: !68, line: 46, type: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !72, line: 11, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!90 = !DILocation(line: 46, column: 6, scope: !67)
!91 = !DILocalVariable(name: "s32Temp2", scope: !67, file: !68, line: 46, type: !87)
!92 = !DILocation(line: 46, column: 20, scope: !67)
!93 = !DILocalVariable(name: "s16u", scope: !67, file: !68, line: 47, type: !71)
!94 = !DILocation(line: 47, column: 6, scope: !67)
!95 = !DILocalVariable(name: "u16uold", scope: !67, file: !68, line: 48, type: !77)
!96 = !DILocation(line: 48, column: 6, scope: !67)
!97 = !DILocation(line: 49, column: 13, scope: !67)
!98 = !DILocation(line: 49, column: 17, scope: !67)
!99 = !DILocation(line: 49, column: 15, scope: !67)
!100 = !DILocation(line: 49, column: 23, scope: !67)
!101 = !DILocation(line: 49, column: 12, scope: !67)
!102 = !DILocation(line: 49, column: 10, scope: !67)
!103 = !DILocation(line: 50, column: 13, scope: !67)
!104 = !DILocation(line: 50, column: 20, scope: !67)
!105 = !DILocation(line: 50, column: 18, scope: !67)
!106 = !DILocation(line: 50, column: 11, scope: !67)
!107 = !DILocation(line: 51, column: 14, scope: !67)
!108 = !DILocation(line: 51, column: 22, scope: !67)
!109 = !DILocation(line: 51, column: 32, scope: !67)
!110 = !DILocation(line: 51, column: 11, scope: !67)
!111 = !DILocation(line: 52, column: 13, scope: !67)
!112 = !DILocation(line: 52, column: 24, scope: !67)
!113 = !DILocation(line: 52, column: 22, scope: !67)
!114 = !DILocation(line: 52, column: 11, scope: !67)
!115 = !DILocation(line: 53, column: 13, scope: !67)
!116 = !DILocation(line: 53, column: 22, scope: !67)
!117 = !DILocation(line: 53, column: 11, scope: !67)
!118 = !DILocation(line: 54, column: 13, scope: !67)
!119 = !DILocation(line: 54, column: 22, scope: !67)
!120 = !DILocation(line: 54, column: 11, scope: !67)
!121 = !DILocation(line: 55, column: 13, scope: !67)
!122 = !DILocation(line: 55, column: 25, scope: !67)
!123 = !DILocation(line: 55, column: 33, scope: !67)
!124 = !DILocation(line: 55, column: 22, scope: !67)
!125 = !DILocation(line: 55, column: 11, scope: !67)
!126 = !DILocation(line: 56, column: 13, scope: !67)
!127 = !DILocation(line: 56, column: 20, scope: !67)
!128 = !DILocation(line: 56, column: 18, scope: !67)
!129 = !DILocation(line: 56, column: 11, scope: !67)
!130 = !DILocation(line: 57, column: 9, scope: !67)
!131 = !DILocation(line: 57, column: 20, scope: !67)
!132 = !DILocation(line: 57, column: 18, scope: !67)
!133 = !DILocation(line: 57, column: 7, scope: !67)
!134 = !DILocation(line: 58, column: 5, scope: !135)
!135 = distinct !DILexicalBlock(scope: !67, file: !68, line: 58, column: 5)
!136 = !DILocation(line: 58, column: 13, scope: !135)
!137 = !DILocation(line: 58, column: 10, scope: !135)
!138 = !DILocation(line: 58, column: 5, scope: !67)
!139 = !DILocation(line: 60, column: 6, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !68, line: 60, column: 6)
!141 = distinct !DILexicalBlock(scope: !135, file: !68, line: 59, column: 2)
!142 = !DILocation(line: 60, column: 11, scope: !140)
!143 = !DILocation(line: 60, column: 6, scope: !141)
!144 = !DILocation(line: 62, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !68, line: 62, column: 7)
!146 = distinct !DILexicalBlock(scope: !140, file: !68, line: 61, column: 3)
!147 = !DILocation(line: 62, column: 12, scope: !145)
!148 = !DILocation(line: 62, column: 7, scope: !146)
!149 = !DILocation(line: 64, column: 12, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !68, line: 63, column: 4)
!151 = !DILocation(line: 64, column: 5, scope: !150)
!152 = !DILocation(line: 68, column: 5, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !68, line: 67, column: 4)
!154 = !DILocation(line: 73, column: 4, scope: !155)
!155 = distinct !DILexicalBlock(scope: !140, file: !68, line: 72, column: 3)
!156 = !DILocation(line: 78, column: 6, scope: !157)
!157 = distinct !DILexicalBlock(scope: !158, file: !68, line: 78, column: 6)
!158 = distinct !DILexicalBlock(scope: !135, file: !68, line: 77, column: 2)
!159 = !DILocation(line: 78, column: 11, scope: !157)
!160 = !DILocation(line: 78, column: 6, scope: !158)
!161 = !DILocation(line: 80, column: 7, scope: !162)
!162 = distinct !DILexicalBlock(scope: !163, file: !68, line: 80, column: 7)
!163 = distinct !DILexicalBlock(scope: !157, file: !68, line: 79, column: 3)
!164 = !DILocation(line: 80, column: 12, scope: !162)
!165 = !DILocation(line: 80, column: 7, scope: !163)
!166 = !DILocation(line: 82, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !168, file: !68, line: 82, column: 8)
!168 = distinct !DILexicalBlock(scope: !162, file: !68, line: 81, column: 4)
!169 = !DILocation(line: 82, column: 13, scope: !167)
!170 = !DILocation(line: 82, column: 8, scope: !168)
!171 = !DILocation(line: 84, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !173, file: !68, line: 84, column: 9)
!173 = distinct !DILexicalBlock(scope: !167, file: !68, line: 83, column: 5)
!174 = !DILocation(line: 84, column: 14, scope: !172)
!175 = !DILocation(line: 84, column: 9, scope: !173)
!176 = !DILocation(line: 86, column: 14, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !68, line: 85, column: 6)
!178 = !DILocation(line: 86, column: 7, scope: !177)
!179 = !DILocation(line: 90, column: 7, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !68, line: 89, column: 6)
!181 = !DILocation(line: 95, column: 6, scope: !182)
!182 = distinct !DILexicalBlock(scope: !167, file: !68, line: 94, column: 5)
!183 = !DILocation(line: 100, column: 12, scope: !184)
!184 = distinct !DILexicalBlock(scope: !162, file: !68, line: 99, column: 4)
!185 = !DILocation(line: 100, column: 17, scope: !184)
!186 = !DILocation(line: 100, column: 10, scope: !184)
!187 = !DILocation(line: 101, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !68, line: 101, column: 8)
!189 = !DILocation(line: 101, column: 13, scope: !188)
!190 = !DILocation(line: 101, column: 8, scope: !184)
!191 = !DILocation(line: 103, column: 9, scope: !192)
!192 = distinct !DILexicalBlock(scope: !193, file: !68, line: 103, column: 9)
!193 = distinct !DILexicalBlock(scope: !188, file: !68, line: 102, column: 5)
!194 = !DILocation(line: 103, column: 14, scope: !192)
!195 = !DILocation(line: 103, column: 9, scope: !193)
!196 = !DILocation(line: 105, column: 14, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !68, line: 104, column: 6)
!198 = !DILocation(line: 105, column: 7, scope: !197)
!199 = !DILocation(line: 109, column: 7, scope: !200)
!200 = distinct !DILexicalBlock(scope: !192, file: !68, line: 108, column: 6)
!201 = !DILocation(line: 114, column: 6, scope: !202)
!202 = distinct !DILexicalBlock(scope: !188, file: !68, line: 113, column: 5)
!203 = !DILocation(line: 120, column: 11, scope: !204)
!204 = distinct !DILexicalBlock(scope: !157, file: !68, line: 119, column: 3)
!205 = !DILocation(line: 120, column: 16, scope: !204)
!206 = !DILocation(line: 120, column: 9, scope: !204)
!207 = !DILocation(line: 121, column: 7, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !68, line: 121, column: 7)
!209 = !DILocation(line: 121, column: 12, scope: !208)
!210 = !DILocation(line: 121, column: 7, scope: !204)
!211 = !DILocation(line: 123, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !213, file: !68, line: 123, column: 8)
!213 = distinct !DILexicalBlock(scope: !208, file: !68, line: 122, column: 4)
!214 = !DILocation(line: 123, column: 13, scope: !212)
!215 = !DILocation(line: 123, column: 8, scope: !213)
!216 = !DILocation(line: 125, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !212, file: !68, line: 124, column: 5)
!218 = !DILocation(line: 125, column: 6, scope: !217)
!219 = !DILocation(line: 129, column: 6, scope: !220)
!220 = distinct !DILexicalBlock(scope: !212, file: !68, line: 128, column: 5)
!221 = !DILocation(line: 134, column: 5, scope: !222)
!222 = distinct !DILexicalBlock(scope: !208, file: !68, line: 133, column: 4)
!223 = !DILocation(line: 138, column: 1, scope: !67)
!224 = distinct !DISubprogram(name: "s16_hip1_s16_s8_s8_u16_fac1", scope: !68, file: !68, line: 158, type: !225, scopeLine: 159, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!225 = !DISubroutineType(types: !226)
!226 = !{!71, !71, !227, !227, !77}
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !72, line: 7, baseType: !40)
!228 = !DILocalVariable(name: "yold", arg: 1, scope: !224, file: !68, line: 158, type: !71)
!229 = !DILocation(line: 158, column: 37, scope: !224)
!230 = !DILocalVariable(name: "u", arg: 2, scope: !224, file: !68, line: 158, type: !227)
!231 = !DILocation(line: 158, column: 46, scope: !224)
!232 = !DILocalVariable(name: "uold", arg: 3, scope: !224, file: !68, line: 158, type: !227)
!233 = !DILocation(line: 158, column: 52, scope: !224)
!234 = !DILocalVariable(name: "m", arg: 4, scope: !224, file: !68, line: 158, type: !77)
!235 = !DILocation(line: 158, column: 62, scope: !224)
!236 = !DILocalVariable(name: "s32Temp1", scope: !224, file: !68, line: 160, type: !87)
!237 = !DILocation(line: 160, column: 6, scope: !224)
!238 = !DILocalVariable(name: "s32Temp2", scope: !224, file: !68, line: 160, type: !87)
!239 = !DILocation(line: 160, column: 20, scope: !224)
!240 = !DILocalVariable(name: "s16u", scope: !224, file: !68, line: 161, type: !87)
!241 = !DILocation(line: 161, column: 6, scope: !224)
!242 = !DILocalVariable(name: "s16uold", scope: !224, file: !68, line: 162, type: !71)
!243 = !DILocation(line: 162, column: 6, scope: !224)
!244 = !DILocation(line: 164, column: 67, scope: !245)
!245 = distinct !DILexicalBlock(scope: !224, file: !68, line: 164, column: 6)
!246 = !DILocation(line: 164, column: 62, scope: !245)
!247 = !DILocation(line: 164, column: 76, scope: !245)
!248 = !DILocation(line: 164, column: 71, scope: !245)
!249 = !DILocation(line: 164, column: 69, scope: !245)
!250 = !DILocation(line: 164, column: 46, scope: !245)
!251 = !DILocation(line: 164, column: 8, scope: !245)
!252 = !DILocation(line: 164, column: 6, scope: !224)
!253 = !DILocation(line: 165, column: 6, scope: !254)
!254 = distinct !DILexicalBlock(scope: !245, file: !68, line: 164, column: 86)
!255 = !DILocation(line: 167, column: 13, scope: !224)
!256 = !DILocation(line: 167, column: 17, scope: !224)
!257 = !DILocation(line: 167, column: 15, scope: !224)
!258 = !DILocation(line: 167, column: 23, scope: !224)
!259 = !DILocation(line: 167, column: 12, scope: !224)
!260 = !DILocation(line: 167, column: 10, scope: !224)
!261 = !DILocation(line: 168, column: 13, scope: !224)
!262 = !DILocation(line: 168, column: 20, scope: !224)
!263 = !DILocation(line: 168, column: 18, scope: !224)
!264 = !DILocation(line: 168, column: 11, scope: !224)
!265 = !DILocation(line: 169, column: 14, scope: !224)
!266 = !DILocation(line: 169, column: 22, scope: !224)
!267 = !DILocation(line: 169, column: 32, scope: !224)
!268 = !DILocation(line: 169, column: 11, scope: !224)
!269 = !DILocation(line: 171, column: 43, scope: !270)
!270 = distinct !DILexicalBlock(scope: !224, file: !68, line: 171, column: 6)
!271 = !DILocation(line: 171, column: 33, scope: !270)
!272 = !DILocation(line: 171, column: 64, scope: !270)
!273 = !DILocation(line: 171, column: 54, scope: !270)
!274 = !DILocation(line: 171, column: 8, scope: !270)
!275 = !DILocation(line: 171, column: 6, scope: !224)
!276 = !DILocation(line: 172, column: 6, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !68, line: 171, column: 77)
!278 = !DILocation(line: 175, column: 43, scope: !279)
!279 = distinct !DILexicalBlock(scope: !224, file: !68, line: 175, column: 6)
!280 = !DILocation(line: 175, column: 33, scope: !279)
!281 = !DILocation(line: 175, column: 64, scope: !279)
!282 = !DILocation(line: 175, column: 54, scope: !279)
!283 = !DILocation(line: 175, column: 8, scope: !279)
!284 = !DILocation(line: 175, column: 6, scope: !224)
!285 = !DILocation(line: 176, column: 6, scope: !286)
!286 = distinct !DILexicalBlock(scope: !279, file: !68, line: 175, column: 77)
!287 = !DILocation(line: 178, column: 13, scope: !224)
!288 = !DILocation(line: 178, column: 24, scope: !224)
!289 = !DILocation(line: 178, column: 22, scope: !224)
!290 = !DILocation(line: 178, column: 11, scope: !224)
!291 = !DILocation(line: 180, column: 56, scope: !292)
!292 = distinct !DILexicalBlock(scope: !224, file: !68, line: 180, column: 6)
!293 = !DILocation(line: 180, column: 46, scope: !292)
!294 = !DILocation(line: 180, column: 8, scope: !292)
!295 = !DILocation(line: 180, column: 6, scope: !224)
!296 = !DILocation(line: 181, column: 6, scope: !297)
!297 = distinct !DILexicalBlock(scope: !292, file: !68, line: 180, column: 69)
!298 = !DILocation(line: 184, column: 46, scope: !299)
!299 = distinct !DILexicalBlock(scope: !224, file: !68, line: 184, column: 6)
!300 = !DILocation(line: 184, column: 36, scope: !299)
!301 = !DILocation(line: 184, column: 8, scope: !299)
!302 = !DILocation(line: 184, column: 6, scope: !224)
!303 = !DILocation(line: 185, column: 6, scope: !304)
!304 = distinct !DILexicalBlock(scope: !299, file: !68, line: 184, column: 74)
!305 = !DILocation(line: 192, column: 34, scope: !224)
!306 = !DILocation(line: 192, column: 43, scope: !224)
!307 = !DILocation(line: 192, column: 24, scope: !224)
!308 = !DILocation(line: 192, column: 22, scope: !224)
!309 = !DILocation(line: 193, column: 2, scope: !224)
!310 = !DILocation(line: 278, column: 1, scope: !224)
!311 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !17, file: !17, line: 84, type: !312, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!312 = !DISubroutineType(types: !313)
!313 = !{!11, !6}
!314 = !DILocalVariable(name: "left", arg: 1, scope: !311, file: !17, line: 84, type: !6)
!315 = !DILocation(line: 84, column: 51, scope: !311)
!316 = !DILocation(line: 86, column: 12, scope: !311)
!317 = !DILocation(line: 86, column: 17, scope: !311)
!318 = !DILocation(line: 86, column: 5, scope: !311)
!319 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !17, file: !17, line: 60, type: !320, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!320 = !DISubroutineType(types: !321)
!321 = !{!11, !6, !6}
!322 = !DILocalVariable(name: "left", arg: 1, scope: !319, file: !17, line: 60, type: !6)
!323 = !DILocation(line: 60, column: 38, scope: !319)
!324 = !DILocalVariable(name: "right", arg: 2, scope: !319, file: !17, line: 60, type: !6)
!325 = !DILocation(line: 60, column: 52, scope: !319)
!326 = !DILocation(line: 62, column: 12, scope: !319)
!327 = !DILocation(line: 62, column: 19, scope: !319)
!328 = !DILocation(line: 62, column: 17, scope: !319)
!329 = !DILocation(line: 62, column: 25, scope: !319)
!330 = !DILocation(line: 62, column: 5, scope: !319)
!331 = distinct !DISubprogram(name: "klee_alarm_s32_sub_upper", scope: !17, file: !17, line: 66, type: !320, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!332 = !DILocalVariable(name: "left", arg: 1, scope: !331, file: !17, line: 66, type: !6)
!333 = !DILocation(line: 66, column: 38, scope: !331)
!334 = !DILocalVariable(name: "right", arg: 2, scope: !331, file: !17, line: 66, type: !6)
!335 = !DILocation(line: 66, column: 52, scope: !331)
!336 = !DILocation(line: 68, column: 12, scope: !331)
!337 = !DILocation(line: 68, column: 19, scope: !331)
!338 = !DILocation(line: 68, column: 17, scope: !331)
!339 = !DILocation(line: 68, column: 25, scope: !331)
!340 = !DILocation(line: 68, column: 5, scope: !331)
!341 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !17, file: !17, line: 90, type: !342, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!342 = !DISubroutineType(types: !343)
!343 = !{!11, !6, !12}
!344 = !DILocalVariable(name: "left", arg: 1, scope: !341, file: !17, line: 90, type: !6)
!345 = !DILocation(line: 90, column: 41, scope: !341)
!346 = !DILocalVariable(name: "count", arg: 2, scope: !341, file: !17, line: 90, type: !12)
!347 = !DILocation(line: 90, column: 56, scope: !341)
!348 = !DILocation(line: 92, column: 9, scope: !349)
!349 = distinct !DILexicalBlock(scope: !341, file: !17, line: 92, column: 9)
!350 = !DILocation(line: 92, column: 15, scope: !349)
!351 = !DILocation(line: 92, column: 9, scope: !341)
!352 = !DILocation(line: 93, column: 9, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !17, line: 92, column: 32)
!354 = !DILocation(line: 95, column: 12, scope: !341)
!355 = !DILocation(line: 95, column: 34, scope: !341)
!356 = !DILocation(line: 95, column: 31, scope: !341)
!357 = !{!"True"}
!358 = !DILocation(line: 95, column: 17, scope: !341)
!359 = !DILocation(line: 95, column: 41, scope: !341)
!360 = !DILocation(line: 95, column: 5, scope: !341)
!361 = !DILocation(line: 96, column: 1, scope: !341)
!362 = distinct !DISubprogram(name: "s32_hip1_s32_u16_u16_u16_fac1", scope: !68, file: !68, line: 298, type: !363, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!363 = !DISubroutineType(types: !364)
!364 = !{!87, !87, !77, !77, !77}
!365 = !DILocalVariable(name: "yold", arg: 1, scope: !362, file: !68, line: 298, type: !87)
!366 = !DILocation(line: 298, column: 39, scope: !362)
!367 = !DILocalVariable(name: "u", arg: 2, scope: !362, file: !68, line: 298, type: !77)
!368 = !DILocation(line: 298, column: 49, scope: !362)
!369 = !DILocalVariable(name: "uold", arg: 3, scope: !362, file: !68, line: 298, type: !77)
!370 = !DILocation(line: 298, column: 56, scope: !362)
!371 = !DILocalVariable(name: "m", arg: 4, scope: !362, file: !68, line: 298, type: !77)
!372 = !DILocation(line: 298, column: 66, scope: !362)
!373 = !DILocalVariable(name: "s32TempHW", scope: !362, file: !68, line: 300, type: !87)
!374 = !DILocation(line: 300, column: 6, scope: !362)
!375 = !DILocalVariable(name: "s32TempLW", scope: !362, file: !68, line: 300, type: !87)
!376 = !DILocation(line: 300, column: 21, scope: !362)
!377 = !DILocalVariable(name: "s32Temp0", scope: !362, file: !68, line: 300, type: !87)
!378 = !DILocation(line: 300, column: 37, scope: !362)
!379 = !DILocalVariable(name: "s32Temp1", scope: !362, file: !68, line: 300, type: !87)
!380 = !DILocation(line: 300, column: 52, scope: !362)
!381 = !DILocalVariable(name: "s32Result", scope: !362, file: !68, line: 300, type: !87)
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
!436 = !{!87, !87, !71, !71, !77}
!437 = !DILocalVariable(name: "yold", arg: 1, scope: !434, file: !68, line: 342, type: !87)
!438 = !DILocation(line: 342, column: 39, scope: !434)
!439 = !DILocalVariable(name: "u", arg: 2, scope: !434, file: !68, line: 342, type: !71)
!440 = !DILocation(line: 342, column: 49, scope: !434)
!441 = !DILocalVariable(name: "uold", arg: 3, scope: !434, file: !68, line: 342, type: !71)
!442 = !DILocation(line: 342, column: 56, scope: !434)
!443 = !DILocalVariable(name: "m", arg: 4, scope: !434, file: !68, line: 342, type: !77)
!444 = !DILocation(line: 342, column: 66, scope: !434)
!445 = !DILocalVariable(name: "s32TempHW", scope: !434, file: !68, line: 344, type: !87)
!446 = !DILocation(line: 344, column: 6, scope: !434)
!447 = !DILocalVariable(name: "s32TempLW", scope: !434, file: !68, line: 344, type: !87)
!448 = !DILocation(line: 344, column: 21, scope: !434)
!449 = !DILocalVariable(name: "s32Temp0", scope: !434, file: !68, line: 344, type: !87)
!450 = !DILocation(line: 344, column: 37, scope: !434)
!451 = !DILocalVariable(name: "s32Temp1", scope: !434, file: !68, line: 344, type: !87)
!452 = !DILocation(line: 344, column: 52, scope: !434)
!453 = !DILocalVariable(name: "s32Result", scope: !434, file: !68, line: 344, type: !87)
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
