; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0063.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"yold\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"uold\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/hip_Ccode.c\00", align 1
@.str.1.5 = private unnamed_addr constant [92 x i8] c"KLEE-ALARM-0063: invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);\00", align 1
@.str.2.6 = private unnamed_addr constant [20 x i8] c"klee-alarm-0063.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !23 {
entry:
  %retval = alloca i32, align 4
  %yold = alloca i16, align 2
  %u = alloca i8, align 1
  %uold = alloca i8, align 1
  %m = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %yold, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i8* %u, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i8* %uold, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i16* %m, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i16* %result, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = bitcast i16* %yold to i8*, !dbg !47
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @klee_make_symbolic(i8* %u, i64 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  call void @klee_make_symbolic(i8* %uold, i64 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !50
  %1 = bitcast i16* %m to i8*, !dbg !51
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  %2 = load i16, i16* %yold, align 2, !dbg !53
  %3 = load i8, i8* %u, align 1, !dbg !54
  %4 = load i8, i8* %uold, align 1, !dbg !55
  %5 = load i16, i16* %m, align 2, !dbg !56
  %call = call signext i16 @s16_hip1_s16_u8_u8_u16_fac1(i16 signext %2, i8 zeroext %3, i8 zeroext %4, i16 zeroext %5), !dbg !57
  store i16 %call, i16* %result, align 2, !dbg !58
  %6 = load i16, i16* %result, align 2, !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_hip1_s16_u8_u8_u16_fac1(i16 signext %yold, i8 zeroext %u, i8 zeroext %uold, i16 zeroext %m) #0 !dbg !61 {
entry:
  %yold.addr = alloca i16, align 2
  %u.addr = alloca i8, align 1
  %uold.addr = alloca i8, align 1
  %m.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s16u = alloca i16, align 2
  %u16uold = alloca i16, align 2
  store i16 %yold, i16* %yold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !77, metadata !DIExpression()), !dbg !81
  store i32 0, i32* %s32Temp1, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %s32Temp2, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i16* %s16u, metadata !84, metadata !DIExpression()), !dbg !85
  store i16 0, i16* %s16u, align 2, !dbg !85
  call void @llvm.dbg.declare(metadata i16* %u16uold, metadata !86, metadata !DIExpression()), !dbg !87
  store i16 0, i16* %u16uold, align 2, !dbg !87
  %0 = load i8, i8* %u.addr, align 1, !dbg !88
  %conv = zext i8 %0 to i32, !dbg !90
  %1 = load i8, i8* %uold.addr, align 1, !dbg !91
  %conv1 = zext i8 %1 to i32, !dbg !92
  %sub = sub nsw i32 %conv, %conv1, !dbg !93
  %conv2 = sext i32 %sub to i64, !dbg !94
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv2), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.end, label %if.then, !dbg !96

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i32 53, i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.6, i64 0, i64 0)) #4, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load i8, i8* %u.addr, align 1, !dbg !99
  %conv3 = zext i8 %2 to i32, !dbg !100
  %3 = load i8, i8* %uold.addr, align 1, !dbg !101
  %conv4 = zext i8 %3 to i32, !dbg !102
  %sub5 = sub nsw i32 %conv3, %conv4, !dbg !103
  %shl = shl i32 %sub5, 7, !dbg !104
  %conv6 = sext i32 %shl to i64, !dbg !105
  store volatile i64 %conv6, i64* @klee_alarm_sink_s64, align 8, !dbg !106
  ret i16 0, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !108 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = load i64, i64* %left.addr, align 8, !dbg !113
  %cmp = icmp sge i64 %0, 0, !dbg !114
  %conv = zext i1 %cmp to i32, !dbg !114
  ret i32 %conv, !dbg !115
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_hip1_s16_s8_s8_u16_fac1(i16 signext %yold, i8 signext %u, i8 signext %uold, i16 zeroext %m) #0 !dbg !116 {
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
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !123, metadata !DIExpression()), !dbg !124
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 0, i32* %s32Temp1, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 0, i32* %s32Temp2, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %s16u, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 0, i32* %s16u, align 4, !dbg !136
  call void @llvm.dbg.declare(metadata i16* %s16uold, metadata !137, metadata !DIExpression()), !dbg !138
  store i16 0, i16* %s16uold, align 2, !dbg !138
  %0 = load i8, i8* %u.addr, align 1, !dbg !139
  %conv = sext i8 %0 to i32, !dbg !139
  %1 = load i8, i8* %uold.addr, align 1, !dbg !140
  %conv1 = sext i8 %1 to i32, !dbg !140
  %sub = sub nsw i32 %conv, %conv1, !dbg !141
  %shl = shl i32 %sub, 7, !dbg !142
  %conv2 = trunc i32 %shl to i16, !dbg !143
  store i16 %conv2, i16* %s16uold, align 2, !dbg !144
  %2 = load i16, i16* %yold.addr, align 2, !dbg !145
  %conv3 = sext i16 %2 to i32, !dbg !145
  %3 = load i16, i16* %m.addr, align 2, !dbg !146
  %conv4 = zext i16 %3 to i32, !dbg !146
  %mul = mul nsw i32 %conv3, %conv4, !dbg !147
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !148
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !149
  %div = sdiv i32 %4, 65536, !dbg !150
  %mul5 = mul nsw i32 %div, 65536, !dbg !151
  store i32 %mul5, i32* %s32Temp2, align 4, !dbg !152
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !153
  %6 = load i32, i32* %s32Temp2, align 4, !dbg !154
  %sub6 = sub nsw i32 %5, %6, !dbg !155
  store i32 %sub6, i32* %s32Temp2, align 4, !dbg !156
  %7 = load i32, i32* %s32Temp2, align 4, !dbg !157
  %shl7 = shl i32 %7, 1, !dbg !158
  store i32 %shl7, i32* %s32Temp2, align 4, !dbg !159
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !160
  %div8 = sdiv i32 %8, 65536, !dbg !161
  store i32 %div8, i32* %s32Temp2, align 4, !dbg !162
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !163
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !164
  %div9 = sdiv i32 %10, 65536, !dbg !165
  %add = add nsw i32 %9, %div9, !dbg !166
  store i32 %add, i32* %s32Temp2, align 4, !dbg !167
  %11 = load i16, i16* %yold.addr, align 2, !dbg !168
  %conv10 = sext i16 %11 to i32, !dbg !168
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !169
  %sub11 = sub nsw i32 %conv10, %12, !dbg !170
  store i32 %sub11, i32* %s32Temp2, align 4, !dbg !171
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !172
  %14 = load i16, i16* %s16uold, align 2, !dbg !173
  %conv12 = sext i16 %14 to i32, !dbg !173
  %add13 = add nsw i32 %13, %conv12, !dbg !174
  store i32 %add13, i32* %s16u, align 4, !dbg !175
  %15 = load i16, i16* %yold.addr, align 2, !dbg !176
  %conv14 = sext i16 %15 to i32, !dbg !176
  %16 = load i32, i32* %s16u, align 4, !dbg !178
  %cmp = icmp ne i32 %conv14, %16, !dbg !179
  br i1 %cmp, label %if.then, label %if.else24, !dbg !180

