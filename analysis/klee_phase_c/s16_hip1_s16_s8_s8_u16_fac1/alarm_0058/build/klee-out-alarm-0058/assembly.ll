; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0058.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"yold\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"uold\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/hip_Ccode.c\00", align 1
@.str.1.5 = private unnamed_addr constant [92 x i8] c"KLEE-ALARM-0058: invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);\00", align 1
@.str.2.6 = private unnamed_addr constant [20 x i8] c"klee-alarm-0058.err\00", align 1
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
  call void @llvm.dbg.declare(metadata i8* %u, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i8* %uold, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i16* %m, metadata !39, metadata !DIExpression()), !dbg !44
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
  %call = call signext i16 @s16_hip1_s16_s8_s8_u16_fac1(i16 signext %2, i8 signext %3, i8 signext %4, i16 zeroext %5), !dbg !57
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
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !80, metadata !DIExpression()), !dbg !84
  store i32 0, i32* %s32Temp1, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 0, i32* %s32Temp2, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i16* %s16u, metadata !87, metadata !DIExpression()), !dbg !88
  store i16 0, i16* %s16u, align 2, !dbg !88
  call void @llvm.dbg.declare(metadata i16* %u16uold, metadata !89, metadata !DIExpression()), !dbg !90
  store i16 0, i16* %u16uold, align 2, !dbg !90
  %0 = load i8, i8* %u.addr, align 1, !dbg !91
  %conv = zext i8 %0 to i32, !dbg !91
  %1 = load i8, i8* %uold.addr, align 1, !dbg !92
  %conv1 = zext i8 %1 to i32, !dbg !92
  %sub = sub nsw i32 %conv, %conv1, !dbg !93
  %shl = shl i32 %sub, 7, !dbg !94
  %conv2 = trunc i32 %shl to i16, !dbg !95
  store i16 %conv2, i16* %u16uold, align 2, !dbg !96
  %2 = load i16, i16* %yold.addr, align 2, !dbg !97
  %conv3 = sext i16 %2 to i32, !dbg !97
  %3 = load i16, i16* %m.addr, align 2, !dbg !98
  %conv4 = zext i16 %3 to i32, !dbg !98
  %mul = mul nsw i32 %conv3, %conv4, !dbg !99
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !100
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !101
  %div = sdiv i32 %4, 65536, !dbg !102
  %mul5 = mul nsw i32 %div, 65536, !dbg !103
  store i32 %mul5, i32* %s32Temp2, align 4, !dbg !104
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !105
  %6 = load i32, i32* %s32Temp2, align 4, !dbg !106
  %sub6 = sub nsw i32 %5, %6, !dbg !107
  store i32 %sub6, i32* %s32Temp2, align 4, !dbg !108
  %7 = load i32, i32* %s32Temp2, align 4, !dbg !109
  %shl7 = shl i32 %7, 1, !dbg !110
  store i32 %shl7, i32* %s32Temp2, align 4, !dbg !111
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !112
  %div8 = sdiv i32 %8, 65536, !dbg !113
  store i32 %div8, i32* %s32Temp2, align 4, !dbg !114
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !115
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !116
  %div9 = sdiv i32 %10, 65536, !dbg !117
  %add = add nsw i32 %9, %div9, !dbg !118
  store i32 %add, i32* %s32Temp2, align 4, !dbg !119
  %11 = load i16, i16* %yold.addr, align 2, !dbg !120
  %conv10 = sext i16 %11 to i32, !dbg !120
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !121
  %sub11 = sub nsw i32 %conv10, %12, !dbg !122
  store i32 %sub11, i32* %s32Temp2, align 4, !dbg !123
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !124
  %14 = load i16, i16* %u16uold, align 2, !dbg !125
  %conv12 = zext i16 %14 to i32, !dbg !125
  %add13 = add nsw i32 %13, %conv12, !dbg !126
  %conv14 = trunc i32 %add13 to i16, !dbg !124
  store i16 %conv14, i16* %s16u, align 2, !dbg !127
  %15 = load i16, i16* %yold.addr, align 2, !dbg !128
  %conv15 = sext i16 %15 to i32, !dbg !128
  %16 = load i16, i16* %s16u, align 2, !dbg !130
  %conv16 = sext i16 %16 to i32, !dbg !130
  %cmp = icmp ne i32 %conv15, %conv16, !dbg !131
  br i1 %cmp, label %if.then, label %if.else27, !dbg !132

