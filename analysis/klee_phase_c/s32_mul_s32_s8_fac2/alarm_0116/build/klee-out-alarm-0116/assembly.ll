; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116/build/s32_mul_s32_s8_fac2_alarm_0116.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [63 x i8] c"KLEE-ALARM-0116: signed overflow. assert -value <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0116.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %factor = alloca i8, align 1
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i8* %factor, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %result, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = bitcast i32* %value to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @klee_make_symbolic(i8* %factor, i64 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  %1 = load i32, i32* %value, align 4, !dbg !63
  %2 = load i8, i8* %factor, align 1, !dbg !64
  %call = call i32 @s32_mul_s32_s8_fac2(i32 %1, i8 signext %2), !dbg !65
  store i32 %call, i32* %result, align 4, !dbg !66
  %3 = load i32, i32* %result, align 4, !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !69 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !77, metadata !DIExpression()), !dbg !79
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !81
  %0 = load i8, i8* %value.addr, align 1, !dbg !82
  %conv = sext i8 %0 to i32, !dbg !82
  %1 = load i16, i16* %factor.addr, align 2, !dbg !83
  %conv1 = zext i16 %1 to i32, !dbg !83
  %mul = mul nsw i32 %conv, %conv1, !dbg !84
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !85
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !86
  %shr = ashr i32 %2, 16, !dbg !87
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !88
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !89
  %cmp = icmp slt i32 %3, 0, !dbg !91
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !92

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !93
  %and = and i32 %4, 65535, !dbg !94
  %cmp3 = icmp ne i32 %and, 0, !dbg !95
  br i1 %cmp3, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !97
  %add = add nsw i32 %5, 1, !dbg !99
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !100
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !101
  %conv5 = trunc i32 %6 to i8, !dbg !102
  store i8 %conv5, i8* %retval, align 1, !dbg !103
  br label %return, !dbg !103

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !104
  %conv6 = trunc i32 %7 to i8, !dbg !106
  store i8 %conv6, i8* %retval, align 1, !dbg !107
  br label %return, !dbg !107

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !108
  ret i8 %8, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !109 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !117
  %0 = load i8, i8* %value.addr, align 1, !dbg !118
  %conv = sext i8 %0 to i32, !dbg !118
  %1 = load i16, i16* %factor.addr, align 2, !dbg !119
  %conv1 = zext i16 %1 to i32, !dbg !119
  %mul = mul nsw i32 %conv, %conv1, !dbg !120
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !121
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !122
  %shr = ashr i32 %2, 8, !dbg !123
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !124
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !125
  %cmp = icmp slt i32 %3, 0, !dbg !127
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !128

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !129
  %and = and i32 %4, 255, !dbg !130
  %cmp3 = icmp ne i32 %and, 0, !dbg !131
  br i1 %cmp3, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !133
  %add = add nsw i32 %5, 1, !dbg !135
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !136
  br label %if.end, !dbg !137

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !138
  %cmp5 = icmp slt i32 %6, 127, !dbg !140
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !141

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !142
  %cmp8 = icmp sgt i32 %7, -128, !dbg !145
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !146

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !147
  %conv11 = trunc i32 %8 to i8, !dbg !149
  store i8 %conv11, i8* %retval, align 1, !dbg !150
  br label %return, !dbg !150

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !151
  br label %return, !dbg !151

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !153
  br label %return, !dbg !153

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !155
  ret i8 %9, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !156 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !159, metadata !DIExpression()), !dbg !160
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !163, metadata !DIExpression()), !dbg !164
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !165, metadata !DIExpression()), !dbg !166
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !166
  %0 = load i8, i8* %value.addr, align 1, !dbg !167
  %conv = sext i8 %0 to i32, !dbg !167
  %1 = load i8, i8* %factor.addr, align 1, !dbg !168
  %conv1 = zext i8 %1 to i32, !dbg !168
  %mul = mul nsw i32 %conv, %conv1, !dbg !169
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !170
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !171
  %shr = ashr i32 %2, 8, !dbg !172
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !173
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !174
  %cmp = icmp slt i32 %3, 0, !dbg !176
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !177

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !178
  %and = and i32 %4, 255, !dbg !179
  %cmp3 = icmp ne i32 %and, 0, !dbg !180
  br i1 %cmp3, label %if.then, label %if.else, !dbg !181

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !182
  %add = add nsw i32 %5, 1, !dbg !184
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !185
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !186
  %conv5 = trunc i32 %6 to i8, !dbg !187
  store i8 %conv5, i8* %retval, align 1, !dbg !188
  br label %return, !dbg !188

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !189
  %conv6 = trunc i32 %7 to i8, !dbg !191
  store i8 %conv6, i8* %retval, align 1, !dbg !192
  br label %return, !dbg !192

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !193
  ret i8 %8, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !194 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !195, metadata !DIExpression()), !dbg !196
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !202
  %0 = load i8, i8* %value.addr, align 1, !dbg !203
  %conv = sext i8 %0 to i32, !dbg !203
  %1 = load i8, i8* %factor.addr, align 1, !dbg !204
  %conv1 = zext i8 %1 to i32, !dbg !204
  %mul = mul nsw i32 %conv, %conv1, !dbg !205
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !206
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !207
  %shr = ashr i32 %2, 7, !dbg !208
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !209
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !210
  %cmp = icmp slt i32 %3, 0, !dbg !212
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !213

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !214
  %and = and i32 %4, 127, !dbg !215
  %cmp3 = icmp ne i32 %and, 0, !dbg !216
  br i1 %cmp3, label %if.then, label %if.end, !dbg !217

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !218
  %add = add nsw i32 %5, 1, !dbg !220
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !221
  br label %if.end, !dbg !222

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !223
  %cmp5 = icmp slt i32 %6, 127, !dbg !225
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !226

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !227
  %cmp8 = icmp sgt i32 %7, -128, !dbg !230
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !231

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !232
  %conv11 = trunc i32 %8 to i8, !dbg !234
  store i8 %conv11, i8* %retval, align 1, !dbg !235
  br label %return, !dbg !235

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !236
  br label %return, !dbg !236

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !238
  br label %return, !dbg !238

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !240
  ret i8 %9, !dbg !240
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !241 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !244, metadata !DIExpression()), !dbg !245
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 0, i32* %s32MulTemp, align 4, !dbg !251
  %0 = load i16, i16* %value.addr, align 2, !dbg !252
  %conv = sext i16 %0 to i32, !dbg !252
  %1 = load i16, i16* %factor.addr, align 2, !dbg !253
  %conv1 = sext i16 %1 to i32, !dbg !253
  %mul = mul nsw i32 %conv, %conv1, !dbg !254
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !255
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !256
  %3 = load i32, i32* %count.addr, align 4, !dbg !257
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !258
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !258
  %div = sdiv i32 %2, %3, !dbg !258, !klee.check.div !259
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !260
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !261
  %conv2 = trunc i32 %4 to i16, !dbg !261
  ret i16 %conv2, !dbg !262
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !263 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !264, metadata !DIExpression()), !dbg !265
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !266, metadata !DIExpression()), !dbg !267
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 0, i32* %s32MulTemp, align 4, !dbg !271
  %0 = load i16, i16* %value.addr, align 2, !dbg !272
  %conv = sext i16 %0 to i32, !dbg !272
  %1 = load i16, i16* %factor.addr, align 2, !dbg !273
  %conv1 = sext i16 %1 to i32, !dbg !273
  %mul = mul nsw i32 %conv, %conv1, !dbg !274
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !275
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !276
  %3 = load i32, i32* %count.addr, align 4, !dbg !277
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !278
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !278
  %div = sdiv i32 %2, %3, !dbg !278, !klee.check.div !259
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !279
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !280
  %cmp = icmp slt i32 %4, 32767, !dbg !282
  br i1 %cmp, label %if.then, label %if.else7, !dbg !283

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !284
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !287
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !288

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !289
  %conv6 = trunc i32 %6 to i16, !dbg !291
  store i16 %conv6, i16* %retval, align 2, !dbg !292
  br label %return, !dbg !292

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !293
  br label %return, !dbg !293

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !295
  br label %return, !dbg !295

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !297
  ret i16 %7, !dbg !297
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !298 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !301, metadata !DIExpression()), !dbg !302
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !303, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !305, metadata !DIExpression()), !dbg !306
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !306
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !307, metadata !DIExpression()), !dbg !308
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !308
  %0 = load i16, i16* %value.addr, align 2, !dbg !309
  %conv = sext i16 %0 to i32, !dbg !309
  %1 = load i16, i16* %factor.addr, align 2, !dbg !310
  %conv1 = sext i16 %1 to i32, !dbg !310
  %mul = mul nsw i32 %conv, %conv1, !dbg !311
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !312
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !313
  %shr = ashr i32 %2, 15, !dbg !314
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !315
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !316
  %cmp = icmp slt i32 %3, 0, !dbg !318
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !319

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !320
  %and = and i32 %4, 32767, !dbg !321
  %cmp3 = icmp ne i32 %and, 0, !dbg !322
  br i1 %cmp3, label %if.then, label %if.end, !dbg !323

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !324
  %add = add nsw i32 %5, 1, !dbg !326
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !327
  br label %if.end, !dbg !328

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !329
  %cmp5 = icmp slt i32 %6, 32767, !dbg !331
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !332

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !333
  %conv8 = trunc i32 %7 to i16, !dbg !335
  store i16 %conv8, i16* %retval, align 2, !dbg !336
  br label %return, !dbg !336

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !337
  br label %return, !dbg !337

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !339
  ret i16 %8, !dbg !339
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !340 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !341, metadata !DIExpression()), !dbg !342
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !343, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !345, metadata !DIExpression()), !dbg !346
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !346
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !348
  %0 = load i16, i16* %value.addr, align 2, !dbg !349
  %conv = sext i16 %0 to i32, !dbg !349
  %1 = load i16, i16* %factor.addr, align 2, !dbg !350
  %conv1 = sext i16 %1 to i32, !dbg !350
  %mul = mul nsw i32 %conv, %conv1, !dbg !351
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !352
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !353
  %shr = ashr i32 %2, 14, !dbg !354
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !355
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !356
  %cmp = icmp slt i32 %3, 0, !dbg !358
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !359

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !360
  %and = and i32 %4, 16383, !dbg !361
  %cmp3 = icmp ne i32 %and, 0, !dbg !362
  br i1 %cmp3, label %if.then, label %if.end, !dbg !363

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !364
  %add = add nsw i32 %5, 1, !dbg !366
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !367
  br label %if.end, !dbg !368

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !369
  %cmp5 = icmp slt i32 %6, 32767, !dbg !371
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !372

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !373
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !376
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !377

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !378
  %conv11 = trunc i32 %8 to i16, !dbg !380
  store i16 %conv11, i16* %retval, align 2, !dbg !381
  br label %return, !dbg !381

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !382
  br label %return, !dbg !382

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !384
  br label %return, !dbg !384

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !386
  ret i16 %9, !dbg !386
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !387 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !390, metadata !DIExpression()), !dbg !391
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !392, metadata !DIExpression()), !dbg !393
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !394, metadata !DIExpression()), !dbg !395
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !395
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !396, metadata !DIExpression()), !dbg !397
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !397
  %0 = load i16, i16* %value.addr, align 2, !dbg !398
  %conv = sext i16 %0 to i32, !dbg !398
  %1 = load i16, i16* %factor.addr, align 2, !dbg !399
  %conv1 = zext i16 %1 to i32, !dbg !399
  %mul = mul nsw i32 %conv, %conv1, !dbg !400
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !401
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !402
  %shr = ashr i32 %2, 16, !dbg !403
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !404
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !405
  %cmp = icmp slt i32 %3, 0, !dbg !407
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !408

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !409
  %and = and i32 %4, 32767, !dbg !410
  %cmp3 = icmp ne i32 %and, 0, !dbg !411
  br i1 %cmp3, label %if.then, label %if.else, !dbg !412

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !413
  %add = add nsw i32 %5, 1, !dbg !415
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !416
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !417
  %conv5 = trunc i32 %6 to i16, !dbg !418
  store i16 %conv5, i16* %retval, align 2, !dbg !419
  br label %return, !dbg !419

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !420
  %conv6 = trunc i32 %7 to i16, !dbg !422
  store i16 %conv6, i16* %retval, align 2, !dbg !423
  br label %return, !dbg !423

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !424
  ret i16 %8, !dbg !424
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !425 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !426, metadata !DIExpression()), !dbg !427
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !428, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !430, metadata !DIExpression()), !dbg !431
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !431
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !432, metadata !DIExpression()), !dbg !433
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !433
  %0 = load i16, i16* %value.addr, align 2, !dbg !434
  %conv = sext i16 %0 to i32, !dbg !434
  %1 = load i16, i16* %factor.addr, align 2, !dbg !435
  %conv1 = zext i16 %1 to i32, !dbg !435
  %mul = mul nsw i32 %conv, %conv1, !dbg !436
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !437
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !438
  %shr = ashr i32 %2, 8, !dbg !439
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !440
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !441
  %cmp = icmp slt i32 %3, 0, !dbg !443
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !444

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !445
  %and = and i32 %4, 255, !dbg !446
  %cmp3 = icmp ne i32 %and, 0, !dbg !447
  br i1 %cmp3, label %if.then, label %if.end, !dbg !448

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !449
  %add = add nsw i32 %5, 1, !dbg !451
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !452
  br label %if.end, !dbg !453

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !454
  %cmp5 = icmp slt i32 %6, 32767, !dbg !456
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !457

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !458
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !461
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !462

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !463
  %conv11 = trunc i32 %8 to i16, !dbg !465
  store i16 %conv11, i16* %retval, align 2, !dbg !466
  br label %return, !dbg !466

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !467
  br label %return, !dbg !467

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !469
  br label %return, !dbg !469

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !471
  ret i16 %9, !dbg !471
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !472 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !475, metadata !DIExpression()), !dbg !476
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !477, metadata !DIExpression()), !dbg !478
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !479, metadata !DIExpression()), !dbg !480
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !480
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !481, metadata !DIExpression()), !dbg !482
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !482
  %0 = load i16, i16* %value.addr, align 2, !dbg !483
  %conv = sext i16 %0 to i32, !dbg !483
  %1 = load i8, i8* %factor.addr, align 1, !dbg !484
  %conv1 = zext i8 %1 to i32, !dbg !484
  %mul = mul nsw i32 %conv, %conv1, !dbg !485
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !486
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !487
  %shr = ashr i32 %2, 8, !dbg !488
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !489
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !490
  %cmp = icmp slt i32 %3, 0, !dbg !492
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !493

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !494
  %and = and i32 %4, 255, !dbg !495
  %cmp3 = icmp ne i32 %and, 0, !dbg !496
  br i1 %cmp3, label %if.then, label %if.else, !dbg !497

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !498
  %add = add nsw i32 %5, 1, !dbg !500
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !501
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !502
  %conv5 = trunc i32 %6 to i16, !dbg !502
  store i16 %conv5, i16* %retval, align 2, !dbg !503
  br label %return, !dbg !503

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !504
  %conv6 = trunc i32 %7 to i16, !dbg !504
  store i16 %conv6, i16* %retval, align 2, !dbg !506
  br label %return, !dbg !506

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !507
  ret i16 %8, !dbg !507
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !508 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !509, metadata !DIExpression()), !dbg !510
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !511, metadata !DIExpression()), !dbg !512
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !513, metadata !DIExpression()), !dbg !514
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !514
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !515, metadata !DIExpression()), !dbg !516
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !516
  %0 = load i16, i16* %value.addr, align 2, !dbg !517
  %conv = sext i16 %0 to i32, !dbg !517
  %1 = load i8, i8* %factor.addr, align 1, !dbg !518
  %conv1 = zext i8 %1 to i32, !dbg !518
  %mul = mul nsw i32 %conv, %conv1, !dbg !519
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !520
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !521
  %shr = ashr i32 %2, 7, !dbg !522
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !523
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !524
  %cmp = icmp slt i32 %3, 0, !dbg !526
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !527

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !528
  %and = and i32 %4, 127, !dbg !529
  %cmp3 = icmp ne i32 %and, 0, !dbg !530
  br i1 %cmp3, label %if.then, label %if.end, !dbg !531

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !532
  %add = add nsw i32 %5, 1, !dbg !534
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !535
  br label %if.end, !dbg !536

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !537
  %cmp5 = icmp slt i32 %6, 32767, !dbg !539
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !540

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !541
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !544
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !545

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !546
  %conv11 = trunc i32 %8 to i16, !dbg !548
  store i16 %conv11, i16* %retval, align 2, !dbg !549
  br label %return, !dbg !549

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !550
  br label %return, !dbg !550

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !552
  br label %return, !dbg !552

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !554
  ret i16 %9, !dbg !554
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !555 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !556, metadata !DIExpression()), !dbg !557
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !558, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !560, metadata !DIExpression()), !dbg !561
  store i32 0, i32* %s32MulTemp, align 4, !dbg !561
  %0 = load i16, i16* %value.addr, align 2, !dbg !562
  %conv = sext i16 %0 to i32, !dbg !562
  %1 = load i16, i16* %factor.addr, align 2, !dbg !563
  %conv1 = zext i16 %1 to i32, !dbg !563
  %mul = mul nsw i32 %conv, %conv1, !dbg !564
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !565
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !566
  %cmp = icmp slt i32 %2, 32767, !dbg !568
  br i1 %cmp, label %if.then, label %if.else7, !dbg !569

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !570
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !573
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !574

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !575
  %conv6 = trunc i32 %4 to i16, !dbg !577
  store i16 %conv6, i16* %retval, align 2, !dbg !578
  br label %return, !dbg !578

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !579
  br label %return, !dbg !579

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !581
  br label %return, !dbg !581

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !583
  ret i16 %5, !dbg !583
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !584 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !587, metadata !DIExpression()), !dbg !588
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !589, metadata !DIExpression()), !dbg !590
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !591, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !593, metadata !DIExpression()), !dbg !594
  store i32 0, i32* %s32MulTemp, align 4, !dbg !594
  %0 = load i16, i16* %value.addr, align 2, !dbg !595
  %conv = sext i16 %0 to i32, !dbg !595
  %1 = load i16, i16* %factor.addr, align 2, !dbg !596
  %conv1 = zext i16 %1 to i32, !dbg !596
  %mul = mul nsw i32 %conv, %conv1, !dbg !597
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !598
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !599
  %3 = load i32, i32* %count.addr, align 4, !dbg !600
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !601
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !601
  %div = sdiv i32 %2, %3, !dbg !601, !klee.check.div !259
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !602
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !603
  %conv2 = trunc i32 %4 to i16, !dbg !604
  ret i16 %conv2, !dbg !605
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !606 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !609, metadata !DIExpression()), !dbg !610
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !611, metadata !DIExpression()), !dbg !612
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !613, metadata !DIExpression()), !dbg !614
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !615, metadata !DIExpression()), !dbg !616
  store i32 0, i32* %s32MulTemp, align 4, !dbg !616
  %0 = load i16, i16* %value.addr, align 2, !dbg !617
  %conv = sext i16 %0 to i32, !dbg !617
  %1 = load i16, i16* %factor.addr, align 2, !dbg !618
  %conv1 = zext i16 %1 to i32, !dbg !618
  %mul = mul nsw i32 %conv, %conv1, !dbg !619
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !620
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !621
  %3 = load i16, i16* %count.addr, align 2, !dbg !622
  %conv2 = zext i16 %3 to i32, !dbg !622
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !623
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !623
  %div = sdiv i32 %2, %conv2, !dbg !623, !klee.check.div !259
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !624
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !625
  %cmp = icmp slt i32 %4, 32767, !dbg !627
  br i1 %cmp, label %if.then, label %if.else8, !dbg !628

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !629
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !632
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !633

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !634
  %conv7 = trunc i32 %6 to i16, !dbg !636
  store i16 %conv7, i16* %retval, align 2, !dbg !637
  br label %return, !dbg !637

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !638
  br label %return, !dbg !638

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !640
  br label %return, !dbg !640

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !642
  ret i16 %7, !dbg !642
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !643 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !644, metadata !DIExpression()), !dbg !645
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !646, metadata !DIExpression()), !dbg !647
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !648, metadata !DIExpression()), !dbg !649
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !649
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !650, metadata !DIExpression()), !dbg !651
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !651
  %0 = load i16, i16* %value.addr, align 2, !dbg !652
  %conv = sext i16 %0 to i32, !dbg !652
  %1 = load i16, i16* %factor.addr, align 2, !dbg !653
  %conv1 = zext i16 %1 to i32, !dbg !653
  %mul = mul nsw i32 %conv, %conv1, !dbg !654
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !655
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !656
  %shr = ashr i32 %2, 16, !dbg !657
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !658
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !659
  %cmp = icmp slt i32 %3, 0, !dbg !661
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !662

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !663
  %and = and i32 %4, 65535, !dbg !664
  %cmp3 = icmp ne i32 %and, 0, !dbg !665
  br i1 %cmp3, label %if.then, label %if.else, !dbg !666

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !667
  %add = add nsw i32 %5, 1, !dbg !669
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !670
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !671
  %conv5 = trunc i32 %6 to i16, !dbg !672
  store i16 %conv5, i16* %retval, align 2, !dbg !673
  br label %return, !dbg !673

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !674
  %conv6 = trunc i32 %7 to i16, !dbg !676
  store i16 %conv6, i16* %retval, align 2, !dbg !677
  br label %return, !dbg !677

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !678
  ret i16 %8, !dbg !678
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !679 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !680, metadata !DIExpression()), !dbg !681
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !682, metadata !DIExpression()), !dbg !683
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !684, metadata !DIExpression()), !dbg !685
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !685
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !686, metadata !DIExpression()), !dbg !687
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !687
  %0 = load i16, i16* %value.addr, align 2, !dbg !688
  %conv = sext i16 %0 to i32, !dbg !688
  %1 = load i16, i16* %factor.addr, align 2, !dbg !689
  %conv1 = zext i16 %1 to i32, !dbg !689
  %mul = mul nsw i32 %conv, %conv1, !dbg !690
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !691
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !692
  %shr = ashr i32 %2, 15, !dbg !693
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !694
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !695
  %cmp = icmp slt i32 %3, 0, !dbg !697
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !698

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !699
  %and = and i32 %4, 32767, !dbg !700
  %cmp3 = icmp ne i32 %and, 0, !dbg !701
  br i1 %cmp3, label %if.then, label %if.end, !dbg !702

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !703
  %add = add nsw i32 %5, 1, !dbg !705
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !706
  br label %if.end, !dbg !707

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !708
  %cmp5 = icmp slt i32 %6, 32767, !dbg !710
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !711

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !712
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !715
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !716

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !717
  %conv11 = trunc i32 %8 to i16, !dbg !719
  store i16 %conv11, i16* %retval, align 2, !dbg !720
  br label %return, !dbg !720

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !721
  br label %return, !dbg !721

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !723
  br label %return, !dbg !723

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !725
  ret i16 %9, !dbg !725
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !726 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !729, metadata !DIExpression()), !dbg !730
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !731, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !733, metadata !DIExpression()), !dbg !738
  store i32 0, i32* %u32MulTemp, align 4, !dbg !738
  %0 = load i16, i16* %value.addr, align 2, !dbg !739
  %conv = zext i16 %0 to i32, !dbg !739
  %1 = load i16, i16* %factor.addr, align 2, !dbg !740
  %conv1 = zext i16 %1 to i32, !dbg !740
  %mul = mul nsw i32 %conv, %conv1, !dbg !741
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !742
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !743
  %shr = lshr i32 %2, 8, !dbg !744
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !745
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !746
  %cmp = icmp ult i32 %3, 32767, !dbg !748
  br i1 %cmp, label %if.then, label %if.else, !dbg !749

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !750
  %conv3 = trunc i32 %4 to i16, !dbg !752
  store i16 %conv3, i16* %retval, align 2, !dbg !753
  br label %return, !dbg !753

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !754
  br label %return, !dbg !754

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !756
  ret i16 %5, !dbg !756
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !757 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !760, metadata !DIExpression()), !dbg !761
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !762, metadata !DIExpression()), !dbg !763
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !764, metadata !DIExpression()), !dbg !765
  store i32 0, i32* %s32MulTemp, align 4, !dbg !765
  %0 = load i16, i16* %value.addr, align 2, !dbg !766
  %conv = sext i16 %0 to i32, !dbg !766
  %1 = load i16, i16* %factor.addr, align 2, !dbg !767
  %conv1 = zext i16 %1 to i32, !dbg !767
  %mul = mul nsw i32 %conv, %conv1, !dbg !768
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !769
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !770
  ret i32 %2, !dbg !771
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !772 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !775, metadata !DIExpression()), !dbg !776
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !777, metadata !DIExpression()), !dbg !778
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !779, metadata !DIExpression()), !dbg !780
  store i32 0, i32* %s32Temp1, align 4, !dbg !780
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !781, metadata !DIExpression()), !dbg !782
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !782
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !783, metadata !DIExpression()), !dbg !784
  store i32 0, i32* %s32Factor, align 4, !dbg !784
  %0 = load i16, i16* %factor.addr, align 2, !dbg !785
  %conv = zext i16 %0 to i32, !dbg !785
  store i32 %conv, i32* %s32Factor, align 4, !dbg !786
  %1 = load i16, i16* %factor.addr, align 2, !dbg !787
  %conv1 = zext i16 %1 to i32, !dbg !787
  %cmp = icmp ne i32 %conv1, 0, !dbg !789
  br i1 %cmp, label %if.then, label %if.else19, !dbg !790

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !791
  %cmp3 = icmp slt i32 %2, 0, !dbg !794
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !795

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !796
  %4 = load i32, i32* %s32Factor, align 4, !dbg !798
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !799
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !799
  %div = sdiv i32 %3, %4, !dbg !799, !klee.check.div !259
  store i32 %div, i32* %s32Temp1, align 4, !dbg !800
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !801
  %6 = load i32, i32* %value.addr, align 4, !dbg !803
  %cmp6 = icmp sge i32 %5, %6, !dbg !804
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !805

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !806
  br label %return, !dbg !806

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !808
  %8 = load i16, i16* %factor.addr, align 2, !dbg !810
  %conv9 = zext i16 %8 to i32, !dbg !810
  %mul = mul nsw i32 %7, %conv9, !dbg !811
  store i32 %mul, i32* %retval, align 4, !dbg !812
  br label %return, !dbg !812

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !813
  %conv11 = zext i16 %9 to i32, !dbg !813
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !816
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !816
  %div12 = udiv i32 2147483647, %conv11, !dbg !816, !klee.check.div !259
  %10 = load i32, i32* %value.addr, align 4, !dbg !817
  %cmp13 = icmp ule i32 %div12, %10, !dbg !818
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !819

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !820
  br label %return, !dbg !820

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !822
  %12 = load i16, i16* %factor.addr, align 2, !dbg !824
  %conv17 = zext i16 %12 to i32, !dbg !824
  %mul18 = mul nsw i32 %11, %conv17, !dbg !825
  store i32 %mul18, i32* %retval, align 4, !dbg !826
  br label %return, !dbg !826

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !827
  br label %return, !dbg !827

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !829
  ret i32 %13, !dbg !829
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !830 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !833, metadata !DIExpression()), !dbg !834
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !835, metadata !DIExpression()), !dbg !836
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !837, metadata !DIExpression()), !dbg !838
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !839, metadata !DIExpression()), !dbg !840
  store i16 0, i16* %u16MulTemp, align 2, !dbg !840
  %0 = load i8, i8* %value.addr, align 1, !dbg !841
  %conv = zext i8 %0 to i32, !dbg !841
  %1 = load i8, i8* %factor.addr, align 1, !dbg !842
  %conv1 = zext i8 %1 to i32, !dbg !842
  %mul = mul nsw i32 %conv, %conv1, !dbg !843
  %conv2 = trunc i32 %mul to i16, !dbg !841
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !844
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !845
  %conv3 = zext i16 %2 to i32, !dbg !845
  %3 = load i16, i16* %count.addr, align 2, !dbg !846
  %conv4 = zext i16 %3 to i32, !dbg !846
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !847
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !847
  %div = sdiv i32 %conv3, %conv4, !dbg !847, !klee.check.div !259
  %conv5 = trunc i32 %div to i16, !dbg !845
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !848
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !849
  %conv6 = trunc i16 %4 to i8, !dbg !850
  ret i8 %conv6, !dbg !851
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !852 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !855, metadata !DIExpression()), !dbg !856
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !859, metadata !DIExpression()), !dbg !860
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !861, metadata !DIExpression()), !dbg !862
  store i16 0, i16* %u16MulTemp, align 2, !dbg !862
  %0 = load i8, i8* %value.addr, align 1, !dbg !863
  %conv = zext i8 %0 to i32, !dbg !863
  %1 = load i8, i8* %factor.addr, align 1, !dbg !864
  %conv1 = zext i8 %1 to i32, !dbg !864
  %mul = mul nsw i32 %conv, %conv1, !dbg !865
  %conv2 = trunc i32 %mul to i16, !dbg !863
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !866
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !867
  %conv3 = zext i16 %2 to i32, !dbg !867
  %3 = load i8, i8* %count.addr, align 1, !dbg !868
  %conv4 = zext i8 %3 to i32, !dbg !868
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !869
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !869
  %div = sdiv i32 %conv3, %conv4, !dbg !869, !klee.check.div !259
  %conv5 = trunc i32 %div to i16, !dbg !867
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !870
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !871
  %conv6 = zext i16 %4 to i32, !dbg !871
  %cmp = icmp sle i32 %conv6, 255, !dbg !873
  br i1 %cmp, label %if.then, label %if.else, !dbg !874

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !875
  %conv8 = zext i16 %5 to i32, !dbg !875
  %and = and i32 %conv8, 255, !dbg !877
  %conv9 = trunc i32 %and to i8, !dbg !875
  store i8 %conv9, i8* %retval, align 1, !dbg !878
  br label %return, !dbg !878

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !879
  br label %return, !dbg !879

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !881
  ret i8 %6, !dbg !881
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !882 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !885, metadata !DIExpression()), !dbg !886
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !887, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !889, metadata !DIExpression()), !dbg !890
  store i16 0, i16* %u16MulTemp, align 2, !dbg !890
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !891
  %conv = zext i8 %0 to i32, !dbg !891
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !892
  %conv1 = zext i8 %1 to i32, !dbg !892
  %mul = mul nsw i32 %conv, %conv1, !dbg !893
  %conv2 = trunc i32 %mul to i16, !dbg !891
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !894
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !895
  %conv3 = zext i16 %2 to i32, !dbg !895
  %shr = ashr i32 %conv3, 8, !dbg !896
  %conv4 = trunc i32 %shr to i16, !dbg !895
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !897
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !898
  %conv5 = trunc i16 %3 to i8, !dbg !899
  ret i8 %conv5, !dbg !900
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !901 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !902, metadata !DIExpression()), !dbg !903
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !904, metadata !DIExpression()), !dbg !905
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !906, metadata !DIExpression()), !dbg !907
  store i16 0, i16* %u16MulTemp, align 2, !dbg !907
  %0 = load i8, i8* %value.addr, align 1, !dbg !908
  %conv = zext i8 %0 to i32, !dbg !908
  %1 = load i8, i8* %factor.addr, align 1, !dbg !909
  %conv1 = zext i8 %1 to i32, !dbg !909
  %mul = mul nsw i32 %conv, %conv1, !dbg !910
  %conv2 = trunc i32 %mul to i16, !dbg !908
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !911
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !912
  %conv3 = zext i16 %2 to i32, !dbg !912
  %shr = ashr i32 %conv3, 7, !dbg !913
  %conv4 = trunc i32 %shr to i16, !dbg !912
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !914
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !915
  %conv5 = zext i16 %3 to i32, !dbg !915
  %cmp = icmp slt i32 %conv5, 255, !dbg !917
  br i1 %cmp, label %if.then, label %if.else, !dbg !918

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !919
  %conv7 = trunc i16 %4 to i8, !dbg !921
  store i8 %conv7, i8* %retval, align 1, !dbg !922
  br label %return, !dbg !922

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !923
  br label %return, !dbg !923

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !925
  ret i8 %5, !dbg !925
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !926 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !929, metadata !DIExpression()), !dbg !930
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !931, metadata !DIExpression()), !dbg !932
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !933, metadata !DIExpression()), !dbg !934
  store i32 0, i32* %u32MulTemp, align 4, !dbg !934
  %0 = load i16, i16* %value.addr, align 2, !dbg !935
  %conv = zext i16 %0 to i32, !dbg !935
  %1 = load i16, i16* %factor.addr, align 2, !dbg !936
  %conv1 = zext i16 %1 to i32, !dbg !936
  %mul = mul nsw i32 %conv, %conv1, !dbg !937
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !938
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !939
  %shr = lshr i32 %2, 16, !dbg !940
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !941
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !942
  %conv2 = trunc i32 %3 to i16, !dbg !943
  ret i16 %conv2, !dbg !944
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !945 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !946, metadata !DIExpression()), !dbg !947
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !948, metadata !DIExpression()), !dbg !949
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !950, metadata !DIExpression()), !dbg !951
  store i32 0, i32* %u32MulTemp, align 4, !dbg !951
  %0 = load i16, i16* %value.addr, align 2, !dbg !952
  %conv = zext i16 %0 to i32, !dbg !952
  %1 = load i16, i16* %factor.addr, align 2, !dbg !953
  %conv1 = zext i16 %1 to i32, !dbg !953
  %mul = mul nsw i32 %conv, %conv1, !dbg !954
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !955
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !956
  %shr = lshr i32 %2, 8, !dbg !957
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !958
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !959
  %cmp = icmp ult i32 %3, 65535, !dbg !961
  br i1 %cmp, label %if.then, label %if.else, !dbg !962

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !963
  %and = and i32 %4, 65535, !dbg !965
  %conv3 = trunc i32 %and to i16, !dbg !966
  store i16 %conv3, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !968
  br label %return, !dbg !968

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !970
  ret i16 %5, !dbg !970
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !971 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !974, metadata !DIExpression()), !dbg !975
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !976, metadata !DIExpression()), !dbg !977
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !978, metadata !DIExpression()), !dbg !979
  store i32 0, i32* %u32MulTemp, align 4, !dbg !979
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !980
  %conv = zext i16 %0 to i32, !dbg !980
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !981
  %conv1 = zext i8 %1 to i32, !dbg !981
  %mul = mul nsw i32 %conv, %conv1, !dbg !982
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !983
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !984
  %shr = lshr i32 %2, 8, !dbg !985
  %and = and i32 %shr, 65535, !dbg !986
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !987
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !988
  %conv2 = trunc i32 %3 to i16, !dbg !988
  ret i16 %conv2, !dbg !989
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !990 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !993, metadata !DIExpression()), !dbg !994
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !995, metadata !DIExpression()), !dbg !996
  store i32 0, i32* %u32MulTemp, align 4, !dbg !996
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !997
  %conv = zext i16 %0 to i32, !dbg !997
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !998
  %conv1 = zext i8 %1 to i32, !dbg !998
  %mul = mul nsw i32 %conv, %conv1, !dbg !999
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1000
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1001
  %shr = lshr i32 %2, 7, !dbg !1002
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1003
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1004
  %cmp = icmp ult i32 %3, 65535, !dbg !1006
  br i1 %cmp, label %if.then, label %if.else, !dbg !1007

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1008
  %and = and i32 %4, 65535, !dbg !1010
  %conv3 = trunc i32 %and to i16, !dbg !1011
  store i16 %conv3, i16* %retval, align 2, !dbg !1012
  br label %return, !dbg !1012

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1013
  br label %return, !dbg !1013

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1015
  ret i16 %5, !dbg !1015
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1016 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1023, metadata !DIExpression()), !dbg !1024
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1025, metadata !DIExpression()), !dbg !1026
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1026
  %0 = load i16, i16* %value.addr, align 2, !dbg !1027
  %conv = zext i16 %0 to i32, !dbg !1027
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1028
  %conv1 = zext i16 %1 to i32, !dbg !1028
  %mul = mul nsw i32 %conv, %conv1, !dbg !1029
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1030
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1031
  %3 = load i32, i32* %count.addr, align 4, !dbg !1032
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1033
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1033
  %div = udiv i32 %2, %3, !dbg !1033, !klee.check.div !259
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1034
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1035
  %and = and i32 %4, 65535, !dbg !1036
  %conv2 = trunc i32 %and to i16, !dbg !1037
  ret i16 %conv2, !dbg !1038
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1039 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1046, metadata !DIExpression()), !dbg !1047
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1048, metadata !DIExpression()), !dbg !1049
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1049
  %0 = load i16, i16* %value.addr, align 2, !dbg !1050
  %conv = zext i16 %0 to i32, !dbg !1050
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1051
  %conv1 = zext i16 %1 to i32, !dbg !1051
  %mul = mul nsw i32 %conv, %conv1, !dbg !1052
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1053
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1054
  %3 = load i16, i16* %count.addr, align 2, !dbg !1055
  %conv2 = zext i16 %3 to i32, !dbg !1055
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1056
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1056
  %div = udiv i32 %2, %conv2, !dbg !1056, !klee.check.div !259
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1057
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1058
  %cmp = icmp ule i32 %4, 65535, !dbg !1060
  br i1 %cmp, label %if.then, label %if.else, !dbg !1061

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1062
  %and = and i32 %5, 65535, !dbg !1064
  %conv4 = trunc i32 %and to i16, !dbg !1065
  store i16 %conv4, i16* %retval, align 2, !dbg !1066
  br label %return, !dbg !1066

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1067
  br label %return, !dbg !1067

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1069
  ret i16 %6, !dbg !1069
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1070 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1071, metadata !DIExpression()), !dbg !1072
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1075, metadata !DIExpression()), !dbg !1076
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1076
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1077
  %conv = zext i16 %0 to i32, !dbg !1077
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1078
  %conv1 = zext i16 %1 to i32, !dbg !1078
  %mul = mul nsw i32 %conv, %conv1, !dbg !1079
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1080
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1081
  %shr = lshr i32 %2, 16, !dbg !1082
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1083
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1084
  %and = and i32 65535, %3, !dbg !1085
  %conv2 = trunc i32 %and to i16, !dbg !1086
  ret i16 %conv2, !dbg !1087
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1088 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1089, metadata !DIExpression()), !dbg !1090
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1091, metadata !DIExpression()), !dbg !1092
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1093, metadata !DIExpression()), !dbg !1094
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1094
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1095
  %conv = zext i16 %0 to i32, !dbg !1095
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1096
  %conv1 = zext i16 %1 to i32, !dbg !1096
  %mul = mul nsw i32 %conv, %conv1, !dbg !1097
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1098
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1099
  %shr = lshr i32 %2, 15, !dbg !1100
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1101
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1102
  %cmp = icmp ule i32 %3, 65535, !dbg !1104
  br i1 %cmp, label %if.then, label %if.else, !dbg !1105

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1106
  %and = and i32 %4, 65535, !dbg !1108
  %conv3 = trunc i32 %and to i16, !dbg !1109
  store i16 %conv3, i16* %retval, align 2, !dbg !1110
  br label %return, !dbg !1110

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1111
  br label %return, !dbg !1111

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1113
  ret i16 %5, !dbg !1113
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1114 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1117, metadata !DIExpression()), !dbg !1118
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1119, metadata !DIExpression()), !dbg !1120
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i32 0, i32* %u32Temp1, align 4, !dbg !1122
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1123
  %conv = zext i16 %0 to i32, !dbg !1123
  %cmp = icmp sgt i32 %conv, 0, !dbg !1125
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1126

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1127
  %conv2 = zext i16 %1 to i32, !dbg !1127
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1129
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1129
  %div = udiv i32 -1, %conv2, !dbg !1129, !klee.check.div !259
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1130
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1131
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1133
  %cmp3 = icmp ult i32 %2, %3, !dbg !1134
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1135

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1136
  br label %return, !dbg !1136

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1138
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1140
  %conv6 = zext i16 %5 to i32, !dbg !1140
  %mul = mul i32 %4, %conv6, !dbg !1141
  store i32 %mul, i32* %retval, align 4, !dbg !1142
  br label %return, !dbg !1142

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1143
  br label %return, !dbg !1143

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1145
  ret i32 %6, !dbg !1145
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1146 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1149, metadata !DIExpression()), !dbg !1150
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1151, metadata !DIExpression()), !dbg !1152
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1153, metadata !DIExpression()), !dbg !1154
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1155, metadata !DIExpression()), !dbg !1156
  store i32 0, i32* %u32Temp1, align 4, !dbg !1156
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1157, metadata !DIExpression()), !dbg !1158
  store i32 0, i32* %u32Temp2, align 4, !dbg !1158
  %0 = load i32, i32* %value.addr, align 4, !dbg !1159
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1160
  %conv = zext i16 %1 to i32, !dbg !1160
  %mul = mul i32 %0, %conv, !dbg !1161
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1162
  %2 = load i32, i32* %value.addr, align 4, !dbg !1163
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1164
  %conv1 = zext i16 %3 to i32, !dbg !1164
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1165
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1166
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1167
  %5 = load i32, i32* %count.addr, align 4, !dbg !1168
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1169
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1169
  %shr = lshr i32 %4, %5, !dbg !1169, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1170
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1171
  %7 = load i32, i32* %count.addr, align 4, !dbg !1172
  %sub = sub i32 32, %7, !dbg !1173
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1174
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1174
  %shl = shl i32 %6, %sub, !dbg !1174, !klee.check.shift !259
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1175
  %or = or i32 %8, %shl, !dbg !1175
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1175
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1176
  %10 = load i32, i32* %count.addr, align 4, !dbg !1178
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1179
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1179
  %shr2 = lshr i32 %9, %10, !dbg !1179, !klee.check.shift !259
  %cmp = icmp eq i32 %shr2, 0, !dbg !1180
  br i1 %cmp, label %if.then, label %if.else, !dbg !1181

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1182
  store i32 %11, i32* %retval, align 4, !dbg !1184
  br label %return, !dbg !1184

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1185
  br label %return, !dbg !1185

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1187
  ret i32 %12, !dbg !1187
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1188 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1191, metadata !DIExpression()), !dbg !1192
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1197, metadata !DIExpression()), !dbg !1198
  store i16 0, i16* %s16Temp1, align 2, !dbg !1198
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1199
  %conv = zext i8 %0 to i32, !dbg !1199
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1200
  %conv1 = zext i8 %1 to i32, !dbg !1200
  %sub = sub nsw i32 %conv, %conv1, !dbg !1201
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1202
  %conv2 = sext i8 %2 to i32, !dbg !1202
  %mul = mul nsw i32 %sub, %conv2, !dbg !1203
  %div = sdiv i32 %mul, 32, !dbg !1204
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1205
  %conv3 = zext i8 %3 to i32, !dbg !1205
  %add = add nsw i32 %div, %conv3, !dbg !1206
  %conv4 = trunc i32 %add to i16, !dbg !1207
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1208
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1209
  %conv5 = sext i16 %4 to i32, !dbg !1209
  %cmp = icmp slt i32 %conv5, 255, !dbg !1211
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1212

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1213
  %conv7 = sext i16 %5 to i32, !dbg !1213
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1216
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1217

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1218
  %conv11 = trunc i16 %6 to i8, !dbg !1220
  store i8 %conv11, i8* %retval, align 1, !dbg !1221
  br label %return, !dbg !1221

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1222
  br label %return, !dbg !1222

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1224
  br label %return, !dbg !1224

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1226
  ret i8 %7, !dbg !1226
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1227 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1230, metadata !DIExpression()), !dbg !1231
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1232, metadata !DIExpression()), !dbg !1233
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1234, metadata !DIExpression()), !dbg !1235
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1236, metadata !DIExpression()), !dbg !1237
  store i32 0, i32* %s32Temp1, align 4, !dbg !1237
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1238
  %conv = zext i16 %0 to i32, !dbg !1238
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1239
  %conv1 = zext i16 %1 to i32, !dbg !1239
  %sub = sub nsw i32 %conv, %conv1, !dbg !1240
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1241
  %conv2 = sext i8 %2 to i32, !dbg !1241
  %mul = mul nsw i32 %sub, %conv2, !dbg !1242
  %div = sdiv i32 %mul, 32, !dbg !1243
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1244
  %conv3 = zext i16 %3 to i32, !dbg !1244
  %add = add nsw i32 %div, %conv3, !dbg !1245
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1246
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1247
  %cmp = icmp slt i32 %4, 65535, !dbg !1249
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1250

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1251
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1254
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1255

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1256
  %conv8 = trunc i32 %6 to i16, !dbg !1258
  store i16 %conv8, i16* %retval, align 2, !dbg !1259
  br label %return, !dbg !1259

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1260
  br label %return, !dbg !1260

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1262
  br label %return, !dbg !1262

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1264
  ret i16 %7, !dbg !1264
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1265 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1266, metadata !DIExpression()), !dbg !1267
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1268, metadata !DIExpression()), !dbg !1269
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1270, metadata !DIExpression()), !dbg !1271
  store i32 0, i32* %u32Temp1, align 4, !dbg !1271
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1272
  %conv = zext i16 %0 to i32, !dbg !1272
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1273
  %conv1 = zext i16 %1 to i32, !dbg !1273
  %mul = mul nsw i32 %conv, %conv1, !dbg !1274
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1275
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1276
  %cmp = icmp ule i32 %2, 65535, !dbg !1278
  br i1 %cmp, label %if.then, label %if.else, !dbg !1279

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1280
  %and = and i32 %3, 65535, !dbg !1282
  %conv3 = trunc i32 %and to i16, !dbg !1283
  store i16 %conv3, i16* %retval, align 2, !dbg !1284
  br label %return, !dbg !1284

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1285
  br label %return, !dbg !1285

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1287
  ret i16 %4, !dbg !1287
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1288 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1291, metadata !DIExpression()), !dbg !1292
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1293, metadata !DIExpression()), !dbg !1294
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1295, metadata !DIExpression()), !dbg !1296
  store i32 0, i32* %u32Temp1, align 4, !dbg !1296
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1297
  %conv = zext i16 %0 to i32, !dbg !1297
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1298
  %conv1 = zext i16 %1 to i32, !dbg !1298
  %mul = mul nsw i32 %conv, %conv1, !dbg !1299
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1300
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1301
  ret i32 %2, !dbg !1302
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1303 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1306, metadata !DIExpression()), !dbg !1307
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1308, metadata !DIExpression()), !dbg !1309
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1310, metadata !DIExpression()), !dbg !1311
  store i32 0, i32* %s32Temp1, align 4, !dbg !1311
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1312
  %conv = sext i16 %0 to i32, !dbg !1312
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1313
  %conv1 = sext i16 %1 to i32, !dbg !1313
  %mul = mul nsw i32 %conv, %conv1, !dbg !1314
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1315
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1316
  ret i32 %2, !dbg !1317
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1318 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1321, metadata !DIExpression()), !dbg !1322
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1323, metadata !DIExpression()), !dbg !1324
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1325, metadata !DIExpression()), !dbg !1326
  store i32 0, i32* %s32Temp1, align 4, !dbg !1326
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1327
  %cmp = icmp sgt i32 %0, 0, !dbg !1329
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1330

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1331
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1333
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1333
  %div = udiv i32 -1, %1, !dbg !1333, !klee.check.div !259
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1334
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1335
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1337
  %cmp1 = icmp ult i32 %2, %3, !dbg !1338
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1339

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1340
  br label %return, !dbg !1340

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1342
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1344
  %mul = mul i32 %4, %5, !dbg !1345
  store i32 %mul, i32* %retval, align 4, !dbg !1346
  br label %return, !dbg !1346

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1347
  br label %return, !dbg !1347

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1349
  ret i32 %6, !dbg !1349
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1350 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1353, metadata !DIExpression()), !dbg !1354
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1355, metadata !DIExpression()), !dbg !1356
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1357, metadata !DIExpression()), !dbg !1358
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1359, metadata !DIExpression()), !dbg !1360
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1361, metadata !DIExpression()), !dbg !1362
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1363, metadata !DIExpression()), !dbg !1364
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1365
  %cmp = icmp slt i32 %0, 0, !dbg !1367
  br i1 %cmp, label %if.then, label %if.else, !dbg !1368

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1369
  %sub = sub nsw i32 0, %1, !dbg !1370
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1371
  br label %if.end, !dbg !1372

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1373
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1374
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1375
  %cmp1 = icmp slt i32 %3, 0, !dbg !1377
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1378

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1379
  %sub3 = sub nsw i32 0, %4, !dbg !1380
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1381
  br label %if.end5, !dbg !1382

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1383
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1384
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1385
  %cmp6 = icmp slt i32 %6, 0, !dbg !1387
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1388
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1388

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1389
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1390
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1391
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1391

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1392
  br label %if.end13, !dbg !1393

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1394
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1395
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1396
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1397
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1398
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1399
  %conv = zext i8 %12 to i32, !dbg !1399
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1401
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1402

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1403
  br label %return, !dbg !1403

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1405
  store i32 %13, i32* %retval, align 4, !dbg !1407
  br label %return, !dbg !1407

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1408
  ret i32 %14, !dbg !1408
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1409 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1412, metadata !DIExpression()), !dbg !1413
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1414, metadata !DIExpression()), !dbg !1415
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1416, metadata !DIExpression()), !dbg !1417
  store i32 0, i32* %u32Temp1, align 4, !dbg !1417
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1418
  %cmp = icmp ne i32 %0, 0, !dbg !1420
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1421

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1422
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1424
  %div = udiv i32 -1, %1, !dbg !1424, !klee.check.div !259
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1425
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1426
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1428
  %cmp1 = icmp ult i32 %2, %3, !dbg !1429
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1430

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1431
  br label %return, !dbg !1431

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1433
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1435
  %mul = mul i32 %4, %5, !dbg !1436
  store i32 %mul, i32* %retval, align 4, !dbg !1437
  br label %return, !dbg !1437

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1440
  ret i32 %6, !dbg !1440
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1441 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1442, metadata !DIExpression()), !dbg !1443
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1444, metadata !DIExpression()), !dbg !1445
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1446, metadata !DIExpression()), !dbg !1447
  store i32 0, i32* %u32Temp1, align 4, !dbg !1447
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1448, metadata !DIExpression()), !dbg !1449
  store i32 0, i32* %u32Temp2, align 4, !dbg !1449
  %0 = load i32, i32* %value.addr, align 4, !dbg !1450
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1451
  %conv = zext i16 %1 to i32, !dbg !1451
  %mul = mul i32 %0, %conv, !dbg !1452
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1453
  %2 = load i32, i32* %value.addr, align 4, !dbg !1454
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1455
  %conv1 = zext i16 %3 to i32, !dbg !1455
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1456
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1457
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1458
  %shr = lshr i32 %4, 16, !dbg !1459
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1460
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1461
  %shl = shl i32 %5, 16, !dbg !1462
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1463
  %or = or i32 %6, %shl, !dbg !1463
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1463
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1464
  ret i32 %7, !dbg !1465
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1466 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1467, metadata !DIExpression()), !dbg !1468
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1469, metadata !DIExpression()), !dbg !1470
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1471, metadata !DIExpression()), !dbg !1472
  store i32 0, i32* %u32Temp1, align 4, !dbg !1472
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1473, metadata !DIExpression()), !dbg !1474
  store i32 0, i32* %u32Temp2, align 4, !dbg !1474
  %0 = load i32, i32* %value.addr, align 4, !dbg !1475
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1476
  %conv = zext i16 %1 to i32, !dbg !1476
  %mul = mul i32 %0, %conv, !dbg !1477
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1478
  %2 = load i32, i32* %value.addr, align 4, !dbg !1479
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1480
  %conv1 = zext i16 %3 to i32, !dbg !1480
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1481
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1482
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1483
  %shr = lshr i32 %4, 15, !dbg !1484
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1485
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1486
  %shl = shl i32 %5, 17, !dbg !1487
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  %or = or i32 %6, %shl, !dbg !1488
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1488
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1489
  %shr2 = lshr i32 %7, 15, !dbg !1491
  %cmp = icmp eq i32 %shr2, 0, !dbg !1492
  br i1 %cmp, label %if.then, label %if.else, !dbg !1493

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1494
  store i32 %8, i32* %retval, align 4, !dbg !1496
  br label %return, !dbg !1496

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1497
  br label %return, !dbg !1497

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1499
  ret i32 %9, !dbg !1499
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1500 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1503, metadata !DIExpression()), !dbg !1504
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1505, metadata !DIExpression()), !dbg !1506
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1507, metadata !DIExpression()), !dbg !1508
  store i32 0, i32* %u32Temp1, align 4, !dbg !1508
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1509, metadata !DIExpression()), !dbg !1510
  store i32 0, i32* %u32Temp2, align 4, !dbg !1510
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1511
  %conv = sext i16 %0 to i32, !dbg !1511
  %cmp = icmp sgt i32 %conv, 0, !dbg !1513
  br i1 %cmp, label %if.then, label %if.else, !dbg !1514

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1515
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1517
  %conv2 = sext i16 %2 to i32, !dbg !1517
  %mul = mul i32 %1, %conv2, !dbg !1518
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1519
  %3 = load i32, i32* %value.addr, align 4, !dbg !1520
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1521
  %conv3 = sext i16 %4 to i32, !dbg !1521
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1522
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1523
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1524
  %shr = lshr i32 %5, 15, !dbg !1525
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1526
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1527
  %shl = shl i32 %6, 17, !dbg !1528
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  %or = or i32 %7, %shl, !dbg !1529
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1529
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1530
  store i32 %8, i32* %retval, align 4, !dbg !1531
  br label %return, !dbg !1531

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1532
  br label %return, !dbg !1532

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1534
  ret i32 %9, !dbg !1534
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1535 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1536, metadata !DIExpression()), !dbg !1537
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1538, metadata !DIExpression()), !dbg !1539
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1540, metadata !DIExpression()), !dbg !1541
  store i32 0, i32* %u32Temp1, align 4, !dbg !1541
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1542, metadata !DIExpression()), !dbg !1543
  store i32 0, i32* %u32Temp2, align 4, !dbg !1543
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1544
  %conv = sext i16 %0 to i32, !dbg !1544
  %cmp = icmp sle i32 %conv, 0, !dbg !1546
  br i1 %cmp, label %if.then, label %if.else, !dbg !1547

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1548
  br label %return, !dbg !1548

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1550
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1552
  %conv2 = sext i16 %2 to i32, !dbg !1552
  %mul = mul i32 %1, %conv2, !dbg !1553
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1554
  %3 = load i32, i32* %value.addr, align 4, !dbg !1555
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1556
  %conv3 = sext i16 %4 to i32, !dbg !1556
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1557
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1558
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1559
  %shr = lshr i32 %5, 14, !dbg !1560
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1561
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1562
  %shl = shl i32 %6, 18, !dbg !1563
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1564
  %or = or i32 %7, %shl, !dbg !1564
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1564
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1565
  %shr4 = lshr i32 %8, 14, !dbg !1567
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1568
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1569

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1570
  store i32 %9, i32* %retval, align 4, !dbg !1572
  br label %return, !dbg !1572

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1575
  ret i32 %10, !dbg !1575
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1576 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1577, metadata !DIExpression()), !dbg !1578
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1579, metadata !DIExpression()), !dbg !1580
  %0 = load i32, i32* %value.addr, align 4, !dbg !1581
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1582
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1583
  ret i32 %call, !dbg !1584
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1585 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1586, metadata !DIExpression()), !dbg !1587
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1588, metadata !DIExpression()), !dbg !1589
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1590, metadata !DIExpression()), !dbg !1591
  store i32 0, i32* %u32Temp1, align 4, !dbg !1591
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 0, i32* %u32Temp2, align 4, !dbg !1593
  %0 = load i32, i32* %value.addr, align 4, !dbg !1594
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1595
  %mul = mul i32 %0, %1, !dbg !1596
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1597
  %2 = load i32, i32* %value.addr, align 4, !dbg !1598
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1599
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1600
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1601
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1602
  %shr = lshr i32 %4, 31, !dbg !1603
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1604
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1605
  %shl = shl i32 %5, 1, !dbg !1606
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1607
  %or = or i32 %6, %shl, !dbg !1607
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1607
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1608
  %shr1 = lshr i32 %7, 31, !dbg !1610
  %cmp = icmp eq i32 %shr1, 0, !dbg !1611
  br i1 %cmp, label %if.then, label %if.else, !dbg !1612

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1613
  store i32 %8, i32* %retval, align 4, !dbg !1615
  br label %return, !dbg !1615

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1616
  br label %return, !dbg !1616

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1618
  ret i32 %9, !dbg !1618
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1619 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1620, metadata !DIExpression()), !dbg !1621
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1622, metadata !DIExpression()), !dbg !1623
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1624, metadata !DIExpression()), !dbg !1625
  store i32 0, i32* %u32Temp1, align 4, !dbg !1625
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1626, metadata !DIExpression()), !dbg !1627
  store i32 0, i32* %u32Temp2, align 4, !dbg !1627
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1628
  %cmp = icmp sgt i32 %0, 0, !dbg !1630
  br i1 %cmp, label %if.then, label %if.else, !dbg !1631

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1632
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1634
  %mul = mul i32 %1, %2, !dbg !1635
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1636
  %3 = load i32, i32* %value.addr, align 4, !dbg !1637
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1638
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1639
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1640
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1641
  %shr = lshr i32 %5, 31, !dbg !1642
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1643
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1644
  %shl = shl i32 %6, 1, !dbg !1645
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1646
  %or = or i32 %7, %shl, !dbg !1646
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1646
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1647
  store i32 %8, i32* %retval, align 4, !dbg !1648
  br label %return, !dbg !1648

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1649
  br label %return, !dbg !1649

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1651
  ret i32 %9, !dbg !1651
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1652 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1653, metadata !DIExpression()), !dbg !1654
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1655, metadata !DIExpression()), !dbg !1656
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1657, metadata !DIExpression()), !dbg !1658
  store i32 0, i32* %u32Temp1, align 4, !dbg !1658
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1659, metadata !DIExpression()), !dbg !1660
  store i32 0, i32* %u32Temp2, align 4, !dbg !1660
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1661
  %cmp = icmp sle i32 %0, 0, !dbg !1663
  br i1 %cmp, label %if.then, label %if.else, !dbg !1664

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1665
  br label %return, !dbg !1665

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1667
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1669
  %mul = mul i32 %1, %2, !dbg !1670
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1671
  %3 = load i32, i32* %value.addr, align 4, !dbg !1672
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1673
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1674
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1675
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1676
  %shr = lshr i32 %5, 30, !dbg !1677
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1678
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1679
  %shl = shl i32 %6, 2, !dbg !1680
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1681
  %or = or i32 %7, %shl, !dbg !1681
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1681
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1682
  %shr1 = lshr i32 %8, 30, !dbg !1684
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1685
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1686

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1687
  store i32 %9, i32* %retval, align 4, !dbg !1689
  br label %return, !dbg !1689

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1690
  br label %return, !dbg !1690

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1692
  ret i32 %10, !dbg !1692
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1693 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1696, metadata !DIExpression()), !dbg !1697
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1698, metadata !DIExpression()), !dbg !1699
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1700, metadata !DIExpression()), !dbg !1701
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1701
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1702
  %cmp = icmp slt i32 %0, 0, !dbg !1704
  br i1 %cmp, label %if.then, label %if.end, !dbg !1705

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1706
  %sub = sub nsw i32 0, %1, !dbg !1708
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1709
  br label %if.end, !dbg !1710

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1711
  %cmp1 = icmp ne i32 %2, 0, !dbg !1713
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1714

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1715
  %cmp3 = icmp sle i32 %3, 0, !dbg !1718
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1719

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1720
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1723
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1723
  %div = udiv i32 -2147483648, %4, !dbg !1723, !klee.check.div !259
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1724
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1725
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1726

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1727
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1729
  %mul = mul i32 %6, %7, !dbg !1730
  store i32 %mul, i32* %retval, align 4, !dbg !1731
  br label %return, !dbg !1731

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1732
  br label %return, !dbg !1732

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1734
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1737
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1737
  %div8 = sdiv i32 2147483647, %8, !dbg !1737, !klee.check.div !259
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1738
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1739
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1740

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1741
  br label %return, !dbg !1741

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1743
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1745
  %mul12 = mul i32 %10, %11, !dbg !1746
  store i32 %mul12, i32* %retval, align 4, !dbg !1747
  br label %return, !dbg !1747

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1748
  br label %return, !dbg !1748

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1750
  ret i32 %12, !dbg !1750
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1751 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1752, metadata !DIExpression()), !dbg !1753
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1754, metadata !DIExpression()), !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1756, metadata !DIExpression()), !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1758, metadata !DIExpression()), !dbg !1759
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1760, metadata !DIExpression()), !dbg !1761
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1762, metadata !DIExpression()), !dbg !1763
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1764
  %cmp = icmp slt i32 %0, 0, !dbg !1766
  br i1 %cmp, label %if.then, label %if.else, !dbg !1767

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1768
  %sub = sub nsw i32 0, %1, !dbg !1770
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1771
  store i8 1, i8* %u8SignBit, align 1, !dbg !1772
  br label %if.end, !dbg !1773

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1774
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1776
  store i8 0, i8* %u8SignBit, align 1, !dbg !1777
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1778
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1779
  %conv = zext i16 %4 to i32, !dbg !1779
  %mul = mul i32 %3, %conv, !dbg !1780
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1781
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1782
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1783
  %conv1 = zext i16 %6 to i32, !dbg !1783
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1784
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1785
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1786
  %shr = lshr i32 %7, 16, !dbg !1787
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1788
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1789
  %shl = shl i32 %8, 16, !dbg !1790
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1791
  %or = or i32 %9, %shl, !dbg !1791
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1791
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1792
  %conv2 = zext i8 %10 to i32, !dbg !1792
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1794
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1795

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1796
  store i32 %11, i32* %retval, align 4, !dbg !1798
  br label %return, !dbg !1798

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1799
  %sub7 = sub i32 0, %12, !dbg !1801
  store i32 %sub7, i32* %retval, align 4, !dbg !1802
  br label %return, !dbg !1802

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1803
  ret i32 %13, !dbg !1803
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1804 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1805, metadata !DIExpression()), !dbg !1806
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1807, metadata !DIExpression()), !dbg !1808
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1809, metadata !DIExpression()), !dbg !1810
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1811, metadata !DIExpression()), !dbg !1812
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1813, metadata !DIExpression()), !dbg !1814
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1815, metadata !DIExpression()), !dbg !1816
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1817
  %cmp = icmp slt i32 %0, 0, !dbg !1819
  br i1 %cmp, label %if.then, label %if.else, !dbg !1820

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1821
  %sub = sub nsw i32 0, %1, !dbg !1823
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1824
  store i8 1, i8* %u8SignBit, align 1, !dbg !1825
  br label %if.end, !dbg !1826

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1827
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1829
  store i8 0, i8* %u8SignBit, align 1, !dbg !1830
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1831
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1832
  %conv = zext i16 %4 to i32, !dbg !1832
  %mul = mul i32 %3, %conv, !dbg !1833
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1834
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1835
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1836
  %conv1 = zext i16 %6 to i32, !dbg !1836
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1837
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1838
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1839
  %shr = lshr i32 %7, 15, !dbg !1840
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1841
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1842
  %shl = shl i32 %8, 17, !dbg !1843
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1844
  %or = or i32 %9, %shl, !dbg !1844
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1844
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1845
  %conv2 = zext i8 %10 to i32, !dbg !1845
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1847
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1848

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1849
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1852
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1853

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1854
  store i32 %12, i32* %retval, align 4, !dbg !1855
  br label %return, !dbg !1855

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1856
  br label %return, !dbg !1856

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1857
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1860
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1861

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1862
  %sub14 = sub i32 0, %14, !dbg !1863
  store i32 %sub14, i32* %retval, align 4, !dbg !1864
  br label %return, !dbg !1864

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1865
  br label %return, !dbg !1865

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1866
  ret i32 %15, !dbg !1866
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1867 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1870, metadata !DIExpression()), !dbg !1871
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1872, metadata !DIExpression()), !dbg !1873
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1874, metadata !DIExpression()), !dbg !1875
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1876, metadata !DIExpression()), !dbg !1877
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1878, metadata !DIExpression()), !dbg !1879
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1880, metadata !DIExpression()), !dbg !1881
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1882, metadata !DIExpression()), !dbg !1883
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1884
  %cmp = icmp slt i32 %0, 0, !dbg !1886
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1887

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1888
  %conv = sext i16 %1 to i32, !dbg !1888
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1889
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1890

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1891
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1892
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1893

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1894
  %conv6 = sext i16 %3 to i32, !dbg !1894
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1895
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1896

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1897
  br label %if.end, !dbg !1899

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1900
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1902
  %cmp9 = icmp slt i32 %4, 0, !dbg !1904
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1905

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1906
  %sub = sub nsw i32 0, %5, !dbg !1908
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1909
  br label %if.end13, !dbg !1910

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1911
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1913
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1914
  %conv14 = sext i16 %7 to i32, !dbg !1914
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1916
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1917

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1918
  %conv18 = sext i16 %8 to i32, !dbg !1918
  %sub19 = sub nsw i32 0, %conv18, !dbg !1920
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1921
  br label %if.end22, !dbg !1922

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1923
  %conv21 = sext i16 %9 to i32, !dbg !1923
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1925
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1926
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1927
  %mul = mul i32 %10, %11, !dbg !1928
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1929
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1930
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1931
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1932
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1933
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1934
  %shr = lshr i32 %14, 15, !dbg !1935
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1936
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1937
  %shl = shl i32 %15, 17, !dbg !1938
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1939
  %or = or i32 %16, %shl, !dbg !1939
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1939
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1940
  %conv23 = zext i8 %17 to i32, !dbg !1940
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1942
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1943

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1944
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1947
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1948

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1949
  store i32 %19, i32* %retval, align 4, !dbg !1950
  br label %return, !dbg !1950

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1951
  br label %return, !dbg !1951

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1952
  %sub32 = sub i32 0, %20, !dbg !1954
  store i32 %sub32, i32* %retval, align 4, !dbg !1955
  br label %return, !dbg !1955

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1956
  ret i32 %21, !dbg !1956
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1957 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1958, metadata !DIExpression()), !dbg !1959
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1960, metadata !DIExpression()), !dbg !1961
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1962, metadata !DIExpression()), !dbg !1963
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1964, metadata !DIExpression()), !dbg !1965
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1966, metadata !DIExpression()), !dbg !1967
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1968, metadata !DIExpression()), !dbg !1969
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1970, metadata !DIExpression()), !dbg !1971
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1972
  %cmp = icmp slt i32 %0, 0, !dbg !1974
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1975

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1976
  %conv = sext i16 %1 to i32, !dbg !1976
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1977
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1978

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1979
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1980
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1981

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1982
  %conv6 = sext i16 %3 to i32, !dbg !1982
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1983
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1984

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1985
  br label %if.end, !dbg !1987

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1988
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1990
  %cmp9 = icmp slt i32 %4, 0, !dbg !1992
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1993

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1994
  %sub = sub nsw i32 0, %5, !dbg !1996
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1997
  br label %if.end13, !dbg !1998

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1999
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2001
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2002
  %conv14 = sext i16 %7 to i32, !dbg !2002
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2004
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2005

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2006
  %conv18 = sext i16 %8 to i32, !dbg !2006
  %sub19 = sub nsw i32 0, %conv18, !dbg !2008
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2009
  br label %if.end22, !dbg !2010

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2011
  %conv21 = sext i16 %9 to i32, !dbg !2011
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2013
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2014
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2015
  %mul = mul i32 %10, %11, !dbg !2016
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2017
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2018
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2019
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2020
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2021
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2022
  %shr = lshr i32 %14, 14, !dbg !2023
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2024
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2025
  %shl = shl i32 %15, 18, !dbg !2026
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2027
  %or = or i32 %16, %shl, !dbg !2027
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2027
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2028
  %shr23 = lshr i32 %17, 14, !dbg !2030
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2031
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2032

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2033
  %conv27 = zext i8 %18 to i32, !dbg !2033
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2036
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2037

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2038
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2041
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2042

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2043
  store i32 %20, i32* %retval, align 4, !dbg !2044
  br label %return, !dbg !2044

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2045
  br label %return, !dbg !2045

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2046
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2049
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2050

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2051
  %sub39 = sub i32 0, %22, !dbg !2052
  store i32 %sub39, i32* %retval, align 4, !dbg !2053
  br label %return, !dbg !2053

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2054
  br label %return, !dbg !2054

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2055
  br label %return, !dbg !2055

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2057
  ret i32 %23, !dbg !2057
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2058 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2061, metadata !DIExpression()), !dbg !2062
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2063, metadata !DIExpression()), !dbg !2064
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2065, metadata !DIExpression()), !dbg !2066
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2067, metadata !DIExpression()), !dbg !2068
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2069, metadata !DIExpression()), !dbg !2070
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2071
  %cmp = icmp slt i32 %0, 0, !dbg !2073
  br i1 %cmp, label %if.then, label %if.else, !dbg !2074

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2075
  %sub = sub nsw i32 0, %1, !dbg !2077
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2078
  store i8 1, i8* %u8SignBit, align 1, !dbg !2079
  br label %if.end, !dbg !2080

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2081
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2083
  store i8 0, i8* %u8SignBit, align 1, !dbg !2084
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2085
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2086
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2087
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2088
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2089
  %conv = zext i8 %5 to i32, !dbg !2089
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2091
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2092

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2093
  store i32 %6, i32* %retval, align 4, !dbg !2094
  br label %return, !dbg !2094

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2095
  %sub5 = sub i32 0, %7, !dbg !2096
  store i32 %sub5, i32* %retval, align 4, !dbg !2097
  br label %return, !dbg !2097

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2098
  ret i32 %8, !dbg !2098
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2099 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2100, metadata !DIExpression()), !dbg !2101
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2102, metadata !DIExpression()), !dbg !2103
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2104, metadata !DIExpression()), !dbg !2105
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2106, metadata !DIExpression()), !dbg !2107
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2108, metadata !DIExpression()), !dbg !2109
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2110, metadata !DIExpression()), !dbg !2111
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2112
  %cmp = icmp slt i32 %0, 0, !dbg !2114
  br i1 %cmp, label %if.then, label %if.else, !dbg !2115

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2116
  %sub = sub nsw i32 0, %1, !dbg !2118
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2119
  store i8 1, i8* %u8SignBit, align 1, !dbg !2120
  br label %if.end, !dbg !2121

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2122
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2124
  store i8 0, i8* %u8SignBit, align 1, !dbg !2125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2126
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2127
  %mul = mul i32 %3, %4, !dbg !2128
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2129
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2130
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2131
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2132
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2133
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2134
  %shr = lshr i32 %7, 31, !dbg !2135
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2136
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2137
  %shl = shl i32 %8, 1, !dbg !2138
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2139
  %or = or i32 %9, %shl, !dbg !2139
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2139
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2140
  %conv = zext i8 %10 to i32, !dbg !2140
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2142
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2143

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2144
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2147
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2148

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2149
  store i32 %12, i32* %retval, align 4, !dbg !2150
  br label %return, !dbg !2150

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2151
  br label %return, !dbg !2151

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2152
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2155
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2156

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2157
  %sub12 = sub i32 0, %14, !dbg !2158
  store i32 %sub12, i32* %retval, align 4, !dbg !2159
  br label %return, !dbg !2159

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2160
  br label %return, !dbg !2160

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2161
  ret i32 %15, !dbg !2161
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2162 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2165, metadata !DIExpression()), !dbg !2166
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2167, metadata !DIExpression()), !dbg !2168
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2169, metadata !DIExpression()), !dbg !2170
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2171, metadata !DIExpression()), !dbg !2172
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2173, metadata !DIExpression()), !dbg !2174
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2175, metadata !DIExpression()), !dbg !2176
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2177, metadata !DIExpression()), !dbg !2178
  %0 = load i32, i32* %value.addr, align 4, !dbg !2179
  %cmp = icmp slt i32 %0, 0, !dbg !2181
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2182
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2182

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2183
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2184
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2185
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2185

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2186
  br label %if.end, !dbg !2188

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2189
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2191
  %cmp5 = icmp slt i32 %4, 0, !dbg !2193
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2194

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2195
  %sub = sub nsw i32 0, %5, !dbg !2197
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2198
  br label %if.end8, !dbg !2199

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2200
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2202
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2203
  %cmp9 = icmp slt i32 %7, 0, !dbg !2205
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2206

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2207
  %sub11 = sub nsw i32 0, %8, !dbg !2209
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2210
  br label %if.end13, !dbg !2211

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2212
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2214
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2215
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2216
  %mul = mul i32 %10, %11, !dbg !2217
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2218
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2219
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2220
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2221
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2222
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2223
  %shr = lshr i32 %14, 31, !dbg !2224
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2225
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2226
  %shl = shl i32 %15, 1, !dbg !2227
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2228
  %or = or i32 %16, %shl, !dbg !2228
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2228
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2229
  %conv = zext i8 %17 to i32, !dbg !2229
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2231
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2232

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2233
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2236
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2237

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2238
  store i32 %19, i32* %retval, align 4, !dbg !2239
  br label %return, !dbg !2239

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2240
  br label %return, !dbg !2240

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2241
  %sub22 = sub i32 0, %20, !dbg !2243
  store i32 %sub22, i32* %retval, align 4, !dbg !2244
  br label %return, !dbg !2244

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2245
  ret i32 %21, !dbg !2245
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2246 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2247, metadata !DIExpression()), !dbg !2248
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2249, metadata !DIExpression()), !dbg !2250
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2251, metadata !DIExpression()), !dbg !2252
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2253, metadata !DIExpression()), !dbg !2254
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2255, metadata !DIExpression()), !dbg !2256
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2257, metadata !DIExpression()), !dbg !2258
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2259, metadata !DIExpression()), !dbg !2260
  %0 = load i32, i32* %value.addr, align 4, !dbg !2261
  %cmp = icmp slt i32 %0, 0, !dbg !2263
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2264
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2264

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2265
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2266
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2267
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2267

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2268
  br label %if.end, !dbg !2270

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2271
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2273
  %cmp5 = icmp slt i32 %4, 0, !dbg !2275
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2276

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2277
  %sub = sub nsw i32 0, %5, !dbg !2279
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2280
  br label %if.end8, !dbg !2281

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2282
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2284
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2285
  %cmp9 = icmp slt i32 %7, 0, !dbg !2287
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2288

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2289
  %sub11 = sub nsw i32 0, %8, !dbg !2291
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2292
  br label %if.end13, !dbg !2293

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2294
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2296
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2297
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2298
  %mul = mul i32 %10, %11, !dbg !2299
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2300
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2301
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2302
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2303
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2304
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2305
  %shr = lshr i32 %14, 30, !dbg !2306
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2307
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2308
  %shl = shl i32 %15, 2, !dbg !2309
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2310
  %or = or i32 %16, %shl, !dbg !2310
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2310
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2311
  %shr14 = lshr i32 %17, 30, !dbg !2313
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2314
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2315

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2316
  %conv = zext i8 %18 to i32, !dbg !2316
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2319
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2320

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2321
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2324
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2325

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2326
  store i32 %20, i32* %retval, align 4, !dbg !2327
  br label %return, !dbg !2327

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2328
  br label %return, !dbg !2328

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2329
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2332
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2333

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2334
  %sub28 = sub i32 0, %22, !dbg !2335
  store i32 %sub28, i32* %retval, align 4, !dbg !2336
  br label %return, !dbg !2336

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2337
  br label %return, !dbg !2337

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2338
  br label %return, !dbg !2338

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2340
  ret i32 %23, !dbg !2340
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2341 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2344, metadata !DIExpression()), !dbg !2345
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2346, metadata !DIExpression()), !dbg !2347
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2348, metadata !DIExpression()), !dbg !2349
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2350, metadata !DIExpression()), !dbg !2351
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2352, metadata !DIExpression()), !dbg !2353
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2354, metadata !DIExpression()), !dbg !2355
  %0 = load i32, i32* %value.addr, align 4, !dbg !2356
  %cmp = icmp slt i32 %0, 0, !dbg !2358
  br i1 %cmp, label %if.then, label %if.else, !dbg !2359

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2360
  %sub = sub nsw i32 0, %1, !dbg !2362
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2363
  store i8 1, i8* %u8SignBit, align 1, !dbg !2364
  br label %if.end, !dbg !2365

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2366
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2368
  store i8 0, i8* %u8SignBit, align 1, !dbg !2369
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2370
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2371
  %conv = zext i8 %4 to i32, !dbg !2371
  %mul = mul i32 %3, %conv, !dbg !2372
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2373
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2374
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2375
  %conv1 = zext i8 %6 to i32, !dbg !2375
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2376
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2377
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2378
  %shr = lshr i32 %7, 8, !dbg !2379
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2380
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2381
  %shl = shl i32 %8, 24, !dbg !2382
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2383
  %or = or i32 %9, %shl, !dbg !2383
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2383
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2384
  %conv2 = zext i8 %10 to i32, !dbg !2384
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2386
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2387

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2388
  store i32 %11, i32* %retval, align 4, !dbg !2390
  br label %return, !dbg !2390

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2391
  %sub7 = sub i32 0, %12, !dbg !2393
  store i32 %sub7, i32* %retval, align 4, !dbg !2394
  br label %return, !dbg !2394

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2395
  ret i32 %13, !dbg !2395
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2396 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2397, metadata !DIExpression()), !dbg !2398
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2399, metadata !DIExpression()), !dbg !2400
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2401, metadata !DIExpression()), !dbg !2402
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2403, metadata !DIExpression()), !dbg !2404
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2405, metadata !DIExpression()), !dbg !2406
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2407, metadata !DIExpression()), !dbg !2408
  %0 = load i32, i32* %value.addr, align 4, !dbg !2409
  %cmp = icmp slt i32 %0, 0, !dbg !2411
  br i1 %cmp, label %if.then, label %if.else, !dbg !2412

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2413
  %sub = sub nsw i32 0, %1, !dbg !2415
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2416
  store i8 1, i8* %u8SignBit, align 1, !dbg !2417
  br label %if.end, !dbg !2418

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2419
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2421
  store i8 0, i8* %u8SignBit, align 1, !dbg !2422
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2423
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2424
  %conv = zext i8 %4 to i32, !dbg !2424
  %mul = mul i32 %3, %conv, !dbg !2425
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2426
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2427
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2428
  %conv1 = zext i8 %6 to i32, !dbg !2428
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2429
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2430
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2431
  %shr = lshr i32 %7, 7, !dbg !2432
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2433
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2434
  %shl = shl i32 %8, 25, !dbg !2435
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2436
  %or = or i32 %9, %shl, !dbg !2436
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2436
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2437
  %conv2 = zext i8 %10 to i32, !dbg !2437
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2439
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2440

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2441
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2444
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2445

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2446
  store i32 %12, i32* %retval, align 4, !dbg !2447
  br label %return, !dbg !2447

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2448
  br label %return, !dbg !2448

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2449
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2452
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2453

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2454
  %sub14 = sub i32 0, %14, !dbg !2455
  store i32 %sub14, i32* %retval, align 4, !dbg !2456
  br label %return, !dbg !2456

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2457
  br label %return, !dbg !2457

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2458
  ret i32 %15, !dbg !2458
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2459 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2462, metadata !DIExpression()), !dbg !2463
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2464, metadata !DIExpression()), !dbg !2465
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2466, metadata !DIExpression()), !dbg !2467
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2468, metadata !DIExpression()), !dbg !2469
  store i32 0, i32* %u32Temp1, align 4, !dbg !2469
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2470, metadata !DIExpression()), !dbg !2471
  store i32 0, i32* %u32Temp2, align 4, !dbg !2471
  %0 = load i8, i8* %power.addr, align 1, !dbg !2472
  %conv = zext i8 %0 to i32, !dbg !2472
  %cmp = icmp sge i32 %conv, 32, !dbg !2474
  br i1 %cmp, label %if.then, label %if.else, !dbg !2475

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2476
  br label %if.end7, !dbg !2478

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2479
  %conv2 = zext i8 %1 to i32, !dbg !2479
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2481
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2482

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2483
  br label %if.end7, !dbg !2485

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2486
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2487
  %mul = mul i32 %2, %3, !dbg !2488
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2489
  %4 = load i32, i32* %value.addr, align 4, !dbg !2490
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2491
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2492
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2493
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2494
  %7 = load i8, i8* %power.addr, align 1, !dbg !2495
  %conv8 = zext i8 %7 to i32, !dbg !2495
  %sub = sub nsw i32 32, %conv8, !dbg !2496
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2497
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2497
  %shr = lshr i32 %6, %sub, !dbg !2497, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2498
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2499
  %9 = load i8, i8* %power.addr, align 1, !dbg !2500
  %conv9 = zext i8 %9 to i32, !dbg !2500
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2501
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2501
  %shl = shl i32 %8, %conv9, !dbg !2501, !klee.check.shift !259
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2502
  %or = or i32 %10, %shl, !dbg !2502
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2502
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2503
  %12 = load i8, i8* %power.addr, align 1, !dbg !2505
  %conv10 = zext i8 %12 to i32, !dbg !2505
  %sub11 = sub nsw i32 32, %conv10, !dbg !2506
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2507
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2507
  %shr12 = lshr i32 %11, %sub11, !dbg !2507, !klee.check.shift !259
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2508
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2509

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2510
  store i32 %13, i32* %retval, align 4, !dbg !2512
  br label %return, !dbg !2512

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2513
  br label %return, !dbg !2513

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2515
  ret i32 %14, !dbg !2515
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2516 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2519, metadata !DIExpression()), !dbg !2520
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2521, metadata !DIExpression()), !dbg !2522
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2523, metadata !DIExpression()), !dbg !2524
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2525, metadata !DIExpression()), !dbg !2526
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2527, metadata !DIExpression()), !dbg !2528
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2529, metadata !DIExpression()), !dbg !2530
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2531, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2533, metadata !DIExpression()), !dbg !2534
  %0 = load i8, i8* %power.addr, align 1, !dbg !2535
  %conv = zext i8 %0 to i32, !dbg !2535
  %cmp = icmp sge i32 %conv, 32, !dbg !2537
  br i1 %cmp, label %if.then, label %if.else, !dbg !2538

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2539
  br label %if.end7, !dbg !2541

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2542
  %conv2 = zext i8 %1 to i32, !dbg !2542
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2544
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2545

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2546
  br label %if.end7, !dbg !2548

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2549
  %cmp8 = icmp slt i32 %2, 0, !dbg !2551
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2552
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2552

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2553
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2554
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2555
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2555

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2556
  br label %if.end19, !dbg !2558

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2559
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2561
  %cmp20 = icmp slt i32 %6, 0, !dbg !2563
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2564

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2565
  %sub = sub nsw i32 0, %7, !dbg !2567
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2568
  br label %if.end24, !dbg !2569

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2570
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2572
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2573
  %cmp25 = icmp slt i32 %9, 0, !dbg !2575
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2576

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2577
  %sub28 = sub nsw i32 0, %10, !dbg !2579
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2580
  br label %if.end30, !dbg !2581

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2582
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2584
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2585
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2586
  %mul = mul i32 %12, %13, !dbg !2587
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2588
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2589
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2590
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2591
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2592
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2593
  %17 = load i8, i8* %power.addr, align 1, !dbg !2594
  %conv31 = zext i8 %17 to i32, !dbg !2594
  %sub32 = sub nsw i32 32, %conv31, !dbg !2595
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2596
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2596
  %shr = lshr i32 %16, %sub32, !dbg !2596, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2597
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2598
  %19 = load i8, i8* %power.addr, align 1, !dbg !2599
  %conv33 = zext i8 %19 to i32, !dbg !2599
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2600
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2600
  %shl = shl i32 %18, %conv33, !dbg !2600, !klee.check.shift !259
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2601
  %or = or i32 %20, %shl, !dbg !2601
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2601
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2602
  %22 = load i8, i8* %power.addr, align 1, !dbg !2604
  %conv34 = zext i8 %22 to i32, !dbg !2604
  %sub35 = sub nsw i32 32, %conv34, !dbg !2605
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2606
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2606
  %shr36 = lshr i32 %21, %sub35, !dbg !2606, !klee.check.shift !259
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2607
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2608

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2609
  %conv40 = zext i8 %23 to i32, !dbg !2609
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2612
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2613

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2614
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2617
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2618

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2619
  store i32 %25, i32* %retval, align 4, !dbg !2620
  br label %return, !dbg !2620

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2621
  br label %return, !dbg !2621

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2622
  %sub49 = sub i32 0, %26, !dbg !2624
  store i32 %sub49, i32* %retval, align 4, !dbg !2625
  br label %return, !dbg !2625

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2626
  %conv51 = zext i8 %27 to i32, !dbg !2626
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2629
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2630

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2631
  br label %return, !dbg !2631

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2633
  br label %return, !dbg !2633

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2635
  ret i32 %28, !dbg !2635
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2636 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2639, metadata !DIExpression()), !dbg !2640
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2641, metadata !DIExpression()), !dbg !2642
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2643, metadata !DIExpression()), !dbg !2644
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2645, metadata !DIExpression()), !dbg !2646
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2647, metadata !DIExpression()), !dbg !2648
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2649, metadata !DIExpression()), !dbg !2650
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2651, metadata !DIExpression()), !dbg !2652
  %0 = load i32, i32* %value.addr, align 4, !dbg !2653
  %cmp = icmp slt i32 %0, 0, !dbg !2655
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2656

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2657
  %conv = sext i8 %1 to i32, !dbg !2657
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2658
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2659

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2660
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2661
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2662

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2663
  %conv6 = sext i8 %3 to i32, !dbg !2663
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2664
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2665

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2666
  br label %if.end, !dbg !2668

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2669
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2671
  %cmp9 = icmp slt i32 %4, 0, !dbg !2673
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2674

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2675
  %sub = sub nsw i32 0, %5, !dbg !2677
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2678
  br label %if.end13, !dbg !2679

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2680
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2682
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2683
  %conv14 = sext i8 %7 to i32, !dbg !2683
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2685
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2686

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2687
  %conv18 = sext i8 %8 to i32, !dbg !2687
  %sub19 = sub nsw i32 0, %conv18, !dbg !2689
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2690
  br label %if.end22, !dbg !2691

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2692
  %conv21 = sext i8 %9 to i32, !dbg !2692
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2694
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2695
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2696
  %mul = mul i32 %10, %11, !dbg !2697
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2698
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2699
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2700
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2701
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2702
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2703
  %shr = lshr i32 %14, 7, !dbg !2704
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2705
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2706
  %shl = shl i32 %15, 25, !dbg !2707
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2708
  %or = or i32 %16, %shl, !dbg !2708
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2708
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2709
  %conv23 = zext i8 %17 to i32, !dbg !2709
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2711
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2712

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2713
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2716
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2717

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2718
  store i32 %19, i32* %retval, align 4, !dbg !2719
  br label %return, !dbg !2719

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2720
  br label %return, !dbg !2720

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2721
  %sub32 = sub i32 0, %20, !dbg !2723
  store i32 %sub32, i32* %retval, align 4, !dbg !2724
  br label %return, !dbg !2724

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2725
  ret i32 %21, !dbg !2725
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2726 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2727, metadata !DIExpression()), !dbg !2728
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2729, metadata !DIExpression()), !dbg !2730
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2731, metadata !DIExpression()), !dbg !2732
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2733, metadata !DIExpression()), !dbg !2734
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2735, metadata !DIExpression()), !dbg !2736
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2737, metadata !DIExpression()), !dbg !2738
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2739, metadata !DIExpression()), !dbg !2740
  %0 = load i32, i32* %value.addr, align 4, !dbg !2741
  %cmp = icmp slt i32 %0, 0, !dbg !2743
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2744

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2745
  %conv = sext i8 %1 to i32, !dbg !2745
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2746
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2747

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2748
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2749
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2750

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2751
  %conv6 = sext i8 %3 to i32, !dbg !2751
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2752
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2753

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2754
  br label %if.end, !dbg !2756

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2757
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2759
  %cmp9 = icmp slt i32 %4, 0, !dbg !2761
  br i1 %cmp9, label %if.then11, label %if.else16, !dbg !2762

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2763
  %conv12 = sext i32 %5 to i64, !dbg !2766
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv12), !dbg !2767
  %tobool = icmp ne i32 %call, 0, !dbg !2767
  br i1 %tobool, label %if.end14, label %if.then13, !dbg !2768

if.then13:                                        ; preds = %if.then11
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 2604, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !2769
  unreachable, !dbg !2769

if.end14:                                         ; preds = %if.then11
  %6 = load i32, i32* %value.addr, align 4, !dbg !2771
  %sub = sub nsw i32 0, %6, !dbg !2772
  %conv15 = sext i32 %sub to i64, !dbg !2773
  store volatile i64 %conv15, i64* @klee_alarm_sink_s64, align 8, !dbg !2774
  store i32 0, i32* %retval, align 4, !dbg !2775
  br label %return, !dbg !2775

if.else16:                                        ; preds = %if.end
  %7 = load i32, i32* %value.addr, align 4, !dbg !2776
  store i32 %7, i32* %u32Temp1, align 4, !dbg !2778
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2779
  %conv18 = sext i8 %8 to i32, !dbg !2779
  %cmp19 = icmp slt i32 %conv18, 0, !dbg !2781
  br i1 %cmp19, label %if.then21, label %if.else24, !dbg !2782

if.then21:                                        ; preds = %if.else16
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2783
  %conv22 = sext i8 %9 to i32, !dbg !2783
  %sub23 = sub nsw i32 0, %conv22, !dbg !2785
  store i32 %sub23, i32* %u32Temp2, align 4, !dbg !2786
  br label %if.end26, !dbg !2787

if.else24:                                        ; preds = %if.else16
  %10 = load i8, i8* %factor.addr, align 1, !dbg !2788
  %conv25 = sext i8 %10 to i32, !dbg !2788
  store i32 %conv25, i32* %u32Temp2, align 4, !dbg !2790
  br label %if.end26

if.end26:                                         ; preds = %if.else24, %if.then21
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !2791
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2792
  %mul = mul i32 %11, %12, !dbg !2793
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2794
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2795
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2796
  %call27 = call i32 @MulHighWord(i32 %13, i32 %14), !dbg !2797
  store i32 %call27, i32* %u32Temp4, align 4, !dbg !2798
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !2799
  %shr = lshr i32 %15, 6, !dbg !2800
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2801
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !2802
  %shl = shl i32 %16, 26, !dbg !2803
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2804
  %or = or i32 %17, %shl, !dbg !2804
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2804
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2805
  %shr28 = lshr i32 %18, 6, !dbg !2807
  %cmp29 = icmp eq i32 %shr28, 0, !dbg !2808
  br i1 %cmp29, label %if.then31, label %if.else46, !dbg !2809

if.then31:                                        ; preds = %if.end26
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !2810
  %conv32 = zext i8 %19 to i32, !dbg !2810
  %cmp33 = icmp eq i32 %conv32, 0, !dbg !2813
  br i1 %cmp33, label %if.then35, label %if.else40, !dbg !2814

if.then35:                                        ; preds = %if.then31
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2815
  %cmp36 = icmp ule i32 %20, 2147483647, !dbg !2818
  br i1 %cmp36, label %if.then38, label %if.else39, !dbg !2819

if.then38:                                        ; preds = %if.then35
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2820
  store i32 %21, i32* %retval, align 4, !dbg !2821
  br label %return, !dbg !2821

if.else39:                                        ; preds = %if.then35
  store i32 2147483647, i32* %retval, align 4, !dbg !2822
  br label %return, !dbg !2822

if.else40:                                        ; preds = %if.then31
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2823
  %cmp41 = icmp ule i32 %22, -2147483648, !dbg !2826
  br i1 %cmp41, label %if.then43, label %if.else45, !dbg !2827

if.then43:                                        ; preds = %if.else40
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !2828
  %sub44 = sub i32 0, %23, !dbg !2829
  store i32 %sub44, i32* %retval, align 4, !dbg !2830
  br label %return, !dbg !2830

if.else45:                                        ; preds = %if.else40
  store i32 -2147483648, i32* %retval, align 4, !dbg !2831
  br label %return, !dbg !2831

if.else46:                                        ; preds = %if.end26
  store i32 2147483647, i32* %retval, align 4, !dbg !2832
  br label %return, !dbg !2832

return:                                           ; preds = %if.else46, %if.else45, %if.then43, %if.else39, %if.then38, %if.end14
  %24 = load i32, i32* %retval, align 4, !dbg !2834
  ret i32 %24, !dbg !2834
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2835 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2838, metadata !DIExpression()), !dbg !2839
  %0 = load i64, i64* %value.addr, align 8, !dbg !2840
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2841
  %conv = zext i1 %cmp to i32, !dbg !2841
  ret i32 %conv, !dbg !2842
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2843 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2844, metadata !DIExpression()), !dbg !2845
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2846, metadata !DIExpression()), !dbg !2847
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2848, metadata !DIExpression()), !dbg !2849
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2850, metadata !DIExpression()), !dbg !2851
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2852, metadata !DIExpression()), !dbg !2853
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2854, metadata !DIExpression()), !dbg !2855
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2856, metadata !DIExpression()), !dbg !2857
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2858
  %cmp = icmp slt i32 %0, 0, !dbg !2860
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2861
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2861

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2862
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2863
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2864
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2864

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2865
  br label %if.end, !dbg !2867

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2868
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2870
  %cmp5 = icmp slt i32 %4, 0, !dbg !2872
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2873

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2874
  %sub = sub nsw i32 0, %5, !dbg !2876
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2877
  br label %if.end8, !dbg !2878

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2879
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2881
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2882
  %cmp9 = icmp slt i32 %7, 0, !dbg !2884
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2885

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2886
  %sub11 = sub nsw i32 0, %8, !dbg !2888
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2889
  br label %if.end13, !dbg !2890

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2891
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2893
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2894
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2895
  %mul = mul i32 %10, %11, !dbg !2896
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2897
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2898
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2899
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2900
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2901
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2902
  %cmp14 = icmp eq i32 %14, 0, !dbg !2904
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2905

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2906
  %conv = zext i8 %15 to i32, !dbg !2906
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2909
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2910

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2911
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2914
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2915

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2916
  store i32 %17, i32* %retval, align 4, !dbg !2917
  br label %return, !dbg !2917

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2918
  br label %return, !dbg !2918

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2919
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2922
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2923

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2924
  %sub27 = sub i32 0, %19, !dbg !2925
  store i32 %sub27, i32* %retval, align 4, !dbg !2926
  br label %return, !dbg !2926

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2927
  br label %return, !dbg !2927

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2928
  %conv30 = zext i8 %20 to i32, !dbg !2928
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2931
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2932

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2933
  br label %return, !dbg !2933

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2935
  br label %return, !dbg !2935

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2937
  ret i32 %21, !dbg !2937
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2938 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2939, metadata !DIExpression()), !dbg !2940
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2941, metadata !DIExpression()), !dbg !2942
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2943, metadata !DIExpression()), !dbg !2944
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2945, metadata !DIExpression()), !dbg !2946
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2947, metadata !DIExpression()), !dbg !2948
  %0 = load i32, i32* %value.addr, align 4, !dbg !2949
  %cmp = icmp slt i32 %0, 0, !dbg !2951
  br i1 %cmp, label %if.then, label %if.else, !dbg !2952

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2953
  %sub = sub nsw i32 0, %1, !dbg !2955
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2956
  store i8 1, i8* %u8SignBit, align 1, !dbg !2957
  br label %if.end, !dbg !2958

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2959
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2961
  store i8 0, i8* %u8SignBit, align 1, !dbg !2962
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2963
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2964
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2965
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2966
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2967
  %shr = lshr i32 %5, 1, !dbg !2968
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2969
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2970
  %conv = zext i8 %6 to i32, !dbg !2970
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2972
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2973

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2974
  store i32 %7, i32* %retval, align 4, !dbg !2976
  br label %return, !dbg !2976

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2977
  %sub5 = sub i32 0, %8, !dbg !2979
  store i32 %sub5, i32* %retval, align 4, !dbg !2980
  br label %return, !dbg !2980

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2981
  ret i32 %9, !dbg !2981
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2982 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2983, metadata !DIExpression()), !dbg !2984
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2985, metadata !DIExpression()), !dbg !2986
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2987, metadata !DIExpression()), !dbg !2988
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2989, metadata !DIExpression()), !dbg !2990
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2991, metadata !DIExpression()), !dbg !2992
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2993, metadata !DIExpression()), !dbg !2994
  %0 = load i32, i32* %value.addr, align 4, !dbg !2995
  %cmp = icmp slt i32 %0, 0, !dbg !2997
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2998
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2998

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2999
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3000
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3001
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3001

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3002
  br label %if.end, !dbg !3004

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3005
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3007
  %cmp5 = icmp slt i32 %4, 0, !dbg !3009
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3010

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3011
  %sub = sub nsw i32 0, %5, !dbg !3013
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3014
  br label %if.end8, !dbg !3015

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3016
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3018
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3019
  %cmp9 = icmp slt i32 %7, 0, !dbg !3021
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3022

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3023
  %sub11 = sub nsw i32 0, %8, !dbg !3025
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3026
  br label %if.end13, !dbg !3027

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3028
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3030
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3031
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3032
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3033
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3034
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3035
  %conv = zext i8 %12 to i32, !dbg !3035
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3037
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3038

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3039
  store i32 %13, i32* %retval, align 4, !dbg !3041
  br label %return, !dbg !3041

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3042
  %sub18 = sub i32 0, %14, !dbg !3044
  store i32 %sub18, i32* %retval, align 4, !dbg !3045
  br label %return, !dbg !3045

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3046
  ret i32 %15, !dbg !3046
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3047 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3050, metadata !DIExpression()), !dbg !3051
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3052, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3054, metadata !DIExpression()), !dbg !3055
  store i32 0, i32* %u32Temp1, align 4, !dbg !3055
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3056, metadata !DIExpression()), !dbg !3057
  store i32 0, i32* %u32Temp2, align 4, !dbg !3057
  %0 = load i32, i32* %value.addr, align 4, !dbg !3058
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3059
  %conv = zext i8 %1 to i32, !dbg !3059
  %mul = mul i32 %0, %conv, !dbg !3060
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3061
  %2 = load i32, i32* %value.addr, align 4, !dbg !3062
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3063
  %conv1 = zext i8 %3 to i32, !dbg !3063
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3064
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3065
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3066
  %shr = lshr i32 %4, 8, !dbg !3067
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3068
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3069
  %shl = shl i32 %5, 24, !dbg !3070
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3071
  %or = or i32 %6, %shl, !dbg !3071
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3071
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3072
  ret i32 %7, !dbg !3073
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3074 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3075, metadata !DIExpression()), !dbg !3076
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3077, metadata !DIExpression()), !dbg !3078
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3079, metadata !DIExpression()), !dbg !3080
  store i32 0, i32* %u32Temp1, align 4, !dbg !3080
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3081, metadata !DIExpression()), !dbg !3082
  store i32 0, i32* %u32Temp2, align 4, !dbg !3082
  %0 = load i32, i32* %value.addr, align 4, !dbg !3083
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3084
  %conv = zext i8 %1 to i32, !dbg !3084
  %mul = mul i32 %0, %conv, !dbg !3085
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3086
  %2 = load i32, i32* %value.addr, align 4, !dbg !3087
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3088
  %conv1 = zext i8 %3 to i32, !dbg !3088
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3089
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3090
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3091
  %shr = lshr i32 %4, 7, !dbg !3092
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3093
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3094
  %shl = shl i32 %5, 25, !dbg !3095
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3096
  %or = or i32 %6, %shl, !dbg !3096
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3096
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3097
  %shr2 = lshr i32 %7, 7, !dbg !3099
  %cmp = icmp eq i32 %shr2, 0, !dbg !3100
  br i1 %cmp, label %if.then, label %if.else, !dbg !3101

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3102
  store i32 %8, i32* %retval, align 4, !dbg !3104
  br label %return, !dbg !3104

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3105
  br label %return, !dbg !3105

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3107
  ret i32 %9, !dbg !3107
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3108 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3111, metadata !DIExpression()), !dbg !3112
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3113, metadata !DIExpression()), !dbg !3114
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3115, metadata !DIExpression()), !dbg !3116
  store i32 0, i32* %u32Temp1, align 4, !dbg !3116
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3117, metadata !DIExpression()), !dbg !3118
  store i32 0, i32* %u32Temp2, align 4, !dbg !3118
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3119
  %conv = sext i8 %0 to i32, !dbg !3119
  %cmp = icmp sgt i32 %conv, 0, !dbg !3121
  br i1 %cmp, label %if.then, label %if.else, !dbg !3122

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3123
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3125
  %conv2 = sext i8 %2 to i32, !dbg !3125
  %mul = mul i32 %1, %conv2, !dbg !3126
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3127
  %3 = load i32, i32* %value.addr, align 4, !dbg !3128
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3129
  %conv3 = sext i8 %4 to i32, !dbg !3129
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3130
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3131
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3132
  %shr = lshr i32 %5, 7, !dbg !3133
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3134
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3135
  %shl = shl i32 %6, 25, !dbg !3136
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3137
  %or = or i32 %7, %shl, !dbg !3137
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3137
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3138
  store i32 %8, i32* %retval, align 4, !dbg !3139
  br label %return, !dbg !3139

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3140
  br label %return, !dbg !3140

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3142
  ret i32 %9, !dbg !3142
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3143 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3144, metadata !DIExpression()), !dbg !3145
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3146, metadata !DIExpression()), !dbg !3147
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3148, metadata !DIExpression()), !dbg !3149
  store i32 0, i32* %u32Temp1, align 4, !dbg !3149
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3150, metadata !DIExpression()), !dbg !3151
  store i32 0, i32* %u32Temp2, align 4, !dbg !3151
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3152
  %conv = sext i8 %0 to i32, !dbg !3152
  %cmp = icmp sle i32 %conv, 0, !dbg !3154
  br i1 %cmp, label %if.then, label %if.else, !dbg !3155

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3156
  br label %return, !dbg !3156

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3158
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3160
  %conv2 = sext i8 %2 to i32, !dbg !3160
  %mul = mul i32 %1, %conv2, !dbg !3161
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3162
  %3 = load i32, i32* %value.addr, align 4, !dbg !3163
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3164
  %conv3 = sext i8 %4 to i32, !dbg !3164
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3165
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3166
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3167
  %shr = lshr i32 %5, 6, !dbg !3168
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3169
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3170
  %shl = shl i32 %6, 26, !dbg !3171
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3172
  %or = or i32 %7, %shl, !dbg !3172
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3172
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3173
  %shr4 = lshr i32 %8, 6, !dbg !3175
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3176
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3177

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3178
  store i32 %9, i32* %retval, align 4, !dbg !3180
  br label %return, !dbg !3180

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3181
  br label %return, !dbg !3181

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3183
  ret i32 %10, !dbg !3183
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3184 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3185, metadata !DIExpression()), !dbg !3186
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3187, metadata !DIExpression()), !dbg !3188
  %0 = load i16, i16* %value.addr, align 2, !dbg !3189
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3190
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3191
  ret i16 %call, !dbg !3192
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3193 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3194, metadata !DIExpression()), !dbg !3195
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3196, metadata !DIExpression()), !dbg !3197
  %0 = load i16, i16* %value.addr, align 2, !dbg !3198
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3199
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3200
  ret i16 %call, !dbg !3201
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3202 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3203, metadata !DIExpression()), !dbg !3204
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3205, metadata !DIExpression()), !dbg !3206
  %0 = load i16, i16* %value.addr, align 2, !dbg !3207
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3208
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3209
  ret i16 %call, !dbg !3210
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3211 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3212, metadata !DIExpression()), !dbg !3213
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3214, metadata !DIExpression()), !dbg !3215
  %0 = load i16, i16* %value.addr, align 2, !dbg !3216
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3217
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3218
  ret i16 %call, !dbg !3219
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3220 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3221, metadata !DIExpression()), !dbg !3222
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3223, metadata !DIExpression()), !dbg !3224
  %0 = load i16, i16* %value.addr, align 2, !dbg !3225
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3226
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3227
  ret i16 %call, !dbg !3228
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3229 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3230, metadata !DIExpression()), !dbg !3231
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3232, metadata !DIExpression()), !dbg !3233
  %0 = load i16, i16* %value.addr, align 2, !dbg !3234
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3235
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3236
  ret i16 %call, !dbg !3237
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3238 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3239, metadata !DIExpression()), !dbg !3240
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3241, metadata !DIExpression()), !dbg !3242
  %0 = load i16, i16* %value.addr, align 2, !dbg !3243
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3244
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3245
  ret i16 %call, !dbg !3246
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3247 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3248, metadata !DIExpression()), !dbg !3249
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3250, metadata !DIExpression()), !dbg !3251
  %0 = load i16, i16* %value.addr, align 2, !dbg !3252
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3253
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3254
  ret i16 %call, !dbg !3255
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3256 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3257, metadata !DIExpression()), !dbg !3258
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3259, metadata !DIExpression()), !dbg !3260
  %0 = load i16, i16* %value.addr, align 2, !dbg !3261
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3262
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3263
  ret i16 %call, !dbg !3264
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3265 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3266, metadata !DIExpression()), !dbg !3267
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3268, metadata !DIExpression()), !dbg !3269
  %0 = load i16, i16* %value.addr, align 2, !dbg !3270
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3271
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3272
  ret i16 %call, !dbg !3273
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3274 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3275, metadata !DIExpression()), !dbg !3276
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3277, metadata !DIExpression()), !dbg !3278
  %0 = load i16, i16* %value.addr, align 2, !dbg !3279
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3280
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3281
  ret i16 %call, !dbg !3282
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3283 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3284, metadata !DIExpression()), !dbg !3285
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3286, metadata !DIExpression()), !dbg !3287
  %0 = load i16, i16* %value.addr, align 2, !dbg !3288
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3289
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3290
  ret i16 %call, !dbg !3291
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3292 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3293, metadata !DIExpression()), !dbg !3294
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3295, metadata !DIExpression()), !dbg !3296
  %0 = load i16, i16* %value.addr, align 2, !dbg !3297
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3298
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3299
  ret i16 %call, !dbg !3300
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3301 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3302, metadata !DIExpression()), !dbg !3303
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3304, metadata !DIExpression()), !dbg !3305
  %0 = load i16, i16* %value.addr, align 2, !dbg !3306
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3307
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3308
  ret i16 %call, !dbg !3309
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3310 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3311, metadata !DIExpression()), !dbg !3312
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3313, metadata !DIExpression()), !dbg !3314
  %0 = load i16, i16* %value.addr, align 2, !dbg !3315
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3316
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3317
  ret i16 %call, !dbg !3318
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3319 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3320, metadata !DIExpression()), !dbg !3321
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3322, metadata !DIExpression()), !dbg !3323
  %0 = load i16, i16* %value.addr, align 2, !dbg !3324
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3325
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3326
  %2 = load i16, i16* %retval, align 2, !dbg !3327
  ret i16 %2, !dbg !3327
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3328 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3329, metadata !DIExpression()), !dbg !3330
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3331, metadata !DIExpression()), !dbg !3332
  %0 = load i16, i16* %value.addr, align 2, !dbg !3333
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3334
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3335
  ret i16 %call, !dbg !3336
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3337 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3338, metadata !DIExpression()), !dbg !3339
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3340, metadata !DIExpression()), !dbg !3341
  %0 = load i16, i16* %value.addr, align 2, !dbg !3342
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3343
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3344
  ret i16 %call, !dbg !3345
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3346 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3347, metadata !DIExpression()), !dbg !3348
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3349, metadata !DIExpression()), !dbg !3350
  %0 = load i16, i16* %value.addr, align 2, !dbg !3351
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3352
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3353
  ret i16 %call, !dbg !3354
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3355 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3356, metadata !DIExpression()), !dbg !3357
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3358, metadata !DIExpression()), !dbg !3359
  %0 = load i16, i16* %value.addr, align 2, !dbg !3360
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3361
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3362
  ret i16 %call, !dbg !3363
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3364 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3365, metadata !DIExpression()), !dbg !3366
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3367, metadata !DIExpression()), !dbg !3368
  %0 = load i16, i16* %value.addr, align 2, !dbg !3369
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3370
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3371
  ret i16 %call, !dbg !3372
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3373 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3374, metadata !DIExpression()), !dbg !3375
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3376, metadata !DIExpression()), !dbg !3377
  %0 = load i16, i16* %value.addr, align 2, !dbg !3378
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3379
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3380
  ret i16 %call, !dbg !3381
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3382 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3383, metadata !DIExpression()), !dbg !3384
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3385, metadata !DIExpression()), !dbg !3386
  %0 = load i16, i16* %value.addr, align 2, !dbg !3387
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3388
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3389
  ret i16 %call, !dbg !3390
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3391 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3392, metadata !DIExpression()), !dbg !3393
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3394, metadata !DIExpression()), !dbg !3395
  %0 = load i16, i16* %value.addr, align 2, !dbg !3396
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3397
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3398
  ret i16 %call, !dbg !3399
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3400 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3401, metadata !DIExpression()), !dbg !3402
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3403, metadata !DIExpression()), !dbg !3404
  %0 = load i16, i16* %value.addr, align 2, !dbg !3405
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3406
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3407
  ret i16 %call, !dbg !3408
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3409 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3410, metadata !DIExpression()), !dbg !3411
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3412, metadata !DIExpression()), !dbg !3413
  %0 = load i16, i16* %value.addr, align 2, !dbg !3414
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3415
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3416
  ret i16 %call, !dbg !3417
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3418 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3419, metadata !DIExpression()), !dbg !3420
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3421, metadata !DIExpression()), !dbg !3422
  %0 = load i16, i16* %value.addr, align 2, !dbg !3423
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3424
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3425
  ret i16 %call, !dbg !3426
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3427 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3428, metadata !DIExpression()), !dbg !3429
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3430, metadata !DIExpression()), !dbg !3431
  %0 = load i16, i16* %value.addr, align 2, !dbg !3432
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3433
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3434
  ret i16 %call, !dbg !3435
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3436 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3437, metadata !DIExpression()), !dbg !3438
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3439, metadata !DIExpression()), !dbg !3440
  %0 = load i16, i16* %value.addr, align 2, !dbg !3441
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3442
  %conv = zext i8 %1 to i16, !dbg !3443
  %conv1 = zext i16 %conv to i32, !dbg !3443
  %shl = shl i32 %conv1, 5, !dbg !3444
  %conv2 = trunc i32 %shl to i16, !dbg !3445
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3446
  ret i16 %call, !dbg !3447
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3448 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3449, metadata !DIExpression()), !dbg !3450
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3451, metadata !DIExpression()), !dbg !3452
  %0 = load i16, i16* %value.addr, align 2, !dbg !3453
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3454
  %conv = zext i8 %1 to i16, !dbg !3455
  %conv1 = zext i16 %conv to i32, !dbg !3455
  %shl = shl i32 %conv1, 6, !dbg !3456
  %conv2 = trunc i32 %shl to i16, !dbg !3457
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3458
  ret i16 %call, !dbg !3459
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3460 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3461, metadata !DIExpression()), !dbg !3462
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3463, metadata !DIExpression()), !dbg !3464
  %0 = load i16, i16* %value.addr, align 2, !dbg !3465
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3466
  %conv = zext i8 %1 to i16, !dbg !3467
  %conv1 = zext i16 %conv to i32, !dbg !3467
  %shl = shl i32 %conv1, 7, !dbg !3468
  %conv2 = trunc i32 %shl to i16, !dbg !3469
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3470
  ret i16 %call, !dbg !3471
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3472 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3473, metadata !DIExpression()), !dbg !3474
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3475, metadata !DIExpression()), !dbg !3476
  %0 = load i16, i16* %value.addr, align 2, !dbg !3477
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3478
  %conv = zext i8 %1 to i16, !dbg !3479
  %conv1 = zext i16 %conv to i32, !dbg !3479
  %shl = shl i32 %conv1, 7, !dbg !3480
  %conv2 = trunc i32 %shl to i16, !dbg !3481
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3482
  ret i16 %call, !dbg !3483
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3484 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3485, metadata !DIExpression()), !dbg !3486
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3487, metadata !DIExpression()), !dbg !3488
  %0 = load i16, i16* %value.addr, align 2, !dbg !3489
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3490
  %conv = zext i8 %1 to i16, !dbg !3491
  %conv1 = zext i16 %conv to i32, !dbg !3491
  %shl = shl i32 %conv1, 4, !dbg !3492
  %conv2 = trunc i32 %shl to i16, !dbg !3493
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3494
  ret i16 %call, !dbg !3495
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3496 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3497, metadata !DIExpression()), !dbg !3498
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3499, metadata !DIExpression()), !dbg !3500
  %0 = load i16, i16* %value.addr, align 2, !dbg !3501
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3502
  %conv = zext i8 %1 to i16, !dbg !3503
  %conv1 = zext i16 %conv to i32, !dbg !3503
  %shl = shl i32 %conv1, 5, !dbg !3504
  %conv2 = trunc i32 %shl to i16, !dbg !3505
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3506
  ret i16 %call, !dbg !3507
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3508 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3509, metadata !DIExpression()), !dbg !3510
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3511, metadata !DIExpression()), !dbg !3512
  %0 = load i16, i16* %value.addr, align 2, !dbg !3513
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3514
  %conv = zext i8 %1 to i16, !dbg !3515
  %conv1 = zext i16 %conv to i32, !dbg !3515
  %shl = shl i32 %conv1, 2, !dbg !3516
  %conv2 = trunc i32 %shl to i16, !dbg !3517
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3518
  ret i16 %call, !dbg !3519
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3520 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3521, metadata !DIExpression()), !dbg !3522
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3523, metadata !DIExpression()), !dbg !3524
  %0 = load i16, i16* %value.addr, align 2, !dbg !3525
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3526
  %conv = zext i8 %1 to i16, !dbg !3527
  %conv1 = zext i16 %conv to i32, !dbg !3527
  %shl = shl i32 %conv1, 6, !dbg !3528
  %conv2 = trunc i32 %shl to i16, !dbg !3529
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3530
  ret i16 %call, !dbg !3531
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3532 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3533, metadata !DIExpression()), !dbg !3534
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3535, metadata !DIExpression()), !dbg !3536
  %0 = load i16, i16* %value.addr, align 2, !dbg !3537
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3538
  %conv = zext i8 %1 to i16, !dbg !3539
  %conv1 = zext i16 %conv to i32, !dbg !3539
  %shl = shl i32 %conv1, 3, !dbg !3540
  %conv2 = trunc i32 %shl to i16, !dbg !3541
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3542
  ret i16 %call, !dbg !3543
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3544 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3545, metadata !DIExpression()), !dbg !3546
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3547, metadata !DIExpression()), !dbg !3548
  %0 = load i32, i32* %value.addr, align 4, !dbg !3549
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3550
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3551
  ret i32 %call, !dbg !3552
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3553 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3556, metadata !DIExpression()), !dbg !3557
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3558, metadata !DIExpression()), !dbg !3559
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3560, metadata !DIExpression()), !dbg !3561
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3562, metadata !DIExpression()), !dbg !3563
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3564, metadata !DIExpression()), !dbg !3565
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3566, metadata !DIExpression()), !dbg !3567
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3568, metadata !DIExpression()), !dbg !3569
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3570, metadata !DIExpression()), !dbg !3571
  %0 = load i32, i32* %value.addr, align 4, !dbg !3572
  %cmp = icmp slt i32 %0, 0, !dbg !3574
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3575

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3576
  %conv = sext i16 %1 to i32, !dbg !3576
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3577
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3578

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3579
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3580
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3581

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3582
  %conv6 = sext i16 %3 to i32, !dbg !3582
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3583
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3584

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3585
  br label %if.end, !dbg !3587

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3588
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3590
  %cmp9 = icmp slt i32 %4, 0, !dbg !3592
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3593

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3594
  %sub = sub nsw i32 0, %5, !dbg !3596
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3597
  br label %if.end13, !dbg !3598

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3599
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3601
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3602
  %conv14 = sext i16 %7 to i32, !dbg !3602
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3604
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3605

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3606
  %conv18 = sext i16 %8 to i32, !dbg !3606
  %sub19 = sub nsw i32 0, %conv18, !dbg !3608
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3609
  br label %if.end22, !dbg !3610

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3611
  %conv21 = sext i16 %9 to i32, !dbg !3611
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3613
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3614
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3615
  %mul = mul i32 %10, %11, !dbg !3616
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3617
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3618
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3619
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3620
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3621
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3622
  %15 = load i32, i32* %count.addr, align 4, !dbg !3623
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3624
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3624
  %shr = lshr i32 %14, %15, !dbg !3624, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3625
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3626
  %17 = load i32, i32* %count.addr, align 4, !dbg !3627
  %sub23 = sub i32 32, %17, !dbg !3628
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3629
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3629
  %shl = shl i32 %16, %sub23, !dbg !3629, !klee.check.shift !259
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3630
  %or = or i32 %18, %shl, !dbg !3630
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3630
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3631
  %20 = load i32, i32* %count.addr, align 4, !dbg !3633
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3634
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3634
  %shr24 = lshr i32 %19, %20, !dbg !3634, !klee.check.shift !259
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3635
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3636

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3637
  %conv28 = zext i8 %21 to i32, !dbg !3637
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3640
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3641

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3642
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3645
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3646

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3647
  store i32 %23, i32* %retval, align 4, !dbg !3648
  br label %return, !dbg !3648

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3649
  br label %return, !dbg !3649

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3650
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3653
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3654

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3655
  %sub40 = sub i32 0, %25, !dbg !3656
  store i32 %sub40, i32* %retval, align 4, !dbg !3657
  br label %return, !dbg !3657

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3658
  br label %return, !dbg !3658

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3659
  br label %return, !dbg !3659

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3661
  ret i32 %26, !dbg !3661
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3662 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3663, metadata !DIExpression()), !dbg !3664
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3665, metadata !DIExpression()), !dbg !3666
  %0 = load i32, i32* %value.addr, align 4, !dbg !3667
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3668
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3669
  ret i32 %call, !dbg !3670
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3671 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3674, metadata !DIExpression()), !dbg !3675
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3676, metadata !DIExpression()), !dbg !3677
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3678, metadata !DIExpression()), !dbg !3679
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3680, metadata !DIExpression()), !dbg !3681
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3682, metadata !DIExpression()), !dbg !3683
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3684, metadata !DIExpression()), !dbg !3685
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3686, metadata !DIExpression()), !dbg !3687
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3688, metadata !DIExpression()), !dbg !3689
  %0 = load i32, i32* %value.addr, align 4, !dbg !3690
  %cmp = icmp slt i32 %0, 0, !dbg !3692
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3693

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3694
  %conv = sext i8 %1 to i32, !dbg !3694
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3695
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3696

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3697
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3698
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3699

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3700
  %conv6 = sext i8 %3 to i32, !dbg !3700
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3701
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3702

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3703
  br label %if.end, !dbg !3705

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3706
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3708
  %cmp9 = icmp slt i32 %4, 0, !dbg !3710
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3711

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3712
  %sub = sub nsw i32 0, %5, !dbg !3714
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3715
  br label %if.end13, !dbg !3716

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3717
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3719
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3720
  %conv14 = sext i8 %7 to i32, !dbg !3720
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3722
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3723

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3724
  %conv18 = sext i8 %8 to i32, !dbg !3724
  %sub19 = sub nsw i32 0, %conv18, !dbg !3726
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3727
  br label %if.end22, !dbg !3728

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3729
  %conv21 = sext i8 %9 to i32, !dbg !3729
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3731
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3732
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3733
  %mul = mul i32 %10, %11, !dbg !3734
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3735
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3736
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3737
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3738
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3739
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3740
  %15 = load i32, i32* %count.addr, align 4, !dbg !3741
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3742
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3742
  %shr = lshr i32 %14, %15, !dbg !3742, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3743
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3744
  %17 = load i32, i32* %count.addr, align 4, !dbg !3745
  %sub23 = sub i32 32, %17, !dbg !3746
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3747
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3747
  %shl = shl i32 %16, %sub23, !dbg !3747, !klee.check.shift !259
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3748
  %or = or i32 %18, %shl, !dbg !3748
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3748
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3749
  %20 = load i32, i32* %count.addr, align 4, !dbg !3751
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3752
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3752
  %shr24 = lshr i32 %19, %20, !dbg !3752, !klee.check.shift !259
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3753
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3754

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3755
  %conv28 = zext i8 %21 to i32, !dbg !3755
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3758
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3759

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3760
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3763
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3764

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3765
  store i32 %23, i32* %retval, align 4, !dbg !3766
  br label %return, !dbg !3766

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3767
  br label %return, !dbg !3767

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3768
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3771
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3772

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3773
  %sub40 = sub i32 0, %25, !dbg !3774
  store i32 %sub40, i32* %retval, align 4, !dbg !3775
  br label %return, !dbg !3775

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3776
  br label %return, !dbg !3776

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3777
  br label %return, !dbg !3777

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3779
  ret i32 %26, !dbg !3779
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3780 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3781, metadata !DIExpression()), !dbg !3782
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3783, metadata !DIExpression()), !dbg !3784
  %0 = load i32, i32* %value.addr, align 4, !dbg !3785
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3786
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3787
  ret i32 %call, !dbg !3788
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3789 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3792, metadata !DIExpression()), !dbg !3793
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3794, metadata !DIExpression()), !dbg !3795
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3796, metadata !DIExpression()), !dbg !3797
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3798, metadata !DIExpression()), !dbg !3799
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3800, metadata !DIExpression()), !dbg !3801
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3802, metadata !DIExpression()), !dbg !3803
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3804, metadata !DIExpression()), !dbg !3805
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3806, metadata !DIExpression()), !dbg !3807
  %0 = load i32, i32* %value.addr, align 4, !dbg !3808
  %cmp = icmp slt i32 %0, 0, !dbg !3810
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3811

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3812
  %conv = zext i16 %1 to i32, !dbg !3812
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3813
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3814

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3815
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3816
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3817

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3818
  %conv6 = zext i16 %3 to i32, !dbg !3818
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3819
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3820

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3821
  br label %if.end, !dbg !3823

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3824
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3826
  %cmp9 = icmp slt i32 %4, 0, !dbg !3828
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3829

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3830
  %sub = sub nsw i32 0, %5, !dbg !3832
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3833
  br label %if.end13, !dbg !3834

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3835
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3837
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3838
  %conv14 = zext i16 %7 to i32, !dbg !3838
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3840
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3841

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3842
  %conv18 = zext i16 %8 to i32, !dbg !3842
  %sub19 = sub nsw i32 0, %conv18, !dbg !3844
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3845
  br label %if.end22, !dbg !3846

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3847
  %conv21 = zext i16 %9 to i32, !dbg !3847
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3849
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3850
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3851
  %mul = mul i32 %10, %11, !dbg !3852
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3853
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3854
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3855
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3856
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3857
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3858
  %15 = load i32, i32* %count.addr, align 4, !dbg !3859
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3860
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3860
  %shr = lshr i32 %14, %15, !dbg !3860, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3861
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3862
  %17 = load i32, i32* %count.addr, align 4, !dbg !3863
  %sub23 = sub i32 32, %17, !dbg !3864
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3865
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3865
  %shl = shl i32 %16, %sub23, !dbg !3865, !klee.check.shift !259
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3866
  %or = or i32 %18, %shl, !dbg !3866
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3866
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3867
  %20 = load i32, i32* %count.addr, align 4, !dbg !3869
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3870
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3870
  %shr24 = lshr i32 %19, %20, !dbg !3870, !klee.check.shift !259
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3871
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3872

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3873
  %conv28 = zext i8 %21 to i32, !dbg !3873
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3876
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3877

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3878
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3881
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3882

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3883
  store i32 %23, i32* %retval, align 4, !dbg !3884
  br label %return, !dbg !3884

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3885
  br label %return, !dbg !3885

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3886
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3889
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3890

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3891
  %sub40 = sub i32 0, %25, !dbg !3892
  store i32 %sub40, i32* %retval, align 4, !dbg !3893
  br label %return, !dbg !3893

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3894
  br label %return, !dbg !3894

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3895
  br label %return, !dbg !3895

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3897
  ret i32 %26, !dbg !3897
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3898 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3899, metadata !DIExpression()), !dbg !3900
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3901, metadata !DIExpression()), !dbg !3902
  %0 = load i32, i32* %value.addr, align 4, !dbg !3903
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3904
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3905
  ret i32 %call, !dbg !3906
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3907 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3910, metadata !DIExpression()), !dbg !3911
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3912, metadata !DIExpression()), !dbg !3913
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3914, metadata !DIExpression()), !dbg !3915
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3916, metadata !DIExpression()), !dbg !3917
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3918, metadata !DIExpression()), !dbg !3919
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3920, metadata !DIExpression()), !dbg !3921
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3922, metadata !DIExpression()), !dbg !3923
  %0 = load i32, i32* %value.addr, align 4, !dbg !3924
  %cmp = icmp slt i32 %0, 0, !dbg !3926
  br i1 %cmp, label %if.then, label %if.else, !dbg !3927

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3928
  %1 = load i32, i32* %value.addr, align 4, !dbg !3930
  %sub = sub nsw i32 0, %1, !dbg !3931
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3932
  br label %if.end, !dbg !3933

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3934
  %2 = load i32, i32* %value.addr, align 4, !dbg !3936
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3937
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3938
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3939
  %conv = zext i8 %4 to i32, !dbg !3939
  %mul = mul i32 %3, %conv, !dbg !3940
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3941
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3942
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3943
  %conv1 = zext i8 %6 to i32, !dbg !3943
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3944
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3945
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3946
  %8 = load i32, i32* %count.addr, align 4, !dbg !3947
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3948
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3948
  %shr = lshr i32 %7, %8, !dbg !3948, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3949
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3950
  %10 = load i32, i32* %count.addr, align 4, !dbg !3951
  %sub2 = sub i32 32, %10, !dbg !3952
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3953
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3953
  %shl = shl i32 %9, %sub2, !dbg !3953, !klee.check.shift !259
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3954
  %or = or i32 %11, %shl, !dbg !3954
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3954
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3955
  %13 = load i32, i32* %count.addr, align 4, !dbg !3957
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3958
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3958
  %shr3 = lshr i32 %12, %13, !dbg !3958, !klee.check.shift !259
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3959
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3960

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3961
  %conv7 = zext i8 %14 to i32, !dbg !3961
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3964
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3965

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3966
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3969
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3970

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3971
  store i32 %16, i32* %retval, align 4, !dbg !3972
  br label %return, !dbg !3972

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3973
  br label %return, !dbg !3973

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3974
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3977
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3978

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3979
  %sub19 = sub i32 0, %18, !dbg !3981
  store i32 %sub19, i32* %retval, align 4, !dbg !3982
  br label %return, !dbg !3982

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3983
  br label %return, !dbg !3983

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3985
  %conv22 = zext i8 %19 to i32, !dbg !3985
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3988
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3989

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3990
  br label %return, !dbg !3990

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3992
  br label %return, !dbg !3992

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3994
  ret i32 %20, !dbg !3994
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3995 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3996, metadata !DIExpression()), !dbg !3997
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3998, metadata !DIExpression()), !dbg !3999
  %0 = load i8, i8* %value.addr, align 1, !dbg !4000
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4001
  %conv = zext i8 %1 to i16, !dbg !4002
  %conv1 = zext i16 %conv to i32, !dbg !4002
  %shl = shl i32 %conv1, 5, !dbg !4003
  %conv2 = trunc i32 %shl to i16, !dbg !4004
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4005
  ret i8 %call, !dbg !4006
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4007 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4008, metadata !DIExpression()), !dbg !4009
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4010, metadata !DIExpression()), !dbg !4011
  %0 = load i8, i8* %value.addr, align 1, !dbg !4012
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4013
  %conv = zext i8 %1 to i16, !dbg !4014
  %conv1 = zext i16 %conv to i32, !dbg !4014
  %shl = shl i32 %conv1, 6, !dbg !4015
  %conv2 = trunc i32 %shl to i16, !dbg !4016
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4017
  ret i8 %call, !dbg !4018
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4019 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4020, metadata !DIExpression()), !dbg !4021
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4022, metadata !DIExpression()), !dbg !4023
  %0 = load i8, i8* %value.addr, align 1, !dbg !4024
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4025
  %conv = zext i8 %1 to i16, !dbg !4026
  %conv1 = zext i16 %conv to i32, !dbg !4026
  %shl = shl i32 %conv1, 7, !dbg !4027
  %conv2 = trunc i32 %shl to i16, !dbg !4028
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4029
  ret i8 %call, !dbg !4030
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4031 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4032, metadata !DIExpression()), !dbg !4033
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4034, metadata !DIExpression()), !dbg !4035
  %0 = load i8, i8* %value.addr, align 1, !dbg !4036
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4037
  %conv = zext i8 %1 to i16, !dbg !4038
  %conv1 = zext i16 %conv to i32, !dbg !4038
  %shl = shl i32 %conv1, 7, !dbg !4039
  %conv2 = trunc i32 %shl to i16, !dbg !4040
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4041
  ret i8 %call, !dbg !4042
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4043 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4044, metadata !DIExpression()), !dbg !4045
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4046, metadata !DIExpression()), !dbg !4047
  %0 = load i8, i8* %value.addr, align 1, !dbg !4048
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4049
  %conv = zext i8 %1 to i16, !dbg !4050
  %conv1 = zext i16 %conv to i32, !dbg !4050
  %shl = shl i32 %conv1, 4, !dbg !4051
  %conv2 = trunc i32 %shl to i16, !dbg !4052
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4053
  ret i8 %call, !dbg !4054
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4055 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4056, metadata !DIExpression()), !dbg !4057
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4058, metadata !DIExpression()), !dbg !4059
  %0 = load i8, i8* %value.addr, align 1, !dbg !4060
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4061
  %conv = zext i8 %1 to i16, !dbg !4062
  %conv1 = zext i16 %conv to i32, !dbg !4062
  %shl = shl i32 %conv1, 5, !dbg !4063
  %conv2 = trunc i32 %shl to i16, !dbg !4064
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4065
  ret i8 %call, !dbg !4066
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4067 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4068, metadata !DIExpression()), !dbg !4069
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4070, metadata !DIExpression()), !dbg !4071
  %0 = load i8, i8* %value.addr, align 1, !dbg !4072
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4073
  %conv = zext i8 %1 to i16, !dbg !4074
  %conv1 = zext i16 %conv to i32, !dbg !4074
  %shl = shl i32 %conv1, 2, !dbg !4075
  %conv2 = trunc i32 %shl to i16, !dbg !4076
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4077
  ret i8 %call, !dbg !4078
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4079 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4080, metadata !DIExpression()), !dbg !4081
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4082, metadata !DIExpression()), !dbg !4083
  %0 = load i8, i8* %value.addr, align 1, !dbg !4084
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4085
  %conv = zext i8 %1 to i16, !dbg !4086
  %conv1 = zext i16 %conv to i32, !dbg !4086
  %shl = shl i32 %conv1, 6, !dbg !4087
  %conv2 = trunc i32 %shl to i16, !dbg !4088
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4089
  ret i8 %call, !dbg !4090
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4091 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4092, metadata !DIExpression()), !dbg !4093
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4094, metadata !DIExpression()), !dbg !4095
  %0 = load i8, i8* %value.addr, align 1, !dbg !4096
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4097
  %conv = zext i8 %1 to i16, !dbg !4098
  %conv1 = zext i16 %conv to i32, !dbg !4098
  %shl = shl i32 %conv1, 3, !dbg !4099
  %conv2 = trunc i32 %shl to i16, !dbg !4100
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4101
  ret i8 %call, !dbg !4102
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4103 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4104, metadata !DIExpression()), !dbg !4105
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4106, metadata !DIExpression()), !dbg !4107
  %0 = load i16, i16* %value.addr, align 2, !dbg !4108
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4109
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4110
  ret i16 %call, !dbg !4111
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4112 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4113, metadata !DIExpression()), !dbg !4114
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4115, metadata !DIExpression()), !dbg !4116
  %0 = load i16, i16* %value.addr, align 2, !dbg !4117
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4118
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4119
  ret i16 %call, !dbg !4120
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4121 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4122, metadata !DIExpression()), !dbg !4123
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4124, metadata !DIExpression()), !dbg !4125
  %0 = load i16, i16* %value.addr, align 2, !dbg !4126
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4127
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4128
  ret i16 %call, !dbg !4129
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4130 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4131, metadata !DIExpression()), !dbg !4132
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4133, metadata !DIExpression()), !dbg !4134
  %0 = load i16, i16* %value.addr, align 2, !dbg !4135
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4136
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4137
  ret i16 %call, !dbg !4138
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4139 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4140, metadata !DIExpression()), !dbg !4141
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4142, metadata !DIExpression()), !dbg !4143
  %0 = load i16, i16* %value.addr, align 2, !dbg !4144
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4145
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4146
  ret i16 %call, !dbg !4147
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4148 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4149, metadata !DIExpression()), !dbg !4150
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4151, metadata !DIExpression()), !dbg !4152
  %0 = load i16, i16* %value.addr, align 2, !dbg !4153
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4154
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4155
  ret i16 %call, !dbg !4156
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4157 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4158, metadata !DIExpression()), !dbg !4159
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4160, metadata !DIExpression()), !dbg !4161
  %0 = load i16, i16* %value.addr, align 2, !dbg !4162
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4163
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4164
  ret i16 %call, !dbg !4165
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4166 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4167, metadata !DIExpression()), !dbg !4168
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4169, metadata !DIExpression()), !dbg !4170
  %0 = load i16, i16* %value.addr, align 2, !dbg !4171
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4172
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4173
  ret i16 %call, !dbg !4174
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4175 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4176, metadata !DIExpression()), !dbg !4177
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4178, metadata !DIExpression()), !dbg !4179
  %0 = load i16, i16* %value.addr, align 2, !dbg !4180
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4181
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4182
  ret i16 %call, !dbg !4183
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4184 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4185, metadata !DIExpression()), !dbg !4186
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4187, metadata !DIExpression()), !dbg !4188
  %0 = load i16, i16* %value.addr, align 2, !dbg !4189
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4190
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4191
  ret i16 %call, !dbg !4192
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4193 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4194, metadata !DIExpression()), !dbg !4195
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4196, metadata !DIExpression()), !dbg !4197
  %0 = load i16, i16* %value.addr, align 2, !dbg !4198
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4199
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4200
  ret i16 %call, !dbg !4201
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4202 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4203, metadata !DIExpression()), !dbg !4204
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4205, metadata !DIExpression()), !dbg !4206
  %0 = load i16, i16* %value.addr, align 2, !dbg !4207
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4208
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4209
  ret i16 %call, !dbg !4210
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4211 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4212, metadata !DIExpression()), !dbg !4213
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4214, metadata !DIExpression()), !dbg !4215
  %0 = load i16, i16* %value.addr, align 2, !dbg !4216
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4217
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4218
  ret i16 %call, !dbg !4219
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4220 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4221, metadata !DIExpression()), !dbg !4222
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4223, metadata !DIExpression()), !dbg !4224
  %0 = load i16, i16* %value.addr, align 2, !dbg !4225
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4226
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4227
  ret i16 %call, !dbg !4228
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4229 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4230, metadata !DIExpression()), !dbg !4231
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4232, metadata !DIExpression()), !dbg !4233
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4234
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4235
  %conv = zext i8 %1 to i16, !dbg !4236
  %conv1 = zext i16 %conv to i32, !dbg !4236
  %shl = shl i32 %conv1, 5, !dbg !4237
  %conv2 = trunc i32 %shl to i16, !dbg !4238
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4239
  ret i16 %call, !dbg !4240
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4241 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4242, metadata !DIExpression()), !dbg !4243
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4244, metadata !DIExpression()), !dbg !4245
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4246
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4247
  %conv = zext i8 %1 to i16, !dbg !4248
  %conv1 = zext i16 %conv to i32, !dbg !4248
  %shl = shl i32 %conv1, 6, !dbg !4249
  %conv2 = trunc i32 %shl to i16, !dbg !4250
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4251
  ret i16 %call, !dbg !4252
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4253 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4254, metadata !DIExpression()), !dbg !4255
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4256, metadata !DIExpression()), !dbg !4257
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4258
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4259
  %conv = zext i8 %1 to i16, !dbg !4260
  %conv1 = zext i16 %conv to i32, !dbg !4260
  %shl = shl i32 %conv1, 7, !dbg !4261
  %conv2 = trunc i32 %shl to i16, !dbg !4262
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4263
  ret i16 %call, !dbg !4264
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4265 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4266, metadata !DIExpression()), !dbg !4267
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4268, metadata !DIExpression()), !dbg !4269
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4270
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4271
  %conv = zext i8 %1 to i16, !dbg !4272
  %conv1 = zext i16 %conv to i32, !dbg !4272
  %shl = shl i32 %conv1, 7, !dbg !4273
  %conv2 = trunc i32 %shl to i16, !dbg !4274
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4275
  ret i16 %call, !dbg !4276
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4277 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4278, metadata !DIExpression()), !dbg !4279
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4280, metadata !DIExpression()), !dbg !4281
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4282
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4283
  %conv = zext i8 %1 to i16, !dbg !4284
  %conv1 = zext i16 %conv to i32, !dbg !4284
  %shl = shl i32 %conv1, 4, !dbg !4285
  %conv2 = trunc i32 %shl to i16, !dbg !4286
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4287
  ret i16 %call, !dbg !4288
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4289 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4290, metadata !DIExpression()), !dbg !4291
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4292, metadata !DIExpression()), !dbg !4293
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4294
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4295
  %conv = zext i8 %1 to i16, !dbg !4296
  %conv1 = zext i16 %conv to i32, !dbg !4296
  %shl = shl i32 %conv1, 5, !dbg !4297
  %conv2 = trunc i32 %shl to i16, !dbg !4298
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4299
  ret i16 %call, !dbg !4300
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4301 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4302, metadata !DIExpression()), !dbg !4303
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4304, metadata !DIExpression()), !dbg !4305
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4306
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4307
  %conv = zext i8 %1 to i16, !dbg !4308
  %conv1 = zext i16 %conv to i32, !dbg !4308
  %shl = shl i32 %conv1, 2, !dbg !4309
  %conv2 = trunc i32 %shl to i16, !dbg !4310
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4311
  ret i16 %call, !dbg !4312
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4313 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4314, metadata !DIExpression()), !dbg !4315
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4316, metadata !DIExpression()), !dbg !4317
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4318
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4319
  %conv = zext i8 %1 to i16, !dbg !4320
  %conv1 = zext i16 %conv to i32, !dbg !4320
  %shl = shl i32 %conv1, 6, !dbg !4321
  %conv2 = trunc i32 %shl to i16, !dbg !4322
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4323
  ret i16 %call, !dbg !4324
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4325 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4326, metadata !DIExpression()), !dbg !4327
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4328, metadata !DIExpression()), !dbg !4329
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4330
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4331
  %conv = zext i8 %1 to i16, !dbg !4332
  %conv1 = zext i16 %conv to i32, !dbg !4332
  %shl = shl i32 %conv1, 3, !dbg !4333
  %conv2 = trunc i32 %shl to i16, !dbg !4334
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4335
  ret i16 %call, !dbg !4336
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4337 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4338, metadata !DIExpression()), !dbg !4339
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4340, metadata !DIExpression()), !dbg !4341
  %0 = load i32, i32* %value.addr, align 4, !dbg !4342
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4343
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4344
  ret i32 %call, !dbg !4345
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4346 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4349, metadata !DIExpression()), !dbg !4350
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4351, metadata !DIExpression()), !dbg !4352
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4353, metadata !DIExpression()), !dbg !4354
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4355, metadata !DIExpression()), !dbg !4356
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4357, metadata !DIExpression()), !dbg !4358
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4359, metadata !DIExpression()), !dbg !4360
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4361, metadata !DIExpression()), !dbg !4362
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4363
  %conv = sext i16 %0 to i32, !dbg !4363
  %cmp = icmp slt i32 %conv, 0, !dbg !4365
  br i1 %cmp, label %if.then, label %if.else, !dbg !4366

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4367
  br label %if.end, !dbg !4369

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4370
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4372
  %conv2 = sext i16 %1 to i32, !dbg !4372
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4374
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4375

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4376
  %conv6 = sext i16 %2 to i32, !dbg !4376
  %sub = sub nsw i32 0, %conv6, !dbg !4378
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4379
  br label %if.end9, !dbg !4380

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4381
  %conv8 = sext i16 %3 to i32, !dbg !4381
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4383
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4384
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4385
  %mul = mul i32 %4, %5, !dbg !4386
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4387
  %6 = load i32, i32* %value.addr, align 4, !dbg !4388
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4389
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4390
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4391
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4392
  %9 = load i32, i32* %count.addr, align 4, !dbg !4393
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4394
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4394
  %shr = lshr i32 %8, %9, !dbg !4394, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4395
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4396
  %11 = load i32, i32* %count.addr, align 4, !dbg !4397
  %sub10 = sub i32 32, %11, !dbg !4398
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4399
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4399
  %shl = shl i32 %10, %sub10, !dbg !4399, !klee.check.shift !259
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4400
  %or = or i32 %12, %shl, !dbg !4400
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4400
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4401
  %14 = load i32, i32* %count.addr, align 4, !dbg !4403
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4404
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4404
  %shr11 = lshr i32 %13, %14, !dbg !4404, !klee.check.shift !259
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4405
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4406

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4407
  %conv15 = zext i8 %15 to i32, !dbg !4407
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4410
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4411

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4412
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4415
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4416

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4417
  store i32 %17, i32* %retval, align 4, !dbg !4418
  br label %return, !dbg !4418

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4419
  br label %return, !dbg !4419

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4420
  br label %return, !dbg !4420

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4422
  br label %return, !dbg !4422

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4424
  ret i32 %18, !dbg !4424
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4425 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4426, metadata !DIExpression()), !dbg !4427
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4428, metadata !DIExpression()), !dbg !4429
  %0 = load i32, i32* %value.addr, align 4, !dbg !4430
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4431
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4432
  ret i32 %call, !dbg !4433
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4434 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4437, metadata !DIExpression()), !dbg !4438
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4439, metadata !DIExpression()), !dbg !4440
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4441, metadata !DIExpression()), !dbg !4442
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4443, metadata !DIExpression()), !dbg !4444
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4445, metadata !DIExpression()), !dbg !4446
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4447, metadata !DIExpression()), !dbg !4448
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4449
  %cmp = icmp slt i32 %0, 0, !dbg !4451
  br i1 %cmp, label %if.then, label %if.else, !dbg !4452

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4453
  br label %if.end, !dbg !4455

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4456
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4458
  %cmp1 = icmp slt i32 %1, 0, !dbg !4460
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4461

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4462
  %sub = sub nsw i32 0, %2, !dbg !4464
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4465
  br label %if.end4, !dbg !4466

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4467
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4469
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4470
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4471
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4472
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4473
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4474
  %7 = load i32, i32* %count.addr, align 4, !dbg !4475
  %sub5 = sub i32 %7, 32, !dbg !4476
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4477
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4477
  %shr = lshr i32 %6, %sub5, !dbg !4477, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4478
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4479
  %conv = zext i8 %8 to i32, !dbg !4479
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4481
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4482

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4483
  store i32 %9, i32* %retval, align 4, !dbg !4485
  br label %return, !dbg !4485

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4486
  br label %return, !dbg !4486

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4488
  ret i32 %10, !dbg !4488
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4489 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4490, metadata !DIExpression()), !dbg !4491
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4492, metadata !DIExpression()), !dbg !4493
  %0 = load i32, i32* %value.addr, align 4, !dbg !4494
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4495
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4496
  ret i32 %call, !dbg !4497
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4498 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4501, metadata !DIExpression()), !dbg !4502
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4503, metadata !DIExpression()), !dbg !4504
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4505, metadata !DIExpression()), !dbg !4506
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4507, metadata !DIExpression()), !dbg !4508
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4509, metadata !DIExpression()), !dbg !4510
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4511, metadata !DIExpression()), !dbg !4512
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4513, metadata !DIExpression()), !dbg !4514
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4515
  %conv = sext i8 %0 to i32, !dbg !4515
  %cmp = icmp slt i32 %conv, 0, !dbg !4517
  br i1 %cmp, label %if.then, label %if.else, !dbg !4518

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4519
  br label %if.end, !dbg !4521

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4522
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4524
  %conv2 = sext i8 %1 to i32, !dbg !4524
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4526
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4527

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4528
  %conv6 = sext i8 %2 to i32, !dbg !4528
  %sub = sub nsw i32 0, %conv6, !dbg !4530
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4531
  br label %if.end9, !dbg !4532

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4533
  %conv8 = sext i8 %3 to i32, !dbg !4533
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4535
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4536
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4537
  %mul = mul i32 %4, %5, !dbg !4538
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4539
  %6 = load i32, i32* %value.addr, align 4, !dbg !4540
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4541
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4542
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4543
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4544
  %9 = load i32, i32* %count.addr, align 4, !dbg !4545
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4546
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4546
  %shr = lshr i32 %8, %9, !dbg !4546, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4547
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4548
  %11 = load i32, i32* %count.addr, align 4, !dbg !4549
  %sub10 = sub i32 32, %11, !dbg !4550
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4551
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4551
  %shl = shl i32 %10, %sub10, !dbg !4551, !klee.check.shift !259
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4552
  %or = or i32 %12, %shl, !dbg !4552
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4552
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4553
  %14 = load i32, i32* %count.addr, align 4, !dbg !4555
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4556
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4556
  %shr11 = lshr i32 %13, %14, !dbg !4556, !klee.check.shift !259
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4557
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4558

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4559
  %conv15 = zext i8 %15 to i32, !dbg !4559
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4562
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4563

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4564
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4567
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4568

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4569
  store i32 %17, i32* %retval, align 4, !dbg !4570
  br label %return, !dbg !4570

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4571
  br label %return, !dbg !4571

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4572
  br label %return, !dbg !4572

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4574
  br label %return, !dbg !4574

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4576
  ret i32 %18, !dbg !4576
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4577 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4578, metadata !DIExpression()), !dbg !4579
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4580, metadata !DIExpression()), !dbg !4581
  %0 = load i32, i32* %value.addr, align 4, !dbg !4582
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4583
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4584
  ret i32 %call, !dbg !4585
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4586 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4587, metadata !DIExpression()), !dbg !4588
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4589, metadata !DIExpression()), !dbg !4590
  %0 = load i32, i32* %value.addr, align 4, !dbg !4591
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4592
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4593
  ret i32 %call, !dbg !4594
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4595 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Temp4 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4598, metadata !DIExpression()), !dbg !4599
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4600, metadata !DIExpression()), !dbg !4601
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4602, metadata !DIExpression()), !dbg !4603
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4604, metadata !DIExpression()), !dbg !4605
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4606, metadata !DIExpression()), !dbg !4607
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4608, metadata !DIExpression()), !dbg !4609
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4610, metadata !DIExpression()), !dbg !4611
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4612, metadata !DIExpression()), !dbg !4613
  %0 = load i32, i32* %value.addr, align 4, !dbg !4614
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4615
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4616
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4617
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4618
  %3 = load i32, i32* %count.addr, align 4, !dbg !4619
  %sub = sub i32 %3, 32, !dbg !4620
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4621
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4621
  %shr = lshr i32 %2, %sub, !dbg !4621, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4622
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4623
  ret i32 %4, !dbg !4624
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4625 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4626, metadata !DIExpression()), !dbg !4627
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4628, metadata !DIExpression()), !dbg !4629
  %0 = load i32, i32* %value.addr, align 4, !dbg !4630
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4631
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4632
  ret i32 %call, !dbg !4633
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4634 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4637, metadata !DIExpression()), !dbg !4638
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4639, metadata !DIExpression()), !dbg !4640
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4641, metadata !DIExpression()), !dbg !4642
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4643, metadata !DIExpression()), !dbg !4644
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4645, metadata !DIExpression()), !dbg !4646
  %0 = load i32, i32* %value.addr, align 4, !dbg !4647
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4648
  %conv = zext i8 %1 to i32, !dbg !4648
  %mul = mul i32 %0, %conv, !dbg !4649
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4650
  %2 = load i32, i32* %value.addr, align 4, !dbg !4651
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4652
  %conv1 = zext i8 %3 to i32, !dbg !4652
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4653
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4654
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4655
  %5 = load i32, i32* %count.addr, align 4, !dbg !4656
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4657
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4657
  %shr = lshr i32 %4, %5, !dbg !4657, !klee.check.shift !259
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4658
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4659
  %7 = load i32, i32* %count.addr, align 4, !dbg !4660
  %sub = sub i32 32, %7, !dbg !4661
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4662
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4662
  %shl = shl i32 %6, %sub, !dbg !4662, !klee.check.shift !259
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4663
  %or = or i32 %8, %shl, !dbg !4663
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4663
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4664
  %10 = load i32, i32* %count.addr, align 4, !dbg !4666
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4667
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4667
  %shr2 = lshr i32 %9, %10, !dbg !4667, !klee.check.shift !259
  %cmp = icmp eq i32 %shr2, 0, !dbg !4668
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4669

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4670
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4673
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4674

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4675
  store i32 %12, i32* %retval, align 4, !dbg !4676
  br label %return, !dbg !4676

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4677
  br label %return, !dbg !4677

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4678
  br label %return, !dbg !4678

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4680
  ret i32 %13, !dbg !4680
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4681 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4682, metadata !DIExpression()), !dbg !4683
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4684, metadata !DIExpression()), !dbg !4685
  %0 = load i8, i8* %value.addr, align 1, !dbg !4686
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4687
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4688
  ret i8 %call, !dbg !4689
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4690 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4691, metadata !DIExpression()), !dbg !4692
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4693, metadata !DIExpression()), !dbg !4694
  %0 = load i8, i8* %value.addr, align 1, !dbg !4695
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4696
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4697
  ret i8 %call, !dbg !4698
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4699 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4700, metadata !DIExpression()), !dbg !4701
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4702, metadata !DIExpression()), !dbg !4703
  %0 = load i8, i8* %value.addr, align 1, !dbg !4704
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4705
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4706
  ret i8 %call, !dbg !4707
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4708 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4709, metadata !DIExpression()), !dbg !4710
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4711, metadata !DIExpression()), !dbg !4712
  %0 = load i8, i8* %value.addr, align 1, !dbg !4713
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4714
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4715
  ret i8 %call, !dbg !4716
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4717 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4718, metadata !DIExpression()), !dbg !4719
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4720, metadata !DIExpression()), !dbg !4721
  %0 = load i8, i8* %value.addr, align 1, !dbg !4722
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4723
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4724
  ret i8 %call, !dbg !4725
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4726 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4727, metadata !DIExpression()), !dbg !4728
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4729, metadata !DIExpression()), !dbg !4730
  %0 = load i8, i8* %value.addr, align 1, !dbg !4731
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4732
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4733
  ret i8 %call, !dbg !4734
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4735 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4736, metadata !DIExpression()), !dbg !4737
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4738, metadata !DIExpression()), !dbg !4739
  %0 = load i8, i8* %value.addr, align 1, !dbg !4740
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4741
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4742
  ret i8 %call, !dbg !4743
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4744 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4745, metadata !DIExpression()), !dbg !4746
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4747, metadata !DIExpression()), !dbg !4748
  %0 = load i8, i8* %value.addr, align 1, !dbg !4749
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4750
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4751
  ret i8 %call, !dbg !4752
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4753 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4754, metadata !DIExpression()), !dbg !4755
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4756, metadata !DIExpression()), !dbg !4757
  %0 = load i8, i8* %value.addr, align 1, !dbg !4758
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4759
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4760
  ret i8 %call, !dbg !4761
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4762 {
entry:
  %retval = alloca i32, align 4
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %arg1_LW = alloca i16, align 2
  %arg1_HW = alloca i16, align 2
  %arg2_LW = alloca i16, align 2
  %arg2_HW = alloca i16, align 2
  %MulTemp1 = alloca i32, align 4
  %MulTemp2 = alloca i32, align 4
  %MulTemp3 = alloca i32, align 4
  %MulTemp4 = alloca i32, align 4
  %HIGHWORD = alloca i32, align 4
  %OverFlow = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4764, metadata !DIExpression()), !dbg !4765
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4766, metadata !DIExpression()), !dbg !4767
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4768, metadata !DIExpression()), !dbg !4769
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4770, metadata !DIExpression()), !dbg !4771
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4772, metadata !DIExpression()), !dbg !4773
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4774, metadata !DIExpression()), !dbg !4775
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4776, metadata !DIExpression()), !dbg !4777
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4778, metadata !DIExpression()), !dbg !4779
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4780, metadata !DIExpression()), !dbg !4781
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4782, metadata !DIExpression()), !dbg !4783
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4784, metadata !DIExpression()), !dbg !4785
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4786, metadata !DIExpression()), !dbg !4787
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4788
  %and = and i32 %0, 65535, !dbg !4789
  %conv = trunc i32 %and to i16, !dbg !4788
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4790
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4791
  %and1 = and i32 %1, -65536, !dbg !4792
  %shr = lshr i32 %and1, 16, !dbg !4793
  %conv2 = trunc i32 %shr to i16, !dbg !4794
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4795
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4796
  %and3 = and i32 %2, 65535, !dbg !4797
  %conv4 = trunc i32 %and3 to i16, !dbg !4796
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4798
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4799
  %and5 = and i32 %3, -65536, !dbg !4800
  %shr6 = lshr i32 %and5, 16, !dbg !4801
  %conv7 = trunc i32 %shr6 to i16, !dbg !4802
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4803
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4804
  %conv8 = zext i16 %4 to i32, !dbg !4804
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4805
  %conv9 = zext i16 %5 to i32, !dbg !4805
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4806
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4807
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4808
  %conv10 = zext i16 %6 to i32, !dbg !4808
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4809
  %conv11 = zext i16 %7 to i32, !dbg !4809
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4810
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4811
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4812
  %conv13 = zext i16 %8 to i32, !dbg !4812
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4813
  %conv14 = zext i16 %9 to i32, !dbg !4813
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4814
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4815
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4816
  %conv16 = zext i16 %10 to i32, !dbg !4816
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4817
  %conv17 = zext i16 %11 to i32, !dbg !4817
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4818
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4819
  %12 = load i32, i32* %MulTemp2, align 4, !dbg !4820
  %shr19 = lshr i32 %12, 16, !dbg !4821
  %13 = load i32, i32* %MulTemp3, align 4, !dbg !4822
  %shr20 = lshr i32 %13, 16, !dbg !4823
  %add = add i32 %shr19, %shr20, !dbg !4824
  %14 = load i32, i32* %MulTemp4, align 4, !dbg !4825
  %add21 = add i32 %add, %14, !dbg !4826
  store i32 %add21, i32* %HIGHWORD, align 4, !dbg !4827
  %15 = load i32, i32* %MulTemp1, align 4, !dbg !4828
  %shr22 = lshr i32 %15, 16, !dbg !4829
  %16 = load i32, i32* %MulTemp2, align 4, !dbg !4830
  %and23 = and i32 %16, 65535, !dbg !4831
  %add24 = add i32 %shr22, %and23, !dbg !4832
  %17 = load i32, i32* %MulTemp3, align 4, !dbg !4833
  %and25 = and i32 %17, 65535, !dbg !4834
  %add26 = add i32 %add24, %and25, !dbg !4835
  store i32 %add26, i32* %OverFlow, align 4, !dbg !4836
  %18 = load i32, i32* %OverFlow, align 4, !dbg !4837
  %cmp = icmp ugt i32 %18, 65535, !dbg !4839
  br i1 %cmp, label %if.then, label %if.else, !dbg !4840

if.then:                                          ; preds = %entry
  %19 = load i32, i32* %HIGHWORD, align 4, !dbg !4841
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4843
  %shr28 = lshr i32 %20, 16, !dbg !4844
  %add29 = add i32 %19, %shr28, !dbg !4845
  store i32 %add29, i32* %retval, align 4, !dbg !4846
  br label %return, !dbg !4846

if.else:                                          ; preds = %entry
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4847
  store i32 %21, i32* %retval, align 4, !dbg !4849
  br label %return, !dbg !4849

return:                                           ; preds = %if.else, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !4850
  ret i32 %22, !dbg !4850
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4851 {
entry:
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %arg1_LW = alloca i16, align 2
  %arg1_HW = alloca i16, align 2
  %arg2_LW = alloca i16, align 2
  %arg2_HW = alloca i16, align 2
  %MulTemp1 = alloca i32, align 4
  %MulTemp2 = alloca i32, align 4
  %MulTemp3 = alloca i32, align 4
  %MulTemp4 = alloca i32, align 4
  %HIGHWORD = alloca i32, align 4
  %OverFlow = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4852, metadata !DIExpression()), !dbg !4853
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4854, metadata !DIExpression()), !dbg !4855
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4856, metadata !DIExpression()), !dbg !4857
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4858, metadata !DIExpression()), !dbg !4859
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4860, metadata !DIExpression()), !dbg !4861
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4862, metadata !DIExpression()), !dbg !4863
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4864, metadata !DIExpression()), !dbg !4865
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4866, metadata !DIExpression()), !dbg !4867
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4868, metadata !DIExpression()), !dbg !4869
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4870, metadata !DIExpression()), !dbg !4871
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4872, metadata !DIExpression()), !dbg !4873
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4874, metadata !DIExpression()), !dbg !4875
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4876
  %and = and i32 %0, 65535, !dbg !4877
  %conv = trunc i32 %and to i16, !dbg !4876
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4878
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4879
  %and1 = and i32 %1, -65536, !dbg !4880
  %shr = lshr i32 %and1, 16, !dbg !4881
  %conv2 = trunc i32 %shr to i16, !dbg !4882
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4883
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4884
  %and3 = and i32 %2, 65535, !dbg !4885
  %conv4 = trunc i32 %and3 to i16, !dbg !4884
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4886
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4887
  %and5 = and i32 %3, -65536, !dbg !4888
  %shr6 = lshr i32 %and5, 16, !dbg !4889
  %conv7 = trunc i32 %shr6 to i16, !dbg !4890
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4891
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4892
  %conv8 = zext i16 %4 to i32, !dbg !4892
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4893
  %conv9 = zext i16 %5 to i32, !dbg !4893
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4894
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4895
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4896
  %conv10 = zext i16 %6 to i32, !dbg !4896
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4897
  %conv11 = zext i16 %7 to i32, !dbg !4897
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4898
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4899
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4900
  %conv13 = zext i16 %8 to i32, !dbg !4900
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4901
  %conv14 = zext i16 %9 to i32, !dbg !4901
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4902
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4903
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4904
  %conv16 = zext i16 %10 to i32, !dbg !4904
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4905
  %conv17 = zext i16 %11 to i32, !dbg !4905
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4906
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4907
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4908
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4909
  %and19 = and i32 %13, 65535, !dbg !4910
  %shl = shl i32 %and19, 16, !dbg !4911
  %add = add i32 %12, %shl, !dbg !4912
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4913
  %and20 = and i32 %14, 65535, !dbg !4914
  %shl21 = shl i32 %and20, 16, !dbg !4915
  %add22 = add i32 %add, %shl21, !dbg !4916
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4917
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4918
  ret i32 %15, !dbg !4919
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4920 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4926, metadata !DIExpression()), !dbg !4927
  %2 = icmp eq i64 %0, 0, !dbg !4928
  br i1 %2, label %3, label %4, !dbg !4930

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4931
  unreachable, !dbg !4931

4:                                                ; preds = %1
  ret void, !dbg !4932
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4933 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4939, metadata !DIExpression()), !dbg !4941
  call void @llvm.dbg.value(metadata i64 %1, metadata !4940, metadata !DIExpression()), !dbg !4941
  %3 = icmp ult i64 %1, %0, !dbg !4942
  br i1 %3, label %5, label %4, !dbg !4944

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4945
  unreachable, !dbg !4945

5:                                                ; preds = %2
  ret void, !dbg !4947
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!32, !2, !34, !36, !38}
!llvm.ident = !{!40, !40, !40, !41, !41}
!llvm.module.flags = !{!42, !43, !44, !45, !46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116/mul_Ccode_alarm_0116.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !9, line: 24, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !11, line: 37, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !16)
!16 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !21)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !25)
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !28)
!28 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116/MulHword_alarm_0116.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!36 = distinct !DICompileUnit(language: DW_LANG_C89, file: !37, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!38 = distinct !DICompileUnit(language: DW_LANG_C89, file: !39, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!39 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!40 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!41 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!42 = !{i32 7, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{i32 7, !"uwtable", i32 1}
!46 = !{i32 7, !"frame-pointer", i32 2}
!47 = distinct !DISubprogram(name: "main", scope: !48, file: !48, line: 7, type: !49, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!48 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!49 = !DISubroutineType(types: !50)
!50 = !{!51}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DILocalVariable(name: "value", scope: !47, file: !48, line: 9, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !51)
!55 = !DILocation(line: 9, column: 13, scope: !47)
!56 = !DILocalVariable(name: "factor", scope: !47, file: !48, line: 10, type: !8)
!57 = !DILocation(line: 10, column: 12, scope: !47)
!58 = !DILocalVariable(name: "result", scope: !47, file: !48, line: 11, type: !53)
!59 = !DILocation(line: 11, column: 13, scope: !47)
!60 = !DILocation(line: 13, column: 24, scope: !47)
!61 = !DILocation(line: 13, column: 5, scope: !47)
!62 = !DILocation(line: 14, column: 5, scope: !47)
!63 = !DILocation(line: 16, column: 34, scope: !47)
!64 = !DILocation(line: 16, column: 41, scope: !47)
!65 = !DILocation(line: 16, column: 14, scope: !47)
!66 = !DILocation(line: 16, column: 12, scope: !47)
!67 = !DILocation(line: 18, column: 11, scope: !47)
!68 = !DILocation(line: 19, column: 5, scope: !47)
!69 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !70, file: !70, line: 43, type: !71, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!71 = !DISubroutineType(types: !72)
!72 = !{!6, !6, !22}
!73 = !DILocalVariable(name: "value", arg: 1, scope: !69, file: !70, line: 43, type: !6)
!74 = !DILocation(line: 43, column: 35, scope: !69)
!75 = !DILocalVariable(name: "factor", arg: 2, scope: !69, file: !70, line: 43, type: !22)
!76 = !DILocation(line: 43, column: 46, scope: !69)
!77 = !DILocalVariable(name: "s32MulTemp1", scope: !69, file: !70, line: 45, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !53)
!79 = !DILocation(line: 45, column: 6, scope: !69)
!80 = !DILocalVariable(name: "s32MulTemp2", scope: !69, file: !70, line: 45, type: !78)
!81 = !DILocation(line: 45, column: 24, scope: !69)
!82 = !DILocation(line: 46, column: 16, scope: !69)
!83 = !DILocation(line: 46, column: 24, scope: !69)
!84 = !DILocation(line: 46, column: 22, scope: !69)
!85 = !DILocation(line: 46, column: 14, scope: !69)
!86 = !DILocation(line: 48, column: 16, scope: !69)
!87 = !DILocation(line: 48, column: 28, scope: !69)
!88 = !DILocation(line: 48, column: 14, scope: !69)
!89 = !DILocation(line: 50, column: 6, scope: !90)
!90 = distinct !DILexicalBlock(scope: !69, file: !70, line: 50, column: 5)
!91 = !DILocation(line: 50, column: 17, scope: !90)
!92 = !DILocation(line: 50, column: 21, scope: !90)
!93 = !DILocation(line: 50, column: 25, scope: !90)
!94 = !DILocation(line: 50, column: 37, scope: !90)
!95 = !DILocation(line: 50, column: 46, scope: !90)
!96 = !DILocation(line: 50, column: 5, scope: !69)
!97 = !DILocation(line: 52, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !90, file: !70, line: 51, column: 2)
!99 = !DILocation(line: 52, column: 29, scope: !98)
!100 = !DILocation(line: 52, column: 15, scope: !98)
!101 = !DILocation(line: 53, column: 14, scope: !98)
!102 = !DILocation(line: 53, column: 10, scope: !98)
!103 = !DILocation(line: 53, column: 3, scope: !98)
!104 = !DILocation(line: 57, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !90, file: !70, line: 56, column: 2)
!106 = !DILocation(line: 57, column: 10, scope: !105)
!107 = !DILocation(line: 57, column: 3, scope: !105)
!108 = !DILocation(line: 59, column: 1, scope: !69)
!109 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !70, file: !70, line: 77, type: !71, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "value", arg: 1, scope: !109, file: !70, line: 77, type: !6)
!111 = !DILocation(line: 77, column: 38, scope: !109)
!112 = !DILocalVariable(name: "factor", arg: 2, scope: !109, file: !70, line: 77, type: !22)
!113 = !DILocation(line: 77, column: 49, scope: !109)
!114 = !DILocalVariable(name: "s32MulTemp1", scope: !109, file: !70, line: 79, type: !78)
!115 = !DILocation(line: 79, column: 6, scope: !109)
!116 = !DILocalVariable(name: "s32MulTemp2", scope: !109, file: !70, line: 79, type: !78)
!117 = !DILocation(line: 79, column: 24, scope: !109)
!118 = !DILocation(line: 80, column: 16, scope: !109)
!119 = !DILocation(line: 80, column: 24, scope: !109)
!120 = !DILocation(line: 80, column: 22, scope: !109)
!121 = !DILocation(line: 80, column: 14, scope: !109)
!122 = !DILocation(line: 81, column: 16, scope: !109)
!123 = !DILocation(line: 81, column: 28, scope: !109)
!124 = !DILocation(line: 81, column: 14, scope: !109)
!125 = !DILocation(line: 82, column: 6, scope: !126)
!126 = distinct !DILexicalBlock(scope: !109, file: !70, line: 82, column: 5)
!127 = !DILocation(line: 82, column: 17, scope: !126)
!128 = !DILocation(line: 82, column: 21, scope: !126)
!129 = !DILocation(line: 82, column: 25, scope: !126)
!130 = !DILocation(line: 82, column: 37, scope: !126)
!131 = !DILocation(line: 82, column: 44, scope: !126)
!132 = !DILocation(line: 82, column: 5, scope: !109)
!133 = !DILocation(line: 84, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !70, line: 83, column: 2)
!135 = !DILocation(line: 84, column: 29, scope: !134)
!136 = !DILocation(line: 84, column: 15, scope: !134)
!137 = !DILocation(line: 85, column: 2, scope: !134)
!138 = !DILocation(line: 91, column: 5, scope: !139)
!139 = distinct !DILexicalBlock(scope: !109, file: !70, line: 91, column: 5)
!140 = !DILocation(line: 91, column: 17, scope: !139)
!141 = !DILocation(line: 91, column: 5, scope: !109)
!142 = !DILocation(line: 93, column: 6, scope: !143)
!143 = distinct !DILexicalBlock(scope: !144, file: !70, line: 93, column: 6)
!144 = distinct !DILexicalBlock(scope: !139, file: !70, line: 92, column: 2)
!145 = !DILocation(line: 93, column: 18, scope: !143)
!146 = !DILocation(line: 93, column: 6, scope: !144)
!147 = !DILocation(line: 95, column: 15, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !70, line: 94, column: 3)
!149 = !DILocation(line: 95, column: 11, scope: !148)
!150 = !DILocation(line: 95, column: 4, scope: !148)
!151 = !DILocation(line: 99, column: 4, scope: !152)
!152 = distinct !DILexicalBlock(scope: !143, file: !70, line: 98, column: 3)
!153 = !DILocation(line: 104, column: 3, scope: !154)
!154 = distinct !DILexicalBlock(scope: !139, file: !70, line: 103, column: 2)
!155 = !DILocation(line: 106, column: 1, scope: !109)
!156 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !70, file: !70, line: 123, type: !157, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DISubroutineType(types: !158)
!158 = !{!6, !6, !17}
!159 = !DILocalVariable(name: "value", arg: 1, scope: !156, file: !70, line: 123, type: !6)
!160 = !DILocation(line: 123, column: 25, scope: !156)
!161 = !DILocalVariable(name: "factor", arg: 2, scope: !156, file: !70, line: 123, type: !17)
!162 = !DILocation(line: 123, column: 35, scope: !156)
!163 = !DILocalVariable(name: "s32MulTemp1", scope: !156, file: !70, line: 125, type: !78)
!164 = !DILocation(line: 125, column: 6, scope: !156)
!165 = !DILocalVariable(name: "s32MulTemp2", scope: !156, file: !70, line: 125, type: !78)
!166 = !DILocation(line: 125, column: 24, scope: !156)
!167 = !DILocation(line: 126, column: 16, scope: !156)
!168 = !DILocation(line: 126, column: 24, scope: !156)
!169 = !DILocation(line: 126, column: 22, scope: !156)
!170 = !DILocation(line: 126, column: 14, scope: !156)
!171 = !DILocation(line: 127, column: 16, scope: !156)
!172 = !DILocation(line: 127, column: 28, scope: !156)
!173 = !DILocation(line: 127, column: 14, scope: !156)
!174 = !DILocation(line: 128, column: 6, scope: !175)
!175 = distinct !DILexicalBlock(scope: !156, file: !70, line: 128, column: 5)
!176 = !DILocation(line: 128, column: 17, scope: !175)
!177 = !DILocation(line: 128, column: 21, scope: !175)
!178 = !DILocation(line: 128, column: 25, scope: !175)
!179 = !DILocation(line: 128, column: 37, scope: !175)
!180 = !DILocation(line: 128, column: 44, scope: !175)
!181 = !DILocation(line: 128, column: 5, scope: !156)
!182 = !DILocation(line: 130, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !175, file: !70, line: 129, column: 2)
!184 = !DILocation(line: 130, column: 29, scope: !183)
!185 = !DILocation(line: 130, column: 15, scope: !183)
!186 = !DILocation(line: 131, column: 14, scope: !183)
!187 = !DILocation(line: 131, column: 10, scope: !183)
!188 = !DILocation(line: 131, column: 3, scope: !183)
!189 = !DILocation(line: 135, column: 14, scope: !190)
!190 = distinct !DILexicalBlock(scope: !175, file: !70, line: 134, column: 2)
!191 = !DILocation(line: 135, column: 10, scope: !190)
!192 = !DILocation(line: 135, column: 3, scope: !190)
!193 = !DILocation(line: 137, column: 1, scope: !156)
!194 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !70, file: !70, line: 155, type: !157, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!195 = !DILocalVariable(name: "value", arg: 1, scope: !194, file: !70, line: 155, type: !6)
!196 = !DILocation(line: 155, column: 25, scope: !194)
!197 = !DILocalVariable(name: "factor", arg: 2, scope: !194, file: !70, line: 155, type: !17)
!198 = !DILocation(line: 155, column: 35, scope: !194)
!199 = !DILocalVariable(name: "s32MulTemp1", scope: !194, file: !70, line: 157, type: !78)
!200 = !DILocation(line: 157, column: 6, scope: !194)
!201 = !DILocalVariable(name: "s32MulTemp2", scope: !194, file: !70, line: 157, type: !78)
!202 = !DILocation(line: 157, column: 24, scope: !194)
!203 = !DILocation(line: 158, column: 16, scope: !194)
!204 = !DILocation(line: 158, column: 24, scope: !194)
!205 = !DILocation(line: 158, column: 22, scope: !194)
!206 = !DILocation(line: 158, column: 14, scope: !194)
!207 = !DILocation(line: 159, column: 16, scope: !194)
!208 = !DILocation(line: 159, column: 28, scope: !194)
!209 = !DILocation(line: 159, column: 14, scope: !194)
!210 = !DILocation(line: 160, column: 6, scope: !211)
!211 = distinct !DILexicalBlock(scope: !194, file: !70, line: 160, column: 5)
!212 = !DILocation(line: 160, column: 17, scope: !211)
!213 = !DILocation(line: 160, column: 21, scope: !211)
!214 = !DILocation(line: 160, column: 25, scope: !211)
!215 = !DILocation(line: 160, column: 37, scope: !211)
!216 = !DILocation(line: 160, column: 44, scope: !211)
!217 = !DILocation(line: 160, column: 5, scope: !194)
!218 = !DILocation(line: 162, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !211, file: !70, line: 161, column: 2)
!220 = !DILocation(line: 162, column: 29, scope: !219)
!221 = !DILocation(line: 162, column: 15, scope: !219)
!222 = !DILocation(line: 163, column: 2, scope: !219)
!223 = !DILocation(line: 169, column: 5, scope: !224)
!224 = distinct !DILexicalBlock(scope: !194, file: !70, line: 169, column: 5)
!225 = !DILocation(line: 169, column: 17, scope: !224)
!226 = !DILocation(line: 169, column: 5, scope: !194)
!227 = !DILocation(line: 171, column: 6, scope: !228)
!228 = distinct !DILexicalBlock(scope: !229, file: !70, line: 171, column: 6)
!229 = distinct !DILexicalBlock(scope: !224, file: !70, line: 170, column: 2)
!230 = !DILocation(line: 171, column: 18, scope: !228)
!231 = !DILocation(line: 171, column: 6, scope: !229)
!232 = !DILocation(line: 173, column: 15, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !70, line: 172, column: 3)
!234 = !DILocation(line: 173, column: 11, scope: !233)
!235 = !DILocation(line: 173, column: 4, scope: !233)
!236 = !DILocation(line: 177, column: 4, scope: !237)
!237 = distinct !DILexicalBlock(scope: !228, file: !70, line: 176, column: 3)
!238 = !DILocation(line: 182, column: 3, scope: !239)
!239 = distinct !DILexicalBlock(scope: !224, file: !70, line: 181, column: 2)
!240 = !DILocation(line: 184, column: 1, scope: !194)
!241 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !70, file: !70, line: 200, type: !242, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!242 = !DISubroutineType(types: !243)
!243 = !{!13, !13, !13, !78}
!244 = !DILocalVariable(name: "value", arg: 1, scope: !241, file: !70, line: 200, type: !13)
!245 = !DILocation(line: 200, column: 40, scope: !241)
!246 = !DILocalVariable(name: "factor", arg: 2, scope: !241, file: !70, line: 200, type: !13)
!247 = !DILocation(line: 200, column: 51, scope: !241)
!248 = !DILocalVariable(name: "count", arg: 3, scope: !241, file: !70, line: 200, type: !78)
!249 = !DILocation(line: 200, column: 63, scope: !241)
!250 = !DILocalVariable(name: "s32MulTemp", scope: !241, file: !70, line: 202, type: !78)
!251 = !DILocation(line: 202, column: 6, scope: !241)
!252 = !DILocation(line: 203, column: 15, scope: !241)
!253 = !DILocation(line: 203, column: 23, scope: !241)
!254 = !DILocation(line: 203, column: 21, scope: !241)
!255 = !DILocation(line: 203, column: 13, scope: !241)
!256 = !DILocation(line: 204, column: 15, scope: !241)
!257 = !DILocation(line: 204, column: 26, scope: !241)
!258 = !DILocation(line: 204, column: 25, scope: !241)
!259 = !{!"True"}
!260 = !DILocation(line: 204, column: 13, scope: !241)
!261 = !DILocation(line: 205, column: 9, scope: !241)
!262 = !DILocation(line: 205, column: 2, scope: !241)
!263 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !70, file: !70, line: 223, type: !242, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!264 = !DILocalVariable(name: "value", arg: 1, scope: !263, file: !70, line: 223, type: !13)
!265 = !DILocation(line: 223, column: 43, scope: !263)
!266 = !DILocalVariable(name: "factor", arg: 2, scope: !263, file: !70, line: 223, type: !13)
!267 = !DILocation(line: 223, column: 54, scope: !263)
!268 = !DILocalVariable(name: "count", arg: 3, scope: !263, file: !70, line: 223, type: !78)
!269 = !DILocation(line: 223, column: 66, scope: !263)
!270 = !DILocalVariable(name: "s32MulTemp", scope: !263, file: !70, line: 225, type: !78)
!271 = !DILocation(line: 225, column: 6, scope: !263)
!272 = !DILocation(line: 226, column: 15, scope: !263)
!273 = !DILocation(line: 226, column: 23, scope: !263)
!274 = !DILocation(line: 226, column: 21, scope: !263)
!275 = !DILocation(line: 226, column: 13, scope: !263)
!276 = !DILocation(line: 227, column: 15, scope: !263)
!277 = !DILocation(line: 227, column: 26, scope: !263)
!278 = !DILocation(line: 227, column: 25, scope: !263)
!279 = !DILocation(line: 227, column: 13, scope: !263)
!280 = !DILocation(line: 228, column: 5, scope: !281)
!281 = distinct !DILexicalBlock(scope: !263, file: !70, line: 228, column: 5)
!282 = !DILocation(line: 228, column: 16, scope: !281)
!283 = !DILocation(line: 228, column: 5, scope: !263)
!284 = !DILocation(line: 230, column: 6, scope: !285)
!285 = distinct !DILexicalBlock(scope: !286, file: !70, line: 230, column: 6)
!286 = distinct !DILexicalBlock(scope: !281, file: !70, line: 229, column: 2)
!287 = !DILocation(line: 230, column: 17, scope: !285)
!288 = !DILocation(line: 230, column: 6, scope: !286)
!289 = !DILocation(line: 232, column: 16, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !70, line: 231, column: 3)
!291 = !DILocation(line: 232, column: 11, scope: !290)
!292 = !DILocation(line: 232, column: 4, scope: !290)
!293 = !DILocation(line: 236, column: 4, scope: !294)
!294 = distinct !DILexicalBlock(scope: !285, file: !70, line: 235, column: 3)
!295 = !DILocation(line: 241, column: 3, scope: !296)
!296 = distinct !DILexicalBlock(scope: !281, file: !70, line: 240, column: 2)
!297 = !DILocation(line: 243, column: 1, scope: !263)
!298 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !70, file: !70, line: 262, type: !299, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!299 = !DISubroutineType(types: !300)
!300 = !{!13, !13, !13}
!301 = !DILocalVariable(name: "value", arg: 1, scope: !298, file: !70, line: 262, type: !13)
!302 = !DILocation(line: 262, column: 30, scope: !298)
!303 = !DILocalVariable(name: "factor", arg: 2, scope: !298, file: !70, line: 262, type: !13)
!304 = !DILocation(line: 262, column: 41, scope: !298)
!305 = !DILocalVariable(name: "s32MulTemp1", scope: !298, file: !70, line: 264, type: !78)
!306 = !DILocation(line: 264, column: 6, scope: !298)
!307 = !DILocalVariable(name: "s32MulTemp2", scope: !298, file: !70, line: 264, type: !78)
!308 = !DILocation(line: 264, column: 24, scope: !298)
!309 = !DILocation(line: 265, column: 16, scope: !298)
!310 = !DILocation(line: 265, column: 24, scope: !298)
!311 = !DILocation(line: 265, column: 22, scope: !298)
!312 = !DILocation(line: 265, column: 14, scope: !298)
!313 = !DILocation(line: 266, column: 16, scope: !298)
!314 = !DILocation(line: 266, column: 28, scope: !298)
!315 = !DILocation(line: 266, column: 14, scope: !298)
!316 = !DILocation(line: 267, column: 6, scope: !317)
!317 = distinct !DILexicalBlock(scope: !298, file: !70, line: 267, column: 5)
!318 = !DILocation(line: 267, column: 17, scope: !317)
!319 = !DILocation(line: 267, column: 21, scope: !317)
!320 = !DILocation(line: 267, column: 25, scope: !317)
!321 = !DILocation(line: 267, column: 37, scope: !317)
!322 = !DILocation(line: 267, column: 46, scope: !317)
!323 = !DILocation(line: 267, column: 5, scope: !298)
!324 = !DILocation(line: 269, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !317, file: !70, line: 268, column: 2)
!326 = !DILocation(line: 269, column: 29, scope: !325)
!327 = !DILocation(line: 269, column: 15, scope: !325)
!328 = !DILocation(line: 271, column: 2, scope: !325)
!329 = !DILocation(line: 277, column: 5, scope: !330)
!330 = distinct !DILexicalBlock(scope: !298, file: !70, line: 277, column: 5)
!331 = !DILocation(line: 277, column: 17, scope: !330)
!332 = !DILocation(line: 277, column: 5, scope: !298)
!333 = !DILocation(line: 279, column: 15, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !70, line: 278, column: 2)
!335 = !DILocation(line: 279, column: 10, scope: !334)
!336 = !DILocation(line: 279, column: 3, scope: !334)
!337 = !DILocation(line: 283, column: 3, scope: !338)
!338 = distinct !DILexicalBlock(scope: !330, file: !70, line: 282, column: 2)
!339 = !DILocation(line: 285, column: 1, scope: !298)
!340 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !70, file: !70, line: 304, type: !299, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!341 = !DILocalVariable(name: "value", arg: 1, scope: !340, file: !70, line: 304, type: !13)
!342 = !DILocation(line: 304, column: 30, scope: !340)
!343 = !DILocalVariable(name: "factor", arg: 2, scope: !340, file: !70, line: 304, type: !13)
!344 = !DILocation(line: 304, column: 41, scope: !340)
!345 = !DILocalVariable(name: "s32MulTemp1", scope: !340, file: !70, line: 306, type: !78)
!346 = !DILocation(line: 306, column: 6, scope: !340)
!347 = !DILocalVariable(name: "s32MulTemp2", scope: !340, file: !70, line: 306, type: !78)
!348 = !DILocation(line: 306, column: 24, scope: !340)
!349 = !DILocation(line: 307, column: 16, scope: !340)
!350 = !DILocation(line: 307, column: 24, scope: !340)
!351 = !DILocation(line: 307, column: 22, scope: !340)
!352 = !DILocation(line: 307, column: 14, scope: !340)
!353 = !DILocation(line: 308, column: 16, scope: !340)
!354 = !DILocation(line: 308, column: 28, scope: !340)
!355 = !DILocation(line: 308, column: 14, scope: !340)
!356 = !DILocation(line: 309, column: 6, scope: !357)
!357 = distinct !DILexicalBlock(scope: !340, file: !70, line: 309, column: 5)
!358 = !DILocation(line: 309, column: 17, scope: !357)
!359 = !DILocation(line: 309, column: 21, scope: !357)
!360 = !DILocation(line: 309, column: 25, scope: !357)
!361 = !DILocation(line: 309, column: 37, scope: !357)
!362 = !DILocation(line: 309, column: 46, scope: !357)
!363 = !DILocation(line: 309, column: 5, scope: !340)
!364 = !DILocation(line: 311, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !357, file: !70, line: 310, column: 2)
!366 = !DILocation(line: 311, column: 29, scope: !365)
!367 = !DILocation(line: 311, column: 15, scope: !365)
!368 = !DILocation(line: 312, column: 2, scope: !365)
!369 = !DILocation(line: 318, column: 6, scope: !370)
!370 = distinct !DILexicalBlock(scope: !340, file: !70, line: 318, column: 6)
!371 = !DILocation(line: 318, column: 18, scope: !370)
!372 = !DILocation(line: 318, column: 6, scope: !340)
!373 = !DILocation(line: 320, column: 6, scope: !374)
!374 = distinct !DILexicalBlock(scope: !375, file: !70, line: 320, column: 6)
!375 = distinct !DILexicalBlock(scope: !370, file: !70, line: 319, column: 2)
!376 = !DILocation(line: 320, column: 18, scope: !374)
!377 = !DILocation(line: 320, column: 6, scope: !375)
!378 = !DILocation(line: 322, column: 16, scope: !379)
!379 = distinct !DILexicalBlock(scope: !374, file: !70, line: 321, column: 3)
!380 = !DILocation(line: 322, column: 11, scope: !379)
!381 = !DILocation(line: 322, column: 4, scope: !379)
!382 = !DILocation(line: 326, column: 4, scope: !383)
!383 = distinct !DILexicalBlock(scope: !374, file: !70, line: 325, column: 3)
!384 = !DILocation(line: 331, column: 3, scope: !385)
!385 = distinct !DILexicalBlock(scope: !370, file: !70, line: 330, column: 2)
!386 = !DILocation(line: 333, column: 1, scope: !340)
!387 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !70, file: !70, line: 350, type: !388, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!388 = !DISubroutineType(types: !389)
!389 = !{!13, !13, !22}
!390 = !DILocalVariable(name: "value", arg: 1, scope: !387, file: !70, line: 350, type: !13)
!391 = !DILocation(line: 350, column: 39, scope: !387)
!392 = !DILocalVariable(name: "factor", arg: 2, scope: !387, file: !70, line: 350, type: !22)
!393 = !DILocation(line: 350, column: 50, scope: !387)
!394 = !DILocalVariable(name: "s32MulTemp1", scope: !387, file: !70, line: 352, type: !78)
!395 = !DILocation(line: 352, column: 6, scope: !387)
!396 = !DILocalVariable(name: "s32MulTemp2", scope: !387, file: !70, line: 352, type: !78)
!397 = !DILocation(line: 352, column: 24, scope: !387)
!398 = !DILocation(line: 353, column: 16, scope: !387)
!399 = !DILocation(line: 353, column: 24, scope: !387)
!400 = !DILocation(line: 353, column: 22, scope: !387)
!401 = !DILocation(line: 353, column: 14, scope: !387)
!402 = !DILocation(line: 354, column: 16, scope: !387)
!403 = !DILocation(line: 354, column: 28, scope: !387)
!404 = !DILocation(line: 354, column: 14, scope: !387)
!405 = !DILocation(line: 355, column: 6, scope: !406)
!406 = distinct !DILexicalBlock(scope: !387, file: !70, line: 355, column: 5)
!407 = !DILocation(line: 355, column: 17, scope: !406)
!408 = !DILocation(line: 355, column: 21, scope: !406)
!409 = !DILocation(line: 355, column: 25, scope: !406)
!410 = !DILocation(line: 355, column: 37, scope: !406)
!411 = !DILocation(line: 355, column: 46, scope: !406)
!412 = !DILocation(line: 355, column: 5, scope: !387)
!413 = !DILocation(line: 361, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !406, file: !70, line: 360, column: 2)
!415 = !DILocation(line: 361, column: 29, scope: !414)
!416 = !DILocation(line: 361, column: 15, scope: !414)
!417 = !DILocation(line: 362, column: 15, scope: !414)
!418 = !DILocation(line: 362, column: 10, scope: !414)
!419 = !DILocation(line: 362, column: 3, scope: !414)
!420 = !DILocation(line: 366, column: 15, scope: !421)
!421 = distinct !DILexicalBlock(scope: !406, file: !70, line: 365, column: 2)
!422 = !DILocation(line: 366, column: 10, scope: !421)
!423 = !DILocation(line: 366, column: 3, scope: !421)
!424 = !DILocation(line: 368, column: 1, scope: !387)
!425 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !70, file: !70, line: 386, type: !388, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!426 = !DILocalVariable(name: "value", arg: 1, scope: !425, file: !70, line: 386, type: !13)
!427 = !DILocation(line: 386, column: 42, scope: !425)
!428 = !DILocalVariable(name: "factor", arg: 2, scope: !425, file: !70, line: 386, type: !22)
!429 = !DILocation(line: 386, column: 53, scope: !425)
!430 = !DILocalVariable(name: "s32MulTemp1", scope: !425, file: !70, line: 388, type: !78)
!431 = !DILocation(line: 388, column: 6, scope: !425)
!432 = !DILocalVariable(name: "s32MulTemp2", scope: !425, file: !70, line: 388, type: !78)
!433 = !DILocation(line: 388, column: 24, scope: !425)
!434 = !DILocation(line: 389, column: 16, scope: !425)
!435 = !DILocation(line: 389, column: 24, scope: !425)
!436 = !DILocation(line: 389, column: 22, scope: !425)
!437 = !DILocation(line: 389, column: 14, scope: !425)
!438 = !DILocation(line: 390, column: 16, scope: !425)
!439 = !DILocation(line: 390, column: 28, scope: !425)
!440 = !DILocation(line: 390, column: 14, scope: !425)
!441 = !DILocation(line: 391, column: 6, scope: !442)
!442 = distinct !DILexicalBlock(scope: !425, file: !70, line: 391, column: 5)
!443 = !DILocation(line: 391, column: 17, scope: !442)
!444 = !DILocation(line: 391, column: 21, scope: !442)
!445 = !DILocation(line: 391, column: 25, scope: !442)
!446 = !DILocation(line: 391, column: 37, scope: !442)
!447 = !DILocation(line: 391, column: 44, scope: !442)
!448 = !DILocation(line: 391, column: 5, scope: !425)
!449 = !DILocation(line: 398, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !442, file: !70, line: 397, column: 2)
!451 = !DILocation(line: 398, column: 29, scope: !450)
!452 = !DILocation(line: 398, column: 15, scope: !450)
!453 = !DILocation(line: 399, column: 2, scope: !450)
!454 = !DILocation(line: 404, column: 5, scope: !455)
!455 = distinct !DILexicalBlock(scope: !425, file: !70, line: 404, column: 5)
!456 = !DILocation(line: 404, column: 17, scope: !455)
!457 = !DILocation(line: 404, column: 5, scope: !425)
!458 = !DILocation(line: 406, column: 6, scope: !459)
!459 = distinct !DILexicalBlock(scope: !460, file: !70, line: 406, column: 6)
!460 = distinct !DILexicalBlock(scope: !455, file: !70, line: 405, column: 2)
!461 = !DILocation(line: 406, column: 18, scope: !459)
!462 = !DILocation(line: 406, column: 6, scope: !460)
!463 = !DILocation(line: 408, column: 16, scope: !464)
!464 = distinct !DILexicalBlock(scope: !459, file: !70, line: 407, column: 3)
!465 = !DILocation(line: 408, column: 11, scope: !464)
!466 = !DILocation(line: 408, column: 4, scope: !464)
!467 = !DILocation(line: 412, column: 4, scope: !468)
!468 = distinct !DILexicalBlock(scope: !459, file: !70, line: 411, column: 3)
!469 = !DILocation(line: 417, column: 3, scope: !470)
!470 = distinct !DILexicalBlock(scope: !455, file: !70, line: 416, column: 2)
!471 = !DILocation(line: 419, column: 1, scope: !425)
!472 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !70, file: !70, line: 436, type: !473, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!473 = !DISubroutineType(types: !474)
!474 = !{!13, !13, !17}
!475 = !DILocalVariable(name: "value", arg: 1, scope: !472, file: !70, line: 436, type: !13)
!476 = !DILocation(line: 436, column: 29, scope: !472)
!477 = !DILocalVariable(name: "factor", arg: 2, scope: !472, file: !70, line: 436, type: !17)
!478 = !DILocation(line: 436, column: 39, scope: !472)
!479 = !DILocalVariable(name: "s32MulTemp1", scope: !472, file: !70, line: 438, type: !78)
!480 = !DILocation(line: 438, column: 6, scope: !472)
!481 = !DILocalVariable(name: "s32MulTemp2", scope: !472, file: !70, line: 438, type: !78)
!482 = !DILocation(line: 438, column: 24, scope: !472)
!483 = !DILocation(line: 439, column: 16, scope: !472)
!484 = !DILocation(line: 439, column: 24, scope: !472)
!485 = !DILocation(line: 439, column: 22, scope: !472)
!486 = !DILocation(line: 439, column: 14, scope: !472)
!487 = !DILocation(line: 440, column: 16, scope: !472)
!488 = !DILocation(line: 440, column: 28, scope: !472)
!489 = !DILocation(line: 440, column: 14, scope: !472)
!490 = !DILocation(line: 441, column: 6, scope: !491)
!491 = distinct !DILexicalBlock(scope: !472, file: !70, line: 441, column: 5)
!492 = !DILocation(line: 441, column: 17, scope: !491)
!493 = !DILocation(line: 441, column: 21, scope: !491)
!494 = !DILocation(line: 441, column: 25, scope: !491)
!495 = !DILocation(line: 441, column: 37, scope: !491)
!496 = !DILocation(line: 441, column: 44, scope: !491)
!497 = !DILocation(line: 441, column: 5, scope: !472)
!498 = !DILocation(line: 448, column: 17, scope: !499)
!499 = distinct !DILexicalBlock(scope: !491, file: !70, line: 447, column: 2)
!500 = !DILocation(line: 448, column: 29, scope: !499)
!501 = !DILocation(line: 448, column: 15, scope: !499)
!502 = !DILocation(line: 449, column: 10, scope: !499)
!503 = !DILocation(line: 449, column: 3, scope: !499)
!504 = !DILocation(line: 453, column: 10, scope: !505)
!505 = distinct !DILexicalBlock(scope: !491, file: !70, line: 452, column: 2)
!506 = !DILocation(line: 453, column: 3, scope: !505)
!507 = !DILocation(line: 455, column: 1, scope: !472)
!508 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !70, file: !70, line: 473, type: !473, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!509 = !DILocalVariable(name: "value", arg: 1, scope: !508, file: !70, line: 473, type: !13)
!510 = !DILocation(line: 473, column: 29, scope: !508)
!511 = !DILocalVariable(name: "factor", arg: 2, scope: !508, file: !70, line: 473, type: !17)
!512 = !DILocation(line: 473, column: 39, scope: !508)
!513 = !DILocalVariable(name: "s32MulTemp1", scope: !508, file: !70, line: 475, type: !78)
!514 = !DILocation(line: 475, column: 6, scope: !508)
!515 = !DILocalVariable(name: "s32MulTemp2", scope: !508, file: !70, line: 475, type: !78)
!516 = !DILocation(line: 475, column: 24, scope: !508)
!517 = !DILocation(line: 476, column: 16, scope: !508)
!518 = !DILocation(line: 476, column: 24, scope: !508)
!519 = !DILocation(line: 476, column: 22, scope: !508)
!520 = !DILocation(line: 476, column: 14, scope: !508)
!521 = !DILocation(line: 477, column: 16, scope: !508)
!522 = !DILocation(line: 477, column: 28, scope: !508)
!523 = !DILocation(line: 477, column: 14, scope: !508)
!524 = !DILocation(line: 478, column: 6, scope: !525)
!525 = distinct !DILexicalBlock(scope: !508, file: !70, line: 478, column: 5)
!526 = !DILocation(line: 478, column: 17, scope: !525)
!527 = !DILocation(line: 478, column: 21, scope: !525)
!528 = !DILocation(line: 478, column: 25, scope: !525)
!529 = !DILocation(line: 478, column: 37, scope: !525)
!530 = !DILocation(line: 478, column: 44, scope: !525)
!531 = !DILocation(line: 478, column: 5, scope: !508)
!532 = !DILocation(line: 484, column: 17, scope: !533)
!533 = distinct !DILexicalBlock(scope: !525, file: !70, line: 483, column: 2)
!534 = !DILocation(line: 484, column: 29, scope: !533)
!535 = !DILocation(line: 484, column: 15, scope: !533)
!536 = !DILocation(line: 485, column: 2, scope: !533)
!537 = !DILocation(line: 491, column: 6, scope: !538)
!538 = distinct !DILexicalBlock(scope: !508, file: !70, line: 491, column: 6)
!539 = !DILocation(line: 491, column: 18, scope: !538)
!540 = !DILocation(line: 491, column: 6, scope: !508)
!541 = !DILocation(line: 493, column: 6, scope: !542)
!542 = distinct !DILexicalBlock(scope: !543, file: !70, line: 493, column: 6)
!543 = distinct !DILexicalBlock(scope: !538, file: !70, line: 492, column: 2)
!544 = !DILocation(line: 493, column: 18, scope: !542)
!545 = !DILocation(line: 493, column: 6, scope: !543)
!546 = !DILocation(line: 495, column: 16, scope: !547)
!547 = distinct !DILexicalBlock(scope: !542, file: !70, line: 494, column: 3)
!548 = !DILocation(line: 495, column: 11, scope: !547)
!549 = !DILocation(line: 495, column: 4, scope: !547)
!550 = !DILocation(line: 499, column: 4, scope: !551)
!551 = distinct !DILexicalBlock(scope: !542, file: !70, line: 498, column: 3)
!552 = !DILocation(line: 504, column: 3, scope: !553)
!553 = distinct !DILexicalBlock(scope: !538, file: !70, line: 503, column: 2)
!554 = !DILocation(line: 506, column: 1, scope: !508)
!555 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !70, file: !70, line: 521, type: !388, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!556 = !DILocalVariable(name: "value", arg: 1, scope: !555, file: !70, line: 521, type: !13)
!557 = !DILocation(line: 521, column: 25, scope: !555)
!558 = !DILocalVariable(name: "factor", arg: 2, scope: !555, file: !70, line: 521, type: !22)
!559 = !DILocation(line: 521, column: 36, scope: !555)
!560 = !DILocalVariable(name: "s32MulTemp", scope: !555, file: !70, line: 523, type: !78)
!561 = !DILocation(line: 523, column: 6, scope: !555)
!562 = !DILocation(line: 524, column: 15, scope: !555)
!563 = !DILocation(line: 524, column: 23, scope: !555)
!564 = !DILocation(line: 524, column: 21, scope: !555)
!565 = !DILocation(line: 524, column: 13, scope: !555)
!566 = !DILocation(line: 525, column: 5, scope: !567)
!567 = distinct !DILexicalBlock(scope: !555, file: !70, line: 525, column: 5)
!568 = !DILocation(line: 525, column: 16, scope: !567)
!569 = !DILocation(line: 525, column: 5, scope: !555)
!570 = !DILocation(line: 527, column: 6, scope: !571)
!571 = distinct !DILexicalBlock(scope: !572, file: !70, line: 527, column: 6)
!572 = distinct !DILexicalBlock(scope: !567, file: !70, line: 526, column: 2)
!573 = !DILocation(line: 527, column: 17, scope: !571)
!574 = !DILocation(line: 527, column: 6, scope: !572)
!575 = !DILocation(line: 529, column: 16, scope: !576)
!576 = distinct !DILexicalBlock(scope: !571, file: !70, line: 528, column: 3)
!577 = !DILocation(line: 529, column: 11, scope: !576)
!578 = !DILocation(line: 529, column: 4, scope: !576)
!579 = !DILocation(line: 533, column: 4, scope: !580)
!580 = distinct !DILexicalBlock(scope: !571, file: !70, line: 532, column: 3)
!581 = !DILocation(line: 538, column: 3, scope: !582)
!582 = distinct !DILexicalBlock(scope: !567, file: !70, line: 537, column: 2)
!583 = !DILocation(line: 540, column: 1, scope: !555)
!584 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !70, file: !70, line: 556, type: !585, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!585 = !DISubroutineType(types: !586)
!586 = !{!13, !13, !22, !78}
!587 = !DILocalVariable(name: "value", arg: 1, scope: !584, file: !70, line: 556, type: !13)
!588 = !DILocation(line: 556, column: 40, scope: !584)
!589 = !DILocalVariable(name: "factor", arg: 2, scope: !584, file: !70, line: 556, type: !22)
!590 = !DILocation(line: 556, column: 50, scope: !584)
!591 = !DILocalVariable(name: "count", arg: 3, scope: !584, file: !70, line: 556, type: !78)
!592 = !DILocation(line: 556, column: 61, scope: !584)
!593 = !DILocalVariable(name: "s32MulTemp", scope: !584, file: !70, line: 558, type: !78)
!594 = !DILocation(line: 558, column: 6, scope: !584)
!595 = !DILocation(line: 559, column: 15, scope: !584)
!596 = !DILocation(line: 559, column: 23, scope: !584)
!597 = !DILocation(line: 559, column: 21, scope: !584)
!598 = !DILocation(line: 559, column: 13, scope: !584)
!599 = !DILocation(line: 560, column: 15, scope: !584)
!600 = !DILocation(line: 560, column: 26, scope: !584)
!601 = !DILocation(line: 560, column: 25, scope: !584)
!602 = !DILocation(line: 560, column: 13, scope: !584)
!603 = !DILocation(line: 561, column: 14, scope: !584)
!604 = !DILocation(line: 561, column: 9, scope: !584)
!605 = !DILocation(line: 561, column: 2, scope: !584)
!606 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !70, file: !70, line: 580, type: !607, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!607 = !DISubroutineType(types: !608)
!608 = !{!13, !13, !22, !22}
!609 = !DILocalVariable(name: "value", arg: 1, scope: !606, file: !70, line: 580, type: !13)
!610 = !DILocation(line: 580, column: 43, scope: !606)
!611 = !DILocalVariable(name: "factor", arg: 2, scope: !606, file: !70, line: 580, type: !22)
!612 = !DILocation(line: 580, column: 53, scope: !606)
!613 = !DILocalVariable(name: "count", arg: 3, scope: !606, file: !70, line: 580, type: !22)
!614 = !DILocation(line: 580, column: 64, scope: !606)
!615 = !DILocalVariable(name: "s32MulTemp", scope: !606, file: !70, line: 582, type: !78)
!616 = !DILocation(line: 582, column: 6, scope: !606)
!617 = !DILocation(line: 583, column: 15, scope: !606)
!618 = !DILocation(line: 583, column: 23, scope: !606)
!619 = !DILocation(line: 583, column: 21, scope: !606)
!620 = !DILocation(line: 583, column: 13, scope: !606)
!621 = !DILocation(line: 584, column: 15, scope: !606)
!622 = !DILocation(line: 584, column: 26, scope: !606)
!623 = !DILocation(line: 584, column: 25, scope: !606)
!624 = !DILocation(line: 584, column: 13, scope: !606)
!625 = !DILocation(line: 585, column: 5, scope: !626)
!626 = distinct !DILexicalBlock(scope: !606, file: !70, line: 585, column: 5)
!627 = !DILocation(line: 585, column: 16, scope: !626)
!628 = !DILocation(line: 585, column: 5, scope: !606)
!629 = !DILocation(line: 587, column: 6, scope: !630)
!630 = distinct !DILexicalBlock(scope: !631, file: !70, line: 587, column: 6)
!631 = distinct !DILexicalBlock(scope: !626, file: !70, line: 586, column: 2)
!632 = !DILocation(line: 587, column: 17, scope: !630)
!633 = !DILocation(line: 587, column: 6, scope: !631)
!634 = !DILocation(line: 589, column: 16, scope: !635)
!635 = distinct !DILexicalBlock(scope: !630, file: !70, line: 588, column: 3)
!636 = !DILocation(line: 589, column: 11, scope: !635)
!637 = !DILocation(line: 589, column: 4, scope: !635)
!638 = !DILocation(line: 593, column: 4, scope: !639)
!639 = distinct !DILexicalBlock(scope: !630, file: !70, line: 592, column: 3)
!640 = !DILocation(line: 598, column: 3, scope: !641)
!641 = distinct !DILexicalBlock(scope: !626, file: !70, line: 597, column: 2)
!642 = !DILocation(line: 600, column: 1, scope: !606)
!643 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !70, file: !70, line: 617, type: !388, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!644 = !DILocalVariable(name: "value", arg: 1, scope: !643, file: !70, line: 617, type: !13)
!645 = !DILocation(line: 617, column: 31, scope: !643)
!646 = !DILocalVariable(name: "factor", arg: 2, scope: !643, file: !70, line: 617, type: !22)
!647 = !DILocation(line: 617, column: 42, scope: !643)
!648 = !DILocalVariable(name: "s32MulTemp1", scope: !643, file: !70, line: 619, type: !78)
!649 = !DILocation(line: 619, column: 6, scope: !643)
!650 = !DILocalVariable(name: "s32MulTemp2", scope: !643, file: !70, line: 619, type: !78)
!651 = !DILocation(line: 619, column: 24, scope: !643)
!652 = !DILocation(line: 620, column: 16, scope: !643)
!653 = !DILocation(line: 620, column: 24, scope: !643)
!654 = !DILocation(line: 620, column: 22, scope: !643)
!655 = !DILocation(line: 620, column: 14, scope: !643)
!656 = !DILocation(line: 621, column: 16, scope: !643)
!657 = !DILocation(line: 621, column: 28, scope: !643)
!658 = !DILocation(line: 621, column: 14, scope: !643)
!659 = !DILocation(line: 622, column: 6, scope: !660)
!660 = distinct !DILexicalBlock(scope: !643, file: !70, line: 622, column: 5)
!661 = !DILocation(line: 622, column: 17, scope: !660)
!662 = !DILocation(line: 622, column: 21, scope: !660)
!663 = !DILocation(line: 622, column: 25, scope: !660)
!664 = !DILocation(line: 622, column: 37, scope: !660)
!665 = !DILocation(line: 622, column: 46, scope: !660)
!666 = !DILocation(line: 622, column: 5, scope: !643)
!667 = !DILocation(line: 629, column: 17, scope: !668)
!668 = distinct !DILexicalBlock(scope: !660, file: !70, line: 628, column: 2)
!669 = !DILocation(line: 629, column: 29, scope: !668)
!670 = !DILocation(line: 629, column: 15, scope: !668)
!671 = !DILocation(line: 630, column: 15, scope: !668)
!672 = !DILocation(line: 630, column: 10, scope: !668)
!673 = !DILocation(line: 630, column: 3, scope: !668)
!674 = !DILocation(line: 634, column: 15, scope: !675)
!675 = distinct !DILexicalBlock(scope: !660, file: !70, line: 633, column: 2)
!676 = !DILocation(line: 634, column: 10, scope: !675)
!677 = !DILocation(line: 634, column: 3, scope: !675)
!678 = !DILocation(line: 636, column: 1, scope: !643)
!679 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !70, file: !70, line: 654, type: !388, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!680 = !DILocalVariable(name: "value", arg: 1, scope: !679, file: !70, line: 654, type: !13)
!681 = !DILocation(line: 654, column: 31, scope: !679)
!682 = !DILocalVariable(name: "factor", arg: 2, scope: !679, file: !70, line: 654, type: !22)
!683 = !DILocation(line: 654, column: 42, scope: !679)
!684 = !DILocalVariable(name: "s32MulTemp1", scope: !679, file: !70, line: 656, type: !78)
!685 = !DILocation(line: 656, column: 6, scope: !679)
!686 = !DILocalVariable(name: "s32MulTemp2", scope: !679, file: !70, line: 656, type: !78)
!687 = !DILocation(line: 656, column: 24, scope: !679)
!688 = !DILocation(line: 657, column: 16, scope: !679)
!689 = !DILocation(line: 657, column: 24, scope: !679)
!690 = !DILocation(line: 657, column: 22, scope: !679)
!691 = !DILocation(line: 657, column: 14, scope: !679)
!692 = !DILocation(line: 658, column: 16, scope: !679)
!693 = !DILocation(line: 658, column: 28, scope: !679)
!694 = !DILocation(line: 658, column: 14, scope: !679)
!695 = !DILocation(line: 659, column: 6, scope: !696)
!696 = distinct !DILexicalBlock(scope: !679, file: !70, line: 659, column: 5)
!697 = !DILocation(line: 659, column: 17, scope: !696)
!698 = !DILocation(line: 659, column: 21, scope: !696)
!699 = !DILocation(line: 659, column: 25, scope: !696)
!700 = !DILocation(line: 659, column: 37, scope: !696)
!701 = !DILocation(line: 659, column: 46, scope: !696)
!702 = !DILocation(line: 659, column: 5, scope: !679)
!703 = !DILocation(line: 665, column: 17, scope: !704)
!704 = distinct !DILexicalBlock(scope: !696, file: !70, line: 664, column: 2)
!705 = !DILocation(line: 665, column: 29, scope: !704)
!706 = !DILocation(line: 665, column: 15, scope: !704)
!707 = !DILocation(line: 666, column: 2, scope: !704)
!708 = !DILocation(line: 672, column: 6, scope: !709)
!709 = distinct !DILexicalBlock(scope: !679, file: !70, line: 672, column: 6)
!710 = !DILocation(line: 672, column: 18, scope: !709)
!711 = !DILocation(line: 672, column: 6, scope: !679)
!712 = !DILocation(line: 674, column: 6, scope: !713)
!713 = distinct !DILexicalBlock(scope: !714, file: !70, line: 674, column: 6)
!714 = distinct !DILexicalBlock(scope: !709, file: !70, line: 673, column: 2)
!715 = !DILocation(line: 674, column: 18, scope: !713)
!716 = !DILocation(line: 674, column: 6, scope: !714)
!717 = !DILocation(line: 676, column: 16, scope: !718)
!718 = distinct !DILexicalBlock(scope: !713, file: !70, line: 675, column: 3)
!719 = !DILocation(line: 676, column: 11, scope: !718)
!720 = !DILocation(line: 676, column: 4, scope: !718)
!721 = !DILocation(line: 680, column: 4, scope: !722)
!722 = distinct !DILexicalBlock(scope: !713, file: !70, line: 679, column: 3)
!723 = !DILocation(line: 685, column: 3, scope: !724)
!724 = distinct !DILexicalBlock(scope: !709, file: !70, line: 684, column: 2)
!725 = !DILocation(line: 687, column: 1, scope: !679)
!726 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !70, file: !70, line: 704, type: !727, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!727 = !DISubroutineType(types: !728)
!728 = !{!13, !22, !22}
!729 = !DILocalVariable(name: "value", arg: 1, scope: !726, file: !70, line: 704, type: !22)
!730 = !DILocation(line: 704, column: 33, scope: !726)
!731 = !DILocalVariable(name: "factor", arg: 2, scope: !726, file: !70, line: 704, type: !22)
!732 = !DILocation(line: 704, column: 44, scope: !726)
!733 = !DILocalVariable(name: "u32MulTemp", scope: !726, file: !70, line: 706, type: !734)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !735)
!735 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !736)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !737)
!737 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!738 = !DILocation(line: 706, column: 6, scope: !726)
!739 = !DILocation(line: 707, column: 15, scope: !726)
!740 = !DILocation(line: 707, column: 23, scope: !726)
!741 = !DILocation(line: 707, column: 21, scope: !726)
!742 = !DILocation(line: 707, column: 13, scope: !726)
!743 = !DILocation(line: 708, column: 15, scope: !726)
!744 = !DILocation(line: 708, column: 26, scope: !726)
!745 = !DILocation(line: 708, column: 13, scope: !726)
!746 = !DILocation(line: 709, column: 5, scope: !747)
!747 = distinct !DILexicalBlock(scope: !726, file: !70, line: 709, column: 5)
!748 = !DILocation(line: 709, column: 16, scope: !747)
!749 = !DILocation(line: 709, column: 5, scope: !726)
!750 = !DILocation(line: 711, column: 15, scope: !751)
!751 = distinct !DILexicalBlock(scope: !747, file: !70, line: 710, column: 2)
!752 = !DILocation(line: 711, column: 10, scope: !751)
!753 = !DILocation(line: 711, column: 3, scope: !751)
!754 = !DILocation(line: 715, column: 3, scope: !755)
!755 = distinct !DILexicalBlock(scope: !747, file: !70, line: 714, column: 2)
!756 = !DILocation(line: 717, column: 1, scope: !726)
!757 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !70, file: !70, line: 732, type: !758, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!758 = !DISubroutineType(types: !759)
!759 = !{!78, !13, !22}
!760 = !DILocalVariable(name: "value", arg: 1, scope: !757, file: !70, line: 732, type: !13)
!761 = !DILocation(line: 732, column: 25, scope: !757)
!762 = !DILocalVariable(name: "factor", arg: 2, scope: !757, file: !70, line: 732, type: !22)
!763 = !DILocation(line: 732, column: 36, scope: !757)
!764 = !DILocalVariable(name: "s32MulTemp", scope: !757, file: !70, line: 734, type: !78)
!765 = !DILocation(line: 734, column: 6, scope: !757)
!766 = !DILocation(line: 735, column: 15, scope: !757)
!767 = !DILocation(line: 735, column: 23, scope: !757)
!768 = !DILocation(line: 735, column: 21, scope: !757)
!769 = !DILocation(line: 735, column: 13, scope: !757)
!770 = !DILocation(line: 736, column: 9, scope: !757)
!771 = !DILocation(line: 736, column: 2, scope: !757)
!772 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !70, file: !70, line: 752, type: !773, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!773 = !DISubroutineType(types: !774)
!774 = !{!78, !78, !22}
!775 = !DILocalVariable(name: "value", arg: 1, scope: !772, file: !70, line: 752, type: !78)
!776 = !DILocation(line: 752, column: 25, scope: !772)
!777 = !DILocalVariable(name: "factor", arg: 2, scope: !772, file: !70, line: 752, type: !22)
!778 = !DILocation(line: 752, column: 36, scope: !772)
!779 = !DILocalVariable(name: "s32Temp1", scope: !772, file: !70, line: 754, type: !78)
!780 = !DILocation(line: 754, column: 6, scope: !772)
!781 = !DILocalVariable(name: "s32Temp2", scope: !772, file: !70, line: 754, type: !78)
!782 = !DILocation(line: 754, column: 20, scope: !772)
!783 = !DILocalVariable(name: "s32Factor", scope: !772, file: !70, line: 754, type: !78)
!784 = !DILocation(line: 754, column: 44, scope: !772)
!785 = !DILocation(line: 755, column: 14, scope: !772)
!786 = !DILocation(line: 755, column: 12, scope: !772)
!787 = !DILocation(line: 756, column: 5, scope: !788)
!788 = distinct !DILexicalBlock(scope: !772, file: !70, line: 756, column: 5)
!789 = !DILocation(line: 756, column: 12, scope: !788)
!790 = !DILocation(line: 756, column: 5, scope: !772)
!791 = !DILocation(line: 758, column: 6, scope: !792)
!792 = distinct !DILexicalBlock(scope: !793, file: !70, line: 758, column: 6)
!793 = distinct !DILexicalBlock(scope: !788, file: !70, line: 757, column: 2)
!794 = !DILocation(line: 758, column: 12, scope: !792)
!795 = !DILocation(line: 758, column: 6, scope: !793)
!796 = !DILocation(line: 760, column: 15, scope: !797)
!797 = distinct !DILexicalBlock(scope: !792, file: !70, line: 759, column: 3)
!798 = !DILocation(line: 760, column: 26, scope: !797)
!799 = !DILocation(line: 760, column: 24, scope: !797)
!800 = !DILocation(line: 760, column: 13, scope: !797)
!801 = !DILocation(line: 761, column: 7, scope: !802)
!802 = distinct !DILexicalBlock(scope: !797, file: !70, line: 761, column: 7)
!803 = !DILocation(line: 761, column: 19, scope: !802)
!804 = !DILocation(line: 761, column: 16, scope: !802)
!805 = !DILocation(line: 761, column: 7, scope: !797)
!806 = !DILocation(line: 763, column: 5, scope: !807)
!807 = distinct !DILexicalBlock(scope: !802, file: !70, line: 762, column: 4)
!808 = !DILocation(line: 767, column: 13, scope: !809)
!809 = distinct !DILexicalBlock(scope: !802, file: !70, line: 766, column: 4)
!810 = !DILocation(line: 767, column: 19, scope: !809)
!811 = !DILocation(line: 767, column: 18, scope: !809)
!812 = !DILocation(line: 767, column: 5, scope: !809)
!813 = !DILocation(line: 772, column: 20, scope: !814)
!814 = distinct !DILexicalBlock(scope: !815, file: !70, line: 772, column: 7)
!815 = distinct !DILexicalBlock(scope: !792, file: !70, line: 771, column: 3)
!816 = !DILocation(line: 772, column: 19, scope: !814)
!817 = !DILocation(line: 772, column: 31, scope: !814)
!818 = !DILocation(line: 772, column: 28, scope: !814)
!819 = !DILocation(line: 772, column: 7, scope: !815)
!820 = !DILocation(line: 774, column: 5, scope: !821)
!821 = distinct !DILexicalBlock(scope: !814, file: !70, line: 773, column: 4)
!822 = !DILocation(line: 778, column: 13, scope: !823)
!823 = distinct !DILexicalBlock(scope: !814, file: !70, line: 777, column: 4)
!824 = !DILocation(line: 778, column: 19, scope: !823)
!825 = !DILocation(line: 778, column: 18, scope: !823)
!826 = !DILocation(line: 778, column: 5, scope: !823)
!827 = !DILocation(line: 784, column: 3, scope: !828)
!828 = distinct !DILexicalBlock(scope: !788, file: !70, line: 783, column: 2)
!829 = !DILocation(line: 786, column: 1, scope: !772)
!830 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !70, file: !70, line: 802, type: !831, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!831 = !DISubroutineType(types: !832)
!832 = !{!17, !17, !17, !22}
!833 = !DILocalVariable(name: "value", arg: 1, scope: !830, file: !70, line: 802, type: !17)
!834 = !DILocation(line: 802, column: 35, scope: !830)
!835 = !DILocalVariable(name: "factor", arg: 2, scope: !830, file: !70, line: 802, type: !17)
!836 = !DILocation(line: 802, column: 44, scope: !830)
!837 = !DILocalVariable(name: "count", arg: 3, scope: !830, file: !70, line: 802, type: !22)
!838 = !DILocation(line: 802, column: 55, scope: !830)
!839 = !DILocalVariable(name: "u16MulTemp", scope: !830, file: !70, line: 804, type: !22)
!840 = !DILocation(line: 804, column: 6, scope: !830)
!841 = !DILocation(line: 805, column: 15, scope: !830)
!842 = !DILocation(line: 805, column: 23, scope: !830)
!843 = !DILocation(line: 805, column: 21, scope: !830)
!844 = !DILocation(line: 805, column: 13, scope: !830)
!845 = !DILocation(line: 806, column: 15, scope: !830)
!846 = !DILocation(line: 806, column: 26, scope: !830)
!847 = !DILocation(line: 806, column: 25, scope: !830)
!848 = !DILocation(line: 806, column: 13, scope: !830)
!849 = !DILocation(line: 807, column: 13, scope: !830)
!850 = !DILocation(line: 807, column: 9, scope: !830)
!851 = !DILocation(line: 807, column: 2, scope: !830)
!852 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !70, file: !70, line: 824, type: !853, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!853 = !DISubroutineType(types: !854)
!854 = !{!17, !17, !17, !17}
!855 = !DILocalVariable(name: "value", arg: 1, scope: !852, file: !70, line: 824, type: !17)
!856 = !DILocation(line: 824, column: 38, scope: !852)
!857 = !DILocalVariable(name: "factor", arg: 2, scope: !852, file: !70, line: 824, type: !17)
!858 = !DILocation(line: 824, column: 47, scope: !852)
!859 = !DILocalVariable(name: "count", arg: 3, scope: !852, file: !70, line: 824, type: !17)
!860 = !DILocation(line: 824, column: 57, scope: !852)
!861 = !DILocalVariable(name: "u16MulTemp", scope: !852, file: !70, line: 826, type: !22)
!862 = !DILocation(line: 826, column: 6, scope: !852)
!863 = !DILocation(line: 827, column: 15, scope: !852)
!864 = !DILocation(line: 827, column: 23, scope: !852)
!865 = !DILocation(line: 827, column: 21, scope: !852)
!866 = !DILocation(line: 827, column: 13, scope: !852)
!867 = !DILocation(line: 828, column: 15, scope: !852)
!868 = !DILocation(line: 828, column: 26, scope: !852)
!869 = !DILocation(line: 828, column: 25, scope: !852)
!870 = !DILocation(line: 828, column: 13, scope: !852)
!871 = !DILocation(line: 829, column: 5, scope: !872)
!872 = distinct !DILexicalBlock(scope: !852, file: !70, line: 829, column: 5)
!873 = !DILocation(line: 829, column: 16, scope: !872)
!874 = !DILocation(line: 829, column: 5, scope: !852)
!875 = !DILocation(line: 831, column: 10, scope: !876)
!876 = distinct !DILexicalBlock(scope: !872, file: !70, line: 830, column: 2)
!877 = !DILocation(line: 831, column: 21, scope: !876)
!878 = !DILocation(line: 831, column: 3, scope: !876)
!879 = !DILocation(line: 835, column: 3, scope: !880)
!880 = distinct !DILexicalBlock(scope: !872, file: !70, line: 834, column: 2)
!881 = !DILocation(line: 837, column: 1, scope: !852)
!882 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !70, file: !70, line: 854, type: !883, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!883 = !DISubroutineType(types: !884)
!884 = !{!17, !17, !17}
!885 = !DILocalVariable(name: "x_value", arg: 1, scope: !882, file: !70, line: 854, type: !17)
!886 = !DILocation(line: 854, column: 25, scope: !882)
!887 = !DILocalVariable(name: "y_value", arg: 2, scope: !882, file: !70, line: 854, type: !17)
!888 = !DILocation(line: 854, column: 36, scope: !882)
!889 = !DILocalVariable(name: "u16MulTemp", scope: !882, file: !70, line: 856, type: !22)
!890 = !DILocation(line: 856, column: 6, scope: !882)
!891 = !DILocation(line: 857, column: 15, scope: !882)
!892 = !DILocation(line: 857, column: 25, scope: !882)
!893 = !DILocation(line: 857, column: 23, scope: !882)
!894 = !DILocation(line: 857, column: 13, scope: !882)
!895 = !DILocation(line: 858, column: 15, scope: !882)
!896 = !DILocation(line: 858, column: 26, scope: !882)
!897 = !DILocation(line: 858, column: 13, scope: !882)
!898 = !DILocation(line: 859, column: 13, scope: !882)
!899 = !DILocation(line: 859, column: 9, scope: !882)
!900 = !DILocation(line: 859, column: 2, scope: !882)
!901 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !70, file: !70, line: 878, type: !883, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!902 = !DILocalVariable(name: "value", arg: 1, scope: !901, file: !70, line: 878, type: !17)
!903 = !DILocation(line: 878, column: 26, scope: !901)
!904 = !DILocalVariable(name: "factor", arg: 2, scope: !901, file: !70, line: 878, type: !17)
!905 = !DILocation(line: 878, column: 36, scope: !901)
!906 = !DILocalVariable(name: "u16MulTemp", scope: !901, file: !70, line: 880, type: !22)
!907 = !DILocation(line: 880, column: 6, scope: !901)
!908 = !DILocation(line: 881, column: 15, scope: !901)
!909 = !DILocation(line: 881, column: 23, scope: !901)
!910 = !DILocation(line: 881, column: 21, scope: !901)
!911 = !DILocation(line: 881, column: 13, scope: !901)
!912 = !DILocation(line: 882, column: 15, scope: !901)
!913 = !DILocation(line: 882, column: 26, scope: !901)
!914 = !DILocation(line: 882, column: 13, scope: !901)
!915 = !DILocation(line: 883, column: 5, scope: !916)
!916 = distinct !DILexicalBlock(scope: !901, file: !70, line: 883, column: 5)
!917 = !DILocation(line: 883, column: 16, scope: !916)
!918 = !DILocation(line: 883, column: 5, scope: !901)
!919 = !DILocation(line: 885, column: 14, scope: !920)
!920 = distinct !DILexicalBlock(scope: !916, file: !70, line: 884, column: 2)
!921 = !DILocation(line: 885, column: 10, scope: !920)
!922 = !DILocation(line: 885, column: 3, scope: !920)
!923 = !DILocation(line: 889, column: 3, scope: !924)
!924 = distinct !DILexicalBlock(scope: !916, file: !70, line: 888, column: 2)
!925 = !DILocation(line: 891, column: 1, scope: !901)
!926 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !70, file: !70, line: 907, type: !927, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!927 = !DISubroutineType(types: !928)
!928 = !{!22, !22, !22}
!929 = !DILocalVariable(name: "value", arg: 1, scope: !926, file: !70, line: 907, type: !22)
!930 = !DILocation(line: 907, column: 39, scope: !926)
!931 = !DILocalVariable(name: "factor", arg: 2, scope: !926, file: !70, line: 907, type: !22)
!932 = !DILocation(line: 907, column: 49, scope: !926)
!933 = !DILocalVariable(name: "u32MulTemp", scope: !926, file: !70, line: 909, type: !734)
!934 = !DILocation(line: 909, column: 6, scope: !926)
!935 = !DILocation(line: 910, column: 15, scope: !926)
!936 = !DILocation(line: 910, column: 23, scope: !926)
!937 = !DILocation(line: 910, column: 21, scope: !926)
!938 = !DILocation(line: 910, column: 13, scope: !926)
!939 = !DILocation(line: 911, column: 15, scope: !926)
!940 = !DILocation(line: 911, column: 26, scope: !926)
!941 = !DILocation(line: 911, column: 13, scope: !926)
!942 = !DILocation(line: 912, column: 14, scope: !926)
!943 = !DILocation(line: 912, column: 9, scope: !926)
!944 = !DILocation(line: 912, column: 2, scope: !926)
!945 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !70, file: !70, line: 931, type: !927, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!946 = !DILocalVariable(name: "value", arg: 1, scope: !945, file: !70, line: 931, type: !22)
!947 = !DILocation(line: 931, column: 43, scope: !945)
!948 = !DILocalVariable(name: "factor", arg: 2, scope: !945, file: !70, line: 931, type: !22)
!949 = !DILocation(line: 931, column: 53, scope: !945)
!950 = !DILocalVariable(name: "u32MulTemp", scope: !945, file: !70, line: 933, type: !734)
!951 = !DILocation(line: 933, column: 6, scope: !945)
!952 = !DILocation(line: 934, column: 15, scope: !945)
!953 = !DILocation(line: 934, column: 23, scope: !945)
!954 = !DILocation(line: 934, column: 21, scope: !945)
!955 = !DILocation(line: 934, column: 13, scope: !945)
!956 = !DILocation(line: 935, column: 15, scope: !945)
!957 = !DILocation(line: 935, column: 26, scope: !945)
!958 = !DILocation(line: 935, column: 13, scope: !945)
!959 = !DILocation(line: 936, column: 5, scope: !960)
!960 = distinct !DILexicalBlock(scope: !945, file: !70, line: 936, column: 5)
!961 = !DILocation(line: 936, column: 16, scope: !960)
!962 = !DILocation(line: 936, column: 5, scope: !945)
!963 = !DILocation(line: 938, column: 11, scope: !964)
!964 = distinct !DILexicalBlock(scope: !960, file: !70, line: 937, column: 2)
!965 = !DILocation(line: 938, column: 22, scope: !964)
!966 = !DILocation(line: 938, column: 10, scope: !964)
!967 = !DILocation(line: 938, column: 3, scope: !964)
!968 = !DILocation(line: 942, column: 3, scope: !969)
!969 = distinct !DILexicalBlock(scope: !960, file: !70, line: 941, column: 2)
!970 = !DILocation(line: 944, column: 1, scope: !945)
!971 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !70, file: !70, line: 962, type: !972, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!972 = !DISubroutineType(types: !973)
!973 = !{!22, !22, !17}
!974 = !DILocalVariable(name: "x_value", arg: 1, scope: !971, file: !70, line: 962, type: !22)
!975 = !DILocation(line: 962, column: 29, scope: !971)
!976 = !DILocalVariable(name: "y_value", arg: 2, scope: !971, file: !70, line: 962, type: !17)
!977 = !DILocation(line: 962, column: 41, scope: !971)
!978 = !DILocalVariable(name: "u32MulTemp", scope: !971, file: !70, line: 964, type: !734)
!979 = !DILocation(line: 964, column: 6, scope: !971)
!980 = !DILocation(line: 965, column: 15, scope: !971)
!981 = !DILocation(line: 965, column: 25, scope: !971)
!982 = !DILocation(line: 965, column: 23, scope: !971)
!983 = !DILocation(line: 965, column: 13, scope: !971)
!984 = !DILocation(line: 966, column: 16, scope: !971)
!985 = !DILocation(line: 966, column: 27, scope: !971)
!986 = !DILocation(line: 966, column: 33, scope: !971)
!987 = !DILocation(line: 966, column: 13, scope: !971)
!988 = !DILocation(line: 967, column: 9, scope: !971)
!989 = !DILocation(line: 967, column: 2, scope: !971)
!990 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !70, file: !70, line: 986, type: !972, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!991 = !DILocalVariable(name: "x_value", arg: 1, scope: !990, file: !70, line: 986, type: !22)
!992 = !DILocation(line: 986, column: 29, scope: !990)
!993 = !DILocalVariable(name: "y_value", arg: 2, scope: !990, file: !70, line: 986, type: !17)
!994 = !DILocation(line: 986, column: 41, scope: !990)
!995 = !DILocalVariable(name: "u32MulTemp", scope: !990, file: !70, line: 988, type: !734)
!996 = !DILocation(line: 988, column: 6, scope: !990)
!997 = !DILocation(line: 989, column: 15, scope: !990)
!998 = !DILocation(line: 989, column: 25, scope: !990)
!999 = !DILocation(line: 989, column: 23, scope: !990)
!1000 = !DILocation(line: 989, column: 13, scope: !990)
!1001 = !DILocation(line: 990, column: 15, scope: !990)
!1002 = !DILocation(line: 990, column: 26, scope: !990)
!1003 = !DILocation(line: 990, column: 13, scope: !990)
!1004 = !DILocation(line: 991, column: 5, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !990, file: !70, line: 991, column: 5)
!1006 = !DILocation(line: 991, column: 16, scope: !1005)
!1007 = !DILocation(line: 991, column: 5, scope: !990)
!1008 = !DILocation(line: 993, column: 11, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1005, file: !70, line: 992, column: 2)
!1010 = !DILocation(line: 993, column: 22, scope: !1009)
!1011 = !DILocation(line: 993, column: 10, scope: !1009)
!1012 = !DILocation(line: 993, column: 3, scope: !1009)
!1013 = !DILocation(line: 997, column: 3, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1005, file: !70, line: 996, column: 2)
!1015 = !DILocation(line: 999, column: 1, scope: !990)
!1016 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !70, file: !70, line: 1015, type: !1017, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!22, !22, !22, !734}
!1019 = !DILocalVariable(name: "value", arg: 1, scope: !1016, file: !70, line: 1015, type: !22)
!1020 = !DILocation(line: 1015, column: 40, scope: !1016)
!1021 = !DILocalVariable(name: "factor", arg: 2, scope: !1016, file: !70, line: 1015, type: !22)
!1022 = !DILocation(line: 1015, column: 50, scope: !1016)
!1023 = !DILocalVariable(name: "count", arg: 3, scope: !1016, file: !70, line: 1015, type: !734)
!1024 = !DILocation(line: 1015, column: 61, scope: !1016)
!1025 = !DILocalVariable(name: "u32MulTemp", scope: !1016, file: !70, line: 1017, type: !734)
!1026 = !DILocation(line: 1017, column: 6, scope: !1016)
!1027 = !DILocation(line: 1018, column: 15, scope: !1016)
!1028 = !DILocation(line: 1018, column: 23, scope: !1016)
!1029 = !DILocation(line: 1018, column: 21, scope: !1016)
!1030 = !DILocation(line: 1018, column: 13, scope: !1016)
!1031 = !DILocation(line: 1019, column: 15, scope: !1016)
!1032 = !DILocation(line: 1019, column: 26, scope: !1016)
!1033 = !DILocation(line: 1019, column: 25, scope: !1016)
!1034 = !DILocation(line: 1019, column: 13, scope: !1016)
!1035 = !DILocation(line: 1020, column: 10, scope: !1016)
!1036 = !DILocation(line: 1020, column: 21, scope: !1016)
!1037 = !DILocation(line: 1020, column: 9, scope: !1016)
!1038 = !DILocation(line: 1020, column: 2, scope: !1016)
!1039 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !70, file: !70, line: 1038, type: !1040, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!22, !22, !22, !22}
!1042 = !DILocalVariable(name: "value", arg: 1, scope: !1039, file: !70, line: 1038, type: !22)
!1043 = !DILocation(line: 1038, column: 43, scope: !1039)
!1044 = !DILocalVariable(name: "factor", arg: 2, scope: !1039, file: !70, line: 1038, type: !22)
!1045 = !DILocation(line: 1038, column: 53, scope: !1039)
!1046 = !DILocalVariable(name: "count", arg: 3, scope: !1039, file: !70, line: 1038, type: !22)
!1047 = !DILocation(line: 1038, column: 64, scope: !1039)
!1048 = !DILocalVariable(name: "u32MulTemp", scope: !1039, file: !70, line: 1040, type: !734)
!1049 = !DILocation(line: 1040, column: 6, scope: !1039)
!1050 = !DILocation(line: 1041, column: 15, scope: !1039)
!1051 = !DILocation(line: 1041, column: 23, scope: !1039)
!1052 = !DILocation(line: 1041, column: 21, scope: !1039)
!1053 = !DILocation(line: 1041, column: 13, scope: !1039)
!1054 = !DILocation(line: 1042, column: 15, scope: !1039)
!1055 = !DILocation(line: 1042, column: 26, scope: !1039)
!1056 = !DILocation(line: 1042, column: 25, scope: !1039)
!1057 = !DILocation(line: 1042, column: 13, scope: !1039)
!1058 = !DILocation(line: 1043, column: 5, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1039, file: !70, line: 1043, column: 5)
!1060 = !DILocation(line: 1043, column: 16, scope: !1059)
!1061 = !DILocation(line: 1043, column: 5, scope: !1039)
!1062 = !DILocation(line: 1045, column: 11, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1059, file: !70, line: 1044, column: 2)
!1064 = !DILocation(line: 1045, column: 22, scope: !1063)
!1065 = !DILocation(line: 1045, column: 10, scope: !1063)
!1066 = !DILocation(line: 1045, column: 3, scope: !1063)
!1067 = !DILocation(line: 1049, column: 3, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1059, file: !70, line: 1048, column: 2)
!1069 = !DILocation(line: 1051, column: 1, scope: !1039)
!1070 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !70, file: !70, line: 1067, type: !927, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1071 = !DILocalVariable(name: "x_value", arg: 1, scope: !1070, file: !70, line: 1067, type: !22)
!1072 = !DILocation(line: 1067, column: 30, scope: !1070)
!1073 = !DILocalVariable(name: "y_value", arg: 2, scope: !1070, file: !70, line: 1067, type: !22)
!1074 = !DILocation(line: 1067, column: 42, scope: !1070)
!1075 = !DILocalVariable(name: "u32MulTemp", scope: !1070, file: !70, line: 1069, type: !734)
!1076 = !DILocation(line: 1069, column: 6, scope: !1070)
!1077 = !DILocation(line: 1070, column: 15, scope: !1070)
!1078 = !DILocation(line: 1070, column: 25, scope: !1070)
!1079 = !DILocation(line: 1070, column: 23, scope: !1070)
!1080 = !DILocation(line: 1070, column: 13, scope: !1070)
!1081 = !DILocation(line: 1071, column: 15, scope: !1070)
!1082 = !DILocation(line: 1071, column: 26, scope: !1070)
!1083 = !DILocation(line: 1071, column: 13, scope: !1070)
!1084 = !DILocation(line: 1072, column: 19, scope: !1070)
!1085 = !DILocation(line: 1072, column: 17, scope: !1070)
!1086 = !DILocation(line: 1072, column: 9, scope: !1070)
!1087 = !DILocation(line: 1072, column: 2, scope: !1070)
!1088 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !70, file: !70, line: 1091, type: !927, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1089 = !DILocalVariable(name: "x_value", arg: 1, scope: !1088, file: !70, line: 1091, type: !22)
!1090 = !DILocation(line: 1091, column: 30, scope: !1088)
!1091 = !DILocalVariable(name: "y_value", arg: 2, scope: !1088, file: !70, line: 1091, type: !22)
!1092 = !DILocation(line: 1091, column: 42, scope: !1088)
!1093 = !DILocalVariable(name: "u32MulTemp", scope: !1088, file: !70, line: 1093, type: !734)
!1094 = !DILocation(line: 1093, column: 6, scope: !1088)
!1095 = !DILocation(line: 1094, column: 15, scope: !1088)
!1096 = !DILocation(line: 1094, column: 25, scope: !1088)
!1097 = !DILocation(line: 1094, column: 23, scope: !1088)
!1098 = !DILocation(line: 1094, column: 13, scope: !1088)
!1099 = !DILocation(line: 1095, column: 15, scope: !1088)
!1100 = !DILocation(line: 1095, column: 26, scope: !1088)
!1101 = !DILocation(line: 1095, column: 13, scope: !1088)
!1102 = !DILocation(line: 1096, column: 5, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1088, file: !70, line: 1096, column: 5)
!1104 = !DILocation(line: 1096, column: 16, scope: !1103)
!1105 = !DILocation(line: 1096, column: 5, scope: !1088)
!1106 = !DILocation(line: 1098, column: 11, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1103, file: !70, line: 1097, column: 2)
!1108 = !DILocation(line: 1098, column: 22, scope: !1107)
!1109 = !DILocation(line: 1098, column: 10, scope: !1107)
!1110 = !DILocation(line: 1098, column: 3, scope: !1107)
!1111 = !DILocation(line: 1102, column: 3, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1103, file: !70, line: 1101, column: 2)
!1113 = !DILocation(line: 1104, column: 1, scope: !1088)
!1114 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !70, file: !70, line: 1119, type: !1115, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!734, !734, !22}
!1117 = !DILocalVariable(name: "x_value", arg: 1, scope: !1114, file: !70, line: 1119, type: !734)
!1118 = !DILocation(line: 1119, column: 26, scope: !1114)
!1119 = !DILocalVariable(name: "y_value", arg: 2, scope: !1114, file: !70, line: 1119, type: !22)
!1120 = !DILocation(line: 1119, column: 39, scope: !1114)
!1121 = !DILocalVariable(name: "u32Temp1", scope: !1114, file: !70, line: 1122, type: !734)
!1122 = !DILocation(line: 1122, column: 6, scope: !1114)
!1123 = !DILocation(line: 1123, column: 5, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1114, file: !70, line: 1123, column: 5)
!1125 = !DILocation(line: 1123, column: 13, scope: !1124)
!1126 = !DILocation(line: 1123, column: 5, scope: !1114)
!1127 = !DILocation(line: 1125, column: 26, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1124, file: !70, line: 1124, column: 2)
!1129 = !DILocation(line: 1125, column: 25, scope: !1128)
!1130 = !DILocation(line: 1125, column: 12, scope: !1128)
!1131 = !DILocation(line: 1126, column: 6, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1128, file: !70, line: 1126, column: 6)
!1133 = !DILocation(line: 1126, column: 17, scope: !1132)
!1134 = !DILocation(line: 1126, column: 15, scope: !1132)
!1135 = !DILocation(line: 1126, column: 6, scope: !1128)
!1136 = !DILocation(line: 1128, column: 4, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1132, file: !70, line: 1127, column: 3)
!1138 = !DILocation(line: 1132, column: 12, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1132, file: !70, line: 1131, column: 3)
!1140 = !DILocation(line: 1132, column: 22, scope: !1139)
!1141 = !DILocation(line: 1132, column: 20, scope: !1139)
!1142 = !DILocation(line: 1132, column: 4, scope: !1139)
!1143 = !DILocation(line: 1137, column: 3, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1124, file: !70, line: 1136, column: 2)
!1145 = !DILocation(line: 1140, column: 2, scope: !1114)
!1146 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !70, file: !70, line: 1157, type: !1147, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!734, !734, !22, !734}
!1149 = !DILocalVariable(name: "value", arg: 1, scope: !1146, file: !70, line: 1157, type: !734)
!1150 = !DILocation(line: 1157, column: 40, scope: !1146)
!1151 = !DILocalVariable(name: "factor", arg: 2, scope: !1146, file: !70, line: 1157, type: !22)
!1152 = !DILocation(line: 1157, column: 50, scope: !1146)
!1153 = !DILocalVariable(name: "count", arg: 3, scope: !1146, file: !70, line: 1157, type: !734)
!1154 = !DILocation(line: 1157, column: 62, scope: !1146)
!1155 = !DILocalVariable(name: "u32Temp1", scope: !1146, file: !70, line: 1159, type: !734)
!1156 = !DILocation(line: 1159, column: 6, scope: !1146)
!1157 = !DILocalVariable(name: "u32Temp2", scope: !1146, file: !70, line: 1159, type: !734)
!1158 = !DILocation(line: 1159, column: 20, scope: !1146)
!1159 = !DILocation(line: 1160, column: 13, scope: !1146)
!1160 = !DILocation(line: 1160, column: 21, scope: !1146)
!1161 = !DILocation(line: 1160, column: 19, scope: !1146)
!1162 = !DILocation(line: 1160, column: 11, scope: !1146)
!1163 = !DILocation(line: 1161, column: 25, scope: !1146)
!1164 = !DILocation(line: 1161, column: 32, scope: !1146)
!1165 = !DILocation(line: 1161, column: 13, scope: !1146)
!1166 = !DILocation(line: 1161, column: 11, scope: !1146)
!1167 = !DILocation(line: 1162, column: 13, scope: !1146)
!1168 = !DILocation(line: 1162, column: 25, scope: !1146)
!1169 = !DILocation(line: 1162, column: 22, scope: !1146)
!1170 = !DILocation(line: 1162, column: 11, scope: !1146)
!1171 = !DILocation(line: 1163, column: 14, scope: !1146)
!1172 = !DILocation(line: 1163, column: 30, scope: !1146)
!1173 = !DILocation(line: 1163, column: 29, scope: !1146)
!1174 = !DILocation(line: 1163, column: 23, scope: !1146)
!1175 = !DILocation(line: 1163, column: 11, scope: !1146)
!1176 = !DILocation(line: 1164, column: 6, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1146, file: !70, line: 1164, column: 5)
!1178 = !DILocation(line: 1164, column: 16, scope: !1177)
!1179 = !DILocation(line: 1164, column: 14, scope: !1177)
!1180 = !DILocation(line: 1164, column: 23, scope: !1177)
!1181 = !DILocation(line: 1164, column: 5, scope: !1146)
!1182 = !DILocation(line: 1166, column: 10, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1177, file: !70, line: 1165, column: 2)
!1184 = !DILocation(line: 1166, column: 3, scope: !1183)
!1185 = !DILocation(line: 1170, column: 3, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1177, file: !70, line: 1169, column: 2)
!1187 = !DILocation(line: 1172, column: 1, scope: !1146)
!1188 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !70, file: !70, line: 1188, type: !1189, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!17, !17, !17, !6}
!1191 = !DILocalVariable(name: "val1", arg: 1, scope: !1188, file: !70, line: 1188, type: !17)
!1192 = !DILocation(line: 1188, column: 25, scope: !1188)
!1193 = !DILocalVariable(name: "val2", arg: 2, scope: !1188, file: !70, line: 1188, type: !17)
!1194 = !DILocation(line: 1188, column: 34, scope: !1188)
!1195 = !DILocalVariable(name: "factor", arg: 3, scope: !1188, file: !70, line: 1188, type: !6)
!1196 = !DILocation(line: 1188, column: 43, scope: !1188)
!1197 = !DILocalVariable(name: "s16Temp1", scope: !1188, file: !70, line: 1190, type: !13)
!1198 = !DILocation(line: 1190, column: 6, scope: !1188)
!1199 = !DILocation(line: 1191, column: 15, scope: !1188)
!1200 = !DILocation(line: 1191, column: 22, scope: !1188)
!1201 = !DILocation(line: 1191, column: 20, scope: !1188)
!1202 = !DILocation(line: 1191, column: 28, scope: !1188)
!1203 = !DILocation(line: 1191, column: 27, scope: !1188)
!1204 = !DILocation(line: 1191, column: 35, scope: !1188)
!1205 = !DILocation(line: 1191, column: 39, scope: !1188)
!1206 = !DILocation(line: 1191, column: 38, scope: !1188)
!1207 = !DILocation(line: 1191, column: 13, scope: !1188)
!1208 = !DILocation(line: 1191, column: 11, scope: !1188)
!1209 = !DILocation(line: 1192, column: 5, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1188, file: !70, line: 1192, column: 5)
!1211 = !DILocation(line: 1192, column: 14, scope: !1210)
!1212 = !DILocation(line: 1192, column: 5, scope: !1188)
!1213 = !DILocation(line: 1194, column: 6, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1215, file: !70, line: 1194, column: 6)
!1215 = distinct !DILexicalBlock(scope: !1210, file: !70, line: 1193, column: 2)
!1216 = !DILocation(line: 1194, column: 15, scope: !1214)
!1217 = !DILocation(line: 1194, column: 6, scope: !1215)
!1218 = !DILocation(line: 1196, column: 15, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1214, file: !70, line: 1195, column: 3)
!1220 = !DILocation(line: 1196, column: 11, scope: !1219)
!1221 = !DILocation(line: 1196, column: 4, scope: !1219)
!1222 = !DILocation(line: 1200, column: 4, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1214, file: !70, line: 1199, column: 3)
!1224 = !DILocation(line: 1205, column: 3, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1210, file: !70, line: 1204, column: 2)
!1226 = !DILocation(line: 1208, column: 1, scope: !1188)
!1227 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !70, file: !70, line: 1224, type: !1228, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!22, !22, !22, !6}
!1230 = !DILocalVariable(name: "val1", arg: 1, scope: !1227, file: !70, line: 1224, type: !22)
!1231 = !DILocation(line: 1224, column: 30, scope: !1227)
!1232 = !DILocalVariable(name: "val2", arg: 2, scope: !1227, file: !70, line: 1224, type: !22)
!1233 = !DILocation(line: 1224, column: 40, scope: !1227)
!1234 = !DILocalVariable(name: "factor", arg: 3, scope: !1227, file: !70, line: 1224, type: !6)
!1235 = !DILocation(line: 1224, column: 49, scope: !1227)
!1236 = !DILocalVariable(name: "s32Temp1", scope: !1227, file: !70, line: 1226, type: !78)
!1237 = !DILocation(line: 1226, column: 6, scope: !1227)
!1238 = !DILocation(line: 1227, column: 15, scope: !1227)
!1239 = !DILocation(line: 1227, column: 22, scope: !1227)
!1240 = !DILocation(line: 1227, column: 20, scope: !1227)
!1241 = !DILocation(line: 1227, column: 28, scope: !1227)
!1242 = !DILocation(line: 1227, column: 27, scope: !1227)
!1243 = !DILocation(line: 1227, column: 35, scope: !1227)
!1244 = !DILocation(line: 1227, column: 39, scope: !1227)
!1245 = !DILocation(line: 1227, column: 38, scope: !1227)
!1246 = !DILocation(line: 1227, column: 11, scope: !1227)
!1247 = !DILocation(line: 1228, column: 5, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1227, file: !70, line: 1228, column: 5)
!1249 = !DILocation(line: 1228, column: 14, scope: !1248)
!1250 = !DILocation(line: 1228, column: 5, scope: !1227)
!1251 = !DILocation(line: 1230, column: 6, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1253, file: !70, line: 1230, column: 6)
!1253 = distinct !DILexicalBlock(scope: !1248, file: !70, line: 1229, column: 2)
!1254 = !DILocation(line: 1230, column: 15, scope: !1252)
!1255 = !DILocation(line: 1230, column: 6, scope: !1253)
!1256 = !DILocation(line: 1232, column: 16, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1252, file: !70, line: 1231, column: 3)
!1258 = !DILocation(line: 1232, column: 11, scope: !1257)
!1259 = !DILocation(line: 1232, column: 4, scope: !1257)
!1260 = !DILocation(line: 1236, column: 4, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1252, file: !70, line: 1235, column: 3)
!1262 = !DILocation(line: 1242, column: 3, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1248, file: !70, line: 1241, column: 2)
!1264 = !DILocation(line: 1244, column: 1, scope: !1227)
!1265 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !70, file: !70, line: 1259, type: !927, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1266 = !DILocalVariable(name: "val1", arg: 1, scope: !1265, file: !70, line: 1259, type: !22)
!1267 = !DILocation(line: 1259, column: 26, scope: !1265)
!1268 = !DILocalVariable(name: "val2", arg: 2, scope: !1265, file: !70, line: 1259, type: !22)
!1269 = !DILocation(line: 1259, column: 36, scope: !1265)
!1270 = !DILocalVariable(name: "u32Temp1", scope: !1265, file: !70, line: 1261, type: !734)
!1271 = !DILocation(line: 1261, column: 6, scope: !1265)
!1272 = !DILocation(line: 1262, column: 13, scope: !1265)
!1273 = !DILocation(line: 1262, column: 20, scope: !1265)
!1274 = !DILocation(line: 1262, column: 18, scope: !1265)
!1275 = !DILocation(line: 1262, column: 11, scope: !1265)
!1276 = !DILocation(line: 1263, column: 5, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1265, file: !70, line: 1263, column: 5)
!1278 = !DILocation(line: 1263, column: 14, scope: !1277)
!1279 = !DILocation(line: 1263, column: 5, scope: !1265)
!1280 = !DILocation(line: 1265, column: 11, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1277, file: !70, line: 1264, column: 2)
!1282 = !DILocation(line: 1265, column: 20, scope: !1281)
!1283 = !DILocation(line: 1265, column: 10, scope: !1281)
!1284 = !DILocation(line: 1265, column: 3, scope: !1281)
!1285 = !DILocation(line: 1269, column: 3, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1277, file: !70, line: 1268, column: 2)
!1287 = !DILocation(line: 1271, column: 1, scope: !1265)
!1288 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !70, file: !70, line: 1285, type: !1289, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1289 = !DISubroutineType(types: !1290)
!1290 = !{!734, !22, !22}
!1291 = !DILocalVariable(name: "x_value", arg: 1, scope: !1288, file: !70, line: 1285, type: !22)
!1292 = !DILocation(line: 1285, column: 25, scope: !1288)
!1293 = !DILocalVariable(name: "y_value", arg: 2, scope: !1288, file: !70, line: 1285, type: !22)
!1294 = !DILocation(line: 1285, column: 38, scope: !1288)
!1295 = !DILocalVariable(name: "u32Temp1", scope: !1288, file: !70, line: 1287, type: !734)
!1296 = !DILocation(line: 1287, column: 6, scope: !1288)
!1297 = !DILocation(line: 1288, column: 13, scope: !1288)
!1298 = !DILocation(line: 1288, column: 23, scope: !1288)
!1299 = !DILocation(line: 1288, column: 21, scope: !1288)
!1300 = !DILocation(line: 1288, column: 11, scope: !1288)
!1301 = !DILocation(line: 1289, column: 9, scope: !1288)
!1302 = !DILocation(line: 1289, column: 2, scope: !1288)
!1303 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !70, file: !70, line: 1307, type: !1304, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{!78, !13, !13}
!1306 = !DILocalVariable(name: "x_value", arg: 1, scope: !1303, file: !70, line: 1307, type: !13)
!1307 = !DILocation(line: 1307, column: 25, scope: !1303)
!1308 = !DILocalVariable(name: "y_value", arg: 2, scope: !1303, file: !70, line: 1307, type: !13)
!1309 = !DILocation(line: 1307, column: 38, scope: !1303)
!1310 = !DILocalVariable(name: "s32Temp1", scope: !1303, file: !70, line: 1309, type: !78)
!1311 = !DILocation(line: 1309, column: 6, scope: !1303)
!1312 = !DILocation(line: 1310, column: 13, scope: !1303)
!1313 = !DILocation(line: 1310, column: 23, scope: !1303)
!1314 = !DILocation(line: 1310, column: 21, scope: !1303)
!1315 = !DILocation(line: 1310, column: 11, scope: !1303)
!1316 = !DILocation(line: 1311, column: 9, scope: !1303)
!1317 = !DILocation(line: 1311, column: 2, scope: !1303)
!1318 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !70, file: !70, line: 1328, type: !1319, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!734, !734, !78}
!1321 = !DILocalVariable(name: "val1", arg: 1, scope: !1318, file: !70, line: 1328, type: !734)
!1322 = !DILocation(line: 1328, column: 25, scope: !1318)
!1323 = !DILocalVariable(name: "val2", arg: 2, scope: !1318, file: !70, line: 1328, type: !78)
!1324 = !DILocation(line: 1328, column: 35, scope: !1318)
!1325 = !DILocalVariable(name: "s32Temp1", scope: !1318, file: !70, line: 1330, type: !78)
!1326 = !DILocation(line: 1330, column: 6, scope: !1318)
!1327 = !DILocation(line: 1331, column: 5, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1318, file: !70, line: 1331, column: 5)
!1329 = !DILocation(line: 1331, column: 10, scope: !1328)
!1330 = !DILocation(line: 1331, column: 5, scope: !1318)
!1331 = !DILocation(line: 1333, column: 25, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1328, file: !70, line: 1332, column: 2)
!1333 = !DILocation(line: 1333, column: 24, scope: !1332)
!1334 = !DILocation(line: 1333, column: 12, scope: !1332)
!1335 = !DILocation(line: 1334, column: 6, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1332, file: !70, line: 1334, column: 6)
!1337 = !DILocation(line: 1334, column: 17, scope: !1336)
!1338 = !DILocation(line: 1334, column: 15, scope: !1336)
!1339 = !DILocation(line: 1334, column: 6, scope: !1332)
!1340 = !DILocation(line: 1336, column: 4, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1336, file: !70, line: 1335, column: 3)
!1342 = !DILocation(line: 1340, column: 12, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1336, file: !70, line: 1339, column: 3)
!1344 = !DILocation(line: 1340, column: 19, scope: !1343)
!1345 = !DILocation(line: 1340, column: 17, scope: !1343)
!1346 = !DILocation(line: 1340, column: 4, scope: !1343)
!1347 = !DILocation(line: 1345, column: 3, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1328, file: !70, line: 1344, column: 2)
!1349 = !DILocation(line: 1347, column: 1, scope: !1318)
!1350 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !70, file: !70, line: 1362, type: !1351, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1351 = !DISubroutineType(types: !1352)
!1352 = !{!734, !78, !78}
!1353 = !DILocalVariable(name: "val1", arg: 1, scope: !1350, file: !70, line: 1362, type: !78)
!1354 = !DILocation(line: 1362, column: 25, scope: !1350)
!1355 = !DILocalVariable(name: "val2", arg: 2, scope: !1350, file: !70, line: 1362, type: !78)
!1356 = !DILocation(line: 1362, column: 35, scope: !1350)
!1357 = !DILocalVariable(name: "u32Temp1", scope: !1350, file: !70, line: 1364, type: !734)
!1358 = !DILocation(line: 1364, column: 6, scope: !1350)
!1359 = !DILocalVariable(name: "u32Temp2", scope: !1350, file: !70, line: 1364, type: !734)
!1360 = !DILocation(line: 1364, column: 17, scope: !1350)
!1361 = !DILocalVariable(name: "u32Temp3", scope: !1350, file: !70, line: 1364, type: !734)
!1362 = !DILocation(line: 1364, column: 27, scope: !1350)
!1363 = !DILocalVariable(name: "u8SignBit", scope: !1350, file: !70, line: 1365, type: !17)
!1364 = !DILocation(line: 1365, column: 5, scope: !1350)
!1365 = !DILocation(line: 1367, column: 5, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1350, file: !70, line: 1367, column: 5)
!1367 = !DILocation(line: 1367, column: 9, scope: !1366)
!1368 = !DILocation(line: 1367, column: 5, scope: !1350)
!1369 = !DILocation(line: 1368, column: 15, scope: !1366)
!1370 = !DILocation(line: 1368, column: 14, scope: !1366)
!1371 = !DILocation(line: 1368, column: 12, scope: !1366)
!1372 = !DILocation(line: 1368, column: 3, scope: !1366)
!1373 = !DILocation(line: 1370, column: 14, scope: !1366)
!1374 = !DILocation(line: 1370, column: 12, scope: !1366)
!1375 = !DILocation(line: 1372, column: 5, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1350, file: !70, line: 1372, column: 5)
!1377 = !DILocation(line: 1372, column: 9, scope: !1376)
!1378 = !DILocation(line: 1372, column: 5, scope: !1350)
!1379 = !DILocation(line: 1373, column: 15, scope: !1376)
!1380 = !DILocation(line: 1373, column: 14, scope: !1376)
!1381 = !DILocation(line: 1373, column: 12, scope: !1376)
!1382 = !DILocation(line: 1373, column: 3, scope: !1376)
!1383 = !DILocation(line: 1375, column: 14, scope: !1376)
!1384 = !DILocation(line: 1375, column: 12, scope: !1376)
!1385 = !DILocation(line: 1377, column: 6, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1350, file: !70, line: 1377, column: 5)
!1387 = !DILocation(line: 1377, column: 10, scope: !1386)
!1388 = !DILocation(line: 1377, column: 13, scope: !1386)
!1389 = !DILocation(line: 1377, column: 28, scope: !1386)
!1390 = !DILocation(line: 1377, column: 32, scope: !1386)
!1391 = !DILocation(line: 1377, column: 35, scope: !1386)
!1392 = !DILocation(line: 1378, column: 12, scope: !1386)
!1393 = !DILocation(line: 1378, column: 3, scope: !1386)
!1394 = !DILocation(line: 1380, column: 12, scope: !1386)
!1395 = !DILocation(line: 1381, column: 29, scope: !1350)
!1396 = !DILocation(line: 1381, column: 38, scope: !1350)
!1397 = !DILocation(line: 1381, column: 13, scope: !1350)
!1398 = !DILocation(line: 1381, column: 11, scope: !1350)
!1399 = !DILocation(line: 1383, column: 5, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1350, file: !70, line: 1383, column: 5)
!1401 = !DILocation(line: 1383, column: 14, scope: !1400)
!1402 = !DILocation(line: 1383, column: 5, scope: !1350)
!1403 = !DILocation(line: 1385, column: 3, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1400, file: !70, line: 1384, column: 2)
!1405 = !DILocation(line: 1389, column: 10, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1400, file: !70, line: 1388, column: 2)
!1407 = !DILocation(line: 1389, column: 3, scope: !1406)
!1408 = !DILocation(line: 1440, column: 1, scope: !1350)
!1409 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !70, file: !70, line: 1455, type: !1410, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{!734, !734, !734}
!1412 = !DILocalVariable(name: "val1", arg: 1, scope: !1409, file: !70, line: 1455, type: !734)
!1413 = !DILocation(line: 1455, column: 25, scope: !1409)
!1414 = !DILocalVariable(name: "val2", arg: 2, scope: !1409, file: !70, line: 1455, type: !734)
!1415 = !DILocation(line: 1455, column: 35, scope: !1409)
!1416 = !DILocalVariable(name: "u32Temp1", scope: !1409, file: !70, line: 1457, type: !734)
!1417 = !DILocation(line: 1457, column: 6, scope: !1409)
!1418 = !DILocation(line: 1458, column: 5, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1409, file: !70, line: 1458, column: 5)
!1420 = !DILocation(line: 1458, column: 10, scope: !1419)
!1421 = !DILocation(line: 1458, column: 5, scope: !1409)
!1422 = !DILocation(line: 1460, column: 26, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1419, file: !70, line: 1459, column: 2)
!1424 = !DILocation(line: 1460, column: 25, scope: !1423)
!1425 = !DILocation(line: 1460, column: 12, scope: !1423)
!1426 = !DILocation(line: 1461, column: 6, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1423, file: !70, line: 1461, column: 6)
!1428 = !DILocation(line: 1461, column: 17, scope: !1427)
!1429 = !DILocation(line: 1461, column: 15, scope: !1427)
!1430 = !DILocation(line: 1461, column: 6, scope: !1423)
!1431 = !DILocation(line: 1463, column: 4, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1427, file: !70, line: 1462, column: 3)
!1433 = !DILocation(line: 1467, column: 12, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1427, file: !70, line: 1466, column: 3)
!1435 = !DILocation(line: 1467, column: 19, scope: !1434)
!1436 = !DILocation(line: 1467, column: 17, scope: !1434)
!1437 = !DILocation(line: 1467, column: 4, scope: !1434)
!1438 = !DILocation(line: 1472, column: 3, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1419, file: !70, line: 1471, column: 2)
!1440 = !DILocation(line: 1474, column: 1, scope: !1409)
!1441 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !70, file: !70, line: 1501, type: !1115, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1442 = !DILocalVariable(name: "value", arg: 1, scope: !1441, file: !70, line: 1501, type: !734)
!1443 = !DILocation(line: 1501, column: 30, scope: !1441)
!1444 = !DILocalVariable(name: "factor", arg: 2, scope: !1441, file: !70, line: 1501, type: !22)
!1445 = !DILocation(line: 1501, column: 41, scope: !1441)
!1446 = !DILocalVariable(name: "u32Temp1", scope: !1441, file: !70, line: 1503, type: !734)
!1447 = !DILocation(line: 1503, column: 6, scope: !1441)
!1448 = !DILocalVariable(name: "u32Temp2", scope: !1441, file: !70, line: 1503, type: !734)
!1449 = !DILocation(line: 1503, column: 20, scope: !1441)
!1450 = !DILocation(line: 1504, column: 13, scope: !1441)
!1451 = !DILocation(line: 1504, column: 21, scope: !1441)
!1452 = !DILocation(line: 1504, column: 19, scope: !1441)
!1453 = !DILocation(line: 1504, column: 11, scope: !1441)
!1454 = !DILocation(line: 1505, column: 25, scope: !1441)
!1455 = !DILocation(line: 1505, column: 32, scope: !1441)
!1456 = !DILocation(line: 1505, column: 13, scope: !1441)
!1457 = !DILocation(line: 1505, column: 11, scope: !1441)
!1458 = !DILocation(line: 1506, column: 14, scope: !1441)
!1459 = !DILocation(line: 1506, column: 23, scope: !1441)
!1460 = !DILocation(line: 1506, column: 11, scope: !1441)
!1461 = !DILocation(line: 1507, column: 14, scope: !1441)
!1462 = !DILocation(line: 1507, column: 23, scope: !1441)
!1463 = !DILocation(line: 1507, column: 11, scope: !1441)
!1464 = !DILocation(line: 1508, column: 9, scope: !1441)
!1465 = !DILocation(line: 1508, column: 2, scope: !1441)
!1466 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !70, file: !70, line: 1527, type: !1115, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1467 = !DILocalVariable(name: "value", arg: 1, scope: !1466, file: !70, line: 1527, type: !734)
!1468 = !DILocation(line: 1527, column: 30, scope: !1466)
!1469 = !DILocalVariable(name: "factor", arg: 2, scope: !1466, file: !70, line: 1527, type: !22)
!1470 = !DILocation(line: 1527, column: 41, scope: !1466)
!1471 = !DILocalVariable(name: "u32Temp1", scope: !1466, file: !70, line: 1529, type: !734)
!1472 = !DILocation(line: 1529, column: 6, scope: !1466)
!1473 = !DILocalVariable(name: "u32Temp2", scope: !1466, file: !70, line: 1529, type: !734)
!1474 = !DILocation(line: 1529, column: 20, scope: !1466)
!1475 = !DILocation(line: 1530, column: 13, scope: !1466)
!1476 = !DILocation(line: 1530, column: 21, scope: !1466)
!1477 = !DILocation(line: 1530, column: 19, scope: !1466)
!1478 = !DILocation(line: 1530, column: 11, scope: !1466)
!1479 = !DILocation(line: 1531, column: 25, scope: !1466)
!1480 = !DILocation(line: 1531, column: 32, scope: !1466)
!1481 = !DILocation(line: 1531, column: 13, scope: !1466)
!1482 = !DILocation(line: 1531, column: 11, scope: !1466)
!1483 = !DILocation(line: 1532, column: 13, scope: !1466)
!1484 = !DILocation(line: 1532, column: 22, scope: !1466)
!1485 = !DILocation(line: 1532, column: 11, scope: !1466)
!1486 = !DILocation(line: 1533, column: 14, scope: !1466)
!1487 = !DILocation(line: 1533, column: 23, scope: !1466)
!1488 = !DILocation(line: 1533, column: 11, scope: !1466)
!1489 = !DILocation(line: 1534, column: 6, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1466, file: !70, line: 1534, column: 5)
!1491 = !DILocation(line: 1534, column: 14, scope: !1490)
!1492 = !DILocation(line: 1534, column: 20, scope: !1490)
!1493 = !DILocation(line: 1534, column: 5, scope: !1466)
!1494 = !DILocation(line: 1536, column: 10, scope: !1495)
!1495 = distinct !DILexicalBlock(scope: !1490, file: !70, line: 1535, column: 2)
!1496 = !DILocation(line: 1536, column: 3, scope: !1495)
!1497 = !DILocation(line: 1540, column: 3, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1490, file: !70, line: 1539, column: 2)
!1499 = !DILocation(line: 1542, column: 1, scope: !1466)
!1500 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !70, file: !70, line: 1560, type: !1501, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1501 = !DISubroutineType(types: !1502)
!1502 = !{!734, !734, !13}
!1503 = !DILocalVariable(name: "value", arg: 1, scope: !1500, file: !70, line: 1560, type: !734)
!1504 = !DILocation(line: 1560, column: 30, scope: !1500)
!1505 = !DILocalVariable(name: "factor", arg: 2, scope: !1500, file: !70, line: 1560, type: !13)
!1506 = !DILocation(line: 1560, column: 41, scope: !1500)
!1507 = !DILocalVariable(name: "u32Temp1", scope: !1500, file: !70, line: 1562, type: !734)
!1508 = !DILocation(line: 1562, column: 6, scope: !1500)
!1509 = !DILocalVariable(name: "u32Temp2", scope: !1500, file: !70, line: 1562, type: !734)
!1510 = !DILocation(line: 1562, column: 20, scope: !1500)
!1511 = !DILocation(line: 1563, column: 5, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1500, file: !70, line: 1563, column: 5)
!1513 = !DILocation(line: 1563, column: 12, scope: !1512)
!1514 = !DILocation(line: 1563, column: 5, scope: !1500)
!1515 = !DILocation(line: 1566, column: 14, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1512, file: !70, line: 1564, column: 2)
!1517 = !DILocation(line: 1566, column: 22, scope: !1516)
!1518 = !DILocation(line: 1566, column: 20, scope: !1516)
!1519 = !DILocation(line: 1566, column: 12, scope: !1516)
!1520 = !DILocation(line: 1567, column: 26, scope: !1516)
!1521 = !DILocation(line: 1567, column: 33, scope: !1516)
!1522 = !DILocation(line: 1567, column: 14, scope: !1516)
!1523 = !DILocation(line: 1567, column: 12, scope: !1516)
!1524 = !DILocation(line: 1568, column: 14, scope: !1516)
!1525 = !DILocation(line: 1568, column: 23, scope: !1516)
!1526 = !DILocation(line: 1568, column: 12, scope: !1516)
!1527 = !DILocation(line: 1569, column: 15, scope: !1516)
!1528 = !DILocation(line: 1569, column: 24, scope: !1516)
!1529 = !DILocation(line: 1569, column: 12, scope: !1516)
!1530 = !DILocation(line: 1570, column: 10, scope: !1516)
!1531 = !DILocation(line: 1570, column: 3, scope: !1516)
!1532 = !DILocation(line: 1574, column: 3, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1512, file: !70, line: 1573, column: 2)
!1534 = !DILocation(line: 1576, column: 1, scope: !1500)
!1535 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !70, file: !70, line: 1595, type: !1501, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1536 = !DILocalVariable(name: "value", arg: 1, scope: !1535, file: !70, line: 1595, type: !734)
!1537 = !DILocation(line: 1595, column: 31, scope: !1535)
!1538 = !DILocalVariable(name: "factor", arg: 2, scope: !1535, file: !70, line: 1595, type: !13)
!1539 = !DILocation(line: 1595, column: 42, scope: !1535)
!1540 = !DILocalVariable(name: "u32Temp1", scope: !1535, file: !70, line: 1597, type: !734)
!1541 = !DILocation(line: 1597, column: 6, scope: !1535)
!1542 = !DILocalVariable(name: "u32Temp2", scope: !1535, file: !70, line: 1597, type: !734)
!1543 = !DILocation(line: 1597, column: 20, scope: !1535)
!1544 = !DILocation(line: 1598, column: 5, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1535, file: !70, line: 1598, column: 5)
!1546 = !DILocation(line: 1598, column: 12, scope: !1545)
!1547 = !DILocation(line: 1598, column: 5, scope: !1535)
!1548 = !DILocation(line: 1600, column: 3, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1545, file: !70, line: 1599, column: 2)
!1550 = !DILocation(line: 1604, column: 14, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1545, file: !70, line: 1603, column: 2)
!1552 = !DILocation(line: 1604, column: 22, scope: !1551)
!1553 = !DILocation(line: 1604, column: 20, scope: !1551)
!1554 = !DILocation(line: 1604, column: 12, scope: !1551)
!1555 = !DILocation(line: 1605, column: 26, scope: !1551)
!1556 = !DILocation(line: 1605, column: 33, scope: !1551)
!1557 = !DILocation(line: 1605, column: 14, scope: !1551)
!1558 = !DILocation(line: 1605, column: 12, scope: !1551)
!1559 = !DILocation(line: 1606, column: 14, scope: !1551)
!1560 = !DILocation(line: 1606, column: 23, scope: !1551)
!1561 = !DILocation(line: 1606, column: 12, scope: !1551)
!1562 = !DILocation(line: 1607, column: 15, scope: !1551)
!1563 = !DILocation(line: 1607, column: 24, scope: !1551)
!1564 = !DILocation(line: 1607, column: 12, scope: !1551)
!1565 = !DILocation(line: 1608, column: 7, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1551, file: !70, line: 1608, column: 6)
!1567 = !DILocation(line: 1608, column: 16, scope: !1566)
!1568 = !DILocation(line: 1608, column: 23, scope: !1566)
!1569 = !DILocation(line: 1608, column: 6, scope: !1551)
!1570 = !DILocation(line: 1610, column: 11, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1566, file: !70, line: 1609, column: 3)
!1572 = !DILocation(line: 1610, column: 4, scope: !1571)
!1573 = !DILocation(line: 1614, column: 4, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1566, file: !70, line: 1613, column: 3)
!1575 = !DILocation(line: 1617, column: 1, scope: !1535)
!1576 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !70, file: !70, line: 1632, type: !1410, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1577 = !DILocalVariable(name: "value", arg: 1, scope: !1576, file: !70, line: 1632, type: !734)
!1578 = !DILocation(line: 1632, column: 30, scope: !1576)
!1579 = !DILocalVariable(name: "factor", arg: 2, scope: !1576, file: !70, line: 1632, type: !734)
!1580 = !DILocation(line: 1632, column: 40, scope: !1576)
!1581 = !DILocation(line: 1634, column: 21, scope: !1576)
!1582 = !DILocation(line: 1634, column: 28, scope: !1576)
!1583 = !DILocation(line: 1634, column: 9, scope: !1576)
!1584 = !DILocation(line: 1634, column: 2, scope: !1576)
!1585 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !70, file: !70, line: 1653, type: !1410, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1586 = !DILocalVariable(name: "value", arg: 1, scope: !1585, file: !70, line: 1653, type: !734)
!1587 = !DILocation(line: 1653, column: 30, scope: !1585)
!1588 = !DILocalVariable(name: "factor", arg: 2, scope: !1585, file: !70, line: 1653, type: !734)
!1589 = !DILocation(line: 1653, column: 40, scope: !1585)
!1590 = !DILocalVariable(name: "u32Temp1", scope: !1585, file: !70, line: 1655, type: !734)
!1591 = !DILocation(line: 1655, column: 6, scope: !1585)
!1592 = !DILocalVariable(name: "u32Temp2", scope: !1585, file: !70, line: 1655, type: !734)
!1593 = !DILocation(line: 1655, column: 20, scope: !1585)
!1594 = !DILocation(line: 1656, column: 13, scope: !1585)
!1595 = !DILocation(line: 1656, column: 21, scope: !1585)
!1596 = !DILocation(line: 1656, column: 19, scope: !1585)
!1597 = !DILocation(line: 1656, column: 11, scope: !1585)
!1598 = !DILocation(line: 1657, column: 25, scope: !1585)
!1599 = !DILocation(line: 1657, column: 32, scope: !1585)
!1600 = !DILocation(line: 1657, column: 13, scope: !1585)
!1601 = !DILocation(line: 1657, column: 11, scope: !1585)
!1602 = !DILocation(line: 1658, column: 13, scope: !1585)
!1603 = !DILocation(line: 1658, column: 22, scope: !1585)
!1604 = !DILocation(line: 1658, column: 11, scope: !1585)
!1605 = !DILocation(line: 1659, column: 14, scope: !1585)
!1606 = !DILocation(line: 1659, column: 23, scope: !1585)
!1607 = !DILocation(line: 1659, column: 11, scope: !1585)
!1608 = !DILocation(line: 1660, column: 6, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1585, file: !70, line: 1660, column: 5)
!1610 = !DILocation(line: 1660, column: 14, scope: !1609)
!1611 = !DILocation(line: 1660, column: 20, scope: !1609)
!1612 = !DILocation(line: 1660, column: 5, scope: !1585)
!1613 = !DILocation(line: 1662, column: 10, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1609, file: !70, line: 1661, column: 2)
!1615 = !DILocation(line: 1662, column: 3, scope: !1614)
!1616 = !DILocation(line: 1666, column: 3, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1609, file: !70, line: 1665, column: 2)
!1618 = !DILocation(line: 1668, column: 1, scope: !1585)
!1619 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !70, file: !70, line: 1686, type: !1319, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1620 = !DILocalVariable(name: "value", arg: 1, scope: !1619, file: !70, line: 1686, type: !734)
!1621 = !DILocation(line: 1686, column: 30, scope: !1619)
!1622 = !DILocalVariable(name: "factor", arg: 2, scope: !1619, file: !70, line: 1686, type: !78)
!1623 = !DILocation(line: 1686, column: 40, scope: !1619)
!1624 = !DILocalVariable(name: "u32Temp1", scope: !1619, file: !70, line: 1688, type: !734)
!1625 = !DILocation(line: 1688, column: 6, scope: !1619)
!1626 = !DILocalVariable(name: "u32Temp2", scope: !1619, file: !70, line: 1688, type: !734)
!1627 = !DILocation(line: 1688, column: 20, scope: !1619)
!1628 = !DILocation(line: 1689, column: 5, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1619, file: !70, line: 1689, column: 5)
!1630 = !DILocation(line: 1689, column: 12, scope: !1629)
!1631 = !DILocation(line: 1689, column: 5, scope: !1619)
!1632 = !DILocation(line: 1691, column: 14, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1629, file: !70, line: 1690, column: 2)
!1634 = !DILocation(line: 1691, column: 22, scope: !1633)
!1635 = !DILocation(line: 1691, column: 20, scope: !1633)
!1636 = !DILocation(line: 1691, column: 12, scope: !1633)
!1637 = !DILocation(line: 1692, column: 26, scope: !1633)
!1638 = !DILocation(line: 1692, column: 33, scope: !1633)
!1639 = !DILocation(line: 1692, column: 14, scope: !1633)
!1640 = !DILocation(line: 1692, column: 12, scope: !1633)
!1641 = !DILocation(line: 1693, column: 14, scope: !1633)
!1642 = !DILocation(line: 1693, column: 23, scope: !1633)
!1643 = !DILocation(line: 1693, column: 12, scope: !1633)
!1644 = !DILocation(line: 1694, column: 15, scope: !1633)
!1645 = !DILocation(line: 1694, column: 24, scope: !1633)
!1646 = !DILocation(line: 1694, column: 12, scope: !1633)
!1647 = !DILocation(line: 1695, column: 10, scope: !1633)
!1648 = !DILocation(line: 1695, column: 3, scope: !1633)
!1649 = !DILocation(line: 1699, column: 3, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1629, file: !70, line: 1698, column: 2)
!1651 = !DILocation(line: 1701, column: 1, scope: !1619)
!1652 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !70, file: !70, line: 1720, type: !1319, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1653 = !DILocalVariable(name: "value", arg: 1, scope: !1652, file: !70, line: 1720, type: !734)
!1654 = !DILocation(line: 1720, column: 30, scope: !1652)
!1655 = !DILocalVariable(name: "factor", arg: 2, scope: !1652, file: !70, line: 1720, type: !78)
!1656 = !DILocation(line: 1720, column: 40, scope: !1652)
!1657 = !DILocalVariable(name: "u32Temp1", scope: !1652, file: !70, line: 1722, type: !734)
!1658 = !DILocation(line: 1722, column: 6, scope: !1652)
!1659 = !DILocalVariable(name: "u32Temp2", scope: !1652, file: !70, line: 1722, type: !734)
!1660 = !DILocation(line: 1722, column: 20, scope: !1652)
!1661 = !DILocation(line: 1723, column: 5, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1652, file: !70, line: 1723, column: 5)
!1663 = !DILocation(line: 1723, column: 12, scope: !1662)
!1664 = !DILocation(line: 1723, column: 5, scope: !1652)
!1665 = !DILocation(line: 1725, column: 3, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1662, file: !70, line: 1724, column: 2)
!1667 = !DILocation(line: 1729, column: 14, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1662, file: !70, line: 1728, column: 2)
!1669 = !DILocation(line: 1729, column: 22, scope: !1668)
!1670 = !DILocation(line: 1729, column: 20, scope: !1668)
!1671 = !DILocation(line: 1729, column: 12, scope: !1668)
!1672 = !DILocation(line: 1730, column: 26, scope: !1668)
!1673 = !DILocation(line: 1730, column: 33, scope: !1668)
!1674 = !DILocation(line: 1730, column: 14, scope: !1668)
!1675 = !DILocation(line: 1730, column: 12, scope: !1668)
!1676 = !DILocation(line: 1731, column: 14, scope: !1668)
!1677 = !DILocation(line: 1731, column: 23, scope: !1668)
!1678 = !DILocation(line: 1731, column: 12, scope: !1668)
!1679 = !DILocation(line: 1732, column: 15, scope: !1668)
!1680 = !DILocation(line: 1732, column: 24, scope: !1668)
!1681 = !DILocation(line: 1732, column: 12, scope: !1668)
!1682 = !DILocation(line: 1733, column: 7, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1668, file: !70, line: 1733, column: 6)
!1684 = !DILocation(line: 1733, column: 15, scope: !1683)
!1685 = !DILocation(line: 1733, column: 21, scope: !1683)
!1686 = !DILocation(line: 1733, column: 6, scope: !1668)
!1687 = !DILocation(line: 1735, column: 11, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1683, file: !70, line: 1734, column: 3)
!1689 = !DILocation(line: 1735, column: 4, scope: !1688)
!1690 = !DILocation(line: 1739, column: 4, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1683, file: !70, line: 1738, column: 3)
!1692 = !DILocation(line: 1742, column: 1, scope: !1652)
!1693 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !70, file: !70, line: 1757, type: !1694, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1694 = !DISubroutineType(types: !1695)
!1695 = !{!78, !734, !78}
!1696 = !DILocalVariable(name: "val1", arg: 1, scope: !1693, file: !70, line: 1757, type: !734)
!1697 = !DILocation(line: 1757, column: 25, scope: !1693)
!1698 = !DILocalVariable(name: "val2", arg: 2, scope: !1693, file: !70, line: 1757, type: !78)
!1699 = !DILocation(line: 1757, column: 35, scope: !1693)
!1700 = !DILocalVariable(name: "s32Val2prime", scope: !1693, file: !70, line: 1759, type: !78)
!1701 = !DILocation(line: 1759, column: 6, scope: !1693)
!1702 = !DILocation(line: 1760, column: 5, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1693, file: !70, line: 1760, column: 5)
!1704 = !DILocation(line: 1760, column: 10, scope: !1703)
!1705 = !DILocation(line: 1760, column: 5, scope: !1693)
!1706 = !DILocation(line: 1762, column: 19, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1703, file: !70, line: 1761, column: 2)
!1708 = !DILocation(line: 1762, column: 18, scope: !1707)
!1709 = !DILocation(line: 1762, column: 16, scope: !1707)
!1710 = !DILocation(line: 1763, column: 2, scope: !1707)
!1711 = !DILocation(line: 1764, column: 5, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1693, file: !70, line: 1764, column: 5)
!1713 = !DILocation(line: 1764, column: 10, scope: !1712)
!1714 = !DILocation(line: 1764, column: 5, scope: !1693)
!1715 = !DILocation(line: 1766, column: 6, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1717, file: !70, line: 1766, column: 6)
!1717 = distinct !DILexicalBlock(scope: !1712, file: !70, line: 1765, column: 2)
!1718 = !DILocation(line: 1766, column: 11, scope: !1716)
!1719 = !DILocation(line: 1766, column: 6, scope: !1717)
!1720 = !DILocation(line: 1768, column: 21, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1722, file: !70, line: 1768, column: 7)
!1722 = distinct !DILexicalBlock(scope: !1716, file: !70, line: 1767, column: 3)
!1723 = !DILocation(line: 1768, column: 19, scope: !1721)
!1724 = !DILocation(line: 1768, column: 37, scope: !1721)
!1725 = !DILocation(line: 1768, column: 35, scope: !1721)
!1726 = !DILocation(line: 1768, column: 7, scope: !1722)
!1727 = !DILocation(line: 1770, column: 13, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1721, file: !70, line: 1769, column: 4)
!1729 = !DILocation(line: 1770, column: 20, scope: !1728)
!1730 = !DILocation(line: 1770, column: 18, scope: !1728)
!1731 = !DILocation(line: 1770, column: 5, scope: !1728)
!1732 = !DILocation(line: 1774, column: 5, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1721, file: !70, line: 1773, column: 4)
!1734 = !DILocation(line: 1779, column: 21, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1736, file: !70, line: 1779, column: 7)
!1736 = distinct !DILexicalBlock(scope: !1716, file: !70, line: 1778, column: 3)
!1737 = !DILocation(line: 1779, column: 19, scope: !1735)
!1738 = !DILocation(line: 1779, column: 29, scope: !1735)
!1739 = !DILocation(line: 1779, column: 27, scope: !1735)
!1740 = !DILocation(line: 1779, column: 7, scope: !1736)
!1741 = !DILocation(line: 1781, column: 5, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1735, file: !70, line: 1780, column: 4)
!1743 = !DILocation(line: 1785, column: 13, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1735, file: !70, line: 1784, column: 4)
!1745 = !DILocation(line: 1785, column: 20, scope: !1744)
!1746 = !DILocation(line: 1785, column: 18, scope: !1744)
!1747 = !DILocation(line: 1785, column: 5, scope: !1744)
!1748 = !DILocation(line: 1791, column: 3, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1712, file: !70, line: 1790, column: 2)
!1750 = !DILocation(line: 1793, column: 1, scope: !1693)
!1751 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !70, file: !70, line: 1810, type: !773, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1752 = !DILocalVariable(name: "val1", arg: 1, scope: !1751, file: !70, line: 1810, type: !78)
!1753 = !DILocation(line: 1810, column: 30, scope: !1751)
!1754 = !DILocalVariable(name: "val2", arg: 2, scope: !1751, file: !70, line: 1810, type: !22)
!1755 = !DILocation(line: 1810, column: 39, scope: !1751)
!1756 = !DILocalVariable(name: "u32Temp1", scope: !1751, file: !70, line: 1812, type: !734)
!1757 = !DILocation(line: 1812, column: 6, scope: !1751)
!1758 = !DILocalVariable(name: "u32Temp2", scope: !1751, file: !70, line: 1812, type: !734)
!1759 = !DILocation(line: 1812, column: 17, scope: !1751)
!1760 = !DILocalVariable(name: "u32Temp3", scope: !1751, file: !70, line: 1812, type: !734)
!1761 = !DILocation(line: 1812, column: 26, scope: !1751)
!1762 = !DILocalVariable(name: "u8SignBit", scope: !1751, file: !70, line: 1813, type: !17)
!1763 = !DILocation(line: 1813, column: 5, scope: !1751)
!1764 = !DILocation(line: 1815, column: 5, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1751, file: !70, line: 1815, column: 5)
!1766 = !DILocation(line: 1815, column: 9, scope: !1765)
!1767 = !DILocation(line: 1815, column: 5, scope: !1751)
!1768 = !DILocation(line: 1817, column: 15, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1765, file: !70, line: 1816, column: 2)
!1770 = !DILocation(line: 1817, column: 14, scope: !1769)
!1771 = !DILocation(line: 1817, column: 12, scope: !1769)
!1772 = !DILocation(line: 1818, column: 13, scope: !1769)
!1773 = !DILocation(line: 1819, column: 2, scope: !1769)
!1774 = !DILocation(line: 1822, column: 14, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1765, file: !70, line: 1821, column: 2)
!1776 = !DILocation(line: 1822, column: 12, scope: !1775)
!1777 = !DILocation(line: 1823, column: 13, scope: !1775)
!1778 = !DILocation(line: 1826, column: 13, scope: !1751)
!1779 = !DILocation(line: 1826, column: 24, scope: !1751)
!1780 = !DILocation(line: 1826, column: 22, scope: !1751)
!1781 = !DILocation(line: 1826, column: 11, scope: !1751)
!1782 = !DILocation(line: 1827, column: 25, scope: !1751)
!1783 = !DILocation(line: 1827, column: 35, scope: !1751)
!1784 = !DILocation(line: 1827, column: 13, scope: !1751)
!1785 = !DILocation(line: 1827, column: 11, scope: !1751)
!1786 = !DILocation(line: 1828, column: 13, scope: !1751)
!1787 = !DILocation(line: 1828, column: 22, scope: !1751)
!1788 = !DILocation(line: 1828, column: 11, scope: !1751)
!1789 = !DILocation(line: 1829, column: 14, scope: !1751)
!1790 = !DILocation(line: 1829, column: 23, scope: !1751)
!1791 = !DILocation(line: 1829, column: 11, scope: !1751)
!1792 = !DILocation(line: 1830, column: 5, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1751, file: !70, line: 1830, column: 5)
!1794 = !DILocation(line: 1830, column: 15, scope: !1793)
!1795 = !DILocation(line: 1830, column: 5, scope: !1751)
!1796 = !DILocation(line: 1832, column: 10, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1793, file: !70, line: 1831, column: 2)
!1798 = !DILocation(line: 1832, column: 3, scope: !1797)
!1799 = !DILocation(line: 1836, column: 11, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1793, file: !70, line: 1835, column: 2)
!1801 = !DILocation(line: 1836, column: 10, scope: !1800)
!1802 = !DILocation(line: 1836, column: 3, scope: !1800)
!1803 = !DILocation(line: 1838, column: 1, scope: !1751)
!1804 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !70, file: !70, line: 1857, type: !773, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1805 = !DILocalVariable(name: "val1", arg: 1, scope: !1804, file: !70, line: 1857, type: !78)
!1806 = !DILocation(line: 1857, column: 30, scope: !1804)
!1807 = !DILocalVariable(name: "val2", arg: 2, scope: !1804, file: !70, line: 1857, type: !22)
!1808 = !DILocation(line: 1857, column: 39, scope: !1804)
!1809 = !DILocalVariable(name: "u32Temp1", scope: !1804, file: !70, line: 1859, type: !734)
!1810 = !DILocation(line: 1859, column: 6, scope: !1804)
!1811 = !DILocalVariable(name: "u32Temp2", scope: !1804, file: !70, line: 1859, type: !734)
!1812 = !DILocation(line: 1859, column: 17, scope: !1804)
!1813 = !DILocalVariable(name: "u32Temp3", scope: !1804, file: !70, line: 1859, type: !734)
!1814 = !DILocation(line: 1859, column: 26, scope: !1804)
!1815 = !DILocalVariable(name: "u8SignBit", scope: !1804, file: !70, line: 1860, type: !17)
!1816 = !DILocation(line: 1860, column: 5, scope: !1804)
!1817 = !DILocation(line: 1862, column: 5, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1804, file: !70, line: 1862, column: 5)
!1819 = !DILocation(line: 1862, column: 9, scope: !1818)
!1820 = !DILocation(line: 1862, column: 5, scope: !1804)
!1821 = !DILocation(line: 1864, column: 15, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1818, file: !70, line: 1863, column: 2)
!1823 = !DILocation(line: 1864, column: 14, scope: !1822)
!1824 = !DILocation(line: 1864, column: 12, scope: !1822)
!1825 = !DILocation(line: 1865, column: 13, scope: !1822)
!1826 = !DILocation(line: 1866, column: 2, scope: !1822)
!1827 = !DILocation(line: 1869, column: 14, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1818, file: !70, line: 1868, column: 2)
!1829 = !DILocation(line: 1869, column: 12, scope: !1828)
!1830 = !DILocation(line: 1870, column: 13, scope: !1828)
!1831 = !DILocation(line: 1873, column: 13, scope: !1804)
!1832 = !DILocation(line: 1873, column: 24, scope: !1804)
!1833 = !DILocation(line: 1873, column: 22, scope: !1804)
!1834 = !DILocation(line: 1873, column: 11, scope: !1804)
!1835 = !DILocation(line: 1874, column: 25, scope: !1804)
!1836 = !DILocation(line: 1874, column: 35, scope: !1804)
!1837 = !DILocation(line: 1874, column: 13, scope: !1804)
!1838 = !DILocation(line: 1874, column: 11, scope: !1804)
!1839 = !DILocation(line: 1875, column: 13, scope: !1804)
!1840 = !DILocation(line: 1875, column: 22, scope: !1804)
!1841 = !DILocation(line: 1875, column: 11, scope: !1804)
!1842 = !DILocation(line: 1876, column: 14, scope: !1804)
!1843 = !DILocation(line: 1876, column: 23, scope: !1804)
!1844 = !DILocation(line: 1876, column: 11, scope: !1804)
!1845 = !DILocation(line: 1877, column: 5, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1804, file: !70, line: 1877, column: 5)
!1847 = !DILocation(line: 1877, column: 15, scope: !1846)
!1848 = !DILocation(line: 1877, column: 5, scope: !1804)
!1849 = !DILocation(line: 1879, column: 6, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1851, file: !70, line: 1879, column: 6)
!1851 = distinct !DILexicalBlock(scope: !1846, file: !70, line: 1878, column: 2)
!1852 = !DILocation(line: 1879, column: 14, scope: !1850)
!1853 = !DILocation(line: 1879, column: 6, scope: !1851)
!1854 = !DILocation(line: 1880, column: 11, scope: !1850)
!1855 = !DILocation(line: 1880, column: 4, scope: !1850)
!1856 = !DILocation(line: 1882, column: 4, scope: !1850)
!1857 = !DILocation(line: 1886, column: 6, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1859, file: !70, line: 1886, column: 6)
!1859 = distinct !DILexicalBlock(scope: !1846, file: !70, line: 1885, column: 2)
!1860 = !DILocation(line: 1886, column: 14, scope: !1858)
!1861 = !DILocation(line: 1886, column: 6, scope: !1859)
!1862 = !DILocation(line: 1887, column: 12, scope: !1858)
!1863 = !DILocation(line: 1887, column: 11, scope: !1858)
!1864 = !DILocation(line: 1887, column: 4, scope: !1858)
!1865 = !DILocation(line: 1889, column: 4, scope: !1858)
!1866 = !DILocation(line: 1891, column: 1, scope: !1804)
!1867 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !70, file: !70, line: 1911, type: !1868, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1868 = !DISubroutineType(types: !1869)
!1869 = !{!78, !78, !13}
!1870 = !DILocalVariable(name: "val1", arg: 1, scope: !1867, file: !70, line: 1911, type: !78)
!1871 = !DILocation(line: 1911, column: 30, scope: !1867)
!1872 = !DILocalVariable(name: "val2", arg: 2, scope: !1867, file: !70, line: 1911, type: !13)
!1873 = !DILocation(line: 1911, column: 39, scope: !1867)
!1874 = !DILocalVariable(name: "u32Temp1", scope: !1867, file: !70, line: 1913, type: !734)
!1875 = !DILocation(line: 1913, column: 6, scope: !1867)
!1876 = !DILocalVariable(name: "u32Temp2", scope: !1867, file: !70, line: 1913, type: !734)
!1877 = !DILocation(line: 1913, column: 17, scope: !1867)
!1878 = !DILocalVariable(name: "u32Temp3", scope: !1867, file: !70, line: 1913, type: !734)
!1879 = !DILocation(line: 1913, column: 26, scope: !1867)
!1880 = !DILocalVariable(name: "u32Temp4", scope: !1867, file: !70, line: 1913, type: !734)
!1881 = !DILocation(line: 1913, column: 35, scope: !1867)
!1882 = !DILocalVariable(name: "u8SignBit", scope: !1867, file: !70, line: 1914, type: !17)
!1883 = !DILocation(line: 1914, column: 5, scope: !1867)
!1884 = !DILocation(line: 1916, column: 7, scope: !1885)
!1885 = distinct !DILexicalBlock(scope: !1867, file: !70, line: 1916, column: 5)
!1886 = !DILocation(line: 1916, column: 11, scope: !1885)
!1887 = !DILocation(line: 1916, column: 15, scope: !1885)
!1888 = !DILocation(line: 1916, column: 19, scope: !1885)
!1889 = !DILocation(line: 1916, column: 23, scope: !1885)
!1890 = !DILocation(line: 1916, column: 28, scope: !1885)
!1891 = !DILocation(line: 1916, column: 33, scope: !1885)
!1892 = !DILocation(line: 1916, column: 37, scope: !1885)
!1893 = !DILocation(line: 1916, column: 41, scope: !1885)
!1894 = !DILocation(line: 1916, column: 45, scope: !1885)
!1895 = !DILocation(line: 1916, column: 49, scope: !1885)
!1896 = !DILocation(line: 1916, column: 5, scope: !1867)
!1897 = !DILocation(line: 1918, column: 13, scope: !1898)
!1898 = distinct !DILexicalBlock(scope: !1885, file: !70, line: 1917, column: 2)
!1899 = !DILocation(line: 1919, column: 2, scope: !1898)
!1900 = !DILocation(line: 1922, column: 13, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1885, file: !70, line: 1921, column: 2)
!1902 = !DILocation(line: 1925, column: 5, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1867, file: !70, line: 1925, column: 5)
!1904 = !DILocation(line: 1925, column: 9, scope: !1903)
!1905 = !DILocation(line: 1925, column: 5, scope: !1867)
!1906 = !DILocation(line: 1927, column: 15, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1903, file: !70, line: 1926, column: 2)
!1908 = !DILocation(line: 1927, column: 14, scope: !1907)
!1909 = !DILocation(line: 1927, column: 12, scope: !1907)
!1910 = !DILocation(line: 1928, column: 2, scope: !1907)
!1911 = !DILocation(line: 1931, column: 14, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1903, file: !70, line: 1930, column: 2)
!1913 = !DILocation(line: 1931, column: 12, scope: !1912)
!1914 = !DILocation(line: 1934, column: 5, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1867, file: !70, line: 1934, column: 5)
!1916 = !DILocation(line: 1934, column: 9, scope: !1915)
!1917 = !DILocation(line: 1934, column: 5, scope: !1867)
!1918 = !DILocation(line: 1936, column: 15, scope: !1919)
!1919 = distinct !DILexicalBlock(scope: !1915, file: !70, line: 1935, column: 2)
!1920 = !DILocation(line: 1936, column: 14, scope: !1919)
!1921 = !DILocation(line: 1936, column: 12, scope: !1919)
!1922 = !DILocation(line: 1937, column: 2, scope: !1919)
!1923 = !DILocation(line: 1940, column: 14, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1915, file: !70, line: 1939, column: 2)
!1925 = !DILocation(line: 1940, column: 12, scope: !1924)
!1926 = !DILocation(line: 1943, column: 13, scope: !1867)
!1927 = !DILocation(line: 1943, column: 24, scope: !1867)
!1928 = !DILocation(line: 1943, column: 22, scope: !1867)
!1929 = !DILocation(line: 1943, column: 11, scope: !1867)
!1930 = !DILocation(line: 1944, column: 25, scope: !1867)
!1931 = !DILocation(line: 1944, column: 35, scope: !1867)
!1932 = !DILocation(line: 1944, column: 13, scope: !1867)
!1933 = !DILocation(line: 1944, column: 11, scope: !1867)
!1934 = !DILocation(line: 1945, column: 13, scope: !1867)
!1935 = !DILocation(line: 1945, column: 22, scope: !1867)
!1936 = !DILocation(line: 1945, column: 11, scope: !1867)
!1937 = !DILocation(line: 1946, column: 14, scope: !1867)
!1938 = !DILocation(line: 1946, column: 23, scope: !1867)
!1939 = !DILocation(line: 1946, column: 11, scope: !1867)
!1940 = !DILocation(line: 1947, column: 5, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1867, file: !70, line: 1947, column: 5)
!1942 = !DILocation(line: 1947, column: 15, scope: !1941)
!1943 = !DILocation(line: 1947, column: 5, scope: !1867)
!1944 = !DILocation(line: 1949, column: 6, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1946, file: !70, line: 1949, column: 6)
!1946 = distinct !DILexicalBlock(scope: !1941, file: !70, line: 1948, column: 2)
!1947 = !DILocation(line: 1949, column: 14, scope: !1945)
!1948 = !DILocation(line: 1949, column: 6, scope: !1946)
!1949 = !DILocation(line: 1950, column: 11, scope: !1945)
!1950 = !DILocation(line: 1950, column: 4, scope: !1945)
!1951 = !DILocation(line: 1952, column: 4, scope: !1945)
!1952 = !DILocation(line: 1956, column: 11, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1941, file: !70, line: 1955, column: 2)
!1954 = !DILocation(line: 1956, column: 10, scope: !1953)
!1955 = !DILocation(line: 1956, column: 3, scope: !1953)
!1956 = !DILocation(line: 1958, column: 1, scope: !1867)
!1957 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !70, file: !70, line: 1977, type: !1868, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1958 = !DILocalVariable(name: "val1", arg: 1, scope: !1957, file: !70, line: 1977, type: !78)
!1959 = !DILocation(line: 1977, column: 30, scope: !1957)
!1960 = !DILocalVariable(name: "val2", arg: 2, scope: !1957, file: !70, line: 1977, type: !13)
!1961 = !DILocation(line: 1977, column: 39, scope: !1957)
!1962 = !DILocalVariable(name: "u32Temp1", scope: !1957, file: !70, line: 1979, type: !734)
!1963 = !DILocation(line: 1979, column: 6, scope: !1957)
!1964 = !DILocalVariable(name: "u32Temp2", scope: !1957, file: !70, line: 1979, type: !734)
!1965 = !DILocation(line: 1979, column: 17, scope: !1957)
!1966 = !DILocalVariable(name: "u32Temp3", scope: !1957, file: !70, line: 1979, type: !734)
!1967 = !DILocation(line: 1979, column: 26, scope: !1957)
!1968 = !DILocalVariable(name: "u32Temp4", scope: !1957, file: !70, line: 1979, type: !734)
!1969 = !DILocation(line: 1979, column: 35, scope: !1957)
!1970 = !DILocalVariable(name: "u8SignBit", scope: !1957, file: !70, line: 1980, type: !17)
!1971 = !DILocation(line: 1980, column: 5, scope: !1957)
!1972 = !DILocation(line: 1982, column: 7, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1957, file: !70, line: 1982, column: 5)
!1974 = !DILocation(line: 1982, column: 11, scope: !1973)
!1975 = !DILocation(line: 1982, column: 15, scope: !1973)
!1976 = !DILocation(line: 1982, column: 19, scope: !1973)
!1977 = !DILocation(line: 1982, column: 23, scope: !1973)
!1978 = !DILocation(line: 1982, column: 28, scope: !1973)
!1979 = !DILocation(line: 1982, column: 33, scope: !1973)
!1980 = !DILocation(line: 1982, column: 37, scope: !1973)
!1981 = !DILocation(line: 1982, column: 41, scope: !1973)
!1982 = !DILocation(line: 1982, column: 45, scope: !1973)
!1983 = !DILocation(line: 1982, column: 49, scope: !1973)
!1984 = !DILocation(line: 1982, column: 5, scope: !1957)
!1985 = !DILocation(line: 1984, column: 13, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1973, file: !70, line: 1983, column: 2)
!1987 = !DILocation(line: 1985, column: 2, scope: !1986)
!1988 = !DILocation(line: 1988, column: 13, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1973, file: !70, line: 1987, column: 2)
!1990 = !DILocation(line: 1991, column: 5, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1957, file: !70, line: 1991, column: 5)
!1992 = !DILocation(line: 1991, column: 9, scope: !1991)
!1993 = !DILocation(line: 1991, column: 5, scope: !1957)
!1994 = !DILocation(line: 1993, column: 15, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1991, file: !70, line: 1992, column: 2)
!1996 = !DILocation(line: 1993, column: 14, scope: !1995)
!1997 = !DILocation(line: 1993, column: 12, scope: !1995)
!1998 = !DILocation(line: 1994, column: 2, scope: !1995)
!1999 = !DILocation(line: 1997, column: 14, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1991, file: !70, line: 1996, column: 2)
!2001 = !DILocation(line: 1997, column: 12, scope: !2000)
!2002 = !DILocation(line: 2000, column: 5, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !1957, file: !70, line: 2000, column: 5)
!2004 = !DILocation(line: 2000, column: 9, scope: !2003)
!2005 = !DILocation(line: 2000, column: 5, scope: !1957)
!2006 = !DILocation(line: 2002, column: 15, scope: !2007)
!2007 = distinct !DILexicalBlock(scope: !2003, file: !70, line: 2001, column: 2)
!2008 = !DILocation(line: 2002, column: 14, scope: !2007)
!2009 = !DILocation(line: 2002, column: 12, scope: !2007)
!2010 = !DILocation(line: 2003, column: 2, scope: !2007)
!2011 = !DILocation(line: 2006, column: 14, scope: !2012)
!2012 = distinct !DILexicalBlock(scope: !2003, file: !70, line: 2005, column: 2)
!2013 = !DILocation(line: 2006, column: 12, scope: !2012)
!2014 = !DILocation(line: 2009, column: 13, scope: !1957)
!2015 = !DILocation(line: 2009, column: 24, scope: !1957)
!2016 = !DILocation(line: 2009, column: 22, scope: !1957)
!2017 = !DILocation(line: 2009, column: 11, scope: !1957)
!2018 = !DILocation(line: 2010, column: 25, scope: !1957)
!2019 = !DILocation(line: 2010, column: 35, scope: !1957)
!2020 = !DILocation(line: 2010, column: 13, scope: !1957)
!2021 = !DILocation(line: 2010, column: 11, scope: !1957)
!2022 = !DILocation(line: 2011, column: 13, scope: !1957)
!2023 = !DILocation(line: 2011, column: 22, scope: !1957)
!2024 = !DILocation(line: 2011, column: 11, scope: !1957)
!2025 = !DILocation(line: 2012, column: 14, scope: !1957)
!2026 = !DILocation(line: 2012, column: 23, scope: !1957)
!2027 = !DILocation(line: 2012, column: 11, scope: !1957)
!2028 = !DILocation(line: 2013, column: 6, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !1957, file: !70, line: 2013, column: 5)
!2030 = !DILocation(line: 2013, column: 14, scope: !2029)
!2031 = !DILocation(line: 2013, column: 19, scope: !2029)
!2032 = !DILocation(line: 2013, column: 5, scope: !1957)
!2033 = !DILocation(line: 2015, column: 6, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2035, file: !70, line: 2015, column: 6)
!2035 = distinct !DILexicalBlock(scope: !2029, file: !70, line: 2014, column: 2)
!2036 = !DILocation(line: 2015, column: 16, scope: !2034)
!2037 = !DILocation(line: 2015, column: 6, scope: !2035)
!2038 = !DILocation(line: 2017, column: 7, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2040, file: !70, line: 2017, column: 7)
!2040 = distinct !DILexicalBlock(scope: !2034, file: !70, line: 2016, column: 3)
!2041 = !DILocation(line: 2017, column: 15, scope: !2039)
!2042 = !DILocation(line: 2017, column: 7, scope: !2040)
!2043 = !DILocation(line: 2018, column: 12, scope: !2039)
!2044 = !DILocation(line: 2018, column: 5, scope: !2039)
!2045 = !DILocation(line: 2020, column: 5, scope: !2039)
!2046 = !DILocation(line: 2024, column: 7, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2048, file: !70, line: 2024, column: 7)
!2048 = distinct !DILexicalBlock(scope: !2034, file: !70, line: 2023, column: 3)
!2049 = !DILocation(line: 2024, column: 15, scope: !2047)
!2050 = !DILocation(line: 2024, column: 7, scope: !2048)
!2051 = !DILocation(line: 2025, column: 13, scope: !2047)
!2052 = !DILocation(line: 2025, column: 12, scope: !2047)
!2053 = !DILocation(line: 2025, column: 5, scope: !2047)
!2054 = !DILocation(line: 2027, column: 5, scope: !2047)
!2055 = !DILocation(line: 2032, column: 3, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2029, file: !70, line: 2031, column: 2)
!2057 = !DILocation(line: 2034, column: 1, scope: !1957)
!2058 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !70, file: !70, line: 2049, type: !2059, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2059 = !DISubroutineType(types: !2060)
!2060 = !{!78, !78, !734}
!2061 = !DILocalVariable(name: "val1", arg: 1, scope: !2058, file: !70, line: 2049, type: !78)
!2062 = !DILocation(line: 2049, column: 30, scope: !2058)
!2063 = !DILocalVariable(name: "val2", arg: 2, scope: !2058, file: !70, line: 2049, type: !734)
!2064 = !DILocation(line: 2049, column: 39, scope: !2058)
!2065 = !DILocalVariable(name: "u32Temp1", scope: !2058, file: !70, line: 2051, type: !734)
!2066 = !DILocation(line: 2051, column: 6, scope: !2058)
!2067 = !DILocalVariable(name: "u32Temp2", scope: !2058, file: !70, line: 2051, type: !734)
!2068 = !DILocation(line: 2051, column: 17, scope: !2058)
!2069 = !DILocalVariable(name: "u8SignBit", scope: !2058, file: !70, line: 2052, type: !17)
!2070 = !DILocation(line: 2052, column: 5, scope: !2058)
!2071 = !DILocation(line: 2054, column: 5, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2058, file: !70, line: 2054, column: 5)
!2073 = !DILocation(line: 2054, column: 9, scope: !2072)
!2074 = !DILocation(line: 2054, column: 5, scope: !2058)
!2075 = !DILocation(line: 2056, column: 15, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2072, file: !70, line: 2055, column: 2)
!2077 = !DILocation(line: 2056, column: 14, scope: !2076)
!2078 = !DILocation(line: 2056, column: 12, scope: !2076)
!2079 = !DILocation(line: 2057, column: 13, scope: !2076)
!2080 = !DILocation(line: 2058, column: 2, scope: !2076)
!2081 = !DILocation(line: 2061, column: 14, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2072, file: !70, line: 2060, column: 2)
!2083 = !DILocation(line: 2061, column: 12, scope: !2082)
!2084 = !DILocation(line: 2062, column: 13, scope: !2082)
!2085 = !DILocation(line: 2065, column: 25, scope: !2058)
!2086 = !DILocation(line: 2065, column: 35, scope: !2058)
!2087 = !DILocation(line: 2065, column: 13, scope: !2058)
!2088 = !DILocation(line: 2065, column: 11, scope: !2058)
!2089 = !DILocation(line: 2066, column: 5, scope: !2090)
!2090 = distinct !DILexicalBlock(scope: !2058, file: !70, line: 2066, column: 5)
!2091 = !DILocation(line: 2066, column: 15, scope: !2090)
!2092 = !DILocation(line: 2066, column: 5, scope: !2058)
!2093 = !DILocation(line: 2067, column: 10, scope: !2090)
!2094 = !DILocation(line: 2067, column: 3, scope: !2090)
!2095 = !DILocation(line: 2069, column: 11, scope: !2090)
!2096 = !DILocation(line: 2069, column: 10, scope: !2090)
!2097 = !DILocation(line: 2069, column: 3, scope: !2090)
!2098 = !DILocation(line: 2070, column: 1, scope: !2058)
!2099 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !70, file: !70, line: 2089, type: !2059, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2100 = !DILocalVariable(name: "val1", arg: 1, scope: !2099, file: !70, line: 2089, type: !78)
!2101 = !DILocation(line: 2089, column: 30, scope: !2099)
!2102 = !DILocalVariable(name: "val2", arg: 2, scope: !2099, file: !70, line: 2089, type: !734)
!2103 = !DILocation(line: 2089, column: 39, scope: !2099)
!2104 = !DILocalVariable(name: "u32Temp1", scope: !2099, file: !70, line: 2091, type: !734)
!2105 = !DILocation(line: 2091, column: 6, scope: !2099)
!2106 = !DILocalVariable(name: "u32Temp2", scope: !2099, file: !70, line: 2091, type: !734)
!2107 = !DILocation(line: 2091, column: 17, scope: !2099)
!2108 = !DILocalVariable(name: "u32Temp3", scope: !2099, file: !70, line: 2091, type: !734)
!2109 = !DILocation(line: 2091, column: 26, scope: !2099)
!2110 = !DILocalVariable(name: "u8SignBit", scope: !2099, file: !70, line: 2092, type: !17)
!2111 = !DILocation(line: 2092, column: 5, scope: !2099)
!2112 = !DILocation(line: 2094, column: 5, scope: !2113)
!2113 = distinct !DILexicalBlock(scope: !2099, file: !70, line: 2094, column: 5)
!2114 = !DILocation(line: 2094, column: 9, scope: !2113)
!2115 = !DILocation(line: 2094, column: 5, scope: !2099)
!2116 = !DILocation(line: 2096, column: 15, scope: !2117)
!2117 = distinct !DILexicalBlock(scope: !2113, file: !70, line: 2095, column: 2)
!2118 = !DILocation(line: 2096, column: 14, scope: !2117)
!2119 = !DILocation(line: 2096, column: 12, scope: !2117)
!2120 = !DILocation(line: 2097, column: 13, scope: !2117)
!2121 = !DILocation(line: 2098, column: 2, scope: !2117)
!2122 = !DILocation(line: 2101, column: 14, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2113, file: !70, line: 2100, column: 2)
!2124 = !DILocation(line: 2101, column: 12, scope: !2123)
!2125 = !DILocation(line: 2102, column: 13, scope: !2123)
!2126 = !DILocation(line: 2105, column: 13, scope: !2099)
!2127 = !DILocation(line: 2105, column: 24, scope: !2099)
!2128 = !DILocation(line: 2105, column: 22, scope: !2099)
!2129 = !DILocation(line: 2105, column: 11, scope: !2099)
!2130 = !DILocation(line: 2106, column: 25, scope: !2099)
!2131 = !DILocation(line: 2106, column: 35, scope: !2099)
!2132 = !DILocation(line: 2106, column: 13, scope: !2099)
!2133 = !DILocation(line: 2106, column: 11, scope: !2099)
!2134 = !DILocation(line: 2107, column: 13, scope: !2099)
!2135 = !DILocation(line: 2107, column: 22, scope: !2099)
!2136 = !DILocation(line: 2107, column: 11, scope: !2099)
!2137 = !DILocation(line: 2108, column: 14, scope: !2099)
!2138 = !DILocation(line: 2108, column: 23, scope: !2099)
!2139 = !DILocation(line: 2108, column: 11, scope: !2099)
!2140 = !DILocation(line: 2109, column: 5, scope: !2141)
!2141 = distinct !DILexicalBlock(scope: !2099, file: !70, line: 2109, column: 5)
!2142 = !DILocation(line: 2109, column: 15, scope: !2141)
!2143 = !DILocation(line: 2109, column: 5, scope: !2099)
!2144 = !DILocation(line: 2111, column: 6, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2146, file: !70, line: 2111, column: 6)
!2146 = distinct !DILexicalBlock(scope: !2141, file: !70, line: 2110, column: 2)
!2147 = !DILocation(line: 2111, column: 14, scope: !2145)
!2148 = !DILocation(line: 2111, column: 6, scope: !2146)
!2149 = !DILocation(line: 2112, column: 11, scope: !2145)
!2150 = !DILocation(line: 2112, column: 4, scope: !2145)
!2151 = !DILocation(line: 2114, column: 4, scope: !2145)
!2152 = !DILocation(line: 2118, column: 6, scope: !2153)
!2153 = distinct !DILexicalBlock(scope: !2154, file: !70, line: 2118, column: 6)
!2154 = distinct !DILexicalBlock(scope: !2141, file: !70, line: 2117, column: 2)
!2155 = !DILocation(line: 2118, column: 14, scope: !2153)
!2156 = !DILocation(line: 2118, column: 6, scope: !2154)
!2157 = !DILocation(line: 2119, column: 12, scope: !2153)
!2158 = !DILocation(line: 2119, column: 11, scope: !2153)
!2159 = !DILocation(line: 2119, column: 4, scope: !2153)
!2160 = !DILocation(line: 2121, column: 4, scope: !2153)
!2161 = !DILocation(line: 2123, column: 1, scope: !2099)
!2162 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !70, file: !70, line: 2141, type: !2163, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2163 = !DISubroutineType(types: !2164)
!2164 = !{!78, !78, !78}
!2165 = !DILocalVariable(name: "value", arg: 1, scope: !2162, file: !70, line: 2141, type: !78)
!2166 = !DILocation(line: 2141, column: 30, scope: !2162)
!2167 = !DILocalVariable(name: "factor", arg: 2, scope: !2162, file: !70, line: 2141, type: !78)
!2168 = !DILocation(line: 2141, column: 41, scope: !2162)
!2169 = !DILocalVariable(name: "u32Temp1", scope: !2162, file: !70, line: 2143, type: !734)
!2170 = !DILocation(line: 2143, column: 6, scope: !2162)
!2171 = !DILocalVariable(name: "u32Temp2", scope: !2162, file: !70, line: 2143, type: !734)
!2172 = !DILocation(line: 2143, column: 17, scope: !2162)
!2173 = !DILocalVariable(name: "u32Temp3", scope: !2162, file: !70, line: 2143, type: !734)
!2174 = !DILocation(line: 2143, column: 26, scope: !2162)
!2175 = !DILocalVariable(name: "u32Temp4", scope: !2162, file: !70, line: 2143, type: !734)
!2176 = !DILocation(line: 2143, column: 35, scope: !2162)
!2177 = !DILocalVariable(name: "u8SignBit", scope: !2162, file: !70, line: 2144, type: !17)
!2178 = !DILocation(line: 2144, column: 5, scope: !2162)
!2179 = !DILocation(line: 2146, column: 7, scope: !2180)
!2180 = distinct !DILexicalBlock(scope: !2162, file: !70, line: 2146, column: 5)
!2181 = !DILocation(line: 2146, column: 12, scope: !2180)
!2182 = !DILocation(line: 2146, column: 16, scope: !2180)
!2183 = !DILocation(line: 2146, column: 36, scope: !2180)
!2184 = !DILocation(line: 2146, column: 41, scope: !2180)
!2185 = !DILocation(line: 2146, column: 45, scope: !2180)
!2186 = !DILocation(line: 2148, column: 13, scope: !2187)
!2187 = distinct !DILexicalBlock(scope: !2180, file: !70, line: 2147, column: 2)
!2188 = !DILocation(line: 2149, column: 2, scope: !2187)
!2189 = !DILocation(line: 2152, column: 13, scope: !2190)
!2190 = distinct !DILexicalBlock(scope: !2180, file: !70, line: 2151, column: 2)
!2191 = !DILocation(line: 2155, column: 5, scope: !2192)
!2192 = distinct !DILexicalBlock(scope: !2162, file: !70, line: 2155, column: 5)
!2193 = !DILocation(line: 2155, column: 10, scope: !2192)
!2194 = !DILocation(line: 2155, column: 5, scope: !2162)
!2195 = !DILocation(line: 2157, column: 15, scope: !2196)
!2196 = distinct !DILexicalBlock(scope: !2192, file: !70, line: 2156, column: 2)
!2197 = !DILocation(line: 2157, column: 14, scope: !2196)
!2198 = !DILocation(line: 2157, column: 12, scope: !2196)
!2199 = !DILocation(line: 2158, column: 2, scope: !2196)
!2200 = !DILocation(line: 2161, column: 14, scope: !2201)
!2201 = distinct !DILexicalBlock(scope: !2192, file: !70, line: 2160, column: 2)
!2202 = !DILocation(line: 2161, column: 12, scope: !2201)
!2203 = !DILocation(line: 2164, column: 5, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2162, file: !70, line: 2164, column: 5)
!2205 = !DILocation(line: 2164, column: 11, scope: !2204)
!2206 = !DILocation(line: 2164, column: 5, scope: !2162)
!2207 = !DILocation(line: 2166, column: 15, scope: !2208)
!2208 = distinct !DILexicalBlock(scope: !2204, file: !70, line: 2165, column: 2)
!2209 = !DILocation(line: 2166, column: 14, scope: !2208)
!2210 = !DILocation(line: 2166, column: 12, scope: !2208)
!2211 = !DILocation(line: 2167, column: 2, scope: !2208)
!2212 = !DILocation(line: 2170, column: 14, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2204, file: !70, line: 2169, column: 2)
!2214 = !DILocation(line: 2170, column: 12, scope: !2213)
!2215 = !DILocation(line: 2173, column: 13, scope: !2162)
!2216 = !DILocation(line: 2173, column: 24, scope: !2162)
!2217 = !DILocation(line: 2173, column: 22, scope: !2162)
!2218 = !DILocation(line: 2173, column: 11, scope: !2162)
!2219 = !DILocation(line: 2174, column: 25, scope: !2162)
!2220 = !DILocation(line: 2174, column: 35, scope: !2162)
!2221 = !DILocation(line: 2174, column: 13, scope: !2162)
!2222 = !DILocation(line: 2174, column: 11, scope: !2162)
!2223 = !DILocation(line: 2175, column: 13, scope: !2162)
!2224 = !DILocation(line: 2175, column: 22, scope: !2162)
!2225 = !DILocation(line: 2175, column: 11, scope: !2162)
!2226 = !DILocation(line: 2176, column: 14, scope: !2162)
!2227 = !DILocation(line: 2176, column: 23, scope: !2162)
!2228 = !DILocation(line: 2176, column: 11, scope: !2162)
!2229 = !DILocation(line: 2177, column: 5, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2162, file: !70, line: 2177, column: 5)
!2231 = !DILocation(line: 2177, column: 15, scope: !2230)
!2232 = !DILocation(line: 2177, column: 5, scope: !2162)
!2233 = !DILocation(line: 2179, column: 6, scope: !2234)
!2234 = distinct !DILexicalBlock(scope: !2235, file: !70, line: 2179, column: 6)
!2235 = distinct !DILexicalBlock(scope: !2230, file: !70, line: 2178, column: 2)
!2236 = !DILocation(line: 2179, column: 14, scope: !2234)
!2237 = !DILocation(line: 2179, column: 6, scope: !2235)
!2238 = !DILocation(line: 2180, column: 11, scope: !2234)
!2239 = !DILocation(line: 2180, column: 4, scope: !2234)
!2240 = !DILocation(line: 2182, column: 4, scope: !2234)
!2241 = !DILocation(line: 2186, column: 11, scope: !2242)
!2242 = distinct !DILexicalBlock(scope: !2230, file: !70, line: 2185, column: 2)
!2243 = !DILocation(line: 2186, column: 10, scope: !2242)
!2244 = !DILocation(line: 2186, column: 3, scope: !2242)
!2245 = !DILocation(line: 2188, column: 1, scope: !2162)
!2246 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !70, file: !70, line: 2207, type: !2163, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2247 = !DILocalVariable(name: "value", arg: 1, scope: !2246, file: !70, line: 2207, type: !78)
!2248 = !DILocation(line: 2207, column: 30, scope: !2246)
!2249 = !DILocalVariable(name: "factor", arg: 2, scope: !2246, file: !70, line: 2207, type: !78)
!2250 = !DILocation(line: 2207, column: 41, scope: !2246)
!2251 = !DILocalVariable(name: "u32Temp1", scope: !2246, file: !70, line: 2209, type: !734)
!2252 = !DILocation(line: 2209, column: 6, scope: !2246)
!2253 = !DILocalVariable(name: "u32Temp2", scope: !2246, file: !70, line: 2209, type: !734)
!2254 = !DILocation(line: 2209, column: 17, scope: !2246)
!2255 = !DILocalVariable(name: "u32Temp3", scope: !2246, file: !70, line: 2209, type: !734)
!2256 = !DILocation(line: 2209, column: 26, scope: !2246)
!2257 = !DILocalVariable(name: "u32Temp4", scope: !2246, file: !70, line: 2209, type: !734)
!2258 = !DILocation(line: 2209, column: 35, scope: !2246)
!2259 = !DILocalVariable(name: "u8SignBit", scope: !2246, file: !70, line: 2210, type: !17)
!2260 = !DILocation(line: 2210, column: 5, scope: !2246)
!2261 = !DILocation(line: 2212, column: 7, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2246, file: !70, line: 2212, column: 5)
!2263 = !DILocation(line: 2212, column: 12, scope: !2262)
!2264 = !DILocation(line: 2212, column: 16, scope: !2262)
!2265 = !DILocation(line: 2212, column: 36, scope: !2262)
!2266 = !DILocation(line: 2212, column: 41, scope: !2262)
!2267 = !DILocation(line: 2212, column: 45, scope: !2262)
!2268 = !DILocation(line: 2214, column: 13, scope: !2269)
!2269 = distinct !DILexicalBlock(scope: !2262, file: !70, line: 2213, column: 2)
!2270 = !DILocation(line: 2215, column: 2, scope: !2269)
!2271 = !DILocation(line: 2218, column: 13, scope: !2272)
!2272 = distinct !DILexicalBlock(scope: !2262, file: !70, line: 2217, column: 2)
!2273 = !DILocation(line: 2221, column: 5, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2246, file: !70, line: 2221, column: 5)
!2275 = !DILocation(line: 2221, column: 10, scope: !2274)
!2276 = !DILocation(line: 2221, column: 5, scope: !2246)
!2277 = !DILocation(line: 2223, column: 15, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2274, file: !70, line: 2222, column: 2)
!2279 = !DILocation(line: 2223, column: 14, scope: !2278)
!2280 = !DILocation(line: 2223, column: 12, scope: !2278)
!2281 = !DILocation(line: 2224, column: 2, scope: !2278)
!2282 = !DILocation(line: 2227, column: 14, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2274, file: !70, line: 2226, column: 2)
!2284 = !DILocation(line: 2227, column: 12, scope: !2283)
!2285 = !DILocation(line: 2230, column: 5, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2246, file: !70, line: 2230, column: 5)
!2287 = !DILocation(line: 2230, column: 11, scope: !2286)
!2288 = !DILocation(line: 2230, column: 5, scope: !2246)
!2289 = !DILocation(line: 2232, column: 15, scope: !2290)
!2290 = distinct !DILexicalBlock(scope: !2286, file: !70, line: 2231, column: 2)
!2291 = !DILocation(line: 2232, column: 14, scope: !2290)
!2292 = !DILocation(line: 2232, column: 12, scope: !2290)
!2293 = !DILocation(line: 2233, column: 2, scope: !2290)
!2294 = !DILocation(line: 2236, column: 14, scope: !2295)
!2295 = distinct !DILexicalBlock(scope: !2286, file: !70, line: 2235, column: 2)
!2296 = !DILocation(line: 2236, column: 12, scope: !2295)
!2297 = !DILocation(line: 2239, column: 13, scope: !2246)
!2298 = !DILocation(line: 2239, column: 24, scope: !2246)
!2299 = !DILocation(line: 2239, column: 22, scope: !2246)
!2300 = !DILocation(line: 2239, column: 11, scope: !2246)
!2301 = !DILocation(line: 2240, column: 25, scope: !2246)
!2302 = !DILocation(line: 2240, column: 35, scope: !2246)
!2303 = !DILocation(line: 2240, column: 13, scope: !2246)
!2304 = !DILocation(line: 2240, column: 11, scope: !2246)
!2305 = !DILocation(line: 2241, column: 13, scope: !2246)
!2306 = !DILocation(line: 2241, column: 22, scope: !2246)
!2307 = !DILocation(line: 2241, column: 11, scope: !2246)
!2308 = !DILocation(line: 2242, column: 14, scope: !2246)
!2309 = !DILocation(line: 2242, column: 23, scope: !2246)
!2310 = !DILocation(line: 2242, column: 11, scope: !2246)
!2311 = !DILocation(line: 2243, column: 6, scope: !2312)
!2312 = distinct !DILexicalBlock(scope: !2246, file: !70, line: 2243, column: 5)
!2313 = !DILocation(line: 2243, column: 14, scope: !2312)
!2314 = !DILocation(line: 2243, column: 19, scope: !2312)
!2315 = !DILocation(line: 2243, column: 5, scope: !2246)
!2316 = !DILocation(line: 2245, column: 6, scope: !2317)
!2317 = distinct !DILexicalBlock(scope: !2318, file: !70, line: 2245, column: 6)
!2318 = distinct !DILexicalBlock(scope: !2312, file: !70, line: 2244, column: 2)
!2319 = !DILocation(line: 2245, column: 16, scope: !2317)
!2320 = !DILocation(line: 2245, column: 6, scope: !2318)
!2321 = !DILocation(line: 2247, column: 7, scope: !2322)
!2322 = distinct !DILexicalBlock(scope: !2323, file: !70, line: 2247, column: 7)
!2323 = distinct !DILexicalBlock(scope: !2317, file: !70, line: 2246, column: 3)
!2324 = !DILocation(line: 2247, column: 15, scope: !2322)
!2325 = !DILocation(line: 2247, column: 7, scope: !2323)
!2326 = !DILocation(line: 2248, column: 12, scope: !2322)
!2327 = !DILocation(line: 2248, column: 5, scope: !2322)
!2328 = !DILocation(line: 2250, column: 5, scope: !2322)
!2329 = !DILocation(line: 2254, column: 7, scope: !2330)
!2330 = distinct !DILexicalBlock(scope: !2331, file: !70, line: 2254, column: 7)
!2331 = distinct !DILexicalBlock(scope: !2317, file: !70, line: 2253, column: 3)
!2332 = !DILocation(line: 2254, column: 15, scope: !2330)
!2333 = !DILocation(line: 2254, column: 7, scope: !2331)
!2334 = !DILocation(line: 2255, column: 13, scope: !2330)
!2335 = !DILocation(line: 2255, column: 12, scope: !2330)
!2336 = !DILocation(line: 2255, column: 5, scope: !2330)
!2337 = !DILocation(line: 2257, column: 5, scope: !2330)
!2338 = !DILocation(line: 2262, column: 4, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2312, file: !70, line: 2261, column: 2)
!2340 = !DILocation(line: 2264, column: 1, scope: !2246)
!2341 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !70, file: !70, line: 2282, type: !2342, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2342 = !DISubroutineType(types: !2343)
!2343 = !{!78, !78, !17}
!2344 = !DILocalVariable(name: "value", arg: 1, scope: !2341, file: !70, line: 2282, type: !78)
!2345 = !DILocation(line: 2282, column: 29, scope: !2341)
!2346 = !DILocalVariable(name: "factor", arg: 2, scope: !2341, file: !70, line: 2282, type: !17)
!2347 = !DILocation(line: 2282, column: 39, scope: !2341)
!2348 = !DILocalVariable(name: "u32Temp1", scope: !2341, file: !70, line: 2284, type: !734)
!2349 = !DILocation(line: 2284, column: 6, scope: !2341)
!2350 = !DILocalVariable(name: "u32Temp2", scope: !2341, file: !70, line: 2284, type: !734)
!2351 = !DILocation(line: 2284, column: 17, scope: !2341)
!2352 = !DILocalVariable(name: "u32Temp3", scope: !2341, file: !70, line: 2284, type: !734)
!2353 = !DILocation(line: 2284, column: 26, scope: !2341)
!2354 = !DILocalVariable(name: "u8SignBit", scope: !2341, file: !70, line: 2285, type: !17)
!2355 = !DILocation(line: 2285, column: 5, scope: !2341)
!2356 = !DILocation(line: 2287, column: 5, scope: !2357)
!2357 = distinct !DILexicalBlock(scope: !2341, file: !70, line: 2287, column: 5)
!2358 = !DILocation(line: 2287, column: 10, scope: !2357)
!2359 = !DILocation(line: 2287, column: 5, scope: !2341)
!2360 = !DILocation(line: 2289, column: 15, scope: !2361)
!2361 = distinct !DILexicalBlock(scope: !2357, file: !70, line: 2288, column: 2)
!2362 = !DILocation(line: 2289, column: 14, scope: !2361)
!2363 = !DILocation(line: 2289, column: 12, scope: !2361)
!2364 = !DILocation(line: 2290, column: 13, scope: !2361)
!2365 = !DILocation(line: 2291, column: 2, scope: !2361)
!2366 = !DILocation(line: 2294, column: 14, scope: !2367)
!2367 = distinct !DILexicalBlock(scope: !2357, file: !70, line: 2293, column: 2)
!2368 = !DILocation(line: 2294, column: 12, scope: !2367)
!2369 = !DILocation(line: 2295, column: 13, scope: !2367)
!2370 = !DILocation(line: 2298, column: 13, scope: !2341)
!2371 = !DILocation(line: 2298, column: 24, scope: !2341)
!2372 = !DILocation(line: 2298, column: 22, scope: !2341)
!2373 = !DILocation(line: 2298, column: 11, scope: !2341)
!2374 = !DILocation(line: 2299, column: 25, scope: !2341)
!2375 = !DILocation(line: 2299, column: 35, scope: !2341)
!2376 = !DILocation(line: 2299, column: 13, scope: !2341)
!2377 = !DILocation(line: 2299, column: 11, scope: !2341)
!2378 = !DILocation(line: 2300, column: 13, scope: !2341)
!2379 = !DILocation(line: 2300, column: 22, scope: !2341)
!2380 = !DILocation(line: 2300, column: 11, scope: !2341)
!2381 = !DILocation(line: 2301, column: 14, scope: !2341)
!2382 = !DILocation(line: 2301, column: 23, scope: !2341)
!2383 = !DILocation(line: 2301, column: 11, scope: !2341)
!2384 = !DILocation(line: 2302, column: 5, scope: !2385)
!2385 = distinct !DILexicalBlock(scope: !2341, file: !70, line: 2302, column: 5)
!2386 = !DILocation(line: 2302, column: 15, scope: !2385)
!2387 = !DILocation(line: 2302, column: 5, scope: !2341)
!2388 = !DILocation(line: 2304, column: 10, scope: !2389)
!2389 = distinct !DILexicalBlock(scope: !2385, file: !70, line: 2303, column: 2)
!2390 = !DILocation(line: 2304, column: 3, scope: !2389)
!2391 = !DILocation(line: 2308, column: 11, scope: !2392)
!2392 = distinct !DILexicalBlock(scope: !2385, file: !70, line: 2307, column: 2)
!2393 = !DILocation(line: 2308, column: 10, scope: !2392)
!2394 = !DILocation(line: 2308, column: 3, scope: !2392)
!2395 = !DILocation(line: 2310, column: 1, scope: !2341)
!2396 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !70, file: !70, line: 2329, type: !2342, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2397 = !DILocalVariable(name: "value", arg: 1, scope: !2396, file: !70, line: 2329, type: !78)
!2398 = !DILocation(line: 2329, column: 29, scope: !2396)
!2399 = !DILocalVariable(name: "factor", arg: 2, scope: !2396, file: !70, line: 2329, type: !17)
!2400 = !DILocation(line: 2329, column: 39, scope: !2396)
!2401 = !DILocalVariable(name: "u32Temp1", scope: !2396, file: !70, line: 2331, type: !734)
!2402 = !DILocation(line: 2331, column: 6, scope: !2396)
!2403 = !DILocalVariable(name: "u32Temp2", scope: !2396, file: !70, line: 2331, type: !734)
!2404 = !DILocation(line: 2331, column: 17, scope: !2396)
!2405 = !DILocalVariable(name: "u32Temp3", scope: !2396, file: !70, line: 2331, type: !734)
!2406 = !DILocation(line: 2331, column: 26, scope: !2396)
!2407 = !DILocalVariable(name: "u8SignBit", scope: !2396, file: !70, line: 2332, type: !17)
!2408 = !DILocation(line: 2332, column: 5, scope: !2396)
!2409 = !DILocation(line: 2334, column: 5, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2396, file: !70, line: 2334, column: 5)
!2411 = !DILocation(line: 2334, column: 10, scope: !2410)
!2412 = !DILocation(line: 2334, column: 5, scope: !2396)
!2413 = !DILocation(line: 2336, column: 15, scope: !2414)
!2414 = distinct !DILexicalBlock(scope: !2410, file: !70, line: 2335, column: 2)
!2415 = !DILocation(line: 2336, column: 14, scope: !2414)
!2416 = !DILocation(line: 2336, column: 12, scope: !2414)
!2417 = !DILocation(line: 2337, column: 13, scope: !2414)
!2418 = !DILocation(line: 2338, column: 2, scope: !2414)
!2419 = !DILocation(line: 2341, column: 14, scope: !2420)
!2420 = distinct !DILexicalBlock(scope: !2410, file: !70, line: 2340, column: 2)
!2421 = !DILocation(line: 2341, column: 12, scope: !2420)
!2422 = !DILocation(line: 2342, column: 13, scope: !2420)
!2423 = !DILocation(line: 2345, column: 13, scope: !2396)
!2424 = !DILocation(line: 2345, column: 24, scope: !2396)
!2425 = !DILocation(line: 2345, column: 22, scope: !2396)
!2426 = !DILocation(line: 2345, column: 11, scope: !2396)
!2427 = !DILocation(line: 2346, column: 25, scope: !2396)
!2428 = !DILocation(line: 2346, column: 35, scope: !2396)
!2429 = !DILocation(line: 2346, column: 13, scope: !2396)
!2430 = !DILocation(line: 2346, column: 11, scope: !2396)
!2431 = !DILocation(line: 2347, column: 13, scope: !2396)
!2432 = !DILocation(line: 2347, column: 22, scope: !2396)
!2433 = !DILocation(line: 2347, column: 11, scope: !2396)
!2434 = !DILocation(line: 2348, column: 14, scope: !2396)
!2435 = !DILocation(line: 2348, column: 23, scope: !2396)
!2436 = !DILocation(line: 2348, column: 11, scope: !2396)
!2437 = !DILocation(line: 2349, column: 5, scope: !2438)
!2438 = distinct !DILexicalBlock(scope: !2396, file: !70, line: 2349, column: 5)
!2439 = !DILocation(line: 2349, column: 15, scope: !2438)
!2440 = !DILocation(line: 2349, column: 5, scope: !2396)
!2441 = !DILocation(line: 2351, column: 6, scope: !2442)
!2442 = distinct !DILexicalBlock(scope: !2443, file: !70, line: 2351, column: 6)
!2443 = distinct !DILexicalBlock(scope: !2438, file: !70, line: 2350, column: 2)
!2444 = !DILocation(line: 2351, column: 14, scope: !2442)
!2445 = !DILocation(line: 2351, column: 6, scope: !2443)
!2446 = !DILocation(line: 2352, column: 11, scope: !2442)
!2447 = !DILocation(line: 2352, column: 4, scope: !2442)
!2448 = !DILocation(line: 2354, column: 4, scope: !2442)
!2449 = !DILocation(line: 2358, column: 6, scope: !2450)
!2450 = distinct !DILexicalBlock(scope: !2451, file: !70, line: 2358, column: 6)
!2451 = distinct !DILexicalBlock(scope: !2438, file: !70, line: 2357, column: 2)
!2452 = !DILocation(line: 2358, column: 14, scope: !2450)
!2453 = !DILocation(line: 2358, column: 6, scope: !2451)
!2454 = !DILocation(line: 2359, column: 12, scope: !2450)
!2455 = !DILocation(line: 2359, column: 11, scope: !2450)
!2456 = !DILocation(line: 2359, column: 4, scope: !2450)
!2457 = !DILocation(line: 2361, column: 4, scope: !2450)
!2458 = !DILocation(line: 2363, column: 1, scope: !2396)
!2459 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !70, file: !70, line: 2380, type: !2460, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2460 = !DISubroutineType(types: !2461)
!2461 = !{!734, !734, !734, !17}
!2462 = !DILocalVariable(name: "value", arg: 1, scope: !2459, file: !70, line: 2380, type: !734)
!2463 = !DILocation(line: 2380, column: 39, scope: !2459)
!2464 = !DILocalVariable(name: "factor", arg: 2, scope: !2459, file: !70, line: 2380, type: !734)
!2465 = !DILocation(line: 2380, column: 49, scope: !2459)
!2466 = !DILocalVariable(name: "power", arg: 3, scope: !2459, file: !70, line: 2380, type: !17)
!2467 = !DILocation(line: 2380, column: 60, scope: !2459)
!2468 = !DILocalVariable(name: "u32Temp1", scope: !2459, file: !70, line: 2382, type: !734)
!2469 = !DILocation(line: 2382, column: 6, scope: !2459)
!2470 = !DILocalVariable(name: "u32Temp2", scope: !2459, file: !70, line: 2382, type: !734)
!2471 = !DILocation(line: 2382, column: 20, scope: !2459)
!2472 = !DILocation(line: 2383, column: 5, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2459, file: !70, line: 2383, column: 5)
!2474 = !DILocation(line: 2383, column: 10, scope: !2473)
!2475 = !DILocation(line: 2383, column: 5, scope: !2459)
!2476 = !DILocation(line: 2385, column: 9, scope: !2477)
!2477 = distinct !DILexicalBlock(scope: !2473, file: !70, line: 2384, column: 2)
!2478 = !DILocation(line: 2386, column: 2, scope: !2477)
!2479 = !DILocation(line: 2387, column: 10, scope: !2480)
!2480 = distinct !DILexicalBlock(scope: !2473, file: !70, line: 2387, column: 10)
!2481 = !DILocation(line: 2387, column: 15, scope: !2480)
!2482 = !DILocation(line: 2387, column: 10, scope: !2473)
!2483 = !DILocation(line: 2389, column: 9, scope: !2484)
!2484 = distinct !DILexicalBlock(scope: !2480, file: !70, line: 2388, column: 2)
!2485 = !DILocation(line: 2390, column: 2, scope: !2484)
!2486 = !DILocation(line: 2395, column: 13, scope: !2459)
!2487 = !DILocation(line: 2395, column: 21, scope: !2459)
!2488 = !DILocation(line: 2395, column: 19, scope: !2459)
!2489 = !DILocation(line: 2395, column: 11, scope: !2459)
!2490 = !DILocation(line: 2396, column: 25, scope: !2459)
!2491 = !DILocation(line: 2396, column: 32, scope: !2459)
!2492 = !DILocation(line: 2396, column: 13, scope: !2459)
!2493 = !DILocation(line: 2396, column: 11, scope: !2459)
!2494 = !DILocation(line: 2397, column: 13, scope: !2459)
!2495 = !DILocation(line: 2397, column: 29, scope: !2459)
!2496 = !DILocation(line: 2397, column: 28, scope: !2459)
!2497 = !DILocation(line: 2397, column: 22, scope: !2459)
!2498 = !DILocation(line: 2397, column: 11, scope: !2459)
!2499 = !DILocation(line: 2398, column: 14, scope: !2459)
!2500 = !DILocation(line: 2398, column: 26, scope: !2459)
!2501 = !DILocation(line: 2398, column: 23, scope: !2459)
!2502 = !DILocation(line: 2398, column: 11, scope: !2459)
!2503 = !DILocation(line: 2399, column: 6, scope: !2504)
!2504 = distinct !DILexicalBlock(scope: !2459, file: !70, line: 2399, column: 5)
!2505 = !DILocation(line: 2399, column: 20, scope: !2504)
!2506 = !DILocation(line: 2399, column: 19, scope: !2504)
!2507 = !DILocation(line: 2399, column: 14, scope: !2504)
!2508 = !DILocation(line: 2399, column: 28, scope: !2504)
!2509 = !DILocation(line: 2399, column: 5, scope: !2459)
!2510 = !DILocation(line: 2401, column: 10, scope: !2511)
!2511 = distinct !DILexicalBlock(scope: !2504, file: !70, line: 2400, column: 2)
!2512 = !DILocation(line: 2401, column: 3, scope: !2511)
!2513 = !DILocation(line: 2405, column: 3, scope: !2514)
!2514 = distinct !DILexicalBlock(scope: !2504, file: !70, line: 2404, column: 2)
!2515 = !DILocation(line: 2407, column: 1, scope: !2459)
!2516 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !70, file: !70, line: 2425, type: !2517, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2517 = !DISubroutineType(types: !2518)
!2518 = !{!78, !78, !78, !17}
!2519 = !DILocalVariable(name: "value", arg: 1, scope: !2516, file: !70, line: 2425, type: !78)
!2520 = !DILocation(line: 2425, column: 39, scope: !2516)
!2521 = !DILocalVariable(name: "factor", arg: 2, scope: !2516, file: !70, line: 2425, type: !78)
!2522 = !DILocation(line: 2425, column: 50, scope: !2516)
!2523 = !DILocalVariable(name: "power", arg: 3, scope: !2516, file: !70, line: 2425, type: !17)
!2524 = !DILocation(line: 2425, column: 61, scope: !2516)
!2525 = !DILocalVariable(name: "u32Temp1", scope: !2516, file: !70, line: 2427, type: !734)
!2526 = !DILocation(line: 2427, column: 6, scope: !2516)
!2527 = !DILocalVariable(name: "u32Temp2", scope: !2516, file: !70, line: 2427, type: !734)
!2528 = !DILocation(line: 2427, column: 17, scope: !2516)
!2529 = !DILocalVariable(name: "u32Temp3", scope: !2516, file: !70, line: 2427, type: !734)
!2530 = !DILocation(line: 2427, column: 26, scope: !2516)
!2531 = !DILocalVariable(name: "u32Temp4", scope: !2516, file: !70, line: 2427, type: !734)
!2532 = !DILocation(line: 2427, column: 35, scope: !2516)
!2533 = !DILocalVariable(name: "u8SignBit", scope: !2516, file: !70, line: 2428, type: !17)
!2534 = !DILocation(line: 2428, column: 5, scope: !2516)
!2535 = !DILocation(line: 2430, column: 5, scope: !2536)
!2536 = distinct !DILexicalBlock(scope: !2516, file: !70, line: 2430, column: 5)
!2537 = !DILocation(line: 2430, column: 10, scope: !2536)
!2538 = !DILocation(line: 2430, column: 5, scope: !2516)
!2539 = !DILocation(line: 2432, column: 9, scope: !2540)
!2540 = distinct !DILexicalBlock(scope: !2536, file: !70, line: 2431, column: 2)
!2541 = !DILocation(line: 2433, column: 2, scope: !2540)
!2542 = !DILocation(line: 2434, column: 10, scope: !2543)
!2543 = distinct !DILexicalBlock(scope: !2536, file: !70, line: 2434, column: 10)
!2544 = !DILocation(line: 2434, column: 15, scope: !2543)
!2545 = !DILocation(line: 2434, column: 10, scope: !2536)
!2546 = !DILocation(line: 2436, column: 9, scope: !2547)
!2547 = distinct !DILexicalBlock(scope: !2543, file: !70, line: 2435, column: 2)
!2548 = !DILocation(line: 2437, column: 2, scope: !2547)
!2549 = !DILocation(line: 2443, column: 7, scope: !2550)
!2550 = distinct !DILexicalBlock(scope: !2516, file: !70, line: 2443, column: 5)
!2551 = !DILocation(line: 2443, column: 12, scope: !2550)
!2552 = !DILocation(line: 2443, column: 16, scope: !2550)
!2553 = !DILocation(line: 2443, column: 36, scope: !2550)
!2554 = !DILocation(line: 2443, column: 41, scope: !2550)
!2555 = !DILocation(line: 2443, column: 45, scope: !2550)
!2556 = !DILocation(line: 2445, column: 13, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2550, file: !70, line: 2444, column: 2)
!2558 = !DILocation(line: 2446, column: 2, scope: !2557)
!2559 = !DILocation(line: 2449, column: 13, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2550, file: !70, line: 2448, column: 2)
!2561 = !DILocation(line: 2452, column: 5, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2516, file: !70, line: 2452, column: 5)
!2563 = !DILocation(line: 2452, column: 10, scope: !2562)
!2564 = !DILocation(line: 2452, column: 5, scope: !2516)
!2565 = !DILocation(line: 2454, column: 15, scope: !2566)
!2566 = distinct !DILexicalBlock(scope: !2562, file: !70, line: 2453, column: 2)
!2567 = !DILocation(line: 2454, column: 14, scope: !2566)
!2568 = !DILocation(line: 2454, column: 12, scope: !2566)
!2569 = !DILocation(line: 2455, column: 2, scope: !2566)
!2570 = !DILocation(line: 2458, column: 14, scope: !2571)
!2571 = distinct !DILexicalBlock(scope: !2562, file: !70, line: 2457, column: 2)
!2572 = !DILocation(line: 2458, column: 12, scope: !2571)
!2573 = !DILocation(line: 2461, column: 5, scope: !2574)
!2574 = distinct !DILexicalBlock(scope: !2516, file: !70, line: 2461, column: 5)
!2575 = !DILocation(line: 2461, column: 11, scope: !2574)
!2576 = !DILocation(line: 2461, column: 5, scope: !2516)
!2577 = !DILocation(line: 2463, column: 15, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2574, file: !70, line: 2462, column: 2)
!2579 = !DILocation(line: 2463, column: 14, scope: !2578)
!2580 = !DILocation(line: 2463, column: 12, scope: !2578)
!2581 = !DILocation(line: 2464, column: 2, scope: !2578)
!2582 = !DILocation(line: 2467, column: 14, scope: !2583)
!2583 = distinct !DILexicalBlock(scope: !2574, file: !70, line: 2466, column: 2)
!2584 = !DILocation(line: 2467, column: 12, scope: !2583)
!2585 = !DILocation(line: 2470, column: 13, scope: !2516)
!2586 = !DILocation(line: 2470, column: 24, scope: !2516)
!2587 = !DILocation(line: 2470, column: 22, scope: !2516)
!2588 = !DILocation(line: 2470, column: 11, scope: !2516)
!2589 = !DILocation(line: 2471, column: 25, scope: !2516)
!2590 = !DILocation(line: 2471, column: 35, scope: !2516)
!2591 = !DILocation(line: 2471, column: 13, scope: !2516)
!2592 = !DILocation(line: 2471, column: 11, scope: !2516)
!2593 = !DILocation(line: 2472, column: 13, scope: !2516)
!2594 = !DILocation(line: 2472, column: 29, scope: !2516)
!2595 = !DILocation(line: 2472, column: 28, scope: !2516)
!2596 = !DILocation(line: 2472, column: 22, scope: !2516)
!2597 = !DILocation(line: 2472, column: 11, scope: !2516)
!2598 = !DILocation(line: 2473, column: 14, scope: !2516)
!2599 = !DILocation(line: 2473, column: 26, scope: !2516)
!2600 = !DILocation(line: 2473, column: 23, scope: !2516)
!2601 = !DILocation(line: 2473, column: 11, scope: !2516)
!2602 = !DILocation(line: 2474, column: 6, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2516, file: !70, line: 2474, column: 5)
!2604 = !DILocation(line: 2474, column: 20, scope: !2603)
!2605 = !DILocation(line: 2474, column: 19, scope: !2603)
!2606 = !DILocation(line: 2474, column: 14, scope: !2603)
!2607 = !DILocation(line: 2474, column: 27, scope: !2603)
!2608 = !DILocation(line: 2474, column: 5, scope: !2516)
!2609 = !DILocation(line: 2476, column: 6, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2611, file: !70, line: 2476, column: 6)
!2611 = distinct !DILexicalBlock(scope: !2603, file: !70, line: 2475, column: 2)
!2612 = !DILocation(line: 2476, column: 16, scope: !2610)
!2613 = !DILocation(line: 2476, column: 6, scope: !2611)
!2614 = !DILocation(line: 2478, column: 7, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2616, file: !70, line: 2478, column: 7)
!2616 = distinct !DILexicalBlock(scope: !2610, file: !70, line: 2477, column: 3)
!2617 = !DILocation(line: 2478, column: 15, scope: !2615)
!2618 = !DILocation(line: 2478, column: 7, scope: !2616)
!2619 = !DILocation(line: 2479, column: 12, scope: !2615)
!2620 = !DILocation(line: 2479, column: 5, scope: !2615)
!2621 = !DILocation(line: 2481, column: 5, scope: !2615)
!2622 = !DILocation(line: 2485, column: 12, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2610, file: !70, line: 2484, column: 3)
!2624 = !DILocation(line: 2485, column: 11, scope: !2623)
!2625 = !DILocation(line: 2485, column: 4, scope: !2623)
!2626 = !DILocation(line: 2490, column: 6, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2628, file: !70, line: 2490, column: 6)
!2628 = distinct !DILexicalBlock(scope: !2603, file: !70, line: 2489, column: 2)
!2629 = !DILocation(line: 2490, column: 16, scope: !2627)
!2630 = !DILocation(line: 2490, column: 6, scope: !2628)
!2631 = !DILocation(line: 2492, column: 4, scope: !2632)
!2632 = distinct !DILexicalBlock(scope: !2627, file: !70, line: 2491, column: 3)
!2633 = !DILocation(line: 2496, column: 4, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2627, file: !70, line: 2495, column: 3)
!2635 = !DILocation(line: 2499, column: 1, scope: !2516)
!2636 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !70, file: !70, line: 2518, type: !2637, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2637 = !DISubroutineType(types: !2638)
!2638 = !{!78, !78, !6}
!2639 = !DILocalVariable(name: "value", arg: 1, scope: !2636, file: !70, line: 2518, type: !78)
!2640 = !DILocation(line: 2518, column: 29, scope: !2636)
!2641 = !DILocalVariable(name: "factor", arg: 2, scope: !2636, file: !70, line: 2518, type: !6)
!2642 = !DILocation(line: 2518, column: 39, scope: !2636)
!2643 = !DILocalVariable(name: "u32Temp1", scope: !2636, file: !70, line: 2520, type: !734)
!2644 = !DILocation(line: 2520, column: 6, scope: !2636)
!2645 = !DILocalVariable(name: "u32Temp2", scope: !2636, file: !70, line: 2520, type: !734)
!2646 = !DILocation(line: 2520, column: 17, scope: !2636)
!2647 = !DILocalVariable(name: "u32Temp3", scope: !2636, file: !70, line: 2520, type: !734)
!2648 = !DILocation(line: 2520, column: 26, scope: !2636)
!2649 = !DILocalVariable(name: "u32Temp4", scope: !2636, file: !70, line: 2520, type: !734)
!2650 = !DILocation(line: 2520, column: 35, scope: !2636)
!2651 = !DILocalVariable(name: "u8SignBit", scope: !2636, file: !70, line: 2521, type: !17)
!2652 = !DILocation(line: 2521, column: 5, scope: !2636)
!2653 = !DILocation(line: 2523, column: 7, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2636, file: !70, line: 2523, column: 5)
!2655 = !DILocation(line: 2523, column: 12, scope: !2654)
!2656 = !DILocation(line: 2523, column: 16, scope: !2654)
!2657 = !DILocation(line: 2523, column: 20, scope: !2654)
!2658 = !DILocation(line: 2523, column: 26, scope: !2654)
!2659 = !DILocation(line: 2523, column: 31, scope: !2654)
!2660 = !DILocation(line: 2523, column: 36, scope: !2654)
!2661 = !DILocation(line: 2523, column: 41, scope: !2654)
!2662 = !DILocation(line: 2523, column: 45, scope: !2654)
!2663 = !DILocation(line: 2523, column: 49, scope: !2654)
!2664 = !DILocation(line: 2523, column: 55, scope: !2654)
!2665 = !DILocation(line: 2523, column: 5, scope: !2636)
!2666 = !DILocation(line: 2525, column: 13, scope: !2667)
!2667 = distinct !DILexicalBlock(scope: !2654, file: !70, line: 2524, column: 2)
!2668 = !DILocation(line: 2526, column: 2, scope: !2667)
!2669 = !DILocation(line: 2529, column: 13, scope: !2670)
!2670 = distinct !DILexicalBlock(scope: !2654, file: !70, line: 2528, column: 2)
!2671 = !DILocation(line: 2532, column: 5, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2636, file: !70, line: 2532, column: 5)
!2673 = !DILocation(line: 2532, column: 10, scope: !2672)
!2674 = !DILocation(line: 2532, column: 5, scope: !2636)
!2675 = !DILocation(line: 2534, column: 15, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2672, file: !70, line: 2533, column: 2)
!2677 = !DILocation(line: 2534, column: 14, scope: !2676)
!2678 = !DILocation(line: 2534, column: 12, scope: !2676)
!2679 = !DILocation(line: 2535, column: 2, scope: !2676)
!2680 = !DILocation(line: 2538, column: 14, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2672, file: !70, line: 2537, column: 2)
!2682 = !DILocation(line: 2538, column: 12, scope: !2681)
!2683 = !DILocation(line: 2541, column: 5, scope: !2684)
!2684 = distinct !DILexicalBlock(scope: !2636, file: !70, line: 2541, column: 5)
!2685 = !DILocation(line: 2541, column: 11, scope: !2684)
!2686 = !DILocation(line: 2541, column: 5, scope: !2636)
!2687 = !DILocation(line: 2543, column: 15, scope: !2688)
!2688 = distinct !DILexicalBlock(scope: !2684, file: !70, line: 2542, column: 2)
!2689 = !DILocation(line: 2543, column: 14, scope: !2688)
!2690 = !DILocation(line: 2543, column: 12, scope: !2688)
!2691 = !DILocation(line: 2544, column: 2, scope: !2688)
!2692 = !DILocation(line: 2547, column: 14, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2684, file: !70, line: 2546, column: 2)
!2694 = !DILocation(line: 2547, column: 12, scope: !2693)
!2695 = !DILocation(line: 2550, column: 13, scope: !2636)
!2696 = !DILocation(line: 2550, column: 24, scope: !2636)
!2697 = !DILocation(line: 2550, column: 22, scope: !2636)
!2698 = !DILocation(line: 2550, column: 11, scope: !2636)
!2699 = !DILocation(line: 2551, column: 25, scope: !2636)
!2700 = !DILocation(line: 2551, column: 35, scope: !2636)
!2701 = !DILocation(line: 2551, column: 13, scope: !2636)
!2702 = !DILocation(line: 2551, column: 11, scope: !2636)
!2703 = !DILocation(line: 2552, column: 13, scope: !2636)
!2704 = !DILocation(line: 2552, column: 22, scope: !2636)
!2705 = !DILocation(line: 2552, column: 11, scope: !2636)
!2706 = !DILocation(line: 2553, column: 14, scope: !2636)
!2707 = !DILocation(line: 2553, column: 23, scope: !2636)
!2708 = !DILocation(line: 2553, column: 11, scope: !2636)
!2709 = !DILocation(line: 2554, column: 5, scope: !2710)
!2710 = distinct !DILexicalBlock(scope: !2636, file: !70, line: 2554, column: 5)
!2711 = !DILocation(line: 2554, column: 15, scope: !2710)
!2712 = !DILocation(line: 2554, column: 5, scope: !2636)
!2713 = !DILocation(line: 2556, column: 6, scope: !2714)
!2714 = distinct !DILexicalBlock(scope: !2715, file: !70, line: 2556, column: 6)
!2715 = distinct !DILexicalBlock(scope: !2710, file: !70, line: 2555, column: 2)
!2716 = !DILocation(line: 2556, column: 14, scope: !2714)
!2717 = !DILocation(line: 2556, column: 6, scope: !2715)
!2718 = !DILocation(line: 2557, column: 11, scope: !2714)
!2719 = !DILocation(line: 2557, column: 4, scope: !2714)
!2720 = !DILocation(line: 2559, column: 4, scope: !2714)
!2721 = !DILocation(line: 2563, column: 11, scope: !2722)
!2722 = distinct !DILexicalBlock(scope: !2710, file: !70, line: 2562, column: 2)
!2723 = !DILocation(line: 2563, column: 10, scope: !2722)
!2724 = !DILocation(line: 2563, column: 3, scope: !2722)
!2725 = !DILocation(line: 2565, column: 1, scope: !2636)
!2726 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !70, file: !70, line: 2584, type: !2637, scopeLine: 2585, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2727 = !DILocalVariable(name: "value", arg: 1, scope: !2726, file: !70, line: 2584, type: !78)
!2728 = !DILocation(line: 2584, column: 29, scope: !2726)
!2729 = !DILocalVariable(name: "factor", arg: 2, scope: !2726, file: !70, line: 2584, type: !6)
!2730 = !DILocation(line: 2584, column: 39, scope: !2726)
!2731 = !DILocalVariable(name: "u32Temp1", scope: !2726, file: !70, line: 2586, type: !734)
!2732 = !DILocation(line: 2586, column: 6, scope: !2726)
!2733 = !DILocalVariable(name: "u32Temp2", scope: !2726, file: !70, line: 2586, type: !734)
!2734 = !DILocation(line: 2586, column: 17, scope: !2726)
!2735 = !DILocalVariable(name: "u32Temp3", scope: !2726, file: !70, line: 2586, type: !734)
!2736 = !DILocation(line: 2586, column: 26, scope: !2726)
!2737 = !DILocalVariable(name: "u32Temp4", scope: !2726, file: !70, line: 2586, type: !734)
!2738 = !DILocation(line: 2586, column: 35, scope: !2726)
!2739 = !DILocalVariable(name: "u8SignBit", scope: !2726, file: !70, line: 2587, type: !17)
!2740 = !DILocation(line: 2587, column: 5, scope: !2726)
!2741 = !DILocation(line: 2589, column: 7, scope: !2742)
!2742 = distinct !DILexicalBlock(scope: !2726, file: !70, line: 2589, column: 5)
!2743 = !DILocation(line: 2589, column: 12, scope: !2742)
!2744 = !DILocation(line: 2589, column: 16, scope: !2742)
!2745 = !DILocation(line: 2589, column: 20, scope: !2742)
!2746 = !DILocation(line: 2589, column: 26, scope: !2742)
!2747 = !DILocation(line: 2589, column: 31, scope: !2742)
!2748 = !DILocation(line: 2589, column: 36, scope: !2742)
!2749 = !DILocation(line: 2589, column: 41, scope: !2742)
!2750 = !DILocation(line: 2589, column: 45, scope: !2742)
!2751 = !DILocation(line: 2589, column: 49, scope: !2742)
!2752 = !DILocation(line: 2589, column: 55, scope: !2742)
!2753 = !DILocation(line: 2589, column: 5, scope: !2726)
!2754 = !DILocation(line: 2591, column: 13, scope: !2755)
!2755 = distinct !DILexicalBlock(scope: !2742, file: !70, line: 2590, column: 2)
!2756 = !DILocation(line: 2592, column: 2, scope: !2755)
!2757 = !DILocation(line: 2595, column: 13, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2742, file: !70, line: 2594, column: 2)
!2759 = !DILocation(line: 2598, column: 5, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2726, file: !70, line: 2598, column: 5)
!2761 = !DILocation(line: 2598, column: 10, scope: !2760)
!2762 = !DILocation(line: 2598, column: 5, scope: !2726)
!2763 = !DILocation(line: 2601, column: 44, scope: !2764)
!2764 = distinct !DILexicalBlock(scope: !2765, file: !70, line: 2601, column: 7)
!2765 = distinct !DILexicalBlock(scope: !2760, file: !70, line: 2599, column: 2)
!2766 = !DILocation(line: 2601, column: 34, scope: !2764)
!2767 = !DILocation(line: 2601, column: 9, scope: !2764)
!2768 = !DILocation(line: 2601, column: 7, scope: !2765)
!2769 = !DILocation(line: 2602, column: 7, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2764, file: !70, line: 2601, column: 54)
!2771 = !DILocation(line: 2609, column: 36, scope: !2765)
!2772 = !DILocation(line: 2609, column: 35, scope: !2765)
!2773 = !DILocation(line: 2609, column: 25, scope: !2765)
!2774 = !DILocation(line: 2609, column: 23, scope: !2765)
!2775 = !DILocation(line: 2610, column: 3, scope: !2765)
!2776 = !DILocation(line: 2614, column: 14, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2760, file: !70, line: 2613, column: 2)
!2778 = !DILocation(line: 2614, column: 12, scope: !2777)
!2779 = !DILocation(line: 2617, column: 5, scope: !2780)
!2780 = distinct !DILexicalBlock(scope: !2726, file: !70, line: 2617, column: 5)
!2781 = !DILocation(line: 2617, column: 11, scope: !2780)
!2782 = !DILocation(line: 2617, column: 5, scope: !2726)
!2783 = !DILocation(line: 2619, column: 15, scope: !2784)
!2784 = distinct !DILexicalBlock(scope: !2780, file: !70, line: 2618, column: 2)
!2785 = !DILocation(line: 2619, column: 14, scope: !2784)
!2786 = !DILocation(line: 2619, column: 12, scope: !2784)
!2787 = !DILocation(line: 2620, column: 2, scope: !2784)
!2788 = !DILocation(line: 2623, column: 14, scope: !2789)
!2789 = distinct !DILexicalBlock(scope: !2780, file: !70, line: 2622, column: 2)
!2790 = !DILocation(line: 2623, column: 12, scope: !2789)
!2791 = !DILocation(line: 2626, column: 13, scope: !2726)
!2792 = !DILocation(line: 2626, column: 24, scope: !2726)
!2793 = !DILocation(line: 2626, column: 22, scope: !2726)
!2794 = !DILocation(line: 2626, column: 11, scope: !2726)
!2795 = !DILocation(line: 2627, column: 25, scope: !2726)
!2796 = !DILocation(line: 2627, column: 35, scope: !2726)
!2797 = !DILocation(line: 2627, column: 13, scope: !2726)
!2798 = !DILocation(line: 2627, column: 11, scope: !2726)
!2799 = !DILocation(line: 2628, column: 13, scope: !2726)
!2800 = !DILocation(line: 2628, column: 22, scope: !2726)
!2801 = !DILocation(line: 2628, column: 11, scope: !2726)
!2802 = !DILocation(line: 2629, column: 14, scope: !2726)
!2803 = !DILocation(line: 2629, column: 23, scope: !2726)
!2804 = !DILocation(line: 2629, column: 11, scope: !2726)
!2805 = !DILocation(line: 2630, column: 6, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2726, file: !70, line: 2630, column: 5)
!2807 = !DILocation(line: 2630, column: 14, scope: !2806)
!2808 = !DILocation(line: 2630, column: 18, scope: !2806)
!2809 = !DILocation(line: 2630, column: 5, scope: !2726)
!2810 = !DILocation(line: 2632, column: 6, scope: !2811)
!2811 = distinct !DILexicalBlock(scope: !2812, file: !70, line: 2632, column: 6)
!2812 = distinct !DILexicalBlock(scope: !2806, file: !70, line: 2631, column: 2)
!2813 = !DILocation(line: 2632, column: 16, scope: !2811)
!2814 = !DILocation(line: 2632, column: 6, scope: !2812)
!2815 = !DILocation(line: 2634, column: 7, scope: !2816)
!2816 = distinct !DILexicalBlock(scope: !2817, file: !70, line: 2634, column: 7)
!2817 = distinct !DILexicalBlock(scope: !2811, file: !70, line: 2633, column: 3)
!2818 = !DILocation(line: 2634, column: 15, scope: !2816)
!2819 = !DILocation(line: 2634, column: 7, scope: !2817)
!2820 = !DILocation(line: 2635, column: 12, scope: !2816)
!2821 = !DILocation(line: 2635, column: 5, scope: !2816)
!2822 = !DILocation(line: 2637, column: 5, scope: !2816)
!2823 = !DILocation(line: 2641, column: 7, scope: !2824)
!2824 = distinct !DILexicalBlock(scope: !2825, file: !70, line: 2641, column: 7)
!2825 = distinct !DILexicalBlock(scope: !2811, file: !70, line: 2640, column: 3)
!2826 = !DILocation(line: 2641, column: 15, scope: !2824)
!2827 = !DILocation(line: 2641, column: 7, scope: !2825)
!2828 = !DILocation(line: 2642, column: 13, scope: !2824)
!2829 = !DILocation(line: 2642, column: 12, scope: !2824)
!2830 = !DILocation(line: 2642, column: 5, scope: !2824)
!2831 = !DILocation(line: 2644, column: 5, scope: !2824)
!2832 = !DILocation(line: 2649, column: 3, scope: !2833)
!2833 = distinct !DILexicalBlock(scope: !2806, file: !70, line: 2648, column: 2)
!2834 = !DILocation(line: 2651, column: 1, scope: !2726)
!2835 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !2836, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2836 = !DISubroutineType(types: !2837)
!2837 = !{!51, !26}
!2838 = !DILocalVariable(name: "value", arg: 1, scope: !2835, file: !30, line: 42, type: !26)
!2839 = !DILocation(line: 42, column: 38, scope: !2835)
!2840 = !DILocation(line: 44, column: 12, scope: !2835)
!2841 = !DILocation(line: 44, column: 18, scope: !2835)
!2842 = !DILocation(line: 44, column: 5, scope: !2835)
!2843 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !70, file: !70, line: 2666, type: !2163, scopeLine: 2667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2844 = !DILocalVariable(name: "val1", arg: 1, scope: !2843, file: !70, line: 2666, type: !78)
!2845 = !DILocation(line: 2666, column: 25, scope: !2843)
!2846 = !DILocalVariable(name: "val2", arg: 2, scope: !2843, file: !70, line: 2666, type: !78)
!2847 = !DILocation(line: 2666, column: 35, scope: !2843)
!2848 = !DILocalVariable(name: "u32Temp1", scope: !2843, file: !70, line: 2668, type: !734)
!2849 = !DILocation(line: 2668, column: 6, scope: !2843)
!2850 = !DILocalVariable(name: "u32Temp2", scope: !2843, file: !70, line: 2668, type: !734)
!2851 = !DILocation(line: 2668, column: 17, scope: !2843)
!2852 = !DILocalVariable(name: "u32Temp3", scope: !2843, file: !70, line: 2668, type: !734)
!2853 = !DILocation(line: 2668, column: 26, scope: !2843)
!2854 = !DILocalVariable(name: "u32Temp4", scope: !2843, file: !70, line: 2668, type: !734)
!2855 = !DILocation(line: 2668, column: 35, scope: !2843)
!2856 = !DILocalVariable(name: "u8SignBit", scope: !2843, file: !70, line: 2669, type: !17)
!2857 = !DILocation(line: 2669, column: 5, scope: !2843)
!2858 = !DILocation(line: 2671, column: 7, scope: !2859)
!2859 = distinct !DILexicalBlock(scope: !2843, file: !70, line: 2671, column: 5)
!2860 = !DILocation(line: 2671, column: 11, scope: !2859)
!2861 = !DILocation(line: 2671, column: 15, scope: !2859)
!2862 = !DILocation(line: 2671, column: 33, scope: !2859)
!2863 = !DILocation(line: 2671, column: 37, scope: !2859)
!2864 = !DILocation(line: 2671, column: 41, scope: !2859)
!2865 = !DILocation(line: 2673, column: 13, scope: !2866)
!2866 = distinct !DILexicalBlock(scope: !2859, file: !70, line: 2672, column: 2)
!2867 = !DILocation(line: 2674, column: 2, scope: !2866)
!2868 = !DILocation(line: 2677, column: 13, scope: !2869)
!2869 = distinct !DILexicalBlock(scope: !2859, file: !70, line: 2676, column: 2)
!2870 = !DILocation(line: 2680, column: 5, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2843, file: !70, line: 2680, column: 5)
!2872 = !DILocation(line: 2680, column: 9, scope: !2871)
!2873 = !DILocation(line: 2680, column: 5, scope: !2843)
!2874 = !DILocation(line: 2682, column: 15, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2871, file: !70, line: 2681, column: 2)
!2876 = !DILocation(line: 2682, column: 14, scope: !2875)
!2877 = !DILocation(line: 2682, column: 12, scope: !2875)
!2878 = !DILocation(line: 2683, column: 2, scope: !2875)
!2879 = !DILocation(line: 2686, column: 14, scope: !2880)
!2880 = distinct !DILexicalBlock(scope: !2871, file: !70, line: 2685, column: 2)
!2881 = !DILocation(line: 2686, column: 12, scope: !2880)
!2882 = !DILocation(line: 2689, column: 5, scope: !2883)
!2883 = distinct !DILexicalBlock(scope: !2843, file: !70, line: 2689, column: 5)
!2884 = !DILocation(line: 2689, column: 9, scope: !2883)
!2885 = !DILocation(line: 2689, column: 5, scope: !2843)
!2886 = !DILocation(line: 2691, column: 15, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2883, file: !70, line: 2690, column: 2)
!2888 = !DILocation(line: 2691, column: 14, scope: !2887)
!2889 = !DILocation(line: 2691, column: 12, scope: !2887)
!2890 = !DILocation(line: 2692, column: 2, scope: !2887)
!2891 = !DILocation(line: 2695, column: 14, scope: !2892)
!2892 = distinct !DILexicalBlock(scope: !2883, file: !70, line: 2694, column: 2)
!2893 = !DILocation(line: 2695, column: 12, scope: !2892)
!2894 = !DILocation(line: 2698, column: 13, scope: !2843)
!2895 = !DILocation(line: 2698, column: 24, scope: !2843)
!2896 = !DILocation(line: 2698, column: 22, scope: !2843)
!2897 = !DILocation(line: 2698, column: 11, scope: !2843)
!2898 = !DILocation(line: 2699, column: 25, scope: !2843)
!2899 = !DILocation(line: 2699, column: 35, scope: !2843)
!2900 = !DILocation(line: 2699, column: 13, scope: !2843)
!2901 = !DILocation(line: 2699, column: 11, scope: !2843)
!2902 = !DILocation(line: 2700, column: 5, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2843, file: !70, line: 2700, column: 5)
!2904 = !DILocation(line: 2700, column: 13, scope: !2903)
!2905 = !DILocation(line: 2700, column: 5, scope: !2843)
!2906 = !DILocation(line: 2702, column: 6, scope: !2907)
!2907 = distinct !DILexicalBlock(scope: !2908, file: !70, line: 2702, column: 6)
!2908 = distinct !DILexicalBlock(scope: !2903, file: !70, line: 2701, column: 2)
!2909 = !DILocation(line: 2702, column: 16, scope: !2907)
!2910 = !DILocation(line: 2702, column: 6, scope: !2908)
!2911 = !DILocation(line: 2704, column: 7, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2913, file: !70, line: 2704, column: 7)
!2913 = distinct !DILexicalBlock(scope: !2907, file: !70, line: 2703, column: 3)
!2914 = !DILocation(line: 2704, column: 15, scope: !2912)
!2915 = !DILocation(line: 2704, column: 7, scope: !2913)
!2916 = !DILocation(line: 2705, column: 12, scope: !2912)
!2917 = !DILocation(line: 2705, column: 5, scope: !2912)
!2918 = !DILocation(line: 2707, column: 5, scope: !2912)
!2919 = !DILocation(line: 2711, column: 7, scope: !2920)
!2920 = distinct !DILexicalBlock(scope: !2921, file: !70, line: 2711, column: 7)
!2921 = distinct !DILexicalBlock(scope: !2907, file: !70, line: 2710, column: 3)
!2922 = !DILocation(line: 2711, column: 15, scope: !2920)
!2923 = !DILocation(line: 2711, column: 7, scope: !2921)
!2924 = !DILocation(line: 2712, column: 13, scope: !2920)
!2925 = !DILocation(line: 2712, column: 12, scope: !2920)
!2926 = !DILocation(line: 2712, column: 5, scope: !2920)
!2927 = !DILocation(line: 2714, column: 5, scope: !2920)
!2928 = !DILocation(line: 2719, column: 6, scope: !2929)
!2929 = distinct !DILexicalBlock(scope: !2930, file: !70, line: 2719, column: 6)
!2930 = distinct !DILexicalBlock(scope: !2903, file: !70, line: 2718, column: 2)
!2931 = !DILocation(line: 2719, column: 16, scope: !2929)
!2932 = !DILocation(line: 2719, column: 6, scope: !2930)
!2933 = !DILocation(line: 2721, column: 4, scope: !2934)
!2934 = distinct !DILexicalBlock(scope: !2929, file: !70, line: 2720, column: 3)
!2935 = !DILocation(line: 2725, column: 4, scope: !2936)
!2936 = distinct !DILexicalBlock(scope: !2929, file: !70, line: 2724, column: 3)
!2937 = !DILocation(line: 2729, column: 1, scope: !2843)
!2938 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !70, file: !70, line: 2747, type: !2059, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2939 = !DILocalVariable(name: "value", arg: 1, scope: !2938, file: !70, line: 2747, type: !78)
!2940 = !DILocation(line: 2747, column: 31, scope: !2938)
!2941 = !DILocalVariable(name: "factor", arg: 2, scope: !2938, file: !70, line: 2747, type: !734)
!2942 = !DILocation(line: 2747, column: 42, scope: !2938)
!2943 = !DILocalVariable(name: "u32Temp1", scope: !2938, file: !70, line: 2749, type: !734)
!2944 = !DILocation(line: 2749, column: 6, scope: !2938)
!2945 = !DILocalVariable(name: "u32Temp2", scope: !2938, file: !70, line: 2749, type: !734)
!2946 = !DILocation(line: 2749, column: 17, scope: !2938)
!2947 = !DILocalVariable(name: "u8SignBit", scope: !2938, file: !70, line: 2750, type: !17)
!2948 = !DILocation(line: 2750, column: 5, scope: !2938)
!2949 = !DILocation(line: 2752, column: 5, scope: !2950)
!2950 = distinct !DILexicalBlock(scope: !2938, file: !70, line: 2752, column: 5)
!2951 = !DILocation(line: 2752, column: 10, scope: !2950)
!2952 = !DILocation(line: 2752, column: 5, scope: !2938)
!2953 = !DILocation(line: 2754, column: 15, scope: !2954)
!2954 = distinct !DILexicalBlock(scope: !2950, file: !70, line: 2753, column: 2)
!2955 = !DILocation(line: 2754, column: 14, scope: !2954)
!2956 = !DILocation(line: 2754, column: 12, scope: !2954)
!2957 = !DILocation(line: 2755, column: 13, scope: !2954)
!2958 = !DILocation(line: 2756, column: 2, scope: !2954)
!2959 = !DILocation(line: 2759, column: 14, scope: !2960)
!2960 = distinct !DILexicalBlock(scope: !2950, file: !70, line: 2758, column: 2)
!2961 = !DILocation(line: 2759, column: 12, scope: !2960)
!2962 = !DILocation(line: 2760, column: 13, scope: !2960)
!2963 = !DILocation(line: 2763, column: 25, scope: !2938)
!2964 = !DILocation(line: 2763, column: 35, scope: !2938)
!2965 = !DILocation(line: 2763, column: 13, scope: !2938)
!2966 = !DILocation(line: 2763, column: 11, scope: !2938)
!2967 = !DILocation(line: 2764, column: 13, scope: !2938)
!2968 = !DILocation(line: 2764, column: 22, scope: !2938)
!2969 = !DILocation(line: 2764, column: 11, scope: !2938)
!2970 = !DILocation(line: 2765, column: 5, scope: !2971)
!2971 = distinct !DILexicalBlock(scope: !2938, file: !70, line: 2765, column: 5)
!2972 = !DILocation(line: 2765, column: 15, scope: !2971)
!2973 = !DILocation(line: 2765, column: 5, scope: !2938)
!2974 = !DILocation(line: 2767, column: 10, scope: !2975)
!2975 = distinct !DILexicalBlock(scope: !2971, file: !70, line: 2766, column: 2)
!2976 = !DILocation(line: 2767, column: 3, scope: !2975)
!2977 = !DILocation(line: 2771, column: 11, scope: !2978)
!2978 = distinct !DILexicalBlock(scope: !2971, file: !70, line: 2770, column: 2)
!2979 = !DILocation(line: 2771, column: 10, scope: !2978)
!2980 = !DILocation(line: 2771, column: 3, scope: !2978)
!2981 = !DILocation(line: 2773, column: 1, scope: !2938)
!2982 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !70, file: !70, line: 2789, type: !2163, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2983 = !DILocalVariable(name: "value", arg: 1, scope: !2982, file: !70, line: 2789, type: !78)
!2984 = !DILocation(line: 2789, column: 31, scope: !2982)
!2985 = !DILocalVariable(name: "factor", arg: 2, scope: !2982, file: !70, line: 2789, type: !78)
!2986 = !DILocation(line: 2789, column: 42, scope: !2982)
!2987 = !DILocalVariable(name: "u32Temp1", scope: !2982, file: !70, line: 2791, type: !734)
!2988 = !DILocation(line: 2791, column: 6, scope: !2982)
!2989 = !DILocalVariable(name: "u32Temp2", scope: !2982, file: !70, line: 2791, type: !734)
!2990 = !DILocation(line: 2791, column: 17, scope: !2982)
!2991 = !DILocalVariable(name: "u32Temp3", scope: !2982, file: !70, line: 2791, type: !734)
!2992 = !DILocation(line: 2791, column: 26, scope: !2982)
!2993 = !DILocalVariable(name: "u8SignBit", scope: !2982, file: !70, line: 2792, type: !17)
!2994 = !DILocation(line: 2792, column: 5, scope: !2982)
!2995 = !DILocation(line: 2794, column: 7, scope: !2996)
!2996 = distinct !DILexicalBlock(scope: !2982, file: !70, line: 2794, column: 5)
!2997 = !DILocation(line: 2794, column: 12, scope: !2996)
!2998 = !DILocation(line: 2794, column: 16, scope: !2996)
!2999 = !DILocation(line: 2794, column: 36, scope: !2996)
!3000 = !DILocation(line: 2794, column: 41, scope: !2996)
!3001 = !DILocation(line: 2794, column: 45, scope: !2996)
!3002 = !DILocation(line: 2796, column: 13, scope: !3003)
!3003 = distinct !DILexicalBlock(scope: !2996, file: !70, line: 2795, column: 2)
!3004 = !DILocation(line: 2797, column: 2, scope: !3003)
!3005 = !DILocation(line: 2800, column: 13, scope: !3006)
!3006 = distinct !DILexicalBlock(scope: !2996, file: !70, line: 2799, column: 2)
!3007 = !DILocation(line: 2803, column: 5, scope: !3008)
!3008 = distinct !DILexicalBlock(scope: !2982, file: !70, line: 2803, column: 5)
!3009 = !DILocation(line: 2803, column: 10, scope: !3008)
!3010 = !DILocation(line: 2803, column: 5, scope: !2982)
!3011 = !DILocation(line: 2805, column: 15, scope: !3012)
!3012 = distinct !DILexicalBlock(scope: !3008, file: !70, line: 2804, column: 2)
!3013 = !DILocation(line: 2805, column: 14, scope: !3012)
!3014 = !DILocation(line: 2805, column: 12, scope: !3012)
!3015 = !DILocation(line: 2806, column: 2, scope: !3012)
!3016 = !DILocation(line: 2809, column: 14, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !3008, file: !70, line: 2808, column: 2)
!3018 = !DILocation(line: 2809, column: 12, scope: !3017)
!3019 = !DILocation(line: 2812, column: 5, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !2982, file: !70, line: 2812, column: 5)
!3021 = !DILocation(line: 2812, column: 11, scope: !3020)
!3022 = !DILocation(line: 2812, column: 5, scope: !2982)
!3023 = !DILocation(line: 2814, column: 15, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !3020, file: !70, line: 2813, column: 2)
!3025 = !DILocation(line: 2814, column: 14, scope: !3024)
!3026 = !DILocation(line: 2814, column: 12, scope: !3024)
!3027 = !DILocation(line: 2815, column: 2, scope: !3024)
!3028 = !DILocation(line: 2818, column: 14, scope: !3029)
!3029 = distinct !DILexicalBlock(scope: !3020, file: !70, line: 2817, column: 2)
!3030 = !DILocation(line: 2818, column: 12, scope: !3029)
!3031 = !DILocation(line: 2821, column: 25, scope: !2982)
!3032 = !DILocation(line: 2821, column: 35, scope: !2982)
!3033 = !DILocation(line: 2821, column: 13, scope: !2982)
!3034 = !DILocation(line: 2821, column: 11, scope: !2982)
!3035 = !DILocation(line: 2822, column: 5, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !2982, file: !70, line: 2822, column: 5)
!3037 = !DILocation(line: 2822, column: 15, scope: !3036)
!3038 = !DILocation(line: 2822, column: 5, scope: !2982)
!3039 = !DILocation(line: 2824, column: 10, scope: !3040)
!3040 = distinct !DILexicalBlock(scope: !3036, file: !70, line: 2823, column: 2)
!3041 = !DILocation(line: 2824, column: 3, scope: !3040)
!3042 = !DILocation(line: 2828, column: 11, scope: !3043)
!3043 = distinct !DILexicalBlock(scope: !3036, file: !70, line: 2827, column: 2)
!3044 = !DILocation(line: 2828, column: 10, scope: !3043)
!3045 = !DILocation(line: 2828, column: 3, scope: !3043)
!3046 = !DILocation(line: 2830, column: 1, scope: !2982)
!3047 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !70, file: !70, line: 2847, type: !3048, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3048 = !DISubroutineType(types: !3049)
!3049 = !{!734, !734, !17}
!3050 = !DILocalVariable(name: "value", arg: 1, scope: !3047, file: !70, line: 2847, type: !734)
!3051 = !DILocation(line: 2847, column: 29, scope: !3047)
!3052 = !DILocalVariable(name: "factor", arg: 2, scope: !3047, file: !70, line: 2847, type: !17)
!3053 = !DILocation(line: 2847, column: 39, scope: !3047)
!3054 = !DILocalVariable(name: "u32Temp1", scope: !3047, file: !70, line: 2849, type: !734)
!3055 = !DILocation(line: 2849, column: 6, scope: !3047)
!3056 = !DILocalVariable(name: "u32Temp2", scope: !3047, file: !70, line: 2849, type: !734)
!3057 = !DILocation(line: 2849, column: 20, scope: !3047)
!3058 = !DILocation(line: 2850, column: 13, scope: !3047)
!3059 = !DILocation(line: 2850, column: 21, scope: !3047)
!3060 = !DILocation(line: 2850, column: 19, scope: !3047)
!3061 = !DILocation(line: 2850, column: 11, scope: !3047)
!3062 = !DILocation(line: 2851, column: 25, scope: !3047)
!3063 = !DILocation(line: 2851, column: 32, scope: !3047)
!3064 = !DILocation(line: 2851, column: 13, scope: !3047)
!3065 = !DILocation(line: 2851, column: 11, scope: !3047)
!3066 = !DILocation(line: 2852, column: 14, scope: !3047)
!3067 = !DILocation(line: 2852, column: 23, scope: !3047)
!3068 = !DILocation(line: 2852, column: 11, scope: !3047)
!3069 = !DILocation(line: 2853, column: 14, scope: !3047)
!3070 = !DILocation(line: 2853, column: 23, scope: !3047)
!3071 = !DILocation(line: 2853, column: 11, scope: !3047)
!3072 = !DILocation(line: 2854, column: 9, scope: !3047)
!3073 = !DILocation(line: 2854, column: 2, scope: !3047)
!3074 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !70, file: !70, line: 2873, type: !3048, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3075 = !DILocalVariable(name: "value", arg: 1, scope: !3074, file: !70, line: 2873, type: !734)
!3076 = !DILocation(line: 2873, column: 29, scope: !3074)
!3077 = !DILocalVariable(name: "factor", arg: 2, scope: !3074, file: !70, line: 2873, type: !17)
!3078 = !DILocation(line: 2873, column: 39, scope: !3074)
!3079 = !DILocalVariable(name: "u32Temp1", scope: !3074, file: !70, line: 2875, type: !734)
!3080 = !DILocation(line: 2875, column: 6, scope: !3074)
!3081 = !DILocalVariable(name: "u32Temp2", scope: !3074, file: !70, line: 2875, type: !734)
!3082 = !DILocation(line: 2875, column: 20, scope: !3074)
!3083 = !DILocation(line: 2876, column: 13, scope: !3074)
!3084 = !DILocation(line: 2876, column: 21, scope: !3074)
!3085 = !DILocation(line: 2876, column: 19, scope: !3074)
!3086 = !DILocation(line: 2876, column: 11, scope: !3074)
!3087 = !DILocation(line: 2877, column: 25, scope: !3074)
!3088 = !DILocation(line: 2877, column: 32, scope: !3074)
!3089 = !DILocation(line: 2877, column: 13, scope: !3074)
!3090 = !DILocation(line: 2877, column: 11, scope: !3074)
!3091 = !DILocation(line: 2878, column: 14, scope: !3074)
!3092 = !DILocation(line: 2878, column: 23, scope: !3074)
!3093 = !DILocation(line: 2878, column: 11, scope: !3074)
!3094 = !DILocation(line: 2879, column: 14, scope: !3074)
!3095 = !DILocation(line: 2879, column: 23, scope: !3074)
!3096 = !DILocation(line: 2879, column: 11, scope: !3074)
!3097 = !DILocation(line: 2880, column: 6, scope: !3098)
!3098 = distinct !DILexicalBlock(scope: !3074, file: !70, line: 2880, column: 5)
!3099 = !DILocation(line: 2880, column: 14, scope: !3098)
!3100 = !DILocation(line: 2880, column: 19, scope: !3098)
!3101 = !DILocation(line: 2880, column: 5, scope: !3074)
!3102 = !DILocation(line: 2882, column: 10, scope: !3103)
!3103 = distinct !DILexicalBlock(scope: !3098, file: !70, line: 2881, column: 2)
!3104 = !DILocation(line: 2882, column: 3, scope: !3103)
!3105 = !DILocation(line: 2886, column: 3, scope: !3106)
!3106 = distinct !DILexicalBlock(scope: !3098, file: !70, line: 2885, column: 2)
!3107 = !DILocation(line: 2889, column: 1, scope: !3074)
!3108 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !70, file: !70, line: 2908, type: !3109, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3109 = !DISubroutineType(types: !3110)
!3110 = !{!734, !734, !6}
!3111 = !DILocalVariable(name: "value", arg: 1, scope: !3108, file: !70, line: 2908, type: !734)
!3112 = !DILocation(line: 2908, column: 29, scope: !3108)
!3113 = !DILocalVariable(name: "factor", arg: 2, scope: !3108, file: !70, line: 2908, type: !6)
!3114 = !DILocation(line: 2908, column: 39, scope: !3108)
!3115 = !DILocalVariable(name: "u32Temp1", scope: !3108, file: !70, line: 2910, type: !734)
!3116 = !DILocation(line: 2910, column: 6, scope: !3108)
!3117 = !DILocalVariable(name: "u32Temp2", scope: !3108, file: !70, line: 2910, type: !734)
!3118 = !DILocation(line: 2910, column: 20, scope: !3108)
!3119 = !DILocation(line: 2911, column: 5, scope: !3120)
!3120 = distinct !DILexicalBlock(scope: !3108, file: !70, line: 2911, column: 5)
!3121 = !DILocation(line: 2911, column: 12, scope: !3120)
!3122 = !DILocation(line: 2911, column: 5, scope: !3108)
!3123 = !DILocation(line: 2914, column: 14, scope: !3124)
!3124 = distinct !DILexicalBlock(scope: !3120, file: !70, line: 2912, column: 2)
!3125 = !DILocation(line: 2914, column: 22, scope: !3124)
!3126 = !DILocation(line: 2914, column: 20, scope: !3124)
!3127 = !DILocation(line: 2914, column: 12, scope: !3124)
!3128 = !DILocation(line: 2915, column: 26, scope: !3124)
!3129 = !DILocation(line: 2915, column: 33, scope: !3124)
!3130 = !DILocation(line: 2915, column: 14, scope: !3124)
!3131 = !DILocation(line: 2915, column: 12, scope: !3124)
!3132 = !DILocation(line: 2916, column: 14, scope: !3124)
!3133 = !DILocation(line: 2916, column: 23, scope: !3124)
!3134 = !DILocation(line: 2916, column: 12, scope: !3124)
!3135 = !DILocation(line: 2917, column: 15, scope: !3124)
!3136 = !DILocation(line: 2917, column: 24, scope: !3124)
!3137 = !DILocation(line: 2917, column: 12, scope: !3124)
!3138 = !DILocation(line: 2918, column: 10, scope: !3124)
!3139 = !DILocation(line: 2918, column: 3, scope: !3124)
!3140 = !DILocation(line: 2922, column: 3, scope: !3141)
!3141 = distinct !DILexicalBlock(scope: !3120, file: !70, line: 2921, column: 2)
!3142 = !DILocation(line: 2924, column: 1, scope: !3108)
!3143 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !70, file: !70, line: 2943, type: !3109, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3144 = !DILocalVariable(name: "value", arg: 1, scope: !3143, file: !70, line: 2943, type: !734)
!3145 = !DILocation(line: 2943, column: 29, scope: !3143)
!3146 = !DILocalVariable(name: "factor", arg: 2, scope: !3143, file: !70, line: 2943, type: !6)
!3147 = !DILocation(line: 2943, column: 39, scope: !3143)
!3148 = !DILocalVariable(name: "u32Temp1", scope: !3143, file: !70, line: 2945, type: !734)
!3149 = !DILocation(line: 2945, column: 6, scope: !3143)
!3150 = !DILocalVariable(name: "u32Temp2", scope: !3143, file: !70, line: 2945, type: !734)
!3151 = !DILocation(line: 2945, column: 20, scope: !3143)
!3152 = !DILocation(line: 2946, column: 5, scope: !3153)
!3153 = distinct !DILexicalBlock(scope: !3143, file: !70, line: 2946, column: 5)
!3154 = !DILocation(line: 2946, column: 12, scope: !3153)
!3155 = !DILocation(line: 2946, column: 5, scope: !3143)
!3156 = !DILocation(line: 2948, column: 3, scope: !3157)
!3157 = distinct !DILexicalBlock(scope: !3153, file: !70, line: 2947, column: 2)
!3158 = !DILocation(line: 2952, column: 14, scope: !3159)
!3159 = distinct !DILexicalBlock(scope: !3153, file: !70, line: 2951, column: 2)
!3160 = !DILocation(line: 2952, column: 22, scope: !3159)
!3161 = !DILocation(line: 2952, column: 20, scope: !3159)
!3162 = !DILocation(line: 2952, column: 12, scope: !3159)
!3163 = !DILocation(line: 2953, column: 26, scope: !3159)
!3164 = !DILocation(line: 2953, column: 33, scope: !3159)
!3165 = !DILocation(line: 2953, column: 14, scope: !3159)
!3166 = !DILocation(line: 2953, column: 12, scope: !3159)
!3167 = !DILocation(line: 2954, column: 14, scope: !3159)
!3168 = !DILocation(line: 2954, column: 23, scope: !3159)
!3169 = !DILocation(line: 2954, column: 12, scope: !3159)
!3170 = !DILocation(line: 2955, column: 15, scope: !3159)
!3171 = !DILocation(line: 2955, column: 24, scope: !3159)
!3172 = !DILocation(line: 2955, column: 12, scope: !3159)
!3173 = !DILocation(line: 2956, column: 7, scope: !3174)
!3174 = distinct !DILexicalBlock(scope: !3159, file: !70, line: 2956, column: 6)
!3175 = !DILocation(line: 2956, column: 16, scope: !3174)
!3176 = !DILocation(line: 2956, column: 22, scope: !3174)
!3177 = !DILocation(line: 2956, column: 6, scope: !3159)
!3178 = !DILocation(line: 2958, column: 11, scope: !3179)
!3179 = distinct !DILexicalBlock(scope: !3174, file: !70, line: 2957, column: 3)
!3180 = !DILocation(line: 2958, column: 4, scope: !3179)
!3181 = !DILocation(line: 2962, column: 4, scope: !3182)
!3182 = distinct !DILexicalBlock(scope: !3174, file: !70, line: 2961, column: 3)
!3183 = !DILocation(line: 2965, column: 1, scope: !3143)
!3184 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !70, file: !70, line: 2987, type: !299, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3185 = !DILocalVariable(name: "value", arg: 1, scope: !3184, file: !70, line: 2987, type: !13)
!3186 = !DILocation(line: 2987, column: 33, scope: !3184)
!3187 = !DILocalVariable(name: "factor", arg: 2, scope: !3184, file: !70, line: 2987, type: !13)
!3188 = !DILocation(line: 2987, column: 44, scope: !3184)
!3189 = !DILocation(line: 2989, column: 40, scope: !3184)
!3190 = !DILocation(line: 2989, column: 46, scope: !3184)
!3191 = !DILocation(line: 2989, column: 9, scope: !3184)
!3192 = !DILocation(line: 2989, column: 2, scope: !3184)
!3193 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !70, file: !70, line: 3011, type: !299, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3194 = !DILocalVariable(name: "value", arg: 1, scope: !3193, file: !70, line: 3011, type: !13)
!3195 = !DILocation(line: 3011, column: 33, scope: !3193)
!3196 = !DILocalVariable(name: "factor", arg: 2, scope: !3193, file: !70, line: 3011, type: !13)
!3197 = !DILocation(line: 3011, column: 44, scope: !3193)
!3198 = !DILocation(line: 3013, column: 41, scope: !3193)
!3199 = !DILocation(line: 3013, column: 47, scope: !3193)
!3200 = !DILocation(line: 3013, column: 10, scope: !3193)
!3201 = !DILocation(line: 3013, column: 3, scope: !3193)
!3202 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !70, file: !70, line: 3036, type: !299, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3203 = !DILocalVariable(name: "value", arg: 1, scope: !3202, file: !70, line: 3036, type: !13)
!3204 = !DILocation(line: 3036, column: 32, scope: !3202)
!3205 = !DILocalVariable(name: "factor", arg: 2, scope: !3202, file: !70, line: 3036, type: !13)
!3206 = !DILocation(line: 3036, column: 43, scope: !3202)
!3207 = !DILocation(line: 3038, column: 41, scope: !3202)
!3208 = !DILocation(line: 3038, column: 47, scope: !3202)
!3209 = !DILocation(line: 3038, column: 10, scope: !3202)
!3210 = !DILocation(line: 3038, column: 3, scope: !3202)
!3211 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !70, file: !70, line: 3061, type: !299, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3212 = !DILocalVariable(name: "value", arg: 1, scope: !3211, file: !70, line: 3061, type: !13)
!3213 = !DILocation(line: 3061, column: 34, scope: !3211)
!3214 = !DILocalVariable(name: "factor", arg: 2, scope: !3211, file: !70, line: 3061, type: !13)
!3215 = !DILocation(line: 3061, column: 45, scope: !3211)
!3216 = !DILocation(line: 3063, column: 44, scope: !3211)
!3217 = !DILocation(line: 3063, column: 50, scope: !3211)
!3218 = !DILocation(line: 3063, column: 10, scope: !3211)
!3219 = !DILocation(line: 3063, column: 3, scope: !3211)
!3220 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !70, file: !70, line: 3086, type: !299, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3221 = !DILocalVariable(name: "value", arg: 1, scope: !3220, file: !70, line: 3086, type: !13)
!3222 = !DILocation(line: 3086, column: 33, scope: !3220)
!3223 = !DILocalVariable(name: "factor", arg: 2, scope: !3220, file: !70, line: 3086, type: !13)
!3224 = !DILocation(line: 3086, column: 44, scope: !3220)
!3225 = !DILocation(line: 3088, column: 44, scope: !3220)
!3226 = !DILocation(line: 3088, column: 50, scope: !3220)
!3227 = !DILocation(line: 3088, column: 10, scope: !3220)
!3228 = !DILocation(line: 3088, column: 3, scope: !3220)
!3229 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !70, file: !70, line: 3111, type: !299, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3230 = !DILocalVariable(name: "value", arg: 1, scope: !3229, file: !70, line: 3111, type: !13)
!3231 = !DILocation(line: 3111, column: 31, scope: !3229)
!3232 = !DILocalVariable(name: "factor", arg: 2, scope: !3229, file: !70, line: 3111, type: !13)
!3233 = !DILocation(line: 3111, column: 42, scope: !3229)
!3234 = !DILocation(line: 3113, column: 44, scope: !3229)
!3235 = !DILocation(line: 3113, column: 50, scope: !3229)
!3236 = !DILocation(line: 3113, column: 10, scope: !3229)
!3237 = !DILocation(line: 3113, column: 3, scope: !3229)
!3238 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !70, file: !70, line: 3136, type: !299, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3239 = !DILocalVariable(name: "value", arg: 1, scope: !3238, file: !70, line: 3136, type: !13)
!3240 = !DILocation(line: 3136, column: 33, scope: !3238)
!3241 = !DILocalVariable(name: "factor", arg: 2, scope: !3238, file: !70, line: 3136, type: !13)
!3242 = !DILocation(line: 3136, column: 44, scope: !3238)
!3243 = !DILocation(line: 3138, column: 44, scope: !3238)
!3244 = !DILocation(line: 3138, column: 50, scope: !3238)
!3245 = !DILocation(line: 3138, column: 10, scope: !3238)
!3246 = !DILocation(line: 3138, column: 3, scope: !3238)
!3247 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !70, file: !70, line: 3161, type: !299, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3248 = !DILocalVariable(name: "value", arg: 1, scope: !3247, file: !70, line: 3161, type: !13)
!3249 = !DILocation(line: 3161, column: 32, scope: !3247)
!3250 = !DILocalVariable(name: "factor", arg: 2, scope: !3247, file: !70, line: 3161, type: !13)
!3251 = !DILocation(line: 3161, column: 43, scope: !3247)
!3252 = !DILocation(line: 3163, column: 44, scope: !3247)
!3253 = !DILocation(line: 3163, column: 50, scope: !3247)
!3254 = !DILocation(line: 3163, column: 10, scope: !3247)
!3255 = !DILocation(line: 3163, column: 3, scope: !3247)
!3256 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !70, file: !70, line: 3185, type: !299, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3257 = !DILocalVariable(name: "value", arg: 1, scope: !3256, file: !70, line: 3185, type: !13)
!3258 = !DILocation(line: 3185, column: 31, scope: !3256)
!3259 = !DILocalVariable(name: "factor", arg: 2, scope: !3256, file: !70, line: 3185, type: !13)
!3260 = !DILocation(line: 3185, column: 42, scope: !3256)
!3261 = !DILocation(line: 3187, column: 44, scope: !3256)
!3262 = !DILocation(line: 3187, column: 50, scope: !3256)
!3263 = !DILocation(line: 3187, column: 10, scope: !3256)
!3264 = !DILocation(line: 3187, column: 3, scope: !3256)
!3265 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !70, file: !70, line: 3209, type: !299, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3266 = !DILocalVariable(name: "value", arg: 1, scope: !3265, file: !70, line: 3209, type: !13)
!3267 = !DILocation(line: 3209, column: 30, scope: !3265)
!3268 = !DILocalVariable(name: "factor", arg: 2, scope: !3265, file: !70, line: 3209, type: !13)
!3269 = !DILocation(line: 3209, column: 41, scope: !3265)
!3270 = !DILocation(line: 3211, column: 44, scope: !3265)
!3271 = !DILocation(line: 3211, column: 50, scope: !3265)
!3272 = !DILocation(line: 3211, column: 10, scope: !3265)
!3273 = !DILocation(line: 3211, column: 3, scope: !3265)
!3274 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !70, file: !70, line: 3233, type: !299, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3275 = !DILocalVariable(name: "value", arg: 1, scope: !3274, file: !70, line: 3233, type: !13)
!3276 = !DILocation(line: 3233, column: 33, scope: !3274)
!3277 = !DILocalVariable(name: "factor", arg: 2, scope: !3274, file: !70, line: 3233, type: !13)
!3278 = !DILocation(line: 3233, column: 44, scope: !3274)
!3279 = !DILocation(line: 3235, column: 44, scope: !3274)
!3280 = !DILocation(line: 3235, column: 50, scope: !3274)
!3281 = !DILocation(line: 3235, column: 10, scope: !3274)
!3282 = !DILocation(line: 3235, column: 3, scope: !3274)
!3283 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !70, file: !70, line: 3257, type: !299, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3284 = !DILocalVariable(name: "value", arg: 1, scope: !3283, file: !70, line: 3257, type: !13)
!3285 = !DILocation(line: 3257, column: 32, scope: !3283)
!3286 = !DILocalVariable(name: "factor", arg: 2, scope: !3283, file: !70, line: 3257, type: !13)
!3287 = !DILocation(line: 3257, column: 43, scope: !3283)
!3288 = !DILocation(line: 3259, column: 44, scope: !3283)
!3289 = !DILocation(line: 3259, column: 50, scope: !3283)
!3290 = !DILocation(line: 3259, column: 10, scope: !3283)
!3291 = !DILocation(line: 3259, column: 3, scope: !3283)
!3292 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !70, file: !70, line: 3281, type: !299, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3293 = !DILocalVariable(name: "value", arg: 1, scope: !3292, file: !70, line: 3281, type: !13)
!3294 = !DILocation(line: 3281, column: 31, scope: !3292)
!3295 = !DILocalVariable(name: "factor", arg: 2, scope: !3292, file: !70, line: 3281, type: !13)
!3296 = !DILocation(line: 3281, column: 42, scope: !3292)
!3297 = !DILocation(line: 3283, column: 44, scope: !3292)
!3298 = !DILocation(line: 3283, column: 50, scope: !3292)
!3299 = !DILocation(line: 3283, column: 10, scope: !3292)
!3300 = !DILocation(line: 3283, column: 3, scope: !3292)
!3301 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !70, file: !70, line: 3305, type: !299, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3302 = !DILocalVariable(name: "value", arg: 1, scope: !3301, file: !70, line: 3305, type: !13)
!3303 = !DILocation(line: 3305, column: 30, scope: !3301)
!3304 = !DILocalVariable(name: "factor", arg: 2, scope: !3301, file: !70, line: 3305, type: !13)
!3305 = !DILocation(line: 3305, column: 41, scope: !3301)
!3306 = !DILocation(line: 3307, column: 44, scope: !3301)
!3307 = !DILocation(line: 3307, column: 50, scope: !3301)
!3308 = !DILocation(line: 3307, column: 10, scope: !3301)
!3309 = !DILocation(line: 3307, column: 3, scope: !3301)
!3310 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !70, file: !70, line: 3328, type: !388, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3311 = !DILocalVariable(name: "value", arg: 1, scope: !3310, file: !70, line: 3328, type: !13)
!3312 = !DILocation(line: 3328, column: 33, scope: !3310)
!3313 = !DILocalVariable(name: "factor", arg: 2, scope: !3310, file: !70, line: 3328, type: !22)
!3314 = !DILocation(line: 3328, column: 44, scope: !3310)
!3315 = !DILocation(line: 3330, column: 41, scope: !3310)
!3316 = !DILocation(line: 3330, column: 47, scope: !3310)
!3317 = !DILocation(line: 3330, column: 10, scope: !3310)
!3318 = !DILocation(line: 3330, column: 3, scope: !3310)
!3319 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !70, file: !70, line: 3351, type: !388, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3320 = !DILocalVariable(name: "value", arg: 1, scope: !3319, file: !70, line: 3351, type: !13)
!3321 = !DILocation(line: 3351, column: 32, scope: !3319)
!3322 = !DILocalVariable(name: "factor", arg: 2, scope: !3319, file: !70, line: 3351, type: !22)
!3323 = !DILocation(line: 3351, column: 43, scope: !3319)
!3324 = !DILocation(line: 3353, column: 33, scope: !3319)
!3325 = !DILocation(line: 3353, column: 39, scope: !3319)
!3326 = !DILocation(line: 3353, column: 2, scope: !3319)
!3327 = !DILocation(line: 3354, column: 1, scope: !3319)
!3328 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !70, file: !70, line: 3375, type: !388, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3329 = !DILocalVariable(name: "value", arg: 1, scope: !3328, file: !70, line: 3375, type: !13)
!3330 = !DILocation(line: 3375, column: 31, scope: !3328)
!3331 = !DILocalVariable(name: "factor", arg: 2, scope: !3328, file: !70, line: 3375, type: !22)
!3332 = !DILocation(line: 3375, column: 42, scope: !3328)
!3333 = !DILocation(line: 3377, column: 41, scope: !3328)
!3334 = !DILocation(line: 3377, column: 47, scope: !3328)
!3335 = !DILocation(line: 3377, column: 10, scope: !3328)
!3336 = !DILocation(line: 3377, column: 3, scope: !3328)
!3337 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !70, file: !70, line: 3400, type: !388, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3338 = !DILocalVariable(name: "value", arg: 1, scope: !3337, file: !70, line: 3400, type: !13)
!3339 = !DILocation(line: 3400, column: 33, scope: !3337)
!3340 = !DILocalVariable(name: "factor", arg: 2, scope: !3337, file: !70, line: 3400, type: !22)
!3341 = !DILocation(line: 3400, column: 44, scope: !3337)
!3342 = !DILocation(line: 3402, column: 44, scope: !3337)
!3343 = !DILocation(line: 3402, column: 50, scope: !3337)
!3344 = !DILocation(line: 3402, column: 10, scope: !3337)
!3345 = !DILocation(line: 3402, column: 3, scope: !3337)
!3346 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !70, file: !70, line: 3425, type: !388, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3347 = !DILocalVariable(name: "value", arg: 1, scope: !3346, file: !70, line: 3425, type: !13)
!3348 = !DILocation(line: 3425, column: 32, scope: !3346)
!3349 = !DILocalVariable(name: "factor", arg: 2, scope: !3346, file: !70, line: 3425, type: !22)
!3350 = !DILocation(line: 3425, column: 43, scope: !3346)
!3351 = !DILocation(line: 3427, column: 44, scope: !3346)
!3352 = !DILocation(line: 3427, column: 50, scope: !3346)
!3353 = !DILocation(line: 3427, column: 10, scope: !3346)
!3354 = !DILocation(line: 3427, column: 3, scope: !3346)
!3355 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !70, file: !70, line: 3450, type: !388, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3356 = !DILocalVariable(name: "value", arg: 1, scope: !3355, file: !70, line: 3450, type: !13)
!3357 = !DILocation(line: 3450, column: 31, scope: !3355)
!3358 = !DILocalVariable(name: "factor", arg: 2, scope: !3355, file: !70, line: 3450, type: !22)
!3359 = !DILocation(line: 3450, column: 42, scope: !3355)
!3360 = !DILocation(line: 3452, column: 44, scope: !3355)
!3361 = !DILocation(line: 3452, column: 50, scope: !3355)
!3362 = !DILocation(line: 3452, column: 10, scope: !3355)
!3363 = !DILocation(line: 3452, column: 3, scope: !3355)
!3364 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !70, file: !70, line: 3475, type: !388, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3365 = !DILocalVariable(name: "value", arg: 1, scope: !3364, file: !70, line: 3475, type: !13)
!3366 = !DILocation(line: 3475, column: 33, scope: !3364)
!3367 = !DILocalVariable(name: "factor", arg: 2, scope: !3364, file: !70, line: 3475, type: !22)
!3368 = !DILocation(line: 3475, column: 44, scope: !3364)
!3369 = !DILocation(line: 3477, column: 44, scope: !3364)
!3370 = !DILocation(line: 3477, column: 50, scope: !3364)
!3371 = !DILocation(line: 3477, column: 10, scope: !3364)
!3372 = !DILocation(line: 3477, column: 3, scope: !3364)
!3373 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !70, file: !70, line: 3500, type: !388, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3374 = !DILocalVariable(name: "value", arg: 1, scope: !3373, file: !70, line: 3500, type: !13)
!3375 = !DILocation(line: 3500, column: 32, scope: !3373)
!3376 = !DILocalVariable(name: "factor", arg: 2, scope: !3373, file: !70, line: 3500, type: !22)
!3377 = !DILocation(line: 3500, column: 43, scope: !3373)
!3378 = !DILocation(line: 3502, column: 44, scope: !3373)
!3379 = !DILocation(line: 3502, column: 50, scope: !3373)
!3380 = !DILocation(line: 3502, column: 10, scope: !3373)
!3381 = !DILocation(line: 3502, column: 3, scope: !3373)
!3382 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !70, file: !70, line: 3524, type: !388, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3383 = !DILocalVariable(name: "value", arg: 1, scope: !3382, file: !70, line: 3524, type: !13)
!3384 = !DILocation(line: 3524, column: 31, scope: !3382)
!3385 = !DILocalVariable(name: "factor", arg: 2, scope: !3382, file: !70, line: 3524, type: !22)
!3386 = !DILocation(line: 3524, column: 42, scope: !3382)
!3387 = !DILocation(line: 3526, column: 44, scope: !3382)
!3388 = !DILocation(line: 3526, column: 50, scope: !3382)
!3389 = !DILocation(line: 3526, column: 10, scope: !3382)
!3390 = !DILocation(line: 3526, column: 3, scope: !3382)
!3391 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !70, file: !70, line: 3548, type: !388, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3392 = !DILocalVariable(name: "value", arg: 1, scope: !3391, file: !70, line: 3548, type: !13)
!3393 = !DILocation(line: 3548, column: 30, scope: !3391)
!3394 = !DILocalVariable(name: "factor", arg: 2, scope: !3391, file: !70, line: 3548, type: !22)
!3395 = !DILocation(line: 3548, column: 41, scope: !3391)
!3396 = !DILocation(line: 3550, column: 44, scope: !3391)
!3397 = !DILocation(line: 3550, column: 50, scope: !3391)
!3398 = !DILocation(line: 3550, column: 10, scope: !3391)
!3399 = !DILocation(line: 3550, column: 3, scope: !3391)
!3400 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !70, file: !70, line: 3572, type: !388, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3401 = !DILocalVariable(name: "value", arg: 1, scope: !3400, file: !70, line: 3572, type: !13)
!3402 = !DILocation(line: 3572, column: 33, scope: !3400)
!3403 = !DILocalVariable(name: "factor", arg: 2, scope: !3400, file: !70, line: 3572, type: !22)
!3404 = !DILocation(line: 3572, column: 44, scope: !3400)
!3405 = !DILocation(line: 3574, column: 44, scope: !3400)
!3406 = !DILocation(line: 3574, column: 50, scope: !3400)
!3407 = !DILocation(line: 3574, column: 10, scope: !3400)
!3408 = !DILocation(line: 3574, column: 3, scope: !3400)
!3409 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !70, file: !70, line: 3596, type: !388, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3410 = !DILocalVariable(name: "value", arg: 1, scope: !3409, file: !70, line: 3596, type: !13)
!3411 = !DILocation(line: 3596, column: 32, scope: !3409)
!3412 = !DILocalVariable(name: "factor", arg: 2, scope: !3409, file: !70, line: 3596, type: !22)
!3413 = !DILocation(line: 3596, column: 43, scope: !3409)
!3414 = !DILocation(line: 3598, column: 44, scope: !3409)
!3415 = !DILocation(line: 3598, column: 50, scope: !3409)
!3416 = !DILocation(line: 3598, column: 10, scope: !3409)
!3417 = !DILocation(line: 3598, column: 3, scope: !3409)
!3418 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !70, file: !70, line: 3620, type: !388, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3419 = !DILocalVariable(name: "value", arg: 1, scope: !3418, file: !70, line: 3620, type: !13)
!3420 = !DILocation(line: 3620, column: 31, scope: !3418)
!3421 = !DILocalVariable(name: "factor", arg: 2, scope: !3418, file: !70, line: 3620, type: !22)
!3422 = !DILocation(line: 3620, column: 42, scope: !3418)
!3423 = !DILocation(line: 3622, column: 44, scope: !3418)
!3424 = !DILocation(line: 3622, column: 50, scope: !3418)
!3425 = !DILocation(line: 3622, column: 10, scope: !3418)
!3426 = !DILocation(line: 3622, column: 3, scope: !3418)
!3427 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !70, file: !70, line: 3644, type: !388, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3428 = !DILocalVariable(name: "value", arg: 1, scope: !3427, file: !70, line: 3644, type: !13)
!3429 = !DILocation(line: 3644, column: 30, scope: !3427)
!3430 = !DILocalVariable(name: "factor", arg: 2, scope: !3427, file: !70, line: 3644, type: !22)
!3431 = !DILocation(line: 3644, column: 41, scope: !3427)
!3432 = !DILocation(line: 3646, column: 44, scope: !3427)
!3433 = !DILocation(line: 3646, column: 50, scope: !3427)
!3434 = !DILocation(line: 3646, column: 10, scope: !3427)
!3435 = !DILocation(line: 3646, column: 3, scope: !3427)
!3436 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !70, file: !70, line: 3666, type: !473, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3437 = !DILocalVariable(name: "value", arg: 1, scope: !3436, file: !70, line: 3666, type: !13)
!3438 = !DILocation(line: 3666, column: 32, scope: !3436)
!3439 = !DILocalVariable(name: "factor", arg: 2, scope: !3436, file: !70, line: 3666, type: !17)
!3440 = !DILocation(line: 3666, column: 42, scope: !3436)
!3441 = !DILocation(line: 3668, column: 40, scope: !3436)
!3442 = !DILocation(line: 3668, column: 58, scope: !3436)
!3443 = !DILocation(line: 3668, column: 52, scope: !3436)
!3444 = !DILocation(line: 3668, column: 66, scope: !3436)
!3445 = !DILocation(line: 3668, column: 46, scope: !3436)
!3446 = !DILocation(line: 3668, column: 10, scope: !3436)
!3447 = !DILocation(line: 3668, column: 3, scope: !3436)
!3448 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !70, file: !70, line: 3688, type: !473, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3449 = !DILocalVariable(name: "value", arg: 1, scope: !3448, file: !70, line: 3688, type: !13)
!3450 = !DILocation(line: 3688, column: 31, scope: !3448)
!3451 = !DILocalVariable(name: "factor", arg: 2, scope: !3448, file: !70, line: 3688, type: !17)
!3452 = !DILocation(line: 3688, column: 41, scope: !3448)
!3453 = !DILocation(line: 3690, column: 40, scope: !3448)
!3454 = !DILocation(line: 3690, column: 58, scope: !3448)
!3455 = !DILocation(line: 3690, column: 52, scope: !3448)
!3456 = !DILocation(line: 3690, column: 66, scope: !3448)
!3457 = !DILocation(line: 3690, column: 46, scope: !3448)
!3458 = !DILocation(line: 3690, column: 10, scope: !3448)
!3459 = !DILocation(line: 3690, column: 3, scope: !3448)
!3460 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !70, file: !70, line: 3711, type: !473, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3461 = !DILocalVariable(name: "value", arg: 1, scope: !3460, file: !70, line: 3711, type: !13)
!3462 = !DILocation(line: 3711, column: 30, scope: !3460)
!3463 = !DILocalVariable(name: "factor", arg: 2, scope: !3460, file: !70, line: 3711, type: !17)
!3464 = !DILocation(line: 3711, column: 40, scope: !3460)
!3465 = !DILocation(line: 3713, column: 40, scope: !3460)
!3466 = !DILocation(line: 3713, column: 58, scope: !3460)
!3467 = !DILocation(line: 3713, column: 52, scope: !3460)
!3468 = !DILocation(line: 3713, column: 66, scope: !3460)
!3469 = !DILocation(line: 3713, column: 46, scope: !3460)
!3470 = !DILocation(line: 3713, column: 10, scope: !3460)
!3471 = !DILocation(line: 3713, column: 3, scope: !3460)
!3472 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !70, file: !70, line: 3734, type: !473, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3473 = !DILocalVariable(name: "value", arg: 1, scope: !3472, file: !70, line: 3734, type: !13)
!3474 = !DILocation(line: 3734, column: 31, scope: !3472)
!3475 = !DILocalVariable(name: "factor", arg: 2, scope: !3472, file: !70, line: 3734, type: !17)
!3476 = !DILocation(line: 3734, column: 41, scope: !3472)
!3477 = !DILocation(line: 3736, column: 43, scope: !3472)
!3478 = !DILocation(line: 3736, column: 61, scope: !3472)
!3479 = !DILocation(line: 3736, column: 55, scope: !3472)
!3480 = !DILocation(line: 3736, column: 69, scope: !3472)
!3481 = !DILocation(line: 3736, column: 49, scope: !3472)
!3482 = !DILocation(line: 3736, column: 10, scope: !3472)
!3483 = !DILocation(line: 3736, column: 3, scope: !3472)
!3484 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !70, file: !70, line: 3757, type: !473, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3485 = !DILocalVariable(name: "value", arg: 1, scope: !3484, file: !70, line: 3757, type: !13)
!3486 = !DILocation(line: 3757, column: 30, scope: !3484)
!3487 = !DILocalVariable(name: "factor", arg: 2, scope: !3484, file: !70, line: 3757, type: !17)
!3488 = !DILocation(line: 3757, column: 40, scope: !3484)
!3489 = !DILocation(line: 3759, column: 43, scope: !3484)
!3490 = !DILocation(line: 3759, column: 61, scope: !3484)
!3491 = !DILocation(line: 3759, column: 55, scope: !3484)
!3492 = !DILocation(line: 3759, column: 69, scope: !3484)
!3493 = !DILocation(line: 3759, column: 49, scope: !3484)
!3494 = !DILocation(line: 3759, column: 10, scope: !3484)
!3495 = !DILocation(line: 3759, column: 3, scope: !3484)
!3496 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !70, file: !70, line: 3779, type: !473, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3497 = !DILocalVariable(name: "value", arg: 1, scope: !3496, file: !70, line: 3779, type: !13)
!3498 = !DILocation(line: 3779, column: 30, scope: !3496)
!3499 = !DILocalVariable(name: "factor", arg: 2, scope: !3496, file: !70, line: 3779, type: !17)
!3500 = !DILocation(line: 3779, column: 40, scope: !3496)
!3501 = !DILocation(line: 3781, column: 43, scope: !3496)
!3502 = !DILocation(line: 3781, column: 61, scope: !3496)
!3503 = !DILocation(line: 3781, column: 55, scope: !3496)
!3504 = !DILocation(line: 3781, column: 69, scope: !3496)
!3505 = !DILocation(line: 3781, column: 49, scope: !3496)
!3506 = !DILocation(line: 3781, column: 10, scope: !3496)
!3507 = !DILocation(line: 3781, column: 3, scope: !3496)
!3508 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !70, file: !70, line: 3801, type: !473, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3509 = !DILocalVariable(name: "value", arg: 1, scope: !3508, file: !70, line: 3801, type: !13)
!3510 = !DILocation(line: 3801, column: 29, scope: !3508)
!3511 = !DILocalVariable(name: "factor", arg: 2, scope: !3508, file: !70, line: 3801, type: !17)
!3512 = !DILocation(line: 3801, column: 39, scope: !3508)
!3513 = !DILocation(line: 3803, column: 43, scope: !3508)
!3514 = !DILocation(line: 3803, column: 61, scope: !3508)
!3515 = !DILocation(line: 3803, column: 55, scope: !3508)
!3516 = !DILocation(line: 3803, column: 69, scope: !3508)
!3517 = !DILocation(line: 3803, column: 49, scope: !3508)
!3518 = !DILocation(line: 3803, column: 10, scope: !3508)
!3519 = !DILocation(line: 3803, column: 3, scope: !3508)
!3520 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !70, file: !70, line: 3823, type: !473, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3521 = !DILocalVariable(name: "value", arg: 1, scope: !3520, file: !70, line: 3823, type: !13)
!3522 = !DILocation(line: 3823, column: 30, scope: !3520)
!3523 = !DILocalVariable(name: "factor", arg: 2, scope: !3520, file: !70, line: 3823, type: !17)
!3524 = !DILocation(line: 3823, column: 40, scope: !3520)
!3525 = !DILocation(line: 3825, column: 43, scope: !3520)
!3526 = !DILocation(line: 3825, column: 61, scope: !3520)
!3527 = !DILocation(line: 3825, column: 55, scope: !3520)
!3528 = !DILocation(line: 3825, column: 69, scope: !3520)
!3529 = !DILocation(line: 3825, column: 49, scope: !3520)
!3530 = !DILocation(line: 3825, column: 10, scope: !3520)
!3531 = !DILocation(line: 3825, column: 3, scope: !3520)
!3532 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !70, file: !70, line: 3845, type: !473, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3533 = !DILocalVariable(name: "value", arg: 1, scope: !3532, file: !70, line: 3845, type: !13)
!3534 = !DILocation(line: 3845, column: 29, scope: !3532)
!3535 = !DILocalVariable(name: "factor", arg: 2, scope: !3532, file: !70, line: 3845, type: !17)
!3536 = !DILocation(line: 3845, column: 39, scope: !3532)
!3537 = !DILocation(line: 3847, column: 43, scope: !3532)
!3538 = !DILocation(line: 3847, column: 61, scope: !3532)
!3539 = !DILocation(line: 3847, column: 55, scope: !3532)
!3540 = !DILocation(line: 3847, column: 69, scope: !3532)
!3541 = !DILocation(line: 3847, column: 49, scope: !3532)
!3542 = !DILocation(line: 3847, column: 10, scope: !3532)
!3543 = !DILocation(line: 3847, column: 3, scope: !3532)
!3544 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !70, file: !70, line: 3869, type: !1868, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3545 = !DILocalVariable(name: "value", arg: 1, scope: !3544, file: !70, line: 3869, type: !78)
!3546 = !DILocation(line: 3869, column: 31, scope: !3544)
!3547 = !DILocalVariable(name: "factor", arg: 2, scope: !3544, file: !70, line: 3869, type: !13)
!3548 = !DILocation(line: 3869, column: 42, scope: !3544)
!3549 = !DILocation(line: 3871, column: 41, scope: !3544)
!3550 = !DILocation(line: 3871, column: 47, scope: !3544)
!3551 = !DILocation(line: 3871, column: 10, scope: !3544)
!3552 = !DILocation(line: 3871, column: 3, scope: !3544)
!3553 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !70, file: !70, line: 5065, type: !3554, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3554 = !DISubroutineType(types: !3555)
!3555 = !{!78, !78, !13, !734}
!3556 = !DILocalVariable(name: "value", arg: 1, scope: !3553, file: !70, line: 5065, type: !78)
!3557 = !DILocation(line: 5065, column: 40, scope: !3553)
!3558 = !DILocalVariable(name: "factor", arg: 2, scope: !3553, file: !70, line: 5065, type: !13)
!3559 = !DILocation(line: 5065, column: 51, scope: !3553)
!3560 = !DILocalVariable(name: "count", arg: 3, scope: !3553, file: !70, line: 5065, type: !734)
!3561 = !DILocation(line: 5065, column: 63, scope: !3553)
!3562 = !DILocalVariable(name: "u32Temp1", scope: !3553, file: !70, line: 5067, type: !734)
!3563 = !DILocation(line: 5067, column: 6, scope: !3553)
!3564 = !DILocalVariable(name: "u32Temp2", scope: !3553, file: !70, line: 5067, type: !734)
!3565 = !DILocation(line: 5067, column: 17, scope: !3553)
!3566 = !DILocalVariable(name: "u32Temp3", scope: !3553, file: !70, line: 5067, type: !734)
!3567 = !DILocation(line: 5067, column: 26, scope: !3553)
!3568 = !DILocalVariable(name: "u32Temp4", scope: !3553, file: !70, line: 5067, type: !734)
!3569 = !DILocation(line: 5067, column: 35, scope: !3553)
!3570 = !DILocalVariable(name: "u8SignBit", scope: !3553, file: !70, line: 5068, type: !17)
!3571 = !DILocation(line: 5068, column: 5, scope: !3553)
!3572 = !DILocation(line: 5070, column: 7, scope: !3573)
!3573 = distinct !DILexicalBlock(scope: !3553, file: !70, line: 5070, column: 5)
!3574 = !DILocation(line: 5070, column: 12, scope: !3573)
!3575 = !DILocation(line: 5070, column: 16, scope: !3573)
!3576 = !DILocation(line: 5070, column: 20, scope: !3573)
!3577 = !DILocation(line: 5070, column: 26, scope: !3573)
!3578 = !DILocation(line: 5070, column: 31, scope: !3573)
!3579 = !DILocation(line: 5070, column: 36, scope: !3573)
!3580 = !DILocation(line: 5070, column: 41, scope: !3573)
!3581 = !DILocation(line: 5070, column: 45, scope: !3573)
!3582 = !DILocation(line: 5070, column: 49, scope: !3573)
!3583 = !DILocation(line: 5070, column: 55, scope: !3573)
!3584 = !DILocation(line: 5070, column: 5, scope: !3553)
!3585 = !DILocation(line: 5072, column: 13, scope: !3586)
!3586 = distinct !DILexicalBlock(scope: !3573, file: !70, line: 5071, column: 2)
!3587 = !DILocation(line: 5073, column: 2, scope: !3586)
!3588 = !DILocation(line: 5076, column: 13, scope: !3589)
!3589 = distinct !DILexicalBlock(scope: !3573, file: !70, line: 5075, column: 2)
!3590 = !DILocation(line: 5079, column: 5, scope: !3591)
!3591 = distinct !DILexicalBlock(scope: !3553, file: !70, line: 5079, column: 5)
!3592 = !DILocation(line: 5079, column: 10, scope: !3591)
!3593 = !DILocation(line: 5079, column: 5, scope: !3553)
!3594 = !DILocation(line: 5081, column: 15, scope: !3595)
!3595 = distinct !DILexicalBlock(scope: !3591, file: !70, line: 5080, column: 2)
!3596 = !DILocation(line: 5081, column: 14, scope: !3595)
!3597 = !DILocation(line: 5081, column: 12, scope: !3595)
!3598 = !DILocation(line: 5082, column: 2, scope: !3595)
!3599 = !DILocation(line: 5085, column: 14, scope: !3600)
!3600 = distinct !DILexicalBlock(scope: !3591, file: !70, line: 5084, column: 2)
!3601 = !DILocation(line: 5085, column: 12, scope: !3600)
!3602 = !DILocation(line: 5088, column: 5, scope: !3603)
!3603 = distinct !DILexicalBlock(scope: !3553, file: !70, line: 5088, column: 5)
!3604 = !DILocation(line: 5088, column: 11, scope: !3603)
!3605 = !DILocation(line: 5088, column: 5, scope: !3553)
!3606 = !DILocation(line: 5090, column: 15, scope: !3607)
!3607 = distinct !DILexicalBlock(scope: !3603, file: !70, line: 5089, column: 2)
!3608 = !DILocation(line: 5090, column: 14, scope: !3607)
!3609 = !DILocation(line: 5090, column: 12, scope: !3607)
!3610 = !DILocation(line: 5091, column: 2, scope: !3607)
!3611 = !DILocation(line: 5094, column: 14, scope: !3612)
!3612 = distinct !DILexicalBlock(scope: !3603, file: !70, line: 5093, column: 2)
!3613 = !DILocation(line: 5094, column: 12, scope: !3612)
!3614 = !DILocation(line: 5097, column: 13, scope: !3553)
!3615 = !DILocation(line: 5097, column: 24, scope: !3553)
!3616 = !DILocation(line: 5097, column: 22, scope: !3553)
!3617 = !DILocation(line: 5097, column: 11, scope: !3553)
!3618 = !DILocation(line: 5098, column: 25, scope: !3553)
!3619 = !DILocation(line: 5098, column: 35, scope: !3553)
!3620 = !DILocation(line: 5098, column: 13, scope: !3553)
!3621 = !DILocation(line: 5098, column: 11, scope: !3553)
!3622 = !DILocation(line: 5099, column: 13, scope: !3553)
!3623 = !DILocation(line: 5099, column: 25, scope: !3553)
!3624 = !DILocation(line: 5099, column: 22, scope: !3553)
!3625 = !DILocation(line: 5099, column: 11, scope: !3553)
!3626 = !DILocation(line: 5100, column: 14, scope: !3553)
!3627 = !DILocation(line: 5100, column: 30, scope: !3553)
!3628 = !DILocation(line: 5100, column: 29, scope: !3553)
!3629 = !DILocation(line: 5100, column: 23, scope: !3553)
!3630 = !DILocation(line: 5100, column: 11, scope: !3553)
!3631 = !DILocation(line: 5101, column: 6, scope: !3632)
!3632 = distinct !DILexicalBlock(scope: !3553, file: !70, line: 5101, column: 5)
!3633 = !DILocation(line: 5101, column: 16, scope: !3632)
!3634 = !DILocation(line: 5101, column: 14, scope: !3632)
!3635 = !DILocation(line: 5101, column: 22, scope: !3632)
!3636 = !DILocation(line: 5101, column: 5, scope: !3553)
!3637 = !DILocation(line: 5103, column: 6, scope: !3638)
!3638 = distinct !DILexicalBlock(scope: !3639, file: !70, line: 5103, column: 6)
!3639 = distinct !DILexicalBlock(scope: !3632, file: !70, line: 5102, column: 2)
!3640 = !DILocation(line: 5103, column: 16, scope: !3638)
!3641 = !DILocation(line: 5103, column: 6, scope: !3639)
!3642 = !DILocation(line: 5105, column: 7, scope: !3643)
!3643 = distinct !DILexicalBlock(scope: !3644, file: !70, line: 5105, column: 7)
!3644 = distinct !DILexicalBlock(scope: !3638, file: !70, line: 5104, column: 3)
!3645 = !DILocation(line: 5105, column: 15, scope: !3643)
!3646 = !DILocation(line: 5105, column: 7, scope: !3644)
!3647 = !DILocation(line: 5106, column: 12, scope: !3643)
!3648 = !DILocation(line: 5106, column: 5, scope: !3643)
!3649 = !DILocation(line: 5108, column: 5, scope: !3643)
!3650 = !DILocation(line: 5112, column: 7, scope: !3651)
!3651 = distinct !DILexicalBlock(scope: !3652, file: !70, line: 5112, column: 7)
!3652 = distinct !DILexicalBlock(scope: !3638, file: !70, line: 5111, column: 3)
!3653 = !DILocation(line: 5112, column: 15, scope: !3651)
!3654 = !DILocation(line: 5112, column: 7, scope: !3652)
!3655 = !DILocation(line: 5113, column: 13, scope: !3651)
!3656 = !DILocation(line: 5113, column: 12, scope: !3651)
!3657 = !DILocation(line: 5113, column: 5, scope: !3651)
!3658 = !DILocation(line: 5115, column: 5, scope: !3651)
!3659 = !DILocation(line: 5120, column: 3, scope: !3660)
!3660 = distinct !DILexicalBlock(scope: !3632, file: !70, line: 5119, column: 2)
!3661 = !DILocation(line: 5122, column: 1, scope: !3553)
!3662 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !70, file: !70, line: 3893, type: !2637, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3663 = !DILocalVariable(name: "value", arg: 1, scope: !3662, file: !70, line: 3893, type: !78)
!3664 = !DILocation(line: 3893, column: 30, scope: !3662)
!3665 = !DILocalVariable(name: "factor", arg: 2, scope: !3662, file: !70, line: 3893, type: !6)
!3666 = !DILocation(line: 3893, column: 40, scope: !3662)
!3667 = !DILocation(line: 3895, column: 40, scope: !3662)
!3668 = !DILocation(line: 3895, column: 46, scope: !3662)
!3669 = !DILocation(line: 3895, column: 10, scope: !3662)
!3670 = !DILocation(line: 3895, column: 3, scope: !3662)
!3671 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !70, file: !70, line: 5217, type: !3672, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3672 = !DISubroutineType(types: !3673)
!3673 = !{!78, !78, !6, !734}
!3674 = !DILocalVariable(name: "value", arg: 1, scope: !3671, file: !70, line: 5217, type: !78)
!3675 = !DILocation(line: 5217, column: 39, scope: !3671)
!3676 = !DILocalVariable(name: "factor", arg: 2, scope: !3671, file: !70, line: 5217, type: !6)
!3677 = !DILocation(line: 5217, column: 49, scope: !3671)
!3678 = !DILocalVariable(name: "count", arg: 3, scope: !3671, file: !70, line: 5217, type: !734)
!3679 = !DILocation(line: 5217, column: 61, scope: !3671)
!3680 = !DILocalVariable(name: "u32Temp1", scope: !3671, file: !70, line: 5219, type: !734)
!3681 = !DILocation(line: 5219, column: 6, scope: !3671)
!3682 = !DILocalVariable(name: "u32Temp2", scope: !3671, file: !70, line: 5219, type: !734)
!3683 = !DILocation(line: 5219, column: 17, scope: !3671)
!3684 = !DILocalVariable(name: "u32Temp3", scope: !3671, file: !70, line: 5219, type: !734)
!3685 = !DILocation(line: 5219, column: 26, scope: !3671)
!3686 = !DILocalVariable(name: "u32Temp4", scope: !3671, file: !70, line: 5219, type: !734)
!3687 = !DILocation(line: 5219, column: 35, scope: !3671)
!3688 = !DILocalVariable(name: "u8SignBit", scope: !3671, file: !70, line: 5220, type: !17)
!3689 = !DILocation(line: 5220, column: 5, scope: !3671)
!3690 = !DILocation(line: 5222, column: 7, scope: !3691)
!3691 = distinct !DILexicalBlock(scope: !3671, file: !70, line: 5222, column: 5)
!3692 = !DILocation(line: 5222, column: 12, scope: !3691)
!3693 = !DILocation(line: 5222, column: 16, scope: !3691)
!3694 = !DILocation(line: 5222, column: 20, scope: !3691)
!3695 = !DILocation(line: 5222, column: 26, scope: !3691)
!3696 = !DILocation(line: 5222, column: 31, scope: !3691)
!3697 = !DILocation(line: 5222, column: 36, scope: !3691)
!3698 = !DILocation(line: 5222, column: 41, scope: !3691)
!3699 = !DILocation(line: 5222, column: 45, scope: !3691)
!3700 = !DILocation(line: 5222, column: 49, scope: !3691)
!3701 = !DILocation(line: 5222, column: 55, scope: !3691)
!3702 = !DILocation(line: 5222, column: 5, scope: !3671)
!3703 = !DILocation(line: 5224, column: 13, scope: !3704)
!3704 = distinct !DILexicalBlock(scope: !3691, file: !70, line: 5223, column: 2)
!3705 = !DILocation(line: 5225, column: 2, scope: !3704)
!3706 = !DILocation(line: 5228, column: 13, scope: !3707)
!3707 = distinct !DILexicalBlock(scope: !3691, file: !70, line: 5227, column: 2)
!3708 = !DILocation(line: 5231, column: 5, scope: !3709)
!3709 = distinct !DILexicalBlock(scope: !3671, file: !70, line: 5231, column: 5)
!3710 = !DILocation(line: 5231, column: 10, scope: !3709)
!3711 = !DILocation(line: 5231, column: 5, scope: !3671)
!3712 = !DILocation(line: 5233, column: 15, scope: !3713)
!3713 = distinct !DILexicalBlock(scope: !3709, file: !70, line: 5232, column: 2)
!3714 = !DILocation(line: 5233, column: 14, scope: !3713)
!3715 = !DILocation(line: 5233, column: 12, scope: !3713)
!3716 = !DILocation(line: 5234, column: 2, scope: !3713)
!3717 = !DILocation(line: 5237, column: 14, scope: !3718)
!3718 = distinct !DILexicalBlock(scope: !3709, file: !70, line: 5236, column: 2)
!3719 = !DILocation(line: 5237, column: 12, scope: !3718)
!3720 = !DILocation(line: 5240, column: 5, scope: !3721)
!3721 = distinct !DILexicalBlock(scope: !3671, file: !70, line: 5240, column: 5)
!3722 = !DILocation(line: 5240, column: 11, scope: !3721)
!3723 = !DILocation(line: 5240, column: 5, scope: !3671)
!3724 = !DILocation(line: 5242, column: 15, scope: !3725)
!3725 = distinct !DILexicalBlock(scope: !3721, file: !70, line: 5241, column: 2)
!3726 = !DILocation(line: 5242, column: 14, scope: !3725)
!3727 = !DILocation(line: 5242, column: 12, scope: !3725)
!3728 = !DILocation(line: 5243, column: 2, scope: !3725)
!3729 = !DILocation(line: 5246, column: 14, scope: !3730)
!3730 = distinct !DILexicalBlock(scope: !3721, file: !70, line: 5245, column: 2)
!3731 = !DILocation(line: 5246, column: 12, scope: !3730)
!3732 = !DILocation(line: 5249, column: 13, scope: !3671)
!3733 = !DILocation(line: 5249, column: 24, scope: !3671)
!3734 = !DILocation(line: 5249, column: 22, scope: !3671)
!3735 = !DILocation(line: 5249, column: 11, scope: !3671)
!3736 = !DILocation(line: 5250, column: 25, scope: !3671)
!3737 = !DILocation(line: 5250, column: 35, scope: !3671)
!3738 = !DILocation(line: 5250, column: 13, scope: !3671)
!3739 = !DILocation(line: 5250, column: 11, scope: !3671)
!3740 = !DILocation(line: 5251, column: 13, scope: !3671)
!3741 = !DILocation(line: 5251, column: 25, scope: !3671)
!3742 = !DILocation(line: 5251, column: 22, scope: !3671)
!3743 = !DILocation(line: 5251, column: 11, scope: !3671)
!3744 = !DILocation(line: 5252, column: 14, scope: !3671)
!3745 = !DILocation(line: 5252, column: 30, scope: !3671)
!3746 = !DILocation(line: 5252, column: 29, scope: !3671)
!3747 = !DILocation(line: 5252, column: 23, scope: !3671)
!3748 = !DILocation(line: 5252, column: 11, scope: !3671)
!3749 = !DILocation(line: 5253, column: 6, scope: !3750)
!3750 = distinct !DILexicalBlock(scope: !3671, file: !70, line: 5253, column: 5)
!3751 = !DILocation(line: 5253, column: 16, scope: !3750)
!3752 = !DILocation(line: 5253, column: 14, scope: !3750)
!3753 = !DILocation(line: 5253, column: 22, scope: !3750)
!3754 = !DILocation(line: 5253, column: 5, scope: !3671)
!3755 = !DILocation(line: 5255, column: 6, scope: !3756)
!3756 = distinct !DILexicalBlock(scope: !3757, file: !70, line: 5255, column: 6)
!3757 = distinct !DILexicalBlock(scope: !3750, file: !70, line: 5254, column: 2)
!3758 = !DILocation(line: 5255, column: 16, scope: !3756)
!3759 = !DILocation(line: 5255, column: 6, scope: !3757)
!3760 = !DILocation(line: 5257, column: 7, scope: !3761)
!3761 = distinct !DILexicalBlock(scope: !3762, file: !70, line: 5257, column: 7)
!3762 = distinct !DILexicalBlock(scope: !3756, file: !70, line: 5256, column: 3)
!3763 = !DILocation(line: 5257, column: 15, scope: !3761)
!3764 = !DILocation(line: 5257, column: 7, scope: !3762)
!3765 = !DILocation(line: 5258, column: 12, scope: !3761)
!3766 = !DILocation(line: 5258, column: 5, scope: !3761)
!3767 = !DILocation(line: 5260, column: 5, scope: !3761)
!3768 = !DILocation(line: 5264, column: 7, scope: !3769)
!3769 = distinct !DILexicalBlock(scope: !3770, file: !70, line: 5264, column: 7)
!3770 = distinct !DILexicalBlock(scope: !3756, file: !70, line: 5263, column: 3)
!3771 = !DILocation(line: 5264, column: 15, scope: !3769)
!3772 = !DILocation(line: 5264, column: 7, scope: !3770)
!3773 = !DILocation(line: 5265, column: 13, scope: !3769)
!3774 = !DILocation(line: 5265, column: 12, scope: !3769)
!3775 = !DILocation(line: 5265, column: 5, scope: !3769)
!3776 = !DILocation(line: 5267, column: 5, scope: !3769)
!3777 = !DILocation(line: 5272, column: 3, scope: !3778)
!3778 = distinct !DILexicalBlock(scope: !3750, file: !70, line: 5271, column: 2)
!3779 = !DILocation(line: 5274, column: 1, scope: !3671)
!3780 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !70, file: !70, line: 3917, type: !773, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3781 = !DILocalVariable(name: "value", arg: 1, scope: !3780, file: !70, line: 3917, type: !78)
!3782 = !DILocation(line: 3917, column: 31, scope: !3780)
!3783 = !DILocalVariable(name: "factor", arg: 2, scope: !3780, file: !70, line: 3917, type: !22)
!3784 = !DILocation(line: 3917, column: 42, scope: !3780)
!3785 = !DILocation(line: 3919, column: 41, scope: !3780)
!3786 = !DILocation(line: 3919, column: 47, scope: !3780)
!3787 = !DILocation(line: 3919, column: 10, scope: !3780)
!3788 = !DILocation(line: 3919, column: 3, scope: !3780)
!3789 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !70, file: !70, line: 5141, type: !3790, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3790 = !DISubroutineType(types: !3791)
!3791 = !{!78, !78, !22, !734}
!3792 = !DILocalVariable(name: "value", arg: 1, scope: !3789, file: !70, line: 5141, type: !78)
!3793 = !DILocation(line: 5141, column: 40, scope: !3789)
!3794 = !DILocalVariable(name: "factor", arg: 2, scope: !3789, file: !70, line: 5141, type: !22)
!3795 = !DILocation(line: 5141, column: 50, scope: !3789)
!3796 = !DILocalVariable(name: "count", arg: 3, scope: !3789, file: !70, line: 5141, type: !734)
!3797 = !DILocation(line: 5141, column: 62, scope: !3789)
!3798 = !DILocalVariable(name: "u32Temp1", scope: !3789, file: !70, line: 5143, type: !734)
!3799 = !DILocation(line: 5143, column: 6, scope: !3789)
!3800 = !DILocalVariable(name: "u32Temp2", scope: !3789, file: !70, line: 5143, type: !734)
!3801 = !DILocation(line: 5143, column: 17, scope: !3789)
!3802 = !DILocalVariable(name: "u32Temp3", scope: !3789, file: !70, line: 5143, type: !734)
!3803 = !DILocation(line: 5143, column: 26, scope: !3789)
!3804 = !DILocalVariable(name: "u32Temp4", scope: !3789, file: !70, line: 5143, type: !734)
!3805 = !DILocation(line: 5143, column: 35, scope: !3789)
!3806 = !DILocalVariable(name: "u8SignBit", scope: !3789, file: !70, line: 5144, type: !17)
!3807 = !DILocation(line: 5144, column: 5, scope: !3789)
!3808 = !DILocation(line: 5146, column: 7, scope: !3809)
!3809 = distinct !DILexicalBlock(scope: !3789, file: !70, line: 5146, column: 5)
!3810 = !DILocation(line: 5146, column: 12, scope: !3809)
!3811 = !DILocation(line: 5146, column: 16, scope: !3809)
!3812 = !DILocation(line: 5146, column: 20, scope: !3809)
!3813 = !DILocation(line: 5146, column: 26, scope: !3809)
!3814 = !DILocation(line: 5146, column: 31, scope: !3809)
!3815 = !DILocation(line: 5146, column: 36, scope: !3809)
!3816 = !DILocation(line: 5146, column: 41, scope: !3809)
!3817 = !DILocation(line: 5146, column: 45, scope: !3809)
!3818 = !DILocation(line: 5146, column: 49, scope: !3809)
!3819 = !DILocation(line: 5146, column: 55, scope: !3809)
!3820 = !DILocation(line: 5146, column: 5, scope: !3789)
!3821 = !DILocation(line: 5148, column: 13, scope: !3822)
!3822 = distinct !DILexicalBlock(scope: !3809, file: !70, line: 5147, column: 2)
!3823 = !DILocation(line: 5149, column: 2, scope: !3822)
!3824 = !DILocation(line: 5152, column: 13, scope: !3825)
!3825 = distinct !DILexicalBlock(scope: !3809, file: !70, line: 5151, column: 2)
!3826 = !DILocation(line: 5155, column: 5, scope: !3827)
!3827 = distinct !DILexicalBlock(scope: !3789, file: !70, line: 5155, column: 5)
!3828 = !DILocation(line: 5155, column: 10, scope: !3827)
!3829 = !DILocation(line: 5155, column: 5, scope: !3789)
!3830 = !DILocation(line: 5157, column: 15, scope: !3831)
!3831 = distinct !DILexicalBlock(scope: !3827, file: !70, line: 5156, column: 2)
!3832 = !DILocation(line: 5157, column: 14, scope: !3831)
!3833 = !DILocation(line: 5157, column: 12, scope: !3831)
!3834 = !DILocation(line: 5158, column: 2, scope: !3831)
!3835 = !DILocation(line: 5161, column: 14, scope: !3836)
!3836 = distinct !DILexicalBlock(scope: !3827, file: !70, line: 5160, column: 2)
!3837 = !DILocation(line: 5161, column: 12, scope: !3836)
!3838 = !DILocation(line: 5164, column: 5, scope: !3839)
!3839 = distinct !DILexicalBlock(scope: !3789, file: !70, line: 5164, column: 5)
!3840 = !DILocation(line: 5164, column: 11, scope: !3839)
!3841 = !DILocation(line: 5164, column: 5, scope: !3789)
!3842 = !DILocation(line: 5166, column: 15, scope: !3843)
!3843 = distinct !DILexicalBlock(scope: !3839, file: !70, line: 5165, column: 2)
!3844 = !DILocation(line: 5166, column: 14, scope: !3843)
!3845 = !DILocation(line: 5166, column: 12, scope: !3843)
!3846 = !DILocation(line: 5167, column: 2, scope: !3843)
!3847 = !DILocation(line: 5170, column: 14, scope: !3848)
!3848 = distinct !DILexicalBlock(scope: !3839, file: !70, line: 5169, column: 2)
!3849 = !DILocation(line: 5170, column: 12, scope: !3848)
!3850 = !DILocation(line: 5173, column: 13, scope: !3789)
!3851 = !DILocation(line: 5173, column: 24, scope: !3789)
!3852 = !DILocation(line: 5173, column: 22, scope: !3789)
!3853 = !DILocation(line: 5173, column: 11, scope: !3789)
!3854 = !DILocation(line: 5174, column: 25, scope: !3789)
!3855 = !DILocation(line: 5174, column: 35, scope: !3789)
!3856 = !DILocation(line: 5174, column: 13, scope: !3789)
!3857 = !DILocation(line: 5174, column: 11, scope: !3789)
!3858 = !DILocation(line: 5175, column: 13, scope: !3789)
!3859 = !DILocation(line: 5175, column: 25, scope: !3789)
!3860 = !DILocation(line: 5175, column: 22, scope: !3789)
!3861 = !DILocation(line: 5175, column: 11, scope: !3789)
!3862 = !DILocation(line: 5176, column: 14, scope: !3789)
!3863 = !DILocation(line: 5176, column: 30, scope: !3789)
!3864 = !DILocation(line: 5176, column: 29, scope: !3789)
!3865 = !DILocation(line: 5176, column: 23, scope: !3789)
!3866 = !DILocation(line: 5176, column: 11, scope: !3789)
!3867 = !DILocation(line: 5177, column: 6, scope: !3868)
!3868 = distinct !DILexicalBlock(scope: !3789, file: !70, line: 5177, column: 5)
!3869 = !DILocation(line: 5177, column: 16, scope: !3868)
!3870 = !DILocation(line: 5177, column: 14, scope: !3868)
!3871 = !DILocation(line: 5177, column: 22, scope: !3868)
!3872 = !DILocation(line: 5177, column: 5, scope: !3789)
!3873 = !DILocation(line: 5179, column: 6, scope: !3874)
!3874 = distinct !DILexicalBlock(scope: !3875, file: !70, line: 5179, column: 6)
!3875 = distinct !DILexicalBlock(scope: !3868, file: !70, line: 5178, column: 2)
!3876 = !DILocation(line: 5179, column: 16, scope: !3874)
!3877 = !DILocation(line: 5179, column: 6, scope: !3875)
!3878 = !DILocation(line: 5181, column: 7, scope: !3879)
!3879 = distinct !DILexicalBlock(scope: !3880, file: !70, line: 5181, column: 7)
!3880 = distinct !DILexicalBlock(scope: !3874, file: !70, line: 5180, column: 3)
!3881 = !DILocation(line: 5181, column: 15, scope: !3879)
!3882 = !DILocation(line: 5181, column: 7, scope: !3880)
!3883 = !DILocation(line: 5182, column: 12, scope: !3879)
!3884 = !DILocation(line: 5182, column: 5, scope: !3879)
!3885 = !DILocation(line: 5184, column: 5, scope: !3879)
!3886 = !DILocation(line: 5188, column: 7, scope: !3887)
!3887 = distinct !DILexicalBlock(scope: !3888, file: !70, line: 5188, column: 7)
!3888 = distinct !DILexicalBlock(scope: !3874, file: !70, line: 5187, column: 3)
!3889 = !DILocation(line: 5188, column: 15, scope: !3887)
!3890 = !DILocation(line: 5188, column: 7, scope: !3888)
!3891 = !DILocation(line: 5189, column: 13, scope: !3887)
!3892 = !DILocation(line: 5189, column: 12, scope: !3887)
!3893 = !DILocation(line: 5189, column: 5, scope: !3887)
!3894 = !DILocation(line: 5191, column: 5, scope: !3887)
!3895 = !DILocation(line: 5196, column: 3, scope: !3896)
!3896 = distinct !DILexicalBlock(scope: !3868, file: !70, line: 5195, column: 2)
!3897 = !DILocation(line: 5198, column: 1, scope: !3789)
!3898 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !70, file: !70, line: 3941, type: !2342, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3899 = !DILocalVariable(name: "value", arg: 1, scope: !3898, file: !70, line: 3941, type: !78)
!3900 = !DILocation(line: 3941, column: 30, scope: !3898)
!3901 = !DILocalVariable(name: "factor", arg: 2, scope: !3898, file: !70, line: 3941, type: !17)
!3902 = !DILocation(line: 3941, column: 40, scope: !3898)
!3903 = !DILocation(line: 3943, column: 40, scope: !3898)
!3904 = !DILocation(line: 3943, column: 46, scope: !3898)
!3905 = !DILocation(line: 3943, column: 10, scope: !3898)
!3906 = !DILocation(line: 3943, column: 3, scope: !3898)
!3907 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !70, file: !70, line: 5536, type: !3908, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3908 = !DISubroutineType(types: !3909)
!3909 = !{!78, !78, !17, !734}
!3910 = !DILocalVariable(name: "value", arg: 1, scope: !3907, file: !70, line: 5536, type: !78)
!3911 = !DILocation(line: 5536, column: 39, scope: !3907)
!3912 = !DILocalVariable(name: "factor", arg: 2, scope: !3907, file: !70, line: 5536, type: !17)
!3913 = !DILocation(line: 5536, column: 49, scope: !3907)
!3914 = !DILocalVariable(name: "count", arg: 3, scope: !3907, file: !70, line: 5536, type: !734)
!3915 = !DILocation(line: 5536, column: 61, scope: !3907)
!3916 = !DILocalVariable(name: "u32Temp1", scope: !3907, file: !70, line: 5538, type: !734)
!3917 = !DILocation(line: 5538, column: 6, scope: !3907)
!3918 = !DILocalVariable(name: "u32Temp2", scope: !3907, file: !70, line: 5538, type: !734)
!3919 = !DILocation(line: 5538, column: 17, scope: !3907)
!3920 = !DILocalVariable(name: "u32Temp3", scope: !3907, file: !70, line: 5538, type: !734)
!3921 = !DILocation(line: 5538, column: 26, scope: !3907)
!3922 = !DILocalVariable(name: "u8SignBit", scope: !3907, file: !70, line: 5539, type: !17)
!3923 = !DILocation(line: 5539, column: 5, scope: !3907)
!3924 = !DILocation(line: 5541, column: 5, scope: !3925)
!3925 = distinct !DILexicalBlock(scope: !3907, file: !70, line: 5541, column: 5)
!3926 = !DILocation(line: 5541, column: 10, scope: !3925)
!3927 = !DILocation(line: 5541, column: 5, scope: !3907)
!3928 = !DILocation(line: 5543, column: 13, scope: !3929)
!3929 = distinct !DILexicalBlock(scope: !3925, file: !70, line: 5542, column: 2)
!3930 = !DILocation(line: 5544, column: 15, scope: !3929)
!3931 = !DILocation(line: 5544, column: 14, scope: !3929)
!3932 = !DILocation(line: 5544, column: 12, scope: !3929)
!3933 = !DILocation(line: 5545, column: 2, scope: !3929)
!3934 = !DILocation(line: 5548, column: 13, scope: !3935)
!3935 = distinct !DILexicalBlock(scope: !3925, file: !70, line: 5547, column: 2)
!3936 = !DILocation(line: 5549, column: 14, scope: !3935)
!3937 = !DILocation(line: 5549, column: 12, scope: !3935)
!3938 = !DILocation(line: 5552, column: 13, scope: !3907)
!3939 = !DILocation(line: 5552, column: 24, scope: !3907)
!3940 = !DILocation(line: 5552, column: 22, scope: !3907)
!3941 = !DILocation(line: 5552, column: 11, scope: !3907)
!3942 = !DILocation(line: 5553, column: 25, scope: !3907)
!3943 = !DILocation(line: 5553, column: 34, scope: !3907)
!3944 = !DILocation(line: 5553, column: 13, scope: !3907)
!3945 = !DILocation(line: 5553, column: 11, scope: !3907)
!3946 = !DILocation(line: 5554, column: 13, scope: !3907)
!3947 = !DILocation(line: 5554, column: 25, scope: !3907)
!3948 = !DILocation(line: 5554, column: 22, scope: !3907)
!3949 = !DILocation(line: 5554, column: 11, scope: !3907)
!3950 = !DILocation(line: 5555, column: 14, scope: !3907)
!3951 = !DILocation(line: 5555, column: 30, scope: !3907)
!3952 = !DILocation(line: 5555, column: 29, scope: !3907)
!3953 = !DILocation(line: 5555, column: 23, scope: !3907)
!3954 = !DILocation(line: 5555, column: 11, scope: !3907)
!3955 = !DILocation(line: 5556, column: 6, scope: !3956)
!3956 = distinct !DILexicalBlock(scope: !3907, file: !70, line: 5556, column: 5)
!3957 = !DILocation(line: 5556, column: 16, scope: !3956)
!3958 = !DILocation(line: 5556, column: 14, scope: !3956)
!3959 = !DILocation(line: 5556, column: 22, scope: !3956)
!3960 = !DILocation(line: 5556, column: 5, scope: !3907)
!3961 = !DILocation(line: 5558, column: 6, scope: !3962)
!3962 = distinct !DILexicalBlock(scope: !3963, file: !70, line: 5558, column: 6)
!3963 = distinct !DILexicalBlock(scope: !3956, file: !70, line: 5557, column: 2)
!3964 = !DILocation(line: 5558, column: 16, scope: !3962)
!3965 = !DILocation(line: 5558, column: 6, scope: !3963)
!3966 = !DILocation(line: 5560, column: 7, scope: !3967)
!3967 = distinct !DILexicalBlock(scope: !3968, file: !70, line: 5560, column: 7)
!3968 = distinct !DILexicalBlock(scope: !3962, file: !70, line: 5559, column: 3)
!3969 = !DILocation(line: 5560, column: 15, scope: !3967)
!3970 = !DILocation(line: 5560, column: 7, scope: !3968)
!3971 = !DILocation(line: 5561, column: 12, scope: !3967)
!3972 = !DILocation(line: 5561, column: 5, scope: !3967)
!3973 = !DILocation(line: 5563, column: 5, scope: !3967)
!3974 = !DILocation(line: 5567, column: 7, scope: !3975)
!3975 = distinct !DILexicalBlock(scope: !3976, file: !70, line: 5567, column: 7)
!3976 = distinct !DILexicalBlock(scope: !3962, file: !70, line: 5566, column: 3)
!3977 = !DILocation(line: 5567, column: 15, scope: !3975)
!3978 = !DILocation(line: 5567, column: 7, scope: !3976)
!3979 = !DILocation(line: 5569, column: 13, scope: !3980)
!3980 = distinct !DILexicalBlock(scope: !3975, file: !70, line: 5568, column: 4)
!3981 = !DILocation(line: 5569, column: 12, scope: !3980)
!3982 = !DILocation(line: 5569, column: 5, scope: !3980)
!3983 = !DILocation(line: 5573, column: 5, scope: !3984)
!3984 = distinct !DILexicalBlock(scope: !3975, file: !70, line: 5572, column: 4)
!3985 = !DILocation(line: 5579, column: 6, scope: !3986)
!3986 = distinct !DILexicalBlock(scope: !3987, file: !70, line: 5579, column: 6)
!3987 = distinct !DILexicalBlock(scope: !3956, file: !70, line: 5578, column: 2)
!3988 = !DILocation(line: 5579, column: 16, scope: !3986)
!3989 = !DILocation(line: 5579, column: 6, scope: !3987)
!3990 = !DILocation(line: 5581, column: 4, scope: !3991)
!3991 = distinct !DILexicalBlock(scope: !3986, file: !70, line: 5580, column: 3)
!3992 = !DILocation(line: 5585, column: 4, scope: !3993)
!3993 = distinct !DILexicalBlock(scope: !3986, file: !70, line: 5584, column: 3)
!3994 = !DILocation(line: 5588, column: 1, scope: !3907)
!3995 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !70, file: !70, line: 3965, type: !157, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3996 = !DILocalVariable(name: "value", arg: 1, scope: !3995, file: !70, line: 3965, type: !6)
!3997 = !DILocation(line: 3965, column: 28, scope: !3995)
!3998 = !DILocalVariable(name: "factor", arg: 2, scope: !3995, file: !70, line: 3965, type: !17)
!3999 = !DILocation(line: 3965, column: 38, scope: !3995)
!4000 = !DILocation(line: 3967, column: 38, scope: !3995)
!4001 = !DILocation(line: 3967, column: 56, scope: !3995)
!4002 = !DILocation(line: 3967, column: 50, scope: !3995)
!4003 = !DILocation(line: 3967, column: 64, scope: !3995)
!4004 = !DILocation(line: 3967, column: 44, scope: !3995)
!4005 = !DILocation(line: 3967, column: 10, scope: !3995)
!4006 = !DILocation(line: 3967, column: 3, scope: !3995)
!4007 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !70, file: !70, line: 3989, type: !157, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4008 = !DILocalVariable(name: "value", arg: 1, scope: !4007, file: !70, line: 3989, type: !6)
!4009 = !DILocation(line: 3989, column: 27, scope: !4007)
!4010 = !DILocalVariable(name: "factor", arg: 2, scope: !4007, file: !70, line: 3989, type: !17)
!4011 = !DILocation(line: 3989, column: 37, scope: !4007)
!4012 = !DILocation(line: 3991, column: 38, scope: !4007)
!4013 = !DILocation(line: 3991, column: 56, scope: !4007)
!4014 = !DILocation(line: 3991, column: 50, scope: !4007)
!4015 = !DILocation(line: 3991, column: 64, scope: !4007)
!4016 = !DILocation(line: 3991, column: 44, scope: !4007)
!4017 = !DILocation(line: 3991, column: 10, scope: !4007)
!4018 = !DILocation(line: 3991, column: 3, scope: !4007)
!4019 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !70, file: !70, line: 4014, type: !157, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4020 = !DILocalVariable(name: "value", arg: 1, scope: !4019, file: !70, line: 4014, type: !6)
!4021 = !DILocation(line: 4014, column: 26, scope: !4019)
!4022 = !DILocalVariable(name: "factor", arg: 2, scope: !4019, file: !70, line: 4014, type: !17)
!4023 = !DILocation(line: 4014, column: 36, scope: !4019)
!4024 = !DILocation(line: 4016, column: 38, scope: !4019)
!4025 = !DILocation(line: 4016, column: 56, scope: !4019)
!4026 = !DILocation(line: 4016, column: 50, scope: !4019)
!4027 = !DILocation(line: 4016, column: 64, scope: !4019)
!4028 = !DILocation(line: 4016, column: 44, scope: !4019)
!4029 = !DILocation(line: 4016, column: 10, scope: !4019)
!4030 = !DILocation(line: 4016, column: 3, scope: !4019)
!4031 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !70, file: !70, line: 4039, type: !157, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4032 = !DILocalVariable(name: "value", arg: 1, scope: !4031, file: !70, line: 4039, type: !6)
!4033 = !DILocation(line: 4039, column: 27, scope: !4031)
!4034 = !DILocalVariable(name: "factor", arg: 2, scope: !4031, file: !70, line: 4039, type: !17)
!4035 = !DILocation(line: 4039, column: 37, scope: !4031)
!4036 = !DILocation(line: 4041, column: 41, scope: !4031)
!4037 = !DILocation(line: 4041, column: 59, scope: !4031)
!4038 = !DILocation(line: 4041, column: 53, scope: !4031)
!4039 = !DILocation(line: 4041, column: 67, scope: !4031)
!4040 = !DILocation(line: 4041, column: 47, scope: !4031)
!4041 = !DILocation(line: 4041, column: 10, scope: !4031)
!4042 = !DILocation(line: 4041, column: 3, scope: !4031)
!4043 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !70, file: !70, line: 4064, type: !157, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4044 = !DILocalVariable(name: "value", arg: 1, scope: !4043, file: !70, line: 4064, type: !6)
!4045 = !DILocation(line: 4064, column: 26, scope: !4043)
!4046 = !DILocalVariable(name: "factor", arg: 2, scope: !4043, file: !70, line: 4064, type: !17)
!4047 = !DILocation(line: 4064, column: 36, scope: !4043)
!4048 = !DILocation(line: 4066, column: 41, scope: !4043)
!4049 = !DILocation(line: 4066, column: 59, scope: !4043)
!4050 = !DILocation(line: 4066, column: 53, scope: !4043)
!4051 = !DILocation(line: 4066, column: 67, scope: !4043)
!4052 = !DILocation(line: 4066, column: 47, scope: !4043)
!4053 = !DILocation(line: 4066, column: 10, scope: !4043)
!4054 = !DILocation(line: 4066, column: 3, scope: !4043)
!4055 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !70, file: !70, line: 4088, type: !157, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4056 = !DILocalVariable(name: "value", arg: 1, scope: !4055, file: !70, line: 4088, type: !6)
!4057 = !DILocation(line: 4088, column: 26, scope: !4055)
!4058 = !DILocalVariable(name: "factor", arg: 2, scope: !4055, file: !70, line: 4088, type: !17)
!4059 = !DILocation(line: 4088, column: 36, scope: !4055)
!4060 = !DILocation(line: 4090, column: 41, scope: !4055)
!4061 = !DILocation(line: 4090, column: 59, scope: !4055)
!4062 = !DILocation(line: 4090, column: 53, scope: !4055)
!4063 = !DILocation(line: 4090, column: 67, scope: !4055)
!4064 = !DILocation(line: 4090, column: 47, scope: !4055)
!4065 = !DILocation(line: 4090, column: 10, scope: !4055)
!4066 = !DILocation(line: 4090, column: 3, scope: !4055)
!4067 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !70, file: !70, line: 4112, type: !157, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4068 = !DILocalVariable(name: "value", arg: 1, scope: !4067, file: !70, line: 4112, type: !6)
!4069 = !DILocation(line: 4112, column: 25, scope: !4067)
!4070 = !DILocalVariable(name: "factor", arg: 2, scope: !4067, file: !70, line: 4112, type: !17)
!4071 = !DILocation(line: 4112, column: 35, scope: !4067)
!4072 = !DILocation(line: 4114, column: 41, scope: !4067)
!4073 = !DILocation(line: 4114, column: 59, scope: !4067)
!4074 = !DILocation(line: 4114, column: 53, scope: !4067)
!4075 = !DILocation(line: 4114, column: 67, scope: !4067)
!4076 = !DILocation(line: 4114, column: 47, scope: !4067)
!4077 = !DILocation(line: 4114, column: 10, scope: !4067)
!4078 = !DILocation(line: 4114, column: 3, scope: !4067)
!4079 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !70, file: !70, line: 4136, type: !157, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4080 = !DILocalVariable(name: "value", arg: 1, scope: !4079, file: !70, line: 4136, type: !6)
!4081 = !DILocation(line: 4136, column: 26, scope: !4079)
!4082 = !DILocalVariable(name: "factor", arg: 2, scope: !4079, file: !70, line: 4136, type: !17)
!4083 = !DILocation(line: 4136, column: 36, scope: !4079)
!4084 = !DILocation(line: 4138, column: 41, scope: !4079)
!4085 = !DILocation(line: 4138, column: 59, scope: !4079)
!4086 = !DILocation(line: 4138, column: 53, scope: !4079)
!4087 = !DILocation(line: 4138, column: 67, scope: !4079)
!4088 = !DILocation(line: 4138, column: 47, scope: !4079)
!4089 = !DILocation(line: 4138, column: 10, scope: !4079)
!4090 = !DILocation(line: 4138, column: 3, scope: !4079)
!4091 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !70, file: !70, line: 4160, type: !157, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4092 = !DILocalVariable(name: "value", arg: 1, scope: !4091, file: !70, line: 4160, type: !6)
!4093 = !DILocation(line: 4160, column: 25, scope: !4091)
!4094 = !DILocalVariable(name: "factor", arg: 2, scope: !4091, file: !70, line: 4160, type: !17)
!4095 = !DILocation(line: 4160, column: 35, scope: !4091)
!4096 = !DILocation(line: 4162, column: 41, scope: !4091)
!4097 = !DILocation(line: 4162, column: 59, scope: !4091)
!4098 = !DILocation(line: 4162, column: 53, scope: !4091)
!4099 = !DILocation(line: 4162, column: 67, scope: !4091)
!4100 = !DILocation(line: 4162, column: 47, scope: !4091)
!4101 = !DILocation(line: 4162, column: 10, scope: !4091)
!4102 = !DILocation(line: 4162, column: 3, scope: !4091)
!4103 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !70, file: !70, line: 4183, type: !927, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4104 = !DILocalVariable(name: "value", arg: 1, scope: !4103, file: !70, line: 4183, type: !22)
!4105 = !DILocation(line: 4183, column: 33, scope: !4103)
!4106 = !DILocalVariable(name: "factor", arg: 2, scope: !4103, file: !70, line: 4183, type: !22)
!4107 = !DILocation(line: 4183, column: 44, scope: !4103)
!4108 = !DILocation(line: 4185, column: 41, scope: !4103)
!4109 = !DILocation(line: 4185, column: 47, scope: !4103)
!4110 = !DILocation(line: 4185, column: 10, scope: !4103)
!4111 = !DILocation(line: 4185, column: 3, scope: !4103)
!4112 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !70, file: !70, line: 4206, type: !927, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4113 = !DILocalVariable(name: "value", arg: 1, scope: !4112, file: !70, line: 4206, type: !22)
!4114 = !DILocation(line: 4206, column: 32, scope: !4112)
!4115 = !DILocalVariable(name: "factor", arg: 2, scope: !4112, file: !70, line: 4206, type: !22)
!4116 = !DILocation(line: 4206, column: 43, scope: !4112)
!4117 = !DILocation(line: 4208, column: 41, scope: !4112)
!4118 = !DILocation(line: 4208, column: 47, scope: !4112)
!4119 = !DILocation(line: 4208, column: 10, scope: !4112)
!4120 = !DILocation(line: 4208, column: 3, scope: !4112)
!4121 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !70, file: !70, line: 4230, type: !927, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4122 = !DILocalVariable(name: "value", arg: 1, scope: !4121, file: !70, line: 4230, type: !22)
!4123 = !DILocation(line: 4230, column: 31, scope: !4121)
!4124 = !DILocalVariable(name: "factor", arg: 2, scope: !4121, file: !70, line: 4230, type: !22)
!4125 = !DILocation(line: 4230, column: 42, scope: !4121)
!4126 = !DILocation(line: 4232, column: 41, scope: !4121)
!4127 = !DILocation(line: 4232, column: 47, scope: !4121)
!4128 = !DILocation(line: 4232, column: 10, scope: !4121)
!4129 = !DILocation(line: 4232, column: 3, scope: !4121)
!4130 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !70, file: !70, line: 4254, type: !927, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4131 = !DILocalVariable(name: "value", arg: 1, scope: !4130, file: !70, line: 4254, type: !22)
!4132 = !DILocation(line: 4254, column: 34, scope: !4130)
!4133 = !DILocalVariable(name: "factor", arg: 2, scope: !4130, file: !70, line: 4254, type: !22)
!4134 = !DILocation(line: 4254, column: 45, scope: !4130)
!4135 = !DILocation(line: 4256, column: 44, scope: !4130)
!4136 = !DILocation(line: 4256, column: 50, scope: !4130)
!4137 = !DILocation(line: 4256, column: 10, scope: !4130)
!4138 = !DILocation(line: 4256, column: 3, scope: !4130)
!4139 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !70, file: !70, line: 4278, type: !927, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4140 = !DILocalVariable(name: "value", arg: 1, scope: !4139, file: !70, line: 4278, type: !22)
!4141 = !DILocation(line: 4278, column: 32, scope: !4139)
!4142 = !DILocalVariable(name: "factor", arg: 2, scope: !4139, file: !70, line: 4278, type: !22)
!4143 = !DILocation(line: 4278, column: 43, scope: !4139)
!4144 = !DILocation(line: 4280, column: 44, scope: !4139)
!4145 = !DILocation(line: 4280, column: 50, scope: !4139)
!4146 = !DILocation(line: 4280, column: 10, scope: !4139)
!4147 = !DILocation(line: 4280, column: 3, scope: !4139)
!4148 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !70, file: !70, line: 4302, type: !927, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4149 = !DILocalVariable(name: "value", arg: 1, scope: !4148, file: !70, line: 4302, type: !22)
!4150 = !DILocation(line: 4302, column: 31, scope: !4148)
!4151 = !DILocalVariable(name: "factor", arg: 2, scope: !4148, file: !70, line: 4302, type: !22)
!4152 = !DILocation(line: 4302, column: 42, scope: !4148)
!4153 = !DILocation(line: 4304, column: 44, scope: !4148)
!4154 = !DILocation(line: 4304, column: 50, scope: !4148)
!4155 = !DILocation(line: 4304, column: 10, scope: !4148)
!4156 = !DILocation(line: 4304, column: 3, scope: !4148)
!4157 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !70, file: !70, line: 4326, type: !927, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4158 = !DILocalVariable(name: "value", arg: 1, scope: !4157, file: !70, line: 4326, type: !22)
!4159 = !DILocation(line: 4326, column: 33, scope: !4157)
!4160 = !DILocalVariable(name: "factor", arg: 2, scope: !4157, file: !70, line: 4326, type: !22)
!4161 = !DILocation(line: 4326, column: 44, scope: !4157)
!4162 = !DILocation(line: 4328, column: 44, scope: !4157)
!4163 = !DILocation(line: 4328, column: 50, scope: !4157)
!4164 = !DILocation(line: 4328, column: 10, scope: !4157)
!4165 = !DILocation(line: 4328, column: 3, scope: !4157)
!4166 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !70, file: !70, line: 4350, type: !927, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4167 = !DILocalVariable(name: "value", arg: 1, scope: !4166, file: !70, line: 4350, type: !22)
!4168 = !DILocation(line: 4350, column: 32, scope: !4166)
!4169 = !DILocalVariable(name: "factor", arg: 2, scope: !4166, file: !70, line: 4350, type: !22)
!4170 = !DILocation(line: 4350, column: 43, scope: !4166)
!4171 = !DILocation(line: 4352, column: 44, scope: !4166)
!4172 = !DILocation(line: 4352, column: 50, scope: !4166)
!4173 = !DILocation(line: 4352, column: 10, scope: !4166)
!4174 = !DILocation(line: 4352, column: 3, scope: !4166)
!4175 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !70, file: !70, line: 4373, type: !927, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4176 = !DILocalVariable(name: "value", arg: 1, scope: !4175, file: !70, line: 4373, type: !22)
!4177 = !DILocation(line: 4373, column: 31, scope: !4175)
!4178 = !DILocalVariable(name: "factor", arg: 2, scope: !4175, file: !70, line: 4373, type: !22)
!4179 = !DILocation(line: 4373, column: 42, scope: !4175)
!4180 = !DILocation(line: 4375, column: 44, scope: !4175)
!4181 = !DILocation(line: 4375, column: 50, scope: !4175)
!4182 = !DILocation(line: 4375, column: 10, scope: !4175)
!4183 = !DILocation(line: 4375, column: 3, scope: !4175)
!4184 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !70, file: !70, line: 4396, type: !927, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4185 = !DILocalVariable(name: "value", arg: 1, scope: !4184, file: !70, line: 4396, type: !22)
!4186 = !DILocation(line: 4396, column: 30, scope: !4184)
!4187 = !DILocalVariable(name: "factor", arg: 2, scope: !4184, file: !70, line: 4396, type: !22)
!4188 = !DILocation(line: 4396, column: 41, scope: !4184)
!4189 = !DILocation(line: 4398, column: 44, scope: !4184)
!4190 = !DILocation(line: 4398, column: 50, scope: !4184)
!4191 = !DILocation(line: 4398, column: 10, scope: !4184)
!4192 = !DILocation(line: 4398, column: 3, scope: !4184)
!4193 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !70, file: !70, line: 4419, type: !927, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4194 = !DILocalVariable(name: "value", arg: 1, scope: !4193, file: !70, line: 4419, type: !22)
!4195 = !DILocation(line: 4419, column: 33, scope: !4193)
!4196 = !DILocalVariable(name: "factor", arg: 2, scope: !4193, file: !70, line: 4419, type: !22)
!4197 = !DILocation(line: 4419, column: 44, scope: !4193)
!4198 = !DILocation(line: 4421, column: 44, scope: !4193)
!4199 = !DILocation(line: 4421, column: 50, scope: !4193)
!4200 = !DILocation(line: 4421, column: 10, scope: !4193)
!4201 = !DILocation(line: 4421, column: 3, scope: !4193)
!4202 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !70, file: !70, line: 4442, type: !927, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4203 = !DILocalVariable(name: "value", arg: 1, scope: !4202, file: !70, line: 4442, type: !22)
!4204 = !DILocation(line: 4442, column: 32, scope: !4202)
!4205 = !DILocalVariable(name: "factor", arg: 2, scope: !4202, file: !70, line: 4442, type: !22)
!4206 = !DILocation(line: 4442, column: 43, scope: !4202)
!4207 = !DILocation(line: 4444, column: 44, scope: !4202)
!4208 = !DILocation(line: 4444, column: 50, scope: !4202)
!4209 = !DILocation(line: 4444, column: 10, scope: !4202)
!4210 = !DILocation(line: 4444, column: 3, scope: !4202)
!4211 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !70, file: !70, line: 4465, type: !927, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4212 = !DILocalVariable(name: "value", arg: 1, scope: !4211, file: !70, line: 4465, type: !22)
!4213 = !DILocation(line: 4465, column: 31, scope: !4211)
!4214 = !DILocalVariable(name: "factor", arg: 2, scope: !4211, file: !70, line: 4465, type: !22)
!4215 = !DILocation(line: 4465, column: 42, scope: !4211)
!4216 = !DILocation(line: 4467, column: 44, scope: !4211)
!4217 = !DILocation(line: 4467, column: 50, scope: !4211)
!4218 = !DILocation(line: 4467, column: 10, scope: !4211)
!4219 = !DILocation(line: 4467, column: 3, scope: !4211)
!4220 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !70, file: !70, line: 4488, type: !927, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4221 = !DILocalVariable(name: "value", arg: 1, scope: !4220, file: !70, line: 4488, type: !22)
!4222 = !DILocation(line: 4488, column: 30, scope: !4220)
!4223 = !DILocalVariable(name: "factor", arg: 2, scope: !4220, file: !70, line: 4488, type: !22)
!4224 = !DILocation(line: 4488, column: 41, scope: !4220)
!4225 = !DILocation(line: 4490, column: 44, scope: !4220)
!4226 = !DILocation(line: 4490, column: 50, scope: !4220)
!4227 = !DILocation(line: 4490, column: 10, scope: !4220)
!4228 = !DILocation(line: 4490, column: 3, scope: !4220)
!4229 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !70, file: !70, line: 4510, type: !972, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4230 = !DILocalVariable(name: "x_value", arg: 1, scope: !4229, file: !70, line: 4510, type: !22)
!4231 = !DILocation(line: 4510, column: 32, scope: !4229)
!4232 = !DILocalVariable(name: "y_value", arg: 2, scope: !4229, file: !70, line: 4510, type: !17)
!4233 = !DILocation(line: 4510, column: 44, scope: !4229)
!4234 = !DILocation(line: 4512, column: 40, scope: !4229)
!4235 = !DILocation(line: 4512, column: 60, scope: !4229)
!4236 = !DILocation(line: 4512, column: 54, scope: !4229)
!4237 = !DILocation(line: 4512, column: 69, scope: !4229)
!4238 = !DILocation(line: 4512, column: 48, scope: !4229)
!4239 = !DILocation(line: 4512, column: 10, scope: !4229)
!4240 = !DILocation(line: 4512, column: 3, scope: !4229)
!4241 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !70, file: !70, line: 4532, type: !972, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4242 = !DILocalVariable(name: "x_value", arg: 1, scope: !4241, file: !70, line: 4532, type: !22)
!4243 = !DILocation(line: 4532, column: 31, scope: !4241)
!4244 = !DILocalVariable(name: "y_value", arg: 2, scope: !4241, file: !70, line: 4532, type: !17)
!4245 = !DILocation(line: 4532, column: 43, scope: !4241)
!4246 = !DILocation(line: 4534, column: 40, scope: !4241)
!4247 = !DILocation(line: 4534, column: 60, scope: !4241)
!4248 = !DILocation(line: 4534, column: 54, scope: !4241)
!4249 = !DILocation(line: 4534, column: 69, scope: !4241)
!4250 = !DILocation(line: 4534, column: 48, scope: !4241)
!4251 = !DILocation(line: 4534, column: 10, scope: !4241)
!4252 = !DILocation(line: 4534, column: 3, scope: !4241)
!4253 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !70, file: !70, line: 4555, type: !972, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4254 = !DILocalVariable(name: "x_value", arg: 1, scope: !4253, file: !70, line: 4555, type: !22)
!4255 = !DILocation(line: 4555, column: 30, scope: !4253)
!4256 = !DILocalVariable(name: "y_value", arg: 2, scope: !4253, file: !70, line: 4555, type: !17)
!4257 = !DILocation(line: 4555, column: 42, scope: !4253)
!4258 = !DILocation(line: 4557, column: 40, scope: !4253)
!4259 = !DILocation(line: 4557, column: 60, scope: !4253)
!4260 = !DILocation(line: 4557, column: 54, scope: !4253)
!4261 = !DILocation(line: 4557, column: 69, scope: !4253)
!4262 = !DILocation(line: 4557, column: 48, scope: !4253)
!4263 = !DILocation(line: 4557, column: 10, scope: !4253)
!4264 = !DILocation(line: 4557, column: 3, scope: !4253)
!4265 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !70, file: !70, line: 4578, type: !972, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4266 = !DILocalVariable(name: "x_value", arg: 1, scope: !4265, file: !70, line: 4578, type: !22)
!4267 = !DILocation(line: 4578, column: 31, scope: !4265)
!4268 = !DILocalVariable(name: "y_value", arg: 2, scope: !4265, file: !70, line: 4578, type: !17)
!4269 = !DILocation(line: 4578, column: 43, scope: !4265)
!4270 = !DILocation(line: 4580, column: 44, scope: !4265)
!4271 = !DILocation(line: 4580, column: 64, scope: !4265)
!4272 = !DILocation(line: 4580, column: 58, scope: !4265)
!4273 = !DILocation(line: 4580, column: 73, scope: !4265)
!4274 = !DILocation(line: 4580, column: 52, scope: !4265)
!4275 = !DILocation(line: 4580, column: 10, scope: !4265)
!4276 = !DILocation(line: 4580, column: 3, scope: !4265)
!4277 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !70, file: !70, line: 4601, type: !972, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4278 = !DILocalVariable(name: "x_value", arg: 1, scope: !4277, file: !70, line: 4601, type: !22)
!4279 = !DILocation(line: 4601, column: 30, scope: !4277)
!4280 = !DILocalVariable(name: "y_value", arg: 2, scope: !4277, file: !70, line: 4601, type: !17)
!4281 = !DILocation(line: 4601, column: 42, scope: !4277)
!4282 = !DILocation(line: 4603, column: 44, scope: !4277)
!4283 = !DILocation(line: 4603, column: 64, scope: !4277)
!4284 = !DILocation(line: 4603, column: 58, scope: !4277)
!4285 = !DILocation(line: 4603, column: 73, scope: !4277)
!4286 = !DILocation(line: 4603, column: 52, scope: !4277)
!4287 = !DILocation(line: 4603, column: 10, scope: !4277)
!4288 = !DILocation(line: 4603, column: 3, scope: !4277)
!4289 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !70, file: !70, line: 4623, type: !972, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4290 = !DILocalVariable(name: "x_value", arg: 1, scope: !4289, file: !70, line: 4623, type: !22)
!4291 = !DILocation(line: 4623, column: 30, scope: !4289)
!4292 = !DILocalVariable(name: "y_value", arg: 2, scope: !4289, file: !70, line: 4623, type: !17)
!4293 = !DILocation(line: 4623, column: 42, scope: !4289)
!4294 = !DILocation(line: 4625, column: 44, scope: !4289)
!4295 = !DILocation(line: 4625, column: 64, scope: !4289)
!4296 = !DILocation(line: 4625, column: 58, scope: !4289)
!4297 = !DILocation(line: 4625, column: 73, scope: !4289)
!4298 = !DILocation(line: 4625, column: 52, scope: !4289)
!4299 = !DILocation(line: 4625, column: 10, scope: !4289)
!4300 = !DILocation(line: 4625, column: 3, scope: !4289)
!4301 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !70, file: !70, line: 4645, type: !972, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4302 = !DILocalVariable(name: "x_value", arg: 1, scope: !4301, file: !70, line: 4645, type: !22)
!4303 = !DILocation(line: 4645, column: 29, scope: !4301)
!4304 = !DILocalVariable(name: "y_value", arg: 2, scope: !4301, file: !70, line: 4645, type: !17)
!4305 = !DILocation(line: 4645, column: 41, scope: !4301)
!4306 = !DILocation(line: 4647, column: 44, scope: !4301)
!4307 = !DILocation(line: 4647, column: 64, scope: !4301)
!4308 = !DILocation(line: 4647, column: 58, scope: !4301)
!4309 = !DILocation(line: 4647, column: 73, scope: !4301)
!4310 = !DILocation(line: 4647, column: 52, scope: !4301)
!4311 = !DILocation(line: 4647, column: 10, scope: !4301)
!4312 = !DILocation(line: 4647, column: 3, scope: !4301)
!4313 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !70, file: !70, line: 4667, type: !972, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4314 = !DILocalVariable(name: "x_value", arg: 1, scope: !4313, file: !70, line: 4667, type: !22)
!4315 = !DILocation(line: 4667, column: 30, scope: !4313)
!4316 = !DILocalVariable(name: "y_value", arg: 2, scope: !4313, file: !70, line: 4667, type: !17)
!4317 = !DILocation(line: 4667, column: 42, scope: !4313)
!4318 = !DILocation(line: 4669, column: 44, scope: !4313)
!4319 = !DILocation(line: 4669, column: 64, scope: !4313)
!4320 = !DILocation(line: 4669, column: 58, scope: !4313)
!4321 = !DILocation(line: 4669, column: 73, scope: !4313)
!4322 = !DILocation(line: 4669, column: 52, scope: !4313)
!4323 = !DILocation(line: 4669, column: 10, scope: !4313)
!4324 = !DILocation(line: 4669, column: 3, scope: !4313)
!4325 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !70, file: !70, line: 4689, type: !972, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4326 = !DILocalVariable(name: "x_value", arg: 1, scope: !4325, file: !70, line: 4689, type: !22)
!4327 = !DILocation(line: 4689, column: 29, scope: !4325)
!4328 = !DILocalVariable(name: "y_value", arg: 2, scope: !4325, file: !70, line: 4689, type: !17)
!4329 = !DILocation(line: 4689, column: 41, scope: !4325)
!4330 = !DILocation(line: 4691, column: 44, scope: !4325)
!4331 = !DILocation(line: 4691, column: 64, scope: !4325)
!4332 = !DILocation(line: 4691, column: 58, scope: !4325)
!4333 = !DILocation(line: 4691, column: 73, scope: !4325)
!4334 = !DILocation(line: 4691, column: 52, scope: !4325)
!4335 = !DILocation(line: 4691, column: 10, scope: !4325)
!4336 = !DILocation(line: 4691, column: 3, scope: !4325)
!4337 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !70, file: !70, line: 4713, type: !1501, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4338 = !DILocalVariable(name: "value", arg: 1, scope: !4337, file: !70, line: 4713, type: !734)
!4339 = !DILocation(line: 4713, column: 31, scope: !4337)
!4340 = !DILocalVariable(name: "factor", arg: 2, scope: !4337, file: !70, line: 4713, type: !13)
!4341 = !DILocation(line: 4713, column: 42, scope: !4337)
!4342 = !DILocation(line: 4715, column: 41, scope: !4337)
!4343 = !DILocation(line: 4715, column: 47, scope: !4337)
!4344 = !DILocation(line: 4715, column: 10, scope: !4337)
!4345 = !DILocation(line: 4715, column: 3, scope: !4337)
!4346 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !70, file: !70, line: 5293, type: !4347, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4347 = !DISubroutineType(types: !4348)
!4348 = !{!734, !734, !13, !734}
!4349 = !DILocalVariable(name: "value", arg: 1, scope: !4346, file: !70, line: 5293, type: !734)
!4350 = !DILocation(line: 5293, column: 40, scope: !4346)
!4351 = !DILocalVariable(name: "factor", arg: 2, scope: !4346, file: !70, line: 5293, type: !13)
!4352 = !DILocation(line: 5293, column: 50, scope: !4346)
!4353 = !DILocalVariable(name: "count", arg: 3, scope: !4346, file: !70, line: 5293, type: !734)
!4354 = !DILocation(line: 5293, column: 62, scope: !4346)
!4355 = !DILocalVariable(name: "u32Temp1", scope: !4346, file: !70, line: 5295, type: !734)
!4356 = !DILocation(line: 5295, column: 6, scope: !4346)
!4357 = !DILocalVariable(name: "u32Temp2", scope: !4346, file: !70, line: 5295, type: !734)
!4358 = !DILocation(line: 5295, column: 17, scope: !4346)
!4359 = !DILocalVariable(name: "u32Temp3", scope: !4346, file: !70, line: 5295, type: !734)
!4360 = !DILocation(line: 5295, column: 26, scope: !4346)
!4361 = !DILocalVariable(name: "u8SignBit", scope: !4346, file: !70, line: 5296, type: !17)
!4362 = !DILocation(line: 5296, column: 5, scope: !4346)
!4363 = !DILocation(line: 5298, column: 5, scope: !4364)
!4364 = distinct !DILexicalBlock(scope: !4346, file: !70, line: 5298, column: 5)
!4365 = !DILocation(line: 5298, column: 11, scope: !4364)
!4366 = !DILocation(line: 5298, column: 5, scope: !4346)
!4367 = !DILocation(line: 5300, column: 13, scope: !4368)
!4368 = distinct !DILexicalBlock(scope: !4364, file: !70, line: 5299, column: 2)
!4369 = !DILocation(line: 5301, column: 2, scope: !4368)
!4370 = !DILocation(line: 5304, column: 13, scope: !4371)
!4371 = distinct !DILexicalBlock(scope: !4364, file: !70, line: 5303, column: 2)
!4372 = !DILocation(line: 5308, column: 5, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4346, file: !70, line: 5308, column: 5)
!4374 = !DILocation(line: 5308, column: 11, scope: !4373)
!4375 = !DILocation(line: 5308, column: 5, scope: !4346)
!4376 = !DILocation(line: 5310, column: 15, scope: !4377)
!4377 = distinct !DILexicalBlock(scope: !4373, file: !70, line: 5309, column: 2)
!4378 = !DILocation(line: 5310, column: 14, scope: !4377)
!4379 = !DILocation(line: 5310, column: 12, scope: !4377)
!4380 = !DILocation(line: 5311, column: 2, scope: !4377)
!4381 = !DILocation(line: 5314, column: 14, scope: !4382)
!4382 = distinct !DILexicalBlock(scope: !4373, file: !70, line: 5313, column: 2)
!4383 = !DILocation(line: 5314, column: 12, scope: !4382)
!4384 = !DILocation(line: 5317, column: 13, scope: !4346)
!4385 = !DILocation(line: 5317, column: 21, scope: !4346)
!4386 = !DILocation(line: 5317, column: 19, scope: !4346)
!4387 = !DILocation(line: 5317, column: 11, scope: !4346)
!4388 = !DILocation(line: 5318, column: 25, scope: !4346)
!4389 = !DILocation(line: 5318, column: 32, scope: !4346)
!4390 = !DILocation(line: 5318, column: 13, scope: !4346)
!4391 = !DILocation(line: 5318, column: 11, scope: !4346)
!4392 = !DILocation(line: 5319, column: 13, scope: !4346)
!4393 = !DILocation(line: 5319, column: 25, scope: !4346)
!4394 = !DILocation(line: 5319, column: 22, scope: !4346)
!4395 = !DILocation(line: 5319, column: 11, scope: !4346)
!4396 = !DILocation(line: 5320, column: 14, scope: !4346)
!4397 = !DILocation(line: 5320, column: 30, scope: !4346)
!4398 = !DILocation(line: 5320, column: 29, scope: !4346)
!4399 = !DILocation(line: 5320, column: 23, scope: !4346)
!4400 = !DILocation(line: 5320, column: 11, scope: !4346)
!4401 = !DILocation(line: 5321, column: 6, scope: !4402)
!4402 = distinct !DILexicalBlock(scope: !4346, file: !70, line: 5321, column: 5)
!4403 = !DILocation(line: 5321, column: 16, scope: !4402)
!4404 = !DILocation(line: 5321, column: 14, scope: !4402)
!4405 = !DILocation(line: 5321, column: 22, scope: !4402)
!4406 = !DILocation(line: 5321, column: 5, scope: !4346)
!4407 = !DILocation(line: 5323, column: 6, scope: !4408)
!4408 = distinct !DILexicalBlock(scope: !4409, file: !70, line: 5323, column: 6)
!4409 = distinct !DILexicalBlock(scope: !4402, file: !70, line: 5322, column: 2)
!4410 = !DILocation(line: 5323, column: 16, scope: !4408)
!4411 = !DILocation(line: 5323, column: 6, scope: !4409)
!4412 = !DILocation(line: 5325, column: 7, scope: !4413)
!4413 = distinct !DILexicalBlock(scope: !4414, file: !70, line: 5325, column: 7)
!4414 = distinct !DILexicalBlock(scope: !4408, file: !70, line: 5324, column: 3)
!4415 = !DILocation(line: 5325, column: 15, scope: !4413)
!4416 = !DILocation(line: 5325, column: 7, scope: !4414)
!4417 = !DILocation(line: 5326, column: 12, scope: !4413)
!4418 = !DILocation(line: 5326, column: 5, scope: !4413)
!4419 = !DILocation(line: 5328, column: 5, scope: !4413)
!4420 = !DILocation(line: 5332, column: 4, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4408, file: !70, line: 5331, column: 3)
!4422 = !DILocation(line: 5337, column: 3, scope: !4423)
!4423 = distinct !DILexicalBlock(scope: !4402, file: !70, line: 5336, column: 2)
!4424 = !DILocation(line: 5339, column: 1, scope: !4346)
!4425 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !70, file: !70, line: 4737, type: !1319, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4426 = !DILocalVariable(name: "value", arg: 1, scope: !4425, file: !70, line: 4737, type: !734)
!4427 = !DILocation(line: 4737, column: 31, scope: !4425)
!4428 = !DILocalVariable(name: "factor", arg: 2, scope: !4425, file: !70, line: 4737, type: !78)
!4429 = !DILocation(line: 4737, column: 42, scope: !4425)
!4430 = !DILocation(line: 4739, column: 41, scope: !4425)
!4431 = !DILocation(line: 4739, column: 47, scope: !4425)
!4432 = !DILocation(line: 4739, column: 10, scope: !4425)
!4433 = !DILocation(line: 4739, column: 3, scope: !4425)
!4434 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !70, file: !70, line: 5357, type: !4435, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4435 = !DISubroutineType(types: !4436)
!4436 = !{!734, !734, !78, !734}
!4437 = !DILocalVariable(name: "value", arg: 1, scope: !4434, file: !70, line: 5357, type: !734)
!4438 = !DILocation(line: 5357, column: 40, scope: !4434)
!4439 = !DILocalVariable(name: "factor", arg: 2, scope: !4434, file: !70, line: 5357, type: !78)
!4440 = !DILocation(line: 5357, column: 51, scope: !4434)
!4441 = !DILocalVariable(name: "count", arg: 3, scope: !4434, file: !70, line: 5357, type: !734)
!4442 = !DILocation(line: 5357, column: 63, scope: !4434)
!4443 = !DILocalVariable(name: "u32Temp1", scope: !4434, file: !70, line: 5359, type: !734)
!4444 = !DILocation(line: 5359, column: 6, scope: !4434)
!4445 = !DILocalVariable(name: "u32Temp2", scope: !4434, file: !70, line: 5359, type: !734)
!4446 = !DILocation(line: 5359, column: 17, scope: !4434)
!4447 = !DILocalVariable(name: "u8SignBit", scope: !4434, file: !70, line: 5360, type: !17)
!4448 = !DILocation(line: 5360, column: 5, scope: !4434)
!4449 = !DILocation(line: 5362, column: 5, scope: !4450)
!4450 = distinct !DILexicalBlock(scope: !4434, file: !70, line: 5362, column: 5)
!4451 = !DILocation(line: 5362, column: 11, scope: !4450)
!4452 = !DILocation(line: 5362, column: 5, scope: !4434)
!4453 = !DILocation(line: 5364, column: 13, scope: !4454)
!4454 = distinct !DILexicalBlock(scope: !4450, file: !70, line: 5363, column: 2)
!4455 = !DILocation(line: 5365, column: 2, scope: !4454)
!4456 = !DILocation(line: 5368, column: 13, scope: !4457)
!4457 = distinct !DILexicalBlock(scope: !4450, file: !70, line: 5367, column: 2)
!4458 = !DILocation(line: 5372, column: 5, scope: !4459)
!4459 = distinct !DILexicalBlock(scope: !4434, file: !70, line: 5372, column: 5)
!4460 = !DILocation(line: 5372, column: 11, scope: !4459)
!4461 = !DILocation(line: 5372, column: 5, scope: !4434)
!4462 = !DILocation(line: 5374, column: 15, scope: !4463)
!4463 = distinct !DILexicalBlock(scope: !4459, file: !70, line: 5373, column: 2)
!4464 = !DILocation(line: 5374, column: 14, scope: !4463)
!4465 = !DILocation(line: 5374, column: 12, scope: !4463)
!4466 = !DILocation(line: 5375, column: 2, scope: !4463)
!4467 = !DILocation(line: 5378, column: 14, scope: !4468)
!4468 = distinct !DILexicalBlock(scope: !4459, file: !70, line: 5377, column: 2)
!4469 = !DILocation(line: 5378, column: 12, scope: !4468)
!4470 = !DILocation(line: 5381, column: 25, scope: !4434)
!4471 = !DILocation(line: 5381, column: 32, scope: !4434)
!4472 = !DILocation(line: 5381, column: 13, scope: !4434)
!4473 = !DILocation(line: 5381, column: 11, scope: !4434)
!4474 = !DILocation(line: 5382, column: 13, scope: !4434)
!4475 = !DILocation(line: 5382, column: 26, scope: !4434)
!4476 = !DILocation(line: 5382, column: 31, scope: !4434)
!4477 = !DILocation(line: 5382, column: 22, scope: !4434)
!4478 = !DILocation(line: 5382, column: 11, scope: !4434)
!4479 = !DILocation(line: 5383, column: 5, scope: !4480)
!4480 = distinct !DILexicalBlock(scope: !4434, file: !70, line: 5383, column: 5)
!4481 = !DILocation(line: 5383, column: 15, scope: !4480)
!4482 = !DILocation(line: 5383, column: 5, scope: !4434)
!4483 = !DILocation(line: 5385, column: 10, scope: !4484)
!4484 = distinct !DILexicalBlock(scope: !4480, file: !70, line: 5384, column: 2)
!4485 = !DILocation(line: 5385, column: 3, scope: !4484)
!4486 = !DILocation(line: 5389, column: 3, scope: !4487)
!4487 = distinct !DILexicalBlock(scope: !4480, file: !70, line: 5388, column: 2)
!4488 = !DILocation(line: 5391, column: 1, scope: !4434)
!4489 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !70, file: !70, line: 4761, type: !3109, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4490 = !DILocalVariable(name: "value", arg: 1, scope: !4489, file: !70, line: 4761, type: !734)
!4491 = !DILocation(line: 4761, column: 30, scope: !4489)
!4492 = !DILocalVariable(name: "factor", arg: 2, scope: !4489, file: !70, line: 4761, type: !6)
!4493 = !DILocation(line: 4761, column: 40, scope: !4489)
!4494 = !DILocation(line: 4763, column: 40, scope: !4489)
!4495 = !DILocation(line: 4763, column: 46, scope: !4489)
!4496 = !DILocation(line: 4763, column: 10, scope: !4489)
!4497 = !DILocation(line: 4763, column: 3, scope: !4489)
!4498 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !70, file: !70, line: 5435, type: !4499, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4499 = !DISubroutineType(types: !4500)
!4500 = !{!734, !734, !6, !734}
!4501 = !DILocalVariable(name: "value", arg: 1, scope: !4498, file: !70, line: 5435, type: !734)
!4502 = !DILocation(line: 5435, column: 39, scope: !4498)
!4503 = !DILocalVariable(name: "factor", arg: 2, scope: !4498, file: !70, line: 5435, type: !6)
!4504 = !DILocation(line: 5435, column: 49, scope: !4498)
!4505 = !DILocalVariable(name: "count", arg: 3, scope: !4498, file: !70, line: 5435, type: !734)
!4506 = !DILocation(line: 5435, column: 61, scope: !4498)
!4507 = !DILocalVariable(name: "u32Temp1", scope: !4498, file: !70, line: 5437, type: !734)
!4508 = !DILocation(line: 5437, column: 6, scope: !4498)
!4509 = !DILocalVariable(name: "u32Temp2", scope: !4498, file: !70, line: 5437, type: !734)
!4510 = !DILocation(line: 5437, column: 17, scope: !4498)
!4511 = !DILocalVariable(name: "u32Temp3", scope: !4498, file: !70, line: 5437, type: !734)
!4512 = !DILocation(line: 5437, column: 26, scope: !4498)
!4513 = !DILocalVariable(name: "u8SignBit", scope: !4498, file: !70, line: 5438, type: !17)
!4514 = !DILocation(line: 5438, column: 5, scope: !4498)
!4515 = !DILocation(line: 5440, column: 5, scope: !4516)
!4516 = distinct !DILexicalBlock(scope: !4498, file: !70, line: 5440, column: 5)
!4517 = !DILocation(line: 5440, column: 11, scope: !4516)
!4518 = !DILocation(line: 5440, column: 5, scope: !4498)
!4519 = !DILocation(line: 5442, column: 13, scope: !4520)
!4520 = distinct !DILexicalBlock(scope: !4516, file: !70, line: 5441, column: 2)
!4521 = !DILocation(line: 5443, column: 2, scope: !4520)
!4522 = !DILocation(line: 5446, column: 13, scope: !4523)
!4523 = distinct !DILexicalBlock(scope: !4516, file: !70, line: 5445, column: 2)
!4524 = !DILocation(line: 5450, column: 5, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4498, file: !70, line: 5450, column: 5)
!4526 = !DILocation(line: 5450, column: 11, scope: !4525)
!4527 = !DILocation(line: 5450, column: 5, scope: !4498)
!4528 = !DILocation(line: 5452, column: 15, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4525, file: !70, line: 5451, column: 2)
!4530 = !DILocation(line: 5452, column: 14, scope: !4529)
!4531 = !DILocation(line: 5452, column: 12, scope: !4529)
!4532 = !DILocation(line: 5453, column: 2, scope: !4529)
!4533 = !DILocation(line: 5456, column: 14, scope: !4534)
!4534 = distinct !DILexicalBlock(scope: !4525, file: !70, line: 5455, column: 2)
!4535 = !DILocation(line: 5456, column: 12, scope: !4534)
!4536 = !DILocation(line: 5459, column: 13, scope: !4498)
!4537 = !DILocation(line: 5459, column: 21, scope: !4498)
!4538 = !DILocation(line: 5459, column: 19, scope: !4498)
!4539 = !DILocation(line: 5459, column: 11, scope: !4498)
!4540 = !DILocation(line: 5460, column: 25, scope: !4498)
!4541 = !DILocation(line: 5460, column: 32, scope: !4498)
!4542 = !DILocation(line: 5460, column: 13, scope: !4498)
!4543 = !DILocation(line: 5460, column: 11, scope: !4498)
!4544 = !DILocation(line: 5461, column: 13, scope: !4498)
!4545 = !DILocation(line: 5461, column: 25, scope: !4498)
!4546 = !DILocation(line: 5461, column: 22, scope: !4498)
!4547 = !DILocation(line: 5461, column: 11, scope: !4498)
!4548 = !DILocation(line: 5462, column: 14, scope: !4498)
!4549 = !DILocation(line: 5462, column: 30, scope: !4498)
!4550 = !DILocation(line: 5462, column: 29, scope: !4498)
!4551 = !DILocation(line: 5462, column: 23, scope: !4498)
!4552 = !DILocation(line: 5462, column: 11, scope: !4498)
!4553 = !DILocation(line: 5463, column: 6, scope: !4554)
!4554 = distinct !DILexicalBlock(scope: !4498, file: !70, line: 5463, column: 5)
!4555 = !DILocation(line: 5463, column: 16, scope: !4554)
!4556 = !DILocation(line: 5463, column: 14, scope: !4554)
!4557 = !DILocation(line: 5463, column: 22, scope: !4554)
!4558 = !DILocation(line: 5463, column: 5, scope: !4498)
!4559 = !DILocation(line: 5465, column: 6, scope: !4560)
!4560 = distinct !DILexicalBlock(scope: !4561, file: !70, line: 5465, column: 6)
!4561 = distinct !DILexicalBlock(scope: !4554, file: !70, line: 5464, column: 2)
!4562 = !DILocation(line: 5465, column: 16, scope: !4560)
!4563 = !DILocation(line: 5465, column: 6, scope: !4561)
!4564 = !DILocation(line: 5467, column: 7, scope: !4565)
!4565 = distinct !DILexicalBlock(scope: !4566, file: !70, line: 5467, column: 7)
!4566 = distinct !DILexicalBlock(scope: !4560, file: !70, line: 5466, column: 3)
!4567 = !DILocation(line: 5467, column: 15, scope: !4565)
!4568 = !DILocation(line: 5467, column: 7, scope: !4566)
!4569 = !DILocation(line: 5468, column: 12, scope: !4565)
!4570 = !DILocation(line: 5468, column: 5, scope: !4565)
!4571 = !DILocation(line: 5470, column: 5, scope: !4565)
!4572 = !DILocation(line: 5474, column: 4, scope: !4573)
!4573 = distinct !DILexicalBlock(scope: !4560, file: !70, line: 5473, column: 3)
!4574 = !DILocation(line: 5479, column: 3, scope: !4575)
!4575 = distinct !DILexicalBlock(scope: !4554, file: !70, line: 5478, column: 2)
!4576 = !DILocation(line: 5481, column: 1, scope: !4498)
!4577 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !70, file: !70, line: 4785, type: !1115, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4578 = !DILocalVariable(name: "value", arg: 1, scope: !4577, file: !70, line: 4785, type: !734)
!4579 = !DILocation(line: 4785, column: 31, scope: !4577)
!4580 = !DILocalVariable(name: "factor", arg: 2, scope: !4577, file: !70, line: 4785, type: !22)
!4581 = !DILocation(line: 4785, column: 42, scope: !4577)
!4582 = !DILocation(line: 4787, column: 41, scope: !4577)
!4583 = !DILocation(line: 4787, column: 47, scope: !4577)
!4584 = !DILocation(line: 4787, column: 10, scope: !4577)
!4585 = !DILocation(line: 4787, column: 3, scope: !4577)
!4586 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !70, file: !70, line: 4809, type: !1410, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4587 = !DILocalVariable(name: "value", arg: 1, scope: !4586, file: !70, line: 4809, type: !734)
!4588 = !DILocation(line: 4809, column: 31, scope: !4586)
!4589 = !DILocalVariable(name: "factor", arg: 2, scope: !4586, file: !70, line: 4809, type: !734)
!4590 = !DILocation(line: 4809, column: 42, scope: !4586)
!4591 = !DILocation(line: 4811, column: 41, scope: !4586)
!4592 = !DILocation(line: 4811, column: 47, scope: !4586)
!4593 = !DILocation(line: 4811, column: 10, scope: !4586)
!4594 = !DILocation(line: 4811, column: 3, scope: !4586)
!4595 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !70, file: !70, line: 5408, type: !4596, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4596 = !DISubroutineType(types: !4597)
!4597 = !{!734, !734, !734, !734}
!4598 = !DILocalVariable(name: "value", arg: 1, scope: !4595, file: !70, line: 5408, type: !734)
!4599 = !DILocation(line: 5408, column: 40, scope: !4595)
!4600 = !DILocalVariable(name: "factor", arg: 2, scope: !4595, file: !70, line: 5408, type: !734)
!4601 = !DILocation(line: 5408, column: 50, scope: !4595)
!4602 = !DILocalVariable(name: "count", arg: 3, scope: !4595, file: !70, line: 5408, type: !734)
!4603 = !DILocation(line: 5408, column: 62, scope: !4595)
!4604 = !DILocalVariable(name: "u32Temp1", scope: !4595, file: !70, line: 5410, type: !734)
!4605 = !DILocation(line: 5410, column: 6, scope: !4595)
!4606 = !DILocalVariable(name: "u32Temp2", scope: !4595, file: !70, line: 5410, type: !734)
!4607 = !DILocation(line: 5410, column: 17, scope: !4595)
!4608 = !DILocalVariable(name: "u32Temp3", scope: !4595, file: !70, line: 5410, type: !734)
!4609 = !DILocation(line: 5410, column: 26, scope: !4595)
!4610 = !DILocalVariable(name: "u32Temp4", scope: !4595, file: !70, line: 5410, type: !734)
!4611 = !DILocation(line: 5410, column: 35, scope: !4595)
!4612 = !DILocalVariable(name: "u8SignBit", scope: !4595, file: !70, line: 5411, type: !17)
!4613 = !DILocation(line: 5411, column: 5, scope: !4595)
!4614 = !DILocation(line: 5413, column: 25, scope: !4595)
!4615 = !DILocation(line: 5413, column: 32, scope: !4595)
!4616 = !DILocation(line: 5413, column: 13, scope: !4595)
!4617 = !DILocation(line: 5413, column: 11, scope: !4595)
!4618 = !DILocation(line: 5414, column: 13, scope: !4595)
!4619 = !DILocation(line: 5414, column: 26, scope: !4595)
!4620 = !DILocation(line: 5414, column: 31, scope: !4595)
!4621 = !DILocation(line: 5414, column: 22, scope: !4595)
!4622 = !DILocation(line: 5414, column: 11, scope: !4595)
!4623 = !DILocation(line: 5415, column: 9, scope: !4595)
!4624 = !DILocation(line: 5415, column: 2, scope: !4595)
!4625 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !70, file: !70, line: 4833, type: !3048, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4626 = !DILocalVariable(name: "value", arg: 1, scope: !4625, file: !70, line: 4833, type: !734)
!4627 = !DILocation(line: 4833, column: 30, scope: !4625)
!4628 = !DILocalVariable(name: "factor", arg: 2, scope: !4625, file: !70, line: 4833, type: !17)
!4629 = !DILocation(line: 4833, column: 40, scope: !4625)
!4630 = !DILocation(line: 4835, column: 40, scope: !4625)
!4631 = !DILocation(line: 4835, column: 46, scope: !4625)
!4632 = !DILocation(line: 4835, column: 10, scope: !4625)
!4633 = !DILocation(line: 4835, column: 3, scope: !4625)
!4634 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !70, file: !70, line: 5499, type: !4635, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4635 = !DISubroutineType(types: !4636)
!4636 = !{!734, !734, !17, !734}
!4637 = !DILocalVariable(name: "value", arg: 1, scope: !4634, file: !70, line: 5499, type: !734)
!4638 = !DILocation(line: 5499, column: 39, scope: !4634)
!4639 = !DILocalVariable(name: "factor", arg: 2, scope: !4634, file: !70, line: 5499, type: !17)
!4640 = !DILocation(line: 5499, column: 49, scope: !4634)
!4641 = !DILocalVariable(name: "count", arg: 3, scope: !4634, file: !70, line: 5499, type: !734)
!4642 = !DILocation(line: 5499, column: 61, scope: !4634)
!4643 = !DILocalVariable(name: "u32Temp1", scope: !4634, file: !70, line: 5501, type: !734)
!4644 = !DILocation(line: 5501, column: 6, scope: !4634)
!4645 = !DILocalVariable(name: "u32Temp2", scope: !4634, file: !70, line: 5501, type: !734)
!4646 = !DILocation(line: 5501, column: 17, scope: !4634)
!4647 = !DILocation(line: 5503, column: 13, scope: !4634)
!4648 = !DILocation(line: 5503, column: 21, scope: !4634)
!4649 = !DILocation(line: 5503, column: 19, scope: !4634)
!4650 = !DILocation(line: 5503, column: 11, scope: !4634)
!4651 = !DILocation(line: 5504, column: 25, scope: !4634)
!4652 = !DILocation(line: 5504, column: 32, scope: !4634)
!4653 = !DILocation(line: 5504, column: 13, scope: !4634)
!4654 = !DILocation(line: 5504, column: 11, scope: !4634)
!4655 = !DILocation(line: 5505, column: 13, scope: !4634)
!4656 = !DILocation(line: 5505, column: 25, scope: !4634)
!4657 = !DILocation(line: 5505, column: 22, scope: !4634)
!4658 = !DILocation(line: 5505, column: 11, scope: !4634)
!4659 = !DILocation(line: 5506, column: 14, scope: !4634)
!4660 = !DILocation(line: 5506, column: 30, scope: !4634)
!4661 = !DILocation(line: 5506, column: 29, scope: !4634)
!4662 = !DILocation(line: 5506, column: 23, scope: !4634)
!4663 = !DILocation(line: 5506, column: 11, scope: !4634)
!4664 = !DILocation(line: 5507, column: 6, scope: !4665)
!4665 = distinct !DILexicalBlock(scope: !4634, file: !70, line: 5507, column: 5)
!4666 = !DILocation(line: 5507, column: 16, scope: !4665)
!4667 = !DILocation(line: 5507, column: 14, scope: !4665)
!4668 = !DILocation(line: 5507, column: 22, scope: !4665)
!4669 = !DILocation(line: 5507, column: 5, scope: !4634)
!4670 = !DILocation(line: 5509, column: 6, scope: !4671)
!4671 = distinct !DILexicalBlock(scope: !4672, file: !70, line: 5509, column: 6)
!4672 = distinct !DILexicalBlock(scope: !4665, file: !70, line: 5508, column: 2)
!4673 = !DILocation(line: 5509, column: 14, scope: !4671)
!4674 = !DILocation(line: 5509, column: 6, scope: !4672)
!4675 = !DILocation(line: 5510, column: 11, scope: !4671)
!4676 = !DILocation(line: 5510, column: 4, scope: !4671)
!4677 = !DILocation(line: 5512, column: 4, scope: !4671)
!4678 = !DILocation(line: 5516, column: 3, scope: !4679)
!4679 = distinct !DILexicalBlock(scope: !4665, file: !70, line: 5515, column: 2)
!4680 = !DILocation(line: 5518, column: 1, scope: !4634)
!4681 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !70, file: !70, line: 4856, type: !883, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4682 = !DILocalVariable(name: "value", arg: 1, scope: !4681, file: !70, line: 4856, type: !17)
!4683 = !DILocation(line: 4856, column: 28, scope: !4681)
!4684 = !DILocalVariable(name: "factor", arg: 2, scope: !4681, file: !70, line: 4856, type: !17)
!4685 = !DILocation(line: 4856, column: 38, scope: !4681)
!4686 = !DILocation(line: 4858, column: 38, scope: !4681)
!4687 = !DILocation(line: 4858, column: 44, scope: !4681)
!4688 = !DILocation(line: 4858, column: 10, scope: !4681)
!4689 = !DILocation(line: 4858, column: 3, scope: !4681)
!4690 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !70, file: !70, line: 4879, type: !883, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4691 = !DILocalVariable(name: "value", arg: 1, scope: !4690, file: !70, line: 4879, type: !17)
!4692 = !DILocation(line: 4879, column: 28, scope: !4690)
!4693 = !DILocalVariable(name: "factor", arg: 2, scope: !4690, file: !70, line: 4879, type: !17)
!4694 = !DILocation(line: 4879, column: 38, scope: !4690)
!4695 = !DILocation(line: 4881, column: 38, scope: !4690)
!4696 = !DILocation(line: 4881, column: 44, scope: !4690)
!4697 = !DILocation(line: 4881, column: 10, scope: !4690)
!4698 = !DILocation(line: 4881, column: 3, scope: !4690)
!4699 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !70, file: !70, line: 4903, type: !883, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4700 = !DILocalVariable(name: "value", arg: 1, scope: !4699, file: !70, line: 4903, type: !17)
!4701 = !DILocation(line: 4903, column: 26, scope: !4699)
!4702 = !DILocalVariable(name: "factor", arg: 2, scope: !4699, file: !70, line: 4903, type: !17)
!4703 = !DILocation(line: 4903, column: 36, scope: !4699)
!4704 = !DILocation(line: 4905, column: 38, scope: !4699)
!4705 = !DILocation(line: 4905, column: 44, scope: !4699)
!4706 = !DILocation(line: 4905, column: 10, scope: !4699)
!4707 = !DILocation(line: 4905, column: 3, scope: !4699)
!4708 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !70, file: !70, line: 4927, type: !883, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4709 = !DILocalVariable(name: "value", arg: 1, scope: !4708, file: !70, line: 4927, type: !17)
!4710 = !DILocation(line: 4927, column: 28, scope: !4708)
!4711 = !DILocalVariable(name: "factor", arg: 2, scope: !4708, file: !70, line: 4927, type: !17)
!4712 = !DILocation(line: 4927, column: 38, scope: !4708)
!4713 = !DILocation(line: 4929, column: 41, scope: !4708)
!4714 = !DILocation(line: 4929, column: 47, scope: !4708)
!4715 = !DILocation(line: 4929, column: 10, scope: !4708)
!4716 = !DILocation(line: 4929, column: 3, scope: !4708)
!4717 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !70, file: !70, line: 4951, type: !883, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4718 = !DILocalVariable(name: "value", arg: 1, scope: !4717, file: !70, line: 4951, type: !17)
!4719 = !DILocation(line: 4951, column: 26, scope: !4717)
!4720 = !DILocalVariable(name: "factor", arg: 2, scope: !4717, file: !70, line: 4951, type: !17)
!4721 = !DILocation(line: 4951, column: 36, scope: !4717)
!4722 = !DILocation(line: 4953, column: 41, scope: !4717)
!4723 = !DILocation(line: 4953, column: 47, scope: !4717)
!4724 = !DILocation(line: 4953, column: 10, scope: !4717)
!4725 = !DILocation(line: 4953, column: 3, scope: !4717)
!4726 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !70, file: !70, line: 4974, type: !883, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4727 = !DILocalVariable(name: "value", arg: 1, scope: !4726, file: !70, line: 4974, type: !17)
!4728 = !DILocation(line: 4974, column: 26, scope: !4726)
!4729 = !DILocalVariable(name: "factor", arg: 2, scope: !4726, file: !70, line: 4974, type: !17)
!4730 = !DILocation(line: 4974, column: 36, scope: !4726)
!4731 = !DILocation(line: 4976, column: 41, scope: !4726)
!4732 = !DILocation(line: 4976, column: 47, scope: !4726)
!4733 = !DILocation(line: 4976, column: 10, scope: !4726)
!4734 = !DILocation(line: 4976, column: 3, scope: !4726)
!4735 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !70, file: !70, line: 4997, type: !883, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4736 = !DILocalVariable(name: "value", arg: 1, scope: !4735, file: !70, line: 4997, type: !17)
!4737 = !DILocation(line: 4997, column: 25, scope: !4735)
!4738 = !DILocalVariable(name: "factor", arg: 2, scope: !4735, file: !70, line: 4997, type: !17)
!4739 = !DILocation(line: 4997, column: 35, scope: !4735)
!4740 = !DILocation(line: 4999, column: 41, scope: !4735)
!4741 = !DILocation(line: 4999, column: 47, scope: !4735)
!4742 = !DILocation(line: 4999, column: 10, scope: !4735)
!4743 = !DILocation(line: 4999, column: 3, scope: !4735)
!4744 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !70, file: !70, line: 5020, type: !883, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4745 = !DILocalVariable(name: "value", arg: 1, scope: !4744, file: !70, line: 5020, type: !17)
!4746 = !DILocation(line: 5020, column: 26, scope: !4744)
!4747 = !DILocalVariable(name: "factor", arg: 2, scope: !4744, file: !70, line: 5020, type: !17)
!4748 = !DILocation(line: 5020, column: 35, scope: !4744)
!4749 = !DILocation(line: 5022, column: 41, scope: !4744)
!4750 = !DILocation(line: 5022, column: 47, scope: !4744)
!4751 = !DILocation(line: 5022, column: 10, scope: !4744)
!4752 = !DILocation(line: 5022, column: 3, scope: !4744)
!4753 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !70, file: !70, line: 5043, type: !883, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4754 = !DILocalVariable(name: "value", arg: 1, scope: !4753, file: !70, line: 5043, type: !17)
!4755 = !DILocation(line: 5043, column: 25, scope: !4753)
!4756 = !DILocalVariable(name: "factor", arg: 2, scope: !4753, file: !70, line: 5043, type: !17)
!4757 = !DILocation(line: 5043, column: 35, scope: !4753)
!4758 = !DILocation(line: 5045, column: 41, scope: !4753)
!4759 = !DILocation(line: 5045, column: 47, scope: !4753)
!4760 = !DILocation(line: 5045, column: 10, scope: !4753)
!4761 = !DILocation(line: 5045, column: 3, scope: !4753)
!4762 = distinct !DISubprogram(name: "MulHighWord", scope: !4763, file: !4763, line: 39, type: !1410, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4763 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116")
!4764 = !DILocalVariable(name: "arg1", arg: 1, scope: !4762, file: !4763, line: 39, type: !734)
!4765 = !DILocation(line: 39, column: 30, scope: !4762)
!4766 = !DILocalVariable(name: "arg2", arg: 2, scope: !4762, file: !4763, line: 39, type: !734)
!4767 = !DILocation(line: 39, column: 48, scope: !4762)
!4768 = !DILocalVariable(name: "arg1_LW", scope: !4762, file: !4763, line: 41, type: !22)
!4769 = !DILocation(line: 41, column: 6, scope: !4762)
!4770 = !DILocalVariable(name: "arg1_HW", scope: !4762, file: !4763, line: 41, type: !22)
!4771 = !DILocation(line: 41, column: 14, scope: !4762)
!4772 = !DILocalVariable(name: "arg2_LW", scope: !4762, file: !4763, line: 41, type: !22)
!4773 = !DILocation(line: 41, column: 22, scope: !4762)
!4774 = !DILocalVariable(name: "arg2_HW", scope: !4762, file: !4763, line: 41, type: !22)
!4775 = !DILocation(line: 41, column: 30, scope: !4762)
!4776 = !DILocalVariable(name: "MulTemp1", scope: !4762, file: !4763, line: 42, type: !734)
!4777 = !DILocation(line: 42, column: 6, scope: !4762)
!4778 = !DILocalVariable(name: "MulTemp2", scope: !4762, file: !4763, line: 42, type: !734)
!4779 = !DILocation(line: 42, column: 16, scope: !4762)
!4780 = !DILocalVariable(name: "MulTemp3", scope: !4762, file: !4763, line: 42, type: !734)
!4781 = !DILocation(line: 42, column: 26, scope: !4762)
!4782 = !DILocalVariable(name: "MulTemp4", scope: !4762, file: !4763, line: 42, type: !734)
!4783 = !DILocation(line: 42, column: 36, scope: !4762)
!4784 = !DILocalVariable(name: "HIGHWORD", scope: !4762, file: !4763, line: 42, type: !734)
!4785 = !DILocation(line: 42, column: 47, scope: !4762)
!4786 = !DILocalVariable(name: "OverFlow", scope: !4762, file: !4763, line: 42, type: !734)
!4787 = !DILocation(line: 42, column: 57, scope: !4762)
!4788 = !DILocation(line: 43, column: 12, scope: !4762)
!4789 = !DILocation(line: 43, column: 17, scope: !4762)
!4790 = !DILocation(line: 43, column: 10, scope: !4762)
!4791 = !DILocation(line: 44, column: 13, scope: !4762)
!4792 = !DILocation(line: 44, column: 18, scope: !4762)
!4793 = !DILocation(line: 44, column: 31, scope: !4762)
!4794 = !DILocation(line: 44, column: 12, scope: !4762)
!4795 = !DILocation(line: 44, column: 10, scope: !4762)
!4796 = !DILocation(line: 45, column: 12, scope: !4762)
!4797 = !DILocation(line: 45, column: 17, scope: !4762)
!4798 = !DILocation(line: 45, column: 10, scope: !4762)
!4799 = !DILocation(line: 46, column: 13, scope: !4762)
!4800 = !DILocation(line: 46, column: 18, scope: !4762)
!4801 = !DILocation(line: 46, column: 31, scope: !4762)
!4802 = !DILocation(line: 46, column: 12, scope: !4762)
!4803 = !DILocation(line: 46, column: 10, scope: !4762)
!4804 = !DILocation(line: 47, column: 13, scope: !4762)
!4805 = !DILocation(line: 47, column: 23, scope: !4762)
!4806 = !DILocation(line: 47, column: 21, scope: !4762)
!4807 = !DILocation(line: 47, column: 11, scope: !4762)
!4808 = !DILocation(line: 48, column: 13, scope: !4762)
!4809 = !DILocation(line: 48, column: 23, scope: !4762)
!4810 = !DILocation(line: 48, column: 21, scope: !4762)
!4811 = !DILocation(line: 48, column: 11, scope: !4762)
!4812 = !DILocation(line: 49, column: 13, scope: !4762)
!4813 = !DILocation(line: 49, column: 23, scope: !4762)
!4814 = !DILocation(line: 49, column: 21, scope: !4762)
!4815 = !DILocation(line: 49, column: 11, scope: !4762)
!4816 = !DILocation(line: 50, column: 13, scope: !4762)
!4817 = !DILocation(line: 50, column: 23, scope: !4762)
!4818 = !DILocation(line: 50, column: 21, scope: !4762)
!4819 = !DILocation(line: 50, column: 11, scope: !4762)
!4820 = !DILocation(line: 52, column: 14, scope: !4762)
!4821 = !DILocation(line: 52, column: 23, scope: !4762)
!4822 = !DILocation(line: 52, column: 33, scope: !4762)
!4823 = !DILocation(line: 52, column: 42, scope: !4762)
!4824 = !DILocation(line: 52, column: 30, scope: !4762)
!4825 = !DILocation(line: 52, column: 51, scope: !4762)
!4826 = !DILocation(line: 52, column: 49, scope: !4762)
!4827 = !DILocation(line: 52, column: 11, scope: !4762)
!4828 = !DILocation(line: 53, column: 14, scope: !4762)
!4829 = !DILocation(line: 53, column: 22, scope: !4762)
!4830 = !DILocation(line: 53, column: 31, scope: !4762)
!4831 = !DILocation(line: 53, column: 40, scope: !4762)
!4832 = !DILocation(line: 53, column: 28, scope: !4762)
!4833 = !DILocation(line: 53, column: 53, scope: !4762)
!4834 = !DILocation(line: 53, column: 62, scope: !4762)
!4835 = !DILocation(line: 53, column: 50, scope: !4762)
!4836 = !DILocation(line: 53, column: 11, scope: !4762)
!4837 = !DILocation(line: 54, column: 6, scope: !4838)
!4838 = distinct !DILexicalBlock(scope: !4762, file: !4763, line: 54, column: 6)
!4839 = !DILocation(line: 54, column: 15, scope: !4838)
!4840 = !DILocation(line: 54, column: 6, scope: !4762)
!4841 = !DILocation(line: 56, column: 10, scope: !4842)
!4842 = distinct !DILexicalBlock(scope: !4838, file: !4763, line: 55, column: 2)
!4843 = !DILocation(line: 56, column: 22, scope: !4842)
!4844 = !DILocation(line: 56, column: 30, scope: !4842)
!4845 = !DILocation(line: 56, column: 19, scope: !4842)
!4846 = !DILocation(line: 56, column: 3, scope: !4842)
!4847 = !DILocation(line: 60, column: 10, scope: !4848)
!4848 = distinct !DILexicalBlock(scope: !4838, file: !4763, line: 59, column: 2)
!4849 = !DILocation(line: 60, column: 3, scope: !4848)
!4850 = !DILocation(line: 62, column: 1, scope: !4762)
!4851 = distinct !DISubprogram(name: "MulLowWord", scope: !4763, file: !4763, line: 78, type: !1410, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4852 = !DILocalVariable(name: "arg1", arg: 1, scope: !4851, file: !4763, line: 78, type: !734)
!4853 = !DILocation(line: 78, column: 29, scope: !4851)
!4854 = !DILocalVariable(name: "arg2", arg: 2, scope: !4851, file: !4763, line: 78, type: !734)
!4855 = !DILocation(line: 78, column: 47, scope: !4851)
!4856 = !DILocalVariable(name: "arg1_LW", scope: !4851, file: !4763, line: 80, type: !22)
!4857 = !DILocation(line: 80, column: 6, scope: !4851)
!4858 = !DILocalVariable(name: "arg1_HW", scope: !4851, file: !4763, line: 80, type: !22)
!4859 = !DILocation(line: 80, column: 14, scope: !4851)
!4860 = !DILocalVariable(name: "arg2_LW", scope: !4851, file: !4763, line: 80, type: !22)
!4861 = !DILocation(line: 80, column: 22, scope: !4851)
!4862 = !DILocalVariable(name: "arg2_HW", scope: !4851, file: !4763, line: 80, type: !22)
!4863 = !DILocation(line: 80, column: 30, scope: !4851)
!4864 = !DILocalVariable(name: "MulTemp1", scope: !4851, file: !4763, line: 81, type: !734)
!4865 = !DILocation(line: 81, column: 6, scope: !4851)
!4866 = !DILocalVariable(name: "MulTemp2", scope: !4851, file: !4763, line: 81, type: !734)
!4867 = !DILocation(line: 81, column: 16, scope: !4851)
!4868 = !DILocalVariable(name: "MulTemp3", scope: !4851, file: !4763, line: 81, type: !734)
!4869 = !DILocation(line: 81, column: 26, scope: !4851)
!4870 = !DILocalVariable(name: "MulTemp4", scope: !4851, file: !4763, line: 81, type: !734)
!4871 = !DILocation(line: 81, column: 36, scope: !4851)
!4872 = !DILocalVariable(name: "HIGHWORD", scope: !4851, file: !4763, line: 81, type: !734)
!4873 = !DILocation(line: 81, column: 47, scope: !4851)
!4874 = !DILocalVariable(name: "OverFlow", scope: !4851, file: !4763, line: 81, type: !734)
!4875 = !DILocation(line: 81, column: 57, scope: !4851)
!4876 = !DILocation(line: 82, column: 12, scope: !4851)
!4877 = !DILocation(line: 82, column: 17, scope: !4851)
!4878 = !DILocation(line: 82, column: 10, scope: !4851)
!4879 = !DILocation(line: 83, column: 13, scope: !4851)
!4880 = !DILocation(line: 83, column: 18, scope: !4851)
!4881 = !DILocation(line: 83, column: 31, scope: !4851)
!4882 = !DILocation(line: 83, column: 12, scope: !4851)
!4883 = !DILocation(line: 83, column: 10, scope: !4851)
!4884 = !DILocation(line: 84, column: 12, scope: !4851)
!4885 = !DILocation(line: 84, column: 17, scope: !4851)
!4886 = !DILocation(line: 84, column: 10, scope: !4851)
!4887 = !DILocation(line: 85, column: 13, scope: !4851)
!4888 = !DILocation(line: 85, column: 18, scope: !4851)
!4889 = !DILocation(line: 85, column: 31, scope: !4851)
!4890 = !DILocation(line: 85, column: 12, scope: !4851)
!4891 = !DILocation(line: 85, column: 10, scope: !4851)
!4892 = !DILocation(line: 86, column: 13, scope: !4851)
!4893 = !DILocation(line: 86, column: 23, scope: !4851)
!4894 = !DILocation(line: 86, column: 21, scope: !4851)
!4895 = !DILocation(line: 86, column: 11, scope: !4851)
!4896 = !DILocation(line: 87, column: 13, scope: !4851)
!4897 = !DILocation(line: 87, column: 23, scope: !4851)
!4898 = !DILocation(line: 87, column: 21, scope: !4851)
!4899 = !DILocation(line: 87, column: 11, scope: !4851)
!4900 = !DILocation(line: 88, column: 13, scope: !4851)
!4901 = !DILocation(line: 88, column: 23, scope: !4851)
!4902 = !DILocation(line: 88, column: 21, scope: !4851)
!4903 = !DILocation(line: 88, column: 11, scope: !4851)
!4904 = !DILocation(line: 89, column: 13, scope: !4851)
!4905 = !DILocation(line: 89, column: 23, scope: !4851)
!4906 = !DILocation(line: 89, column: 21, scope: !4851)
!4907 = !DILocation(line: 89, column: 11, scope: !4851)
!4908 = !DILocation(line: 90, column: 14, scope: !4851)
!4909 = !DILocation(line: 90, column: 28, scope: !4851)
!4910 = !DILocation(line: 90, column: 37, scope: !4851)
!4911 = !DILocation(line: 90, column: 46, scope: !4851)
!4912 = !DILocation(line: 90, column: 24, scope: !4851)
!4913 = !DILocation(line: 90, column: 56, scope: !4851)
!4914 = !DILocation(line: 90, column: 65, scope: !4851)
!4915 = !DILocation(line: 90, column: 74, scope: !4851)
!4916 = !DILocation(line: 90, column: 52, scope: !4851)
!4917 = !DILocation(line: 90, column: 11, scope: !4851)
!4918 = !DILocation(line: 92, column: 9, scope: !4851)
!4919 = !DILocation(line: 92, column: 2, scope: !4851)
!4920 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4921, file: !4921, line: 12, type: !4922, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !4925)
!4921 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4922 = !DISubroutineType(types: !4923)
!4923 = !{null, !4924}
!4924 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4925 = !{!4926}
!4926 = !DILocalVariable(name: "z", arg: 1, scope: !4920, file: !4921, line: 12, type: !4924)
!4927 = !DILocation(line: 0, scope: !4920)
!4928 = !DILocation(line: 13, column: 9, scope: !4929)
!4929 = distinct !DILexicalBlock(scope: !4920, file: !4921, line: 13, column: 7)
!4930 = !DILocation(line: 13, column: 7, scope: !4920)
!4931 = !DILocation(line: 14, column: 5, scope: !4929)
!4932 = !DILocation(line: 15, column: 1, scope: !4920)
!4933 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4934, file: !4934, line: 20, type: !4935, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4938)
!4934 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4935 = !DISubroutineType(types: !4936)
!4936 = !{null, !4937, !4937}
!4937 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4938 = !{!4939, !4940}
!4939 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4933, file: !4934, line: 20, type: !4937)
!4940 = !DILocalVariable(name: "shift", arg: 2, scope: !4933, file: !4934, line: 20, type: !4937)
!4941 = !DILocation(line: 0, scope: !4933)
!4942 = !DILocation(line: 21, column: 13, scope: !4943)
!4943 = distinct !DILexicalBlock(scope: !4933, file: !4934, line: 21, column: 7)
!4944 = !DILocation(line: 21, column: 7, scope: !4933)
!4945 = !DILocation(line: 27, column: 5, scope: !4946)
!4946 = distinct !DILexicalBlock(scope: !4943, file: !4934, line: 21, column: 26)
!4947 = !DILocation(line: 29, column: 1, scope: !4933)