if.then:                                          ; preds = %entry
  %17 = load i32, i32* %s16u, align 4, !dbg !181
  %cmp16 = icmp sle i32 %17, 32767, !dbg !184
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !185

if.then18:                                        ; preds = %if.then
  %18 = load i32, i32* %s16u, align 4, !dbg !186
  %cmp19 = icmp sge i32 %18, -32768, !dbg !189
  br i1 %cmp19, label %if.then21, label %if.else, !dbg !190

if.then21:                                        ; preds = %if.then18
  %19 = load i32, i32* %s16u, align 4, !dbg !191
  %conv22 = trunc i32 %19 to i16, !dbg !191
  store i16 %conv22, i16* %retval, align 2, !dbg !193
  br label %return, !dbg !193

if.else:                                          ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !194
  br label %return, !dbg !194

if.else23:                                        ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !196
  br label %return, !dbg !196

if.else24:                                        ; preds = %entry
  %20 = load i16, i16* %yold.addr, align 2, !dbg !198
  %conv25 = sext i16 %20 to i32, !dbg !198
  %cmp26 = icmp sle i32 %conv25, 0, !dbg !201
  br i1 %cmp26, label %if.then28, label %if.else53, !dbg !202

if.then28:                                        ; preds = %if.else24
  %21 = load i16, i16* %yold.addr, align 2, !dbg !203
  %conv29 = sext i16 %21 to i32, !dbg !203
  %cmp30 = icmp eq i32 %conv29, 0, !dbg !206
  br i1 %cmp30, label %if.then32, label %if.else42, !dbg !207

if.then32:                                        ; preds = %if.then28
  %22 = load i32, i32* %s16u, align 4, !dbg !208
  %cmp33 = icmp sle i32 %22, 32767, !dbg !211
  br i1 %cmp33, label %if.then35, label %if.else41, !dbg !212

if.then35:                                        ; preds = %if.then32
  %23 = load i32, i32* %s16u, align 4, !dbg !213
  %cmp36 = icmp sge i32 %23, -32768, !dbg !216
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !217

if.then38:                                        ; preds = %if.then35
  %24 = load i32, i32* %s16u, align 4, !dbg !218
  %conv39 = trunc i32 %24 to i16, !dbg !218
  store i16 %conv39, i16* %retval, align 2, !dbg !220
  br label %return, !dbg !220

if.else40:                                        ; preds = %if.then35
  store i16 -32768, i16* %retval, align 2, !dbg !221
  br label %return, !dbg !221

if.else41:                                        ; preds = %if.then32
  store i16 32767, i16* %retval, align 2, !dbg !223
  br label %return, !dbg !223

if.else42:                                        ; preds = %if.then28
  %25 = load i32, i32* %s16u, align 4, !dbg !225
  %add43 = add nsw i32 %25, 1, !dbg !227
  store i32 %add43, i32* %s16u, align 4, !dbg !228
  %26 = load i32, i32* %s16u, align 4, !dbg !229
  %cmp44 = icmp sle i32 %26, 32767, !dbg !231
  br i1 %cmp44, label %if.then46, label %if.else52, !dbg !232

if.then46:                                        ; preds = %if.else42
  %27 = load i32, i32* %s16u, align 4, !dbg !233
  %cmp47 = icmp sge i32 %27, -32768, !dbg !236
  br i1 %cmp47, label %if.then49, label %if.else51, !dbg !237

if.then49:                                        ; preds = %if.then46
  %28 = load i32, i32* %s16u, align 4, !dbg !238
  %conv50 = trunc i32 %28 to i16, !dbg !238
  store i16 %conv50, i16* %retval, align 2, !dbg !240
  br label %return, !dbg !240

if.else51:                                        ; preds = %if.then46
  store i16 -32768, i16* %retval, align 2, !dbg !241
  br label %return, !dbg !241

if.else52:                                        ; preds = %if.else42
  store i16 32767, i16* %retval, align 2, !dbg !243
  br label %return, !dbg !243

if.else53:                                        ; preds = %if.else24
  %29 = load i32, i32* %s16u, align 4, !dbg !245
  %sub54 = sub nsw i32 %29, 1, !dbg !247
  store i32 %sub54, i32* %s16u, align 4, !dbg !248
  %30 = load i32, i32* %s16u, align 4, !dbg !249
  %cmp55 = icmp sle i32 %30, 32767, !dbg !251
  br i1 %cmp55, label %if.then57, label %if.else63, !dbg !252

if.then57:                                        ; preds = %if.else53
  %31 = load i32, i32* %s16u, align 4, !dbg !253
  %cmp58 = icmp sge i32 %31, -32768, !dbg !256
  br i1 %cmp58, label %if.then60, label %if.else62, !dbg !257

if.then60:                                        ; preds = %if.then57
  %32 = load i32, i32* %s16u, align 4, !dbg !258
  %conv61 = trunc i32 %32 to i16, !dbg !258
  store i16 %conv61, i16* %retval, align 2, !dbg !260
  br label %return, !dbg !260

if.else62:                                        ; preds = %if.then57
  store i16 -32768, i16* %retval, align 2, !dbg !261
  br label %return, !dbg !261

if.else63:                                        ; preds = %if.else53
  store i16 32767, i16* %retval, align 2, !dbg !263
  br label %return, !dbg !263