if.then:                                          ; preds = %entry
  %17 = load i16, i16* %s16u, align 2, !dbg !133
  %conv18 = sext i16 %17 to i32, !dbg !133
  %cmp19 = icmp sle i32 %conv18, 32767, !dbg !136
  br i1 %cmp19, label %if.then21, label %if.else26, !dbg !137

if.then21:                                        ; preds = %if.then
  %18 = load i16, i16* %s16u, align 2, !dbg !138
  %conv22 = sext i16 %18 to i32, !dbg !138
  %cmp23 = icmp sge i32 %conv22, -32768, !dbg !141
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !142

if.then25:                                        ; preds = %if.then21
  %19 = load i16, i16* %s16u, align 2, !dbg !143
  store i16 %19, i16* %retval, align 2, !dbg !145
  br label %return, !dbg !145

if.else:                                          ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !146
  br label %return, !dbg !146

if.else26:                                        ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !148
  br label %return, !dbg !148

if.else27:                                        ; preds = %entry
  %20 = load i16, i16* %yold.addr, align 2, !dbg !150
  %conv28 = sext i16 %20 to i32, !dbg !150
  %cmp29 = icmp sle i32 %conv28, 0, !dbg !153
  br i1 %cmp29, label %if.then31, label %if.else60, !dbg !154

if.then31:                                        ; preds = %if.else27
  %21 = load i16, i16* %yold.addr, align 2, !dbg !155
  %conv32 = sext i16 %21 to i32, !dbg !155
  %cmp33 = icmp eq i32 %conv32, 0, !dbg !158
  br i1 %cmp33, label %if.then35, label %if.else46, !dbg !159

if.then35:                                        ; preds = %if.then31
  %22 = load i16, i16* %s16u, align 2, !dbg !160
  %conv36 = sext i16 %22 to i32, !dbg !160
  %cmp37 = icmp sle i32 %conv36, 32767, !dbg !163
  br i1 %cmp37, label %if.then39, label %if.else45, !dbg !164

if.then39:                                        ; preds = %if.then35
  %23 = load i16, i16* %s16u, align 2, !dbg !165
  %conv40 = sext i16 %23 to i32, !dbg !165
  %cmp41 = icmp sge i32 %conv40, -32768, !dbg !168
  br i1 %cmp41, label %if.then43, label %if.else44, !dbg !169

if.then43:                                        ; preds = %if.then39
  %24 = load i16, i16* %s16u, align 2, !dbg !170
  store i16 %24, i16* %retval, align 2, !dbg !172
  br label %return, !dbg !172

if.else44:                                        ; preds = %if.then39
  store i16 -32768, i16* %retval, align 2, !dbg !173
  br label %return, !dbg !173

if.else45:                                        ; preds = %if.then35
  store i16 32767, i16* %retval, align 2, !dbg !175
  br label %return, !dbg !175

if.else46:                                        ; preds = %if.then31
  %25 = load i16, i16* %s16u, align 2, !dbg !177
  %conv47 = sext i16 %25 to i32, !dbg !177
  %add48 = add nsw i32 %conv47, 1, !dbg !179
  %conv49 = trunc i32 %add48 to i16, !dbg !177
  store i16 %conv49, i16* %s16u, align 2, !dbg !180
  %26 = load i16, i16* %s16u, align 2, !dbg !181
  %conv50 = sext i16 %26 to i32, !dbg !181
  %cmp51 = icmp sle i32 %conv50, 32767, !dbg !183
  br i1 %cmp51, label %if.then53, label %if.else59, !dbg !184