return:                                           ; preds = %if.else63, %if.else62, %if.then60, %if.else52, %if.else51, %if.then49, %if.else41, %if.else40, %if.then38, %if.else23, %if.else, %if.then21
  %33 = load i16, i16* %retval, align 2, !dbg !265
  ret i16 %33, !dbg !265
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_hip1_s32_u16_u16_u16_fac1(i32 %yold, i16 zeroext %u, i16 zeroext %uold, i16 zeroext %m) #0 !dbg !266 {
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
  call void @llvm.dbg.declare(metadata i32* %yold.addr, metadata !269, metadata !DIExpression()), !dbg !270
  store i16 %u, i16* %u.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %u.addr, metadata !271, metadata !DIExpression()), !dbg !272
  store i16 %uold, i16* %uold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %uold.addr, metadata !273, metadata !DIExpression()), !dbg !274
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata i32* %s32TempHW, metadata !277, metadata !DIExpression()), !dbg !278
  store i32 0, i32* %s32TempHW, align 4, !dbg !278
  call void @llvm.dbg.declare(metadata i32* %s32TempLW, metadata !279, metadata !DIExpression()), !dbg !280
  store i32 0, i32* %s32TempLW, align 4, !dbg !280
  call void @llvm.dbg.declare(metadata i32* %s32Temp0, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 0, i32* %s32Temp0, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !283, metadata !DIExpression()), !dbg !284
  store i32 0, i32* %s32Temp1, align 4, !dbg !284
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !285, metadata !DIExpression()), !dbg !286
  store i32 0, i32* %s32Result, align 4, !dbg !286
  %0 = load i16, i16* %m.addr, align 2, !dbg !287
  %conv = zext i16 %0 to i32, !dbg !287
  %and = and i32 %conv, 65535, !dbg !288
  %conv1 = trunc i32 %and to i16, !dbg !287
  store i16 %conv1, i16* %m.addr, align 2, !dbg !289
  %1 = load i32, i32* %yold.addr, align 4, !dbg !290
  %2 = load i16, i16* %m.addr, align 2, !dbg !291
  %conv2 = zext i16 %2 to i32, !dbg !291
  %call = call i32 @MulHighWord(i32 %1, i32 %conv2), !dbg !292
  store i32 %call, i32* %s32TempHW, align 4, !dbg !293
  %3 = load i32, i32* %yold.addr, align 4, !dbg !294
  %4 = load i16, i16* %m.addr, align 2, !dbg !295
  %conv3 = zext i16 %4 to i32, !dbg !295
  %mul = mul nsw i32 %3, %conv3, !dbg !296
  store i32 %mul, i32* %s32TempLW, align 4, !dbg !297
  %5 = load i32, i32* %s32TempHW, align 4, !dbg !298
  %call4 = call i32 @rotateRight(i32 %5, i32 16), !dbg !299
  %and5 = and i32 %call4, -65536, !dbg !300
  %6 = load i32, i32* %s32TempLW, align 4, !dbg !301
  %shr = ashr i32 %6, 16, !dbg !302
  %add = add i32 %and5, %shr, !dbg !303
  store i32 %add, i32* %s32Temp1, align 4, !dbg !304
  %7 = load i16, i16* %u.addr, align 2, !dbg !305
  %conv6 = zext i16 %7 to i32, !dbg !305
  %8 = load i16, i16* %uold.addr, align 2, !dbg !306
  %conv7 = zext i16 %8 to i32, !dbg !306
  %sub = sub nsw i32 %conv6, %conv7, !dbg !307
  store i32 %sub, i32* %s32Temp0, align 4, !dbg !308
  %9 = load i32, i32* %yold.addr, align 4, !dbg !309
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !310
  %sub8 = sub nsw i32 %9, %10, !dbg !311
  %11 = load i32, i32* %s32Temp0, align 4, !dbg !312
  %shl = shl i32 %11, 15, !dbg !313
  %add9 = add nsw i32 %sub8, %shl, !dbg !314
  store i32 %add9, i32* %s32Result, align 4, !dbg !315
  %12 = load i32, i32* %s32Result, align 4, !dbg !316
  %13 = load i32, i32* %yold.addr, align 4, !dbg !318
  %cmp = icmp eq i32 %12, %13, !dbg !319
  br i1 %cmp, label %if.then, label %if.else16, !dbg !320

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %yold.addr, align 4, !dbg !321
  %cmp11 = icmp sgt i32 %14, 0, !dbg !324
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !325

if.then13:                                        ; preds = %if.then
  %15 = load i32, i32* %s32Result, align 4, !dbg !326
  %add14 = add nsw i32 %15, 1, !dbg !328
  store i32 %add14, i32* %retval, align 4, !dbg !329
  br label %return, !dbg !329

if.else:                                          ; preds = %if.then
  %16 = load i32, i32* %s32Result, align 4, !dbg !330
  %sub15 = sub nsw i32 %16, 1, !dbg !332
  store i32 %sub15, i32* %retval, align 4, !dbg !333
  br label %return, !dbg !333

if.else16:                                        ; preds = %entry
  %17 = load i32, i32* %s32Result, align 4, !dbg !334
  store i32 %17, i32* %retval, align 4, !dbg !336
  br label %return, !dbg !336

return:                                           ; preds = %if.else16, %if.else, %if.then13
  %18 = load i32, i32* %retval, align 4, !dbg !337
  ret i32 %18, !dbg !337
}

declare dso_local i32 @MulHighWord(i32, i32) #2

declare dso_local i32 @rotateRight(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_hip1_s32_s16_s16_u16_fac1(i32 %yold, i16 signext %u, i16 signext %uold, i16 zeroext %m) #0 !dbg !338 {
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
  call void @llvm.dbg.declare(metadata i32* %yold.addr, metadata !341, metadata !DIExpression()), !dbg !342
  store i16 %u, i16* %u.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %u.addr, metadata !343, metadata !DIExpression()), !dbg !344
  store i16 %uold, i16* %uold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %uold.addr, metadata !345, metadata !DIExpression()), !dbg !346
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !347, metadata !DIExpression()), !dbg !348
  call void @llvm.dbg.declare(metadata i32* %s32TempHW, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 0, i32* %s32TempHW, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %s32TempLW, metadata !351, metadata !DIExpression()), !dbg !352
  store i32 0, i32* %s32TempLW, align 4, !dbg !352
  call void @llvm.dbg.declare(metadata i32* %s32Temp0, metadata !353, metadata !DIExpression()), !dbg !354
  store i32 0, i32* %s32Temp0, align 4, !dbg !354
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !355, metadata !DIExpression()), !dbg !356
  store i32 0, i32* %s32Temp1, align 4, !dbg !356
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 0, i32* %s32Result, align 4, !dbg !358
  %0 = load i16, i16* %m.addr, align 2, !dbg !359
  %conv = zext i16 %0 to i32, !dbg !359
  %and = and i32 %conv, 65535, !dbg !360
  %conv1 = trunc i32 %and to i16, !dbg !359
  store i16 %conv1, i16* %m.addr, align 2, !dbg !361
  %1 = load i32, i32* %yold.addr, align 4, !dbg !362
  %2 = load i16, i16* %m.addr, align 2, !dbg !363
  %conv2 = zext i16 %2 to i32, !dbg !363
  %call = call i32 @MulHighWord(i32 %1, i32 %conv2), !dbg !364
  store i32 %call, i32* %s32TempHW, align 4, !dbg !365
  %3 = load i32, i32* %yold.addr, align 4, !dbg !366
  %4 = load i16, i16* %m.addr, align 2, !dbg !367
  %conv3 = zext i16 %4 to i32, !dbg !367
  %mul = mul nsw i32 %3, %conv3, !dbg !368
  store i32 %mul, i32* %s32TempLW, align 4, !dbg !369
  %5 = load i32, i32* %s32TempHW, align 4, !dbg !370
  %call4 = call i32 @rotateRight(i32 %5, i32 16), !dbg !371
  %and5 = and i32 %call4, -65536, !dbg !372
  %6 = load i32, i32* %s32TempLW, align 4, !dbg !373
  %shr = ashr i32 %6, 16, !dbg !374
  %add = add i32 %and5, %shr, !dbg !375
  store i32 %add, i32* %s32Temp1, align 4, !dbg !376
  %7 = load i16, i16* %u.addr, align 2, !dbg !377
  %conv6 = sext i16 %7 to i32, !dbg !377
  %8 = load i16, i16* %uold.addr, align 2, !dbg !378
  %conv7 = sext i16 %8 to i32, !dbg !378
  %sub = sub nsw i32 %conv6, %conv7, !dbg !379
  store i32 %sub, i32* %s32Temp0, align 4, !dbg !380
  %9 = load i32, i32* %yold.addr, align 4, !dbg !381
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !382
  %sub8 = sub nsw i32 %9, %10, !dbg !383
  %11 = load i32, i32* %s32Temp0, align 4, !dbg !384
  %shl = shl i32 %11, 15, !dbg !385
  %add9 = add nsw i32 %sub8, %shl, !dbg !386
  store i32 %add9, i32* %s32Result, align 4, !dbg !387
  %12 = load i32, i32* %s32Result, align 4, !dbg !388
  %13 = load i32, i32* %yold.addr, align 4, !dbg !390
  %cmp = icmp eq i32 %12, %13, !dbg !391
  br i1 %cmp, label %if.then, label %if.else16, !dbg !392

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %yold.addr, align 4, !dbg !393
  %cmp11 = icmp sgt i32 %14, 0, !dbg !396
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !397

if.then13:                                        ; preds = %if.then
  %15 = load i32, i32* %s32Result, align 4, !dbg !398
  %add14 = add nsw i32 %15, 1, !dbg !400
  store i32 %add14, i32* %retval, align 4, !dbg !401
  br label %return, !dbg !401

if.else:                                          ; preds = %if.then
  %16 = load i32, i32* %s32Result, align 4, !dbg !402
  %sub15 = sub nsw i32 %16, 1, !dbg !404
  store i32 %sub15, i32* %retval, align 4, !dbg !405
  br label %return, !dbg !405

if.else16:                                        ; preds = %entry
  %17 = load i32, i32* %s32Result, align 4, !dbg !406
  store i32 %17, i32* %retval, align 4, !dbg !408
  br label %return, !dbg !408