if.then53:                                        ; preds = %if.else46
  %27 = load i16, i16* %s16u, align 2, !dbg !185
  %conv54 = sext i16 %27 to i32, !dbg !185
  %cmp55 = icmp sge i32 %conv54, -32768, !dbg !188
  br i1 %cmp55, label %if.then57, label %if.else58, !dbg !189

if.then57:                                        ; preds = %if.then53
  %28 = load i16, i16* %s16u, align 2, !dbg !190
  store i16 %28, i16* %retval, align 2, !dbg !192
  br label %return, !dbg !192

if.else58:                                        ; preds = %if.then53
  store i16 -32768, i16* %retval, align 2, !dbg !193
  br label %return, !dbg !193

if.else59:                                        ; preds = %if.else46
  store i16 32767, i16* %retval, align 2, !dbg !195
  br label %return, !dbg !195

if.else60:                                        ; preds = %if.else27
  %29 = load i16, i16* %s16u, align 2, !dbg !197
  %conv61 = sext i16 %29 to i32, !dbg !197
  %sub62 = sub nsw i32 %conv61, 1, !dbg !199
  %conv63 = trunc i32 %sub62 to i16, !dbg !197
  store i16 %conv63, i16* %s16u, align 2, !dbg !200
  %30 = load i16, i16* %s16u, align 2, !dbg !201
  %conv64 = sext i16 %30 to i32, !dbg !201
  %cmp65 = icmp sle i32 %conv64, 32767, !dbg !203
  br i1 %cmp65, label %if.then67, label %if.else73, !dbg !204

if.then67:                                        ; preds = %if.else60
  %31 = load i16, i16* %s16u, align 2, !dbg !205
  %conv68 = sext i16 %31 to i32, !dbg !205
  %cmp69 = icmp sge i32 %conv68, -32768, !dbg !208
  br i1 %cmp69, label %if.then71, label %if.else72, !dbg !209

if.then71:                                        ; preds = %if.then67
  %32 = load i16, i16* %s16u, align 2, !dbg !210
  store i16 %32, i16* %retval, align 2, !dbg !212
  br label %return, !dbg !212

if.else72:                                        ; preds = %if.then67
  store i16 -32768, i16* %retval, align 2, !dbg !213
  br label %return, !dbg !213

if.else73:                                        ; preds = %if.else60
  store i16 32767, i16* %retval, align 2, !dbg !215
  br label %return, !dbg !215

return:                                           ; preds = %if.else73, %if.else72, %if.then71, %if.else59, %if.else58, %if.then57, %if.else45, %if.else44, %if.then43, %if.else26, %if.else, %if.then25
  %33 = load i16, i16* %retval, align 2, !dbg !217
  ret i16 %33, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_hip1_s16_s8_s8_u16_fac1(i16 signext %yold, i8 signext %u, i8 signext %uold, i16 zeroext %m) #0 !dbg !218 {
entry:
  %yold.addr = alloca i16, align 2
  %u.addr = alloca i8, align 1
  %uold.addr = alloca i8, align 1
  %m.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s16u = alloca i32, align 4
  %s16uold = alloca i16, align 2
  store i16 %yold, i16* %yold.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %yold.addr, metadata !222, metadata !DIExpression()), !dbg !223
  store i8 %u, i8* %u.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %u.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i8 %uold, i8* %uold.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %uold.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store i16 %m, i16* %m.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %m.addr, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 0, i32* %s32Temp1, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !232, metadata !DIExpression()), !dbg !233
  store i32 0, i32* %s32Temp2, align 4, !dbg !233
  call void @llvm.dbg.declare(metadata i32* %s16u, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 0, i32* %s16u, align 4, !dbg !235
  call void @llvm.dbg.declare(metadata i16* %s16uold, metadata !236, metadata !DIExpression()), !dbg !237
  store i16 0, i16* %s16uold, align 2, !dbg !237
  %0 = load i8, i8* %u.addr, align 1, !dbg !238
  %conv = sext i8 %0 to i32, !dbg !240
  %1 = load i8, i8* %uold.addr, align 1, !dbg !241
  %conv1 = sext i8 %1 to i32, !dbg !242
  %sub = sub nsw i32 %conv, %conv1, !dbg !243
  %conv2 = sext i32 %sub to i64, !dbg !244
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv2), !dbg !245
  %tobool = icmp ne i32 %call, 0, !dbg !245
  br i1 %tobool, label %if.end, label %if.then, !dbg !246

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i32 167, i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.6, i64 0, i64 0)) #4, !dbg !247
  unreachable, !dbg !247

if.end:                                           ; preds = %entry
  %2 = load i8, i8* %u.addr, align 1, !dbg !249
  %conv3 = sext i8 %2 to i32, !dbg !250
  %3 = load i8, i8* %uold.addr, align 1, !dbg !251
  %conv4 = sext i8 %3 to i32, !dbg !252
  %sub5 = sub nsw i32 %conv3, %conv4, !dbg !253
  %shl = shl i32 %sub5, 7, !dbg !254
  %conv6 = sext i32 %shl to i64, !dbg !255
  store volatile i64 %conv6, i64* @klee_alarm_sink_s64, align 8, !dbg !256
  ret i16 0, !dbg !257
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !258 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !261, metadata !DIExpression()), !dbg !262
  %0 = load i64, i64* %left.addr, align 8, !dbg !263
  %cmp = icmp sge i64 %0, 0, !dbg !264
  %conv = zext i1 %cmp to i32, !dbg !264
  ret i32 %conv, !dbg !265
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058/hip_Ccode_alarm_0058.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!0}
!13 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058")
!14 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058")
!17 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = distinct !DISubprogram(name: "main", scope: !24, file: !24, line: 7, type: !25, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !4)
!24 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058")
!25 = !DISubroutineType(types: !26)
!26 = !{!11}
!27 = !DILocalVariable(name: "yold", scope: !23, file: !24, line: 9, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !30)
!30 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!31 = !DILocation(line: 9, column: 13, scope: !23)
!32 = !DILocalVariable(name: "u", scope: !23, file: !24, line: 10, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 24, baseType: !34)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 37, baseType: !35)
!35 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!36 = !DILocation(line: 10, column: 12, scope: !23)
!37 = !DILocalVariable(name: "uold", scope: !23, file: !24, line: 11, type: !33)
!38 = !DILocation(line: 11, column: 12, scope: !23)
!39 = !DILocalVariable(name: "m", scope: !23, file: !24, line: 12, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !41, line: 25, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
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
!62 = !DIFile(filename: "src_analysis/sources/hip_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058")
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !67, !67, !71}
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !66, line: 9, baseType: !28)
!66 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058")
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !66, line: 6, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !41, line: 24, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !70)
!70 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !66, line: 8, baseType: !40)
!72 = !DILocalVariable(name: "yold", arg: 1, scope: !61, file: !62, line: 44, type: !65)
!73 = !DILocation(line: 44, column: 37, scope: !61)
!74 = !DILocalVariable(name: "u", arg: 2, scope: !61, file: !62, line: 44, type: !67)
!75 = !DILocation(line: 44, column: 46, scope: !61)
!76 = !DILocalVariable(name: "uold", arg: 3, scope: !61, file: !62, line: 44, type: !67)
!77 = !DILocation(line: 44, column: 52, scope: !61)
!78 = !DILocalVariable(name: "m", arg: 4, scope: !61, file: !62, line: 44, type: !71)
!79 = !DILocation(line: 44, column: 62, scope: !61)
!80 = !DILocalVariable(name: "s32Temp1", scope: !61, file: !62, line: 46, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !66, line: 11, baseType: !82)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!84 = !DILocation(line: 46, column: 6, scope: !61)
!85 = !DILocalVariable(name: "s32Temp2", scope: !61, file: !62, line: 46, type: !81)
!86 = !DILocation(line: 46, column: 20, scope: !61)
!87 = !DILocalVariable(name: "s16u", scope: !61, file: !62, line: 47, type: !65)
!88 = !DILocation(line: 47, column: 6, scope: !61)
!89 = !DILocalVariable(name: "u16uold", scope: !61, file: !62, line: 48, type: !71)
!90 = !DILocation(line: 48, column: 6, scope: !61)
!91 = !DILocation(line: 49, column: 13, scope: !61)
!92 = !DILocation(line: 49, column: 17, scope: !61)
!93 = !DILocation(line: 49, column: 15, scope: !61)
!94 = !DILocation(line: 49, column: 23, scope: !61)
!95 = !DILocation(line: 49, column: 12, scope: !61)
!96 = !DILocation(line: 49, column: 10, scope: !61)
!97 = !DILocation(line: 50, column: 13, scope: !61)
!98 = !DILocation(line: 50, column: 20, scope: !61)
!99 = !DILocation(line: 50, column: 18, scope: !61)
!100 = !DILocation(line: 50, column: 11, scope: !61)
!101 = !DILocation(line: 51, column: 14, scope: !61)
!102 = !DILocation(line: 51, column: 22, scope: !61)
!103 = !DILocation(line: 51, column: 32, scope: !61)
!104 = !DILocation(line: 51, column: 11, scope: !61)
!105 = !DILocation(line: 52, column: 13, scope: !61)
!106 = !DILocation(line: 52, column: 24, scope: !61)
!107 = !DILocation(line: 52, column: 22, scope: !61)
!108 = !DILocation(line: 52, column: 11, scope: !61)
!109 = !DILocation(line: 53, column: 13, scope: !61)
!110 = !DILocation(line: 53, column: 22, scope: !61)
!111 = !DILocation(line: 53, column: 11, scope: !61)
!112 = !DILocation(line: 54, column: 13, scope: !61)
!113 = !DILocation(line: 54, column: 22, scope: !61)
!114 = !DILocation(line: 54, column: 11, scope: !61)
!115 = !DILocation(line: 55, column: 13, scope: !61)
!116 = !DILocation(line: 55, column: 25, scope: !61)
!117 = !DILocation(line: 55, column: 33, scope: !61)
!118 = !DILocation(line: 55, column: 22, scope: !61)
!119 = !DILocation(line: 55, column: 11, scope: !61)
!120 = !DILocation(line: 56, column: 13, scope: !61)
!121 = !DILocation(line: 56, column: 20, scope: !61)
!122 = !DILocation(line: 56, column: 18, scope: !61)
!123 = !DILocation(line: 56, column: 11, scope: !61)
!124 = !DILocation(line: 57, column: 9, scope: !61)
!125 = !DILocation(line: 57, column: 20, scope: !61)
!126 = !DILocation(line: 57, column: 18, scope: !61)
!127 = !DILocation(line: 57, column: 7, scope: !61)
!128 = !DILocation(line: 58, column: 5, scope: !129)
!129 = distinct !DILexicalBlock(scope: !61, file: !62, line: 58, column: 5)
!130 = !DILocation(line: 58, column: 13, scope: !129)
!131 = !DILocation(line: 58, column: 10, scope: !129)
!132 = !DILocation(line: 58, column: 5, scope: !61)
!133 = !DILocation(line: 60, column: 6, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !62, line: 60, column: 6)
!135 = distinct !DILexicalBlock(scope: !129, file: !62, line: 59, column: 2)
!136 = !DILocation(line: 60, column: 11, scope: !134)
!137 = !DILocation(line: 60, column: 6, scope: !135)
!138 = !DILocation(line: 62, column: 7, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !62, line: 62, column: 7)
!140 = distinct !DILexicalBlock(scope: !134, file: !62, line: 61, column: 3)
!141 = !DILocation(line: 62, column: 12, scope: !139)
!142 = !DILocation(line: 62, column: 7, scope: !140)
!143 = !DILocation(line: 64, column: 12, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !62, line: 63, column: 4)
!145 = !DILocation(line: 64, column: 5, scope: !144)
!146 = !DILocation(line: 68, column: 5, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !62, line: 67, column: 4)
!148 = !DILocation(line: 73, column: 4, scope: !149)
!149 = distinct !DILexicalBlock(scope: !134, file: !62, line: 72, column: 3)
!150 = !DILocation(line: 78, column: 6, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !62, line: 78, column: 6)
!152 = distinct !DILexicalBlock(scope: !129, file: !62, line: 77, column: 2)
!153 = !DILocation(line: 78, column: 11, scope: !151)
!154 = !DILocation(line: 78, column: 6, scope: !152)
!155 = !DILocation(line: 80, column: 7, scope: !156)
!156 = distinct !DILexicalBlock(scope: !157, file: !62, line: 80, column: 7)
!157 = distinct !DILexicalBlock(scope: !151, file: !62, line: 79, column: 3)
!158 = !DILocation(line: 80, column: 12, scope: !156)
!159 = !DILocation(line: 80, column: 7, scope: !157)
!160 = !DILocation(line: 82, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !162, file: !62, line: 82, column: 8)
!162 = distinct !DILexicalBlock(scope: !156, file: !62, line: 81, column: 4)
!163 = !DILocation(line: 82, column: 13, scope: !161)
!164 = !DILocation(line: 82, column: 8, scope: !162)
!165 = !DILocation(line: 84, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !62, line: 84, column: 9)
!167 = distinct !DILexicalBlock(scope: !161, file: !62, line: 83, column: 5)
!168 = !DILocation(line: 84, column: 14, scope: !166)
!169 = !DILocation(line: 84, column: 9, scope: !167)
!170 = !DILocation(line: 86, column: 14, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !62, line: 85, column: 6)
!172 = !DILocation(line: 86, column: 7, scope: !171)
!173 = !DILocation(line: 90, column: 7, scope: !174)
!174 = distinct !DILexicalBlock(scope: !166, file: !62, line: 89, column: 6)
!175 = !DILocation(line: 95, column: 6, scope: !176)
!176 = distinct !DILexicalBlock(scope: !161, file: !62, line: 94, column: 5)
!177 = !DILocation(line: 100, column: 12, scope: !178)
!178 = distinct !DILexicalBlock(scope: !156, file: !62, line: 99, column: 4)
!179 = !DILocation(line: 100, column: 17, scope: !178)
!180 = !DILocation(line: 100, column: 10, scope: !178)
!181 = !DILocation(line: 101, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !62, line: 101, column: 8)
!183 = !DILocation(line: 101, column: 13, scope: !182)
!184 = !DILocation(line: 101, column: 8, scope: !178)
!185 = !DILocation(line: 103, column: 9, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !62, line: 103, column: 9)
!187 = distinct !DILexicalBlock(scope: !182, file: !62, line: 102, column: 5)
!188 = !DILocation(line: 103, column: 14, scope: !186)
!189 = !DILocation(line: 103, column: 9, scope: !187)
!190 = !DILocation(line: 105, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !62, line: 104, column: 6)
!192 = !DILocation(line: 105, column: 7, scope: !191)
!193 = !DILocation(line: 109, column: 7, scope: !194)
!194 = distinct !DILexicalBlock(scope: !186, file: !62, line: 108, column: 6)
!195 = !DILocation(line: 114, column: 6, scope: !196)
!196 = distinct !DILexicalBlock(scope: !182, file: !62, line: 113, column: 5)
!197 = !DILocation(line: 120, column: 11, scope: !198)
!198 = distinct !DILexicalBlock(scope: !151, file: !62, line: 119, column: 3)
!199 = !DILocation(line: 120, column: 16, scope: !198)
!200 = !DILocation(line: 120, column: 9, scope: !198)
!201 = !DILocation(line: 121, column: 7, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !62, line: 121, column: 7)
!203 = !DILocation(line: 121, column: 12, scope: !202)
!204 = !DILocation(line: 121, column: 7, scope: !198)
!205 = !DILocation(line: 123, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !207, file: !62, line: 123, column: 8)
!207 = distinct !DILexicalBlock(scope: !202, file: !62, line: 122, column: 4)
!208 = !DILocation(line: 123, column: 13, scope: !206)
!209 = !DILocation(line: 123, column: 8, scope: !207)
!210 = !DILocation(line: 125, column: 13, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !62, line: 124, column: 5)
!212 = !DILocation(line: 125, column: 6, scope: !211)
!213 = !DILocation(line: 129, column: 6, scope: !214)
!214 = distinct !DILexicalBlock(scope: !206, file: !62, line: 128, column: 5)
!215 = !DILocation(line: 134, column: 5, scope: !216)
!216 = distinct !DILexicalBlock(scope: !202, file: !62, line: 133, column: 4)
!217 = !DILocation(line: 138, column: 1, scope: !61)
!218 = distinct !DISubprogram(name: "s16_hip1_s16_s8_s8_u16_fac1", scope: !62, file: !62, line: 158, type: !219, scopeLine: 159, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!219 = !DISubroutineType(types: !220)
!220 = !{!65, !65, !221, !221, !71}
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !66, line: 7, baseType: !33)
!222 = !DILocalVariable(name: "yold", arg: 1, scope: !218, file: !62, line: 158, type: !65)
!223 = !DILocation(line: 158, column: 37, scope: !218)
!224 = !DILocalVariable(name: "u", arg: 2, scope: !218, file: !62, line: 158, type: !221)
!225 = !DILocation(line: 158, column: 46, scope: !218)
!226 = !DILocalVariable(name: "uold", arg: 3, scope: !218, file: !62, line: 158, type: !221)
!227 = !DILocation(line: 158, column: 52, scope: !218)
!228 = !DILocalVariable(name: "m", arg: 4, scope: !218, file: !62, line: 158, type: !71)
!229 = !DILocation(line: 158, column: 62, scope: !218)
!230 = !DILocalVariable(name: "s32Temp1", scope: !218, file: !62, line: 160, type: !81)
!231 = !DILocation(line: 160, column: 6, scope: !218)
!232 = !DILocalVariable(name: "s32Temp2", scope: !218, file: !62, line: 160, type: !81)
!233 = !DILocation(line: 160, column: 20, scope: !218)
!234 = !DILocalVariable(name: "s16u", scope: !218, file: !62, line: 161, type: !81)
!235 = !DILocation(line: 161, column: 6, scope: !218)
!236 = !DILocalVariable(name: "s16uold", scope: !218, file: !62, line: 162, type: !65)
!237 = !DILocation(line: 162, column: 6, scope: !218)
!238 = !DILocation(line: 164, column: 67, scope: !239)
!239 = distinct !DILexicalBlock(scope: !218, file: !62, line: 164, column: 6)
!240 = !DILocation(line: 164, column: 62, scope: !239)
!241 = !DILocation(line: 164, column: 76, scope: !239)
!242 = !DILocation(line: 164, column: 71, scope: !239)
!243 = !DILocation(line: 164, column: 69, scope: !239)
!244 = !DILocation(line: 164, column: 46, scope: !239)
!245 = !DILocation(line: 164, column: 8, scope: !239)
!246 = !DILocation(line: 164, column: 6, scope: !218)
!247 = !DILocation(line: 165, column: 6, scope: !248)
!248 = distinct !DILexicalBlock(scope: !239, file: !62, line: 164, column: 86)
!249 = !DILocation(line: 172, column: 45, scope: !218)
!250 = !DILocation(line: 172, column: 40, scope: !218)
!251 = !DILocation(line: 172, column: 54, scope: !218)
!252 = !DILocation(line: 172, column: 49, scope: !218)
!253 = !DILocation(line: 172, column: 47, scope: !218)
!254 = !DILocation(line: 172, column: 60, scope: !218)
!255 = !DILocation(line: 172, column: 24, scope: !218)
!256 = !DILocation(line: 172, column: 22, scope: !218)
!257 = !DILocation(line: 173, column: 2, scope: !218)
!258 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !13, file: !13, line: 84, type: !259, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!259 = !DISubroutineType(types: !260)
!260 = !{!11, !6}
!261 = !DILocalVariable(name: "left", arg: 1, scope: !258, file: !13, line: 84, type: !6)
!262 = !DILocation(line: 84, column: 51, scope: !258)
!263 = !DILocation(line: 86, column: 12, scope: !258)
!264 = !DILocation(line: 86, column: 17, scope: !258)
!265 = !DILocation(line: 86, column: 5, scope: !258)
!266 = distinct !DISubprogram(name: "s32_hip1_s32_u16_u16_u16_fac1", scope: !62, file: !62, line: 282, type: !267, scopeLine: 283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!267 = !DISubroutineType(types: !268)
!268 = !{!81, !81, !71, !71, !71}
!269 = !DILocalVariable(name: "yold", arg: 1, scope: !266, file: !62, line: 282, type: !81)
!270 = !DILocation(line: 282, column: 39, scope: !266)
!271 = !DILocalVariable(name: "u", arg: 2, scope: !266, file: !62, line: 282, type: !71)
!272 = !DILocation(line: 282, column: 49, scope: !266)
!273 = !DILocalVariable(name: "uold", arg: 3, scope: !266, file: !62, line: 282, type: !71)
!274 = !DILocation(line: 282, column: 56, scope: !266)
!275 = !DILocalVariable(name: "m", arg: 4, scope: !266, file: !62, line: 282, type: !71)
!276 = !DILocation(line: 282, column: 66, scope: !266)
!277 = !DILocalVariable(name: "s32TempHW", scope: !266, file: !62, line: 284, type: !81)
!278 = !DILocation(line: 284, column: 6, scope: !266)
!279 = !DILocalVariable(name: "s32TempLW", scope: !266, file: !62, line: 284, type: !81)
!280 = !DILocation(line: 284, column: 21, scope: !266)
!281 = !DILocalVariable(name: "s32Temp0", scope: !266, file: !62, line: 284, type: !81)
!282 = !DILocation(line: 284, column: 37, scope: !266)
!283 = !DILocalVariable(name: "s32Temp1", scope: !266, file: !62, line: 284, type: !81)
!284 = !DILocation(line: 284, column: 52, scope: !266)
!285 = !DILocalVariable(name: "s32Result", scope: !266, file: !62, line: 284, type: !81)
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
!340 = !{!81, !81, !65, !65, !71}
!341 = !DILocalVariable(name: "yold", arg: 1, scope: !338, file: !62, line: 326, type: !81)
!342 = !DILocation(line: 326, column: 39, scope: !338)
!343 = !DILocalVariable(name: "u", arg: 2, scope: !338, file: !62, line: 326, type: !65)
!344 = !DILocation(line: 326, column: 49, scope: !338)
!345 = !DILocalVariable(name: "uold", arg: 3, scope: !338, file: !62, line: 326, type: !65)
!346 = !DILocation(line: 326, column: 56, scope: !338)
!347 = !DILocalVariable(name: "m", arg: 4, scope: !338, file: !62, line: 326, type: !71)
!348 = !DILocation(line: 326, column: 66, scope: !338)
!349 = !DILocalVariable(name: "s32TempHW", scope: !338, file: !62, line: 328, type: !81)
!350 = !DILocation(line: 328, column: 6, scope: !338)
!351 = !DILocalVariable(name: "s32TempLW", scope: !338, file: !62, line: 328, type: !81)
!352 = !DILocation(line: 328, column: 21, scope: !338)
!353 = !DILocalVariable(name: "s32Temp0", scope: !338, file: !62, line: 328, type: !81)
!354 = !DILocation(line: 328, column: 37, scope: !338)
!355 = !DILocalVariable(name: "s32Temp1", scope: !338, file: !62, line: 328, type: !81)
!356 = !DILocation(line: 328, column: 52, scope: !338)
!357 = !DILocalVariable(name: "s32Result", scope: !338, file: !62, line: 328, type: !81)
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