return:                                           ; preds = %if.else16, %if.else, %if.then13
  %18 = load i32, i32* %retval, align 4, !dbg !409
  ret i32 %18, !dbg !409
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!15, !2}
!llvm.ident = !{!17, !17}
!llvm.module.flags = !{!18, !19, !20, !21, !22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !13, line: 21, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063/hip_Ccode_alarm_0063.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!0}
!13 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063")
!14 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063")
!17 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = distinct !DISubprogram(name: "main", scope: !24, file: !24, line: 7, type: !25, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !4)
!24 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063")
!25 = !DISubroutineType(types: !26)
!26 = !{!11}
!27 = !DILocalVariable(name: "yold", scope: !23, file: !24, line: 9, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !30)
!30 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!31 = !DILocation(line: 9, column: 13, scope: !23)
!32 = !DILocalVariable(name: "u", scope: !23, file: !24, line: 10, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !34, line: 24, baseType: !35)
!34 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !36)
!36 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!37 = !DILocation(line: 10, column: 13, scope: !23)
!38 = !DILocalVariable(name: "uold", scope: !23, file: !24, line: 11, type: !33)
!39 = !DILocation(line: 11, column: 13, scope: !23)
!40 = !DILocalVariable(name: "m", scope: !23, file: !24, line: 12, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !34, line: 25, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !43)
!43 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 12, column: 14, scope: !23)
!45 = !DILocalVariable(name: "result", scope: !23, file: !24, line: 13, type: !28)
!46 = !DILocation(line: 13, column: 13, scope: !23)
!47 = !DILocation(line: 15, column: 24, scope: !23)
!48 = !DILocation(line: 15, column: 5, scope: !23)
!49 = !DILocation(line: 16, column: 5, scope: !23)
!50 = !DILocation(line: 17, column: 5, scope: !23)
!51 = !DILocation(line: 18, column: 24, scope: !23)
!52 = !DILocation(line: 18, column: 5, scope: !23)
!53 = !DILocation(line: 20, column: 42, scope: !23)
!54 = !DILocation(line: 20, column: 48, scope: !23)
!55 = !DILocation(line: 20, column: 51, scope: !23)
!56 = !DILocation(line: 20, column: 57, scope: !23)
!57 = !DILocation(line: 20, column: 14, scope: !23)
!58 = !DILocation(line: 20, column: 12, scope: !23)
!59 = !DILocation(line: 22, column: 11, scope: !23)
!60 = !DILocation(line: 23, column: 5, scope: !23)
!61 = distinct !DISubprogram(name: "s16_hip1_s16_u8_u8_u16_fac1", scope: !62, file: !62, line: 44, type: !63, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DIFile(filename: "src_analysis/sources/hip_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063")
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !67, !67, !68}
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !66, line: 9, baseType: !28)
!66 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063")
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !66, line: 6, baseType: !33)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !66, line: 8, baseType: !41)
!69 = !DILocalVariable(name: "yold", arg: 1, scope: !61, file: !62, line: 44, type: !65)
!70 = !DILocation(line: 44, column: 37, scope: !61)
!71 = !DILocalVariable(name: "u", arg: 2, scope: !61, file: !62, line: 44, type: !67)
!72 = !DILocation(line: 44, column: 46, scope: !61)
!73 = !DILocalVariable(name: "uold", arg: 3, scope: !61, file: !62, line: 44, type: !67)
!74 = !DILocation(line: 44, column: 52, scope: !61)
!75 = !DILocalVariable(name: "m", arg: 4, scope: !61, file: !62, line: 44, type: !68)
!76 = !DILocation(line: 44, column: 62, scope: !61)
!77 = !DILocalVariable(name: "s32Temp1", scope: !61, file: !62, line: 46, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !66, line: 11, baseType: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!81 = !DILocation(line: 46, column: 6, scope: !61)
!82 = !DILocalVariable(name: "s32Temp2", scope: !61, file: !62, line: 46, type: !78)
!83 = !DILocation(line: 46, column: 20, scope: !61)
!84 = !DILocalVariable(name: "s16u", scope: !61, file: !62, line: 47, type: !65)
!85 = !DILocation(line: 47, column: 6, scope: !61)
!86 = !DILocalVariable(name: "u16uold", scope: !61, file: !62, line: 48, type: !68)
!87 = !DILocation(line: 48, column: 6, scope: !61)
!88 = !DILocation(line: 50, column: 67, scope: !89)
!89 = distinct !DILexicalBlock(scope: !61, file: !62, line: 50, column: 6)
!90 = !DILocation(line: 50, column: 62, scope: !89)
!91 = !DILocation(line: 50, column: 76, scope: !89)
!92 = !DILocation(line: 50, column: 71, scope: !89)
!93 = !DILocation(line: 50, column: 69, scope: !89)
!94 = !DILocation(line: 50, column: 46, scope: !89)
!95 = !DILocation(line: 50, column: 8, scope: !89)
!96 = !DILocation(line: 50, column: 6, scope: !61)
!97 = !DILocation(line: 51, column: 6, scope: !98)
!98 = distinct !DILexicalBlock(scope: !89, file: !62, line: 50, column: 86)
!99 = !DILocation(line: 58, column: 45, scope: !61)
!100 = !DILocation(line: 58, column: 40, scope: !61)
!101 = !DILocation(line: 58, column: 54, scope: !61)
!102 = !DILocation(line: 58, column: 49, scope: !61)
!103 = !DILocation(line: 58, column: 47, scope: !61)
!104 = !DILocation(line: 58, column: 60, scope: !61)
!105 = !DILocation(line: 58, column: 24, scope: !61)
!106 = !DILocation(line: 58, column: 22, scope: !61)
!107 = !DILocation(line: 59, column: 2, scope: !61)
!108 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !13, file: !13, line: 84, type: !109, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DISubroutineType(types: !110)
!110 = !{!11, !6}
!111 = !DILocalVariable(name: "left", arg: 1, scope: !108, file: !13, line: 84, type: !6)
!112 = !DILocation(line: 84, column: 51, scope: !108)
!113 = !DILocation(line: 86, column: 12, scope: !108)
!114 = !DILocation(line: 86, column: 17, scope: !108)
!115 = !DILocation(line: 86, column: 5, scope: !108)
!116 = distinct !DISubprogram(name: "s16_hip1_s16_s8_s8_u16_fac1", scope: !62, file: !62, line: 168, type: !117, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DISubroutineType(types: !118)
!118 = !{!65, !65, !119, !119, !68}
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !66, line: 7, baseType: !120)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 24, baseType: !121)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 37, baseType: !122)
!122 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!123 = !DILocalVariable(name: "yold", arg: 1, scope: !116, file: !62, line: 168, type: !65)
!124 = !DILocation(line: 168, column: 37, scope: !116)
!125 = !DILocalVariable(name: "u", arg: 2, scope: !116, file: !62, line: 168, type: !119)
!126 = !DILocation(line: 168, column: 46, scope: !116)
!127 = !DILocalVariable(name: "uold", arg: 3, scope: !116, file: !62, line: 168, type: !119)
!128 = !DILocation(line: 168, column: 52, scope: !116)
!129 = !DILocalVariable(name: "m", arg: 4, scope: !116, file: !62, line: 168, type: !68)
!130 = !DILocation(line: 168, column: 62, scope: !116)
!131 = !DILocalVariable(name: "s32Temp1", scope: !116, file: !62, line: 170, type: !78)
!132 = !DILocation(line: 170, column: 6, scope: !116)
!133 = !DILocalVariable(name: "s32Temp2", scope: !116, file: !62, line: 170, type: !78)
!134 = !DILocation(line: 170, column: 20, scope: !116)
!135 = !DILocalVariable(name: "s16u", scope: !116, file: !62, line: 171, type: !78)
!136 = !DILocation(line: 171, column: 6, scope: !116)
!137 = !DILocalVariable(name: "s16uold", scope: !116, file: !62, line: 172, type: !65)
!138 = !DILocation(line: 172, column: 6, scope: !116)
!139 = !DILocation(line: 173, column: 13, scope: !116)
!140 = !DILocation(line: 173, column: 17, scope: !116)
!141 = !DILocation(line: 173, column: 15, scope: !116)
!142 = !DILocation(line: 173, column: 23, scope: !116)
!143 = !DILocation(line: 173, column: 12, scope: !116)
!144 = !DILocation(line: 173, column: 10, scope: !116)
!145 = !DILocation(line: 174, column: 13, scope: !116)
!146 = !DILocation(line: 174, column: 20, scope: !116)
!147 = !DILocation(line: 174, column: 18, scope: !116)
!148 = !DILocation(line: 174, column: 11, scope: !116)
!149 = !DILocation(line: 175, column: 14, scope: !116)
!150 = !DILocation(line: 175, column: 22, scope: !116)
!151 = !DILocation(line: 175, column: 32, scope: !116)
!152 = !DILocation(line: 175, column: 11, scope: !116)
!153 = !DILocation(line: 176, column: 13, scope: !116)
!154 = !DILocation(line: 176, column: 24, scope: !116)
!155 = !DILocation(line: 176, column: 22, scope: !116)
!156 = !DILocation(line: 176, column: 11, scope: !116)
!157 = !DILocation(line: 177, column: 13, scope: !116)
!158 = !DILocation(line: 177, column: 22, scope: !116)
!159 = !DILocation(line: 177, column: 11, scope: !116)
!160 = !DILocation(line: 178, column: 13, scope: !116)
!161 = !DILocation(line: 178, column: 22, scope: !116)
!162 = !DILocation(line: 178, column: 11, scope: !116)
!163 = !DILocation(line: 179, column: 13, scope: !116)
!164 = !DILocation(line: 179, column: 25, scope: !116)
!165 = !DILocation(line: 179, column: 33, scope: !116)
!166 = !DILocation(line: 179, column: 22, scope: !116)
!167 = !DILocation(line: 179, column: 11, scope: !116)
!168 = !DILocation(line: 180, column: 13, scope: !116)
!169 = !DILocation(line: 180, column: 20, scope: !116)
!170 = !DILocation(line: 180, column: 18, scope: !116)
!171 = !DILocation(line: 180, column: 11, scope: !116)
!172 = !DILocation(line: 181, column: 9, scope: !116)
!173 = !DILocation(line: 181, column: 20, scope: !116)
!174 = !DILocation(line: 181, column: 18, scope: !116)
!175 = !DILocation(line: 181, column: 7, scope: !116)
!176 = !DILocation(line: 182, column: 5, scope: !177)
!177 = distinct !DILexicalBlock(scope: !116, file: !62, line: 182, column: 5)
!178 = !DILocation(line: 182, column: 13, scope: !177)
!179 = !DILocation(line: 182, column: 10, scope: !177)
!180 = !DILocation(line: 182, column: 5, scope: !116)
!181 = !DILocation(line: 184, column: 6, scope: !182)
!182 = distinct !DILexicalBlock(scope: !183, file: !62, line: 184, column: 6)
!183 = distinct !DILexicalBlock(scope: !177, file: !62, line: 183, column: 2)
!184 = !DILocation(line: 184, column: 11, scope: !182)
!185 = !DILocation(line: 184, column: 6, scope: !183)
!186 = !DILocation(line: 186, column: 7, scope: !187)
!187 = distinct !DILexicalBlock(scope: !188, file: !62, line: 186, column: 7)
!188 = distinct !DILexicalBlock(scope: !182, file: !62, line: 185, column: 3)
!189 = !DILocation(line: 186, column: 12, scope: !187)
!190 = !DILocation(line: 186, column: 7, scope: !188)
!191 = !DILocation(line: 188, column: 12, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !62, line: 187, column: 4)
!193 = !DILocation(line: 188, column: 5, scope: !192)
!194 = !DILocation(line: 192, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !187, file: !62, line: 191, column: 4)
!196 = !DILocation(line: 197, column: 4, scope: !197)
!197 = distinct !DILexicalBlock(scope: !182, file: !62, line: 196, column: 3)
!198 = !DILocation(line: 202, column: 6, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !62, line: 202, column: 6)
!200 = distinct !DILexicalBlock(scope: !177, file: !62, line: 201, column: 2)
!201 = !DILocation(line: 202, column: 11, scope: !199)
!202 = !DILocation(line: 202, column: 6, scope: !200)
!203 = !DILocation(line: 204, column: 7, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !62, line: 204, column: 7)
!205 = distinct !DILexicalBlock(scope: !199, file: !62, line: 203, column: 3)
!206 = !DILocation(line: 204, column: 12, scope: !204)
!207 = !DILocation(line: 204, column: 7, scope: !205)
!208 = !DILocation(line: 206, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !210, file: !62, line: 206, column: 8)
!210 = distinct !DILexicalBlock(scope: !204, file: !62, line: 205, column: 4)
!211 = !DILocation(line: 206, column: 13, scope: !209)
!212 = !DILocation(line: 206, column: 8, scope: !210)
!213 = !DILocation(line: 208, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !62, line: 208, column: 9)
!215 = distinct !DILexicalBlock(scope: !209, file: !62, line: 207, column: 5)
!216 = !DILocation(line: 208, column: 14, scope: !214)
!217 = !DILocation(line: 208, column: 9, scope: !215)
!218 = !DILocation(line: 210, column: 14, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !62, line: 209, column: 6)
!220 = !DILocation(line: 210, column: 7, scope: !219)
!221 = !DILocation(line: 214, column: 7, scope: !222)
!222 = distinct !DILexicalBlock(scope: !214, file: !62, line: 213, column: 6)
!223 = !DILocation(line: 219, column: 6, scope: !224)
!224 = distinct !DILexicalBlock(scope: !209, file: !62, line: 218, column: 5)
!225 = !DILocation(line: 224, column: 12, scope: !226)
!226 = distinct !DILexicalBlock(scope: !204, file: !62, line: 223, column: 4)
!227 = !DILocation(line: 224, column: 17, scope: !226)
!228 = !DILocation(line: 224, column: 10, scope: !226)
!229 = !DILocation(line: 225, column: 8, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !62, line: 225, column: 8)
!231 = !DILocation(line: 225, column: 13, scope: !230)
!232 = !DILocation(line: 225, column: 8, scope: !226)
!233 = !DILocation(line: 227, column: 9, scope: !234)
!234 = distinct !DILexicalBlock(scope: !235, file: !62, line: 227, column: 9)
!235 = distinct !DILexicalBlock(scope: !230, file: !62, line: 226, column: 5)
!236 = !DILocation(line: 227, column: 14, scope: !234)
!237 = !DILocation(line: 227, column: 9, scope: !235)
!238 = !DILocation(line: 229, column: 14, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !62, line: 228, column: 6)
!240 = !DILocation(line: 229, column: 7, scope: !239)
!241 = !DILocation(line: 233, column: 7, scope: !242)
!242 = distinct !DILexicalBlock(scope: !234, file: !62, line: 232, column: 6)
!243 = !DILocation(line: 238, column: 6, scope: !244)
!244 = distinct !DILexicalBlock(scope: !230, file: !62, line: 237, column: 5)
!245 = !DILocation(line: 244, column: 11, scope: !246)
!246 = distinct !DILexicalBlock(scope: !199, file: !62, line: 243, column: 3)
!247 = !DILocation(line: 244, column: 16, scope: !246)
!248 = !DILocation(line: 244, column: 9, scope: !246)
!249 = !DILocation(line: 245, column: 7, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !62, line: 245, column: 7)
!251 = !DILocation(line: 245, column: 12, scope: !250)
!252 = !DILocation(line: 245, column: 7, scope: !246)
!253 = !DILocation(line: 247, column: 8, scope: !254)
!254 = distinct !DILexicalBlock(scope: !255, file: !62, line: 247, column: 8)
!255 = distinct !DILexicalBlock(scope: !250, file: !62, line: 246, column: 4)
!256 = !DILocation(line: 247, column: 13, scope: !254)
!257 = !DILocation(line: 247, column: 8, scope: !255)
!258 = !DILocation(line: 249, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !254, file: !62, line: 248, column: 5)
!260 = !DILocation(line: 249, column: 6, scope: !259)
!261 = !DILocation(line: 253, column: 6, scope: !262)
!262 = distinct !DILexicalBlock(scope: !254, file: !62, line: 252, column: 5)
!263 = !DILocation(line: 258, column: 5, scope: !264)
!264 = distinct !DILexicalBlock(scope: !250, file: !62, line: 257, column: 4)
!265 = !DILocation(line: 262, column: 1, scope: !116)
!266 = distinct !DISubprogram(name: "s32_hip1_s32_u16_u16_u16_fac1", scope: !62, file: !62, line: 282, type: !267, scopeLine: 283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!267 = !DISubroutineType(types: !268)
!268 = !{!78, !78, !68, !68, !68}
!269 = !DILocalVariable(name: "yold", arg: 1, scope: !266, file: !62, line: 282, type: !78)
!270 = !DILocation(line: 282, column: 39, scope: !266)
!271 = !DILocalVariable(name: "u", arg: 2, scope: !266, file: !62, line: 282, type: !68)
!272 = !DILocation(line: 282, column: 49, scope: !266)
!273 = !DILocalVariable(name: "uold", arg: 3, scope: !266, file: !62, line: 282, type: !68)
!274 = !DILocation(line: 282, column: 56, scope: !266)
!275 = !DILocalVariable(name: "m", arg: 4, scope: !266, file: !62, line: 282, type: !68)
!276 = !DILocation(line: 282, column: 66, scope: !266)
!277 = !DILocalVariable(name: "s32TempHW", scope: !266, file: !62, line: 284, type: !78)
!278 = !DILocation(line: 284, column: 6, scope: !266)
!279 = !DILocalVariable(name: "s32TempLW", scope: !266, file: !62, line: 284, type: !78)
!280 = !DILocation(line: 284, column: 21, scope: !266)
!281 = !DILocalVariable(name: "s32Temp0", scope: !266, file: !62, line: 284, type: !78)
!282 = !DILocation(line: 284, column: 37, scope: !266)
!283 = !DILocalVariable(name: "s32Temp1", scope: !266, file: !62, line: 284, type: !78)
!284 = !DILocation(line: 284, column: 52, scope: !266)
!285 = !DILocalVariable(name: "s32Result", scope: !266, file: !62, line: 284, type: !78)
!286 = !DILocation(line: 284, column: 66, scope: !266)
!287 = !DILocation(line: 285, column: 6, scope: !266)
!288 = !DILocation(line: 285, column: 8, scope: !266)
!289 = !DILocation(line: 285, column: 4, scope: !266)
!290 = !DILocation(line: 286, column: 26, scope: !266)
!291 = !DILocation(line: 286, column: 31, scope: !266)
!292 = !DILocation(line: 286, column: 14, scope: !266)
!293 = !DILocation(line: 286, column: 12, scope: !266)
!294 = !DILocation(line: 287, column: 14, scope: !266)
!295 = !DILocation(line: 287, column: 21, scope: !266)
!296 = !DILocation(line: 287, column: 19, scope: !266)
!297 = !DILocation(line: 287, column: 12, scope: !266)
!298 = !DILocation(line: 288, column: 26, scope: !266)
!299 = !DILocation(line: 288, column: 14, scope: !266)
!300 = !DILocation(line: 288, column: 42, scope: !266)
!301 = !DILocation(line: 288, column: 59, scope: !266)
!302 = !DILocation(line: 288, column: 69, scope: !266)
!303 = !DILocation(line: 288, column: 56, scope: !266)
!304 = !DILocation(line: 288, column: 11, scope: !266)
!305 = !DILocation(line: 289, column: 14, scope: !266)
!306 = !DILocation(line: 289, column: 18, scope: !266)
!307 = !DILocation(line: 289, column: 16, scope: !266)
!308 = !DILocation(line: 289, column: 11, scope: !266)
!309 = !DILocation(line: 290, column: 14, scope: !266)
!310 = !DILocation(line: 290, column: 21, scope: !266)
!311 = !DILocation(line: 290, column: 19, scope: !266)
!312 = !DILocation(line: 290, column: 33, scope: !266)
!313 = !DILocation(line: 290, column: 42, scope: !266)
!314 = !DILocation(line: 290, column: 30, scope: !266)
!315 = !DILocation(line: 290, column: 12, scope: !266)
!316 = !DILocation(line: 291, column: 5, scope: !317)
!317 = distinct !DILexicalBlock(scope: !266, file: !62, line: 291, column: 5)
!318 = !DILocation(line: 291, column: 18, scope: !317)
!319 = !DILocation(line: 291, column: 15, scope: !317)
!320 = !DILocation(line: 291, column: 5, scope: !266)
!321 = !DILocation(line: 293, column: 6, scope: !322)
!322 = distinct !DILexicalBlock(scope: !323, file: !62, line: 293, column: 6)
!323 = distinct !DILexicalBlock(scope: !317, file: !62, line: 292, column: 2)
!324 = !DILocation(line: 293, column: 11, scope: !322)
!325 = !DILocation(line: 293, column: 6, scope: !323)
!326 = !DILocation(line: 295, column: 12, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !62, line: 294, column: 3)
!328 = !DILocation(line: 295, column: 22, scope: !327)
!329 = !DILocation(line: 295, column: 4, scope: !327)
!330 = !DILocation(line: 299, column: 12, scope: !331)
!331 = distinct !DILexicalBlock(scope: !322, file: !62, line: 298, column: 3)
!332 = !DILocation(line: 299, column: 22, scope: !331)
!333 = !DILocation(line: 299, column: 4, scope: !331)
!334 = !DILocation(line: 304, column: 10, scope: !335)
!335 = distinct !DILexicalBlock(scope: !317, file: !62, line: 303, column: 2)
!336 = !DILocation(line: 304, column: 3, scope: !335)
!337 = !DILocation(line: 306, column: 1, scope: !266)
!338 = distinct !DISubprogram(name: "s32_hip1_s32_s16_s16_u16_fac1", scope: !62, file: !62, line: 326, type: !339, scopeLine: 327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!339 = !DISubroutineType(types: !340)
!340 = !{!78, !78, !65, !65, !68}
!341 = !DILocalVariable(name: "yold", arg: 1, scope: !338, file: !62, line: 326, type: !78)
!342 = !DILocation(line: 326, column: 39, scope: !338)
!343 = !DILocalVariable(name: "u", arg: 2, scope: !338, file: !62, line: 326, type: !65)
!344 = !DILocation(line: 326, column: 49, scope: !338)
!345 = !DILocalVariable(name: "uold", arg: 3, scope: !338, file: !62, line: 326, type: !65)
!346 = !DILocation(line: 326, column: 56, scope: !338)
!347 = !DILocalVariable(name: "m", arg: 4, scope: !338, file: !62, line: 326, type: !68)
!348 = !DILocation(line: 326, column: 66, scope: !338)
!349 = !DILocalVariable(name: "s32TempHW", scope: !338, file: !62, line: 328, type: !78)
!350 = !DILocation(line: 328, column: 6, scope: !338)
!351 = !DILocalVariable(name: "s32TempLW", scope: !338, file: !62, line: 328, type: !78)
!352 = !DILocation(line: 328, column: 21, scope: !338)
!353 = !DILocalVariable(name: "s32Temp0", scope: !338, file: !62, line: 328, type: !78)
!354 = !DILocation(line: 328, column: 37, scope: !338)
!355 = !DILocalVariable(name: "s32Temp1", scope: !338, file: !62, line: 328, type: !78)
!356 = !DILocation(line: 328, column: 52, scope: !338)
!357 = !DILocalVariable(name: "s32Result", scope: !338, file: !62, line: 328, type: !78)
!358 = !DILocation(line: 328, column: 66, scope: !338)
!359 = !DILocation(line: 329, column: 6, scope: !338)
!360 = !DILocation(line: 329, column: 8, scope: !338)
!361 = !DILocation(line: 329, column: 4, scope: !338)
!362 = !DILocation(line: 330, column: 26, scope: !338)
!363 = !DILocation(line: 330, column: 31, scope: !338)
!364 = !DILocation(line: 330, column: 14, scope: !338)
!365 = !DILocation(line: 330, column: 12, scope: !338)
!366 = !DILocation(line: 331, column: 14, scope: !338)
!367 = !DILocation(line: 331, column: 21, scope: !338)
!368 = !DILocation(line: 331, column: 19, scope: !338)
!369 = !DILocation(line: 331, column: 12, scope: !338)
!370 = !DILocation(line: 332, column: 26, scope: !338)
!371 = !DILocation(line: 332, column: 14, scope: !338)
!372 = !DILocation(line: 332, column: 42, scope: !338)
!373 = !DILocation(line: 332, column: 59, scope: !338)
!374 = !DILocation(line: 332, column: 69, scope: !338)
!375 = !DILocation(line: 332, column: 56, scope: !338)
!376 = !DILocation(line: 332, column: 11, scope: !338)
!377 = !DILocation(line: 333, column: 14, scope: !338)
!378 = !DILocation(line: 333, column: 18, scope: !338)
!379 = !DILocation(line: 333, column: 16, scope: !338)
!380 = !DILocation(line: 333, column: 11, scope: !338)
!381 = !DILocation(line: 334, column: 14, scope: !338)
!382 = !DILocation(line: 334, column: 21, scope: !338)
!383 = !DILocation(line: 334, column: 19, scope: !338)
!384 = !DILocation(line: 334, column: 33, scope: !338)
!385 = !DILocation(line: 334, column: 42, scope: !338)
!386 = !DILocation(line: 334, column: 30, scope: !338)
!387 = !DILocation(line: 334, column: 12, scope: !338)
!388 = !DILocation(line: 335, column: 5, scope: !389)
!389 = distinct !DILexicalBlock(scope: !338, file: !62, line: 335, column: 5)
!390 = !DILocation(line: 335, column: 18, scope: !389)
!391 = !DILocation(line: 335, column: 15, scope: !389)
!392 = !DILocation(line: 335, column: 5, scope: !338)
!393 = !DILocation(line: 337, column: 6, scope: !394)
!394 = distinct !DILexicalBlock(scope: !395, file: !62, line: 337, column: 6)
!395 = distinct !DILexicalBlock(scope: !389, file: !62, line: 336, column: 2)
!396 = !DILocation(line: 337, column: 11, scope: !394)
!397 = !DILocation(line: 337, column: 6, scope: !395)
!398 = !DILocation(line: 339, column: 12, scope: !399)
!399 = distinct !DILexicalBlock(scope: !394, file: !62, line: 338, column: 3)
!400 = !DILocation(line: 339, column: 22, scope: !399)
!401 = !DILocation(line: 339, column: 4, scope: !399)
!402 = !DILocation(line: 343, column: 12, scope: !403)
!403 = distinct !DILexicalBlock(scope: !394, file: !62, line: 342, column: 3)
!404 = !DILocation(line: 343, column: 22, scope: !403)
!405 = !DILocation(line: 343, column: 4, scope: !403)
!406 = !DILocation(line: 348, column: 10, scope: !407)
!407 = distinct !DILexicalBlock(scope: !389, file: !62, line: 347, column: 2)
!408 = !DILocation(line: 348, column: 3, scope: !407)
!409 = !DILocation(line: 350, column: 1, scope: !338)
