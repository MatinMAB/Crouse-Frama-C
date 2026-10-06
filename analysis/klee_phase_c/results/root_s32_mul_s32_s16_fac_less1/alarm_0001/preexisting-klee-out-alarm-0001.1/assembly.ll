; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/build/root_s32_mul_s32_s16_fac_less1_alarm_0001.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"count\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [63 x i8] c"KLEE-ALARM-0001: signed overflow. assert -value <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0001.err\00", align 1
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
  %factor = alloca i16, align 2
  %count = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %factor, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %count, metadata !58, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %result, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = bitcast i32* %value to i8*, !dbg !65
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !66
  %1 = bitcast i16* %factor to i8*, !dbg !67
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  %2 = bitcast i32* %count to i8*, !dbg !69
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  %3 = load i32, i32* %value, align 4, !dbg !71
  %4 = load i16, i16* %factor, align 2, !dbg !72
  %5 = load i32, i32* %count, align 4, !dbg !73
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %3, i16 signext %4, i32 %5), !dbg !74
  store i32 %call, i32* %result, align 4, !dbg !75
  %6 = load i32, i32* %result, align 4, !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !78 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !86, metadata !DIExpression()), !dbg !88
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !90
  %0 = load i8, i8* %value.addr, align 1, !dbg !91
  %conv = sext i8 %0 to i32, !dbg !91
  %1 = load i16, i16* %factor.addr, align 2, !dbg !92
  %conv1 = zext i16 %1 to i32, !dbg !92
  %mul = mul nsw i32 %conv, %conv1, !dbg !93
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !94
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !95
  %shr = ashr i32 %2, 16, !dbg !96
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !97
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !98
  %cmp = icmp slt i32 %3, 0, !dbg !100
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !101

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !102
  %and = and i32 %4, 65535, !dbg !103
  %cmp3 = icmp ne i32 %and, 0, !dbg !104
  br i1 %cmp3, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !106
  %add = add nsw i32 %5, 1, !dbg !108
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !109
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !110
  %conv5 = trunc i32 %6 to i8, !dbg !111
  store i8 %conv5, i8* %retval, align 1, !dbg !112
  br label %return, !dbg !112

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !113
  %conv6 = trunc i32 %7 to i8, !dbg !115
  store i8 %conv6, i8* %retval, align 1, !dbg !116
  br label %return, !dbg !116

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !117
  ret i8 %8, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !118 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !126
  %0 = load i8, i8* %value.addr, align 1, !dbg !127
  %conv = sext i8 %0 to i32, !dbg !127
  %1 = load i16, i16* %factor.addr, align 2, !dbg !128
  %conv1 = zext i16 %1 to i32, !dbg !128
  %mul = mul nsw i32 %conv, %conv1, !dbg !129
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !130
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !131
  %shr = ashr i32 %2, 8, !dbg !132
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !133
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !134
  %cmp = icmp slt i32 %3, 0, !dbg !136
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !137

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !138
  %and = and i32 %4, 255, !dbg !139
  %cmp3 = icmp ne i32 %and, 0, !dbg !140
  br i1 %cmp3, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !142
  %add = add nsw i32 %5, 1, !dbg !144
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !145
  br label %if.end, !dbg !146

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !147
  %cmp5 = icmp slt i32 %6, 127, !dbg !149
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !150

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !151
  %cmp8 = icmp sgt i32 %7, -128, !dbg !154
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !155

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !156
  %conv11 = trunc i32 %8 to i8, !dbg !158
  store i8 %conv11, i8* %retval, align 1, !dbg !159
  br label %return, !dbg !159

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !160
  br label %return, !dbg !160

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !162
  br label %return, !dbg !162

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !164
  ret i8 %9, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !165 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !168, metadata !DIExpression()), !dbg !169
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !173
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !174, metadata !DIExpression()), !dbg !175
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !175
  %0 = load i8, i8* %value.addr, align 1, !dbg !176
  %conv = sext i8 %0 to i32, !dbg !176
  %1 = load i8, i8* %factor.addr, align 1, !dbg !177
  %conv1 = zext i8 %1 to i32, !dbg !177
  %mul = mul nsw i32 %conv, %conv1, !dbg !178
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !179
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !180
  %shr = ashr i32 %2, 8, !dbg !181
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !182
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !183
  %cmp = icmp slt i32 %3, 0, !dbg !185
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !186

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !187
  %and = and i32 %4, 255, !dbg !188
  %cmp3 = icmp ne i32 %and, 0, !dbg !189
  br i1 %cmp3, label %if.then, label %if.else, !dbg !190

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !191
  %add = add nsw i32 %5, 1, !dbg !193
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !194
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !195
  %conv5 = trunc i32 %6 to i8, !dbg !196
  store i8 %conv5, i8* %retval, align 1, !dbg !197
  br label %return, !dbg !197

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !198
  %conv6 = trunc i32 %7 to i8, !dbg !200
  store i8 %conv6, i8* %retval, align 1, !dbg !201
  br label %return, !dbg !201

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !202
  ret i8 %8, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !203 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !206, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !211
  %0 = load i8, i8* %value.addr, align 1, !dbg !212
  %conv = sext i8 %0 to i32, !dbg !212
  %1 = load i8, i8* %factor.addr, align 1, !dbg !213
  %conv1 = zext i8 %1 to i32, !dbg !213
  %mul = mul nsw i32 %conv, %conv1, !dbg !214
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !215
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !216
  %shr = ashr i32 %2, 7, !dbg !217
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !218
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !219
  %cmp = icmp slt i32 %3, 0, !dbg !221
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !222

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !223
  %and = and i32 %4, 127, !dbg !224
  %cmp3 = icmp ne i32 %and, 0, !dbg !225
  br i1 %cmp3, label %if.then, label %if.end, !dbg !226

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !227
  %add = add nsw i32 %5, 1, !dbg !229
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !230
  br label %if.end, !dbg !231

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !232
  %cmp5 = icmp slt i32 %6, 127, !dbg !234
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !235

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !236
  %cmp8 = icmp sgt i32 %7, -128, !dbg !239
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !240

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !241
  %conv11 = trunc i32 %8 to i8, !dbg !243
  store i8 %conv11, i8* %retval, align 1, !dbg !244
  br label %return, !dbg !244

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !245
  br label %return, !dbg !245

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !247
  br label %return, !dbg !247

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !249
  ret i8 %9, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !250 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !253, metadata !DIExpression()), !dbg !254
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 0, i32* %s32MulTemp, align 4, !dbg !260
  %0 = load i16, i16* %value.addr, align 2, !dbg !261
  %conv = sext i16 %0 to i32, !dbg !261
  %1 = load i16, i16* %factor.addr, align 2, !dbg !262
  %conv1 = sext i16 %1 to i32, !dbg !262
  %mul = mul nsw i32 %conv, %conv1, !dbg !263
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !264
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !265
  %3 = load i32, i32* %count.addr, align 4, !dbg !266
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !267
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !267
  %div = sdiv i32 %2, %3, !dbg !267, !klee.check.div !268
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !269
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !270
  %conv2 = trunc i32 %4 to i16, !dbg !270
  ret i16 %conv2, !dbg !271
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !272 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !273, metadata !DIExpression()), !dbg !274
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !277, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !279, metadata !DIExpression()), !dbg !280
  store i32 0, i32* %s32MulTemp, align 4, !dbg !280
  %0 = load i16, i16* %value.addr, align 2, !dbg !281
  %conv = sext i16 %0 to i32, !dbg !281
  %1 = load i16, i16* %factor.addr, align 2, !dbg !282
  %conv1 = sext i16 %1 to i32, !dbg !282
  %mul = mul nsw i32 %conv, %conv1, !dbg !283
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !284
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !285
  %3 = load i32, i32* %count.addr, align 4, !dbg !286
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !287
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !287
  %div = sdiv i32 %2, %3, !dbg !287, !klee.check.div !268
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !288
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !289
  %cmp = icmp slt i32 %4, 32767, !dbg !291
  br i1 %cmp, label %if.then, label %if.else7, !dbg !292

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !293
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !296
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !297

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !298
  %conv6 = trunc i32 %6 to i16, !dbg !300
  store i16 %conv6, i16* %retval, align 2, !dbg !301
  br label %return, !dbg !301

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !302
  br label %return, !dbg !302

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !304
  br label %return, !dbg !304

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !306
  ret i16 %7, !dbg !306
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !307 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !310, metadata !DIExpression()), !dbg !311
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !314, metadata !DIExpression()), !dbg !315
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !315
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !316, metadata !DIExpression()), !dbg !317
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !317
  %0 = load i16, i16* %value.addr, align 2, !dbg !318
  %conv = sext i16 %0 to i32, !dbg !318
  %1 = load i16, i16* %factor.addr, align 2, !dbg !319
  %conv1 = sext i16 %1 to i32, !dbg !319
  %mul = mul nsw i32 %conv, %conv1, !dbg !320
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !321
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !322
  %shr = ashr i32 %2, 15, !dbg !323
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !324
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !325
  %cmp = icmp slt i32 %3, 0, !dbg !327
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !328

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !329
  %and = and i32 %4, 32767, !dbg !330
  %cmp3 = icmp ne i32 %and, 0, !dbg !331
  br i1 %cmp3, label %if.then, label %if.end, !dbg !332

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !333
  %add = add nsw i32 %5, 1, !dbg !335
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !336
  br label %if.end, !dbg !337

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !338
  %cmp5 = icmp slt i32 %6, 32767, !dbg !340
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !341

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !342
  %conv8 = trunc i32 %7 to i16, !dbg !344
  store i16 %conv8, i16* %retval, align 2, !dbg !345
  br label %return, !dbg !345

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !346
  br label %return, !dbg !346

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !348
  ret i16 %8, !dbg !348
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !349 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !350, metadata !DIExpression()), !dbg !351
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !352, metadata !DIExpression()), !dbg !353
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !354, metadata !DIExpression()), !dbg !355
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !355
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !356, metadata !DIExpression()), !dbg !357
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !357
  %0 = load i16, i16* %value.addr, align 2, !dbg !358
  %conv = sext i16 %0 to i32, !dbg !358
  %1 = load i16, i16* %factor.addr, align 2, !dbg !359
  %conv1 = sext i16 %1 to i32, !dbg !359
  %mul = mul nsw i32 %conv, %conv1, !dbg !360
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !361
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !362
  %shr = ashr i32 %2, 14, !dbg !363
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !364
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !365
  %cmp = icmp slt i32 %3, 0, !dbg !367
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !368

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !369
  %and = and i32 %4, 16383, !dbg !370
  %cmp3 = icmp ne i32 %and, 0, !dbg !371
  br i1 %cmp3, label %if.then, label %if.end, !dbg !372

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !373
  %add = add nsw i32 %5, 1, !dbg !375
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !376
  br label %if.end, !dbg !377

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !378
  %cmp5 = icmp slt i32 %6, 32767, !dbg !380
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !381

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !382
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !385
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !386

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !387
  %conv11 = trunc i32 %8 to i16, !dbg !389
  store i16 %conv11, i16* %retval, align 2, !dbg !390
  br label %return, !dbg !390

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !391
  br label %return, !dbg !391

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !393
  br label %return, !dbg !393

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !395
  ret i16 %9, !dbg !395
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !396 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !399, metadata !DIExpression()), !dbg !400
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !401, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !403, metadata !DIExpression()), !dbg !404
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !404
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !405, metadata !DIExpression()), !dbg !406
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !406
  %0 = load i16, i16* %value.addr, align 2, !dbg !407
  %conv = sext i16 %0 to i32, !dbg !407
  %1 = load i16, i16* %factor.addr, align 2, !dbg !408
  %conv1 = zext i16 %1 to i32, !dbg !408
  %mul = mul nsw i32 %conv, %conv1, !dbg !409
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !410
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !411
  %shr = ashr i32 %2, 16, !dbg !412
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !413
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !414
  %cmp = icmp slt i32 %3, 0, !dbg !416
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !417

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !418
  %and = and i32 %4, 32767, !dbg !419
  %cmp3 = icmp ne i32 %and, 0, !dbg !420
  br i1 %cmp3, label %if.then, label %if.else, !dbg !421

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !422
  %add = add nsw i32 %5, 1, !dbg !424
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !425
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !426
  %conv5 = trunc i32 %6 to i16, !dbg !427
  store i16 %conv5, i16* %retval, align 2, !dbg !428
  br label %return, !dbg !428

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !429
  %conv6 = trunc i32 %7 to i16, !dbg !431
  store i16 %conv6, i16* %retval, align 2, !dbg !432
  br label %return, !dbg !432

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !433
  ret i16 %8, !dbg !433
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !434 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !435, metadata !DIExpression()), !dbg !436
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !437, metadata !DIExpression()), !dbg !438
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !439, metadata !DIExpression()), !dbg !440
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !440
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !441, metadata !DIExpression()), !dbg !442
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !442
  %0 = load i16, i16* %value.addr, align 2, !dbg !443
  %conv = sext i16 %0 to i32, !dbg !443
  %1 = load i16, i16* %factor.addr, align 2, !dbg !444
  %conv1 = zext i16 %1 to i32, !dbg !444
  %mul = mul nsw i32 %conv, %conv1, !dbg !445
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !446
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !447
  %shr = ashr i32 %2, 8, !dbg !448
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !449
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !450
  %cmp = icmp slt i32 %3, 0, !dbg !452
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !453

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !454
  %and = and i32 %4, 255, !dbg !455
  %cmp3 = icmp ne i32 %and, 0, !dbg !456
  br i1 %cmp3, label %if.then, label %if.end, !dbg !457

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !458
  %add = add nsw i32 %5, 1, !dbg !460
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !461
  br label %if.end, !dbg !462

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !463
  %cmp5 = icmp slt i32 %6, 32767, !dbg !465
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !466

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !467
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !470
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !471

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !472
  %conv11 = trunc i32 %8 to i16, !dbg !474
  store i16 %conv11, i16* %retval, align 2, !dbg !475
  br label %return, !dbg !475

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !476
  br label %return, !dbg !476

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !478
  br label %return, !dbg !478

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !480
  ret i16 %9, !dbg !480
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !481 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !484, metadata !DIExpression()), !dbg !485
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !488, metadata !DIExpression()), !dbg !489
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !489
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !490, metadata !DIExpression()), !dbg !491
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !491
  %0 = load i16, i16* %value.addr, align 2, !dbg !492
  %conv = sext i16 %0 to i32, !dbg !492
  %1 = load i8, i8* %factor.addr, align 1, !dbg !493
  %conv1 = zext i8 %1 to i32, !dbg !493
  %mul = mul nsw i32 %conv, %conv1, !dbg !494
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !495
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !496
  %shr = ashr i32 %2, 8, !dbg !497
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !498
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !499
  %cmp = icmp slt i32 %3, 0, !dbg !501
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !502

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !503
  %and = and i32 %4, 255, !dbg !504
  %cmp3 = icmp ne i32 %and, 0, !dbg !505
  br i1 %cmp3, label %if.then, label %if.else, !dbg !506

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !507
  %add = add nsw i32 %5, 1, !dbg !509
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !510
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !511
  %conv5 = trunc i32 %6 to i16, !dbg !511
  store i16 %conv5, i16* %retval, align 2, !dbg !512
  br label %return, !dbg !512

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !513
  %conv6 = trunc i32 %7 to i16, !dbg !513
  store i16 %conv6, i16* %retval, align 2, !dbg !515
  br label %return, !dbg !515

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !516
  ret i16 %8, !dbg !516
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !517 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !518, metadata !DIExpression()), !dbg !519
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !520, metadata !DIExpression()), !dbg !521
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !522, metadata !DIExpression()), !dbg !523
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !523
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !524, metadata !DIExpression()), !dbg !525
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !525
  %0 = load i16, i16* %value.addr, align 2, !dbg !526
  %conv = sext i16 %0 to i32, !dbg !526
  %1 = load i8, i8* %factor.addr, align 1, !dbg !527
  %conv1 = zext i8 %1 to i32, !dbg !527
  %mul = mul nsw i32 %conv, %conv1, !dbg !528
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !529
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !530
  %shr = ashr i32 %2, 7, !dbg !531
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !532
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !533
  %cmp = icmp slt i32 %3, 0, !dbg !535
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !536

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !537
  %and = and i32 %4, 127, !dbg !538
  %cmp3 = icmp ne i32 %and, 0, !dbg !539
  br i1 %cmp3, label %if.then, label %if.end, !dbg !540

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !541
  %add = add nsw i32 %5, 1, !dbg !543
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !544
  br label %if.end, !dbg !545

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !546
  %cmp5 = icmp slt i32 %6, 32767, !dbg !548
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !549

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !550
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !553
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !554

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !555
  %conv11 = trunc i32 %8 to i16, !dbg !557
  store i16 %conv11, i16* %retval, align 2, !dbg !558
  br label %return, !dbg !558

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !559
  br label %return, !dbg !559

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !561
  br label %return, !dbg !561

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !563
  ret i16 %9, !dbg !563
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !564 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !565, metadata !DIExpression()), !dbg !566
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !567, metadata !DIExpression()), !dbg !568
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !569, metadata !DIExpression()), !dbg !570
  store i32 0, i32* %s32MulTemp, align 4, !dbg !570
  %0 = load i16, i16* %value.addr, align 2, !dbg !571
  %conv = sext i16 %0 to i32, !dbg !571
  %1 = load i16, i16* %factor.addr, align 2, !dbg !572
  %conv1 = zext i16 %1 to i32, !dbg !572
  %mul = mul nsw i32 %conv, %conv1, !dbg !573
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !574
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !575
  %cmp = icmp slt i32 %2, 32767, !dbg !577
  br i1 %cmp, label %if.then, label %if.else7, !dbg !578

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !579
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !582
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !583

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !584
  %conv6 = trunc i32 %4 to i16, !dbg !586
  store i16 %conv6, i16* %retval, align 2, !dbg !587
  br label %return, !dbg !587

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !588
  br label %return, !dbg !588

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !590
  br label %return, !dbg !590

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !592
  ret i16 %5, !dbg !592
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !593 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !596, metadata !DIExpression()), !dbg !597
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !598, metadata !DIExpression()), !dbg !599
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !600, metadata !DIExpression()), !dbg !601
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !602, metadata !DIExpression()), !dbg !603
  store i32 0, i32* %s32MulTemp, align 4, !dbg !603
  %0 = load i16, i16* %value.addr, align 2, !dbg !604
  %conv = sext i16 %0 to i32, !dbg !604
  %1 = load i16, i16* %factor.addr, align 2, !dbg !605
  %conv1 = zext i16 %1 to i32, !dbg !605
  %mul = mul nsw i32 %conv, %conv1, !dbg !606
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !607
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !608
  %3 = load i32, i32* %count.addr, align 4, !dbg !609
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !610
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !610
  %div = sdiv i32 %2, %3, !dbg !610, !klee.check.div !268
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !611
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !612
  %conv2 = trunc i32 %4 to i16, !dbg !613
  ret i16 %conv2, !dbg !614
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !615 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !618, metadata !DIExpression()), !dbg !619
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !620, metadata !DIExpression()), !dbg !621
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !622, metadata !DIExpression()), !dbg !623
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !624, metadata !DIExpression()), !dbg !625
  store i32 0, i32* %s32MulTemp, align 4, !dbg !625
  %0 = load i16, i16* %value.addr, align 2, !dbg !626
  %conv = sext i16 %0 to i32, !dbg !626
  %1 = load i16, i16* %factor.addr, align 2, !dbg !627
  %conv1 = zext i16 %1 to i32, !dbg !627
  %mul = mul nsw i32 %conv, %conv1, !dbg !628
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !629
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !630
  %3 = load i16, i16* %count.addr, align 2, !dbg !631
  %conv2 = zext i16 %3 to i32, !dbg !631
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !632
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !632
  %div = sdiv i32 %2, %conv2, !dbg !632, !klee.check.div !268
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !633
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !634
  %cmp = icmp slt i32 %4, 32767, !dbg !636
  br i1 %cmp, label %if.then, label %if.else8, !dbg !637

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !638
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !641
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !642

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !643
  %conv7 = trunc i32 %6 to i16, !dbg !645
  store i16 %conv7, i16* %retval, align 2, !dbg !646
  br label %return, !dbg !646

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !647
  br label %return, !dbg !647

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !649
  br label %return, !dbg !649

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !651
  ret i16 %7, !dbg !651
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !652 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !653, metadata !DIExpression()), !dbg !654
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !655, metadata !DIExpression()), !dbg !656
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !657, metadata !DIExpression()), !dbg !658
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !658
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !659, metadata !DIExpression()), !dbg !660
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !660
  %0 = load i16, i16* %value.addr, align 2, !dbg !661
  %conv = sext i16 %0 to i32, !dbg !661
  %1 = load i16, i16* %factor.addr, align 2, !dbg !662
  %conv1 = zext i16 %1 to i32, !dbg !662
  %mul = mul nsw i32 %conv, %conv1, !dbg !663
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !664
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !665
  %shr = ashr i32 %2, 16, !dbg !666
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !667
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !668
  %cmp = icmp slt i32 %3, 0, !dbg !670
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !671

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !672
  %and = and i32 %4, 65535, !dbg !673
  %cmp3 = icmp ne i32 %and, 0, !dbg !674
  br i1 %cmp3, label %if.then, label %if.else, !dbg !675

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !676
  %add = add nsw i32 %5, 1, !dbg !678
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !679
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !680
  %conv5 = trunc i32 %6 to i16, !dbg !681
  store i16 %conv5, i16* %retval, align 2, !dbg !682
  br label %return, !dbg !682

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !683
  %conv6 = trunc i32 %7 to i16, !dbg !685
  store i16 %conv6, i16* %retval, align 2, !dbg !686
  br label %return, !dbg !686

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !687
  ret i16 %8, !dbg !687
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !688 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !689, metadata !DIExpression()), !dbg !690
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !691, metadata !DIExpression()), !dbg !692
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !693, metadata !DIExpression()), !dbg !694
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !694
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !695, metadata !DIExpression()), !dbg !696
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !696
  %0 = load i16, i16* %value.addr, align 2, !dbg !697
  %conv = sext i16 %0 to i32, !dbg !697
  %1 = load i16, i16* %factor.addr, align 2, !dbg !698
  %conv1 = zext i16 %1 to i32, !dbg !698
  %mul = mul nsw i32 %conv, %conv1, !dbg !699
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !700
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !701
  %shr = ashr i32 %2, 15, !dbg !702
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !703
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !704
  %cmp = icmp slt i32 %3, 0, !dbg !706
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !707

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !708
  %and = and i32 %4, 32767, !dbg !709
  %cmp3 = icmp ne i32 %and, 0, !dbg !710
  br i1 %cmp3, label %if.then, label %if.end, !dbg !711

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !712
  %add = add nsw i32 %5, 1, !dbg !714
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !715
  br label %if.end, !dbg !716

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !717
  %cmp5 = icmp slt i32 %6, 32767, !dbg !719
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !720

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !721
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !724
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !725

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !726
  %conv11 = trunc i32 %8 to i16, !dbg !728
  store i16 %conv11, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !730
  br label %return, !dbg !730

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !732
  br label %return, !dbg !732

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !734
  ret i16 %9, !dbg !734
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !735 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !738, metadata !DIExpression()), !dbg !739
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !740, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !742, metadata !DIExpression()), !dbg !744
  store i32 0, i32* %u32MulTemp, align 4, !dbg !744
  %0 = load i16, i16* %value.addr, align 2, !dbg !745
  %conv = zext i16 %0 to i32, !dbg !745
  %1 = load i16, i16* %factor.addr, align 2, !dbg !746
  %conv1 = zext i16 %1 to i32, !dbg !746
  %mul = mul nsw i32 %conv, %conv1, !dbg !747
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !748
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !749
  %shr = lshr i32 %2, 8, !dbg !750
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !751
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !752
  %cmp = icmp ult i32 %3, 32767, !dbg !754
  br i1 %cmp, label %if.then, label %if.else, !dbg !755

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !756
  %conv3 = trunc i32 %4 to i16, !dbg !758
  store i16 %conv3, i16* %retval, align 2, !dbg !759
  br label %return, !dbg !759

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !760
  br label %return, !dbg !760

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !762
  ret i16 %5, !dbg !762
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !763 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !766, metadata !DIExpression()), !dbg !767
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !768, metadata !DIExpression()), !dbg !769
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !770, metadata !DIExpression()), !dbg !771
  store i32 0, i32* %s32MulTemp, align 4, !dbg !771
  %0 = load i16, i16* %value.addr, align 2, !dbg !772
  %conv = sext i16 %0 to i32, !dbg !772
  %1 = load i16, i16* %factor.addr, align 2, !dbg !773
  %conv1 = zext i16 %1 to i32, !dbg !773
  %mul = mul nsw i32 %conv, %conv1, !dbg !774
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !775
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !776
  ret i32 %2, !dbg !777
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !778 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !781, metadata !DIExpression()), !dbg !782
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !783, metadata !DIExpression()), !dbg !784
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !785, metadata !DIExpression()), !dbg !786
  store i32 0, i32* %s32Temp1, align 4, !dbg !786
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !787, metadata !DIExpression()), !dbg !788
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !788
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !789, metadata !DIExpression()), !dbg !790
  store i32 0, i32* %s32Factor, align 4, !dbg !790
  %0 = load i16, i16* %factor.addr, align 2, !dbg !791
  %conv = zext i16 %0 to i32, !dbg !791
  store i32 %conv, i32* %s32Factor, align 4, !dbg !792
  %1 = load i16, i16* %factor.addr, align 2, !dbg !793
  %conv1 = zext i16 %1 to i32, !dbg !793
  %cmp = icmp ne i32 %conv1, 0, !dbg !795
  br i1 %cmp, label %if.then, label %if.else19, !dbg !796

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !797
  %cmp3 = icmp slt i32 %2, 0, !dbg !800
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !801

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !802
  %4 = load i32, i32* %s32Factor, align 4, !dbg !804
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !805
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !805
  %div = sdiv i32 %3, %4, !dbg !805, !klee.check.div !268
  store i32 %div, i32* %s32Temp1, align 4, !dbg !806
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !807
  %6 = load i32, i32* %value.addr, align 4, !dbg !809
  %cmp6 = icmp sge i32 %5, %6, !dbg !810
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !811

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !812
  br label %return, !dbg !812

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !814
  %8 = load i16, i16* %factor.addr, align 2, !dbg !816
  %conv9 = zext i16 %8 to i32, !dbg !816
  %mul = mul nsw i32 %7, %conv9, !dbg !817
  store i32 %mul, i32* %retval, align 4, !dbg !818
  br label %return, !dbg !818

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !819
  %conv11 = zext i16 %9 to i32, !dbg !819
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !822
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !822
  %div12 = udiv i32 2147483647, %conv11, !dbg !822, !klee.check.div !268
  %10 = load i32, i32* %value.addr, align 4, !dbg !823
  %cmp13 = icmp ule i32 %div12, %10, !dbg !824
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !825

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !826
  br label %return, !dbg !826

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !828
  %12 = load i16, i16* %factor.addr, align 2, !dbg !830
  %conv17 = zext i16 %12 to i32, !dbg !830
  %mul18 = mul nsw i32 %11, %conv17, !dbg !831
  store i32 %mul18, i32* %retval, align 4, !dbg !832
  br label %return, !dbg !832

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !833
  br label %return, !dbg !833

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !835
  ret i32 %13, !dbg !835
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !836 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !839, metadata !DIExpression()), !dbg !840
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !841, metadata !DIExpression()), !dbg !842
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !843, metadata !DIExpression()), !dbg !844
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !845, metadata !DIExpression()), !dbg !846
  store i16 0, i16* %u16MulTemp, align 2, !dbg !846
  %0 = load i8, i8* %value.addr, align 1, !dbg !847
  %conv = zext i8 %0 to i32, !dbg !847
  %1 = load i8, i8* %factor.addr, align 1, !dbg !848
  %conv1 = zext i8 %1 to i32, !dbg !848
  %mul = mul nsw i32 %conv, %conv1, !dbg !849
  %conv2 = trunc i32 %mul to i16, !dbg !847
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !850
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !851
  %conv3 = zext i16 %2 to i32, !dbg !851
  %3 = load i16, i16* %count.addr, align 2, !dbg !852
  %conv4 = zext i16 %3 to i32, !dbg !852
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !853
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !853
  %div = sdiv i32 %conv3, %conv4, !dbg !853, !klee.check.div !268
  %conv5 = trunc i32 %div to i16, !dbg !851
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !854
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !855
  %conv6 = trunc i16 %4 to i8, !dbg !856
  ret i8 %conv6, !dbg !857
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !858 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !861, metadata !DIExpression()), !dbg !862
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !863, metadata !DIExpression()), !dbg !864
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !865, metadata !DIExpression()), !dbg !866
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !867, metadata !DIExpression()), !dbg !868
  store i16 0, i16* %u16MulTemp, align 2, !dbg !868
  %0 = load i8, i8* %value.addr, align 1, !dbg !869
  %conv = zext i8 %0 to i32, !dbg !869
  %1 = load i8, i8* %factor.addr, align 1, !dbg !870
  %conv1 = zext i8 %1 to i32, !dbg !870
  %mul = mul nsw i32 %conv, %conv1, !dbg !871
  %conv2 = trunc i32 %mul to i16, !dbg !869
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !872
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !873
  %conv3 = zext i16 %2 to i32, !dbg !873
  %3 = load i8, i8* %count.addr, align 1, !dbg !874
  %conv4 = zext i8 %3 to i32, !dbg !874
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !875
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !875
  %div = sdiv i32 %conv3, %conv4, !dbg !875, !klee.check.div !268
  %conv5 = trunc i32 %div to i16, !dbg !873
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !876
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !877
  %conv6 = zext i16 %4 to i32, !dbg !877
  %cmp = icmp sle i32 %conv6, 255, !dbg !879
  br i1 %cmp, label %if.then, label %if.else, !dbg !880

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !881
  %conv8 = zext i16 %5 to i32, !dbg !881
  %and = and i32 %conv8, 255, !dbg !883
  %conv9 = trunc i32 %and to i8, !dbg !881
  store i8 %conv9, i8* %retval, align 1, !dbg !884
  br label %return, !dbg !884

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !885
  br label %return, !dbg !885

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !887
  ret i8 %6, !dbg !887
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !888 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !891, metadata !DIExpression()), !dbg !892
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !893, metadata !DIExpression()), !dbg !894
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !895, metadata !DIExpression()), !dbg !896
  store i16 0, i16* %u16MulTemp, align 2, !dbg !896
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !897
  %conv = zext i8 %0 to i32, !dbg !897
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !898
  %conv1 = zext i8 %1 to i32, !dbg !898
  %mul = mul nsw i32 %conv, %conv1, !dbg !899
  %conv2 = trunc i32 %mul to i16, !dbg !897
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !900
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !901
  %conv3 = zext i16 %2 to i32, !dbg !901
  %shr = ashr i32 %conv3, 8, !dbg !902
  %conv4 = trunc i32 %shr to i16, !dbg !901
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !903
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !904
  %conv5 = trunc i16 %3 to i8, !dbg !905
  ret i8 %conv5, !dbg !906
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !907 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !908, metadata !DIExpression()), !dbg !909
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !910, metadata !DIExpression()), !dbg !911
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !912, metadata !DIExpression()), !dbg !913
  store i16 0, i16* %u16MulTemp, align 2, !dbg !913
  %0 = load i8, i8* %value.addr, align 1, !dbg !914
  %conv = zext i8 %0 to i32, !dbg !914
  %1 = load i8, i8* %factor.addr, align 1, !dbg !915
  %conv1 = zext i8 %1 to i32, !dbg !915
  %mul = mul nsw i32 %conv, %conv1, !dbg !916
  %conv2 = trunc i32 %mul to i16, !dbg !914
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !917
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !918
  %conv3 = zext i16 %2 to i32, !dbg !918
  %shr = ashr i32 %conv3, 7, !dbg !919
  %conv4 = trunc i32 %shr to i16, !dbg !918
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !920
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !921
  %conv5 = zext i16 %3 to i32, !dbg !921
  %cmp = icmp slt i32 %conv5, 255, !dbg !923
  br i1 %cmp, label %if.then, label %if.else, !dbg !924

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !925
  %conv7 = trunc i16 %4 to i8, !dbg !927
  store i8 %conv7, i8* %retval, align 1, !dbg !928
  br label %return, !dbg !928

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !929
  br label %return, !dbg !929

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !931
  ret i8 %5, !dbg !931
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !932 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !935, metadata !DIExpression()), !dbg !936
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !937, metadata !DIExpression()), !dbg !938
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !939, metadata !DIExpression()), !dbg !940
  store i32 0, i32* %u32MulTemp, align 4, !dbg !940
  %0 = load i16, i16* %value.addr, align 2, !dbg !941
  %conv = zext i16 %0 to i32, !dbg !941
  %1 = load i16, i16* %factor.addr, align 2, !dbg !942
  %conv1 = zext i16 %1 to i32, !dbg !942
  %mul = mul nsw i32 %conv, %conv1, !dbg !943
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !944
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !945
  %shr = lshr i32 %2, 16, !dbg !946
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !947
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !948
  %conv2 = trunc i32 %3 to i16, !dbg !949
  ret i16 %conv2, !dbg !950
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !951 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !952, metadata !DIExpression()), !dbg !953
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !954, metadata !DIExpression()), !dbg !955
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !956, metadata !DIExpression()), !dbg !957
  store i32 0, i32* %u32MulTemp, align 4, !dbg !957
  %0 = load i16, i16* %value.addr, align 2, !dbg !958
  %conv = zext i16 %0 to i32, !dbg !958
  %1 = load i16, i16* %factor.addr, align 2, !dbg !959
  %conv1 = zext i16 %1 to i32, !dbg !959
  %mul = mul nsw i32 %conv, %conv1, !dbg !960
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !961
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !962
  %shr = lshr i32 %2, 8, !dbg !963
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !964
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !965
  %cmp = icmp ult i32 %3, 65535, !dbg !967
  br i1 %cmp, label %if.then, label %if.else, !dbg !968

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !969
  %and = and i32 %4, 65535, !dbg !971
  %conv3 = trunc i32 %and to i16, !dbg !972
  store i16 %conv3, i16* %retval, align 2, !dbg !973
  br label %return, !dbg !973

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !974
  br label %return, !dbg !974

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !976
  ret i16 %5, !dbg !976
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !977 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !980, metadata !DIExpression()), !dbg !981
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !982, metadata !DIExpression()), !dbg !983
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !984, metadata !DIExpression()), !dbg !985
  store i32 0, i32* %u32MulTemp, align 4, !dbg !985
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !986
  %conv = zext i16 %0 to i32, !dbg !986
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !987
  %conv1 = zext i8 %1 to i32, !dbg !987
  %mul = mul nsw i32 %conv, %conv1, !dbg !988
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !989
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !990
  %shr = lshr i32 %2, 8, !dbg !991
  %and = and i32 %shr, 65535, !dbg !992
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !993
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !994
  %conv2 = trunc i32 %3 to i16, !dbg !994
  ret i16 %conv2, !dbg !995
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !996 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !997, metadata !DIExpression()), !dbg !998
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !999, metadata !DIExpression()), !dbg !1000
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1001, metadata !DIExpression()), !dbg !1002
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1002
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1003
  %conv = zext i16 %0 to i32, !dbg !1003
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1004
  %conv1 = zext i8 %1 to i32, !dbg !1004
  %mul = mul nsw i32 %conv, %conv1, !dbg !1005
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1006
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1007
  %shr = lshr i32 %2, 7, !dbg !1008
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1009
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1010
  %cmp = icmp ult i32 %3, 65535, !dbg !1012
  br i1 %cmp, label %if.then, label %if.else, !dbg !1013

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1014
  %and = and i32 %4, 65535, !dbg !1016
  %conv3 = trunc i32 %and to i16, !dbg !1017
  store i16 %conv3, i16* %retval, align 2, !dbg !1018
  br label %return, !dbg !1018

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1019
  br label %return, !dbg !1019

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1021
  ret i16 %5, !dbg !1021
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1022 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1025, metadata !DIExpression()), !dbg !1026
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1027, metadata !DIExpression()), !dbg !1028
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1029, metadata !DIExpression()), !dbg !1030
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1031, metadata !DIExpression()), !dbg !1032
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1032
  %0 = load i16, i16* %value.addr, align 2, !dbg !1033
  %conv = zext i16 %0 to i32, !dbg !1033
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1034
  %conv1 = zext i16 %1 to i32, !dbg !1034
  %mul = mul nsw i32 %conv, %conv1, !dbg !1035
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1036
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1037
  %3 = load i32, i32* %count.addr, align 4, !dbg !1038
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1039
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1039
  %div = udiv i32 %2, %3, !dbg !1039, !klee.check.div !268
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1040
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1041
  %and = and i32 %4, 65535, !dbg !1042
  %conv2 = trunc i32 %and to i16, !dbg !1043
  ret i16 %conv2, !dbg !1044
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1045 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1048, metadata !DIExpression()), !dbg !1049
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1050, metadata !DIExpression()), !dbg !1051
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1052, metadata !DIExpression()), !dbg !1053
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1054, metadata !DIExpression()), !dbg !1055
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1055
  %0 = load i16, i16* %value.addr, align 2, !dbg !1056
  %conv = zext i16 %0 to i32, !dbg !1056
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1057
  %conv1 = zext i16 %1 to i32, !dbg !1057
  %mul = mul nsw i32 %conv, %conv1, !dbg !1058
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1059
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1060
  %3 = load i16, i16* %count.addr, align 2, !dbg !1061
  %conv2 = zext i16 %3 to i32, !dbg !1061
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1062
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1062
  %div = udiv i32 %2, %conv2, !dbg !1062, !klee.check.div !268
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1063
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1064
  %cmp = icmp ule i32 %4, 65535, !dbg !1066
  br i1 %cmp, label %if.then, label %if.else, !dbg !1067

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1068
  %and = and i32 %5, 65535, !dbg !1070
  %conv4 = trunc i32 %and to i16, !dbg !1071
  store i16 %conv4, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1075
  ret i16 %6, !dbg !1075
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1076 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1079, metadata !DIExpression()), !dbg !1080
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1081, metadata !DIExpression()), !dbg !1082
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1082
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1083
  %conv = zext i16 %0 to i32, !dbg !1083
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1084
  %conv1 = zext i16 %1 to i32, !dbg !1084
  %mul = mul nsw i32 %conv, %conv1, !dbg !1085
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1086
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1087
  %shr = lshr i32 %2, 16, !dbg !1088
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1089
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1090
  %and = and i32 65535, %3, !dbg !1091
  %conv2 = trunc i32 %and to i16, !dbg !1092
  ret i16 %conv2, !dbg !1093
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1094 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1095, metadata !DIExpression()), !dbg !1096
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1097, metadata !DIExpression()), !dbg !1098
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1099, metadata !DIExpression()), !dbg !1100
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1100
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1101
  %conv = zext i16 %0 to i32, !dbg !1101
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1102
  %conv1 = zext i16 %1 to i32, !dbg !1102
  %mul = mul nsw i32 %conv, %conv1, !dbg !1103
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1104
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1105
  %shr = lshr i32 %2, 15, !dbg !1106
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1107
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1108
  %cmp = icmp ule i32 %3, 65535, !dbg !1110
  br i1 %cmp, label %if.then, label %if.else, !dbg !1111

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1112
  %and = and i32 %4, 65535, !dbg !1114
  %conv3 = trunc i32 %and to i16, !dbg !1115
  store i16 %conv3, i16* %retval, align 2, !dbg !1116
  br label %return, !dbg !1116

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1117
  br label %return, !dbg !1117

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1119
  ret i16 %5, !dbg !1119
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1120 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1127, metadata !DIExpression()), !dbg !1128
  store i32 0, i32* %u32Temp1, align 4, !dbg !1128
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1129
  %conv = zext i16 %0 to i32, !dbg !1129
  %cmp = icmp sgt i32 %conv, 0, !dbg !1131
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1132

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1133
  %conv2 = zext i16 %1 to i32, !dbg !1133
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1135
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1135
  %div = udiv i32 -1, %conv2, !dbg !1135, !klee.check.div !268
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1136
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1137
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1139
  %cmp3 = icmp ult i32 %2, %3, !dbg !1140
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1141

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1142
  br label %return, !dbg !1142

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1144
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1146
  %conv6 = zext i16 %5 to i32, !dbg !1146
  %mul = mul i32 %4, %conv6, !dbg !1147
  store i32 %mul, i32* %retval, align 4, !dbg !1148
  br label %return, !dbg !1148

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1149
  br label %return, !dbg !1149

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1151
  ret i32 %6, !dbg !1151
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1152 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1155, metadata !DIExpression()), !dbg !1156
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1157, metadata !DIExpression()), !dbg !1158
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1159, metadata !DIExpression()), !dbg !1160
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1161, metadata !DIExpression()), !dbg !1162
  store i32 0, i32* %u32Temp1, align 4, !dbg !1162
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1163, metadata !DIExpression()), !dbg !1164
  store i32 0, i32* %u32Temp2, align 4, !dbg !1164
  %0 = load i32, i32* %value.addr, align 4, !dbg !1165
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1166
  %conv = zext i16 %1 to i32, !dbg !1166
  %mul = mul i32 %0, %conv, !dbg !1167
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1168
  %2 = load i32, i32* %value.addr, align 4, !dbg !1169
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1170
  %conv1 = zext i16 %3 to i32, !dbg !1170
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1171
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1172
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1173
  %5 = load i32, i32* %count.addr, align 4, !dbg !1174
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1175
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1175
  %shr = lshr i32 %4, %5, !dbg !1175, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1176
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1177
  %7 = load i32, i32* %count.addr, align 4, !dbg !1178
  %sub = sub i32 32, %7, !dbg !1179
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1180
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1180
  %shl = shl i32 %6, %sub, !dbg !1180, !klee.check.shift !268
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1181
  %or = or i32 %8, %shl, !dbg !1181
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1181
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1182
  %10 = load i32, i32* %count.addr, align 4, !dbg !1184
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1185
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1185
  %shr2 = lshr i32 %9, %10, !dbg !1185, !klee.check.shift !268
  %cmp = icmp eq i32 %shr2, 0, !dbg !1186
  br i1 %cmp, label %if.then, label %if.else, !dbg !1187

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1188
  store i32 %11, i32* %retval, align 4, !dbg !1190
  br label %return, !dbg !1190

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1191
  br label %return, !dbg !1191

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1193
  ret i32 %12, !dbg !1193
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1194 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1199, metadata !DIExpression()), !dbg !1200
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1201, metadata !DIExpression()), !dbg !1202
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1203, metadata !DIExpression()), !dbg !1204
  store i16 0, i16* %s16Temp1, align 2, !dbg !1204
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1205
  %conv = zext i8 %0 to i32, !dbg !1205
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1206
  %conv1 = zext i8 %1 to i32, !dbg !1206
  %sub = sub nsw i32 %conv, %conv1, !dbg !1207
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1208
  %conv2 = sext i8 %2 to i32, !dbg !1208
  %mul = mul nsw i32 %sub, %conv2, !dbg !1209
  %div = sdiv i32 %mul, 32, !dbg !1210
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1211
  %conv3 = zext i8 %3 to i32, !dbg !1211
  %add = add nsw i32 %div, %conv3, !dbg !1212
  %conv4 = trunc i32 %add to i16, !dbg !1213
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1214
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1215
  %conv5 = sext i16 %4 to i32, !dbg !1215
  %cmp = icmp slt i32 %conv5, 255, !dbg !1217
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1218

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1219
  %conv7 = sext i16 %5 to i32, !dbg !1219
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1222
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1223

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1224
  %conv11 = trunc i16 %6 to i8, !dbg !1226
  store i8 %conv11, i8* %retval, align 1, !dbg !1227
  br label %return, !dbg !1227

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1228
  br label %return, !dbg !1228

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1230
  br label %return, !dbg !1230

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1232
  ret i8 %7, !dbg !1232
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1233 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1236, metadata !DIExpression()), !dbg !1237
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1238, metadata !DIExpression()), !dbg !1239
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1240, metadata !DIExpression()), !dbg !1241
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1242, metadata !DIExpression()), !dbg !1243
  store i32 0, i32* %s32Temp1, align 4, !dbg !1243
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1244
  %conv = zext i16 %0 to i32, !dbg !1244
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1245
  %conv1 = zext i16 %1 to i32, !dbg !1245
  %sub = sub nsw i32 %conv, %conv1, !dbg !1246
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1247
  %conv2 = sext i8 %2 to i32, !dbg !1247
  %mul = mul nsw i32 %sub, %conv2, !dbg !1248
  %div = sdiv i32 %mul, 32, !dbg !1249
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1250
  %conv3 = zext i16 %3 to i32, !dbg !1250
  %add = add nsw i32 %div, %conv3, !dbg !1251
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1252
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1253
  %cmp = icmp slt i32 %4, 65535, !dbg !1255
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1256

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1257
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1260
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1261

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1262
  %conv8 = trunc i32 %6 to i16, !dbg !1264
  store i16 %conv8, i16* %retval, align 2, !dbg !1265
  br label %return, !dbg !1265

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1266
  br label %return, !dbg !1266

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1268
  br label %return, !dbg !1268

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1270
  ret i16 %7, !dbg !1270
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1271 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1272, metadata !DIExpression()), !dbg !1273
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1274, metadata !DIExpression()), !dbg !1275
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1276, metadata !DIExpression()), !dbg !1277
  store i32 0, i32* %u32Temp1, align 4, !dbg !1277
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1278
  %conv = zext i16 %0 to i32, !dbg !1278
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1279
  %conv1 = zext i16 %1 to i32, !dbg !1279
  %mul = mul nsw i32 %conv, %conv1, !dbg !1280
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1281
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1282
  %cmp = icmp ule i32 %2, 65535, !dbg !1284
  br i1 %cmp, label %if.then, label %if.else, !dbg !1285

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1286
  %and = and i32 %3, 65535, !dbg !1288
  %conv3 = trunc i32 %and to i16, !dbg !1289
  store i16 %conv3, i16* %retval, align 2, !dbg !1290
  br label %return, !dbg !1290

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1291
  br label %return, !dbg !1291

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1293
  ret i16 %4, !dbg !1293
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1294 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1297, metadata !DIExpression()), !dbg !1298
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1299, metadata !DIExpression()), !dbg !1300
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1301, metadata !DIExpression()), !dbg !1302
  store i32 0, i32* %u32Temp1, align 4, !dbg !1302
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1303
  %conv = zext i16 %0 to i32, !dbg !1303
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1304
  %conv1 = zext i16 %1 to i32, !dbg !1304
  %mul = mul nsw i32 %conv, %conv1, !dbg !1305
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1306
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1307
  ret i32 %2, !dbg !1308
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1309 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1312, metadata !DIExpression()), !dbg !1313
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1314, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1316, metadata !DIExpression()), !dbg !1317
  store i32 0, i32* %s32Temp1, align 4, !dbg !1317
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1318
  %conv = sext i16 %0 to i32, !dbg !1318
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1319
  %conv1 = sext i16 %1 to i32, !dbg !1319
  %mul = mul nsw i32 %conv, %conv1, !dbg !1320
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1321
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1322
  ret i32 %2, !dbg !1323
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1324 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1327, metadata !DIExpression()), !dbg !1328
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1329, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1331, metadata !DIExpression()), !dbg !1332
  store i32 0, i32* %s32Temp1, align 4, !dbg !1332
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1333
  %cmp = icmp sgt i32 %0, 0, !dbg !1335
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1336

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1337
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1339
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1339
  %div = udiv i32 -1, %1, !dbg !1339, !klee.check.div !268
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1340
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1341
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1343
  %cmp1 = icmp ult i32 %2, %3, !dbg !1344
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1345

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1346
  br label %return, !dbg !1346

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1348
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1350
  %mul = mul i32 %4, %5, !dbg !1351
  store i32 %mul, i32* %retval, align 4, !dbg !1352
  br label %return, !dbg !1352

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1353
  br label %return, !dbg !1353

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1355
  ret i32 %6, !dbg !1355
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1356 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1359, metadata !DIExpression()), !dbg !1360
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1361, metadata !DIExpression()), !dbg !1362
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1363, metadata !DIExpression()), !dbg !1364
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1365, metadata !DIExpression()), !dbg !1366
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1367, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1369, metadata !DIExpression()), !dbg !1370
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1371
  %cmp = icmp slt i32 %0, 0, !dbg !1373
  br i1 %cmp, label %if.then, label %if.else, !dbg !1374

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1375
  %sub = sub nsw i32 0, %1, !dbg !1376
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1377
  br label %if.end, !dbg !1378

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1379
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1380
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1381
  %cmp1 = icmp slt i32 %3, 0, !dbg !1383
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1384

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1385
  %sub3 = sub nsw i32 0, %4, !dbg !1386
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1387
  br label %if.end5, !dbg !1388

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1389
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1390
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1391
  %cmp6 = icmp slt i32 %6, 0, !dbg !1393
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1394
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1394

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1395
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1396
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1397
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1397

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1398
  br label %if.end13, !dbg !1399

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1400
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1401
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1402
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1403
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1404
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1405
  %conv = zext i8 %12 to i32, !dbg !1405
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1407
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1408

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1409
  br label %return, !dbg !1409

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1411
  store i32 %13, i32* %retval, align 4, !dbg !1413
  br label %return, !dbg !1413

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1414
  ret i32 %14, !dbg !1414
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1415 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1418, metadata !DIExpression()), !dbg !1419
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1420, metadata !DIExpression()), !dbg !1421
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1422, metadata !DIExpression()), !dbg !1423
  store i32 0, i32* %u32Temp1, align 4, !dbg !1423
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1424
  %cmp = icmp ne i32 %0, 0, !dbg !1426
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1427

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1428
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1430
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1430
  %div = udiv i32 -1, %1, !dbg !1430, !klee.check.div !268
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1431
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1432
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1434
  %cmp1 = icmp ult i32 %2, %3, !dbg !1435
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1436

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1437
  br label %return, !dbg !1437

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1439
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1441
  %mul = mul i32 %4, %5, !dbg !1442
  store i32 %mul, i32* %retval, align 4, !dbg !1443
  br label %return, !dbg !1443

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1444
  br label %return, !dbg !1444

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1446
  ret i32 %6, !dbg !1446
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1447 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1448, metadata !DIExpression()), !dbg !1449
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1450, metadata !DIExpression()), !dbg !1451
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1452, metadata !DIExpression()), !dbg !1453
  store i32 0, i32* %u32Temp1, align 4, !dbg !1453
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1454, metadata !DIExpression()), !dbg !1455
  store i32 0, i32* %u32Temp2, align 4, !dbg !1455
  %0 = load i32, i32* %value.addr, align 4, !dbg !1456
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1457
  %conv = zext i16 %1 to i32, !dbg !1457
  %mul = mul i32 %0, %conv, !dbg !1458
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1459
  %2 = load i32, i32* %value.addr, align 4, !dbg !1460
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1461
  %conv1 = zext i16 %3 to i32, !dbg !1461
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1462
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1463
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1464
  %shr = lshr i32 %4, 16, !dbg !1465
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1466
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1467
  %shl = shl i32 %5, 16, !dbg !1468
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1469
  %or = or i32 %6, %shl, !dbg !1469
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1469
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1470
  ret i32 %7, !dbg !1471
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1472 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1473, metadata !DIExpression()), !dbg !1474
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1475, metadata !DIExpression()), !dbg !1476
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1477, metadata !DIExpression()), !dbg !1478
  store i32 0, i32* %u32Temp1, align 4, !dbg !1478
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1479, metadata !DIExpression()), !dbg !1480
  store i32 0, i32* %u32Temp2, align 4, !dbg !1480
  %0 = load i32, i32* %value.addr, align 4, !dbg !1481
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1482
  %conv = zext i16 %1 to i32, !dbg !1482
  %mul = mul i32 %0, %conv, !dbg !1483
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1484
  %2 = load i32, i32* %value.addr, align 4, !dbg !1485
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1486
  %conv1 = zext i16 %3 to i32, !dbg !1486
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1487
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1488
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1489
  %shr = lshr i32 %4, 15, !dbg !1490
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1491
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1492
  %shl = shl i32 %5, 17, !dbg !1493
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1494
  %or = or i32 %6, %shl, !dbg !1494
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1494
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1495
  %shr2 = lshr i32 %7, 15, !dbg !1497
  %cmp = icmp eq i32 %shr2, 0, !dbg !1498
  br i1 %cmp, label %if.then, label %if.else, !dbg !1499

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1500
  store i32 %8, i32* %retval, align 4, !dbg !1502
  br label %return, !dbg !1502

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1503
  br label %return, !dbg !1503

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1505
  ret i32 %9, !dbg !1505
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1506 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1509, metadata !DIExpression()), !dbg !1510
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1511, metadata !DIExpression()), !dbg !1512
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1513, metadata !DIExpression()), !dbg !1514
  store i32 0, i32* %u32Temp1, align 4, !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 0, i32* %u32Temp2, align 4, !dbg !1516
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1517
  %conv = sext i16 %0 to i32, !dbg !1517
  %cmp = icmp sgt i32 %conv, 0, !dbg !1519
  br i1 %cmp, label %if.then, label %if.else, !dbg !1520

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1521
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1523
  %conv2 = sext i16 %2 to i32, !dbg !1523
  %mul = mul i32 %1, %conv2, !dbg !1524
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1525
  %3 = load i32, i32* %value.addr, align 4, !dbg !1526
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1527
  %conv3 = sext i16 %4 to i32, !dbg !1527
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1528
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1529
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1530
  %shr = lshr i32 %5, 15, !dbg !1531
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1532
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1533
  %shl = shl i32 %6, 17, !dbg !1534
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1535
  %or = or i32 %7, %shl, !dbg !1535
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1535
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1536
  store i32 %8, i32* %retval, align 4, !dbg !1537
  br label %return, !dbg !1537

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1538
  br label %return, !dbg !1538

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1540
  ret i32 %9, !dbg !1540
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1541 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1542, metadata !DIExpression()), !dbg !1543
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1544, metadata !DIExpression()), !dbg !1545
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1546, metadata !DIExpression()), !dbg !1547
  store i32 0, i32* %u32Temp1, align 4, !dbg !1547
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1548, metadata !DIExpression()), !dbg !1549
  store i32 0, i32* %u32Temp2, align 4, !dbg !1549
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1550
  %conv = sext i16 %0 to i32, !dbg !1550
  %cmp = icmp sle i32 %conv, 0, !dbg !1552
  br i1 %cmp, label %if.then, label %if.else, !dbg !1553

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1554
  br label %return, !dbg !1554

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1556
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1558
  %conv2 = sext i16 %2 to i32, !dbg !1558
  %mul = mul i32 %1, %conv2, !dbg !1559
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1560
  %3 = load i32, i32* %value.addr, align 4, !dbg !1561
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1562
  %conv3 = sext i16 %4 to i32, !dbg !1562
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1563
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1564
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1565
  %shr = lshr i32 %5, 14, !dbg !1566
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1567
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1568
  %shl = shl i32 %6, 18, !dbg !1569
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1570
  %or = or i32 %7, %shl, !dbg !1570
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1570
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1571
  %shr4 = lshr i32 %8, 14, !dbg !1573
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1574
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1575

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1576
  store i32 %9, i32* %retval, align 4, !dbg !1578
  br label %return, !dbg !1578

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1579
  br label %return, !dbg !1579

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1581
  ret i32 %10, !dbg !1581
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1582 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1583, metadata !DIExpression()), !dbg !1584
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1585, metadata !DIExpression()), !dbg !1586
  %0 = load i32, i32* %value.addr, align 4, !dbg !1587
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1588
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1589
  ret i32 %call, !dbg !1590
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1591 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1594, metadata !DIExpression()), !dbg !1595
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1596, metadata !DIExpression()), !dbg !1597
  store i32 0, i32* %u32Temp1, align 4, !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %u32Temp2, align 4, !dbg !1599
  %0 = load i32, i32* %value.addr, align 4, !dbg !1600
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1601
  %mul = mul i32 %0, %1, !dbg !1602
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1603
  %2 = load i32, i32* %value.addr, align 4, !dbg !1604
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1605
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1606
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1607
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1608
  %shr = lshr i32 %4, 31, !dbg !1609
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1610
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1611
  %shl = shl i32 %5, 1, !dbg !1612
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1613
  %or = or i32 %6, %shl, !dbg !1613
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1613
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1614
  %shr1 = lshr i32 %7, 31, !dbg !1616
  %cmp = icmp eq i32 %shr1, 0, !dbg !1617
  br i1 %cmp, label %if.then, label %if.else, !dbg !1618

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1619
  store i32 %8, i32* %retval, align 4, !dbg !1621
  br label %return, !dbg !1621

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1622
  br label %return, !dbg !1622

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1624
  ret i32 %9, !dbg !1624
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1625 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1626, metadata !DIExpression()), !dbg !1627
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1628, metadata !DIExpression()), !dbg !1629
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1630, metadata !DIExpression()), !dbg !1631
  store i32 0, i32* %u32Temp1, align 4, !dbg !1631
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1632, metadata !DIExpression()), !dbg !1633
  store i32 0, i32* %u32Temp2, align 4, !dbg !1633
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1634
  %cmp = icmp sgt i32 %0, 0, !dbg !1636
  br i1 %cmp, label %if.then, label %if.else, !dbg !1637

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1638
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1640
  %mul = mul i32 %1, %2, !dbg !1641
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1642
  %3 = load i32, i32* %value.addr, align 4, !dbg !1643
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1644
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1645
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1646
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1647
  %shr = lshr i32 %5, 31, !dbg !1648
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1649
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1650
  %shl = shl i32 %6, 1, !dbg !1651
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1652
  %or = or i32 %7, %shl, !dbg !1652
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1652
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1653
  store i32 %8, i32* %retval, align 4, !dbg !1654
  br label %return, !dbg !1654

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1655
  br label %return, !dbg !1655

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1657
  ret i32 %9, !dbg !1657
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1658 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1659, metadata !DIExpression()), !dbg !1660
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1661, metadata !DIExpression()), !dbg !1662
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1663, metadata !DIExpression()), !dbg !1664
  store i32 0, i32* %u32Temp1, align 4, !dbg !1664
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1665, metadata !DIExpression()), !dbg !1666
  store i32 0, i32* %u32Temp2, align 4, !dbg !1666
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1667
  %cmp = icmp sle i32 %0, 0, !dbg !1669
  br i1 %cmp, label %if.then, label %if.else, !dbg !1670

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1671
  br label %return, !dbg !1671

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1673
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1675
  %mul = mul i32 %1, %2, !dbg !1676
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1677
  %3 = load i32, i32* %value.addr, align 4, !dbg !1678
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1679
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1680
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1681
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1682
  %shr = lshr i32 %5, 30, !dbg !1683
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1684
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1685
  %shl = shl i32 %6, 2, !dbg !1686
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1687
  %or = or i32 %7, %shl, !dbg !1687
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1687
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1688
  %shr1 = lshr i32 %8, 30, !dbg !1690
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1691
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1692

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1693
  store i32 %9, i32* %retval, align 4, !dbg !1695
  br label %return, !dbg !1695

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1696
  br label %return, !dbg !1696

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1698
  ret i32 %10, !dbg !1698
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1699 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1702, metadata !DIExpression()), !dbg !1703
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1704, metadata !DIExpression()), !dbg !1705
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1706, metadata !DIExpression()), !dbg !1707
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1707
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1708
  %cmp = icmp slt i32 %0, 0, !dbg !1710
  br i1 %cmp, label %if.then, label %if.end, !dbg !1711

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1712
  %sub = sub nsw i32 0, %1, !dbg !1714
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1715
  br label %if.end, !dbg !1716

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1717
  %cmp1 = icmp ne i32 %2, 0, !dbg !1719
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1720

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1721
  %cmp3 = icmp sle i32 %3, 0, !dbg !1724
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1725

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1726
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1729
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1729
  %div = udiv i32 -2147483648, %4, !dbg !1729, !klee.check.div !268
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1730
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1731
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1732

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1733
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1735
  %mul = mul i32 %6, %7, !dbg !1736
  store i32 %mul, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1738
  br label %return, !dbg !1738

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1740
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1743
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1743
  %div8 = sdiv i32 2147483647, %8, !dbg !1743, !klee.check.div !268
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1744
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1745
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1746

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1747
  br label %return, !dbg !1747

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1749
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1751
  %mul12 = mul i32 %10, %11, !dbg !1752
  store i32 %mul12, i32* %retval, align 4, !dbg !1753
  br label %return, !dbg !1753

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1754
  br label %return, !dbg !1754

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1756
  ret i32 %12, !dbg !1756
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1757 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1760, metadata !DIExpression()), !dbg !1761
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1762, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1764, metadata !DIExpression()), !dbg !1765
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1766, metadata !DIExpression()), !dbg !1767
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1768, metadata !DIExpression()), !dbg !1769
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1770
  %cmp = icmp slt i32 %0, 0, !dbg !1772
  br i1 %cmp, label %if.then, label %if.else, !dbg !1773

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1774
  %sub = sub nsw i32 0, %1, !dbg !1776
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1777
  store i8 1, i8* %u8SignBit, align 1, !dbg !1778
  br label %if.end, !dbg !1779

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1780
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1782
  store i8 0, i8* %u8SignBit, align 1, !dbg !1783
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1784
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1785
  %conv = zext i16 %4 to i32, !dbg !1785
  %mul = mul i32 %3, %conv, !dbg !1786
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1787
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1788
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1789
  %conv1 = zext i16 %6 to i32, !dbg !1789
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1790
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1791
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1792
  %shr = lshr i32 %7, 16, !dbg !1793
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1794
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1795
  %shl = shl i32 %8, 16, !dbg !1796
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1797
  %or = or i32 %9, %shl, !dbg !1797
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1797
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1798
  %conv2 = zext i8 %10 to i32, !dbg !1798
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1800
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1801

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1802
  store i32 %11, i32* %retval, align 4, !dbg !1804
  br label %return, !dbg !1804

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1805
  %sub7 = sub i32 0, %12, !dbg !1807
  store i32 %sub7, i32* %retval, align 4, !dbg !1808
  br label %return, !dbg !1808

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1809
  ret i32 %13, !dbg !1809
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1810 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1811, metadata !DIExpression()), !dbg !1812
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1813, metadata !DIExpression()), !dbg !1814
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1815, metadata !DIExpression()), !dbg !1816
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1817, metadata !DIExpression()), !dbg !1818
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1819, metadata !DIExpression()), !dbg !1820
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1821, metadata !DIExpression()), !dbg !1822
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1823
  %cmp = icmp slt i32 %0, 0, !dbg !1825
  br i1 %cmp, label %if.then, label %if.else, !dbg !1826

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1827
  %sub = sub nsw i32 0, %1, !dbg !1829
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1830
  store i8 1, i8* %u8SignBit, align 1, !dbg !1831
  br label %if.end, !dbg !1832

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1833
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1835
  store i8 0, i8* %u8SignBit, align 1, !dbg !1836
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1837
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1838
  %conv = zext i16 %4 to i32, !dbg !1838
  %mul = mul i32 %3, %conv, !dbg !1839
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1840
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1841
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1842
  %conv1 = zext i16 %6 to i32, !dbg !1842
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1843
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1844
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1845
  %shr = lshr i32 %7, 15, !dbg !1846
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1847
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1848
  %shl = shl i32 %8, 17, !dbg !1849
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1850
  %or = or i32 %9, %shl, !dbg !1850
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1850
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1851
  %conv2 = zext i8 %10 to i32, !dbg !1851
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1853
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1854

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1855
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1858
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1859

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1860
  store i32 %12, i32* %retval, align 4, !dbg !1861
  br label %return, !dbg !1861

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1862
  br label %return, !dbg !1862

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1863
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1866
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1867

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1868
  %sub14 = sub i32 0, %14, !dbg !1869
  store i32 %sub14, i32* %retval, align 4, !dbg !1870
  br label %return, !dbg !1870

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1871
  br label %return, !dbg !1871

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1872
  ret i32 %15, !dbg !1872
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1873 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1876, metadata !DIExpression()), !dbg !1877
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1878, metadata !DIExpression()), !dbg !1879
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1880, metadata !DIExpression()), !dbg !1881
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1882, metadata !DIExpression()), !dbg !1883
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1884, metadata !DIExpression()), !dbg !1885
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1886, metadata !DIExpression()), !dbg !1887
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1888, metadata !DIExpression()), !dbg !1889
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1890
  %cmp = icmp slt i32 %0, 0, !dbg !1892
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1893

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1894
  %conv = sext i16 %1 to i32, !dbg !1894
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1895
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1896

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1897
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1898
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1899

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1900
  %conv6 = sext i16 %3 to i32, !dbg !1900
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1901
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1902

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1903
  br label %if.end, !dbg !1905

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1906
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1908
  %cmp9 = icmp slt i32 %4, 0, !dbg !1910
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1911

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1912
  %sub = sub nsw i32 0, %5, !dbg !1914
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1915
  br label %if.end13, !dbg !1916

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1917
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1919
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1920
  %conv14 = sext i16 %7 to i32, !dbg !1920
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1922
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1923

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1924
  %conv18 = sext i16 %8 to i32, !dbg !1924
  %sub19 = sub nsw i32 0, %conv18, !dbg !1926
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1927
  br label %if.end22, !dbg !1928

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1929
  %conv21 = sext i16 %9 to i32, !dbg !1929
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1931
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1932
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1933
  %mul = mul i32 %10, %11, !dbg !1934
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1935
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1936
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1937
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1938
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1939
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1940
  %shr = lshr i32 %14, 15, !dbg !1941
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1942
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1943
  %shl = shl i32 %15, 17, !dbg !1944
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1945
  %or = or i32 %16, %shl, !dbg !1945
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1945
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1946
  %conv23 = zext i8 %17 to i32, !dbg !1946
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1948
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1949

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1950
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1953
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1954

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1955
  store i32 %19, i32* %retval, align 4, !dbg !1956
  br label %return, !dbg !1956

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1957
  br label %return, !dbg !1957

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1958
  %sub32 = sub i32 0, %20, !dbg !1960
  store i32 %sub32, i32* %retval, align 4, !dbg !1961
  br label %return, !dbg !1961

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1962
  ret i32 %21, !dbg !1962
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1963 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1964, metadata !DIExpression()), !dbg !1965
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1966, metadata !DIExpression()), !dbg !1967
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1968, metadata !DIExpression()), !dbg !1969
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1970, metadata !DIExpression()), !dbg !1971
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1972, metadata !DIExpression()), !dbg !1973
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1974, metadata !DIExpression()), !dbg !1975
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1976, metadata !DIExpression()), !dbg !1977
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1978
  %cmp = icmp slt i32 %0, 0, !dbg !1980
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1981

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1982
  %conv = sext i16 %1 to i32, !dbg !1982
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1983
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1984

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1985
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1986
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1987

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1988
  %conv6 = sext i16 %3 to i32, !dbg !1988
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1989
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1990

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1991
  br label %if.end, !dbg !1993

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1994
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1996
  %cmp9 = icmp slt i32 %4, 0, !dbg !1998
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1999

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2000
  %sub = sub nsw i32 0, %5, !dbg !2002
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2003
  br label %if.end13, !dbg !2004

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2005
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2007
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2008
  %conv14 = sext i16 %7 to i32, !dbg !2008
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2010
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2011

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2012
  %conv18 = sext i16 %8 to i32, !dbg !2012
  %sub19 = sub nsw i32 0, %conv18, !dbg !2014
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2015
  br label %if.end22, !dbg !2016

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2017
  %conv21 = sext i16 %9 to i32, !dbg !2017
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2019
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2020
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2021
  %mul = mul i32 %10, %11, !dbg !2022
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2023
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2024
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2025
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2026
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2027
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2028
  %shr = lshr i32 %14, 14, !dbg !2029
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2030
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2031
  %shl = shl i32 %15, 18, !dbg !2032
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2033
  %or = or i32 %16, %shl, !dbg !2033
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2033
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2034
  %shr23 = lshr i32 %17, 14, !dbg !2036
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2037
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2038

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2039
  %conv27 = zext i8 %18 to i32, !dbg !2039
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2042
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2043

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2044
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2047
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2048

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2049
  store i32 %20, i32* %retval, align 4, !dbg !2050
  br label %return, !dbg !2050

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2051
  br label %return, !dbg !2051

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2052
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2055
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2056

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2057
  %sub39 = sub i32 0, %22, !dbg !2058
  store i32 %sub39, i32* %retval, align 4, !dbg !2059
  br label %return, !dbg !2059

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2060
  br label %return, !dbg !2060

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2061
  br label %return, !dbg !2061

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2063
  ret i32 %23, !dbg !2063
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2064 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2067, metadata !DIExpression()), !dbg !2068
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2069, metadata !DIExpression()), !dbg !2070
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2071, metadata !DIExpression()), !dbg !2072
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2073, metadata !DIExpression()), !dbg !2074
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2075, metadata !DIExpression()), !dbg !2076
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2077
  %cmp = icmp slt i32 %0, 0, !dbg !2079
  br i1 %cmp, label %if.then, label %if.else, !dbg !2080

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2081
  %sub = sub nsw i32 0, %1, !dbg !2083
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2084
  store i8 1, i8* %u8SignBit, align 1, !dbg !2085
  br label %if.end, !dbg !2086

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2087
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2089
  store i8 0, i8* %u8SignBit, align 1, !dbg !2090
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2091
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2092
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2093
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2094
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2095
  %conv = zext i8 %5 to i32, !dbg !2095
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2097
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2098

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2099
  store i32 %6, i32* %retval, align 4, !dbg !2100
  br label %return, !dbg !2100

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2101
  %sub5 = sub i32 0, %7, !dbg !2102
  store i32 %sub5, i32* %retval, align 4, !dbg !2103
  br label %return, !dbg !2103

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2104
  ret i32 %8, !dbg !2104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2105 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2106, metadata !DIExpression()), !dbg !2107
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2108, metadata !DIExpression()), !dbg !2109
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2110, metadata !DIExpression()), !dbg !2111
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2112, metadata !DIExpression()), !dbg !2113
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2114, metadata !DIExpression()), !dbg !2115
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2116, metadata !DIExpression()), !dbg !2117
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2118
  %cmp = icmp slt i32 %0, 0, !dbg !2120
  br i1 %cmp, label %if.then, label %if.else, !dbg !2121

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2122
  %sub = sub nsw i32 0, %1, !dbg !2124
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2125
  store i8 1, i8* %u8SignBit, align 1, !dbg !2126
  br label %if.end, !dbg !2127

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2128
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2130
  store i8 0, i8* %u8SignBit, align 1, !dbg !2131
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2132
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2133
  %mul = mul i32 %3, %4, !dbg !2134
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2135
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2136
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2137
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2138
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2139
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2140
  %shr = lshr i32 %7, 31, !dbg !2141
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2142
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2143
  %shl = shl i32 %8, 1, !dbg !2144
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2145
  %or = or i32 %9, %shl, !dbg !2145
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2145
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2146
  %conv = zext i8 %10 to i32, !dbg !2146
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2148
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2149

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2150
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2153
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2154

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2155
  store i32 %12, i32* %retval, align 4, !dbg !2156
  br label %return, !dbg !2156

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2157
  br label %return, !dbg !2157

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2158
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2161
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2162

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2163
  %sub12 = sub i32 0, %14, !dbg !2164
  store i32 %sub12, i32* %retval, align 4, !dbg !2165
  br label %return, !dbg !2165

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2166
  br label %return, !dbg !2166

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2167
  ret i32 %15, !dbg !2167
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2168 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2171, metadata !DIExpression()), !dbg !2172
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2173, metadata !DIExpression()), !dbg !2174
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2175, metadata !DIExpression()), !dbg !2176
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2177, metadata !DIExpression()), !dbg !2178
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2179, metadata !DIExpression()), !dbg !2180
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2181, metadata !DIExpression()), !dbg !2182
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2183, metadata !DIExpression()), !dbg !2184
  %0 = load i32, i32* %value.addr, align 4, !dbg !2185
  %cmp = icmp slt i32 %0, 0, !dbg !2187
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2188
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2188

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2189
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2190
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2191
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2191

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2192
  br label %if.end, !dbg !2194

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2195
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2197
  %cmp5 = icmp slt i32 %4, 0, !dbg !2199
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2200

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2201
  %sub = sub nsw i32 0, %5, !dbg !2203
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2204
  br label %if.end8, !dbg !2205

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2206
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2208
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2209
  %cmp9 = icmp slt i32 %7, 0, !dbg !2211
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2212

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2213
  %sub11 = sub nsw i32 0, %8, !dbg !2215
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2216
  br label %if.end13, !dbg !2217

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2218
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2220
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2221
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2222
  %mul = mul i32 %10, %11, !dbg !2223
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2224
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2225
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2226
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2227
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2228
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2229
  %shr = lshr i32 %14, 31, !dbg !2230
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2231
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2232
  %shl = shl i32 %15, 1, !dbg !2233
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2234
  %or = or i32 %16, %shl, !dbg !2234
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2234
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2235
  %conv = zext i8 %17 to i32, !dbg !2235
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2237
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2238

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2239
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2242
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2243

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2244
  store i32 %19, i32* %retval, align 4, !dbg !2245
  br label %return, !dbg !2245

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2246
  br label %return, !dbg !2246

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2247
  %sub22 = sub i32 0, %20, !dbg !2249
  store i32 %sub22, i32* %retval, align 4, !dbg !2250
  br label %return, !dbg !2250

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2251
  ret i32 %21, !dbg !2251
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2252 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2253, metadata !DIExpression()), !dbg !2254
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2255, metadata !DIExpression()), !dbg !2256
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2257, metadata !DIExpression()), !dbg !2258
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2259, metadata !DIExpression()), !dbg !2260
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2261, metadata !DIExpression()), !dbg !2262
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2263, metadata !DIExpression()), !dbg !2264
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2265, metadata !DIExpression()), !dbg !2266
  %0 = load i32, i32* %value.addr, align 4, !dbg !2267
  %cmp = icmp slt i32 %0, 0, !dbg !2269
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2270
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2270

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2271
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2272
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2273
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2273

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2274
  br label %if.end, !dbg !2276

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2277
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2279
  %cmp5 = icmp slt i32 %4, 0, !dbg !2281
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2282

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2283
  %sub = sub nsw i32 0, %5, !dbg !2285
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2286
  br label %if.end8, !dbg !2287

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2288
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2290
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2291
  %cmp9 = icmp slt i32 %7, 0, !dbg !2293
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2294

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2295
  %sub11 = sub nsw i32 0, %8, !dbg !2297
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2298
  br label %if.end13, !dbg !2299

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2300
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2302
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2303
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2304
  %mul = mul i32 %10, %11, !dbg !2305
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2306
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2307
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2308
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2309
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2310
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2311
  %shr = lshr i32 %14, 30, !dbg !2312
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2313
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2314
  %shl = shl i32 %15, 2, !dbg !2315
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2316
  %or = or i32 %16, %shl, !dbg !2316
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2316
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2317
  %shr14 = lshr i32 %17, 30, !dbg !2319
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2320
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2321

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2322
  %conv = zext i8 %18 to i32, !dbg !2322
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2325
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2326

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2327
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2330
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2331

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2332
  store i32 %20, i32* %retval, align 4, !dbg !2333
  br label %return, !dbg !2333

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2334
  br label %return, !dbg !2334

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2335
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2338
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2339

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2340
  %sub28 = sub i32 0, %22, !dbg !2341
  store i32 %sub28, i32* %retval, align 4, !dbg !2342
  br label %return, !dbg !2342

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2343
  br label %return, !dbg !2343

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2344
  br label %return, !dbg !2344

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2346
  ret i32 %23, !dbg !2346
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2347 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2350, metadata !DIExpression()), !dbg !2351
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2352, metadata !DIExpression()), !dbg !2353
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2354, metadata !DIExpression()), !dbg !2355
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2356, metadata !DIExpression()), !dbg !2357
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2358, metadata !DIExpression()), !dbg !2359
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2360, metadata !DIExpression()), !dbg !2361
  %0 = load i32, i32* %value.addr, align 4, !dbg !2362
  %cmp = icmp slt i32 %0, 0, !dbg !2364
  br i1 %cmp, label %if.then, label %if.else, !dbg !2365

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2366
  %sub = sub nsw i32 0, %1, !dbg !2368
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2369
  store i8 1, i8* %u8SignBit, align 1, !dbg !2370
  br label %if.end, !dbg !2371

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2372
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2374
  store i8 0, i8* %u8SignBit, align 1, !dbg !2375
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2376
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2377
  %conv = zext i8 %4 to i32, !dbg !2377
  %mul = mul i32 %3, %conv, !dbg !2378
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2379
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2380
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2381
  %conv1 = zext i8 %6 to i32, !dbg !2381
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2382
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2383
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2384
  %shr = lshr i32 %7, 8, !dbg !2385
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2386
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2387
  %shl = shl i32 %8, 24, !dbg !2388
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2389
  %or = or i32 %9, %shl, !dbg !2389
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2389
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2390
  %conv2 = zext i8 %10 to i32, !dbg !2390
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2392
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2393

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2394
  store i32 %11, i32* %retval, align 4, !dbg !2396
  br label %return, !dbg !2396

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2397
  %sub7 = sub i32 0, %12, !dbg !2399
  store i32 %sub7, i32* %retval, align 4, !dbg !2400
  br label %return, !dbg !2400

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2401
  ret i32 %13, !dbg !2401
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2402 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2403, metadata !DIExpression()), !dbg !2404
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2405, metadata !DIExpression()), !dbg !2406
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2407, metadata !DIExpression()), !dbg !2408
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2409, metadata !DIExpression()), !dbg !2410
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2411, metadata !DIExpression()), !dbg !2412
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2413, metadata !DIExpression()), !dbg !2414
  %0 = load i32, i32* %value.addr, align 4, !dbg !2415
  %cmp = icmp slt i32 %0, 0, !dbg !2417
  br i1 %cmp, label %if.then, label %if.else, !dbg !2418

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2419
  %sub = sub nsw i32 0, %1, !dbg !2421
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2422
  store i8 1, i8* %u8SignBit, align 1, !dbg !2423
  br label %if.end, !dbg !2424

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2425
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2427
  store i8 0, i8* %u8SignBit, align 1, !dbg !2428
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2429
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2430
  %conv = zext i8 %4 to i32, !dbg !2430
  %mul = mul i32 %3, %conv, !dbg !2431
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2432
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2433
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2434
  %conv1 = zext i8 %6 to i32, !dbg !2434
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2435
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2436
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2437
  %shr = lshr i32 %7, 7, !dbg !2438
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2439
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2440
  %shl = shl i32 %8, 25, !dbg !2441
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2442
  %or = or i32 %9, %shl, !dbg !2442
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2442
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2443
  %conv2 = zext i8 %10 to i32, !dbg !2443
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2445
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2446

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2447
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2450
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2451

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2452
  store i32 %12, i32* %retval, align 4, !dbg !2453
  br label %return, !dbg !2453

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2454
  br label %return, !dbg !2454

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2455
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2458
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2459

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2460
  %sub14 = sub i32 0, %14, !dbg !2461
  store i32 %sub14, i32* %retval, align 4, !dbg !2462
  br label %return, !dbg !2462

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2463
  br label %return, !dbg !2463

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2464
  ret i32 %15, !dbg !2464
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2465 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2468, metadata !DIExpression()), !dbg !2469
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2470, metadata !DIExpression()), !dbg !2471
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2472, metadata !DIExpression()), !dbg !2473
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2474, metadata !DIExpression()), !dbg !2475
  store i32 0, i32* %u32Temp1, align 4, !dbg !2475
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2476, metadata !DIExpression()), !dbg !2477
  store i32 0, i32* %u32Temp2, align 4, !dbg !2477
  %0 = load i8, i8* %power.addr, align 1, !dbg !2478
  %conv = zext i8 %0 to i32, !dbg !2478
  %cmp = icmp sge i32 %conv, 32, !dbg !2480
  br i1 %cmp, label %if.then, label %if.else, !dbg !2481

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2482
  br label %if.end7, !dbg !2484

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2485
  %conv2 = zext i8 %1 to i32, !dbg !2485
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2487
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2488

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2489
  br label %if.end7, !dbg !2491

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2492
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2493
  %mul = mul i32 %2, %3, !dbg !2494
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2495
  %4 = load i32, i32* %value.addr, align 4, !dbg !2496
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2497
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2498
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2499
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2500
  %7 = load i8, i8* %power.addr, align 1, !dbg !2501
  %conv8 = zext i8 %7 to i32, !dbg !2501
  %sub = sub nsw i32 32, %conv8, !dbg !2502
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2503
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2503
  %shr = lshr i32 %6, %sub, !dbg !2503, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2504
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2505
  %9 = load i8, i8* %power.addr, align 1, !dbg !2506
  %conv9 = zext i8 %9 to i32, !dbg !2506
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2507
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2507
  %shl = shl i32 %8, %conv9, !dbg !2507, !klee.check.shift !268
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2508
  %or = or i32 %10, %shl, !dbg !2508
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2508
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2509
  %12 = load i8, i8* %power.addr, align 1, !dbg !2511
  %conv10 = zext i8 %12 to i32, !dbg !2511
  %sub11 = sub nsw i32 32, %conv10, !dbg !2512
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2513
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2513
  %shr12 = lshr i32 %11, %sub11, !dbg !2513, !klee.check.shift !268
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2514
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2515

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2516
  store i32 %13, i32* %retval, align 4, !dbg !2518
  br label %return, !dbg !2518

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2519
  br label %return, !dbg !2519

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2521
  ret i32 %14, !dbg !2521
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2522 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2525, metadata !DIExpression()), !dbg !2526
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2527, metadata !DIExpression()), !dbg !2528
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2529, metadata !DIExpression()), !dbg !2530
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2531, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2533, metadata !DIExpression()), !dbg !2534
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2535, metadata !DIExpression()), !dbg !2536
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2537, metadata !DIExpression()), !dbg !2538
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2539, metadata !DIExpression()), !dbg !2540
  %0 = load i8, i8* %power.addr, align 1, !dbg !2541
  %conv = zext i8 %0 to i32, !dbg !2541
  %cmp = icmp sge i32 %conv, 32, !dbg !2543
  br i1 %cmp, label %if.then, label %if.else, !dbg !2544

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2545
  br label %if.end7, !dbg !2547

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2548
  %conv2 = zext i8 %1 to i32, !dbg !2548
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2550
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2551

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2552
  br label %if.end7, !dbg !2554

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2555
  %cmp8 = icmp slt i32 %2, 0, !dbg !2557
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2558
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2558

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2559
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2560
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2561
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2561

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2562
  br label %if.end19, !dbg !2564

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2565
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2567
  %cmp20 = icmp slt i32 %6, 0, !dbg !2569
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2570

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2571
  %sub = sub nsw i32 0, %7, !dbg !2573
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2574
  br label %if.end24, !dbg !2575

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2576
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2578
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2579
  %cmp25 = icmp slt i32 %9, 0, !dbg !2581
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2582

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2583
  %sub28 = sub nsw i32 0, %10, !dbg !2585
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2586
  br label %if.end30, !dbg !2587

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2588
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2590
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2591
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2592
  %mul = mul i32 %12, %13, !dbg !2593
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2594
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2595
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2596
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2597
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2598
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2599
  %17 = load i8, i8* %power.addr, align 1, !dbg !2600
  %conv31 = zext i8 %17 to i32, !dbg !2600
  %sub32 = sub nsw i32 32, %conv31, !dbg !2601
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2602
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2602
  %shr = lshr i32 %16, %sub32, !dbg !2602, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2603
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2604
  %19 = load i8, i8* %power.addr, align 1, !dbg !2605
  %conv33 = zext i8 %19 to i32, !dbg !2605
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2606
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2606
  %shl = shl i32 %18, %conv33, !dbg !2606, !klee.check.shift !268
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2607
  %or = or i32 %20, %shl, !dbg !2607
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2607
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2608
  %22 = load i8, i8* %power.addr, align 1, !dbg !2610
  %conv34 = zext i8 %22 to i32, !dbg !2610
  %sub35 = sub nsw i32 32, %conv34, !dbg !2611
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2612
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2612
  %shr36 = lshr i32 %21, %sub35, !dbg !2612, !klee.check.shift !268
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2613
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2614

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2615
  %conv40 = zext i8 %23 to i32, !dbg !2615
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2618
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2619

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2620
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2623
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2624

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2625
  store i32 %25, i32* %retval, align 4, !dbg !2626
  br label %return, !dbg !2626

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2627
  br label %return, !dbg !2627

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2628
  %sub49 = sub i32 0, %26, !dbg !2630
  store i32 %sub49, i32* %retval, align 4, !dbg !2631
  br label %return, !dbg !2631

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2632
  %conv51 = zext i8 %27 to i32, !dbg !2632
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2635
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2636

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2637
  br label %return, !dbg !2637

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2639
  br label %return, !dbg !2639

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2641
  ret i32 %28, !dbg !2641
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2642 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2645, metadata !DIExpression()), !dbg !2646
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2647, metadata !DIExpression()), !dbg !2648
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2649, metadata !DIExpression()), !dbg !2650
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2651, metadata !DIExpression()), !dbg !2652
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2653, metadata !DIExpression()), !dbg !2654
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2655, metadata !DIExpression()), !dbg !2656
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2657, metadata !DIExpression()), !dbg !2658
  %0 = load i32, i32* %value.addr, align 4, !dbg !2659
  %cmp = icmp slt i32 %0, 0, !dbg !2661
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2662

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2663
  %conv = sext i8 %1 to i32, !dbg !2663
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2664
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2665

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2666
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2667
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2668

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2669
  %conv6 = sext i8 %3 to i32, !dbg !2669
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2670
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2671

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2672
  br label %if.end, !dbg !2674

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2675
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2677
  %cmp9 = icmp slt i32 %4, 0, !dbg !2679
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2680

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2681
  %sub = sub nsw i32 0, %5, !dbg !2683
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2684
  br label %if.end13, !dbg !2685

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2686
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2688
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2689
  %conv14 = sext i8 %7 to i32, !dbg !2689
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2691
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2692

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2693
  %conv18 = sext i8 %8 to i32, !dbg !2693
  %sub19 = sub nsw i32 0, %conv18, !dbg !2695
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2696
  br label %if.end22, !dbg !2697

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2698
  %conv21 = sext i8 %9 to i32, !dbg !2698
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2700
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2701
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2702
  %mul = mul i32 %10, %11, !dbg !2703
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2704
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2705
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2706
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2707
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2708
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2709
  %shr = lshr i32 %14, 7, !dbg !2710
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2711
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2712
  %shl = shl i32 %15, 25, !dbg !2713
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2714
  %or = or i32 %16, %shl, !dbg !2714
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2714
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2715
  %conv23 = zext i8 %17 to i32, !dbg !2715
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2717
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2718

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2719
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2722
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2723

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2724
  store i32 %19, i32* %retval, align 4, !dbg !2725
  br label %return, !dbg !2725

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2726
  br label %return, !dbg !2726

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2727
  %sub32 = sub i32 0, %20, !dbg !2729
  store i32 %sub32, i32* %retval, align 4, !dbg !2730
  br label %return, !dbg !2730

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2731
  ret i32 %21, !dbg !2731
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2732 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2733, metadata !DIExpression()), !dbg !2734
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2735, metadata !DIExpression()), !dbg !2736
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2737, metadata !DIExpression()), !dbg !2738
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2739, metadata !DIExpression()), !dbg !2740
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2741, metadata !DIExpression()), !dbg !2742
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2743, metadata !DIExpression()), !dbg !2744
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2745, metadata !DIExpression()), !dbg !2746
  %0 = load i32, i32* %value.addr, align 4, !dbg !2747
  %cmp = icmp slt i32 %0, 0, !dbg !2749
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2750

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2751
  %conv = sext i8 %1 to i32, !dbg !2751
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2752
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2753

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2754
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2755
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2756

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2757
  %conv6 = sext i8 %3 to i32, !dbg !2757
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2758
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2759

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2760
  br label %if.end, !dbg !2762

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2763
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2765
  %cmp9 = icmp slt i32 %4, 0, !dbg !2767
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2768

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2769
  %sub = sub nsw i32 0, %5, !dbg !2771
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2772
  br label %if.end13, !dbg !2773

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2774
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2776
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2777
  %conv14 = sext i8 %7 to i32, !dbg !2777
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2779
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2780

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2781
  %conv18 = sext i8 %8 to i32, !dbg !2781
  %sub19 = sub nsw i32 0, %conv18, !dbg !2783
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2784
  br label %if.end22, !dbg !2785

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2786
  %conv21 = sext i8 %9 to i32, !dbg !2786
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2788
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2789
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2790
  %mul = mul i32 %10, %11, !dbg !2791
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2792
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2793
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2794
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2795
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2796
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2797
  %shr = lshr i32 %14, 6, !dbg !2798
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2799
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2800
  %shl = shl i32 %15, 26, !dbg !2801
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2802
  %or = or i32 %16, %shl, !dbg !2802
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2802
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2803
  %shr23 = lshr i32 %17, 6, !dbg !2805
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2806
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2807

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2808
  %conv27 = zext i8 %18 to i32, !dbg !2808
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2811
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2812

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2813
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2816
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2817

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2818
  store i32 %20, i32* %retval, align 4, !dbg !2819
  br label %return, !dbg !2819

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2820
  br label %return, !dbg !2820

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2821
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2824
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2825

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2826
  %sub39 = sub i32 0, %22, !dbg !2827
  store i32 %sub39, i32* %retval, align 4, !dbg !2828
  br label %return, !dbg !2828

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2829
  br label %return, !dbg !2829

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2830
  br label %return, !dbg !2830

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2832
  ret i32 %23, !dbg !2832
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2833 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2834, metadata !DIExpression()), !dbg !2835
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2836, metadata !DIExpression()), !dbg !2837
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2838, metadata !DIExpression()), !dbg !2839
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2840, metadata !DIExpression()), !dbg !2841
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2842, metadata !DIExpression()), !dbg !2843
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2844, metadata !DIExpression()), !dbg !2845
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2846, metadata !DIExpression()), !dbg !2847
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2848
  %cmp = icmp slt i32 %0, 0, !dbg !2850
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2851
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2851

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2852
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2853
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2854
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2854

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2855
  br label %if.end, !dbg !2857

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2858
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2860
  %cmp5 = icmp slt i32 %4, 0, !dbg !2862
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2863

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2864
  %sub = sub nsw i32 0, %5, !dbg !2866
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2867
  br label %if.end8, !dbg !2868

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2869
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2871
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2872
  %cmp9 = icmp slt i32 %7, 0, !dbg !2874
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2875

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2876
  %sub11 = sub nsw i32 0, %8, !dbg !2878
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2879
  br label %if.end13, !dbg !2880

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2881
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2883
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2884
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2885
  %mul = mul i32 %10, %11, !dbg !2886
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2887
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2888
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2889
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2890
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2891
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2892
  %cmp14 = icmp eq i32 %14, 0, !dbg !2894
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2895

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2896
  %conv = zext i8 %15 to i32, !dbg !2896
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2899
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2900

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2901
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2904
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2905

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2906
  store i32 %17, i32* %retval, align 4, !dbg !2907
  br label %return, !dbg !2907

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2908
  br label %return, !dbg !2908

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2909
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2912
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2913

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2914
  %sub27 = sub i32 0, %19, !dbg !2915
  store i32 %sub27, i32* %retval, align 4, !dbg !2916
  br label %return, !dbg !2916

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2917
  br label %return, !dbg !2917

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2918
  %conv30 = zext i8 %20 to i32, !dbg !2918
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2921
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2922

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2923
  br label %return, !dbg !2923

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2925
  br label %return, !dbg !2925

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2927
  ret i32 %21, !dbg !2927
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2928 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2929, metadata !DIExpression()), !dbg !2930
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2931, metadata !DIExpression()), !dbg !2932
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2933, metadata !DIExpression()), !dbg !2934
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2935, metadata !DIExpression()), !dbg !2936
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2937, metadata !DIExpression()), !dbg !2938
  %0 = load i32, i32* %value.addr, align 4, !dbg !2939
  %cmp = icmp slt i32 %0, 0, !dbg !2941
  br i1 %cmp, label %if.then, label %if.else, !dbg !2942

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2943
  %sub = sub nsw i32 0, %1, !dbg !2945
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2946
  store i8 1, i8* %u8SignBit, align 1, !dbg !2947
  br label %if.end, !dbg !2948

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2949
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2951
  store i8 0, i8* %u8SignBit, align 1, !dbg !2952
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2953
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2954
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2955
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2956
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2957
  %shr = lshr i32 %5, 1, !dbg !2958
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2959
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2960
  %conv = zext i8 %6 to i32, !dbg !2960
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2962
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2963

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2964
  store i32 %7, i32* %retval, align 4, !dbg !2966
  br label %return, !dbg !2966

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2967
  %sub5 = sub i32 0, %8, !dbg !2969
  store i32 %sub5, i32* %retval, align 4, !dbg !2970
  br label %return, !dbg !2970

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2971
  ret i32 %9, !dbg !2971
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2972 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2973, metadata !DIExpression()), !dbg !2974
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2975, metadata !DIExpression()), !dbg !2976
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2977, metadata !DIExpression()), !dbg !2978
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2979, metadata !DIExpression()), !dbg !2980
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2981, metadata !DIExpression()), !dbg !2982
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2983, metadata !DIExpression()), !dbg !2984
  %0 = load i32, i32* %value.addr, align 4, !dbg !2985
  %cmp = icmp slt i32 %0, 0, !dbg !2987
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2988
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2988

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2989
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2990
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2991
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2991

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2992
  br label %if.end, !dbg !2994

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2995
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2997
  %cmp5 = icmp slt i32 %4, 0, !dbg !2999
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3000

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3001
  %sub = sub nsw i32 0, %5, !dbg !3003
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3004
  br label %if.end8, !dbg !3005

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3006
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3008
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3009
  %cmp9 = icmp slt i32 %7, 0, !dbg !3011
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3012

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3013
  %sub11 = sub nsw i32 0, %8, !dbg !3015
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3016
  br label %if.end13, !dbg !3017

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3018
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3020
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3021
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3022
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3023
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3024
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3025
  %conv = zext i8 %12 to i32, !dbg !3025
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3027
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3028

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3029
  store i32 %13, i32* %retval, align 4, !dbg !3031
  br label %return, !dbg !3031

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3032
  %sub18 = sub i32 0, %14, !dbg !3034
  store i32 %sub18, i32* %retval, align 4, !dbg !3035
  br label %return, !dbg !3035

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3036
  ret i32 %15, !dbg !3036
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3037 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3040, metadata !DIExpression()), !dbg !3041
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3042, metadata !DIExpression()), !dbg !3043
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3044, metadata !DIExpression()), !dbg !3045
  store i32 0, i32* %u32Temp1, align 4, !dbg !3045
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3046, metadata !DIExpression()), !dbg !3047
  store i32 0, i32* %u32Temp2, align 4, !dbg !3047
  %0 = load i32, i32* %value.addr, align 4, !dbg !3048
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3049
  %conv = zext i8 %1 to i32, !dbg !3049
  %mul = mul i32 %0, %conv, !dbg !3050
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3051
  %2 = load i32, i32* %value.addr, align 4, !dbg !3052
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3053
  %conv1 = zext i8 %3 to i32, !dbg !3053
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3054
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3055
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3056
  %shr = lshr i32 %4, 8, !dbg !3057
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3058
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3059
  %shl = shl i32 %5, 24, !dbg !3060
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3061
  %or = or i32 %6, %shl, !dbg !3061
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3061
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3062
  ret i32 %7, !dbg !3063
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3064 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3065, metadata !DIExpression()), !dbg !3066
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3067, metadata !DIExpression()), !dbg !3068
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3069, metadata !DIExpression()), !dbg !3070
  store i32 0, i32* %u32Temp1, align 4, !dbg !3070
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3071, metadata !DIExpression()), !dbg !3072
  store i32 0, i32* %u32Temp2, align 4, !dbg !3072
  %0 = load i32, i32* %value.addr, align 4, !dbg !3073
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3074
  %conv = zext i8 %1 to i32, !dbg !3074
  %mul = mul i32 %0, %conv, !dbg !3075
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3076
  %2 = load i32, i32* %value.addr, align 4, !dbg !3077
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3078
  %conv1 = zext i8 %3 to i32, !dbg !3078
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3079
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3080
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3081
  %shr = lshr i32 %4, 7, !dbg !3082
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3083
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3084
  %shl = shl i32 %5, 25, !dbg !3085
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3086
  %or = or i32 %6, %shl, !dbg !3086
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3086
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3087
  %shr2 = lshr i32 %7, 7, !dbg !3089
  %cmp = icmp eq i32 %shr2, 0, !dbg !3090
  br i1 %cmp, label %if.then, label %if.else, !dbg !3091

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3092
  store i32 %8, i32* %retval, align 4, !dbg !3094
  br label %return, !dbg !3094

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3095
  br label %return, !dbg !3095

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3097
  ret i32 %9, !dbg !3097
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3098 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3101, metadata !DIExpression()), !dbg !3102
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3103, metadata !DIExpression()), !dbg !3104
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3105, metadata !DIExpression()), !dbg !3106
  store i32 0, i32* %u32Temp1, align 4, !dbg !3106
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3107, metadata !DIExpression()), !dbg !3108
  store i32 0, i32* %u32Temp2, align 4, !dbg !3108
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3109
  %conv = sext i8 %0 to i32, !dbg !3109
  %cmp = icmp sgt i32 %conv, 0, !dbg !3111
  br i1 %cmp, label %if.then, label %if.else, !dbg !3112

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3113
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3115
  %conv2 = sext i8 %2 to i32, !dbg !3115
  %mul = mul i32 %1, %conv2, !dbg !3116
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3117
  %3 = load i32, i32* %value.addr, align 4, !dbg !3118
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3119
  %conv3 = sext i8 %4 to i32, !dbg !3119
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3120
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3121
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3122
  %shr = lshr i32 %5, 7, !dbg !3123
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3124
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3125
  %shl = shl i32 %6, 25, !dbg !3126
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3127
  %or = or i32 %7, %shl, !dbg !3127
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3127
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3128
  store i32 %8, i32* %retval, align 4, !dbg !3129
  br label %return, !dbg !3129

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3130
  br label %return, !dbg !3130

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3132
  ret i32 %9, !dbg !3132
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3133 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3134, metadata !DIExpression()), !dbg !3135
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3136, metadata !DIExpression()), !dbg !3137
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3138, metadata !DIExpression()), !dbg !3139
  store i32 0, i32* %u32Temp1, align 4, !dbg !3139
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3140, metadata !DIExpression()), !dbg !3141
  store i32 0, i32* %u32Temp2, align 4, !dbg !3141
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3142
  %conv = sext i8 %0 to i32, !dbg !3142
  %cmp = icmp sle i32 %conv, 0, !dbg !3144
  br i1 %cmp, label %if.then, label %if.else, !dbg !3145

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3146
  br label %return, !dbg !3146

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3148
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3150
  %conv2 = sext i8 %2 to i32, !dbg !3150
  %mul = mul i32 %1, %conv2, !dbg !3151
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3152
  %3 = load i32, i32* %value.addr, align 4, !dbg !3153
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3154
  %conv3 = sext i8 %4 to i32, !dbg !3154
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3155
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3156
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3157
  %shr = lshr i32 %5, 6, !dbg !3158
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3159
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3160
  %shl = shl i32 %6, 26, !dbg !3161
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3162
  %or = or i32 %7, %shl, !dbg !3162
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3162
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3163
  %shr4 = lshr i32 %8, 6, !dbg !3165
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3166
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3167

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3168
  store i32 %9, i32* %retval, align 4, !dbg !3170
  br label %return, !dbg !3170

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3171
  br label %return, !dbg !3171

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3173
  ret i32 %10, !dbg !3173
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3174 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3175, metadata !DIExpression()), !dbg !3176
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3177, metadata !DIExpression()), !dbg !3178
  %0 = load i16, i16* %value.addr, align 2, !dbg !3179
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3180
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3181
  ret i16 %call, !dbg !3182
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3183 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3184, metadata !DIExpression()), !dbg !3185
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3186, metadata !DIExpression()), !dbg !3187
  %0 = load i16, i16* %value.addr, align 2, !dbg !3188
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3189
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3190
  ret i16 %call, !dbg !3191
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3192 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3193, metadata !DIExpression()), !dbg !3194
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3195, metadata !DIExpression()), !dbg !3196
  %0 = load i16, i16* %value.addr, align 2, !dbg !3197
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3198
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3199
  ret i16 %call, !dbg !3200
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3201 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3202, metadata !DIExpression()), !dbg !3203
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3204, metadata !DIExpression()), !dbg !3205
  %0 = load i16, i16* %value.addr, align 2, !dbg !3206
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3207
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3208
  ret i16 %call, !dbg !3209
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3210 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3211, metadata !DIExpression()), !dbg !3212
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3213, metadata !DIExpression()), !dbg !3214
  %0 = load i16, i16* %value.addr, align 2, !dbg !3215
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3216
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3217
  ret i16 %call, !dbg !3218
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3219 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3220, metadata !DIExpression()), !dbg !3221
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3222, metadata !DIExpression()), !dbg !3223
  %0 = load i16, i16* %value.addr, align 2, !dbg !3224
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3225
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3226
  ret i16 %call, !dbg !3227
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3228 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3229, metadata !DIExpression()), !dbg !3230
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3231, metadata !DIExpression()), !dbg !3232
  %0 = load i16, i16* %value.addr, align 2, !dbg !3233
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3234
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3235
  ret i16 %call, !dbg !3236
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3237 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3238, metadata !DIExpression()), !dbg !3239
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3240, metadata !DIExpression()), !dbg !3241
  %0 = load i16, i16* %value.addr, align 2, !dbg !3242
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3243
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3244
  ret i16 %call, !dbg !3245
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3246 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3247, metadata !DIExpression()), !dbg !3248
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3249, metadata !DIExpression()), !dbg !3250
  %0 = load i16, i16* %value.addr, align 2, !dbg !3251
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3252
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3253
  ret i16 %call, !dbg !3254
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3255 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3256, metadata !DIExpression()), !dbg !3257
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3258, metadata !DIExpression()), !dbg !3259
  %0 = load i16, i16* %value.addr, align 2, !dbg !3260
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3261
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3262
  ret i16 %call, !dbg !3263
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3264 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3265, metadata !DIExpression()), !dbg !3266
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3267, metadata !DIExpression()), !dbg !3268
  %0 = load i16, i16* %value.addr, align 2, !dbg !3269
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3270
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3271
  ret i16 %call, !dbg !3272
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3273 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3274, metadata !DIExpression()), !dbg !3275
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3276, metadata !DIExpression()), !dbg !3277
  %0 = load i16, i16* %value.addr, align 2, !dbg !3278
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3279
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3280
  ret i16 %call, !dbg !3281
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3282 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3283, metadata !DIExpression()), !dbg !3284
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3285, metadata !DIExpression()), !dbg !3286
  %0 = load i16, i16* %value.addr, align 2, !dbg !3287
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3288
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3289
  ret i16 %call, !dbg !3290
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3291 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3292, metadata !DIExpression()), !dbg !3293
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3294, metadata !DIExpression()), !dbg !3295
  %0 = load i16, i16* %value.addr, align 2, !dbg !3296
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3297
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3298
  ret i16 %call, !dbg !3299
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3300 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3301, metadata !DIExpression()), !dbg !3302
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3303, metadata !DIExpression()), !dbg !3304
  %0 = load i16, i16* %value.addr, align 2, !dbg !3305
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3306
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3307
  ret i16 %call, !dbg !3308
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3309 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3310, metadata !DIExpression()), !dbg !3311
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3312, metadata !DIExpression()), !dbg !3313
  %0 = load i16, i16* %value.addr, align 2, !dbg !3314
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3315
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3316
  %2 = load i16, i16* %retval, align 2, !dbg !3317
  ret i16 %2, !dbg !3317
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3318 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3319, metadata !DIExpression()), !dbg !3320
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  %0 = load i16, i16* %value.addr, align 2, !dbg !3323
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3324
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3325
  ret i16 %call, !dbg !3326
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3327 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3328, metadata !DIExpression()), !dbg !3329
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3330, metadata !DIExpression()), !dbg !3331
  %0 = load i16, i16* %value.addr, align 2, !dbg !3332
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3333
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3334
  ret i16 %call, !dbg !3335
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3336 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3337, metadata !DIExpression()), !dbg !3338
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3339, metadata !DIExpression()), !dbg !3340
  %0 = load i16, i16* %value.addr, align 2, !dbg !3341
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3342
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3343
  ret i16 %call, !dbg !3344
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3345 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3346, metadata !DIExpression()), !dbg !3347
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3348, metadata !DIExpression()), !dbg !3349
  %0 = load i16, i16* %value.addr, align 2, !dbg !3350
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3351
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3352
  ret i16 %call, !dbg !3353
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3354 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3355, metadata !DIExpression()), !dbg !3356
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  %0 = load i16, i16* %value.addr, align 2, !dbg !3359
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3360
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3361
  ret i16 %call, !dbg !3362
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3363 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3364, metadata !DIExpression()), !dbg !3365
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3366, metadata !DIExpression()), !dbg !3367
  %0 = load i16, i16* %value.addr, align 2, !dbg !3368
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3369
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3370
  ret i16 %call, !dbg !3371
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3372 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3373, metadata !DIExpression()), !dbg !3374
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3375, metadata !DIExpression()), !dbg !3376
  %0 = load i16, i16* %value.addr, align 2, !dbg !3377
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3378
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3379
  ret i16 %call, !dbg !3380
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3381 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3382, metadata !DIExpression()), !dbg !3383
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3384, metadata !DIExpression()), !dbg !3385
  %0 = load i16, i16* %value.addr, align 2, !dbg !3386
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3387
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3388
  ret i16 %call, !dbg !3389
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3390 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3391, metadata !DIExpression()), !dbg !3392
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3393, metadata !DIExpression()), !dbg !3394
  %0 = load i16, i16* %value.addr, align 2, !dbg !3395
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3396
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3397
  ret i16 %call, !dbg !3398
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3399 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3400, metadata !DIExpression()), !dbg !3401
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3402, metadata !DIExpression()), !dbg !3403
  %0 = load i16, i16* %value.addr, align 2, !dbg !3404
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3405
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3406
  ret i16 %call, !dbg !3407
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3408 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3409, metadata !DIExpression()), !dbg !3410
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3411, metadata !DIExpression()), !dbg !3412
  %0 = load i16, i16* %value.addr, align 2, !dbg !3413
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3414
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3415
  ret i16 %call, !dbg !3416
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3417 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3418, metadata !DIExpression()), !dbg !3419
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3420, metadata !DIExpression()), !dbg !3421
  %0 = load i16, i16* %value.addr, align 2, !dbg !3422
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3423
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3424
  ret i16 %call, !dbg !3425
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3426 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3427, metadata !DIExpression()), !dbg !3428
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3429, metadata !DIExpression()), !dbg !3430
  %0 = load i16, i16* %value.addr, align 2, !dbg !3431
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3432
  %conv = zext i8 %1 to i16, !dbg !3433
  %conv1 = zext i16 %conv to i32, !dbg !3433
  %shl = shl i32 %conv1, 5, !dbg !3434
  %conv2 = trunc i32 %shl to i16, !dbg !3435
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3436
  ret i16 %call, !dbg !3437
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3438 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3439, metadata !DIExpression()), !dbg !3440
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3441, metadata !DIExpression()), !dbg !3442
  %0 = load i16, i16* %value.addr, align 2, !dbg !3443
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3444
  %conv = zext i8 %1 to i16, !dbg !3445
  %conv1 = zext i16 %conv to i32, !dbg !3445
  %shl = shl i32 %conv1, 6, !dbg !3446
  %conv2 = trunc i32 %shl to i16, !dbg !3447
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3448
  ret i16 %call, !dbg !3449
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3450 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3451, metadata !DIExpression()), !dbg !3452
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3453, metadata !DIExpression()), !dbg !3454
  %0 = load i16, i16* %value.addr, align 2, !dbg !3455
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3456
  %conv = zext i8 %1 to i16, !dbg !3457
  %conv1 = zext i16 %conv to i32, !dbg !3457
  %shl = shl i32 %conv1, 7, !dbg !3458
  %conv2 = trunc i32 %shl to i16, !dbg !3459
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3460
  ret i16 %call, !dbg !3461
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3462 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3463, metadata !DIExpression()), !dbg !3464
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3465, metadata !DIExpression()), !dbg !3466
  %0 = load i16, i16* %value.addr, align 2, !dbg !3467
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3468
  %conv = zext i8 %1 to i16, !dbg !3469
  %conv1 = zext i16 %conv to i32, !dbg !3469
  %shl = shl i32 %conv1, 7, !dbg !3470
  %conv2 = trunc i32 %shl to i16, !dbg !3471
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3472
  ret i16 %call, !dbg !3473
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3474 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3475, metadata !DIExpression()), !dbg !3476
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3477, metadata !DIExpression()), !dbg !3478
  %0 = load i16, i16* %value.addr, align 2, !dbg !3479
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3480
  %conv = zext i8 %1 to i16, !dbg !3481
  %conv1 = zext i16 %conv to i32, !dbg !3481
  %shl = shl i32 %conv1, 4, !dbg !3482
  %conv2 = trunc i32 %shl to i16, !dbg !3483
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3484
  ret i16 %call, !dbg !3485
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3486 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3487, metadata !DIExpression()), !dbg !3488
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3489, metadata !DIExpression()), !dbg !3490
  %0 = load i16, i16* %value.addr, align 2, !dbg !3491
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3492
  %conv = zext i8 %1 to i16, !dbg !3493
  %conv1 = zext i16 %conv to i32, !dbg !3493
  %shl = shl i32 %conv1, 5, !dbg !3494
  %conv2 = trunc i32 %shl to i16, !dbg !3495
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3496
  ret i16 %call, !dbg !3497
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3498 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3499, metadata !DIExpression()), !dbg !3500
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3501, metadata !DIExpression()), !dbg !3502
  %0 = load i16, i16* %value.addr, align 2, !dbg !3503
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3504
  %conv = zext i8 %1 to i16, !dbg !3505
  %conv1 = zext i16 %conv to i32, !dbg !3505
  %shl = shl i32 %conv1, 2, !dbg !3506
  %conv2 = trunc i32 %shl to i16, !dbg !3507
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3508
  ret i16 %call, !dbg !3509
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3510 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3511, metadata !DIExpression()), !dbg !3512
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3513, metadata !DIExpression()), !dbg !3514
  %0 = load i16, i16* %value.addr, align 2, !dbg !3515
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3516
  %conv = zext i8 %1 to i16, !dbg !3517
  %conv1 = zext i16 %conv to i32, !dbg !3517
  %shl = shl i32 %conv1, 6, !dbg !3518
  %conv2 = trunc i32 %shl to i16, !dbg !3519
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3520
  ret i16 %call, !dbg !3521
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3522 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3523, metadata !DIExpression()), !dbg !3524
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3525, metadata !DIExpression()), !dbg !3526
  %0 = load i16, i16* %value.addr, align 2, !dbg !3527
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3528
  %conv = zext i8 %1 to i16, !dbg !3529
  %conv1 = zext i16 %conv to i32, !dbg !3529
  %shl = shl i32 %conv1, 3, !dbg !3530
  %conv2 = trunc i32 %shl to i16, !dbg !3531
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3532
  ret i16 %call, !dbg !3533
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3534 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3535, metadata !DIExpression()), !dbg !3536
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3537, metadata !DIExpression()), !dbg !3538
  %0 = load i32, i32* %value.addr, align 4, !dbg !3539
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3540
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3541
  ret i32 %call, !dbg !3542
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3543 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3546, metadata !DIExpression()), !dbg !3547
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3548, metadata !DIExpression()), !dbg !3549
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3550, metadata !DIExpression()), !dbg !3551
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3552, metadata !DIExpression()), !dbg !3553
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3554, metadata !DIExpression()), !dbg !3555
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3556, metadata !DIExpression()), !dbg !3557
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3558, metadata !DIExpression()), !dbg !3559
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3560, metadata !DIExpression()), !dbg !3561
  %0 = load i32, i32* %value.addr, align 4, !dbg !3562
  %cmp = icmp slt i32 %0, 0, !dbg !3564
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3565

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3566
  %conv = sext i16 %1 to i32, !dbg !3566
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3567
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3568

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3569
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3570
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3571

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3572
  %conv6 = sext i16 %3 to i32, !dbg !3572
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3573
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3574

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3575
  br label %if.end, !dbg !3577

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3578
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3580
  %cmp9 = icmp slt i32 %4, 0, !dbg !3582
  br i1 %cmp9, label %if.then11, label %if.else16, !dbg !3583

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3584
  %conv12 = sext i32 %5 to i64, !dbg !3587
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv12), !dbg !3588
  %tobool = icmp ne i32 %call, 0, !dbg !3588
  br i1 %tobool, label %if.end14, label %if.then13, !dbg !3589

if.then13:                                        ; preds = %if.then11
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 5075, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !3590
  unreachable, !dbg !3590

if.end14:                                         ; preds = %if.then11
  %6 = load i32, i32* %value.addr, align 4, !dbg !3592
  %sub = sub nsw i32 0, %6, !dbg !3593
  %conv15 = sext i32 %sub to i64, !dbg !3594
  store volatile i64 %conv15, i64* @klee_alarm_sink_s64, align 8, !dbg !3595
  store i32 0, i32* %retval, align 4, !dbg !3596
  br label %return, !dbg !3596

if.else16:                                        ; preds = %if.end
  %7 = load i32, i32* %value.addr, align 4, !dbg !3597
  store i32 %7, i32* %u32Temp1, align 4, !dbg !3599
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3600
  %conv18 = sext i16 %8 to i32, !dbg !3600
  %cmp19 = icmp slt i32 %conv18, 0, !dbg !3602
  br i1 %cmp19, label %if.then21, label %if.else24, !dbg !3603

if.then21:                                        ; preds = %if.else16
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3604
  %conv22 = sext i16 %9 to i32, !dbg !3604
  %sub23 = sub nsw i32 0, %conv22, !dbg !3606
  store i32 %sub23, i32* %u32Temp2, align 4, !dbg !3607
  br label %if.end26, !dbg !3608

if.else24:                                        ; preds = %if.else16
  %10 = load i16, i16* %factor.addr, align 2, !dbg !3609
  %conv25 = sext i16 %10 to i32, !dbg !3609
  store i32 %conv25, i32* %u32Temp2, align 4, !dbg !3611
  br label %if.end26

if.end26:                                         ; preds = %if.else24, %if.then21
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !3612
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !3613
  %mul = mul i32 %11, %12, !dbg !3614
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3615
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !3616
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !3617
  %call27 = call i32 @MulHighWord(i32 %13, i32 %14), !dbg !3618
  store i32 %call27, i32* %u32Temp4, align 4, !dbg !3619
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3620
  %16 = load i32, i32* %count.addr, align 4, !dbg !3621
  %int_cast_to_i64 = zext i32 %16 to i64, !dbg !3622
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3622
  %shr = lshr i32 %15, %16, !dbg !3622, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3623
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !3624
  %18 = load i32, i32* %count.addr, align 4, !dbg !3625
  %sub28 = sub i32 32, %18, !dbg !3626
  %int_cast_to_i641 = zext i32 %sub28 to i64, !dbg !3627
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3627
  %shl = shl i32 %17, %sub28, !dbg !3627, !klee.check.shift !268
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !3628
  %or = or i32 %19, %shl, !dbg !3628
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3628
  %20 = load i32, i32* %u32Temp4, align 4, !dbg !3629
  %21 = load i32, i32* %count.addr, align 4, !dbg !3631
  %int_cast_to_i642 = zext i32 %21 to i64, !dbg !3632
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3632
  %shr29 = lshr i32 %20, %21, !dbg !3632, !klee.check.shift !268
  %cmp30 = icmp eq i32 %shr29, 0, !dbg !3633
  br i1 %cmp30, label %if.then32, label %if.else47, !dbg !3634

if.then32:                                        ; preds = %if.end26
  %22 = load i8, i8* %u8SignBit, align 1, !dbg !3635
  %conv33 = zext i8 %22 to i32, !dbg !3635
  %cmp34 = icmp eq i32 %conv33, 0, !dbg !3638
  br i1 %cmp34, label %if.then36, label %if.else41, !dbg !3639

if.then36:                                        ; preds = %if.then32
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3640
  %cmp37 = icmp ule i32 %23, 2147483647, !dbg !3643
  br i1 %cmp37, label %if.then39, label %if.else40, !dbg !3644

if.then39:                                        ; preds = %if.then36
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3645
  store i32 %24, i32* %retval, align 4, !dbg !3646
  br label %return, !dbg !3646

if.else40:                                        ; preds = %if.then36
  store i32 2147483647, i32* %retval, align 4, !dbg !3647
  br label %return, !dbg !3647

if.else41:                                        ; preds = %if.then32
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3648
  %cmp42 = icmp ule i32 %25, -2147483648, !dbg !3651
  br i1 %cmp42, label %if.then44, label %if.else46, !dbg !3652

if.then44:                                        ; preds = %if.else41
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !3653
  %sub45 = sub i32 0, %26, !dbg !3654
  store i32 %sub45, i32* %retval, align 4, !dbg !3655
  br label %return, !dbg !3655

if.else46:                                        ; preds = %if.else41
  store i32 -2147483648, i32* %retval, align 4, !dbg !3656
  br label %return, !dbg !3656

if.else47:                                        ; preds = %if.end26
  store i32 2147483647, i32* %retval, align 4, !dbg !3657
  br label %return, !dbg !3657

return:                                           ; preds = %if.else47, %if.else46, %if.then44, %if.else40, %if.then39, %if.end14
  %27 = load i32, i32* %retval, align 4, !dbg !3659
  ret i32 %27, !dbg !3659
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !3660 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !3663, metadata !DIExpression()), !dbg !3664
  %0 = load i64, i64* %value.addr, align 8, !dbg !3665
  %cmp = icmp ne i64 %0, -2147483648, !dbg !3666
  %conv = zext i1 %cmp to i32, !dbg !3666
  ret i32 %conv, !dbg !3667
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3668 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3669, metadata !DIExpression()), !dbg !3670
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3671, metadata !DIExpression()), !dbg !3672
  %0 = load i32, i32* %value.addr, align 4, !dbg !3673
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3674
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3675
  ret i32 %call, !dbg !3676
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3677 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3680, metadata !DIExpression()), !dbg !3681
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3682, metadata !DIExpression()), !dbg !3683
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3684, metadata !DIExpression()), !dbg !3685
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3686, metadata !DIExpression()), !dbg !3687
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3688, metadata !DIExpression()), !dbg !3689
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3690, metadata !DIExpression()), !dbg !3691
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3692, metadata !DIExpression()), !dbg !3693
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3694, metadata !DIExpression()), !dbg !3695
  %0 = load i32, i32* %value.addr, align 4, !dbg !3696
  %cmp = icmp slt i32 %0, 0, !dbg !3698
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3699

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3700
  %conv = sext i8 %1 to i32, !dbg !3700
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3701
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3702

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3703
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3704
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3705

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3706
  %conv6 = sext i8 %3 to i32, !dbg !3706
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3707
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3708

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3709
  br label %if.end, !dbg !3711

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3712
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3714
  %cmp9 = icmp slt i32 %4, 0, !dbg !3716
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3717

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3718
  %sub = sub nsw i32 0, %5, !dbg !3720
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3721
  br label %if.end13, !dbg !3722

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3723
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3725
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3726
  %conv14 = sext i8 %7 to i32, !dbg !3726
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3728
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3729

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3730
  %conv18 = sext i8 %8 to i32, !dbg !3730
  %sub19 = sub nsw i32 0, %conv18, !dbg !3732
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3733
  br label %if.end22, !dbg !3734

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3735
  %conv21 = sext i8 %9 to i32, !dbg !3735
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3737
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3738
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3739
  %mul = mul i32 %10, %11, !dbg !3740
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3741
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3742
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3743
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3744
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3745
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3746
  %15 = load i32, i32* %count.addr, align 4, !dbg !3747
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3748
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3748
  %shr = lshr i32 %14, %15, !dbg !3748, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3749
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3750
  %17 = load i32, i32* %count.addr, align 4, !dbg !3751
  %sub23 = sub i32 32, %17, !dbg !3752
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3753
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3753
  %shl = shl i32 %16, %sub23, !dbg !3753, !klee.check.shift !268
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3754
  %or = or i32 %18, %shl, !dbg !3754
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3754
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3755
  %20 = load i32, i32* %count.addr, align 4, !dbg !3757
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3758
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3758
  %shr24 = lshr i32 %19, %20, !dbg !3758, !klee.check.shift !268
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3759
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3760

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3761
  %conv28 = zext i8 %21 to i32, !dbg !3761
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3764
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3765

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3766
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3769
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3770

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3771
  store i32 %23, i32* %retval, align 4, !dbg !3772
  br label %return, !dbg !3772

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3773
  br label %return, !dbg !3773

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3774
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3777
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3778

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3779
  %sub40 = sub i32 0, %25, !dbg !3780
  store i32 %sub40, i32* %retval, align 4, !dbg !3781
  br label %return, !dbg !3781

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3782
  br label %return, !dbg !3782

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3783
  br label %return, !dbg !3783

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3785
  ret i32 %26, !dbg !3785
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3786 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3787, metadata !DIExpression()), !dbg !3788
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3789, metadata !DIExpression()), !dbg !3790
  %0 = load i32, i32* %value.addr, align 4, !dbg !3791
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3792
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3793
  ret i32 %call, !dbg !3794
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3795 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3798, metadata !DIExpression()), !dbg !3799
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3800, metadata !DIExpression()), !dbg !3801
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3802, metadata !DIExpression()), !dbg !3803
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3804, metadata !DIExpression()), !dbg !3805
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3806, metadata !DIExpression()), !dbg !3807
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3808, metadata !DIExpression()), !dbg !3809
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3810, metadata !DIExpression()), !dbg !3811
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3812, metadata !DIExpression()), !dbg !3813
  %0 = load i32, i32* %value.addr, align 4, !dbg !3814
  %cmp = icmp slt i32 %0, 0, !dbg !3816
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3817

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3818
  %conv = zext i16 %1 to i32, !dbg !3818
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3819
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3820

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3821
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3822
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3823

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3824
  %conv6 = zext i16 %3 to i32, !dbg !3824
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3825
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3826

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3827
  br label %if.end, !dbg !3829

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3830
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3832
  %cmp9 = icmp slt i32 %4, 0, !dbg !3834
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3835

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3836
  %sub = sub nsw i32 0, %5, !dbg !3838
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3839
  br label %if.end13, !dbg !3840

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3841
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3843
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3844
  %conv14 = zext i16 %7 to i32, !dbg !3844
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3846
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3847

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3848
  %conv18 = zext i16 %8 to i32, !dbg !3848
  %sub19 = sub nsw i32 0, %conv18, !dbg !3850
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3851
  br label %if.end22, !dbg !3852

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3853
  %conv21 = zext i16 %9 to i32, !dbg !3853
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3855
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3856
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3857
  %mul = mul i32 %10, %11, !dbg !3858
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3859
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3860
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3861
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3862
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3863
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3864
  %15 = load i32, i32* %count.addr, align 4, !dbg !3865
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3866
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3866
  %shr = lshr i32 %14, %15, !dbg !3866, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3867
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3868
  %17 = load i32, i32* %count.addr, align 4, !dbg !3869
  %sub23 = sub i32 32, %17, !dbg !3870
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3871
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3871
  %shl = shl i32 %16, %sub23, !dbg !3871, !klee.check.shift !268
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3872
  %or = or i32 %18, %shl, !dbg !3872
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3872
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3873
  %20 = load i32, i32* %count.addr, align 4, !dbg !3875
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3876
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3876
  %shr24 = lshr i32 %19, %20, !dbg !3876, !klee.check.shift !268
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3877
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3878

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3879
  %conv28 = zext i8 %21 to i32, !dbg !3879
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3882
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3883

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3884
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3887
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3888

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3889
  store i32 %23, i32* %retval, align 4, !dbg !3890
  br label %return, !dbg !3890

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3891
  br label %return, !dbg !3891

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3892
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3895
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3896

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3897
  %sub40 = sub i32 0, %25, !dbg !3898
  store i32 %sub40, i32* %retval, align 4, !dbg !3899
  br label %return, !dbg !3899

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3900
  br label %return, !dbg !3900

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3901
  br label %return, !dbg !3901

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3903
  ret i32 %26, !dbg !3903
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3904 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3905, metadata !DIExpression()), !dbg !3906
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3907, metadata !DIExpression()), !dbg !3908
  %0 = load i32, i32* %value.addr, align 4, !dbg !3909
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3910
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3911
  ret i32 %call, !dbg !3912
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3913 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3916, metadata !DIExpression()), !dbg !3917
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3918, metadata !DIExpression()), !dbg !3919
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3920, metadata !DIExpression()), !dbg !3921
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3922, metadata !DIExpression()), !dbg !3923
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3924, metadata !DIExpression()), !dbg !3925
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3926, metadata !DIExpression()), !dbg !3927
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3928, metadata !DIExpression()), !dbg !3929
  %0 = load i32, i32* %value.addr, align 4, !dbg !3930
  %cmp = icmp slt i32 %0, 0, !dbg !3932
  br i1 %cmp, label %if.then, label %if.else, !dbg !3933

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3934
  %1 = load i32, i32* %value.addr, align 4, !dbg !3936
  %sub = sub nsw i32 0, %1, !dbg !3937
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3938
  br label %if.end, !dbg !3939

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3940
  %2 = load i32, i32* %value.addr, align 4, !dbg !3942
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3943
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3944
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3945
  %conv = zext i8 %4 to i32, !dbg !3945
  %mul = mul i32 %3, %conv, !dbg !3946
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3947
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3948
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3949
  %conv1 = zext i8 %6 to i32, !dbg !3949
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3950
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3951
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3952
  %8 = load i32, i32* %count.addr, align 4, !dbg !3953
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3954
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3954
  %shr = lshr i32 %7, %8, !dbg !3954, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3955
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3956
  %10 = load i32, i32* %count.addr, align 4, !dbg !3957
  %sub2 = sub i32 32, %10, !dbg !3958
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3959
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3959
  %shl = shl i32 %9, %sub2, !dbg !3959, !klee.check.shift !268
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3960
  %or = or i32 %11, %shl, !dbg !3960
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3960
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3961
  %13 = load i32, i32* %count.addr, align 4, !dbg !3963
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3964
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3964
  %shr3 = lshr i32 %12, %13, !dbg !3964, !klee.check.shift !268
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3965
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3966

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3967
  %conv7 = zext i8 %14 to i32, !dbg !3967
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3970
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3971

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3972
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3975
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3976

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3977
  store i32 %16, i32* %retval, align 4, !dbg !3978
  br label %return, !dbg !3978

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3979
  br label %return, !dbg !3979

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3980
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3983
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3984

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3985
  %sub19 = sub i32 0, %18, !dbg !3987
  store i32 %sub19, i32* %retval, align 4, !dbg !3988
  br label %return, !dbg !3988

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3989
  br label %return, !dbg !3989

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3991
  %conv22 = zext i8 %19 to i32, !dbg !3991
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3994
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3995

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3996
  br label %return, !dbg !3996

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3998
  br label %return, !dbg !3998

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !4000
  ret i32 %20, !dbg !4000
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !4001 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4002, metadata !DIExpression()), !dbg !4003
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4004, metadata !DIExpression()), !dbg !4005
  %0 = load i8, i8* %value.addr, align 1, !dbg !4006
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4007
  %conv = zext i8 %1 to i16, !dbg !4008
  %conv1 = zext i16 %conv to i32, !dbg !4008
  %shl = shl i32 %conv1, 5, !dbg !4009
  %conv2 = trunc i32 %shl to i16, !dbg !4010
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4011
  ret i8 %call, !dbg !4012
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4013 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4014, metadata !DIExpression()), !dbg !4015
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4016, metadata !DIExpression()), !dbg !4017
  %0 = load i8, i8* %value.addr, align 1, !dbg !4018
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4019
  %conv = zext i8 %1 to i16, !dbg !4020
  %conv1 = zext i16 %conv to i32, !dbg !4020
  %shl = shl i32 %conv1, 6, !dbg !4021
  %conv2 = trunc i32 %shl to i16, !dbg !4022
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4023
  ret i8 %call, !dbg !4024
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4025 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4026, metadata !DIExpression()), !dbg !4027
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4028, metadata !DIExpression()), !dbg !4029
  %0 = load i8, i8* %value.addr, align 1, !dbg !4030
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4031
  %conv = zext i8 %1 to i16, !dbg !4032
  %conv1 = zext i16 %conv to i32, !dbg !4032
  %shl = shl i32 %conv1, 7, !dbg !4033
  %conv2 = trunc i32 %shl to i16, !dbg !4034
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4035
  ret i8 %call, !dbg !4036
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4037 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4038, metadata !DIExpression()), !dbg !4039
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4040, metadata !DIExpression()), !dbg !4041
  %0 = load i8, i8* %value.addr, align 1, !dbg !4042
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4043
  %conv = zext i8 %1 to i16, !dbg !4044
  %conv1 = zext i16 %conv to i32, !dbg !4044
  %shl = shl i32 %conv1, 7, !dbg !4045
  %conv2 = trunc i32 %shl to i16, !dbg !4046
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4047
  ret i8 %call, !dbg !4048
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4049 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4050, metadata !DIExpression()), !dbg !4051
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4052, metadata !DIExpression()), !dbg !4053
  %0 = load i8, i8* %value.addr, align 1, !dbg !4054
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4055
  %conv = zext i8 %1 to i16, !dbg !4056
  %conv1 = zext i16 %conv to i32, !dbg !4056
  %shl = shl i32 %conv1, 4, !dbg !4057
  %conv2 = trunc i32 %shl to i16, !dbg !4058
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4059
  ret i8 %call, !dbg !4060
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4061 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4062, metadata !DIExpression()), !dbg !4063
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4064, metadata !DIExpression()), !dbg !4065
  %0 = load i8, i8* %value.addr, align 1, !dbg !4066
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4067
  %conv = zext i8 %1 to i16, !dbg !4068
  %conv1 = zext i16 %conv to i32, !dbg !4068
  %shl = shl i32 %conv1, 5, !dbg !4069
  %conv2 = trunc i32 %shl to i16, !dbg !4070
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4071
  ret i8 %call, !dbg !4072
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4073 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4074, metadata !DIExpression()), !dbg !4075
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4076, metadata !DIExpression()), !dbg !4077
  %0 = load i8, i8* %value.addr, align 1, !dbg !4078
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4079
  %conv = zext i8 %1 to i16, !dbg !4080
  %conv1 = zext i16 %conv to i32, !dbg !4080
  %shl = shl i32 %conv1, 2, !dbg !4081
  %conv2 = trunc i32 %shl to i16, !dbg !4082
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4083
  ret i8 %call, !dbg !4084
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4085 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4086, metadata !DIExpression()), !dbg !4087
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4088, metadata !DIExpression()), !dbg !4089
  %0 = load i8, i8* %value.addr, align 1, !dbg !4090
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4091
  %conv = zext i8 %1 to i16, !dbg !4092
  %conv1 = zext i16 %conv to i32, !dbg !4092
  %shl = shl i32 %conv1, 6, !dbg !4093
  %conv2 = trunc i32 %shl to i16, !dbg !4094
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4095
  ret i8 %call, !dbg !4096
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4097 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4098, metadata !DIExpression()), !dbg !4099
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4100, metadata !DIExpression()), !dbg !4101
  %0 = load i8, i8* %value.addr, align 1, !dbg !4102
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4103
  %conv = zext i8 %1 to i16, !dbg !4104
  %conv1 = zext i16 %conv to i32, !dbg !4104
  %shl = shl i32 %conv1, 3, !dbg !4105
  %conv2 = trunc i32 %shl to i16, !dbg !4106
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4107
  ret i8 %call, !dbg !4108
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4109 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4110, metadata !DIExpression()), !dbg !4111
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4112, metadata !DIExpression()), !dbg !4113
  %0 = load i16, i16* %value.addr, align 2, !dbg !4114
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4115
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4116
  ret i16 %call, !dbg !4117
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4118 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4119, metadata !DIExpression()), !dbg !4120
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4121, metadata !DIExpression()), !dbg !4122
  %0 = load i16, i16* %value.addr, align 2, !dbg !4123
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4124
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4125
  ret i16 %call, !dbg !4126
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4127 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4128, metadata !DIExpression()), !dbg !4129
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4130, metadata !DIExpression()), !dbg !4131
  %0 = load i16, i16* %value.addr, align 2, !dbg !4132
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4133
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4134
  ret i16 %call, !dbg !4135
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4136 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4137, metadata !DIExpression()), !dbg !4138
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4139, metadata !DIExpression()), !dbg !4140
  %0 = load i16, i16* %value.addr, align 2, !dbg !4141
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4142
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4143
  ret i16 %call, !dbg !4144
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4145 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4146, metadata !DIExpression()), !dbg !4147
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4148, metadata !DIExpression()), !dbg !4149
  %0 = load i16, i16* %value.addr, align 2, !dbg !4150
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4151
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4152
  ret i16 %call, !dbg !4153
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4154 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4155, metadata !DIExpression()), !dbg !4156
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4157, metadata !DIExpression()), !dbg !4158
  %0 = load i16, i16* %value.addr, align 2, !dbg !4159
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4160
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4161
  ret i16 %call, !dbg !4162
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4163 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4164, metadata !DIExpression()), !dbg !4165
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4166, metadata !DIExpression()), !dbg !4167
  %0 = load i16, i16* %value.addr, align 2, !dbg !4168
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4169
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4170
  ret i16 %call, !dbg !4171
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4172 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4173, metadata !DIExpression()), !dbg !4174
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4175, metadata !DIExpression()), !dbg !4176
  %0 = load i16, i16* %value.addr, align 2, !dbg !4177
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4178
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4179
  ret i16 %call, !dbg !4180
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4181 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4182, metadata !DIExpression()), !dbg !4183
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4184, metadata !DIExpression()), !dbg !4185
  %0 = load i16, i16* %value.addr, align 2, !dbg !4186
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4187
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4188
  ret i16 %call, !dbg !4189
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4190 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4191, metadata !DIExpression()), !dbg !4192
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4193, metadata !DIExpression()), !dbg !4194
  %0 = load i16, i16* %value.addr, align 2, !dbg !4195
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4196
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4197
  ret i16 %call, !dbg !4198
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4199 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4200, metadata !DIExpression()), !dbg !4201
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4202, metadata !DIExpression()), !dbg !4203
  %0 = load i16, i16* %value.addr, align 2, !dbg !4204
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4205
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4206
  ret i16 %call, !dbg !4207
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4208 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4209, metadata !DIExpression()), !dbg !4210
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4211, metadata !DIExpression()), !dbg !4212
  %0 = load i16, i16* %value.addr, align 2, !dbg !4213
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4214
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4215
  ret i16 %call, !dbg !4216
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4217 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4218, metadata !DIExpression()), !dbg !4219
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4220, metadata !DIExpression()), !dbg !4221
  %0 = load i16, i16* %value.addr, align 2, !dbg !4222
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4223
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4224
  ret i16 %call, !dbg !4225
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4226 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4227, metadata !DIExpression()), !dbg !4228
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4229, metadata !DIExpression()), !dbg !4230
  %0 = load i16, i16* %value.addr, align 2, !dbg !4231
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4232
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4233
  ret i16 %call, !dbg !4234
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4235 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4236, metadata !DIExpression()), !dbg !4237
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4238, metadata !DIExpression()), !dbg !4239
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4240
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4241
  %conv = zext i8 %1 to i16, !dbg !4242
  %conv1 = zext i16 %conv to i32, !dbg !4242
  %shl = shl i32 %conv1, 5, !dbg !4243
  %conv2 = trunc i32 %shl to i16, !dbg !4244
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4245
  ret i16 %call, !dbg !4246
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4247 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4248, metadata !DIExpression()), !dbg !4249
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4250, metadata !DIExpression()), !dbg !4251
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4252
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4253
  %conv = zext i8 %1 to i16, !dbg !4254
  %conv1 = zext i16 %conv to i32, !dbg !4254
  %shl = shl i32 %conv1, 6, !dbg !4255
  %conv2 = trunc i32 %shl to i16, !dbg !4256
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4257
  ret i16 %call, !dbg !4258
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4259 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4260, metadata !DIExpression()), !dbg !4261
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4262, metadata !DIExpression()), !dbg !4263
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4264
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4265
  %conv = zext i8 %1 to i16, !dbg !4266
  %conv1 = zext i16 %conv to i32, !dbg !4266
  %shl = shl i32 %conv1, 7, !dbg !4267
  %conv2 = trunc i32 %shl to i16, !dbg !4268
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4269
  ret i16 %call, !dbg !4270
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4271 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4272, metadata !DIExpression()), !dbg !4273
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4274, metadata !DIExpression()), !dbg !4275
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4276
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4277
  %conv = zext i8 %1 to i16, !dbg !4278
  %conv1 = zext i16 %conv to i32, !dbg !4278
  %shl = shl i32 %conv1, 7, !dbg !4279
  %conv2 = trunc i32 %shl to i16, !dbg !4280
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4281
  ret i16 %call, !dbg !4282
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4283 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4284, metadata !DIExpression()), !dbg !4285
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4286, metadata !DIExpression()), !dbg !4287
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4288
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4289
  %conv = zext i8 %1 to i16, !dbg !4290
  %conv1 = zext i16 %conv to i32, !dbg !4290
  %shl = shl i32 %conv1, 4, !dbg !4291
  %conv2 = trunc i32 %shl to i16, !dbg !4292
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4293
  ret i16 %call, !dbg !4294
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4295 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4296, metadata !DIExpression()), !dbg !4297
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4298, metadata !DIExpression()), !dbg !4299
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4300
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4301
  %conv = zext i8 %1 to i16, !dbg !4302
  %conv1 = zext i16 %conv to i32, !dbg !4302
  %shl = shl i32 %conv1, 5, !dbg !4303
  %conv2 = trunc i32 %shl to i16, !dbg !4304
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4305
  ret i16 %call, !dbg !4306
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4307 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4308, metadata !DIExpression()), !dbg !4309
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4310, metadata !DIExpression()), !dbg !4311
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4312
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4313
  %conv = zext i8 %1 to i16, !dbg !4314
  %conv1 = zext i16 %conv to i32, !dbg !4314
  %shl = shl i32 %conv1, 2, !dbg !4315
  %conv2 = trunc i32 %shl to i16, !dbg !4316
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4317
  ret i16 %call, !dbg !4318
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4319 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4320, metadata !DIExpression()), !dbg !4321
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4322, metadata !DIExpression()), !dbg !4323
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4324
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4325
  %conv = zext i8 %1 to i16, !dbg !4326
  %conv1 = zext i16 %conv to i32, !dbg !4326
  %shl = shl i32 %conv1, 6, !dbg !4327
  %conv2 = trunc i32 %shl to i16, !dbg !4328
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4329
  ret i16 %call, !dbg !4330
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4331 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4332, metadata !DIExpression()), !dbg !4333
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4334, metadata !DIExpression()), !dbg !4335
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4336
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4337
  %conv = zext i8 %1 to i16, !dbg !4338
  %conv1 = zext i16 %conv to i32, !dbg !4338
  %shl = shl i32 %conv1, 3, !dbg !4339
  %conv2 = trunc i32 %shl to i16, !dbg !4340
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4341
  ret i16 %call, !dbg !4342
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4343 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4344, metadata !DIExpression()), !dbg !4345
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4346, metadata !DIExpression()), !dbg !4347
  %0 = load i32, i32* %value.addr, align 4, !dbg !4348
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4349
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4350
  ret i32 %call, !dbg !4351
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4352 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4355, metadata !DIExpression()), !dbg !4356
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4357, metadata !DIExpression()), !dbg !4358
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4359, metadata !DIExpression()), !dbg !4360
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4361, metadata !DIExpression()), !dbg !4362
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4363, metadata !DIExpression()), !dbg !4364
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4365, metadata !DIExpression()), !dbg !4366
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4367, metadata !DIExpression()), !dbg !4368
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4369
  %conv = sext i16 %0 to i32, !dbg !4369
  %cmp = icmp slt i32 %conv, 0, !dbg !4371
  br i1 %cmp, label %if.then, label %if.else, !dbg !4372

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4373
  br label %if.end, !dbg !4375

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4376
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4378
  %conv2 = sext i16 %1 to i32, !dbg !4378
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4380
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4381

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4382
  %conv6 = sext i16 %2 to i32, !dbg !4382
  %sub = sub nsw i32 0, %conv6, !dbg !4384
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4385
  br label %if.end9, !dbg !4386

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4387
  %conv8 = sext i16 %3 to i32, !dbg !4387
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4389
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4390
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4391
  %mul = mul i32 %4, %5, !dbg !4392
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4393
  %6 = load i32, i32* %value.addr, align 4, !dbg !4394
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4395
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4396
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4397
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4398
  %9 = load i32, i32* %count.addr, align 4, !dbg !4399
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4400
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4400
  %shr = lshr i32 %8, %9, !dbg !4400, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4401
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4402
  %11 = load i32, i32* %count.addr, align 4, !dbg !4403
  %sub10 = sub i32 32, %11, !dbg !4404
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4405
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4405
  %shl = shl i32 %10, %sub10, !dbg !4405, !klee.check.shift !268
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4406
  %or = or i32 %12, %shl, !dbg !4406
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4406
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4407
  %14 = load i32, i32* %count.addr, align 4, !dbg !4409
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4410
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4410
  %shr11 = lshr i32 %13, %14, !dbg !4410, !klee.check.shift !268
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4411
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4412

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4413
  %conv15 = zext i8 %15 to i32, !dbg !4413
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4416
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4417

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4418
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4421
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4422

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4423
  store i32 %17, i32* %retval, align 4, !dbg !4424
  br label %return, !dbg !4424

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4425
  br label %return, !dbg !4425

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4426
  br label %return, !dbg !4426

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4428
  br label %return, !dbg !4428

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4430
  ret i32 %18, !dbg !4430
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4431 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4432, metadata !DIExpression()), !dbg !4433
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4434, metadata !DIExpression()), !dbg !4435
  %0 = load i32, i32* %value.addr, align 4, !dbg !4436
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4437
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4438
  ret i32 %call, !dbg !4439
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4440 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4443, metadata !DIExpression()), !dbg !4444
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4445, metadata !DIExpression()), !dbg !4446
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4447, metadata !DIExpression()), !dbg !4448
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4449, metadata !DIExpression()), !dbg !4450
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4451, metadata !DIExpression()), !dbg !4452
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4453, metadata !DIExpression()), !dbg !4454
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4455
  %cmp = icmp slt i32 %0, 0, !dbg !4457
  br i1 %cmp, label %if.then, label %if.else, !dbg !4458

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4459
  br label %if.end, !dbg !4461

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4462
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4464
  %cmp1 = icmp slt i32 %1, 0, !dbg !4466
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4467

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4468
  %sub = sub nsw i32 0, %2, !dbg !4470
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4471
  br label %if.end4, !dbg !4472

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4473
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4475
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4476
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4477
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4478
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4479
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4480
  %7 = load i32, i32* %count.addr, align 4, !dbg !4481
  %sub5 = sub i32 %7, 32, !dbg !4482
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4483
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4483
  %shr = lshr i32 %6, %sub5, !dbg !4483, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4484
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4485
  %conv = zext i8 %8 to i32, !dbg !4485
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4487
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4488

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4489
  store i32 %9, i32* %retval, align 4, !dbg !4491
  br label %return, !dbg !4491

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4492
  br label %return, !dbg !4492

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4494
  ret i32 %10, !dbg !4494
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4495 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4496, metadata !DIExpression()), !dbg !4497
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4498, metadata !DIExpression()), !dbg !4499
  %0 = load i32, i32* %value.addr, align 4, !dbg !4500
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4501
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4502
  ret i32 %call, !dbg !4503
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4504 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4507, metadata !DIExpression()), !dbg !4508
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4509, metadata !DIExpression()), !dbg !4510
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4511, metadata !DIExpression()), !dbg !4512
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4513, metadata !DIExpression()), !dbg !4514
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4515, metadata !DIExpression()), !dbg !4516
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4517, metadata !DIExpression()), !dbg !4518
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4519, metadata !DIExpression()), !dbg !4520
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4521
  %conv = sext i8 %0 to i32, !dbg !4521
  %cmp = icmp slt i32 %conv, 0, !dbg !4523
  br i1 %cmp, label %if.then, label %if.else, !dbg !4524

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4525
  br label %if.end, !dbg !4527

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4528
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4530
  %conv2 = sext i8 %1 to i32, !dbg !4530
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4532
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4533

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4534
  %conv6 = sext i8 %2 to i32, !dbg !4534
  %sub = sub nsw i32 0, %conv6, !dbg !4536
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4537
  br label %if.end9, !dbg !4538

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4539
  %conv8 = sext i8 %3 to i32, !dbg !4539
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4541
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4542
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4543
  %mul = mul i32 %4, %5, !dbg !4544
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4545
  %6 = load i32, i32* %value.addr, align 4, !dbg !4546
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4547
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4548
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4549
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4550
  %9 = load i32, i32* %count.addr, align 4, !dbg !4551
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4552
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4552
  %shr = lshr i32 %8, %9, !dbg !4552, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4553
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4554
  %11 = load i32, i32* %count.addr, align 4, !dbg !4555
  %sub10 = sub i32 32, %11, !dbg !4556
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4557
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4557
  %shl = shl i32 %10, %sub10, !dbg !4557, !klee.check.shift !268
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4558
  %or = or i32 %12, %shl, !dbg !4558
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4558
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4559
  %14 = load i32, i32* %count.addr, align 4, !dbg !4561
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4562
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4562
  %shr11 = lshr i32 %13, %14, !dbg !4562, !klee.check.shift !268
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4563
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4564

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4565
  %conv15 = zext i8 %15 to i32, !dbg !4565
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4568
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4569

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4570
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4573
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4574

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4575
  store i32 %17, i32* %retval, align 4, !dbg !4576
  br label %return, !dbg !4576

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4577
  br label %return, !dbg !4577

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4578
  br label %return, !dbg !4578

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4580
  br label %return, !dbg !4580

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4582
  ret i32 %18, !dbg !4582
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4583 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4584, metadata !DIExpression()), !dbg !4585
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4586, metadata !DIExpression()), !dbg !4587
  %0 = load i32, i32* %value.addr, align 4, !dbg !4588
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4589
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4590
  ret i32 %call, !dbg !4591
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4592 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4593, metadata !DIExpression()), !dbg !4594
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4595, metadata !DIExpression()), !dbg !4596
  %0 = load i32, i32* %value.addr, align 4, !dbg !4597
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4598
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4599
  ret i32 %call, !dbg !4600
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4601 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4604, metadata !DIExpression()), !dbg !4605
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4606, metadata !DIExpression()), !dbg !4607
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4608, metadata !DIExpression()), !dbg !4609
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4610, metadata !DIExpression()), !dbg !4611
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4612, metadata !DIExpression()), !dbg !4613
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4614, metadata !DIExpression()), !dbg !4615
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4616, metadata !DIExpression()), !dbg !4617
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4618, metadata !DIExpression()), !dbg !4619
  %0 = load i32, i32* %value.addr, align 4, !dbg !4620
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4621
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4622
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4623
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4624
  %3 = load i32, i32* %count.addr, align 4, !dbg !4625
  %sub = sub i32 %3, 32, !dbg !4626
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4627
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4627
  %shr = lshr i32 %2, %sub, !dbg !4627, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4628
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4629
  ret i32 %4, !dbg !4630
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4631 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4632, metadata !DIExpression()), !dbg !4633
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4634, metadata !DIExpression()), !dbg !4635
  %0 = load i32, i32* %value.addr, align 4, !dbg !4636
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4637
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4638
  ret i32 %call, !dbg !4639
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4640 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4643, metadata !DIExpression()), !dbg !4644
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4645, metadata !DIExpression()), !dbg !4646
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4647, metadata !DIExpression()), !dbg !4648
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4649, metadata !DIExpression()), !dbg !4650
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4651, metadata !DIExpression()), !dbg !4652
  %0 = load i32, i32* %value.addr, align 4, !dbg !4653
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4654
  %conv = zext i8 %1 to i32, !dbg !4654
  %mul = mul i32 %0, %conv, !dbg !4655
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4656
  %2 = load i32, i32* %value.addr, align 4, !dbg !4657
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4658
  %conv1 = zext i8 %3 to i32, !dbg !4658
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4659
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4660
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4661
  %5 = load i32, i32* %count.addr, align 4, !dbg !4662
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4663
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4663
  %shr = lshr i32 %4, %5, !dbg !4663, !klee.check.shift !268
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4664
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4665
  %7 = load i32, i32* %count.addr, align 4, !dbg !4666
  %sub = sub i32 32, %7, !dbg !4667
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4668
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4668
  %shl = shl i32 %6, %sub, !dbg !4668, !klee.check.shift !268
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4669
  %or = or i32 %8, %shl, !dbg !4669
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4669
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4670
  %10 = load i32, i32* %count.addr, align 4, !dbg !4672
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4673
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4673
  %shr2 = lshr i32 %9, %10, !dbg !4673, !klee.check.shift !268
  %cmp = icmp eq i32 %shr2, 0, !dbg !4674
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4675

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4676
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4679
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4680

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4681
  store i32 %12, i32* %retval, align 4, !dbg !4682
  br label %return, !dbg !4682

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4683
  br label %return, !dbg !4683

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4684
  br label %return, !dbg !4684

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4686
  ret i32 %13, !dbg !4686
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4687 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4688, metadata !DIExpression()), !dbg !4689
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4690, metadata !DIExpression()), !dbg !4691
  %0 = load i8, i8* %value.addr, align 1, !dbg !4692
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4693
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4694
  ret i8 %call, !dbg !4695
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4696 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4697, metadata !DIExpression()), !dbg !4698
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4699, metadata !DIExpression()), !dbg !4700
  %0 = load i8, i8* %value.addr, align 1, !dbg !4701
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4702
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4703
  ret i8 %call, !dbg !4704
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4705 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4706, metadata !DIExpression()), !dbg !4707
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4708, metadata !DIExpression()), !dbg !4709
  %0 = load i8, i8* %value.addr, align 1, !dbg !4710
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4711
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4712
  ret i8 %call, !dbg !4713
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4714 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4715, metadata !DIExpression()), !dbg !4716
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4717, metadata !DIExpression()), !dbg !4718
  %0 = load i8, i8* %value.addr, align 1, !dbg !4719
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4720
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4721
  ret i8 %call, !dbg !4722
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4723 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4724, metadata !DIExpression()), !dbg !4725
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4726, metadata !DIExpression()), !dbg !4727
  %0 = load i8, i8* %value.addr, align 1, !dbg !4728
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4729
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4730
  ret i8 %call, !dbg !4731
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4732 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4733, metadata !DIExpression()), !dbg !4734
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4735, metadata !DIExpression()), !dbg !4736
  %0 = load i8, i8* %value.addr, align 1, !dbg !4737
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4738
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4739
  ret i8 %call, !dbg !4740
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4741 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4742, metadata !DIExpression()), !dbg !4743
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4744, metadata !DIExpression()), !dbg !4745
  %0 = load i8, i8* %value.addr, align 1, !dbg !4746
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4747
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4748
  ret i8 %call, !dbg !4749
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4750 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4751, metadata !DIExpression()), !dbg !4752
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4753, metadata !DIExpression()), !dbg !4754
  %0 = load i8, i8* %value.addr, align 1, !dbg !4755
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4756
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4757
  ret i8 %call, !dbg !4758
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4759 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4760, metadata !DIExpression()), !dbg !4761
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4762, metadata !DIExpression()), !dbg !4763
  %0 = load i8, i8* %value.addr, align 1, !dbg !4764
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4765
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4766
  ret i8 %call, !dbg !4767
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4768 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4770, metadata !DIExpression()), !dbg !4771
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4772, metadata !DIExpression()), !dbg !4773
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4774, metadata !DIExpression()), !dbg !4775
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4776, metadata !DIExpression()), !dbg !4777
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4778, metadata !DIExpression()), !dbg !4779
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4780, metadata !DIExpression()), !dbg !4781
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4782, metadata !DIExpression()), !dbg !4783
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4784, metadata !DIExpression()), !dbg !4785
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4786, metadata !DIExpression()), !dbg !4787
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4788, metadata !DIExpression()), !dbg !4789
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4790, metadata !DIExpression()), !dbg !4791
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4792, metadata !DIExpression()), !dbg !4793
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4794
  %and = and i32 %0, 65535, !dbg !4795
  %conv = trunc i32 %and to i16, !dbg !4794
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4796
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4797
  %and1 = and i32 %1, -65536, !dbg !4798
  %shr = lshr i32 %and1, 16, !dbg !4799
  %conv2 = trunc i32 %shr to i16, !dbg !4800
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4801
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4802
  %and3 = and i32 %2, 65535, !dbg !4803
  %conv4 = trunc i32 %and3 to i16, !dbg !4802
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4804
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4805
  %and5 = and i32 %3, -65536, !dbg !4806
  %shr6 = lshr i32 %and5, 16, !dbg !4807
  %conv7 = trunc i32 %shr6 to i16, !dbg !4808
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4809
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4810
  %conv8 = zext i16 %4 to i32, !dbg !4810
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4811
  %conv9 = zext i16 %5 to i32, !dbg !4811
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4812
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4813
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4814
  %conv10 = zext i16 %6 to i32, !dbg !4814
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4815
  %conv11 = zext i16 %7 to i32, !dbg !4815
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4816
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4817
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4818
  %conv13 = zext i16 %8 to i32, !dbg !4818
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4819
  %conv14 = zext i16 %9 to i32, !dbg !4819
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4820
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4821
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4822
  %conv16 = zext i16 %10 to i32, !dbg !4822
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4823
  %conv17 = zext i16 %11 to i32, !dbg !4823
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4824
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4825
  %12 = load i32, i32* %MulTemp2, align 4, !dbg !4826
  %shr19 = lshr i32 %12, 16, !dbg !4827
  %13 = load i32, i32* %MulTemp3, align 4, !dbg !4828
  %shr20 = lshr i32 %13, 16, !dbg !4829
  %add = add i32 %shr19, %shr20, !dbg !4830
  %14 = load i32, i32* %MulTemp4, align 4, !dbg !4831
  %add21 = add i32 %add, %14, !dbg !4832
  store i32 %add21, i32* %HIGHWORD, align 4, !dbg !4833
  %15 = load i32, i32* %MulTemp1, align 4, !dbg !4834
  %shr22 = lshr i32 %15, 16, !dbg !4835
  %16 = load i32, i32* %MulTemp2, align 4, !dbg !4836
  %and23 = and i32 %16, 65535, !dbg !4837
  %add24 = add i32 %shr22, %and23, !dbg !4838
  %17 = load i32, i32* %MulTemp3, align 4, !dbg !4839
  %and25 = and i32 %17, 65535, !dbg !4840
  %add26 = add i32 %add24, %and25, !dbg !4841
  store i32 %add26, i32* %OverFlow, align 4, !dbg !4842
  %18 = load i32, i32* %OverFlow, align 4, !dbg !4843
  %cmp = icmp ugt i32 %18, 65535, !dbg !4845
  br i1 %cmp, label %if.then, label %if.else, !dbg !4846

if.then:                                          ; preds = %entry
  %19 = load i32, i32* %HIGHWORD, align 4, !dbg !4847
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4849
  %shr28 = lshr i32 %20, 16, !dbg !4850
  %add29 = add i32 %19, %shr28, !dbg !4851
  store i32 %add29, i32* %retval, align 4, !dbg !4852
  br label %return, !dbg !4852

if.else:                                          ; preds = %entry
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4853
  store i32 %21, i32* %retval, align 4, !dbg !4855
  br label %return, !dbg !4855

return:                                           ; preds = %if.else, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !4856
  ret i32 %22, !dbg !4856
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4857 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4858, metadata !DIExpression()), !dbg !4859
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4860, metadata !DIExpression()), !dbg !4861
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4862, metadata !DIExpression()), !dbg !4863
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4864, metadata !DIExpression()), !dbg !4865
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4866, metadata !DIExpression()), !dbg !4867
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4868, metadata !DIExpression()), !dbg !4869
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4870, metadata !DIExpression()), !dbg !4871
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4872, metadata !DIExpression()), !dbg !4873
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4874, metadata !DIExpression()), !dbg !4875
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4876, metadata !DIExpression()), !dbg !4877
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4878, metadata !DIExpression()), !dbg !4879
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4880, metadata !DIExpression()), !dbg !4881
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4882
  %and = and i32 %0, 65535, !dbg !4883
  %conv = trunc i32 %and to i16, !dbg !4882
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4884
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4885
  %and1 = and i32 %1, -65536, !dbg !4886
  %shr = lshr i32 %and1, 16, !dbg !4887
  %conv2 = trunc i32 %shr to i16, !dbg !4888
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4889
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4890
  %and3 = and i32 %2, 65535, !dbg !4891
  %conv4 = trunc i32 %and3 to i16, !dbg !4890
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4892
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4893
  %and5 = and i32 %3, -65536, !dbg !4894
  %shr6 = lshr i32 %and5, 16, !dbg !4895
  %conv7 = trunc i32 %shr6 to i16, !dbg !4896
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4897
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4898
  %conv8 = zext i16 %4 to i32, !dbg !4898
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4899
  %conv9 = zext i16 %5 to i32, !dbg !4899
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4900
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4901
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4902
  %conv10 = zext i16 %6 to i32, !dbg !4902
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4903
  %conv11 = zext i16 %7 to i32, !dbg !4903
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4904
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4905
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4906
  %conv13 = zext i16 %8 to i32, !dbg !4906
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4907
  %conv14 = zext i16 %9 to i32, !dbg !4907
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4908
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4909
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4910
  %conv16 = zext i16 %10 to i32, !dbg !4910
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4911
  %conv17 = zext i16 %11 to i32, !dbg !4911
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4912
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4913
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4914
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4915
  %and19 = and i32 %13, 65535, !dbg !4916
  %shl = shl i32 %and19, 16, !dbg !4917
  %add = add i32 %12, %shl, !dbg !4918
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4919
  %and20 = and i32 %14, 65535, !dbg !4920
  %shl21 = shl i32 %and20, 16, !dbg !4921
  %add22 = add i32 %add, %shl21, !dbg !4922
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4923
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4924
  ret i32 %15, !dbg !4925
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4926 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4932, metadata !DIExpression()), !dbg !4933
  %2 = icmp eq i64 %0, 0, !dbg !4934
  br i1 %2, label %3, label %4, !dbg !4936

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4937
  unreachable, !dbg !4937

4:                                                ; preds = %1
  ret void, !dbg !4938
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4939 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4945, metadata !DIExpression()), !dbg !4947
  call void @llvm.dbg.value(metadata i64 %1, metadata !4946, metadata !DIExpression()), !dbg !4947
  %3 = icmp ult i64 %1, %0, !dbg !4948
  br i1 %3, label %5, label %4, !dbg !4950

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4951
  unreachable, !dbg !4951

5:                                                ; preds = %2
  ret void, !dbg !4953
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/mul_Ccode_alarm_0001.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/MulHword_alarm_0001.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
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
!48 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
!49 = !DISubroutineType(types: !50)
!50 = !{!51}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DILocalVariable(name: "value", scope: !47, file: !48, line: 9, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !51)
!55 = !DILocation(line: 9, column: 13, scope: !47)
!56 = !DILocalVariable(name: "factor", scope: !47, file: !48, line: 10, type: !14)
!57 = !DILocation(line: 10, column: 13, scope: !47)
!58 = !DILocalVariable(name: "count", scope: !47, file: !48, line: 11, type: !59)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !61)
!61 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 11, column: 14, scope: !47)
!63 = !DILocalVariable(name: "result", scope: !47, file: !48, line: 12, type: !53)
!64 = !DILocation(line: 12, column: 13, scope: !47)
!65 = !DILocation(line: 14, column: 24, scope: !47)
!66 = !DILocation(line: 14, column: 5, scope: !47)
!67 = !DILocation(line: 15, column: 24, scope: !47)
!68 = !DILocation(line: 15, column: 5, scope: !47)
!69 = !DILocation(line: 16, column: 24, scope: !47)
!70 = !DILocation(line: 16, column: 5, scope: !47)
!71 = !DILocation(line: 18, column: 45, scope: !47)
!72 = !DILocation(line: 18, column: 52, scope: !47)
!73 = !DILocation(line: 18, column: 60, scope: !47)
!74 = !DILocation(line: 18, column: 14, scope: !47)
!75 = !DILocation(line: 18, column: 12, scope: !47)
!76 = !DILocation(line: 20, column: 11, scope: !47)
!77 = !DILocation(line: 21, column: 5, scope: !47)
!78 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !79, file: !79, line: 43, type: !80, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
!80 = !DISubroutineType(types: !81)
!81 = !{!6, !6, !22}
!82 = !DILocalVariable(name: "value", arg: 1, scope: !78, file: !79, line: 43, type: !6)
!83 = !DILocation(line: 43, column: 35, scope: !78)
!84 = !DILocalVariable(name: "factor", arg: 2, scope: !78, file: !79, line: 43, type: !22)
!85 = !DILocation(line: 43, column: 46, scope: !78)
!86 = !DILocalVariable(name: "s32MulTemp1", scope: !78, file: !79, line: 45, type: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !53)
!88 = !DILocation(line: 45, column: 6, scope: !78)
!89 = !DILocalVariable(name: "s32MulTemp2", scope: !78, file: !79, line: 45, type: !87)
!90 = !DILocation(line: 45, column: 24, scope: !78)
!91 = !DILocation(line: 46, column: 16, scope: !78)
!92 = !DILocation(line: 46, column: 24, scope: !78)
!93 = !DILocation(line: 46, column: 22, scope: !78)
!94 = !DILocation(line: 46, column: 14, scope: !78)
!95 = !DILocation(line: 48, column: 16, scope: !78)
!96 = !DILocation(line: 48, column: 28, scope: !78)
!97 = !DILocation(line: 48, column: 14, scope: !78)
!98 = !DILocation(line: 50, column: 6, scope: !99)
!99 = distinct !DILexicalBlock(scope: !78, file: !79, line: 50, column: 5)
!100 = !DILocation(line: 50, column: 17, scope: !99)
!101 = !DILocation(line: 50, column: 21, scope: !99)
!102 = !DILocation(line: 50, column: 25, scope: !99)
!103 = !DILocation(line: 50, column: 37, scope: !99)
!104 = !DILocation(line: 50, column: 46, scope: !99)
!105 = !DILocation(line: 50, column: 5, scope: !78)
!106 = !DILocation(line: 52, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !79, line: 51, column: 2)
!108 = !DILocation(line: 52, column: 29, scope: !107)
!109 = !DILocation(line: 52, column: 15, scope: !107)
!110 = !DILocation(line: 53, column: 14, scope: !107)
!111 = !DILocation(line: 53, column: 10, scope: !107)
!112 = !DILocation(line: 53, column: 3, scope: !107)
!113 = !DILocation(line: 57, column: 14, scope: !114)
!114 = distinct !DILexicalBlock(scope: !99, file: !79, line: 56, column: 2)
!115 = !DILocation(line: 57, column: 10, scope: !114)
!116 = !DILocation(line: 57, column: 3, scope: !114)
!117 = !DILocation(line: 59, column: 1, scope: !78)
!118 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !79, file: !79, line: 77, type: !80, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "value", arg: 1, scope: !118, file: !79, line: 77, type: !6)
!120 = !DILocation(line: 77, column: 38, scope: !118)
!121 = !DILocalVariable(name: "factor", arg: 2, scope: !118, file: !79, line: 77, type: !22)
!122 = !DILocation(line: 77, column: 49, scope: !118)
!123 = !DILocalVariable(name: "s32MulTemp1", scope: !118, file: !79, line: 79, type: !87)
!124 = !DILocation(line: 79, column: 6, scope: !118)
!125 = !DILocalVariable(name: "s32MulTemp2", scope: !118, file: !79, line: 79, type: !87)
!126 = !DILocation(line: 79, column: 24, scope: !118)
!127 = !DILocation(line: 80, column: 16, scope: !118)
!128 = !DILocation(line: 80, column: 24, scope: !118)
!129 = !DILocation(line: 80, column: 22, scope: !118)
!130 = !DILocation(line: 80, column: 14, scope: !118)
!131 = !DILocation(line: 81, column: 16, scope: !118)
!132 = !DILocation(line: 81, column: 28, scope: !118)
!133 = !DILocation(line: 81, column: 14, scope: !118)
!134 = !DILocation(line: 82, column: 6, scope: !135)
!135 = distinct !DILexicalBlock(scope: !118, file: !79, line: 82, column: 5)
!136 = !DILocation(line: 82, column: 17, scope: !135)
!137 = !DILocation(line: 82, column: 21, scope: !135)
!138 = !DILocation(line: 82, column: 25, scope: !135)
!139 = !DILocation(line: 82, column: 37, scope: !135)
!140 = !DILocation(line: 82, column: 44, scope: !135)
!141 = !DILocation(line: 82, column: 5, scope: !118)
!142 = !DILocation(line: 84, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !135, file: !79, line: 83, column: 2)
!144 = !DILocation(line: 84, column: 29, scope: !143)
!145 = !DILocation(line: 84, column: 15, scope: !143)
!146 = !DILocation(line: 85, column: 2, scope: !143)
!147 = !DILocation(line: 91, column: 5, scope: !148)
!148 = distinct !DILexicalBlock(scope: !118, file: !79, line: 91, column: 5)
!149 = !DILocation(line: 91, column: 17, scope: !148)
!150 = !DILocation(line: 91, column: 5, scope: !118)
!151 = !DILocation(line: 93, column: 6, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !79, line: 93, column: 6)
!153 = distinct !DILexicalBlock(scope: !148, file: !79, line: 92, column: 2)
!154 = !DILocation(line: 93, column: 18, scope: !152)
!155 = !DILocation(line: 93, column: 6, scope: !153)
!156 = !DILocation(line: 95, column: 15, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !79, line: 94, column: 3)
!158 = !DILocation(line: 95, column: 11, scope: !157)
!159 = !DILocation(line: 95, column: 4, scope: !157)
!160 = !DILocation(line: 99, column: 4, scope: !161)
!161 = distinct !DILexicalBlock(scope: !152, file: !79, line: 98, column: 3)
!162 = !DILocation(line: 104, column: 3, scope: !163)
!163 = distinct !DILexicalBlock(scope: !148, file: !79, line: 103, column: 2)
!164 = !DILocation(line: 106, column: 1, scope: !118)
!165 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !79, file: !79, line: 123, type: !166, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!166 = !DISubroutineType(types: !167)
!167 = !{!6, !6, !17}
!168 = !DILocalVariable(name: "value", arg: 1, scope: !165, file: !79, line: 123, type: !6)
!169 = !DILocation(line: 123, column: 25, scope: !165)
!170 = !DILocalVariable(name: "factor", arg: 2, scope: !165, file: !79, line: 123, type: !17)
!171 = !DILocation(line: 123, column: 35, scope: !165)
!172 = !DILocalVariable(name: "s32MulTemp1", scope: !165, file: !79, line: 125, type: !87)
!173 = !DILocation(line: 125, column: 6, scope: !165)
!174 = !DILocalVariable(name: "s32MulTemp2", scope: !165, file: !79, line: 125, type: !87)
!175 = !DILocation(line: 125, column: 24, scope: !165)
!176 = !DILocation(line: 126, column: 16, scope: !165)
!177 = !DILocation(line: 126, column: 24, scope: !165)
!178 = !DILocation(line: 126, column: 22, scope: !165)
!179 = !DILocation(line: 126, column: 14, scope: !165)
!180 = !DILocation(line: 127, column: 16, scope: !165)
!181 = !DILocation(line: 127, column: 28, scope: !165)
!182 = !DILocation(line: 127, column: 14, scope: !165)
!183 = !DILocation(line: 128, column: 6, scope: !184)
!184 = distinct !DILexicalBlock(scope: !165, file: !79, line: 128, column: 5)
!185 = !DILocation(line: 128, column: 17, scope: !184)
!186 = !DILocation(line: 128, column: 21, scope: !184)
!187 = !DILocation(line: 128, column: 25, scope: !184)
!188 = !DILocation(line: 128, column: 37, scope: !184)
!189 = !DILocation(line: 128, column: 44, scope: !184)
!190 = !DILocation(line: 128, column: 5, scope: !165)
!191 = !DILocation(line: 130, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !184, file: !79, line: 129, column: 2)
!193 = !DILocation(line: 130, column: 29, scope: !192)
!194 = !DILocation(line: 130, column: 15, scope: !192)
!195 = !DILocation(line: 131, column: 14, scope: !192)
!196 = !DILocation(line: 131, column: 10, scope: !192)
!197 = !DILocation(line: 131, column: 3, scope: !192)
!198 = !DILocation(line: 135, column: 14, scope: !199)
!199 = distinct !DILexicalBlock(scope: !184, file: !79, line: 134, column: 2)
!200 = !DILocation(line: 135, column: 10, scope: !199)
!201 = !DILocation(line: 135, column: 3, scope: !199)
!202 = !DILocation(line: 137, column: 1, scope: !165)
!203 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !79, file: !79, line: 155, type: !166, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!204 = !DILocalVariable(name: "value", arg: 1, scope: !203, file: !79, line: 155, type: !6)
!205 = !DILocation(line: 155, column: 25, scope: !203)
!206 = !DILocalVariable(name: "factor", arg: 2, scope: !203, file: !79, line: 155, type: !17)
!207 = !DILocation(line: 155, column: 35, scope: !203)
!208 = !DILocalVariable(name: "s32MulTemp1", scope: !203, file: !79, line: 157, type: !87)
!209 = !DILocation(line: 157, column: 6, scope: !203)
!210 = !DILocalVariable(name: "s32MulTemp2", scope: !203, file: !79, line: 157, type: !87)
!211 = !DILocation(line: 157, column: 24, scope: !203)
!212 = !DILocation(line: 158, column: 16, scope: !203)
!213 = !DILocation(line: 158, column: 24, scope: !203)
!214 = !DILocation(line: 158, column: 22, scope: !203)
!215 = !DILocation(line: 158, column: 14, scope: !203)
!216 = !DILocation(line: 159, column: 16, scope: !203)
!217 = !DILocation(line: 159, column: 28, scope: !203)
!218 = !DILocation(line: 159, column: 14, scope: !203)
!219 = !DILocation(line: 160, column: 6, scope: !220)
!220 = distinct !DILexicalBlock(scope: !203, file: !79, line: 160, column: 5)
!221 = !DILocation(line: 160, column: 17, scope: !220)
!222 = !DILocation(line: 160, column: 21, scope: !220)
!223 = !DILocation(line: 160, column: 25, scope: !220)
!224 = !DILocation(line: 160, column: 37, scope: !220)
!225 = !DILocation(line: 160, column: 44, scope: !220)
!226 = !DILocation(line: 160, column: 5, scope: !203)
!227 = !DILocation(line: 162, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !220, file: !79, line: 161, column: 2)
!229 = !DILocation(line: 162, column: 29, scope: !228)
!230 = !DILocation(line: 162, column: 15, scope: !228)
!231 = !DILocation(line: 163, column: 2, scope: !228)
!232 = !DILocation(line: 169, column: 5, scope: !233)
!233 = distinct !DILexicalBlock(scope: !203, file: !79, line: 169, column: 5)
!234 = !DILocation(line: 169, column: 17, scope: !233)
!235 = !DILocation(line: 169, column: 5, scope: !203)
!236 = !DILocation(line: 171, column: 6, scope: !237)
!237 = distinct !DILexicalBlock(scope: !238, file: !79, line: 171, column: 6)
!238 = distinct !DILexicalBlock(scope: !233, file: !79, line: 170, column: 2)
!239 = !DILocation(line: 171, column: 18, scope: !237)
!240 = !DILocation(line: 171, column: 6, scope: !238)
!241 = !DILocation(line: 173, column: 15, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !79, line: 172, column: 3)
!243 = !DILocation(line: 173, column: 11, scope: !242)
!244 = !DILocation(line: 173, column: 4, scope: !242)
!245 = !DILocation(line: 177, column: 4, scope: !246)
!246 = distinct !DILexicalBlock(scope: !237, file: !79, line: 176, column: 3)
!247 = !DILocation(line: 182, column: 3, scope: !248)
!248 = distinct !DILexicalBlock(scope: !233, file: !79, line: 181, column: 2)
!249 = !DILocation(line: 184, column: 1, scope: !203)
!250 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !79, file: !79, line: 200, type: !251, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!251 = !DISubroutineType(types: !252)
!252 = !{!13, !13, !13, !87}
!253 = !DILocalVariable(name: "value", arg: 1, scope: !250, file: !79, line: 200, type: !13)
!254 = !DILocation(line: 200, column: 40, scope: !250)
!255 = !DILocalVariable(name: "factor", arg: 2, scope: !250, file: !79, line: 200, type: !13)
!256 = !DILocation(line: 200, column: 51, scope: !250)
!257 = !DILocalVariable(name: "count", arg: 3, scope: !250, file: !79, line: 200, type: !87)
!258 = !DILocation(line: 200, column: 63, scope: !250)
!259 = !DILocalVariable(name: "s32MulTemp", scope: !250, file: !79, line: 202, type: !87)
!260 = !DILocation(line: 202, column: 6, scope: !250)
!261 = !DILocation(line: 203, column: 15, scope: !250)
!262 = !DILocation(line: 203, column: 23, scope: !250)
!263 = !DILocation(line: 203, column: 21, scope: !250)
!264 = !DILocation(line: 203, column: 13, scope: !250)
!265 = !DILocation(line: 204, column: 15, scope: !250)
!266 = !DILocation(line: 204, column: 26, scope: !250)
!267 = !DILocation(line: 204, column: 25, scope: !250)
!268 = !{!"True"}
!269 = !DILocation(line: 204, column: 13, scope: !250)
!270 = !DILocation(line: 205, column: 9, scope: !250)
!271 = !DILocation(line: 205, column: 2, scope: !250)
!272 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !79, file: !79, line: 223, type: !251, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!273 = !DILocalVariable(name: "value", arg: 1, scope: !272, file: !79, line: 223, type: !13)
!274 = !DILocation(line: 223, column: 43, scope: !272)
!275 = !DILocalVariable(name: "factor", arg: 2, scope: !272, file: !79, line: 223, type: !13)
!276 = !DILocation(line: 223, column: 54, scope: !272)
!277 = !DILocalVariable(name: "count", arg: 3, scope: !272, file: !79, line: 223, type: !87)
!278 = !DILocation(line: 223, column: 66, scope: !272)
!279 = !DILocalVariable(name: "s32MulTemp", scope: !272, file: !79, line: 225, type: !87)
!280 = !DILocation(line: 225, column: 6, scope: !272)
!281 = !DILocation(line: 226, column: 15, scope: !272)
!282 = !DILocation(line: 226, column: 23, scope: !272)
!283 = !DILocation(line: 226, column: 21, scope: !272)
!284 = !DILocation(line: 226, column: 13, scope: !272)
!285 = !DILocation(line: 227, column: 15, scope: !272)
!286 = !DILocation(line: 227, column: 26, scope: !272)
!287 = !DILocation(line: 227, column: 25, scope: !272)
!288 = !DILocation(line: 227, column: 13, scope: !272)
!289 = !DILocation(line: 228, column: 5, scope: !290)
!290 = distinct !DILexicalBlock(scope: !272, file: !79, line: 228, column: 5)
!291 = !DILocation(line: 228, column: 16, scope: !290)
!292 = !DILocation(line: 228, column: 5, scope: !272)
!293 = !DILocation(line: 230, column: 6, scope: !294)
!294 = distinct !DILexicalBlock(scope: !295, file: !79, line: 230, column: 6)
!295 = distinct !DILexicalBlock(scope: !290, file: !79, line: 229, column: 2)
!296 = !DILocation(line: 230, column: 17, scope: !294)
!297 = !DILocation(line: 230, column: 6, scope: !295)
!298 = !DILocation(line: 232, column: 16, scope: !299)
!299 = distinct !DILexicalBlock(scope: !294, file: !79, line: 231, column: 3)
!300 = !DILocation(line: 232, column: 11, scope: !299)
!301 = !DILocation(line: 232, column: 4, scope: !299)
!302 = !DILocation(line: 236, column: 4, scope: !303)
!303 = distinct !DILexicalBlock(scope: !294, file: !79, line: 235, column: 3)
!304 = !DILocation(line: 241, column: 3, scope: !305)
!305 = distinct !DILexicalBlock(scope: !290, file: !79, line: 240, column: 2)
!306 = !DILocation(line: 243, column: 1, scope: !272)
!307 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !79, file: !79, line: 262, type: !308, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!308 = !DISubroutineType(types: !309)
!309 = !{!13, !13, !13}
!310 = !DILocalVariable(name: "value", arg: 1, scope: !307, file: !79, line: 262, type: !13)
!311 = !DILocation(line: 262, column: 30, scope: !307)
!312 = !DILocalVariable(name: "factor", arg: 2, scope: !307, file: !79, line: 262, type: !13)
!313 = !DILocation(line: 262, column: 41, scope: !307)
!314 = !DILocalVariable(name: "s32MulTemp1", scope: !307, file: !79, line: 264, type: !87)
!315 = !DILocation(line: 264, column: 6, scope: !307)
!316 = !DILocalVariable(name: "s32MulTemp2", scope: !307, file: !79, line: 264, type: !87)
!317 = !DILocation(line: 264, column: 24, scope: !307)
!318 = !DILocation(line: 265, column: 16, scope: !307)
!319 = !DILocation(line: 265, column: 24, scope: !307)
!320 = !DILocation(line: 265, column: 22, scope: !307)
!321 = !DILocation(line: 265, column: 14, scope: !307)
!322 = !DILocation(line: 266, column: 16, scope: !307)
!323 = !DILocation(line: 266, column: 28, scope: !307)
!324 = !DILocation(line: 266, column: 14, scope: !307)
!325 = !DILocation(line: 267, column: 6, scope: !326)
!326 = distinct !DILexicalBlock(scope: !307, file: !79, line: 267, column: 5)
!327 = !DILocation(line: 267, column: 17, scope: !326)
!328 = !DILocation(line: 267, column: 21, scope: !326)
!329 = !DILocation(line: 267, column: 25, scope: !326)
!330 = !DILocation(line: 267, column: 37, scope: !326)
!331 = !DILocation(line: 267, column: 46, scope: !326)
!332 = !DILocation(line: 267, column: 5, scope: !307)
!333 = !DILocation(line: 269, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !326, file: !79, line: 268, column: 2)
!335 = !DILocation(line: 269, column: 29, scope: !334)
!336 = !DILocation(line: 269, column: 15, scope: !334)
!337 = !DILocation(line: 271, column: 2, scope: !334)
!338 = !DILocation(line: 277, column: 5, scope: !339)
!339 = distinct !DILexicalBlock(scope: !307, file: !79, line: 277, column: 5)
!340 = !DILocation(line: 277, column: 17, scope: !339)
!341 = !DILocation(line: 277, column: 5, scope: !307)
!342 = !DILocation(line: 279, column: 15, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !79, line: 278, column: 2)
!344 = !DILocation(line: 279, column: 10, scope: !343)
!345 = !DILocation(line: 279, column: 3, scope: !343)
!346 = !DILocation(line: 283, column: 3, scope: !347)
!347 = distinct !DILexicalBlock(scope: !339, file: !79, line: 282, column: 2)
!348 = !DILocation(line: 285, column: 1, scope: !307)
!349 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !79, file: !79, line: 304, type: !308, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!350 = !DILocalVariable(name: "value", arg: 1, scope: !349, file: !79, line: 304, type: !13)
!351 = !DILocation(line: 304, column: 30, scope: !349)
!352 = !DILocalVariable(name: "factor", arg: 2, scope: !349, file: !79, line: 304, type: !13)
!353 = !DILocation(line: 304, column: 41, scope: !349)
!354 = !DILocalVariable(name: "s32MulTemp1", scope: !349, file: !79, line: 306, type: !87)
!355 = !DILocation(line: 306, column: 6, scope: !349)
!356 = !DILocalVariable(name: "s32MulTemp2", scope: !349, file: !79, line: 306, type: !87)
!357 = !DILocation(line: 306, column: 24, scope: !349)
!358 = !DILocation(line: 307, column: 16, scope: !349)
!359 = !DILocation(line: 307, column: 24, scope: !349)
!360 = !DILocation(line: 307, column: 22, scope: !349)
!361 = !DILocation(line: 307, column: 14, scope: !349)
!362 = !DILocation(line: 308, column: 16, scope: !349)
!363 = !DILocation(line: 308, column: 28, scope: !349)
!364 = !DILocation(line: 308, column: 14, scope: !349)
!365 = !DILocation(line: 309, column: 6, scope: !366)
!366 = distinct !DILexicalBlock(scope: !349, file: !79, line: 309, column: 5)
!367 = !DILocation(line: 309, column: 17, scope: !366)
!368 = !DILocation(line: 309, column: 21, scope: !366)
!369 = !DILocation(line: 309, column: 25, scope: !366)
!370 = !DILocation(line: 309, column: 37, scope: !366)
!371 = !DILocation(line: 309, column: 46, scope: !366)
!372 = !DILocation(line: 309, column: 5, scope: !349)
!373 = !DILocation(line: 311, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !366, file: !79, line: 310, column: 2)
!375 = !DILocation(line: 311, column: 29, scope: !374)
!376 = !DILocation(line: 311, column: 15, scope: !374)
!377 = !DILocation(line: 312, column: 2, scope: !374)
!378 = !DILocation(line: 318, column: 6, scope: !379)
!379 = distinct !DILexicalBlock(scope: !349, file: !79, line: 318, column: 6)
!380 = !DILocation(line: 318, column: 18, scope: !379)
!381 = !DILocation(line: 318, column: 6, scope: !349)
!382 = !DILocation(line: 320, column: 6, scope: !383)
!383 = distinct !DILexicalBlock(scope: !384, file: !79, line: 320, column: 6)
!384 = distinct !DILexicalBlock(scope: !379, file: !79, line: 319, column: 2)
!385 = !DILocation(line: 320, column: 18, scope: !383)
!386 = !DILocation(line: 320, column: 6, scope: !384)
!387 = !DILocation(line: 322, column: 16, scope: !388)
!388 = distinct !DILexicalBlock(scope: !383, file: !79, line: 321, column: 3)
!389 = !DILocation(line: 322, column: 11, scope: !388)
!390 = !DILocation(line: 322, column: 4, scope: !388)
!391 = !DILocation(line: 326, column: 4, scope: !392)
!392 = distinct !DILexicalBlock(scope: !383, file: !79, line: 325, column: 3)
!393 = !DILocation(line: 331, column: 3, scope: !394)
!394 = distinct !DILexicalBlock(scope: !379, file: !79, line: 330, column: 2)
!395 = !DILocation(line: 333, column: 1, scope: !349)
!396 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !79, file: !79, line: 350, type: !397, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!397 = !DISubroutineType(types: !398)
!398 = !{!13, !13, !22}
!399 = !DILocalVariable(name: "value", arg: 1, scope: !396, file: !79, line: 350, type: !13)
!400 = !DILocation(line: 350, column: 39, scope: !396)
!401 = !DILocalVariable(name: "factor", arg: 2, scope: !396, file: !79, line: 350, type: !22)
!402 = !DILocation(line: 350, column: 50, scope: !396)
!403 = !DILocalVariable(name: "s32MulTemp1", scope: !396, file: !79, line: 352, type: !87)
!404 = !DILocation(line: 352, column: 6, scope: !396)
!405 = !DILocalVariable(name: "s32MulTemp2", scope: !396, file: !79, line: 352, type: !87)
!406 = !DILocation(line: 352, column: 24, scope: !396)
!407 = !DILocation(line: 353, column: 16, scope: !396)
!408 = !DILocation(line: 353, column: 24, scope: !396)
!409 = !DILocation(line: 353, column: 22, scope: !396)
!410 = !DILocation(line: 353, column: 14, scope: !396)
!411 = !DILocation(line: 354, column: 16, scope: !396)
!412 = !DILocation(line: 354, column: 28, scope: !396)
!413 = !DILocation(line: 354, column: 14, scope: !396)
!414 = !DILocation(line: 355, column: 6, scope: !415)
!415 = distinct !DILexicalBlock(scope: !396, file: !79, line: 355, column: 5)
!416 = !DILocation(line: 355, column: 17, scope: !415)
!417 = !DILocation(line: 355, column: 21, scope: !415)
!418 = !DILocation(line: 355, column: 25, scope: !415)
!419 = !DILocation(line: 355, column: 37, scope: !415)
!420 = !DILocation(line: 355, column: 46, scope: !415)
!421 = !DILocation(line: 355, column: 5, scope: !396)
!422 = !DILocation(line: 361, column: 17, scope: !423)
!423 = distinct !DILexicalBlock(scope: !415, file: !79, line: 360, column: 2)
!424 = !DILocation(line: 361, column: 29, scope: !423)
!425 = !DILocation(line: 361, column: 15, scope: !423)
!426 = !DILocation(line: 362, column: 15, scope: !423)
!427 = !DILocation(line: 362, column: 10, scope: !423)
!428 = !DILocation(line: 362, column: 3, scope: !423)
!429 = !DILocation(line: 366, column: 15, scope: !430)
!430 = distinct !DILexicalBlock(scope: !415, file: !79, line: 365, column: 2)
!431 = !DILocation(line: 366, column: 10, scope: !430)
!432 = !DILocation(line: 366, column: 3, scope: !430)
!433 = !DILocation(line: 368, column: 1, scope: !396)
!434 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !79, file: !79, line: 386, type: !397, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!435 = !DILocalVariable(name: "value", arg: 1, scope: !434, file: !79, line: 386, type: !13)
!436 = !DILocation(line: 386, column: 42, scope: !434)
!437 = !DILocalVariable(name: "factor", arg: 2, scope: !434, file: !79, line: 386, type: !22)
!438 = !DILocation(line: 386, column: 53, scope: !434)
!439 = !DILocalVariable(name: "s32MulTemp1", scope: !434, file: !79, line: 388, type: !87)
!440 = !DILocation(line: 388, column: 6, scope: !434)
!441 = !DILocalVariable(name: "s32MulTemp2", scope: !434, file: !79, line: 388, type: !87)
!442 = !DILocation(line: 388, column: 24, scope: !434)
!443 = !DILocation(line: 389, column: 16, scope: !434)
!444 = !DILocation(line: 389, column: 24, scope: !434)
!445 = !DILocation(line: 389, column: 22, scope: !434)
!446 = !DILocation(line: 389, column: 14, scope: !434)
!447 = !DILocation(line: 390, column: 16, scope: !434)
!448 = !DILocation(line: 390, column: 28, scope: !434)
!449 = !DILocation(line: 390, column: 14, scope: !434)
!450 = !DILocation(line: 391, column: 6, scope: !451)
!451 = distinct !DILexicalBlock(scope: !434, file: !79, line: 391, column: 5)
!452 = !DILocation(line: 391, column: 17, scope: !451)
!453 = !DILocation(line: 391, column: 21, scope: !451)
!454 = !DILocation(line: 391, column: 25, scope: !451)
!455 = !DILocation(line: 391, column: 37, scope: !451)
!456 = !DILocation(line: 391, column: 44, scope: !451)
!457 = !DILocation(line: 391, column: 5, scope: !434)
!458 = !DILocation(line: 398, column: 17, scope: !459)
!459 = distinct !DILexicalBlock(scope: !451, file: !79, line: 397, column: 2)
!460 = !DILocation(line: 398, column: 29, scope: !459)
!461 = !DILocation(line: 398, column: 15, scope: !459)
!462 = !DILocation(line: 399, column: 2, scope: !459)
!463 = !DILocation(line: 404, column: 5, scope: !464)
!464 = distinct !DILexicalBlock(scope: !434, file: !79, line: 404, column: 5)
!465 = !DILocation(line: 404, column: 17, scope: !464)
!466 = !DILocation(line: 404, column: 5, scope: !434)
!467 = !DILocation(line: 406, column: 6, scope: !468)
!468 = distinct !DILexicalBlock(scope: !469, file: !79, line: 406, column: 6)
!469 = distinct !DILexicalBlock(scope: !464, file: !79, line: 405, column: 2)
!470 = !DILocation(line: 406, column: 18, scope: !468)
!471 = !DILocation(line: 406, column: 6, scope: !469)
!472 = !DILocation(line: 408, column: 16, scope: !473)
!473 = distinct !DILexicalBlock(scope: !468, file: !79, line: 407, column: 3)
!474 = !DILocation(line: 408, column: 11, scope: !473)
!475 = !DILocation(line: 408, column: 4, scope: !473)
!476 = !DILocation(line: 412, column: 4, scope: !477)
!477 = distinct !DILexicalBlock(scope: !468, file: !79, line: 411, column: 3)
!478 = !DILocation(line: 417, column: 3, scope: !479)
!479 = distinct !DILexicalBlock(scope: !464, file: !79, line: 416, column: 2)
!480 = !DILocation(line: 419, column: 1, scope: !434)
!481 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !79, file: !79, line: 436, type: !482, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!482 = !DISubroutineType(types: !483)
!483 = !{!13, !13, !17}
!484 = !DILocalVariable(name: "value", arg: 1, scope: !481, file: !79, line: 436, type: !13)
!485 = !DILocation(line: 436, column: 29, scope: !481)
!486 = !DILocalVariable(name: "factor", arg: 2, scope: !481, file: !79, line: 436, type: !17)
!487 = !DILocation(line: 436, column: 39, scope: !481)
!488 = !DILocalVariable(name: "s32MulTemp1", scope: !481, file: !79, line: 438, type: !87)
!489 = !DILocation(line: 438, column: 6, scope: !481)
!490 = !DILocalVariable(name: "s32MulTemp2", scope: !481, file: !79, line: 438, type: !87)
!491 = !DILocation(line: 438, column: 24, scope: !481)
!492 = !DILocation(line: 439, column: 16, scope: !481)
!493 = !DILocation(line: 439, column: 24, scope: !481)
!494 = !DILocation(line: 439, column: 22, scope: !481)
!495 = !DILocation(line: 439, column: 14, scope: !481)
!496 = !DILocation(line: 440, column: 16, scope: !481)
!497 = !DILocation(line: 440, column: 28, scope: !481)
!498 = !DILocation(line: 440, column: 14, scope: !481)
!499 = !DILocation(line: 441, column: 6, scope: !500)
!500 = distinct !DILexicalBlock(scope: !481, file: !79, line: 441, column: 5)
!501 = !DILocation(line: 441, column: 17, scope: !500)
!502 = !DILocation(line: 441, column: 21, scope: !500)
!503 = !DILocation(line: 441, column: 25, scope: !500)
!504 = !DILocation(line: 441, column: 37, scope: !500)
!505 = !DILocation(line: 441, column: 44, scope: !500)
!506 = !DILocation(line: 441, column: 5, scope: !481)
!507 = !DILocation(line: 448, column: 17, scope: !508)
!508 = distinct !DILexicalBlock(scope: !500, file: !79, line: 447, column: 2)
!509 = !DILocation(line: 448, column: 29, scope: !508)
!510 = !DILocation(line: 448, column: 15, scope: !508)
!511 = !DILocation(line: 449, column: 10, scope: !508)
!512 = !DILocation(line: 449, column: 3, scope: !508)
!513 = !DILocation(line: 453, column: 10, scope: !514)
!514 = distinct !DILexicalBlock(scope: !500, file: !79, line: 452, column: 2)
!515 = !DILocation(line: 453, column: 3, scope: !514)
!516 = !DILocation(line: 455, column: 1, scope: !481)
!517 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !79, file: !79, line: 473, type: !482, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!518 = !DILocalVariable(name: "value", arg: 1, scope: !517, file: !79, line: 473, type: !13)
!519 = !DILocation(line: 473, column: 29, scope: !517)
!520 = !DILocalVariable(name: "factor", arg: 2, scope: !517, file: !79, line: 473, type: !17)
!521 = !DILocation(line: 473, column: 39, scope: !517)
!522 = !DILocalVariable(name: "s32MulTemp1", scope: !517, file: !79, line: 475, type: !87)
!523 = !DILocation(line: 475, column: 6, scope: !517)
!524 = !DILocalVariable(name: "s32MulTemp2", scope: !517, file: !79, line: 475, type: !87)
!525 = !DILocation(line: 475, column: 24, scope: !517)
!526 = !DILocation(line: 476, column: 16, scope: !517)
!527 = !DILocation(line: 476, column: 24, scope: !517)
!528 = !DILocation(line: 476, column: 22, scope: !517)
!529 = !DILocation(line: 476, column: 14, scope: !517)
!530 = !DILocation(line: 477, column: 16, scope: !517)
!531 = !DILocation(line: 477, column: 28, scope: !517)
!532 = !DILocation(line: 477, column: 14, scope: !517)
!533 = !DILocation(line: 478, column: 6, scope: !534)
!534 = distinct !DILexicalBlock(scope: !517, file: !79, line: 478, column: 5)
!535 = !DILocation(line: 478, column: 17, scope: !534)
!536 = !DILocation(line: 478, column: 21, scope: !534)
!537 = !DILocation(line: 478, column: 25, scope: !534)
!538 = !DILocation(line: 478, column: 37, scope: !534)
!539 = !DILocation(line: 478, column: 44, scope: !534)
!540 = !DILocation(line: 478, column: 5, scope: !517)
!541 = !DILocation(line: 484, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !534, file: !79, line: 483, column: 2)
!543 = !DILocation(line: 484, column: 29, scope: !542)
!544 = !DILocation(line: 484, column: 15, scope: !542)
!545 = !DILocation(line: 485, column: 2, scope: !542)
!546 = !DILocation(line: 491, column: 6, scope: !547)
!547 = distinct !DILexicalBlock(scope: !517, file: !79, line: 491, column: 6)
!548 = !DILocation(line: 491, column: 18, scope: !547)
!549 = !DILocation(line: 491, column: 6, scope: !517)
!550 = !DILocation(line: 493, column: 6, scope: !551)
!551 = distinct !DILexicalBlock(scope: !552, file: !79, line: 493, column: 6)
!552 = distinct !DILexicalBlock(scope: !547, file: !79, line: 492, column: 2)
!553 = !DILocation(line: 493, column: 18, scope: !551)
!554 = !DILocation(line: 493, column: 6, scope: !552)
!555 = !DILocation(line: 495, column: 16, scope: !556)
!556 = distinct !DILexicalBlock(scope: !551, file: !79, line: 494, column: 3)
!557 = !DILocation(line: 495, column: 11, scope: !556)
!558 = !DILocation(line: 495, column: 4, scope: !556)
!559 = !DILocation(line: 499, column: 4, scope: !560)
!560 = distinct !DILexicalBlock(scope: !551, file: !79, line: 498, column: 3)
!561 = !DILocation(line: 504, column: 3, scope: !562)
!562 = distinct !DILexicalBlock(scope: !547, file: !79, line: 503, column: 2)
!563 = !DILocation(line: 506, column: 1, scope: !517)
!564 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !79, file: !79, line: 521, type: !397, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!565 = !DILocalVariable(name: "value", arg: 1, scope: !564, file: !79, line: 521, type: !13)
!566 = !DILocation(line: 521, column: 25, scope: !564)
!567 = !DILocalVariable(name: "factor", arg: 2, scope: !564, file: !79, line: 521, type: !22)
!568 = !DILocation(line: 521, column: 36, scope: !564)
!569 = !DILocalVariable(name: "s32MulTemp", scope: !564, file: !79, line: 523, type: !87)
!570 = !DILocation(line: 523, column: 6, scope: !564)
!571 = !DILocation(line: 524, column: 15, scope: !564)
!572 = !DILocation(line: 524, column: 23, scope: !564)
!573 = !DILocation(line: 524, column: 21, scope: !564)
!574 = !DILocation(line: 524, column: 13, scope: !564)
!575 = !DILocation(line: 525, column: 5, scope: !576)
!576 = distinct !DILexicalBlock(scope: !564, file: !79, line: 525, column: 5)
!577 = !DILocation(line: 525, column: 16, scope: !576)
!578 = !DILocation(line: 525, column: 5, scope: !564)
!579 = !DILocation(line: 527, column: 6, scope: !580)
!580 = distinct !DILexicalBlock(scope: !581, file: !79, line: 527, column: 6)
!581 = distinct !DILexicalBlock(scope: !576, file: !79, line: 526, column: 2)
!582 = !DILocation(line: 527, column: 17, scope: !580)
!583 = !DILocation(line: 527, column: 6, scope: !581)
!584 = !DILocation(line: 529, column: 16, scope: !585)
!585 = distinct !DILexicalBlock(scope: !580, file: !79, line: 528, column: 3)
!586 = !DILocation(line: 529, column: 11, scope: !585)
!587 = !DILocation(line: 529, column: 4, scope: !585)
!588 = !DILocation(line: 533, column: 4, scope: !589)
!589 = distinct !DILexicalBlock(scope: !580, file: !79, line: 532, column: 3)
!590 = !DILocation(line: 538, column: 3, scope: !591)
!591 = distinct !DILexicalBlock(scope: !576, file: !79, line: 537, column: 2)
!592 = !DILocation(line: 540, column: 1, scope: !564)
!593 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !79, file: !79, line: 556, type: !594, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!594 = !DISubroutineType(types: !595)
!595 = !{!13, !13, !22, !87}
!596 = !DILocalVariable(name: "value", arg: 1, scope: !593, file: !79, line: 556, type: !13)
!597 = !DILocation(line: 556, column: 40, scope: !593)
!598 = !DILocalVariable(name: "factor", arg: 2, scope: !593, file: !79, line: 556, type: !22)
!599 = !DILocation(line: 556, column: 50, scope: !593)
!600 = !DILocalVariable(name: "count", arg: 3, scope: !593, file: !79, line: 556, type: !87)
!601 = !DILocation(line: 556, column: 61, scope: !593)
!602 = !DILocalVariable(name: "s32MulTemp", scope: !593, file: !79, line: 558, type: !87)
!603 = !DILocation(line: 558, column: 6, scope: !593)
!604 = !DILocation(line: 559, column: 15, scope: !593)
!605 = !DILocation(line: 559, column: 23, scope: !593)
!606 = !DILocation(line: 559, column: 21, scope: !593)
!607 = !DILocation(line: 559, column: 13, scope: !593)
!608 = !DILocation(line: 560, column: 15, scope: !593)
!609 = !DILocation(line: 560, column: 26, scope: !593)
!610 = !DILocation(line: 560, column: 25, scope: !593)
!611 = !DILocation(line: 560, column: 13, scope: !593)
!612 = !DILocation(line: 561, column: 14, scope: !593)
!613 = !DILocation(line: 561, column: 9, scope: !593)
!614 = !DILocation(line: 561, column: 2, scope: !593)
!615 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !79, file: !79, line: 580, type: !616, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!616 = !DISubroutineType(types: !617)
!617 = !{!13, !13, !22, !22}
!618 = !DILocalVariable(name: "value", arg: 1, scope: !615, file: !79, line: 580, type: !13)
!619 = !DILocation(line: 580, column: 43, scope: !615)
!620 = !DILocalVariable(name: "factor", arg: 2, scope: !615, file: !79, line: 580, type: !22)
!621 = !DILocation(line: 580, column: 53, scope: !615)
!622 = !DILocalVariable(name: "count", arg: 3, scope: !615, file: !79, line: 580, type: !22)
!623 = !DILocation(line: 580, column: 64, scope: !615)
!624 = !DILocalVariable(name: "s32MulTemp", scope: !615, file: !79, line: 582, type: !87)
!625 = !DILocation(line: 582, column: 6, scope: !615)
!626 = !DILocation(line: 583, column: 15, scope: !615)
!627 = !DILocation(line: 583, column: 23, scope: !615)
!628 = !DILocation(line: 583, column: 21, scope: !615)
!629 = !DILocation(line: 583, column: 13, scope: !615)
!630 = !DILocation(line: 584, column: 15, scope: !615)
!631 = !DILocation(line: 584, column: 26, scope: !615)
!632 = !DILocation(line: 584, column: 25, scope: !615)
!633 = !DILocation(line: 584, column: 13, scope: !615)
!634 = !DILocation(line: 585, column: 5, scope: !635)
!635 = distinct !DILexicalBlock(scope: !615, file: !79, line: 585, column: 5)
!636 = !DILocation(line: 585, column: 16, scope: !635)
!637 = !DILocation(line: 585, column: 5, scope: !615)
!638 = !DILocation(line: 587, column: 6, scope: !639)
!639 = distinct !DILexicalBlock(scope: !640, file: !79, line: 587, column: 6)
!640 = distinct !DILexicalBlock(scope: !635, file: !79, line: 586, column: 2)
!641 = !DILocation(line: 587, column: 17, scope: !639)
!642 = !DILocation(line: 587, column: 6, scope: !640)
!643 = !DILocation(line: 589, column: 16, scope: !644)
!644 = distinct !DILexicalBlock(scope: !639, file: !79, line: 588, column: 3)
!645 = !DILocation(line: 589, column: 11, scope: !644)
!646 = !DILocation(line: 589, column: 4, scope: !644)
!647 = !DILocation(line: 593, column: 4, scope: !648)
!648 = distinct !DILexicalBlock(scope: !639, file: !79, line: 592, column: 3)
!649 = !DILocation(line: 598, column: 3, scope: !650)
!650 = distinct !DILexicalBlock(scope: !635, file: !79, line: 597, column: 2)
!651 = !DILocation(line: 600, column: 1, scope: !615)
!652 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !79, file: !79, line: 617, type: !397, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!653 = !DILocalVariable(name: "value", arg: 1, scope: !652, file: !79, line: 617, type: !13)
!654 = !DILocation(line: 617, column: 31, scope: !652)
!655 = !DILocalVariable(name: "factor", arg: 2, scope: !652, file: !79, line: 617, type: !22)
!656 = !DILocation(line: 617, column: 42, scope: !652)
!657 = !DILocalVariable(name: "s32MulTemp1", scope: !652, file: !79, line: 619, type: !87)
!658 = !DILocation(line: 619, column: 6, scope: !652)
!659 = !DILocalVariable(name: "s32MulTemp2", scope: !652, file: !79, line: 619, type: !87)
!660 = !DILocation(line: 619, column: 24, scope: !652)
!661 = !DILocation(line: 620, column: 16, scope: !652)
!662 = !DILocation(line: 620, column: 24, scope: !652)
!663 = !DILocation(line: 620, column: 22, scope: !652)
!664 = !DILocation(line: 620, column: 14, scope: !652)
!665 = !DILocation(line: 621, column: 16, scope: !652)
!666 = !DILocation(line: 621, column: 28, scope: !652)
!667 = !DILocation(line: 621, column: 14, scope: !652)
!668 = !DILocation(line: 622, column: 6, scope: !669)
!669 = distinct !DILexicalBlock(scope: !652, file: !79, line: 622, column: 5)
!670 = !DILocation(line: 622, column: 17, scope: !669)
!671 = !DILocation(line: 622, column: 21, scope: !669)
!672 = !DILocation(line: 622, column: 25, scope: !669)
!673 = !DILocation(line: 622, column: 37, scope: !669)
!674 = !DILocation(line: 622, column: 46, scope: !669)
!675 = !DILocation(line: 622, column: 5, scope: !652)
!676 = !DILocation(line: 629, column: 17, scope: !677)
!677 = distinct !DILexicalBlock(scope: !669, file: !79, line: 628, column: 2)
!678 = !DILocation(line: 629, column: 29, scope: !677)
!679 = !DILocation(line: 629, column: 15, scope: !677)
!680 = !DILocation(line: 630, column: 15, scope: !677)
!681 = !DILocation(line: 630, column: 10, scope: !677)
!682 = !DILocation(line: 630, column: 3, scope: !677)
!683 = !DILocation(line: 634, column: 15, scope: !684)
!684 = distinct !DILexicalBlock(scope: !669, file: !79, line: 633, column: 2)
!685 = !DILocation(line: 634, column: 10, scope: !684)
!686 = !DILocation(line: 634, column: 3, scope: !684)
!687 = !DILocation(line: 636, column: 1, scope: !652)
!688 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !79, file: !79, line: 654, type: !397, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!689 = !DILocalVariable(name: "value", arg: 1, scope: !688, file: !79, line: 654, type: !13)
!690 = !DILocation(line: 654, column: 31, scope: !688)
!691 = !DILocalVariable(name: "factor", arg: 2, scope: !688, file: !79, line: 654, type: !22)
!692 = !DILocation(line: 654, column: 42, scope: !688)
!693 = !DILocalVariable(name: "s32MulTemp1", scope: !688, file: !79, line: 656, type: !87)
!694 = !DILocation(line: 656, column: 6, scope: !688)
!695 = !DILocalVariable(name: "s32MulTemp2", scope: !688, file: !79, line: 656, type: !87)
!696 = !DILocation(line: 656, column: 24, scope: !688)
!697 = !DILocation(line: 657, column: 16, scope: !688)
!698 = !DILocation(line: 657, column: 24, scope: !688)
!699 = !DILocation(line: 657, column: 22, scope: !688)
!700 = !DILocation(line: 657, column: 14, scope: !688)
!701 = !DILocation(line: 658, column: 16, scope: !688)
!702 = !DILocation(line: 658, column: 28, scope: !688)
!703 = !DILocation(line: 658, column: 14, scope: !688)
!704 = !DILocation(line: 659, column: 6, scope: !705)
!705 = distinct !DILexicalBlock(scope: !688, file: !79, line: 659, column: 5)
!706 = !DILocation(line: 659, column: 17, scope: !705)
!707 = !DILocation(line: 659, column: 21, scope: !705)
!708 = !DILocation(line: 659, column: 25, scope: !705)
!709 = !DILocation(line: 659, column: 37, scope: !705)
!710 = !DILocation(line: 659, column: 46, scope: !705)
!711 = !DILocation(line: 659, column: 5, scope: !688)
!712 = !DILocation(line: 665, column: 17, scope: !713)
!713 = distinct !DILexicalBlock(scope: !705, file: !79, line: 664, column: 2)
!714 = !DILocation(line: 665, column: 29, scope: !713)
!715 = !DILocation(line: 665, column: 15, scope: !713)
!716 = !DILocation(line: 666, column: 2, scope: !713)
!717 = !DILocation(line: 672, column: 6, scope: !718)
!718 = distinct !DILexicalBlock(scope: !688, file: !79, line: 672, column: 6)
!719 = !DILocation(line: 672, column: 18, scope: !718)
!720 = !DILocation(line: 672, column: 6, scope: !688)
!721 = !DILocation(line: 674, column: 6, scope: !722)
!722 = distinct !DILexicalBlock(scope: !723, file: !79, line: 674, column: 6)
!723 = distinct !DILexicalBlock(scope: !718, file: !79, line: 673, column: 2)
!724 = !DILocation(line: 674, column: 18, scope: !722)
!725 = !DILocation(line: 674, column: 6, scope: !723)
!726 = !DILocation(line: 676, column: 16, scope: !727)
!727 = distinct !DILexicalBlock(scope: !722, file: !79, line: 675, column: 3)
!728 = !DILocation(line: 676, column: 11, scope: !727)
!729 = !DILocation(line: 676, column: 4, scope: !727)
!730 = !DILocation(line: 680, column: 4, scope: !731)
!731 = distinct !DILexicalBlock(scope: !722, file: !79, line: 679, column: 3)
!732 = !DILocation(line: 685, column: 3, scope: !733)
!733 = distinct !DILexicalBlock(scope: !718, file: !79, line: 684, column: 2)
!734 = !DILocation(line: 687, column: 1, scope: !688)
!735 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !79, file: !79, line: 704, type: !736, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!736 = !DISubroutineType(types: !737)
!737 = !{!13, !22, !22}
!738 = !DILocalVariable(name: "value", arg: 1, scope: !735, file: !79, line: 704, type: !22)
!739 = !DILocation(line: 704, column: 33, scope: !735)
!740 = !DILocalVariable(name: "factor", arg: 2, scope: !735, file: !79, line: 704, type: !22)
!741 = !DILocation(line: 704, column: 44, scope: !735)
!742 = !DILocalVariable(name: "u32MulTemp", scope: !735, file: !79, line: 706, type: !743)
!743 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !59)
!744 = !DILocation(line: 706, column: 6, scope: !735)
!745 = !DILocation(line: 707, column: 15, scope: !735)
!746 = !DILocation(line: 707, column: 23, scope: !735)
!747 = !DILocation(line: 707, column: 21, scope: !735)
!748 = !DILocation(line: 707, column: 13, scope: !735)
!749 = !DILocation(line: 708, column: 15, scope: !735)
!750 = !DILocation(line: 708, column: 26, scope: !735)
!751 = !DILocation(line: 708, column: 13, scope: !735)
!752 = !DILocation(line: 709, column: 5, scope: !753)
!753 = distinct !DILexicalBlock(scope: !735, file: !79, line: 709, column: 5)
!754 = !DILocation(line: 709, column: 16, scope: !753)
!755 = !DILocation(line: 709, column: 5, scope: !735)
!756 = !DILocation(line: 711, column: 15, scope: !757)
!757 = distinct !DILexicalBlock(scope: !753, file: !79, line: 710, column: 2)
!758 = !DILocation(line: 711, column: 10, scope: !757)
!759 = !DILocation(line: 711, column: 3, scope: !757)
!760 = !DILocation(line: 715, column: 3, scope: !761)
!761 = distinct !DILexicalBlock(scope: !753, file: !79, line: 714, column: 2)
!762 = !DILocation(line: 717, column: 1, scope: !735)
!763 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !79, file: !79, line: 732, type: !764, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!764 = !DISubroutineType(types: !765)
!765 = !{!87, !13, !22}
!766 = !DILocalVariable(name: "value", arg: 1, scope: !763, file: !79, line: 732, type: !13)
!767 = !DILocation(line: 732, column: 25, scope: !763)
!768 = !DILocalVariable(name: "factor", arg: 2, scope: !763, file: !79, line: 732, type: !22)
!769 = !DILocation(line: 732, column: 36, scope: !763)
!770 = !DILocalVariable(name: "s32MulTemp", scope: !763, file: !79, line: 734, type: !87)
!771 = !DILocation(line: 734, column: 6, scope: !763)
!772 = !DILocation(line: 735, column: 15, scope: !763)
!773 = !DILocation(line: 735, column: 23, scope: !763)
!774 = !DILocation(line: 735, column: 21, scope: !763)
!775 = !DILocation(line: 735, column: 13, scope: !763)
!776 = !DILocation(line: 736, column: 9, scope: !763)
!777 = !DILocation(line: 736, column: 2, scope: !763)
!778 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !79, file: !79, line: 752, type: !779, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!779 = !DISubroutineType(types: !780)
!780 = !{!87, !87, !22}
!781 = !DILocalVariable(name: "value", arg: 1, scope: !778, file: !79, line: 752, type: !87)
!782 = !DILocation(line: 752, column: 25, scope: !778)
!783 = !DILocalVariable(name: "factor", arg: 2, scope: !778, file: !79, line: 752, type: !22)
!784 = !DILocation(line: 752, column: 36, scope: !778)
!785 = !DILocalVariable(name: "s32Temp1", scope: !778, file: !79, line: 754, type: !87)
!786 = !DILocation(line: 754, column: 6, scope: !778)
!787 = !DILocalVariable(name: "s32Temp2", scope: !778, file: !79, line: 754, type: !87)
!788 = !DILocation(line: 754, column: 20, scope: !778)
!789 = !DILocalVariable(name: "s32Factor", scope: !778, file: !79, line: 754, type: !87)
!790 = !DILocation(line: 754, column: 44, scope: !778)
!791 = !DILocation(line: 755, column: 14, scope: !778)
!792 = !DILocation(line: 755, column: 12, scope: !778)
!793 = !DILocation(line: 756, column: 5, scope: !794)
!794 = distinct !DILexicalBlock(scope: !778, file: !79, line: 756, column: 5)
!795 = !DILocation(line: 756, column: 12, scope: !794)
!796 = !DILocation(line: 756, column: 5, scope: !778)
!797 = !DILocation(line: 758, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !799, file: !79, line: 758, column: 6)
!799 = distinct !DILexicalBlock(scope: !794, file: !79, line: 757, column: 2)
!800 = !DILocation(line: 758, column: 12, scope: !798)
!801 = !DILocation(line: 758, column: 6, scope: !799)
!802 = !DILocation(line: 760, column: 15, scope: !803)
!803 = distinct !DILexicalBlock(scope: !798, file: !79, line: 759, column: 3)
!804 = !DILocation(line: 760, column: 26, scope: !803)
!805 = !DILocation(line: 760, column: 24, scope: !803)
!806 = !DILocation(line: 760, column: 13, scope: !803)
!807 = !DILocation(line: 761, column: 7, scope: !808)
!808 = distinct !DILexicalBlock(scope: !803, file: !79, line: 761, column: 7)
!809 = !DILocation(line: 761, column: 19, scope: !808)
!810 = !DILocation(line: 761, column: 16, scope: !808)
!811 = !DILocation(line: 761, column: 7, scope: !803)
!812 = !DILocation(line: 763, column: 5, scope: !813)
!813 = distinct !DILexicalBlock(scope: !808, file: !79, line: 762, column: 4)
!814 = !DILocation(line: 767, column: 13, scope: !815)
!815 = distinct !DILexicalBlock(scope: !808, file: !79, line: 766, column: 4)
!816 = !DILocation(line: 767, column: 19, scope: !815)
!817 = !DILocation(line: 767, column: 18, scope: !815)
!818 = !DILocation(line: 767, column: 5, scope: !815)
!819 = !DILocation(line: 772, column: 20, scope: !820)
!820 = distinct !DILexicalBlock(scope: !821, file: !79, line: 772, column: 7)
!821 = distinct !DILexicalBlock(scope: !798, file: !79, line: 771, column: 3)
!822 = !DILocation(line: 772, column: 19, scope: !820)
!823 = !DILocation(line: 772, column: 31, scope: !820)
!824 = !DILocation(line: 772, column: 28, scope: !820)
!825 = !DILocation(line: 772, column: 7, scope: !821)
!826 = !DILocation(line: 774, column: 5, scope: !827)
!827 = distinct !DILexicalBlock(scope: !820, file: !79, line: 773, column: 4)
!828 = !DILocation(line: 778, column: 13, scope: !829)
!829 = distinct !DILexicalBlock(scope: !820, file: !79, line: 777, column: 4)
!830 = !DILocation(line: 778, column: 19, scope: !829)
!831 = !DILocation(line: 778, column: 18, scope: !829)
!832 = !DILocation(line: 778, column: 5, scope: !829)
!833 = !DILocation(line: 784, column: 3, scope: !834)
!834 = distinct !DILexicalBlock(scope: !794, file: !79, line: 783, column: 2)
!835 = !DILocation(line: 786, column: 1, scope: !778)
!836 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !79, file: !79, line: 802, type: !837, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!837 = !DISubroutineType(types: !838)
!838 = !{!17, !17, !17, !22}
!839 = !DILocalVariable(name: "value", arg: 1, scope: !836, file: !79, line: 802, type: !17)
!840 = !DILocation(line: 802, column: 35, scope: !836)
!841 = !DILocalVariable(name: "factor", arg: 2, scope: !836, file: !79, line: 802, type: !17)
!842 = !DILocation(line: 802, column: 44, scope: !836)
!843 = !DILocalVariable(name: "count", arg: 3, scope: !836, file: !79, line: 802, type: !22)
!844 = !DILocation(line: 802, column: 55, scope: !836)
!845 = !DILocalVariable(name: "u16MulTemp", scope: !836, file: !79, line: 804, type: !22)
!846 = !DILocation(line: 804, column: 6, scope: !836)
!847 = !DILocation(line: 805, column: 15, scope: !836)
!848 = !DILocation(line: 805, column: 23, scope: !836)
!849 = !DILocation(line: 805, column: 21, scope: !836)
!850 = !DILocation(line: 805, column: 13, scope: !836)
!851 = !DILocation(line: 806, column: 15, scope: !836)
!852 = !DILocation(line: 806, column: 26, scope: !836)
!853 = !DILocation(line: 806, column: 25, scope: !836)
!854 = !DILocation(line: 806, column: 13, scope: !836)
!855 = !DILocation(line: 807, column: 13, scope: !836)
!856 = !DILocation(line: 807, column: 9, scope: !836)
!857 = !DILocation(line: 807, column: 2, scope: !836)
!858 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !79, file: !79, line: 824, type: !859, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!859 = !DISubroutineType(types: !860)
!860 = !{!17, !17, !17, !17}
!861 = !DILocalVariable(name: "value", arg: 1, scope: !858, file: !79, line: 824, type: !17)
!862 = !DILocation(line: 824, column: 38, scope: !858)
!863 = !DILocalVariable(name: "factor", arg: 2, scope: !858, file: !79, line: 824, type: !17)
!864 = !DILocation(line: 824, column: 47, scope: !858)
!865 = !DILocalVariable(name: "count", arg: 3, scope: !858, file: !79, line: 824, type: !17)
!866 = !DILocation(line: 824, column: 57, scope: !858)
!867 = !DILocalVariable(name: "u16MulTemp", scope: !858, file: !79, line: 826, type: !22)
!868 = !DILocation(line: 826, column: 6, scope: !858)
!869 = !DILocation(line: 827, column: 15, scope: !858)
!870 = !DILocation(line: 827, column: 23, scope: !858)
!871 = !DILocation(line: 827, column: 21, scope: !858)
!872 = !DILocation(line: 827, column: 13, scope: !858)
!873 = !DILocation(line: 828, column: 15, scope: !858)
!874 = !DILocation(line: 828, column: 26, scope: !858)
!875 = !DILocation(line: 828, column: 25, scope: !858)
!876 = !DILocation(line: 828, column: 13, scope: !858)
!877 = !DILocation(line: 829, column: 5, scope: !878)
!878 = distinct !DILexicalBlock(scope: !858, file: !79, line: 829, column: 5)
!879 = !DILocation(line: 829, column: 16, scope: !878)
!880 = !DILocation(line: 829, column: 5, scope: !858)
!881 = !DILocation(line: 831, column: 10, scope: !882)
!882 = distinct !DILexicalBlock(scope: !878, file: !79, line: 830, column: 2)
!883 = !DILocation(line: 831, column: 21, scope: !882)
!884 = !DILocation(line: 831, column: 3, scope: !882)
!885 = !DILocation(line: 835, column: 3, scope: !886)
!886 = distinct !DILexicalBlock(scope: !878, file: !79, line: 834, column: 2)
!887 = !DILocation(line: 837, column: 1, scope: !858)
!888 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !79, file: !79, line: 854, type: !889, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!889 = !DISubroutineType(types: !890)
!890 = !{!17, !17, !17}
!891 = !DILocalVariable(name: "x_value", arg: 1, scope: !888, file: !79, line: 854, type: !17)
!892 = !DILocation(line: 854, column: 25, scope: !888)
!893 = !DILocalVariable(name: "y_value", arg: 2, scope: !888, file: !79, line: 854, type: !17)
!894 = !DILocation(line: 854, column: 36, scope: !888)
!895 = !DILocalVariable(name: "u16MulTemp", scope: !888, file: !79, line: 856, type: !22)
!896 = !DILocation(line: 856, column: 6, scope: !888)
!897 = !DILocation(line: 857, column: 15, scope: !888)
!898 = !DILocation(line: 857, column: 25, scope: !888)
!899 = !DILocation(line: 857, column: 23, scope: !888)
!900 = !DILocation(line: 857, column: 13, scope: !888)
!901 = !DILocation(line: 858, column: 15, scope: !888)
!902 = !DILocation(line: 858, column: 26, scope: !888)
!903 = !DILocation(line: 858, column: 13, scope: !888)
!904 = !DILocation(line: 859, column: 13, scope: !888)
!905 = !DILocation(line: 859, column: 9, scope: !888)
!906 = !DILocation(line: 859, column: 2, scope: !888)
!907 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !79, file: !79, line: 878, type: !889, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!908 = !DILocalVariable(name: "value", arg: 1, scope: !907, file: !79, line: 878, type: !17)
!909 = !DILocation(line: 878, column: 26, scope: !907)
!910 = !DILocalVariable(name: "factor", arg: 2, scope: !907, file: !79, line: 878, type: !17)
!911 = !DILocation(line: 878, column: 36, scope: !907)
!912 = !DILocalVariable(name: "u16MulTemp", scope: !907, file: !79, line: 880, type: !22)
!913 = !DILocation(line: 880, column: 6, scope: !907)
!914 = !DILocation(line: 881, column: 15, scope: !907)
!915 = !DILocation(line: 881, column: 23, scope: !907)
!916 = !DILocation(line: 881, column: 21, scope: !907)
!917 = !DILocation(line: 881, column: 13, scope: !907)
!918 = !DILocation(line: 882, column: 15, scope: !907)
!919 = !DILocation(line: 882, column: 26, scope: !907)
!920 = !DILocation(line: 882, column: 13, scope: !907)
!921 = !DILocation(line: 883, column: 5, scope: !922)
!922 = distinct !DILexicalBlock(scope: !907, file: !79, line: 883, column: 5)
!923 = !DILocation(line: 883, column: 16, scope: !922)
!924 = !DILocation(line: 883, column: 5, scope: !907)
!925 = !DILocation(line: 885, column: 14, scope: !926)
!926 = distinct !DILexicalBlock(scope: !922, file: !79, line: 884, column: 2)
!927 = !DILocation(line: 885, column: 10, scope: !926)
!928 = !DILocation(line: 885, column: 3, scope: !926)
!929 = !DILocation(line: 889, column: 3, scope: !930)
!930 = distinct !DILexicalBlock(scope: !922, file: !79, line: 888, column: 2)
!931 = !DILocation(line: 891, column: 1, scope: !907)
!932 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !79, file: !79, line: 907, type: !933, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!933 = !DISubroutineType(types: !934)
!934 = !{!22, !22, !22}
!935 = !DILocalVariable(name: "value", arg: 1, scope: !932, file: !79, line: 907, type: !22)
!936 = !DILocation(line: 907, column: 39, scope: !932)
!937 = !DILocalVariable(name: "factor", arg: 2, scope: !932, file: !79, line: 907, type: !22)
!938 = !DILocation(line: 907, column: 49, scope: !932)
!939 = !DILocalVariable(name: "u32MulTemp", scope: !932, file: !79, line: 909, type: !743)
!940 = !DILocation(line: 909, column: 6, scope: !932)
!941 = !DILocation(line: 910, column: 15, scope: !932)
!942 = !DILocation(line: 910, column: 23, scope: !932)
!943 = !DILocation(line: 910, column: 21, scope: !932)
!944 = !DILocation(line: 910, column: 13, scope: !932)
!945 = !DILocation(line: 911, column: 15, scope: !932)
!946 = !DILocation(line: 911, column: 26, scope: !932)
!947 = !DILocation(line: 911, column: 13, scope: !932)
!948 = !DILocation(line: 912, column: 14, scope: !932)
!949 = !DILocation(line: 912, column: 9, scope: !932)
!950 = !DILocation(line: 912, column: 2, scope: !932)
!951 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !79, file: !79, line: 931, type: !933, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!952 = !DILocalVariable(name: "value", arg: 1, scope: !951, file: !79, line: 931, type: !22)
!953 = !DILocation(line: 931, column: 43, scope: !951)
!954 = !DILocalVariable(name: "factor", arg: 2, scope: !951, file: !79, line: 931, type: !22)
!955 = !DILocation(line: 931, column: 53, scope: !951)
!956 = !DILocalVariable(name: "u32MulTemp", scope: !951, file: !79, line: 933, type: !743)
!957 = !DILocation(line: 933, column: 6, scope: !951)
!958 = !DILocation(line: 934, column: 15, scope: !951)
!959 = !DILocation(line: 934, column: 23, scope: !951)
!960 = !DILocation(line: 934, column: 21, scope: !951)
!961 = !DILocation(line: 934, column: 13, scope: !951)
!962 = !DILocation(line: 935, column: 15, scope: !951)
!963 = !DILocation(line: 935, column: 26, scope: !951)
!964 = !DILocation(line: 935, column: 13, scope: !951)
!965 = !DILocation(line: 936, column: 5, scope: !966)
!966 = distinct !DILexicalBlock(scope: !951, file: !79, line: 936, column: 5)
!967 = !DILocation(line: 936, column: 16, scope: !966)
!968 = !DILocation(line: 936, column: 5, scope: !951)
!969 = !DILocation(line: 938, column: 11, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !79, line: 937, column: 2)
!971 = !DILocation(line: 938, column: 22, scope: !970)
!972 = !DILocation(line: 938, column: 10, scope: !970)
!973 = !DILocation(line: 938, column: 3, scope: !970)
!974 = !DILocation(line: 942, column: 3, scope: !975)
!975 = distinct !DILexicalBlock(scope: !966, file: !79, line: 941, column: 2)
!976 = !DILocation(line: 944, column: 1, scope: !951)
!977 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !79, file: !79, line: 962, type: !978, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!978 = !DISubroutineType(types: !979)
!979 = !{!22, !22, !17}
!980 = !DILocalVariable(name: "x_value", arg: 1, scope: !977, file: !79, line: 962, type: !22)
!981 = !DILocation(line: 962, column: 29, scope: !977)
!982 = !DILocalVariable(name: "y_value", arg: 2, scope: !977, file: !79, line: 962, type: !17)
!983 = !DILocation(line: 962, column: 41, scope: !977)
!984 = !DILocalVariable(name: "u32MulTemp", scope: !977, file: !79, line: 964, type: !743)
!985 = !DILocation(line: 964, column: 6, scope: !977)
!986 = !DILocation(line: 965, column: 15, scope: !977)
!987 = !DILocation(line: 965, column: 25, scope: !977)
!988 = !DILocation(line: 965, column: 23, scope: !977)
!989 = !DILocation(line: 965, column: 13, scope: !977)
!990 = !DILocation(line: 966, column: 16, scope: !977)
!991 = !DILocation(line: 966, column: 27, scope: !977)
!992 = !DILocation(line: 966, column: 33, scope: !977)
!993 = !DILocation(line: 966, column: 13, scope: !977)
!994 = !DILocation(line: 967, column: 9, scope: !977)
!995 = !DILocation(line: 967, column: 2, scope: !977)
!996 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !79, file: !79, line: 986, type: !978, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!997 = !DILocalVariable(name: "x_value", arg: 1, scope: !996, file: !79, line: 986, type: !22)
!998 = !DILocation(line: 986, column: 29, scope: !996)
!999 = !DILocalVariable(name: "y_value", arg: 2, scope: !996, file: !79, line: 986, type: !17)
!1000 = !DILocation(line: 986, column: 41, scope: !996)
!1001 = !DILocalVariable(name: "u32MulTemp", scope: !996, file: !79, line: 988, type: !743)
!1002 = !DILocation(line: 988, column: 6, scope: !996)
!1003 = !DILocation(line: 989, column: 15, scope: !996)
!1004 = !DILocation(line: 989, column: 25, scope: !996)
!1005 = !DILocation(line: 989, column: 23, scope: !996)
!1006 = !DILocation(line: 989, column: 13, scope: !996)
!1007 = !DILocation(line: 990, column: 15, scope: !996)
!1008 = !DILocation(line: 990, column: 26, scope: !996)
!1009 = !DILocation(line: 990, column: 13, scope: !996)
!1010 = !DILocation(line: 991, column: 5, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !996, file: !79, line: 991, column: 5)
!1012 = !DILocation(line: 991, column: 16, scope: !1011)
!1013 = !DILocation(line: 991, column: 5, scope: !996)
!1014 = !DILocation(line: 993, column: 11, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1011, file: !79, line: 992, column: 2)
!1016 = !DILocation(line: 993, column: 22, scope: !1015)
!1017 = !DILocation(line: 993, column: 10, scope: !1015)
!1018 = !DILocation(line: 993, column: 3, scope: !1015)
!1019 = !DILocation(line: 997, column: 3, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1011, file: !79, line: 996, column: 2)
!1021 = !DILocation(line: 999, column: 1, scope: !996)
!1022 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !79, file: !79, line: 1015, type: !1023, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!22, !22, !22, !743}
!1025 = !DILocalVariable(name: "value", arg: 1, scope: !1022, file: !79, line: 1015, type: !22)
!1026 = !DILocation(line: 1015, column: 40, scope: !1022)
!1027 = !DILocalVariable(name: "factor", arg: 2, scope: !1022, file: !79, line: 1015, type: !22)
!1028 = !DILocation(line: 1015, column: 50, scope: !1022)
!1029 = !DILocalVariable(name: "count", arg: 3, scope: !1022, file: !79, line: 1015, type: !743)
!1030 = !DILocation(line: 1015, column: 61, scope: !1022)
!1031 = !DILocalVariable(name: "u32MulTemp", scope: !1022, file: !79, line: 1017, type: !743)
!1032 = !DILocation(line: 1017, column: 6, scope: !1022)
!1033 = !DILocation(line: 1018, column: 15, scope: !1022)
!1034 = !DILocation(line: 1018, column: 23, scope: !1022)
!1035 = !DILocation(line: 1018, column: 21, scope: !1022)
!1036 = !DILocation(line: 1018, column: 13, scope: !1022)
!1037 = !DILocation(line: 1019, column: 15, scope: !1022)
!1038 = !DILocation(line: 1019, column: 26, scope: !1022)
!1039 = !DILocation(line: 1019, column: 25, scope: !1022)
!1040 = !DILocation(line: 1019, column: 13, scope: !1022)
!1041 = !DILocation(line: 1020, column: 10, scope: !1022)
!1042 = !DILocation(line: 1020, column: 21, scope: !1022)
!1043 = !DILocation(line: 1020, column: 9, scope: !1022)
!1044 = !DILocation(line: 1020, column: 2, scope: !1022)
!1045 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !79, file: !79, line: 1038, type: !1046, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!22, !22, !22, !22}
!1048 = !DILocalVariable(name: "value", arg: 1, scope: !1045, file: !79, line: 1038, type: !22)
!1049 = !DILocation(line: 1038, column: 43, scope: !1045)
!1050 = !DILocalVariable(name: "factor", arg: 2, scope: !1045, file: !79, line: 1038, type: !22)
!1051 = !DILocation(line: 1038, column: 53, scope: !1045)
!1052 = !DILocalVariable(name: "count", arg: 3, scope: !1045, file: !79, line: 1038, type: !22)
!1053 = !DILocation(line: 1038, column: 64, scope: !1045)
!1054 = !DILocalVariable(name: "u32MulTemp", scope: !1045, file: !79, line: 1040, type: !743)
!1055 = !DILocation(line: 1040, column: 6, scope: !1045)
!1056 = !DILocation(line: 1041, column: 15, scope: !1045)
!1057 = !DILocation(line: 1041, column: 23, scope: !1045)
!1058 = !DILocation(line: 1041, column: 21, scope: !1045)
!1059 = !DILocation(line: 1041, column: 13, scope: !1045)
!1060 = !DILocation(line: 1042, column: 15, scope: !1045)
!1061 = !DILocation(line: 1042, column: 26, scope: !1045)
!1062 = !DILocation(line: 1042, column: 25, scope: !1045)
!1063 = !DILocation(line: 1042, column: 13, scope: !1045)
!1064 = !DILocation(line: 1043, column: 5, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1045, file: !79, line: 1043, column: 5)
!1066 = !DILocation(line: 1043, column: 16, scope: !1065)
!1067 = !DILocation(line: 1043, column: 5, scope: !1045)
!1068 = !DILocation(line: 1045, column: 11, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !79, line: 1044, column: 2)
!1070 = !DILocation(line: 1045, column: 22, scope: !1069)
!1071 = !DILocation(line: 1045, column: 10, scope: !1069)
!1072 = !DILocation(line: 1045, column: 3, scope: !1069)
!1073 = !DILocation(line: 1049, column: 3, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1065, file: !79, line: 1048, column: 2)
!1075 = !DILocation(line: 1051, column: 1, scope: !1045)
!1076 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !79, file: !79, line: 1067, type: !933, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1077 = !DILocalVariable(name: "x_value", arg: 1, scope: !1076, file: !79, line: 1067, type: !22)
!1078 = !DILocation(line: 1067, column: 30, scope: !1076)
!1079 = !DILocalVariable(name: "y_value", arg: 2, scope: !1076, file: !79, line: 1067, type: !22)
!1080 = !DILocation(line: 1067, column: 42, scope: !1076)
!1081 = !DILocalVariable(name: "u32MulTemp", scope: !1076, file: !79, line: 1069, type: !743)
!1082 = !DILocation(line: 1069, column: 6, scope: !1076)
!1083 = !DILocation(line: 1070, column: 15, scope: !1076)
!1084 = !DILocation(line: 1070, column: 25, scope: !1076)
!1085 = !DILocation(line: 1070, column: 23, scope: !1076)
!1086 = !DILocation(line: 1070, column: 13, scope: !1076)
!1087 = !DILocation(line: 1071, column: 15, scope: !1076)
!1088 = !DILocation(line: 1071, column: 26, scope: !1076)
!1089 = !DILocation(line: 1071, column: 13, scope: !1076)
!1090 = !DILocation(line: 1072, column: 19, scope: !1076)
!1091 = !DILocation(line: 1072, column: 17, scope: !1076)
!1092 = !DILocation(line: 1072, column: 9, scope: !1076)
!1093 = !DILocation(line: 1072, column: 2, scope: !1076)
!1094 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !79, file: !79, line: 1091, type: !933, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1095 = !DILocalVariable(name: "x_value", arg: 1, scope: !1094, file: !79, line: 1091, type: !22)
!1096 = !DILocation(line: 1091, column: 30, scope: !1094)
!1097 = !DILocalVariable(name: "y_value", arg: 2, scope: !1094, file: !79, line: 1091, type: !22)
!1098 = !DILocation(line: 1091, column: 42, scope: !1094)
!1099 = !DILocalVariable(name: "u32MulTemp", scope: !1094, file: !79, line: 1093, type: !743)
!1100 = !DILocation(line: 1093, column: 6, scope: !1094)
!1101 = !DILocation(line: 1094, column: 15, scope: !1094)
!1102 = !DILocation(line: 1094, column: 25, scope: !1094)
!1103 = !DILocation(line: 1094, column: 23, scope: !1094)
!1104 = !DILocation(line: 1094, column: 13, scope: !1094)
!1105 = !DILocation(line: 1095, column: 15, scope: !1094)
!1106 = !DILocation(line: 1095, column: 26, scope: !1094)
!1107 = !DILocation(line: 1095, column: 13, scope: !1094)
!1108 = !DILocation(line: 1096, column: 5, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1094, file: !79, line: 1096, column: 5)
!1110 = !DILocation(line: 1096, column: 16, scope: !1109)
!1111 = !DILocation(line: 1096, column: 5, scope: !1094)
!1112 = !DILocation(line: 1098, column: 11, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1109, file: !79, line: 1097, column: 2)
!1114 = !DILocation(line: 1098, column: 22, scope: !1113)
!1115 = !DILocation(line: 1098, column: 10, scope: !1113)
!1116 = !DILocation(line: 1098, column: 3, scope: !1113)
!1117 = !DILocation(line: 1102, column: 3, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1109, file: !79, line: 1101, column: 2)
!1119 = !DILocation(line: 1104, column: 1, scope: !1094)
!1120 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !79, file: !79, line: 1119, type: !1121, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!743, !743, !22}
!1123 = !DILocalVariable(name: "x_value", arg: 1, scope: !1120, file: !79, line: 1119, type: !743)
!1124 = !DILocation(line: 1119, column: 26, scope: !1120)
!1125 = !DILocalVariable(name: "y_value", arg: 2, scope: !1120, file: !79, line: 1119, type: !22)
!1126 = !DILocation(line: 1119, column: 39, scope: !1120)
!1127 = !DILocalVariable(name: "u32Temp1", scope: !1120, file: !79, line: 1122, type: !743)
!1128 = !DILocation(line: 1122, column: 6, scope: !1120)
!1129 = !DILocation(line: 1123, column: 5, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1120, file: !79, line: 1123, column: 5)
!1131 = !DILocation(line: 1123, column: 13, scope: !1130)
!1132 = !DILocation(line: 1123, column: 5, scope: !1120)
!1133 = !DILocation(line: 1125, column: 26, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1130, file: !79, line: 1124, column: 2)
!1135 = !DILocation(line: 1125, column: 25, scope: !1134)
!1136 = !DILocation(line: 1125, column: 12, scope: !1134)
!1137 = !DILocation(line: 1126, column: 6, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1134, file: !79, line: 1126, column: 6)
!1139 = !DILocation(line: 1126, column: 17, scope: !1138)
!1140 = !DILocation(line: 1126, column: 15, scope: !1138)
!1141 = !DILocation(line: 1126, column: 6, scope: !1134)
!1142 = !DILocation(line: 1128, column: 4, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !79, line: 1127, column: 3)
!1144 = !DILocation(line: 1132, column: 12, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1138, file: !79, line: 1131, column: 3)
!1146 = !DILocation(line: 1132, column: 22, scope: !1145)
!1147 = !DILocation(line: 1132, column: 20, scope: !1145)
!1148 = !DILocation(line: 1132, column: 4, scope: !1145)
!1149 = !DILocation(line: 1137, column: 3, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1130, file: !79, line: 1136, column: 2)
!1151 = !DILocation(line: 1140, column: 2, scope: !1120)
!1152 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !79, file: !79, line: 1157, type: !1153, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!743, !743, !22, !743}
!1155 = !DILocalVariable(name: "value", arg: 1, scope: !1152, file: !79, line: 1157, type: !743)
!1156 = !DILocation(line: 1157, column: 40, scope: !1152)
!1157 = !DILocalVariable(name: "factor", arg: 2, scope: !1152, file: !79, line: 1157, type: !22)
!1158 = !DILocation(line: 1157, column: 50, scope: !1152)
!1159 = !DILocalVariable(name: "count", arg: 3, scope: !1152, file: !79, line: 1157, type: !743)
!1160 = !DILocation(line: 1157, column: 62, scope: !1152)
!1161 = !DILocalVariable(name: "u32Temp1", scope: !1152, file: !79, line: 1159, type: !743)
!1162 = !DILocation(line: 1159, column: 6, scope: !1152)
!1163 = !DILocalVariable(name: "u32Temp2", scope: !1152, file: !79, line: 1159, type: !743)
!1164 = !DILocation(line: 1159, column: 20, scope: !1152)
!1165 = !DILocation(line: 1160, column: 13, scope: !1152)
!1166 = !DILocation(line: 1160, column: 21, scope: !1152)
!1167 = !DILocation(line: 1160, column: 19, scope: !1152)
!1168 = !DILocation(line: 1160, column: 11, scope: !1152)
!1169 = !DILocation(line: 1161, column: 25, scope: !1152)
!1170 = !DILocation(line: 1161, column: 32, scope: !1152)
!1171 = !DILocation(line: 1161, column: 13, scope: !1152)
!1172 = !DILocation(line: 1161, column: 11, scope: !1152)
!1173 = !DILocation(line: 1162, column: 13, scope: !1152)
!1174 = !DILocation(line: 1162, column: 25, scope: !1152)
!1175 = !DILocation(line: 1162, column: 22, scope: !1152)
!1176 = !DILocation(line: 1162, column: 11, scope: !1152)
!1177 = !DILocation(line: 1163, column: 14, scope: !1152)
!1178 = !DILocation(line: 1163, column: 30, scope: !1152)
!1179 = !DILocation(line: 1163, column: 29, scope: !1152)
!1180 = !DILocation(line: 1163, column: 23, scope: !1152)
!1181 = !DILocation(line: 1163, column: 11, scope: !1152)
!1182 = !DILocation(line: 1164, column: 6, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1152, file: !79, line: 1164, column: 5)
!1184 = !DILocation(line: 1164, column: 16, scope: !1183)
!1185 = !DILocation(line: 1164, column: 14, scope: !1183)
!1186 = !DILocation(line: 1164, column: 23, scope: !1183)
!1187 = !DILocation(line: 1164, column: 5, scope: !1152)
!1188 = !DILocation(line: 1166, column: 10, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1183, file: !79, line: 1165, column: 2)
!1190 = !DILocation(line: 1166, column: 3, scope: !1189)
!1191 = !DILocation(line: 1170, column: 3, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1183, file: !79, line: 1169, column: 2)
!1193 = !DILocation(line: 1172, column: 1, scope: !1152)
!1194 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !79, file: !79, line: 1188, type: !1195, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!17, !17, !17, !6}
!1197 = !DILocalVariable(name: "val1", arg: 1, scope: !1194, file: !79, line: 1188, type: !17)
!1198 = !DILocation(line: 1188, column: 25, scope: !1194)
!1199 = !DILocalVariable(name: "val2", arg: 2, scope: !1194, file: !79, line: 1188, type: !17)
!1200 = !DILocation(line: 1188, column: 34, scope: !1194)
!1201 = !DILocalVariable(name: "factor", arg: 3, scope: !1194, file: !79, line: 1188, type: !6)
!1202 = !DILocation(line: 1188, column: 43, scope: !1194)
!1203 = !DILocalVariable(name: "s16Temp1", scope: !1194, file: !79, line: 1190, type: !13)
!1204 = !DILocation(line: 1190, column: 6, scope: !1194)
!1205 = !DILocation(line: 1191, column: 15, scope: !1194)
!1206 = !DILocation(line: 1191, column: 22, scope: !1194)
!1207 = !DILocation(line: 1191, column: 20, scope: !1194)
!1208 = !DILocation(line: 1191, column: 28, scope: !1194)
!1209 = !DILocation(line: 1191, column: 27, scope: !1194)
!1210 = !DILocation(line: 1191, column: 35, scope: !1194)
!1211 = !DILocation(line: 1191, column: 39, scope: !1194)
!1212 = !DILocation(line: 1191, column: 38, scope: !1194)
!1213 = !DILocation(line: 1191, column: 13, scope: !1194)
!1214 = !DILocation(line: 1191, column: 11, scope: !1194)
!1215 = !DILocation(line: 1192, column: 5, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1194, file: !79, line: 1192, column: 5)
!1217 = !DILocation(line: 1192, column: 14, scope: !1216)
!1218 = !DILocation(line: 1192, column: 5, scope: !1194)
!1219 = !DILocation(line: 1194, column: 6, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1221, file: !79, line: 1194, column: 6)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !79, line: 1193, column: 2)
!1222 = !DILocation(line: 1194, column: 15, scope: !1220)
!1223 = !DILocation(line: 1194, column: 6, scope: !1221)
!1224 = !DILocation(line: 1196, column: 15, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !79, line: 1195, column: 3)
!1226 = !DILocation(line: 1196, column: 11, scope: !1225)
!1227 = !DILocation(line: 1196, column: 4, scope: !1225)
!1228 = !DILocation(line: 1200, column: 4, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1220, file: !79, line: 1199, column: 3)
!1230 = !DILocation(line: 1205, column: 3, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1216, file: !79, line: 1204, column: 2)
!1232 = !DILocation(line: 1208, column: 1, scope: !1194)
!1233 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !79, file: !79, line: 1224, type: !1234, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!22, !22, !22, !6}
!1236 = !DILocalVariable(name: "val1", arg: 1, scope: !1233, file: !79, line: 1224, type: !22)
!1237 = !DILocation(line: 1224, column: 30, scope: !1233)
!1238 = !DILocalVariable(name: "val2", arg: 2, scope: !1233, file: !79, line: 1224, type: !22)
!1239 = !DILocation(line: 1224, column: 40, scope: !1233)
!1240 = !DILocalVariable(name: "factor", arg: 3, scope: !1233, file: !79, line: 1224, type: !6)
!1241 = !DILocation(line: 1224, column: 49, scope: !1233)
!1242 = !DILocalVariable(name: "s32Temp1", scope: !1233, file: !79, line: 1226, type: !87)
!1243 = !DILocation(line: 1226, column: 6, scope: !1233)
!1244 = !DILocation(line: 1227, column: 15, scope: !1233)
!1245 = !DILocation(line: 1227, column: 22, scope: !1233)
!1246 = !DILocation(line: 1227, column: 20, scope: !1233)
!1247 = !DILocation(line: 1227, column: 28, scope: !1233)
!1248 = !DILocation(line: 1227, column: 27, scope: !1233)
!1249 = !DILocation(line: 1227, column: 35, scope: !1233)
!1250 = !DILocation(line: 1227, column: 39, scope: !1233)
!1251 = !DILocation(line: 1227, column: 38, scope: !1233)
!1252 = !DILocation(line: 1227, column: 11, scope: !1233)
!1253 = !DILocation(line: 1228, column: 5, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1233, file: !79, line: 1228, column: 5)
!1255 = !DILocation(line: 1228, column: 14, scope: !1254)
!1256 = !DILocation(line: 1228, column: 5, scope: !1233)
!1257 = !DILocation(line: 1230, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1259, file: !79, line: 1230, column: 6)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !79, line: 1229, column: 2)
!1260 = !DILocation(line: 1230, column: 15, scope: !1258)
!1261 = !DILocation(line: 1230, column: 6, scope: !1259)
!1262 = !DILocation(line: 1232, column: 16, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !79, line: 1231, column: 3)
!1264 = !DILocation(line: 1232, column: 11, scope: !1263)
!1265 = !DILocation(line: 1232, column: 4, scope: !1263)
!1266 = !DILocation(line: 1236, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1258, file: !79, line: 1235, column: 3)
!1268 = !DILocation(line: 1242, column: 3, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1254, file: !79, line: 1241, column: 2)
!1270 = !DILocation(line: 1244, column: 1, scope: !1233)
!1271 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !79, file: !79, line: 1259, type: !933, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1272 = !DILocalVariable(name: "val1", arg: 1, scope: !1271, file: !79, line: 1259, type: !22)
!1273 = !DILocation(line: 1259, column: 26, scope: !1271)
!1274 = !DILocalVariable(name: "val2", arg: 2, scope: !1271, file: !79, line: 1259, type: !22)
!1275 = !DILocation(line: 1259, column: 36, scope: !1271)
!1276 = !DILocalVariable(name: "u32Temp1", scope: !1271, file: !79, line: 1261, type: !743)
!1277 = !DILocation(line: 1261, column: 6, scope: !1271)
!1278 = !DILocation(line: 1262, column: 13, scope: !1271)
!1279 = !DILocation(line: 1262, column: 20, scope: !1271)
!1280 = !DILocation(line: 1262, column: 18, scope: !1271)
!1281 = !DILocation(line: 1262, column: 11, scope: !1271)
!1282 = !DILocation(line: 1263, column: 5, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1271, file: !79, line: 1263, column: 5)
!1284 = !DILocation(line: 1263, column: 14, scope: !1283)
!1285 = !DILocation(line: 1263, column: 5, scope: !1271)
!1286 = !DILocation(line: 1265, column: 11, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1283, file: !79, line: 1264, column: 2)
!1288 = !DILocation(line: 1265, column: 20, scope: !1287)
!1289 = !DILocation(line: 1265, column: 10, scope: !1287)
!1290 = !DILocation(line: 1265, column: 3, scope: !1287)
!1291 = !DILocation(line: 1269, column: 3, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1283, file: !79, line: 1268, column: 2)
!1293 = !DILocation(line: 1271, column: 1, scope: !1271)
!1294 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !79, file: !79, line: 1285, type: !1295, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!743, !22, !22}
!1297 = !DILocalVariable(name: "x_value", arg: 1, scope: !1294, file: !79, line: 1285, type: !22)
!1298 = !DILocation(line: 1285, column: 25, scope: !1294)
!1299 = !DILocalVariable(name: "y_value", arg: 2, scope: !1294, file: !79, line: 1285, type: !22)
!1300 = !DILocation(line: 1285, column: 38, scope: !1294)
!1301 = !DILocalVariable(name: "u32Temp1", scope: !1294, file: !79, line: 1287, type: !743)
!1302 = !DILocation(line: 1287, column: 6, scope: !1294)
!1303 = !DILocation(line: 1288, column: 13, scope: !1294)
!1304 = !DILocation(line: 1288, column: 23, scope: !1294)
!1305 = !DILocation(line: 1288, column: 21, scope: !1294)
!1306 = !DILocation(line: 1288, column: 11, scope: !1294)
!1307 = !DILocation(line: 1289, column: 9, scope: !1294)
!1308 = !DILocation(line: 1289, column: 2, scope: !1294)
!1309 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !79, file: !79, line: 1307, type: !1310, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!87, !13, !13}
!1312 = !DILocalVariable(name: "x_value", arg: 1, scope: !1309, file: !79, line: 1307, type: !13)
!1313 = !DILocation(line: 1307, column: 25, scope: !1309)
!1314 = !DILocalVariable(name: "y_value", arg: 2, scope: !1309, file: !79, line: 1307, type: !13)
!1315 = !DILocation(line: 1307, column: 38, scope: !1309)
!1316 = !DILocalVariable(name: "s32Temp1", scope: !1309, file: !79, line: 1309, type: !87)
!1317 = !DILocation(line: 1309, column: 6, scope: !1309)
!1318 = !DILocation(line: 1310, column: 13, scope: !1309)
!1319 = !DILocation(line: 1310, column: 23, scope: !1309)
!1320 = !DILocation(line: 1310, column: 21, scope: !1309)
!1321 = !DILocation(line: 1310, column: 11, scope: !1309)
!1322 = !DILocation(line: 1311, column: 9, scope: !1309)
!1323 = !DILocation(line: 1311, column: 2, scope: !1309)
!1324 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !79, file: !79, line: 1328, type: !1325, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1325 = !DISubroutineType(types: !1326)
!1326 = !{!743, !743, !87}
!1327 = !DILocalVariable(name: "val1", arg: 1, scope: !1324, file: !79, line: 1328, type: !743)
!1328 = !DILocation(line: 1328, column: 25, scope: !1324)
!1329 = !DILocalVariable(name: "val2", arg: 2, scope: !1324, file: !79, line: 1328, type: !87)
!1330 = !DILocation(line: 1328, column: 35, scope: !1324)
!1331 = !DILocalVariable(name: "s32Temp1", scope: !1324, file: !79, line: 1330, type: !87)
!1332 = !DILocation(line: 1330, column: 6, scope: !1324)
!1333 = !DILocation(line: 1331, column: 5, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1324, file: !79, line: 1331, column: 5)
!1335 = !DILocation(line: 1331, column: 10, scope: !1334)
!1336 = !DILocation(line: 1331, column: 5, scope: !1324)
!1337 = !DILocation(line: 1333, column: 25, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1334, file: !79, line: 1332, column: 2)
!1339 = !DILocation(line: 1333, column: 24, scope: !1338)
!1340 = !DILocation(line: 1333, column: 12, scope: !1338)
!1341 = !DILocation(line: 1334, column: 6, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1338, file: !79, line: 1334, column: 6)
!1343 = !DILocation(line: 1334, column: 17, scope: !1342)
!1344 = !DILocation(line: 1334, column: 15, scope: !1342)
!1345 = !DILocation(line: 1334, column: 6, scope: !1338)
!1346 = !DILocation(line: 1336, column: 4, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1342, file: !79, line: 1335, column: 3)
!1348 = !DILocation(line: 1340, column: 12, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1342, file: !79, line: 1339, column: 3)
!1350 = !DILocation(line: 1340, column: 19, scope: !1349)
!1351 = !DILocation(line: 1340, column: 17, scope: !1349)
!1352 = !DILocation(line: 1340, column: 4, scope: !1349)
!1353 = !DILocation(line: 1345, column: 3, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1334, file: !79, line: 1344, column: 2)
!1355 = !DILocation(line: 1347, column: 1, scope: !1324)
!1356 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !79, file: !79, line: 1362, type: !1357, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!743, !87, !87}
!1359 = !DILocalVariable(name: "val1", arg: 1, scope: !1356, file: !79, line: 1362, type: !87)
!1360 = !DILocation(line: 1362, column: 25, scope: !1356)
!1361 = !DILocalVariable(name: "val2", arg: 2, scope: !1356, file: !79, line: 1362, type: !87)
!1362 = !DILocation(line: 1362, column: 35, scope: !1356)
!1363 = !DILocalVariable(name: "u32Temp1", scope: !1356, file: !79, line: 1364, type: !743)
!1364 = !DILocation(line: 1364, column: 6, scope: !1356)
!1365 = !DILocalVariable(name: "u32Temp2", scope: !1356, file: !79, line: 1364, type: !743)
!1366 = !DILocation(line: 1364, column: 17, scope: !1356)
!1367 = !DILocalVariable(name: "u32Temp3", scope: !1356, file: !79, line: 1364, type: !743)
!1368 = !DILocation(line: 1364, column: 27, scope: !1356)
!1369 = !DILocalVariable(name: "u8SignBit", scope: !1356, file: !79, line: 1365, type: !17)
!1370 = !DILocation(line: 1365, column: 5, scope: !1356)
!1371 = !DILocation(line: 1367, column: 5, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1356, file: !79, line: 1367, column: 5)
!1373 = !DILocation(line: 1367, column: 9, scope: !1372)
!1374 = !DILocation(line: 1367, column: 5, scope: !1356)
!1375 = !DILocation(line: 1368, column: 15, scope: !1372)
!1376 = !DILocation(line: 1368, column: 14, scope: !1372)
!1377 = !DILocation(line: 1368, column: 12, scope: !1372)
!1378 = !DILocation(line: 1368, column: 3, scope: !1372)
!1379 = !DILocation(line: 1370, column: 14, scope: !1372)
!1380 = !DILocation(line: 1370, column: 12, scope: !1372)
!1381 = !DILocation(line: 1372, column: 5, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1356, file: !79, line: 1372, column: 5)
!1383 = !DILocation(line: 1372, column: 9, scope: !1382)
!1384 = !DILocation(line: 1372, column: 5, scope: !1356)
!1385 = !DILocation(line: 1373, column: 15, scope: !1382)
!1386 = !DILocation(line: 1373, column: 14, scope: !1382)
!1387 = !DILocation(line: 1373, column: 12, scope: !1382)
!1388 = !DILocation(line: 1373, column: 3, scope: !1382)
!1389 = !DILocation(line: 1375, column: 14, scope: !1382)
!1390 = !DILocation(line: 1375, column: 12, scope: !1382)
!1391 = !DILocation(line: 1377, column: 6, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1356, file: !79, line: 1377, column: 5)
!1393 = !DILocation(line: 1377, column: 10, scope: !1392)
!1394 = !DILocation(line: 1377, column: 13, scope: !1392)
!1395 = !DILocation(line: 1377, column: 28, scope: !1392)
!1396 = !DILocation(line: 1377, column: 32, scope: !1392)
!1397 = !DILocation(line: 1377, column: 35, scope: !1392)
!1398 = !DILocation(line: 1378, column: 12, scope: !1392)
!1399 = !DILocation(line: 1378, column: 3, scope: !1392)
!1400 = !DILocation(line: 1380, column: 12, scope: !1392)
!1401 = !DILocation(line: 1381, column: 29, scope: !1356)
!1402 = !DILocation(line: 1381, column: 38, scope: !1356)
!1403 = !DILocation(line: 1381, column: 13, scope: !1356)
!1404 = !DILocation(line: 1381, column: 11, scope: !1356)
!1405 = !DILocation(line: 1383, column: 5, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1356, file: !79, line: 1383, column: 5)
!1407 = !DILocation(line: 1383, column: 14, scope: !1406)
!1408 = !DILocation(line: 1383, column: 5, scope: !1356)
!1409 = !DILocation(line: 1385, column: 3, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1406, file: !79, line: 1384, column: 2)
!1411 = !DILocation(line: 1389, column: 10, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1406, file: !79, line: 1388, column: 2)
!1413 = !DILocation(line: 1389, column: 3, scope: !1412)
!1414 = !DILocation(line: 1440, column: 1, scope: !1356)
!1415 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !79, file: !79, line: 1455, type: !1416, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!743, !743, !743}
!1418 = !DILocalVariable(name: "val1", arg: 1, scope: !1415, file: !79, line: 1455, type: !743)
!1419 = !DILocation(line: 1455, column: 25, scope: !1415)
!1420 = !DILocalVariable(name: "val2", arg: 2, scope: !1415, file: !79, line: 1455, type: !743)
!1421 = !DILocation(line: 1455, column: 35, scope: !1415)
!1422 = !DILocalVariable(name: "u32Temp1", scope: !1415, file: !79, line: 1457, type: !743)
!1423 = !DILocation(line: 1457, column: 6, scope: !1415)
!1424 = !DILocation(line: 1458, column: 5, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1415, file: !79, line: 1458, column: 5)
!1426 = !DILocation(line: 1458, column: 10, scope: !1425)
!1427 = !DILocation(line: 1458, column: 5, scope: !1415)
!1428 = !DILocation(line: 1460, column: 26, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1425, file: !79, line: 1459, column: 2)
!1430 = !DILocation(line: 1460, column: 25, scope: !1429)
!1431 = !DILocation(line: 1460, column: 12, scope: !1429)
!1432 = !DILocation(line: 1461, column: 6, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1429, file: !79, line: 1461, column: 6)
!1434 = !DILocation(line: 1461, column: 17, scope: !1433)
!1435 = !DILocation(line: 1461, column: 15, scope: !1433)
!1436 = !DILocation(line: 1461, column: 6, scope: !1429)
!1437 = !DILocation(line: 1463, column: 4, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1433, file: !79, line: 1462, column: 3)
!1439 = !DILocation(line: 1467, column: 12, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1433, file: !79, line: 1466, column: 3)
!1441 = !DILocation(line: 1467, column: 19, scope: !1440)
!1442 = !DILocation(line: 1467, column: 17, scope: !1440)
!1443 = !DILocation(line: 1467, column: 4, scope: !1440)
!1444 = !DILocation(line: 1472, column: 3, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1425, file: !79, line: 1471, column: 2)
!1446 = !DILocation(line: 1474, column: 1, scope: !1415)
!1447 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !79, file: !79, line: 1501, type: !1121, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1448 = !DILocalVariable(name: "value", arg: 1, scope: !1447, file: !79, line: 1501, type: !743)
!1449 = !DILocation(line: 1501, column: 30, scope: !1447)
!1450 = !DILocalVariable(name: "factor", arg: 2, scope: !1447, file: !79, line: 1501, type: !22)
!1451 = !DILocation(line: 1501, column: 41, scope: !1447)
!1452 = !DILocalVariable(name: "u32Temp1", scope: !1447, file: !79, line: 1503, type: !743)
!1453 = !DILocation(line: 1503, column: 6, scope: !1447)
!1454 = !DILocalVariable(name: "u32Temp2", scope: !1447, file: !79, line: 1503, type: !743)
!1455 = !DILocation(line: 1503, column: 20, scope: !1447)
!1456 = !DILocation(line: 1504, column: 13, scope: !1447)
!1457 = !DILocation(line: 1504, column: 21, scope: !1447)
!1458 = !DILocation(line: 1504, column: 19, scope: !1447)
!1459 = !DILocation(line: 1504, column: 11, scope: !1447)
!1460 = !DILocation(line: 1505, column: 25, scope: !1447)
!1461 = !DILocation(line: 1505, column: 32, scope: !1447)
!1462 = !DILocation(line: 1505, column: 13, scope: !1447)
!1463 = !DILocation(line: 1505, column: 11, scope: !1447)
!1464 = !DILocation(line: 1506, column: 14, scope: !1447)
!1465 = !DILocation(line: 1506, column: 23, scope: !1447)
!1466 = !DILocation(line: 1506, column: 11, scope: !1447)
!1467 = !DILocation(line: 1507, column: 14, scope: !1447)
!1468 = !DILocation(line: 1507, column: 23, scope: !1447)
!1469 = !DILocation(line: 1507, column: 11, scope: !1447)
!1470 = !DILocation(line: 1508, column: 9, scope: !1447)
!1471 = !DILocation(line: 1508, column: 2, scope: !1447)
!1472 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !79, file: !79, line: 1527, type: !1121, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1473 = !DILocalVariable(name: "value", arg: 1, scope: !1472, file: !79, line: 1527, type: !743)
!1474 = !DILocation(line: 1527, column: 30, scope: !1472)
!1475 = !DILocalVariable(name: "factor", arg: 2, scope: !1472, file: !79, line: 1527, type: !22)
!1476 = !DILocation(line: 1527, column: 41, scope: !1472)
!1477 = !DILocalVariable(name: "u32Temp1", scope: !1472, file: !79, line: 1529, type: !743)
!1478 = !DILocation(line: 1529, column: 6, scope: !1472)
!1479 = !DILocalVariable(name: "u32Temp2", scope: !1472, file: !79, line: 1529, type: !743)
!1480 = !DILocation(line: 1529, column: 20, scope: !1472)
!1481 = !DILocation(line: 1530, column: 13, scope: !1472)
!1482 = !DILocation(line: 1530, column: 21, scope: !1472)
!1483 = !DILocation(line: 1530, column: 19, scope: !1472)
!1484 = !DILocation(line: 1530, column: 11, scope: !1472)
!1485 = !DILocation(line: 1531, column: 25, scope: !1472)
!1486 = !DILocation(line: 1531, column: 32, scope: !1472)
!1487 = !DILocation(line: 1531, column: 13, scope: !1472)
!1488 = !DILocation(line: 1531, column: 11, scope: !1472)
!1489 = !DILocation(line: 1532, column: 13, scope: !1472)
!1490 = !DILocation(line: 1532, column: 22, scope: !1472)
!1491 = !DILocation(line: 1532, column: 11, scope: !1472)
!1492 = !DILocation(line: 1533, column: 14, scope: !1472)
!1493 = !DILocation(line: 1533, column: 23, scope: !1472)
!1494 = !DILocation(line: 1533, column: 11, scope: !1472)
!1495 = !DILocation(line: 1534, column: 6, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1472, file: !79, line: 1534, column: 5)
!1497 = !DILocation(line: 1534, column: 14, scope: !1496)
!1498 = !DILocation(line: 1534, column: 20, scope: !1496)
!1499 = !DILocation(line: 1534, column: 5, scope: !1472)
!1500 = !DILocation(line: 1536, column: 10, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1496, file: !79, line: 1535, column: 2)
!1502 = !DILocation(line: 1536, column: 3, scope: !1501)
!1503 = !DILocation(line: 1540, column: 3, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1496, file: !79, line: 1539, column: 2)
!1505 = !DILocation(line: 1542, column: 1, scope: !1472)
!1506 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !79, file: !79, line: 1560, type: !1507, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{!743, !743, !13}
!1509 = !DILocalVariable(name: "value", arg: 1, scope: !1506, file: !79, line: 1560, type: !743)
!1510 = !DILocation(line: 1560, column: 30, scope: !1506)
!1511 = !DILocalVariable(name: "factor", arg: 2, scope: !1506, file: !79, line: 1560, type: !13)
!1512 = !DILocation(line: 1560, column: 41, scope: !1506)
!1513 = !DILocalVariable(name: "u32Temp1", scope: !1506, file: !79, line: 1562, type: !743)
!1514 = !DILocation(line: 1562, column: 6, scope: !1506)
!1515 = !DILocalVariable(name: "u32Temp2", scope: !1506, file: !79, line: 1562, type: !743)
!1516 = !DILocation(line: 1562, column: 20, scope: !1506)
!1517 = !DILocation(line: 1563, column: 5, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1506, file: !79, line: 1563, column: 5)
!1519 = !DILocation(line: 1563, column: 12, scope: !1518)
!1520 = !DILocation(line: 1563, column: 5, scope: !1506)
!1521 = !DILocation(line: 1566, column: 14, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1518, file: !79, line: 1564, column: 2)
!1523 = !DILocation(line: 1566, column: 22, scope: !1522)
!1524 = !DILocation(line: 1566, column: 20, scope: !1522)
!1525 = !DILocation(line: 1566, column: 12, scope: !1522)
!1526 = !DILocation(line: 1567, column: 26, scope: !1522)
!1527 = !DILocation(line: 1567, column: 33, scope: !1522)
!1528 = !DILocation(line: 1567, column: 14, scope: !1522)
!1529 = !DILocation(line: 1567, column: 12, scope: !1522)
!1530 = !DILocation(line: 1568, column: 14, scope: !1522)
!1531 = !DILocation(line: 1568, column: 23, scope: !1522)
!1532 = !DILocation(line: 1568, column: 12, scope: !1522)
!1533 = !DILocation(line: 1569, column: 15, scope: !1522)
!1534 = !DILocation(line: 1569, column: 24, scope: !1522)
!1535 = !DILocation(line: 1569, column: 12, scope: !1522)
!1536 = !DILocation(line: 1570, column: 10, scope: !1522)
!1537 = !DILocation(line: 1570, column: 3, scope: !1522)
!1538 = !DILocation(line: 1574, column: 3, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1518, file: !79, line: 1573, column: 2)
!1540 = !DILocation(line: 1576, column: 1, scope: !1506)
!1541 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !79, file: !79, line: 1595, type: !1507, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1542 = !DILocalVariable(name: "value", arg: 1, scope: !1541, file: !79, line: 1595, type: !743)
!1543 = !DILocation(line: 1595, column: 31, scope: !1541)
!1544 = !DILocalVariable(name: "factor", arg: 2, scope: !1541, file: !79, line: 1595, type: !13)
!1545 = !DILocation(line: 1595, column: 42, scope: !1541)
!1546 = !DILocalVariable(name: "u32Temp1", scope: !1541, file: !79, line: 1597, type: !743)
!1547 = !DILocation(line: 1597, column: 6, scope: !1541)
!1548 = !DILocalVariable(name: "u32Temp2", scope: !1541, file: !79, line: 1597, type: !743)
!1549 = !DILocation(line: 1597, column: 20, scope: !1541)
!1550 = !DILocation(line: 1598, column: 5, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1541, file: !79, line: 1598, column: 5)
!1552 = !DILocation(line: 1598, column: 12, scope: !1551)
!1553 = !DILocation(line: 1598, column: 5, scope: !1541)
!1554 = !DILocation(line: 1600, column: 3, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1551, file: !79, line: 1599, column: 2)
!1556 = !DILocation(line: 1604, column: 14, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1551, file: !79, line: 1603, column: 2)
!1558 = !DILocation(line: 1604, column: 22, scope: !1557)
!1559 = !DILocation(line: 1604, column: 20, scope: !1557)
!1560 = !DILocation(line: 1604, column: 12, scope: !1557)
!1561 = !DILocation(line: 1605, column: 26, scope: !1557)
!1562 = !DILocation(line: 1605, column: 33, scope: !1557)
!1563 = !DILocation(line: 1605, column: 14, scope: !1557)
!1564 = !DILocation(line: 1605, column: 12, scope: !1557)
!1565 = !DILocation(line: 1606, column: 14, scope: !1557)
!1566 = !DILocation(line: 1606, column: 23, scope: !1557)
!1567 = !DILocation(line: 1606, column: 12, scope: !1557)
!1568 = !DILocation(line: 1607, column: 15, scope: !1557)
!1569 = !DILocation(line: 1607, column: 24, scope: !1557)
!1570 = !DILocation(line: 1607, column: 12, scope: !1557)
!1571 = !DILocation(line: 1608, column: 7, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1557, file: !79, line: 1608, column: 6)
!1573 = !DILocation(line: 1608, column: 16, scope: !1572)
!1574 = !DILocation(line: 1608, column: 23, scope: !1572)
!1575 = !DILocation(line: 1608, column: 6, scope: !1557)
!1576 = !DILocation(line: 1610, column: 11, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1572, file: !79, line: 1609, column: 3)
!1578 = !DILocation(line: 1610, column: 4, scope: !1577)
!1579 = !DILocation(line: 1614, column: 4, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1572, file: !79, line: 1613, column: 3)
!1581 = !DILocation(line: 1617, column: 1, scope: !1541)
!1582 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !79, file: !79, line: 1632, type: !1416, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1583 = !DILocalVariable(name: "value", arg: 1, scope: !1582, file: !79, line: 1632, type: !743)
!1584 = !DILocation(line: 1632, column: 30, scope: !1582)
!1585 = !DILocalVariable(name: "factor", arg: 2, scope: !1582, file: !79, line: 1632, type: !743)
!1586 = !DILocation(line: 1632, column: 40, scope: !1582)
!1587 = !DILocation(line: 1634, column: 21, scope: !1582)
!1588 = !DILocation(line: 1634, column: 28, scope: !1582)
!1589 = !DILocation(line: 1634, column: 9, scope: !1582)
!1590 = !DILocation(line: 1634, column: 2, scope: !1582)
!1591 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !79, file: !79, line: 1653, type: !1416, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1592 = !DILocalVariable(name: "value", arg: 1, scope: !1591, file: !79, line: 1653, type: !743)
!1593 = !DILocation(line: 1653, column: 30, scope: !1591)
!1594 = !DILocalVariable(name: "factor", arg: 2, scope: !1591, file: !79, line: 1653, type: !743)
!1595 = !DILocation(line: 1653, column: 40, scope: !1591)
!1596 = !DILocalVariable(name: "u32Temp1", scope: !1591, file: !79, line: 1655, type: !743)
!1597 = !DILocation(line: 1655, column: 6, scope: !1591)
!1598 = !DILocalVariable(name: "u32Temp2", scope: !1591, file: !79, line: 1655, type: !743)
!1599 = !DILocation(line: 1655, column: 20, scope: !1591)
!1600 = !DILocation(line: 1656, column: 13, scope: !1591)
!1601 = !DILocation(line: 1656, column: 21, scope: !1591)
!1602 = !DILocation(line: 1656, column: 19, scope: !1591)
!1603 = !DILocation(line: 1656, column: 11, scope: !1591)
!1604 = !DILocation(line: 1657, column: 25, scope: !1591)
!1605 = !DILocation(line: 1657, column: 32, scope: !1591)
!1606 = !DILocation(line: 1657, column: 13, scope: !1591)
!1607 = !DILocation(line: 1657, column: 11, scope: !1591)
!1608 = !DILocation(line: 1658, column: 13, scope: !1591)
!1609 = !DILocation(line: 1658, column: 22, scope: !1591)
!1610 = !DILocation(line: 1658, column: 11, scope: !1591)
!1611 = !DILocation(line: 1659, column: 14, scope: !1591)
!1612 = !DILocation(line: 1659, column: 23, scope: !1591)
!1613 = !DILocation(line: 1659, column: 11, scope: !1591)
!1614 = !DILocation(line: 1660, column: 6, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1591, file: !79, line: 1660, column: 5)
!1616 = !DILocation(line: 1660, column: 14, scope: !1615)
!1617 = !DILocation(line: 1660, column: 20, scope: !1615)
!1618 = !DILocation(line: 1660, column: 5, scope: !1591)
!1619 = !DILocation(line: 1662, column: 10, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1615, file: !79, line: 1661, column: 2)
!1621 = !DILocation(line: 1662, column: 3, scope: !1620)
!1622 = !DILocation(line: 1666, column: 3, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1615, file: !79, line: 1665, column: 2)
!1624 = !DILocation(line: 1668, column: 1, scope: !1591)
!1625 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !79, file: !79, line: 1686, type: !1325, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1626 = !DILocalVariable(name: "value", arg: 1, scope: !1625, file: !79, line: 1686, type: !743)
!1627 = !DILocation(line: 1686, column: 30, scope: !1625)
!1628 = !DILocalVariable(name: "factor", arg: 2, scope: !1625, file: !79, line: 1686, type: !87)
!1629 = !DILocation(line: 1686, column: 40, scope: !1625)
!1630 = !DILocalVariable(name: "u32Temp1", scope: !1625, file: !79, line: 1688, type: !743)
!1631 = !DILocation(line: 1688, column: 6, scope: !1625)
!1632 = !DILocalVariable(name: "u32Temp2", scope: !1625, file: !79, line: 1688, type: !743)
!1633 = !DILocation(line: 1688, column: 20, scope: !1625)
!1634 = !DILocation(line: 1689, column: 5, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1625, file: !79, line: 1689, column: 5)
!1636 = !DILocation(line: 1689, column: 12, scope: !1635)
!1637 = !DILocation(line: 1689, column: 5, scope: !1625)
!1638 = !DILocation(line: 1691, column: 14, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1635, file: !79, line: 1690, column: 2)
!1640 = !DILocation(line: 1691, column: 22, scope: !1639)
!1641 = !DILocation(line: 1691, column: 20, scope: !1639)
!1642 = !DILocation(line: 1691, column: 12, scope: !1639)
!1643 = !DILocation(line: 1692, column: 26, scope: !1639)
!1644 = !DILocation(line: 1692, column: 33, scope: !1639)
!1645 = !DILocation(line: 1692, column: 14, scope: !1639)
!1646 = !DILocation(line: 1692, column: 12, scope: !1639)
!1647 = !DILocation(line: 1693, column: 14, scope: !1639)
!1648 = !DILocation(line: 1693, column: 23, scope: !1639)
!1649 = !DILocation(line: 1693, column: 12, scope: !1639)
!1650 = !DILocation(line: 1694, column: 15, scope: !1639)
!1651 = !DILocation(line: 1694, column: 24, scope: !1639)
!1652 = !DILocation(line: 1694, column: 12, scope: !1639)
!1653 = !DILocation(line: 1695, column: 10, scope: !1639)
!1654 = !DILocation(line: 1695, column: 3, scope: !1639)
!1655 = !DILocation(line: 1699, column: 3, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1635, file: !79, line: 1698, column: 2)
!1657 = !DILocation(line: 1701, column: 1, scope: !1625)
!1658 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !79, file: !79, line: 1720, type: !1325, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1659 = !DILocalVariable(name: "value", arg: 1, scope: !1658, file: !79, line: 1720, type: !743)
!1660 = !DILocation(line: 1720, column: 30, scope: !1658)
!1661 = !DILocalVariable(name: "factor", arg: 2, scope: !1658, file: !79, line: 1720, type: !87)
!1662 = !DILocation(line: 1720, column: 40, scope: !1658)
!1663 = !DILocalVariable(name: "u32Temp1", scope: !1658, file: !79, line: 1722, type: !743)
!1664 = !DILocation(line: 1722, column: 6, scope: !1658)
!1665 = !DILocalVariable(name: "u32Temp2", scope: !1658, file: !79, line: 1722, type: !743)
!1666 = !DILocation(line: 1722, column: 20, scope: !1658)
!1667 = !DILocation(line: 1723, column: 5, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1658, file: !79, line: 1723, column: 5)
!1669 = !DILocation(line: 1723, column: 12, scope: !1668)
!1670 = !DILocation(line: 1723, column: 5, scope: !1658)
!1671 = !DILocation(line: 1725, column: 3, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1668, file: !79, line: 1724, column: 2)
!1673 = !DILocation(line: 1729, column: 14, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1668, file: !79, line: 1728, column: 2)
!1675 = !DILocation(line: 1729, column: 22, scope: !1674)
!1676 = !DILocation(line: 1729, column: 20, scope: !1674)
!1677 = !DILocation(line: 1729, column: 12, scope: !1674)
!1678 = !DILocation(line: 1730, column: 26, scope: !1674)
!1679 = !DILocation(line: 1730, column: 33, scope: !1674)
!1680 = !DILocation(line: 1730, column: 14, scope: !1674)
!1681 = !DILocation(line: 1730, column: 12, scope: !1674)
!1682 = !DILocation(line: 1731, column: 14, scope: !1674)
!1683 = !DILocation(line: 1731, column: 23, scope: !1674)
!1684 = !DILocation(line: 1731, column: 12, scope: !1674)
!1685 = !DILocation(line: 1732, column: 15, scope: !1674)
!1686 = !DILocation(line: 1732, column: 24, scope: !1674)
!1687 = !DILocation(line: 1732, column: 12, scope: !1674)
!1688 = !DILocation(line: 1733, column: 7, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1674, file: !79, line: 1733, column: 6)
!1690 = !DILocation(line: 1733, column: 15, scope: !1689)
!1691 = !DILocation(line: 1733, column: 21, scope: !1689)
!1692 = !DILocation(line: 1733, column: 6, scope: !1674)
!1693 = !DILocation(line: 1735, column: 11, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1689, file: !79, line: 1734, column: 3)
!1695 = !DILocation(line: 1735, column: 4, scope: !1694)
!1696 = !DILocation(line: 1739, column: 4, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1689, file: !79, line: 1738, column: 3)
!1698 = !DILocation(line: 1742, column: 1, scope: !1658)
!1699 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !79, file: !79, line: 1757, type: !1700, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1700 = !DISubroutineType(types: !1701)
!1701 = !{!87, !743, !87}
!1702 = !DILocalVariable(name: "val1", arg: 1, scope: !1699, file: !79, line: 1757, type: !743)
!1703 = !DILocation(line: 1757, column: 25, scope: !1699)
!1704 = !DILocalVariable(name: "val2", arg: 2, scope: !1699, file: !79, line: 1757, type: !87)
!1705 = !DILocation(line: 1757, column: 35, scope: !1699)
!1706 = !DILocalVariable(name: "s32Val2prime", scope: !1699, file: !79, line: 1759, type: !87)
!1707 = !DILocation(line: 1759, column: 6, scope: !1699)
!1708 = !DILocation(line: 1760, column: 5, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1699, file: !79, line: 1760, column: 5)
!1710 = !DILocation(line: 1760, column: 10, scope: !1709)
!1711 = !DILocation(line: 1760, column: 5, scope: !1699)
!1712 = !DILocation(line: 1762, column: 19, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1709, file: !79, line: 1761, column: 2)
!1714 = !DILocation(line: 1762, column: 18, scope: !1713)
!1715 = !DILocation(line: 1762, column: 16, scope: !1713)
!1716 = !DILocation(line: 1763, column: 2, scope: !1713)
!1717 = !DILocation(line: 1764, column: 5, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1699, file: !79, line: 1764, column: 5)
!1719 = !DILocation(line: 1764, column: 10, scope: !1718)
!1720 = !DILocation(line: 1764, column: 5, scope: !1699)
!1721 = !DILocation(line: 1766, column: 6, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1723, file: !79, line: 1766, column: 6)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !79, line: 1765, column: 2)
!1724 = !DILocation(line: 1766, column: 11, scope: !1722)
!1725 = !DILocation(line: 1766, column: 6, scope: !1723)
!1726 = !DILocation(line: 1768, column: 21, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1728, file: !79, line: 1768, column: 7)
!1728 = distinct !DILexicalBlock(scope: !1722, file: !79, line: 1767, column: 3)
!1729 = !DILocation(line: 1768, column: 19, scope: !1727)
!1730 = !DILocation(line: 1768, column: 37, scope: !1727)
!1731 = !DILocation(line: 1768, column: 35, scope: !1727)
!1732 = !DILocation(line: 1768, column: 7, scope: !1728)
!1733 = !DILocation(line: 1770, column: 13, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1727, file: !79, line: 1769, column: 4)
!1735 = !DILocation(line: 1770, column: 20, scope: !1734)
!1736 = !DILocation(line: 1770, column: 18, scope: !1734)
!1737 = !DILocation(line: 1770, column: 5, scope: !1734)
!1738 = !DILocation(line: 1774, column: 5, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1727, file: !79, line: 1773, column: 4)
!1740 = !DILocation(line: 1779, column: 21, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1742, file: !79, line: 1779, column: 7)
!1742 = distinct !DILexicalBlock(scope: !1722, file: !79, line: 1778, column: 3)
!1743 = !DILocation(line: 1779, column: 19, scope: !1741)
!1744 = !DILocation(line: 1779, column: 29, scope: !1741)
!1745 = !DILocation(line: 1779, column: 27, scope: !1741)
!1746 = !DILocation(line: 1779, column: 7, scope: !1742)
!1747 = !DILocation(line: 1781, column: 5, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1741, file: !79, line: 1780, column: 4)
!1749 = !DILocation(line: 1785, column: 13, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1741, file: !79, line: 1784, column: 4)
!1751 = !DILocation(line: 1785, column: 20, scope: !1750)
!1752 = !DILocation(line: 1785, column: 18, scope: !1750)
!1753 = !DILocation(line: 1785, column: 5, scope: !1750)
!1754 = !DILocation(line: 1791, column: 3, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1718, file: !79, line: 1790, column: 2)
!1756 = !DILocation(line: 1793, column: 1, scope: !1699)
!1757 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !79, file: !79, line: 1810, type: !779, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1758 = !DILocalVariable(name: "val1", arg: 1, scope: !1757, file: !79, line: 1810, type: !87)
!1759 = !DILocation(line: 1810, column: 30, scope: !1757)
!1760 = !DILocalVariable(name: "val2", arg: 2, scope: !1757, file: !79, line: 1810, type: !22)
!1761 = !DILocation(line: 1810, column: 39, scope: !1757)
!1762 = !DILocalVariable(name: "u32Temp1", scope: !1757, file: !79, line: 1812, type: !743)
!1763 = !DILocation(line: 1812, column: 6, scope: !1757)
!1764 = !DILocalVariable(name: "u32Temp2", scope: !1757, file: !79, line: 1812, type: !743)
!1765 = !DILocation(line: 1812, column: 17, scope: !1757)
!1766 = !DILocalVariable(name: "u32Temp3", scope: !1757, file: !79, line: 1812, type: !743)
!1767 = !DILocation(line: 1812, column: 26, scope: !1757)
!1768 = !DILocalVariable(name: "u8SignBit", scope: !1757, file: !79, line: 1813, type: !17)
!1769 = !DILocation(line: 1813, column: 5, scope: !1757)
!1770 = !DILocation(line: 1815, column: 5, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1757, file: !79, line: 1815, column: 5)
!1772 = !DILocation(line: 1815, column: 9, scope: !1771)
!1773 = !DILocation(line: 1815, column: 5, scope: !1757)
!1774 = !DILocation(line: 1817, column: 15, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1771, file: !79, line: 1816, column: 2)
!1776 = !DILocation(line: 1817, column: 14, scope: !1775)
!1777 = !DILocation(line: 1817, column: 12, scope: !1775)
!1778 = !DILocation(line: 1818, column: 13, scope: !1775)
!1779 = !DILocation(line: 1819, column: 2, scope: !1775)
!1780 = !DILocation(line: 1822, column: 14, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1771, file: !79, line: 1821, column: 2)
!1782 = !DILocation(line: 1822, column: 12, scope: !1781)
!1783 = !DILocation(line: 1823, column: 13, scope: !1781)
!1784 = !DILocation(line: 1826, column: 13, scope: !1757)
!1785 = !DILocation(line: 1826, column: 24, scope: !1757)
!1786 = !DILocation(line: 1826, column: 22, scope: !1757)
!1787 = !DILocation(line: 1826, column: 11, scope: !1757)
!1788 = !DILocation(line: 1827, column: 25, scope: !1757)
!1789 = !DILocation(line: 1827, column: 35, scope: !1757)
!1790 = !DILocation(line: 1827, column: 13, scope: !1757)
!1791 = !DILocation(line: 1827, column: 11, scope: !1757)
!1792 = !DILocation(line: 1828, column: 13, scope: !1757)
!1793 = !DILocation(line: 1828, column: 22, scope: !1757)
!1794 = !DILocation(line: 1828, column: 11, scope: !1757)
!1795 = !DILocation(line: 1829, column: 14, scope: !1757)
!1796 = !DILocation(line: 1829, column: 23, scope: !1757)
!1797 = !DILocation(line: 1829, column: 11, scope: !1757)
!1798 = !DILocation(line: 1830, column: 5, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1757, file: !79, line: 1830, column: 5)
!1800 = !DILocation(line: 1830, column: 15, scope: !1799)
!1801 = !DILocation(line: 1830, column: 5, scope: !1757)
!1802 = !DILocation(line: 1832, column: 10, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1799, file: !79, line: 1831, column: 2)
!1804 = !DILocation(line: 1832, column: 3, scope: !1803)
!1805 = !DILocation(line: 1836, column: 11, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1799, file: !79, line: 1835, column: 2)
!1807 = !DILocation(line: 1836, column: 10, scope: !1806)
!1808 = !DILocation(line: 1836, column: 3, scope: !1806)
!1809 = !DILocation(line: 1838, column: 1, scope: !1757)
!1810 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !79, file: !79, line: 1857, type: !779, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1811 = !DILocalVariable(name: "val1", arg: 1, scope: !1810, file: !79, line: 1857, type: !87)
!1812 = !DILocation(line: 1857, column: 30, scope: !1810)
!1813 = !DILocalVariable(name: "val2", arg: 2, scope: !1810, file: !79, line: 1857, type: !22)
!1814 = !DILocation(line: 1857, column: 39, scope: !1810)
!1815 = !DILocalVariable(name: "u32Temp1", scope: !1810, file: !79, line: 1859, type: !743)
!1816 = !DILocation(line: 1859, column: 6, scope: !1810)
!1817 = !DILocalVariable(name: "u32Temp2", scope: !1810, file: !79, line: 1859, type: !743)
!1818 = !DILocation(line: 1859, column: 17, scope: !1810)
!1819 = !DILocalVariable(name: "u32Temp3", scope: !1810, file: !79, line: 1859, type: !743)
!1820 = !DILocation(line: 1859, column: 26, scope: !1810)
!1821 = !DILocalVariable(name: "u8SignBit", scope: !1810, file: !79, line: 1860, type: !17)
!1822 = !DILocation(line: 1860, column: 5, scope: !1810)
!1823 = !DILocation(line: 1862, column: 5, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1810, file: !79, line: 1862, column: 5)
!1825 = !DILocation(line: 1862, column: 9, scope: !1824)
!1826 = !DILocation(line: 1862, column: 5, scope: !1810)
!1827 = !DILocation(line: 1864, column: 15, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1824, file: !79, line: 1863, column: 2)
!1829 = !DILocation(line: 1864, column: 14, scope: !1828)
!1830 = !DILocation(line: 1864, column: 12, scope: !1828)
!1831 = !DILocation(line: 1865, column: 13, scope: !1828)
!1832 = !DILocation(line: 1866, column: 2, scope: !1828)
!1833 = !DILocation(line: 1869, column: 14, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !1824, file: !79, line: 1868, column: 2)
!1835 = !DILocation(line: 1869, column: 12, scope: !1834)
!1836 = !DILocation(line: 1870, column: 13, scope: !1834)
!1837 = !DILocation(line: 1873, column: 13, scope: !1810)
!1838 = !DILocation(line: 1873, column: 24, scope: !1810)
!1839 = !DILocation(line: 1873, column: 22, scope: !1810)
!1840 = !DILocation(line: 1873, column: 11, scope: !1810)
!1841 = !DILocation(line: 1874, column: 25, scope: !1810)
!1842 = !DILocation(line: 1874, column: 35, scope: !1810)
!1843 = !DILocation(line: 1874, column: 13, scope: !1810)
!1844 = !DILocation(line: 1874, column: 11, scope: !1810)
!1845 = !DILocation(line: 1875, column: 13, scope: !1810)
!1846 = !DILocation(line: 1875, column: 22, scope: !1810)
!1847 = !DILocation(line: 1875, column: 11, scope: !1810)
!1848 = !DILocation(line: 1876, column: 14, scope: !1810)
!1849 = !DILocation(line: 1876, column: 23, scope: !1810)
!1850 = !DILocation(line: 1876, column: 11, scope: !1810)
!1851 = !DILocation(line: 1877, column: 5, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1810, file: !79, line: 1877, column: 5)
!1853 = !DILocation(line: 1877, column: 15, scope: !1852)
!1854 = !DILocation(line: 1877, column: 5, scope: !1810)
!1855 = !DILocation(line: 1879, column: 6, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1857, file: !79, line: 1879, column: 6)
!1857 = distinct !DILexicalBlock(scope: !1852, file: !79, line: 1878, column: 2)
!1858 = !DILocation(line: 1879, column: 14, scope: !1856)
!1859 = !DILocation(line: 1879, column: 6, scope: !1857)
!1860 = !DILocation(line: 1880, column: 11, scope: !1856)
!1861 = !DILocation(line: 1880, column: 4, scope: !1856)
!1862 = !DILocation(line: 1882, column: 4, scope: !1856)
!1863 = !DILocation(line: 1886, column: 6, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1865, file: !79, line: 1886, column: 6)
!1865 = distinct !DILexicalBlock(scope: !1852, file: !79, line: 1885, column: 2)
!1866 = !DILocation(line: 1886, column: 14, scope: !1864)
!1867 = !DILocation(line: 1886, column: 6, scope: !1865)
!1868 = !DILocation(line: 1887, column: 12, scope: !1864)
!1869 = !DILocation(line: 1887, column: 11, scope: !1864)
!1870 = !DILocation(line: 1887, column: 4, scope: !1864)
!1871 = !DILocation(line: 1889, column: 4, scope: !1864)
!1872 = !DILocation(line: 1891, column: 1, scope: !1810)
!1873 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !79, file: !79, line: 1911, type: !1874, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1874 = !DISubroutineType(types: !1875)
!1875 = !{!87, !87, !13}
!1876 = !DILocalVariable(name: "val1", arg: 1, scope: !1873, file: !79, line: 1911, type: !87)
!1877 = !DILocation(line: 1911, column: 30, scope: !1873)
!1878 = !DILocalVariable(name: "val2", arg: 2, scope: !1873, file: !79, line: 1911, type: !13)
!1879 = !DILocation(line: 1911, column: 39, scope: !1873)
!1880 = !DILocalVariable(name: "u32Temp1", scope: !1873, file: !79, line: 1913, type: !743)
!1881 = !DILocation(line: 1913, column: 6, scope: !1873)
!1882 = !DILocalVariable(name: "u32Temp2", scope: !1873, file: !79, line: 1913, type: !743)
!1883 = !DILocation(line: 1913, column: 17, scope: !1873)
!1884 = !DILocalVariable(name: "u32Temp3", scope: !1873, file: !79, line: 1913, type: !743)
!1885 = !DILocation(line: 1913, column: 26, scope: !1873)
!1886 = !DILocalVariable(name: "u32Temp4", scope: !1873, file: !79, line: 1913, type: !743)
!1887 = !DILocation(line: 1913, column: 35, scope: !1873)
!1888 = !DILocalVariable(name: "u8SignBit", scope: !1873, file: !79, line: 1914, type: !17)
!1889 = !DILocation(line: 1914, column: 5, scope: !1873)
!1890 = !DILocation(line: 1916, column: 7, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1873, file: !79, line: 1916, column: 5)
!1892 = !DILocation(line: 1916, column: 11, scope: !1891)
!1893 = !DILocation(line: 1916, column: 15, scope: !1891)
!1894 = !DILocation(line: 1916, column: 19, scope: !1891)
!1895 = !DILocation(line: 1916, column: 23, scope: !1891)
!1896 = !DILocation(line: 1916, column: 28, scope: !1891)
!1897 = !DILocation(line: 1916, column: 33, scope: !1891)
!1898 = !DILocation(line: 1916, column: 37, scope: !1891)
!1899 = !DILocation(line: 1916, column: 41, scope: !1891)
!1900 = !DILocation(line: 1916, column: 45, scope: !1891)
!1901 = !DILocation(line: 1916, column: 49, scope: !1891)
!1902 = !DILocation(line: 1916, column: 5, scope: !1873)
!1903 = !DILocation(line: 1918, column: 13, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1891, file: !79, line: 1917, column: 2)
!1905 = !DILocation(line: 1919, column: 2, scope: !1904)
!1906 = !DILocation(line: 1922, column: 13, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1891, file: !79, line: 1921, column: 2)
!1908 = !DILocation(line: 1925, column: 5, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1873, file: !79, line: 1925, column: 5)
!1910 = !DILocation(line: 1925, column: 9, scope: !1909)
!1911 = !DILocation(line: 1925, column: 5, scope: !1873)
!1912 = !DILocation(line: 1927, column: 15, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1909, file: !79, line: 1926, column: 2)
!1914 = !DILocation(line: 1927, column: 14, scope: !1913)
!1915 = !DILocation(line: 1927, column: 12, scope: !1913)
!1916 = !DILocation(line: 1928, column: 2, scope: !1913)
!1917 = !DILocation(line: 1931, column: 14, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1909, file: !79, line: 1930, column: 2)
!1919 = !DILocation(line: 1931, column: 12, scope: !1918)
!1920 = !DILocation(line: 1934, column: 5, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1873, file: !79, line: 1934, column: 5)
!1922 = !DILocation(line: 1934, column: 9, scope: !1921)
!1923 = !DILocation(line: 1934, column: 5, scope: !1873)
!1924 = !DILocation(line: 1936, column: 15, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1921, file: !79, line: 1935, column: 2)
!1926 = !DILocation(line: 1936, column: 14, scope: !1925)
!1927 = !DILocation(line: 1936, column: 12, scope: !1925)
!1928 = !DILocation(line: 1937, column: 2, scope: !1925)
!1929 = !DILocation(line: 1940, column: 14, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1921, file: !79, line: 1939, column: 2)
!1931 = !DILocation(line: 1940, column: 12, scope: !1930)
!1932 = !DILocation(line: 1943, column: 13, scope: !1873)
!1933 = !DILocation(line: 1943, column: 24, scope: !1873)
!1934 = !DILocation(line: 1943, column: 22, scope: !1873)
!1935 = !DILocation(line: 1943, column: 11, scope: !1873)
!1936 = !DILocation(line: 1944, column: 25, scope: !1873)
!1937 = !DILocation(line: 1944, column: 35, scope: !1873)
!1938 = !DILocation(line: 1944, column: 13, scope: !1873)
!1939 = !DILocation(line: 1944, column: 11, scope: !1873)
!1940 = !DILocation(line: 1945, column: 13, scope: !1873)
!1941 = !DILocation(line: 1945, column: 22, scope: !1873)
!1942 = !DILocation(line: 1945, column: 11, scope: !1873)
!1943 = !DILocation(line: 1946, column: 14, scope: !1873)
!1944 = !DILocation(line: 1946, column: 23, scope: !1873)
!1945 = !DILocation(line: 1946, column: 11, scope: !1873)
!1946 = !DILocation(line: 1947, column: 5, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1873, file: !79, line: 1947, column: 5)
!1948 = !DILocation(line: 1947, column: 15, scope: !1947)
!1949 = !DILocation(line: 1947, column: 5, scope: !1873)
!1950 = !DILocation(line: 1949, column: 6, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1952, file: !79, line: 1949, column: 6)
!1952 = distinct !DILexicalBlock(scope: !1947, file: !79, line: 1948, column: 2)
!1953 = !DILocation(line: 1949, column: 14, scope: !1951)
!1954 = !DILocation(line: 1949, column: 6, scope: !1952)
!1955 = !DILocation(line: 1950, column: 11, scope: !1951)
!1956 = !DILocation(line: 1950, column: 4, scope: !1951)
!1957 = !DILocation(line: 1952, column: 4, scope: !1951)
!1958 = !DILocation(line: 1956, column: 11, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1947, file: !79, line: 1955, column: 2)
!1960 = !DILocation(line: 1956, column: 10, scope: !1959)
!1961 = !DILocation(line: 1956, column: 3, scope: !1959)
!1962 = !DILocation(line: 1958, column: 1, scope: !1873)
!1963 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !79, file: !79, line: 1977, type: !1874, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1964 = !DILocalVariable(name: "val1", arg: 1, scope: !1963, file: !79, line: 1977, type: !87)
!1965 = !DILocation(line: 1977, column: 30, scope: !1963)
!1966 = !DILocalVariable(name: "val2", arg: 2, scope: !1963, file: !79, line: 1977, type: !13)
!1967 = !DILocation(line: 1977, column: 39, scope: !1963)
!1968 = !DILocalVariable(name: "u32Temp1", scope: !1963, file: !79, line: 1979, type: !743)
!1969 = !DILocation(line: 1979, column: 6, scope: !1963)
!1970 = !DILocalVariable(name: "u32Temp2", scope: !1963, file: !79, line: 1979, type: !743)
!1971 = !DILocation(line: 1979, column: 17, scope: !1963)
!1972 = !DILocalVariable(name: "u32Temp3", scope: !1963, file: !79, line: 1979, type: !743)
!1973 = !DILocation(line: 1979, column: 26, scope: !1963)
!1974 = !DILocalVariable(name: "u32Temp4", scope: !1963, file: !79, line: 1979, type: !743)
!1975 = !DILocation(line: 1979, column: 35, scope: !1963)
!1976 = !DILocalVariable(name: "u8SignBit", scope: !1963, file: !79, line: 1980, type: !17)
!1977 = !DILocation(line: 1980, column: 5, scope: !1963)
!1978 = !DILocation(line: 1982, column: 7, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1963, file: !79, line: 1982, column: 5)
!1980 = !DILocation(line: 1982, column: 11, scope: !1979)
!1981 = !DILocation(line: 1982, column: 15, scope: !1979)
!1982 = !DILocation(line: 1982, column: 19, scope: !1979)
!1983 = !DILocation(line: 1982, column: 23, scope: !1979)
!1984 = !DILocation(line: 1982, column: 28, scope: !1979)
!1985 = !DILocation(line: 1982, column: 33, scope: !1979)
!1986 = !DILocation(line: 1982, column: 37, scope: !1979)
!1987 = !DILocation(line: 1982, column: 41, scope: !1979)
!1988 = !DILocation(line: 1982, column: 45, scope: !1979)
!1989 = !DILocation(line: 1982, column: 49, scope: !1979)
!1990 = !DILocation(line: 1982, column: 5, scope: !1963)
!1991 = !DILocation(line: 1984, column: 13, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1979, file: !79, line: 1983, column: 2)
!1993 = !DILocation(line: 1985, column: 2, scope: !1992)
!1994 = !DILocation(line: 1988, column: 13, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1979, file: !79, line: 1987, column: 2)
!1996 = !DILocation(line: 1991, column: 5, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1963, file: !79, line: 1991, column: 5)
!1998 = !DILocation(line: 1991, column: 9, scope: !1997)
!1999 = !DILocation(line: 1991, column: 5, scope: !1963)
!2000 = !DILocation(line: 1993, column: 15, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1997, file: !79, line: 1992, column: 2)
!2002 = !DILocation(line: 1993, column: 14, scope: !2001)
!2003 = !DILocation(line: 1993, column: 12, scope: !2001)
!2004 = !DILocation(line: 1994, column: 2, scope: !2001)
!2005 = !DILocation(line: 1997, column: 14, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !1997, file: !79, line: 1996, column: 2)
!2007 = !DILocation(line: 1997, column: 12, scope: !2006)
!2008 = !DILocation(line: 2000, column: 5, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !1963, file: !79, line: 2000, column: 5)
!2010 = !DILocation(line: 2000, column: 9, scope: !2009)
!2011 = !DILocation(line: 2000, column: 5, scope: !1963)
!2012 = !DILocation(line: 2002, column: 15, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2009, file: !79, line: 2001, column: 2)
!2014 = !DILocation(line: 2002, column: 14, scope: !2013)
!2015 = !DILocation(line: 2002, column: 12, scope: !2013)
!2016 = !DILocation(line: 2003, column: 2, scope: !2013)
!2017 = !DILocation(line: 2006, column: 14, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2009, file: !79, line: 2005, column: 2)
!2019 = !DILocation(line: 2006, column: 12, scope: !2018)
!2020 = !DILocation(line: 2009, column: 13, scope: !1963)
!2021 = !DILocation(line: 2009, column: 24, scope: !1963)
!2022 = !DILocation(line: 2009, column: 22, scope: !1963)
!2023 = !DILocation(line: 2009, column: 11, scope: !1963)
!2024 = !DILocation(line: 2010, column: 25, scope: !1963)
!2025 = !DILocation(line: 2010, column: 35, scope: !1963)
!2026 = !DILocation(line: 2010, column: 13, scope: !1963)
!2027 = !DILocation(line: 2010, column: 11, scope: !1963)
!2028 = !DILocation(line: 2011, column: 13, scope: !1963)
!2029 = !DILocation(line: 2011, column: 22, scope: !1963)
!2030 = !DILocation(line: 2011, column: 11, scope: !1963)
!2031 = !DILocation(line: 2012, column: 14, scope: !1963)
!2032 = !DILocation(line: 2012, column: 23, scope: !1963)
!2033 = !DILocation(line: 2012, column: 11, scope: !1963)
!2034 = !DILocation(line: 2013, column: 6, scope: !2035)
!2035 = distinct !DILexicalBlock(scope: !1963, file: !79, line: 2013, column: 5)
!2036 = !DILocation(line: 2013, column: 14, scope: !2035)
!2037 = !DILocation(line: 2013, column: 19, scope: !2035)
!2038 = !DILocation(line: 2013, column: 5, scope: !1963)
!2039 = !DILocation(line: 2015, column: 6, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2041, file: !79, line: 2015, column: 6)
!2041 = distinct !DILexicalBlock(scope: !2035, file: !79, line: 2014, column: 2)
!2042 = !DILocation(line: 2015, column: 16, scope: !2040)
!2043 = !DILocation(line: 2015, column: 6, scope: !2041)
!2044 = !DILocation(line: 2017, column: 7, scope: !2045)
!2045 = distinct !DILexicalBlock(scope: !2046, file: !79, line: 2017, column: 7)
!2046 = distinct !DILexicalBlock(scope: !2040, file: !79, line: 2016, column: 3)
!2047 = !DILocation(line: 2017, column: 15, scope: !2045)
!2048 = !DILocation(line: 2017, column: 7, scope: !2046)
!2049 = !DILocation(line: 2018, column: 12, scope: !2045)
!2050 = !DILocation(line: 2018, column: 5, scope: !2045)
!2051 = !DILocation(line: 2020, column: 5, scope: !2045)
!2052 = !DILocation(line: 2024, column: 7, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2054, file: !79, line: 2024, column: 7)
!2054 = distinct !DILexicalBlock(scope: !2040, file: !79, line: 2023, column: 3)
!2055 = !DILocation(line: 2024, column: 15, scope: !2053)
!2056 = !DILocation(line: 2024, column: 7, scope: !2054)
!2057 = !DILocation(line: 2025, column: 13, scope: !2053)
!2058 = !DILocation(line: 2025, column: 12, scope: !2053)
!2059 = !DILocation(line: 2025, column: 5, scope: !2053)
!2060 = !DILocation(line: 2027, column: 5, scope: !2053)
!2061 = !DILocation(line: 2032, column: 3, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2035, file: !79, line: 2031, column: 2)
!2063 = !DILocation(line: 2034, column: 1, scope: !1963)
!2064 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !79, file: !79, line: 2049, type: !2065, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2065 = !DISubroutineType(types: !2066)
!2066 = !{!87, !87, !743}
!2067 = !DILocalVariable(name: "val1", arg: 1, scope: !2064, file: !79, line: 2049, type: !87)
!2068 = !DILocation(line: 2049, column: 30, scope: !2064)
!2069 = !DILocalVariable(name: "val2", arg: 2, scope: !2064, file: !79, line: 2049, type: !743)
!2070 = !DILocation(line: 2049, column: 39, scope: !2064)
!2071 = !DILocalVariable(name: "u32Temp1", scope: !2064, file: !79, line: 2051, type: !743)
!2072 = !DILocation(line: 2051, column: 6, scope: !2064)
!2073 = !DILocalVariable(name: "u32Temp2", scope: !2064, file: !79, line: 2051, type: !743)
!2074 = !DILocation(line: 2051, column: 17, scope: !2064)
!2075 = !DILocalVariable(name: "u8SignBit", scope: !2064, file: !79, line: 2052, type: !17)
!2076 = !DILocation(line: 2052, column: 5, scope: !2064)
!2077 = !DILocation(line: 2054, column: 5, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2064, file: !79, line: 2054, column: 5)
!2079 = !DILocation(line: 2054, column: 9, scope: !2078)
!2080 = !DILocation(line: 2054, column: 5, scope: !2064)
!2081 = !DILocation(line: 2056, column: 15, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2078, file: !79, line: 2055, column: 2)
!2083 = !DILocation(line: 2056, column: 14, scope: !2082)
!2084 = !DILocation(line: 2056, column: 12, scope: !2082)
!2085 = !DILocation(line: 2057, column: 13, scope: !2082)
!2086 = !DILocation(line: 2058, column: 2, scope: !2082)
!2087 = !DILocation(line: 2061, column: 14, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2078, file: !79, line: 2060, column: 2)
!2089 = !DILocation(line: 2061, column: 12, scope: !2088)
!2090 = !DILocation(line: 2062, column: 13, scope: !2088)
!2091 = !DILocation(line: 2065, column: 25, scope: !2064)
!2092 = !DILocation(line: 2065, column: 35, scope: !2064)
!2093 = !DILocation(line: 2065, column: 13, scope: !2064)
!2094 = !DILocation(line: 2065, column: 11, scope: !2064)
!2095 = !DILocation(line: 2066, column: 5, scope: !2096)
!2096 = distinct !DILexicalBlock(scope: !2064, file: !79, line: 2066, column: 5)
!2097 = !DILocation(line: 2066, column: 15, scope: !2096)
!2098 = !DILocation(line: 2066, column: 5, scope: !2064)
!2099 = !DILocation(line: 2067, column: 10, scope: !2096)
!2100 = !DILocation(line: 2067, column: 3, scope: !2096)
!2101 = !DILocation(line: 2069, column: 11, scope: !2096)
!2102 = !DILocation(line: 2069, column: 10, scope: !2096)
!2103 = !DILocation(line: 2069, column: 3, scope: !2096)
!2104 = !DILocation(line: 2070, column: 1, scope: !2064)
!2105 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !79, file: !79, line: 2089, type: !2065, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2106 = !DILocalVariable(name: "val1", arg: 1, scope: !2105, file: !79, line: 2089, type: !87)
!2107 = !DILocation(line: 2089, column: 30, scope: !2105)
!2108 = !DILocalVariable(name: "val2", arg: 2, scope: !2105, file: !79, line: 2089, type: !743)
!2109 = !DILocation(line: 2089, column: 39, scope: !2105)
!2110 = !DILocalVariable(name: "u32Temp1", scope: !2105, file: !79, line: 2091, type: !743)
!2111 = !DILocation(line: 2091, column: 6, scope: !2105)
!2112 = !DILocalVariable(name: "u32Temp2", scope: !2105, file: !79, line: 2091, type: !743)
!2113 = !DILocation(line: 2091, column: 17, scope: !2105)
!2114 = !DILocalVariable(name: "u32Temp3", scope: !2105, file: !79, line: 2091, type: !743)
!2115 = !DILocation(line: 2091, column: 26, scope: !2105)
!2116 = !DILocalVariable(name: "u8SignBit", scope: !2105, file: !79, line: 2092, type: !17)
!2117 = !DILocation(line: 2092, column: 5, scope: !2105)
!2118 = !DILocation(line: 2094, column: 5, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2105, file: !79, line: 2094, column: 5)
!2120 = !DILocation(line: 2094, column: 9, scope: !2119)
!2121 = !DILocation(line: 2094, column: 5, scope: !2105)
!2122 = !DILocation(line: 2096, column: 15, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2119, file: !79, line: 2095, column: 2)
!2124 = !DILocation(line: 2096, column: 14, scope: !2123)
!2125 = !DILocation(line: 2096, column: 12, scope: !2123)
!2126 = !DILocation(line: 2097, column: 13, scope: !2123)
!2127 = !DILocation(line: 2098, column: 2, scope: !2123)
!2128 = !DILocation(line: 2101, column: 14, scope: !2129)
!2129 = distinct !DILexicalBlock(scope: !2119, file: !79, line: 2100, column: 2)
!2130 = !DILocation(line: 2101, column: 12, scope: !2129)
!2131 = !DILocation(line: 2102, column: 13, scope: !2129)
!2132 = !DILocation(line: 2105, column: 13, scope: !2105)
!2133 = !DILocation(line: 2105, column: 24, scope: !2105)
!2134 = !DILocation(line: 2105, column: 22, scope: !2105)
!2135 = !DILocation(line: 2105, column: 11, scope: !2105)
!2136 = !DILocation(line: 2106, column: 25, scope: !2105)
!2137 = !DILocation(line: 2106, column: 35, scope: !2105)
!2138 = !DILocation(line: 2106, column: 13, scope: !2105)
!2139 = !DILocation(line: 2106, column: 11, scope: !2105)
!2140 = !DILocation(line: 2107, column: 13, scope: !2105)
!2141 = !DILocation(line: 2107, column: 22, scope: !2105)
!2142 = !DILocation(line: 2107, column: 11, scope: !2105)
!2143 = !DILocation(line: 2108, column: 14, scope: !2105)
!2144 = !DILocation(line: 2108, column: 23, scope: !2105)
!2145 = !DILocation(line: 2108, column: 11, scope: !2105)
!2146 = !DILocation(line: 2109, column: 5, scope: !2147)
!2147 = distinct !DILexicalBlock(scope: !2105, file: !79, line: 2109, column: 5)
!2148 = !DILocation(line: 2109, column: 15, scope: !2147)
!2149 = !DILocation(line: 2109, column: 5, scope: !2105)
!2150 = !DILocation(line: 2111, column: 6, scope: !2151)
!2151 = distinct !DILexicalBlock(scope: !2152, file: !79, line: 2111, column: 6)
!2152 = distinct !DILexicalBlock(scope: !2147, file: !79, line: 2110, column: 2)
!2153 = !DILocation(line: 2111, column: 14, scope: !2151)
!2154 = !DILocation(line: 2111, column: 6, scope: !2152)
!2155 = !DILocation(line: 2112, column: 11, scope: !2151)
!2156 = !DILocation(line: 2112, column: 4, scope: !2151)
!2157 = !DILocation(line: 2114, column: 4, scope: !2151)
!2158 = !DILocation(line: 2118, column: 6, scope: !2159)
!2159 = distinct !DILexicalBlock(scope: !2160, file: !79, line: 2118, column: 6)
!2160 = distinct !DILexicalBlock(scope: !2147, file: !79, line: 2117, column: 2)
!2161 = !DILocation(line: 2118, column: 14, scope: !2159)
!2162 = !DILocation(line: 2118, column: 6, scope: !2160)
!2163 = !DILocation(line: 2119, column: 12, scope: !2159)
!2164 = !DILocation(line: 2119, column: 11, scope: !2159)
!2165 = !DILocation(line: 2119, column: 4, scope: !2159)
!2166 = !DILocation(line: 2121, column: 4, scope: !2159)
!2167 = !DILocation(line: 2123, column: 1, scope: !2105)
!2168 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !79, file: !79, line: 2141, type: !2169, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2169 = !DISubroutineType(types: !2170)
!2170 = !{!87, !87, !87}
!2171 = !DILocalVariable(name: "value", arg: 1, scope: !2168, file: !79, line: 2141, type: !87)
!2172 = !DILocation(line: 2141, column: 30, scope: !2168)
!2173 = !DILocalVariable(name: "factor", arg: 2, scope: !2168, file: !79, line: 2141, type: !87)
!2174 = !DILocation(line: 2141, column: 41, scope: !2168)
!2175 = !DILocalVariable(name: "u32Temp1", scope: !2168, file: !79, line: 2143, type: !743)
!2176 = !DILocation(line: 2143, column: 6, scope: !2168)
!2177 = !DILocalVariable(name: "u32Temp2", scope: !2168, file: !79, line: 2143, type: !743)
!2178 = !DILocation(line: 2143, column: 17, scope: !2168)
!2179 = !DILocalVariable(name: "u32Temp3", scope: !2168, file: !79, line: 2143, type: !743)
!2180 = !DILocation(line: 2143, column: 26, scope: !2168)
!2181 = !DILocalVariable(name: "u32Temp4", scope: !2168, file: !79, line: 2143, type: !743)
!2182 = !DILocation(line: 2143, column: 35, scope: !2168)
!2183 = !DILocalVariable(name: "u8SignBit", scope: !2168, file: !79, line: 2144, type: !17)
!2184 = !DILocation(line: 2144, column: 5, scope: !2168)
!2185 = !DILocation(line: 2146, column: 7, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2168, file: !79, line: 2146, column: 5)
!2187 = !DILocation(line: 2146, column: 12, scope: !2186)
!2188 = !DILocation(line: 2146, column: 16, scope: !2186)
!2189 = !DILocation(line: 2146, column: 36, scope: !2186)
!2190 = !DILocation(line: 2146, column: 41, scope: !2186)
!2191 = !DILocation(line: 2146, column: 45, scope: !2186)
!2192 = !DILocation(line: 2148, column: 13, scope: !2193)
!2193 = distinct !DILexicalBlock(scope: !2186, file: !79, line: 2147, column: 2)
!2194 = !DILocation(line: 2149, column: 2, scope: !2193)
!2195 = !DILocation(line: 2152, column: 13, scope: !2196)
!2196 = distinct !DILexicalBlock(scope: !2186, file: !79, line: 2151, column: 2)
!2197 = !DILocation(line: 2155, column: 5, scope: !2198)
!2198 = distinct !DILexicalBlock(scope: !2168, file: !79, line: 2155, column: 5)
!2199 = !DILocation(line: 2155, column: 10, scope: !2198)
!2200 = !DILocation(line: 2155, column: 5, scope: !2168)
!2201 = !DILocation(line: 2157, column: 15, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2198, file: !79, line: 2156, column: 2)
!2203 = !DILocation(line: 2157, column: 14, scope: !2202)
!2204 = !DILocation(line: 2157, column: 12, scope: !2202)
!2205 = !DILocation(line: 2158, column: 2, scope: !2202)
!2206 = !DILocation(line: 2161, column: 14, scope: !2207)
!2207 = distinct !DILexicalBlock(scope: !2198, file: !79, line: 2160, column: 2)
!2208 = !DILocation(line: 2161, column: 12, scope: !2207)
!2209 = !DILocation(line: 2164, column: 5, scope: !2210)
!2210 = distinct !DILexicalBlock(scope: !2168, file: !79, line: 2164, column: 5)
!2211 = !DILocation(line: 2164, column: 11, scope: !2210)
!2212 = !DILocation(line: 2164, column: 5, scope: !2168)
!2213 = !DILocation(line: 2166, column: 15, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2210, file: !79, line: 2165, column: 2)
!2215 = !DILocation(line: 2166, column: 14, scope: !2214)
!2216 = !DILocation(line: 2166, column: 12, scope: !2214)
!2217 = !DILocation(line: 2167, column: 2, scope: !2214)
!2218 = !DILocation(line: 2170, column: 14, scope: !2219)
!2219 = distinct !DILexicalBlock(scope: !2210, file: !79, line: 2169, column: 2)
!2220 = !DILocation(line: 2170, column: 12, scope: !2219)
!2221 = !DILocation(line: 2173, column: 13, scope: !2168)
!2222 = !DILocation(line: 2173, column: 24, scope: !2168)
!2223 = !DILocation(line: 2173, column: 22, scope: !2168)
!2224 = !DILocation(line: 2173, column: 11, scope: !2168)
!2225 = !DILocation(line: 2174, column: 25, scope: !2168)
!2226 = !DILocation(line: 2174, column: 35, scope: !2168)
!2227 = !DILocation(line: 2174, column: 13, scope: !2168)
!2228 = !DILocation(line: 2174, column: 11, scope: !2168)
!2229 = !DILocation(line: 2175, column: 13, scope: !2168)
!2230 = !DILocation(line: 2175, column: 22, scope: !2168)
!2231 = !DILocation(line: 2175, column: 11, scope: !2168)
!2232 = !DILocation(line: 2176, column: 14, scope: !2168)
!2233 = !DILocation(line: 2176, column: 23, scope: !2168)
!2234 = !DILocation(line: 2176, column: 11, scope: !2168)
!2235 = !DILocation(line: 2177, column: 5, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2168, file: !79, line: 2177, column: 5)
!2237 = !DILocation(line: 2177, column: 15, scope: !2236)
!2238 = !DILocation(line: 2177, column: 5, scope: !2168)
!2239 = !DILocation(line: 2179, column: 6, scope: !2240)
!2240 = distinct !DILexicalBlock(scope: !2241, file: !79, line: 2179, column: 6)
!2241 = distinct !DILexicalBlock(scope: !2236, file: !79, line: 2178, column: 2)
!2242 = !DILocation(line: 2179, column: 14, scope: !2240)
!2243 = !DILocation(line: 2179, column: 6, scope: !2241)
!2244 = !DILocation(line: 2180, column: 11, scope: !2240)
!2245 = !DILocation(line: 2180, column: 4, scope: !2240)
!2246 = !DILocation(line: 2182, column: 4, scope: !2240)
!2247 = !DILocation(line: 2186, column: 11, scope: !2248)
!2248 = distinct !DILexicalBlock(scope: !2236, file: !79, line: 2185, column: 2)
!2249 = !DILocation(line: 2186, column: 10, scope: !2248)
!2250 = !DILocation(line: 2186, column: 3, scope: !2248)
!2251 = !DILocation(line: 2188, column: 1, scope: !2168)
!2252 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !79, file: !79, line: 2207, type: !2169, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2253 = !DILocalVariable(name: "value", arg: 1, scope: !2252, file: !79, line: 2207, type: !87)
!2254 = !DILocation(line: 2207, column: 30, scope: !2252)
!2255 = !DILocalVariable(name: "factor", arg: 2, scope: !2252, file: !79, line: 2207, type: !87)
!2256 = !DILocation(line: 2207, column: 41, scope: !2252)
!2257 = !DILocalVariable(name: "u32Temp1", scope: !2252, file: !79, line: 2209, type: !743)
!2258 = !DILocation(line: 2209, column: 6, scope: !2252)
!2259 = !DILocalVariable(name: "u32Temp2", scope: !2252, file: !79, line: 2209, type: !743)
!2260 = !DILocation(line: 2209, column: 17, scope: !2252)
!2261 = !DILocalVariable(name: "u32Temp3", scope: !2252, file: !79, line: 2209, type: !743)
!2262 = !DILocation(line: 2209, column: 26, scope: !2252)
!2263 = !DILocalVariable(name: "u32Temp4", scope: !2252, file: !79, line: 2209, type: !743)
!2264 = !DILocation(line: 2209, column: 35, scope: !2252)
!2265 = !DILocalVariable(name: "u8SignBit", scope: !2252, file: !79, line: 2210, type: !17)
!2266 = !DILocation(line: 2210, column: 5, scope: !2252)
!2267 = !DILocation(line: 2212, column: 7, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2252, file: !79, line: 2212, column: 5)
!2269 = !DILocation(line: 2212, column: 12, scope: !2268)
!2270 = !DILocation(line: 2212, column: 16, scope: !2268)
!2271 = !DILocation(line: 2212, column: 36, scope: !2268)
!2272 = !DILocation(line: 2212, column: 41, scope: !2268)
!2273 = !DILocation(line: 2212, column: 45, scope: !2268)
!2274 = !DILocation(line: 2214, column: 13, scope: !2275)
!2275 = distinct !DILexicalBlock(scope: !2268, file: !79, line: 2213, column: 2)
!2276 = !DILocation(line: 2215, column: 2, scope: !2275)
!2277 = !DILocation(line: 2218, column: 13, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2268, file: !79, line: 2217, column: 2)
!2279 = !DILocation(line: 2221, column: 5, scope: !2280)
!2280 = distinct !DILexicalBlock(scope: !2252, file: !79, line: 2221, column: 5)
!2281 = !DILocation(line: 2221, column: 10, scope: !2280)
!2282 = !DILocation(line: 2221, column: 5, scope: !2252)
!2283 = !DILocation(line: 2223, column: 15, scope: !2284)
!2284 = distinct !DILexicalBlock(scope: !2280, file: !79, line: 2222, column: 2)
!2285 = !DILocation(line: 2223, column: 14, scope: !2284)
!2286 = !DILocation(line: 2223, column: 12, scope: !2284)
!2287 = !DILocation(line: 2224, column: 2, scope: !2284)
!2288 = !DILocation(line: 2227, column: 14, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2280, file: !79, line: 2226, column: 2)
!2290 = !DILocation(line: 2227, column: 12, scope: !2289)
!2291 = !DILocation(line: 2230, column: 5, scope: !2292)
!2292 = distinct !DILexicalBlock(scope: !2252, file: !79, line: 2230, column: 5)
!2293 = !DILocation(line: 2230, column: 11, scope: !2292)
!2294 = !DILocation(line: 2230, column: 5, scope: !2252)
!2295 = !DILocation(line: 2232, column: 15, scope: !2296)
!2296 = distinct !DILexicalBlock(scope: !2292, file: !79, line: 2231, column: 2)
!2297 = !DILocation(line: 2232, column: 14, scope: !2296)
!2298 = !DILocation(line: 2232, column: 12, scope: !2296)
!2299 = !DILocation(line: 2233, column: 2, scope: !2296)
!2300 = !DILocation(line: 2236, column: 14, scope: !2301)
!2301 = distinct !DILexicalBlock(scope: !2292, file: !79, line: 2235, column: 2)
!2302 = !DILocation(line: 2236, column: 12, scope: !2301)
!2303 = !DILocation(line: 2239, column: 13, scope: !2252)
!2304 = !DILocation(line: 2239, column: 24, scope: !2252)
!2305 = !DILocation(line: 2239, column: 22, scope: !2252)
!2306 = !DILocation(line: 2239, column: 11, scope: !2252)
!2307 = !DILocation(line: 2240, column: 25, scope: !2252)
!2308 = !DILocation(line: 2240, column: 35, scope: !2252)
!2309 = !DILocation(line: 2240, column: 13, scope: !2252)
!2310 = !DILocation(line: 2240, column: 11, scope: !2252)
!2311 = !DILocation(line: 2241, column: 13, scope: !2252)
!2312 = !DILocation(line: 2241, column: 22, scope: !2252)
!2313 = !DILocation(line: 2241, column: 11, scope: !2252)
!2314 = !DILocation(line: 2242, column: 14, scope: !2252)
!2315 = !DILocation(line: 2242, column: 23, scope: !2252)
!2316 = !DILocation(line: 2242, column: 11, scope: !2252)
!2317 = !DILocation(line: 2243, column: 6, scope: !2318)
!2318 = distinct !DILexicalBlock(scope: !2252, file: !79, line: 2243, column: 5)
!2319 = !DILocation(line: 2243, column: 14, scope: !2318)
!2320 = !DILocation(line: 2243, column: 19, scope: !2318)
!2321 = !DILocation(line: 2243, column: 5, scope: !2252)
!2322 = !DILocation(line: 2245, column: 6, scope: !2323)
!2323 = distinct !DILexicalBlock(scope: !2324, file: !79, line: 2245, column: 6)
!2324 = distinct !DILexicalBlock(scope: !2318, file: !79, line: 2244, column: 2)
!2325 = !DILocation(line: 2245, column: 16, scope: !2323)
!2326 = !DILocation(line: 2245, column: 6, scope: !2324)
!2327 = !DILocation(line: 2247, column: 7, scope: !2328)
!2328 = distinct !DILexicalBlock(scope: !2329, file: !79, line: 2247, column: 7)
!2329 = distinct !DILexicalBlock(scope: !2323, file: !79, line: 2246, column: 3)
!2330 = !DILocation(line: 2247, column: 15, scope: !2328)
!2331 = !DILocation(line: 2247, column: 7, scope: !2329)
!2332 = !DILocation(line: 2248, column: 12, scope: !2328)
!2333 = !DILocation(line: 2248, column: 5, scope: !2328)
!2334 = !DILocation(line: 2250, column: 5, scope: !2328)
!2335 = !DILocation(line: 2254, column: 7, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2337, file: !79, line: 2254, column: 7)
!2337 = distinct !DILexicalBlock(scope: !2323, file: !79, line: 2253, column: 3)
!2338 = !DILocation(line: 2254, column: 15, scope: !2336)
!2339 = !DILocation(line: 2254, column: 7, scope: !2337)
!2340 = !DILocation(line: 2255, column: 13, scope: !2336)
!2341 = !DILocation(line: 2255, column: 12, scope: !2336)
!2342 = !DILocation(line: 2255, column: 5, scope: !2336)
!2343 = !DILocation(line: 2257, column: 5, scope: !2336)
!2344 = !DILocation(line: 2262, column: 4, scope: !2345)
!2345 = distinct !DILexicalBlock(scope: !2318, file: !79, line: 2261, column: 2)
!2346 = !DILocation(line: 2264, column: 1, scope: !2252)
!2347 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !79, file: !79, line: 2282, type: !2348, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2348 = !DISubroutineType(types: !2349)
!2349 = !{!87, !87, !17}
!2350 = !DILocalVariable(name: "value", arg: 1, scope: !2347, file: !79, line: 2282, type: !87)
!2351 = !DILocation(line: 2282, column: 29, scope: !2347)
!2352 = !DILocalVariable(name: "factor", arg: 2, scope: !2347, file: !79, line: 2282, type: !17)
!2353 = !DILocation(line: 2282, column: 39, scope: !2347)
!2354 = !DILocalVariable(name: "u32Temp1", scope: !2347, file: !79, line: 2284, type: !743)
!2355 = !DILocation(line: 2284, column: 6, scope: !2347)
!2356 = !DILocalVariable(name: "u32Temp2", scope: !2347, file: !79, line: 2284, type: !743)
!2357 = !DILocation(line: 2284, column: 17, scope: !2347)
!2358 = !DILocalVariable(name: "u32Temp3", scope: !2347, file: !79, line: 2284, type: !743)
!2359 = !DILocation(line: 2284, column: 26, scope: !2347)
!2360 = !DILocalVariable(name: "u8SignBit", scope: !2347, file: !79, line: 2285, type: !17)
!2361 = !DILocation(line: 2285, column: 5, scope: !2347)
!2362 = !DILocation(line: 2287, column: 5, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2347, file: !79, line: 2287, column: 5)
!2364 = !DILocation(line: 2287, column: 10, scope: !2363)
!2365 = !DILocation(line: 2287, column: 5, scope: !2347)
!2366 = !DILocation(line: 2289, column: 15, scope: !2367)
!2367 = distinct !DILexicalBlock(scope: !2363, file: !79, line: 2288, column: 2)
!2368 = !DILocation(line: 2289, column: 14, scope: !2367)
!2369 = !DILocation(line: 2289, column: 12, scope: !2367)
!2370 = !DILocation(line: 2290, column: 13, scope: !2367)
!2371 = !DILocation(line: 2291, column: 2, scope: !2367)
!2372 = !DILocation(line: 2294, column: 14, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2363, file: !79, line: 2293, column: 2)
!2374 = !DILocation(line: 2294, column: 12, scope: !2373)
!2375 = !DILocation(line: 2295, column: 13, scope: !2373)
!2376 = !DILocation(line: 2298, column: 13, scope: !2347)
!2377 = !DILocation(line: 2298, column: 24, scope: !2347)
!2378 = !DILocation(line: 2298, column: 22, scope: !2347)
!2379 = !DILocation(line: 2298, column: 11, scope: !2347)
!2380 = !DILocation(line: 2299, column: 25, scope: !2347)
!2381 = !DILocation(line: 2299, column: 35, scope: !2347)
!2382 = !DILocation(line: 2299, column: 13, scope: !2347)
!2383 = !DILocation(line: 2299, column: 11, scope: !2347)
!2384 = !DILocation(line: 2300, column: 13, scope: !2347)
!2385 = !DILocation(line: 2300, column: 22, scope: !2347)
!2386 = !DILocation(line: 2300, column: 11, scope: !2347)
!2387 = !DILocation(line: 2301, column: 14, scope: !2347)
!2388 = !DILocation(line: 2301, column: 23, scope: !2347)
!2389 = !DILocation(line: 2301, column: 11, scope: !2347)
!2390 = !DILocation(line: 2302, column: 5, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2347, file: !79, line: 2302, column: 5)
!2392 = !DILocation(line: 2302, column: 15, scope: !2391)
!2393 = !DILocation(line: 2302, column: 5, scope: !2347)
!2394 = !DILocation(line: 2304, column: 10, scope: !2395)
!2395 = distinct !DILexicalBlock(scope: !2391, file: !79, line: 2303, column: 2)
!2396 = !DILocation(line: 2304, column: 3, scope: !2395)
!2397 = !DILocation(line: 2308, column: 11, scope: !2398)
!2398 = distinct !DILexicalBlock(scope: !2391, file: !79, line: 2307, column: 2)
!2399 = !DILocation(line: 2308, column: 10, scope: !2398)
!2400 = !DILocation(line: 2308, column: 3, scope: !2398)
!2401 = !DILocation(line: 2310, column: 1, scope: !2347)
!2402 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !79, file: !79, line: 2329, type: !2348, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2403 = !DILocalVariable(name: "value", arg: 1, scope: !2402, file: !79, line: 2329, type: !87)
!2404 = !DILocation(line: 2329, column: 29, scope: !2402)
!2405 = !DILocalVariable(name: "factor", arg: 2, scope: !2402, file: !79, line: 2329, type: !17)
!2406 = !DILocation(line: 2329, column: 39, scope: !2402)
!2407 = !DILocalVariable(name: "u32Temp1", scope: !2402, file: !79, line: 2331, type: !743)
!2408 = !DILocation(line: 2331, column: 6, scope: !2402)
!2409 = !DILocalVariable(name: "u32Temp2", scope: !2402, file: !79, line: 2331, type: !743)
!2410 = !DILocation(line: 2331, column: 17, scope: !2402)
!2411 = !DILocalVariable(name: "u32Temp3", scope: !2402, file: !79, line: 2331, type: !743)
!2412 = !DILocation(line: 2331, column: 26, scope: !2402)
!2413 = !DILocalVariable(name: "u8SignBit", scope: !2402, file: !79, line: 2332, type: !17)
!2414 = !DILocation(line: 2332, column: 5, scope: !2402)
!2415 = !DILocation(line: 2334, column: 5, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2402, file: !79, line: 2334, column: 5)
!2417 = !DILocation(line: 2334, column: 10, scope: !2416)
!2418 = !DILocation(line: 2334, column: 5, scope: !2402)
!2419 = !DILocation(line: 2336, column: 15, scope: !2420)
!2420 = distinct !DILexicalBlock(scope: !2416, file: !79, line: 2335, column: 2)
!2421 = !DILocation(line: 2336, column: 14, scope: !2420)
!2422 = !DILocation(line: 2336, column: 12, scope: !2420)
!2423 = !DILocation(line: 2337, column: 13, scope: !2420)
!2424 = !DILocation(line: 2338, column: 2, scope: !2420)
!2425 = !DILocation(line: 2341, column: 14, scope: !2426)
!2426 = distinct !DILexicalBlock(scope: !2416, file: !79, line: 2340, column: 2)
!2427 = !DILocation(line: 2341, column: 12, scope: !2426)
!2428 = !DILocation(line: 2342, column: 13, scope: !2426)
!2429 = !DILocation(line: 2345, column: 13, scope: !2402)
!2430 = !DILocation(line: 2345, column: 24, scope: !2402)
!2431 = !DILocation(line: 2345, column: 22, scope: !2402)
!2432 = !DILocation(line: 2345, column: 11, scope: !2402)
!2433 = !DILocation(line: 2346, column: 25, scope: !2402)
!2434 = !DILocation(line: 2346, column: 35, scope: !2402)
!2435 = !DILocation(line: 2346, column: 13, scope: !2402)
!2436 = !DILocation(line: 2346, column: 11, scope: !2402)
!2437 = !DILocation(line: 2347, column: 13, scope: !2402)
!2438 = !DILocation(line: 2347, column: 22, scope: !2402)
!2439 = !DILocation(line: 2347, column: 11, scope: !2402)
!2440 = !DILocation(line: 2348, column: 14, scope: !2402)
!2441 = !DILocation(line: 2348, column: 23, scope: !2402)
!2442 = !DILocation(line: 2348, column: 11, scope: !2402)
!2443 = !DILocation(line: 2349, column: 5, scope: !2444)
!2444 = distinct !DILexicalBlock(scope: !2402, file: !79, line: 2349, column: 5)
!2445 = !DILocation(line: 2349, column: 15, scope: !2444)
!2446 = !DILocation(line: 2349, column: 5, scope: !2402)
!2447 = !DILocation(line: 2351, column: 6, scope: !2448)
!2448 = distinct !DILexicalBlock(scope: !2449, file: !79, line: 2351, column: 6)
!2449 = distinct !DILexicalBlock(scope: !2444, file: !79, line: 2350, column: 2)
!2450 = !DILocation(line: 2351, column: 14, scope: !2448)
!2451 = !DILocation(line: 2351, column: 6, scope: !2449)
!2452 = !DILocation(line: 2352, column: 11, scope: !2448)
!2453 = !DILocation(line: 2352, column: 4, scope: !2448)
!2454 = !DILocation(line: 2354, column: 4, scope: !2448)
!2455 = !DILocation(line: 2358, column: 6, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2457, file: !79, line: 2358, column: 6)
!2457 = distinct !DILexicalBlock(scope: !2444, file: !79, line: 2357, column: 2)
!2458 = !DILocation(line: 2358, column: 14, scope: !2456)
!2459 = !DILocation(line: 2358, column: 6, scope: !2457)
!2460 = !DILocation(line: 2359, column: 12, scope: !2456)
!2461 = !DILocation(line: 2359, column: 11, scope: !2456)
!2462 = !DILocation(line: 2359, column: 4, scope: !2456)
!2463 = !DILocation(line: 2361, column: 4, scope: !2456)
!2464 = !DILocation(line: 2363, column: 1, scope: !2402)
!2465 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !79, file: !79, line: 2380, type: !2466, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2466 = !DISubroutineType(types: !2467)
!2467 = !{!743, !743, !743, !17}
!2468 = !DILocalVariable(name: "value", arg: 1, scope: !2465, file: !79, line: 2380, type: !743)
!2469 = !DILocation(line: 2380, column: 39, scope: !2465)
!2470 = !DILocalVariable(name: "factor", arg: 2, scope: !2465, file: !79, line: 2380, type: !743)
!2471 = !DILocation(line: 2380, column: 49, scope: !2465)
!2472 = !DILocalVariable(name: "power", arg: 3, scope: !2465, file: !79, line: 2380, type: !17)
!2473 = !DILocation(line: 2380, column: 60, scope: !2465)
!2474 = !DILocalVariable(name: "u32Temp1", scope: !2465, file: !79, line: 2382, type: !743)
!2475 = !DILocation(line: 2382, column: 6, scope: !2465)
!2476 = !DILocalVariable(name: "u32Temp2", scope: !2465, file: !79, line: 2382, type: !743)
!2477 = !DILocation(line: 2382, column: 20, scope: !2465)
!2478 = !DILocation(line: 2383, column: 5, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2465, file: !79, line: 2383, column: 5)
!2480 = !DILocation(line: 2383, column: 10, scope: !2479)
!2481 = !DILocation(line: 2383, column: 5, scope: !2465)
!2482 = !DILocation(line: 2385, column: 9, scope: !2483)
!2483 = distinct !DILexicalBlock(scope: !2479, file: !79, line: 2384, column: 2)
!2484 = !DILocation(line: 2386, column: 2, scope: !2483)
!2485 = !DILocation(line: 2387, column: 10, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2479, file: !79, line: 2387, column: 10)
!2487 = !DILocation(line: 2387, column: 15, scope: !2486)
!2488 = !DILocation(line: 2387, column: 10, scope: !2479)
!2489 = !DILocation(line: 2389, column: 9, scope: !2490)
!2490 = distinct !DILexicalBlock(scope: !2486, file: !79, line: 2388, column: 2)
!2491 = !DILocation(line: 2390, column: 2, scope: !2490)
!2492 = !DILocation(line: 2395, column: 13, scope: !2465)
!2493 = !DILocation(line: 2395, column: 21, scope: !2465)
!2494 = !DILocation(line: 2395, column: 19, scope: !2465)
!2495 = !DILocation(line: 2395, column: 11, scope: !2465)
!2496 = !DILocation(line: 2396, column: 25, scope: !2465)
!2497 = !DILocation(line: 2396, column: 32, scope: !2465)
!2498 = !DILocation(line: 2396, column: 13, scope: !2465)
!2499 = !DILocation(line: 2396, column: 11, scope: !2465)
!2500 = !DILocation(line: 2397, column: 13, scope: !2465)
!2501 = !DILocation(line: 2397, column: 29, scope: !2465)
!2502 = !DILocation(line: 2397, column: 28, scope: !2465)
!2503 = !DILocation(line: 2397, column: 22, scope: !2465)
!2504 = !DILocation(line: 2397, column: 11, scope: !2465)
!2505 = !DILocation(line: 2398, column: 14, scope: !2465)
!2506 = !DILocation(line: 2398, column: 26, scope: !2465)
!2507 = !DILocation(line: 2398, column: 23, scope: !2465)
!2508 = !DILocation(line: 2398, column: 11, scope: !2465)
!2509 = !DILocation(line: 2399, column: 6, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2465, file: !79, line: 2399, column: 5)
!2511 = !DILocation(line: 2399, column: 20, scope: !2510)
!2512 = !DILocation(line: 2399, column: 19, scope: !2510)
!2513 = !DILocation(line: 2399, column: 14, scope: !2510)
!2514 = !DILocation(line: 2399, column: 28, scope: !2510)
!2515 = !DILocation(line: 2399, column: 5, scope: !2465)
!2516 = !DILocation(line: 2401, column: 10, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2510, file: !79, line: 2400, column: 2)
!2518 = !DILocation(line: 2401, column: 3, scope: !2517)
!2519 = !DILocation(line: 2405, column: 3, scope: !2520)
!2520 = distinct !DILexicalBlock(scope: !2510, file: !79, line: 2404, column: 2)
!2521 = !DILocation(line: 2407, column: 1, scope: !2465)
!2522 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !79, file: !79, line: 2425, type: !2523, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2523 = !DISubroutineType(types: !2524)
!2524 = !{!87, !87, !87, !17}
!2525 = !DILocalVariable(name: "value", arg: 1, scope: !2522, file: !79, line: 2425, type: !87)
!2526 = !DILocation(line: 2425, column: 39, scope: !2522)
!2527 = !DILocalVariable(name: "factor", arg: 2, scope: !2522, file: !79, line: 2425, type: !87)
!2528 = !DILocation(line: 2425, column: 50, scope: !2522)
!2529 = !DILocalVariable(name: "power", arg: 3, scope: !2522, file: !79, line: 2425, type: !17)
!2530 = !DILocation(line: 2425, column: 61, scope: !2522)
!2531 = !DILocalVariable(name: "u32Temp1", scope: !2522, file: !79, line: 2427, type: !743)
!2532 = !DILocation(line: 2427, column: 6, scope: !2522)
!2533 = !DILocalVariable(name: "u32Temp2", scope: !2522, file: !79, line: 2427, type: !743)
!2534 = !DILocation(line: 2427, column: 17, scope: !2522)
!2535 = !DILocalVariable(name: "u32Temp3", scope: !2522, file: !79, line: 2427, type: !743)
!2536 = !DILocation(line: 2427, column: 26, scope: !2522)
!2537 = !DILocalVariable(name: "u32Temp4", scope: !2522, file: !79, line: 2427, type: !743)
!2538 = !DILocation(line: 2427, column: 35, scope: !2522)
!2539 = !DILocalVariable(name: "u8SignBit", scope: !2522, file: !79, line: 2428, type: !17)
!2540 = !DILocation(line: 2428, column: 5, scope: !2522)
!2541 = !DILocation(line: 2430, column: 5, scope: !2542)
!2542 = distinct !DILexicalBlock(scope: !2522, file: !79, line: 2430, column: 5)
!2543 = !DILocation(line: 2430, column: 10, scope: !2542)
!2544 = !DILocation(line: 2430, column: 5, scope: !2522)
!2545 = !DILocation(line: 2432, column: 9, scope: !2546)
!2546 = distinct !DILexicalBlock(scope: !2542, file: !79, line: 2431, column: 2)
!2547 = !DILocation(line: 2433, column: 2, scope: !2546)
!2548 = !DILocation(line: 2434, column: 10, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2542, file: !79, line: 2434, column: 10)
!2550 = !DILocation(line: 2434, column: 15, scope: !2549)
!2551 = !DILocation(line: 2434, column: 10, scope: !2542)
!2552 = !DILocation(line: 2436, column: 9, scope: !2553)
!2553 = distinct !DILexicalBlock(scope: !2549, file: !79, line: 2435, column: 2)
!2554 = !DILocation(line: 2437, column: 2, scope: !2553)
!2555 = !DILocation(line: 2443, column: 7, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2522, file: !79, line: 2443, column: 5)
!2557 = !DILocation(line: 2443, column: 12, scope: !2556)
!2558 = !DILocation(line: 2443, column: 16, scope: !2556)
!2559 = !DILocation(line: 2443, column: 36, scope: !2556)
!2560 = !DILocation(line: 2443, column: 41, scope: !2556)
!2561 = !DILocation(line: 2443, column: 45, scope: !2556)
!2562 = !DILocation(line: 2445, column: 13, scope: !2563)
!2563 = distinct !DILexicalBlock(scope: !2556, file: !79, line: 2444, column: 2)
!2564 = !DILocation(line: 2446, column: 2, scope: !2563)
!2565 = !DILocation(line: 2449, column: 13, scope: !2566)
!2566 = distinct !DILexicalBlock(scope: !2556, file: !79, line: 2448, column: 2)
!2567 = !DILocation(line: 2452, column: 5, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2522, file: !79, line: 2452, column: 5)
!2569 = !DILocation(line: 2452, column: 10, scope: !2568)
!2570 = !DILocation(line: 2452, column: 5, scope: !2522)
!2571 = !DILocation(line: 2454, column: 15, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2568, file: !79, line: 2453, column: 2)
!2573 = !DILocation(line: 2454, column: 14, scope: !2572)
!2574 = !DILocation(line: 2454, column: 12, scope: !2572)
!2575 = !DILocation(line: 2455, column: 2, scope: !2572)
!2576 = !DILocation(line: 2458, column: 14, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2568, file: !79, line: 2457, column: 2)
!2578 = !DILocation(line: 2458, column: 12, scope: !2577)
!2579 = !DILocation(line: 2461, column: 5, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2522, file: !79, line: 2461, column: 5)
!2581 = !DILocation(line: 2461, column: 11, scope: !2580)
!2582 = !DILocation(line: 2461, column: 5, scope: !2522)
!2583 = !DILocation(line: 2463, column: 15, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2580, file: !79, line: 2462, column: 2)
!2585 = !DILocation(line: 2463, column: 14, scope: !2584)
!2586 = !DILocation(line: 2463, column: 12, scope: !2584)
!2587 = !DILocation(line: 2464, column: 2, scope: !2584)
!2588 = !DILocation(line: 2467, column: 14, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2580, file: !79, line: 2466, column: 2)
!2590 = !DILocation(line: 2467, column: 12, scope: !2589)
!2591 = !DILocation(line: 2470, column: 13, scope: !2522)
!2592 = !DILocation(line: 2470, column: 24, scope: !2522)
!2593 = !DILocation(line: 2470, column: 22, scope: !2522)
!2594 = !DILocation(line: 2470, column: 11, scope: !2522)
!2595 = !DILocation(line: 2471, column: 25, scope: !2522)
!2596 = !DILocation(line: 2471, column: 35, scope: !2522)
!2597 = !DILocation(line: 2471, column: 13, scope: !2522)
!2598 = !DILocation(line: 2471, column: 11, scope: !2522)
!2599 = !DILocation(line: 2472, column: 13, scope: !2522)
!2600 = !DILocation(line: 2472, column: 29, scope: !2522)
!2601 = !DILocation(line: 2472, column: 28, scope: !2522)
!2602 = !DILocation(line: 2472, column: 22, scope: !2522)
!2603 = !DILocation(line: 2472, column: 11, scope: !2522)
!2604 = !DILocation(line: 2473, column: 14, scope: !2522)
!2605 = !DILocation(line: 2473, column: 26, scope: !2522)
!2606 = !DILocation(line: 2473, column: 23, scope: !2522)
!2607 = !DILocation(line: 2473, column: 11, scope: !2522)
!2608 = !DILocation(line: 2474, column: 6, scope: !2609)
!2609 = distinct !DILexicalBlock(scope: !2522, file: !79, line: 2474, column: 5)
!2610 = !DILocation(line: 2474, column: 20, scope: !2609)
!2611 = !DILocation(line: 2474, column: 19, scope: !2609)
!2612 = !DILocation(line: 2474, column: 14, scope: !2609)
!2613 = !DILocation(line: 2474, column: 27, scope: !2609)
!2614 = !DILocation(line: 2474, column: 5, scope: !2522)
!2615 = !DILocation(line: 2476, column: 6, scope: !2616)
!2616 = distinct !DILexicalBlock(scope: !2617, file: !79, line: 2476, column: 6)
!2617 = distinct !DILexicalBlock(scope: !2609, file: !79, line: 2475, column: 2)
!2618 = !DILocation(line: 2476, column: 16, scope: !2616)
!2619 = !DILocation(line: 2476, column: 6, scope: !2617)
!2620 = !DILocation(line: 2478, column: 7, scope: !2621)
!2621 = distinct !DILexicalBlock(scope: !2622, file: !79, line: 2478, column: 7)
!2622 = distinct !DILexicalBlock(scope: !2616, file: !79, line: 2477, column: 3)
!2623 = !DILocation(line: 2478, column: 15, scope: !2621)
!2624 = !DILocation(line: 2478, column: 7, scope: !2622)
!2625 = !DILocation(line: 2479, column: 12, scope: !2621)
!2626 = !DILocation(line: 2479, column: 5, scope: !2621)
!2627 = !DILocation(line: 2481, column: 5, scope: !2621)
!2628 = !DILocation(line: 2485, column: 12, scope: !2629)
!2629 = distinct !DILexicalBlock(scope: !2616, file: !79, line: 2484, column: 3)
!2630 = !DILocation(line: 2485, column: 11, scope: !2629)
!2631 = !DILocation(line: 2485, column: 4, scope: !2629)
!2632 = !DILocation(line: 2490, column: 6, scope: !2633)
!2633 = distinct !DILexicalBlock(scope: !2634, file: !79, line: 2490, column: 6)
!2634 = distinct !DILexicalBlock(scope: !2609, file: !79, line: 2489, column: 2)
!2635 = !DILocation(line: 2490, column: 16, scope: !2633)
!2636 = !DILocation(line: 2490, column: 6, scope: !2634)
!2637 = !DILocation(line: 2492, column: 4, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2633, file: !79, line: 2491, column: 3)
!2639 = !DILocation(line: 2496, column: 4, scope: !2640)
!2640 = distinct !DILexicalBlock(scope: !2633, file: !79, line: 2495, column: 3)
!2641 = !DILocation(line: 2499, column: 1, scope: !2522)
!2642 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !79, file: !79, line: 2518, type: !2643, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2643 = !DISubroutineType(types: !2644)
!2644 = !{!87, !87, !6}
!2645 = !DILocalVariable(name: "value", arg: 1, scope: !2642, file: !79, line: 2518, type: !87)
!2646 = !DILocation(line: 2518, column: 29, scope: !2642)
!2647 = !DILocalVariable(name: "factor", arg: 2, scope: !2642, file: !79, line: 2518, type: !6)
!2648 = !DILocation(line: 2518, column: 39, scope: !2642)
!2649 = !DILocalVariable(name: "u32Temp1", scope: !2642, file: !79, line: 2520, type: !743)
!2650 = !DILocation(line: 2520, column: 6, scope: !2642)
!2651 = !DILocalVariable(name: "u32Temp2", scope: !2642, file: !79, line: 2520, type: !743)
!2652 = !DILocation(line: 2520, column: 17, scope: !2642)
!2653 = !DILocalVariable(name: "u32Temp3", scope: !2642, file: !79, line: 2520, type: !743)
!2654 = !DILocation(line: 2520, column: 26, scope: !2642)
!2655 = !DILocalVariable(name: "u32Temp4", scope: !2642, file: !79, line: 2520, type: !743)
!2656 = !DILocation(line: 2520, column: 35, scope: !2642)
!2657 = !DILocalVariable(name: "u8SignBit", scope: !2642, file: !79, line: 2521, type: !17)
!2658 = !DILocation(line: 2521, column: 5, scope: !2642)
!2659 = !DILocation(line: 2523, column: 7, scope: !2660)
!2660 = distinct !DILexicalBlock(scope: !2642, file: !79, line: 2523, column: 5)
!2661 = !DILocation(line: 2523, column: 12, scope: !2660)
!2662 = !DILocation(line: 2523, column: 16, scope: !2660)
!2663 = !DILocation(line: 2523, column: 20, scope: !2660)
!2664 = !DILocation(line: 2523, column: 26, scope: !2660)
!2665 = !DILocation(line: 2523, column: 31, scope: !2660)
!2666 = !DILocation(line: 2523, column: 36, scope: !2660)
!2667 = !DILocation(line: 2523, column: 41, scope: !2660)
!2668 = !DILocation(line: 2523, column: 45, scope: !2660)
!2669 = !DILocation(line: 2523, column: 49, scope: !2660)
!2670 = !DILocation(line: 2523, column: 55, scope: !2660)
!2671 = !DILocation(line: 2523, column: 5, scope: !2642)
!2672 = !DILocation(line: 2525, column: 13, scope: !2673)
!2673 = distinct !DILexicalBlock(scope: !2660, file: !79, line: 2524, column: 2)
!2674 = !DILocation(line: 2526, column: 2, scope: !2673)
!2675 = !DILocation(line: 2529, column: 13, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2660, file: !79, line: 2528, column: 2)
!2677 = !DILocation(line: 2532, column: 5, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2642, file: !79, line: 2532, column: 5)
!2679 = !DILocation(line: 2532, column: 10, scope: !2678)
!2680 = !DILocation(line: 2532, column: 5, scope: !2642)
!2681 = !DILocation(line: 2534, column: 15, scope: !2682)
!2682 = distinct !DILexicalBlock(scope: !2678, file: !79, line: 2533, column: 2)
!2683 = !DILocation(line: 2534, column: 14, scope: !2682)
!2684 = !DILocation(line: 2534, column: 12, scope: !2682)
!2685 = !DILocation(line: 2535, column: 2, scope: !2682)
!2686 = !DILocation(line: 2538, column: 14, scope: !2687)
!2687 = distinct !DILexicalBlock(scope: !2678, file: !79, line: 2537, column: 2)
!2688 = !DILocation(line: 2538, column: 12, scope: !2687)
!2689 = !DILocation(line: 2541, column: 5, scope: !2690)
!2690 = distinct !DILexicalBlock(scope: !2642, file: !79, line: 2541, column: 5)
!2691 = !DILocation(line: 2541, column: 11, scope: !2690)
!2692 = !DILocation(line: 2541, column: 5, scope: !2642)
!2693 = !DILocation(line: 2543, column: 15, scope: !2694)
!2694 = distinct !DILexicalBlock(scope: !2690, file: !79, line: 2542, column: 2)
!2695 = !DILocation(line: 2543, column: 14, scope: !2694)
!2696 = !DILocation(line: 2543, column: 12, scope: !2694)
!2697 = !DILocation(line: 2544, column: 2, scope: !2694)
!2698 = !DILocation(line: 2547, column: 14, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2690, file: !79, line: 2546, column: 2)
!2700 = !DILocation(line: 2547, column: 12, scope: !2699)
!2701 = !DILocation(line: 2550, column: 13, scope: !2642)
!2702 = !DILocation(line: 2550, column: 24, scope: !2642)
!2703 = !DILocation(line: 2550, column: 22, scope: !2642)
!2704 = !DILocation(line: 2550, column: 11, scope: !2642)
!2705 = !DILocation(line: 2551, column: 25, scope: !2642)
!2706 = !DILocation(line: 2551, column: 35, scope: !2642)
!2707 = !DILocation(line: 2551, column: 13, scope: !2642)
!2708 = !DILocation(line: 2551, column: 11, scope: !2642)
!2709 = !DILocation(line: 2552, column: 13, scope: !2642)
!2710 = !DILocation(line: 2552, column: 22, scope: !2642)
!2711 = !DILocation(line: 2552, column: 11, scope: !2642)
!2712 = !DILocation(line: 2553, column: 14, scope: !2642)
!2713 = !DILocation(line: 2553, column: 23, scope: !2642)
!2714 = !DILocation(line: 2553, column: 11, scope: !2642)
!2715 = !DILocation(line: 2554, column: 5, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2642, file: !79, line: 2554, column: 5)
!2717 = !DILocation(line: 2554, column: 15, scope: !2716)
!2718 = !DILocation(line: 2554, column: 5, scope: !2642)
!2719 = !DILocation(line: 2556, column: 6, scope: !2720)
!2720 = distinct !DILexicalBlock(scope: !2721, file: !79, line: 2556, column: 6)
!2721 = distinct !DILexicalBlock(scope: !2716, file: !79, line: 2555, column: 2)
!2722 = !DILocation(line: 2556, column: 14, scope: !2720)
!2723 = !DILocation(line: 2556, column: 6, scope: !2721)
!2724 = !DILocation(line: 2557, column: 11, scope: !2720)
!2725 = !DILocation(line: 2557, column: 4, scope: !2720)
!2726 = !DILocation(line: 2559, column: 4, scope: !2720)
!2727 = !DILocation(line: 2563, column: 11, scope: !2728)
!2728 = distinct !DILexicalBlock(scope: !2716, file: !79, line: 2562, column: 2)
!2729 = !DILocation(line: 2563, column: 10, scope: !2728)
!2730 = !DILocation(line: 2563, column: 3, scope: !2728)
!2731 = !DILocation(line: 2565, column: 1, scope: !2642)
!2732 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !79, file: !79, line: 2584, type: !2643, scopeLine: 2585, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2733 = !DILocalVariable(name: "value", arg: 1, scope: !2732, file: !79, line: 2584, type: !87)
!2734 = !DILocation(line: 2584, column: 29, scope: !2732)
!2735 = !DILocalVariable(name: "factor", arg: 2, scope: !2732, file: !79, line: 2584, type: !6)
!2736 = !DILocation(line: 2584, column: 39, scope: !2732)
!2737 = !DILocalVariable(name: "u32Temp1", scope: !2732, file: !79, line: 2586, type: !743)
!2738 = !DILocation(line: 2586, column: 6, scope: !2732)
!2739 = !DILocalVariable(name: "u32Temp2", scope: !2732, file: !79, line: 2586, type: !743)
!2740 = !DILocation(line: 2586, column: 17, scope: !2732)
!2741 = !DILocalVariable(name: "u32Temp3", scope: !2732, file: !79, line: 2586, type: !743)
!2742 = !DILocation(line: 2586, column: 26, scope: !2732)
!2743 = !DILocalVariable(name: "u32Temp4", scope: !2732, file: !79, line: 2586, type: !743)
!2744 = !DILocation(line: 2586, column: 35, scope: !2732)
!2745 = !DILocalVariable(name: "u8SignBit", scope: !2732, file: !79, line: 2587, type: !17)
!2746 = !DILocation(line: 2587, column: 5, scope: !2732)
!2747 = !DILocation(line: 2589, column: 7, scope: !2748)
!2748 = distinct !DILexicalBlock(scope: !2732, file: !79, line: 2589, column: 5)
!2749 = !DILocation(line: 2589, column: 12, scope: !2748)
!2750 = !DILocation(line: 2589, column: 16, scope: !2748)
!2751 = !DILocation(line: 2589, column: 20, scope: !2748)
!2752 = !DILocation(line: 2589, column: 26, scope: !2748)
!2753 = !DILocation(line: 2589, column: 31, scope: !2748)
!2754 = !DILocation(line: 2589, column: 36, scope: !2748)
!2755 = !DILocation(line: 2589, column: 41, scope: !2748)
!2756 = !DILocation(line: 2589, column: 45, scope: !2748)
!2757 = !DILocation(line: 2589, column: 49, scope: !2748)
!2758 = !DILocation(line: 2589, column: 55, scope: !2748)
!2759 = !DILocation(line: 2589, column: 5, scope: !2732)
!2760 = !DILocation(line: 2591, column: 13, scope: !2761)
!2761 = distinct !DILexicalBlock(scope: !2748, file: !79, line: 2590, column: 2)
!2762 = !DILocation(line: 2592, column: 2, scope: !2761)
!2763 = !DILocation(line: 2595, column: 13, scope: !2764)
!2764 = distinct !DILexicalBlock(scope: !2748, file: !79, line: 2594, column: 2)
!2765 = !DILocation(line: 2598, column: 5, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2732, file: !79, line: 2598, column: 5)
!2767 = !DILocation(line: 2598, column: 10, scope: !2766)
!2768 = !DILocation(line: 2598, column: 5, scope: !2732)
!2769 = !DILocation(line: 2600, column: 15, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2766, file: !79, line: 2599, column: 2)
!2771 = !DILocation(line: 2600, column: 14, scope: !2770)
!2772 = !DILocation(line: 2600, column: 12, scope: !2770)
!2773 = !DILocation(line: 2601, column: 2, scope: !2770)
!2774 = !DILocation(line: 2604, column: 14, scope: !2775)
!2775 = distinct !DILexicalBlock(scope: !2766, file: !79, line: 2603, column: 2)
!2776 = !DILocation(line: 2604, column: 12, scope: !2775)
!2777 = !DILocation(line: 2607, column: 5, scope: !2778)
!2778 = distinct !DILexicalBlock(scope: !2732, file: !79, line: 2607, column: 5)
!2779 = !DILocation(line: 2607, column: 11, scope: !2778)
!2780 = !DILocation(line: 2607, column: 5, scope: !2732)
!2781 = !DILocation(line: 2609, column: 15, scope: !2782)
!2782 = distinct !DILexicalBlock(scope: !2778, file: !79, line: 2608, column: 2)
!2783 = !DILocation(line: 2609, column: 14, scope: !2782)
!2784 = !DILocation(line: 2609, column: 12, scope: !2782)
!2785 = !DILocation(line: 2610, column: 2, scope: !2782)
!2786 = !DILocation(line: 2613, column: 14, scope: !2787)
!2787 = distinct !DILexicalBlock(scope: !2778, file: !79, line: 2612, column: 2)
!2788 = !DILocation(line: 2613, column: 12, scope: !2787)
!2789 = !DILocation(line: 2616, column: 13, scope: !2732)
!2790 = !DILocation(line: 2616, column: 24, scope: !2732)
!2791 = !DILocation(line: 2616, column: 22, scope: !2732)
!2792 = !DILocation(line: 2616, column: 11, scope: !2732)
!2793 = !DILocation(line: 2617, column: 25, scope: !2732)
!2794 = !DILocation(line: 2617, column: 35, scope: !2732)
!2795 = !DILocation(line: 2617, column: 13, scope: !2732)
!2796 = !DILocation(line: 2617, column: 11, scope: !2732)
!2797 = !DILocation(line: 2618, column: 13, scope: !2732)
!2798 = !DILocation(line: 2618, column: 22, scope: !2732)
!2799 = !DILocation(line: 2618, column: 11, scope: !2732)
!2800 = !DILocation(line: 2619, column: 14, scope: !2732)
!2801 = !DILocation(line: 2619, column: 23, scope: !2732)
!2802 = !DILocation(line: 2619, column: 11, scope: !2732)
!2803 = !DILocation(line: 2620, column: 6, scope: !2804)
!2804 = distinct !DILexicalBlock(scope: !2732, file: !79, line: 2620, column: 5)
!2805 = !DILocation(line: 2620, column: 14, scope: !2804)
!2806 = !DILocation(line: 2620, column: 18, scope: !2804)
!2807 = !DILocation(line: 2620, column: 5, scope: !2732)
!2808 = !DILocation(line: 2622, column: 6, scope: !2809)
!2809 = distinct !DILexicalBlock(scope: !2810, file: !79, line: 2622, column: 6)
!2810 = distinct !DILexicalBlock(scope: !2804, file: !79, line: 2621, column: 2)
!2811 = !DILocation(line: 2622, column: 16, scope: !2809)
!2812 = !DILocation(line: 2622, column: 6, scope: !2810)
!2813 = !DILocation(line: 2624, column: 7, scope: !2814)
!2814 = distinct !DILexicalBlock(scope: !2815, file: !79, line: 2624, column: 7)
!2815 = distinct !DILexicalBlock(scope: !2809, file: !79, line: 2623, column: 3)
!2816 = !DILocation(line: 2624, column: 15, scope: !2814)
!2817 = !DILocation(line: 2624, column: 7, scope: !2815)
!2818 = !DILocation(line: 2625, column: 12, scope: !2814)
!2819 = !DILocation(line: 2625, column: 5, scope: !2814)
!2820 = !DILocation(line: 2627, column: 5, scope: !2814)
!2821 = !DILocation(line: 2631, column: 7, scope: !2822)
!2822 = distinct !DILexicalBlock(scope: !2823, file: !79, line: 2631, column: 7)
!2823 = distinct !DILexicalBlock(scope: !2809, file: !79, line: 2630, column: 3)
!2824 = !DILocation(line: 2631, column: 15, scope: !2822)
!2825 = !DILocation(line: 2631, column: 7, scope: !2823)
!2826 = !DILocation(line: 2632, column: 13, scope: !2822)
!2827 = !DILocation(line: 2632, column: 12, scope: !2822)
!2828 = !DILocation(line: 2632, column: 5, scope: !2822)
!2829 = !DILocation(line: 2634, column: 5, scope: !2822)
!2830 = !DILocation(line: 2639, column: 3, scope: !2831)
!2831 = distinct !DILexicalBlock(scope: !2804, file: !79, line: 2638, column: 2)
!2832 = !DILocation(line: 2641, column: 1, scope: !2732)
!2833 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !79, file: !79, line: 2656, type: !2169, scopeLine: 2657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2834 = !DILocalVariable(name: "val1", arg: 1, scope: !2833, file: !79, line: 2656, type: !87)
!2835 = !DILocation(line: 2656, column: 25, scope: !2833)
!2836 = !DILocalVariable(name: "val2", arg: 2, scope: !2833, file: !79, line: 2656, type: !87)
!2837 = !DILocation(line: 2656, column: 35, scope: !2833)
!2838 = !DILocalVariable(name: "u32Temp1", scope: !2833, file: !79, line: 2658, type: !743)
!2839 = !DILocation(line: 2658, column: 6, scope: !2833)
!2840 = !DILocalVariable(name: "u32Temp2", scope: !2833, file: !79, line: 2658, type: !743)
!2841 = !DILocation(line: 2658, column: 17, scope: !2833)
!2842 = !DILocalVariable(name: "u32Temp3", scope: !2833, file: !79, line: 2658, type: !743)
!2843 = !DILocation(line: 2658, column: 26, scope: !2833)
!2844 = !DILocalVariable(name: "u32Temp4", scope: !2833, file: !79, line: 2658, type: !743)
!2845 = !DILocation(line: 2658, column: 35, scope: !2833)
!2846 = !DILocalVariable(name: "u8SignBit", scope: !2833, file: !79, line: 2659, type: !17)
!2847 = !DILocation(line: 2659, column: 5, scope: !2833)
!2848 = !DILocation(line: 2661, column: 7, scope: !2849)
!2849 = distinct !DILexicalBlock(scope: !2833, file: !79, line: 2661, column: 5)
!2850 = !DILocation(line: 2661, column: 11, scope: !2849)
!2851 = !DILocation(line: 2661, column: 15, scope: !2849)
!2852 = !DILocation(line: 2661, column: 33, scope: !2849)
!2853 = !DILocation(line: 2661, column: 37, scope: !2849)
!2854 = !DILocation(line: 2661, column: 41, scope: !2849)
!2855 = !DILocation(line: 2663, column: 13, scope: !2856)
!2856 = distinct !DILexicalBlock(scope: !2849, file: !79, line: 2662, column: 2)
!2857 = !DILocation(line: 2664, column: 2, scope: !2856)
!2858 = !DILocation(line: 2667, column: 13, scope: !2859)
!2859 = distinct !DILexicalBlock(scope: !2849, file: !79, line: 2666, column: 2)
!2860 = !DILocation(line: 2670, column: 5, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2833, file: !79, line: 2670, column: 5)
!2862 = !DILocation(line: 2670, column: 9, scope: !2861)
!2863 = !DILocation(line: 2670, column: 5, scope: !2833)
!2864 = !DILocation(line: 2672, column: 15, scope: !2865)
!2865 = distinct !DILexicalBlock(scope: !2861, file: !79, line: 2671, column: 2)
!2866 = !DILocation(line: 2672, column: 14, scope: !2865)
!2867 = !DILocation(line: 2672, column: 12, scope: !2865)
!2868 = !DILocation(line: 2673, column: 2, scope: !2865)
!2869 = !DILocation(line: 2676, column: 14, scope: !2870)
!2870 = distinct !DILexicalBlock(scope: !2861, file: !79, line: 2675, column: 2)
!2871 = !DILocation(line: 2676, column: 12, scope: !2870)
!2872 = !DILocation(line: 2679, column: 5, scope: !2873)
!2873 = distinct !DILexicalBlock(scope: !2833, file: !79, line: 2679, column: 5)
!2874 = !DILocation(line: 2679, column: 9, scope: !2873)
!2875 = !DILocation(line: 2679, column: 5, scope: !2833)
!2876 = !DILocation(line: 2681, column: 15, scope: !2877)
!2877 = distinct !DILexicalBlock(scope: !2873, file: !79, line: 2680, column: 2)
!2878 = !DILocation(line: 2681, column: 14, scope: !2877)
!2879 = !DILocation(line: 2681, column: 12, scope: !2877)
!2880 = !DILocation(line: 2682, column: 2, scope: !2877)
!2881 = !DILocation(line: 2685, column: 14, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2873, file: !79, line: 2684, column: 2)
!2883 = !DILocation(line: 2685, column: 12, scope: !2882)
!2884 = !DILocation(line: 2688, column: 13, scope: !2833)
!2885 = !DILocation(line: 2688, column: 24, scope: !2833)
!2886 = !DILocation(line: 2688, column: 22, scope: !2833)
!2887 = !DILocation(line: 2688, column: 11, scope: !2833)
!2888 = !DILocation(line: 2689, column: 25, scope: !2833)
!2889 = !DILocation(line: 2689, column: 35, scope: !2833)
!2890 = !DILocation(line: 2689, column: 13, scope: !2833)
!2891 = !DILocation(line: 2689, column: 11, scope: !2833)
!2892 = !DILocation(line: 2690, column: 5, scope: !2893)
!2893 = distinct !DILexicalBlock(scope: !2833, file: !79, line: 2690, column: 5)
!2894 = !DILocation(line: 2690, column: 13, scope: !2893)
!2895 = !DILocation(line: 2690, column: 5, scope: !2833)
!2896 = !DILocation(line: 2692, column: 6, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2898, file: !79, line: 2692, column: 6)
!2898 = distinct !DILexicalBlock(scope: !2893, file: !79, line: 2691, column: 2)
!2899 = !DILocation(line: 2692, column: 16, scope: !2897)
!2900 = !DILocation(line: 2692, column: 6, scope: !2898)
!2901 = !DILocation(line: 2694, column: 7, scope: !2902)
!2902 = distinct !DILexicalBlock(scope: !2903, file: !79, line: 2694, column: 7)
!2903 = distinct !DILexicalBlock(scope: !2897, file: !79, line: 2693, column: 3)
!2904 = !DILocation(line: 2694, column: 15, scope: !2902)
!2905 = !DILocation(line: 2694, column: 7, scope: !2903)
!2906 = !DILocation(line: 2695, column: 12, scope: !2902)
!2907 = !DILocation(line: 2695, column: 5, scope: !2902)
!2908 = !DILocation(line: 2697, column: 5, scope: !2902)
!2909 = !DILocation(line: 2701, column: 7, scope: !2910)
!2910 = distinct !DILexicalBlock(scope: !2911, file: !79, line: 2701, column: 7)
!2911 = distinct !DILexicalBlock(scope: !2897, file: !79, line: 2700, column: 3)
!2912 = !DILocation(line: 2701, column: 15, scope: !2910)
!2913 = !DILocation(line: 2701, column: 7, scope: !2911)
!2914 = !DILocation(line: 2702, column: 13, scope: !2910)
!2915 = !DILocation(line: 2702, column: 12, scope: !2910)
!2916 = !DILocation(line: 2702, column: 5, scope: !2910)
!2917 = !DILocation(line: 2704, column: 5, scope: !2910)
!2918 = !DILocation(line: 2709, column: 6, scope: !2919)
!2919 = distinct !DILexicalBlock(scope: !2920, file: !79, line: 2709, column: 6)
!2920 = distinct !DILexicalBlock(scope: !2893, file: !79, line: 2708, column: 2)
!2921 = !DILocation(line: 2709, column: 16, scope: !2919)
!2922 = !DILocation(line: 2709, column: 6, scope: !2920)
!2923 = !DILocation(line: 2711, column: 4, scope: !2924)
!2924 = distinct !DILexicalBlock(scope: !2919, file: !79, line: 2710, column: 3)
!2925 = !DILocation(line: 2715, column: 4, scope: !2926)
!2926 = distinct !DILexicalBlock(scope: !2919, file: !79, line: 2714, column: 3)
!2927 = !DILocation(line: 2719, column: 1, scope: !2833)
!2928 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !79, file: !79, line: 2737, type: !2065, scopeLine: 2738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2929 = !DILocalVariable(name: "value", arg: 1, scope: !2928, file: !79, line: 2737, type: !87)
!2930 = !DILocation(line: 2737, column: 31, scope: !2928)
!2931 = !DILocalVariable(name: "factor", arg: 2, scope: !2928, file: !79, line: 2737, type: !743)
!2932 = !DILocation(line: 2737, column: 42, scope: !2928)
!2933 = !DILocalVariable(name: "u32Temp1", scope: !2928, file: !79, line: 2739, type: !743)
!2934 = !DILocation(line: 2739, column: 6, scope: !2928)
!2935 = !DILocalVariable(name: "u32Temp2", scope: !2928, file: !79, line: 2739, type: !743)
!2936 = !DILocation(line: 2739, column: 17, scope: !2928)
!2937 = !DILocalVariable(name: "u8SignBit", scope: !2928, file: !79, line: 2740, type: !17)
!2938 = !DILocation(line: 2740, column: 5, scope: !2928)
!2939 = !DILocation(line: 2742, column: 5, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2928, file: !79, line: 2742, column: 5)
!2941 = !DILocation(line: 2742, column: 10, scope: !2940)
!2942 = !DILocation(line: 2742, column: 5, scope: !2928)
!2943 = !DILocation(line: 2744, column: 15, scope: !2944)
!2944 = distinct !DILexicalBlock(scope: !2940, file: !79, line: 2743, column: 2)
!2945 = !DILocation(line: 2744, column: 14, scope: !2944)
!2946 = !DILocation(line: 2744, column: 12, scope: !2944)
!2947 = !DILocation(line: 2745, column: 13, scope: !2944)
!2948 = !DILocation(line: 2746, column: 2, scope: !2944)
!2949 = !DILocation(line: 2749, column: 14, scope: !2950)
!2950 = distinct !DILexicalBlock(scope: !2940, file: !79, line: 2748, column: 2)
!2951 = !DILocation(line: 2749, column: 12, scope: !2950)
!2952 = !DILocation(line: 2750, column: 13, scope: !2950)
!2953 = !DILocation(line: 2753, column: 25, scope: !2928)
!2954 = !DILocation(line: 2753, column: 35, scope: !2928)
!2955 = !DILocation(line: 2753, column: 13, scope: !2928)
!2956 = !DILocation(line: 2753, column: 11, scope: !2928)
!2957 = !DILocation(line: 2754, column: 13, scope: !2928)
!2958 = !DILocation(line: 2754, column: 22, scope: !2928)
!2959 = !DILocation(line: 2754, column: 11, scope: !2928)
!2960 = !DILocation(line: 2755, column: 5, scope: !2961)
!2961 = distinct !DILexicalBlock(scope: !2928, file: !79, line: 2755, column: 5)
!2962 = !DILocation(line: 2755, column: 15, scope: !2961)
!2963 = !DILocation(line: 2755, column: 5, scope: !2928)
!2964 = !DILocation(line: 2757, column: 10, scope: !2965)
!2965 = distinct !DILexicalBlock(scope: !2961, file: !79, line: 2756, column: 2)
!2966 = !DILocation(line: 2757, column: 3, scope: !2965)
!2967 = !DILocation(line: 2761, column: 11, scope: !2968)
!2968 = distinct !DILexicalBlock(scope: !2961, file: !79, line: 2760, column: 2)
!2969 = !DILocation(line: 2761, column: 10, scope: !2968)
!2970 = !DILocation(line: 2761, column: 3, scope: !2968)
!2971 = !DILocation(line: 2763, column: 1, scope: !2928)
!2972 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !79, file: !79, line: 2779, type: !2169, scopeLine: 2780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2973 = !DILocalVariable(name: "value", arg: 1, scope: !2972, file: !79, line: 2779, type: !87)
!2974 = !DILocation(line: 2779, column: 31, scope: !2972)
!2975 = !DILocalVariable(name: "factor", arg: 2, scope: !2972, file: !79, line: 2779, type: !87)
!2976 = !DILocation(line: 2779, column: 42, scope: !2972)
!2977 = !DILocalVariable(name: "u32Temp1", scope: !2972, file: !79, line: 2781, type: !743)
!2978 = !DILocation(line: 2781, column: 6, scope: !2972)
!2979 = !DILocalVariable(name: "u32Temp2", scope: !2972, file: !79, line: 2781, type: !743)
!2980 = !DILocation(line: 2781, column: 17, scope: !2972)
!2981 = !DILocalVariable(name: "u32Temp3", scope: !2972, file: !79, line: 2781, type: !743)
!2982 = !DILocation(line: 2781, column: 26, scope: !2972)
!2983 = !DILocalVariable(name: "u8SignBit", scope: !2972, file: !79, line: 2782, type: !17)
!2984 = !DILocation(line: 2782, column: 5, scope: !2972)
!2985 = !DILocation(line: 2784, column: 7, scope: !2986)
!2986 = distinct !DILexicalBlock(scope: !2972, file: !79, line: 2784, column: 5)
!2987 = !DILocation(line: 2784, column: 12, scope: !2986)
!2988 = !DILocation(line: 2784, column: 16, scope: !2986)
!2989 = !DILocation(line: 2784, column: 36, scope: !2986)
!2990 = !DILocation(line: 2784, column: 41, scope: !2986)
!2991 = !DILocation(line: 2784, column: 45, scope: !2986)
!2992 = !DILocation(line: 2786, column: 13, scope: !2993)
!2993 = distinct !DILexicalBlock(scope: !2986, file: !79, line: 2785, column: 2)
!2994 = !DILocation(line: 2787, column: 2, scope: !2993)
!2995 = !DILocation(line: 2790, column: 13, scope: !2996)
!2996 = distinct !DILexicalBlock(scope: !2986, file: !79, line: 2789, column: 2)
!2997 = !DILocation(line: 2793, column: 5, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2972, file: !79, line: 2793, column: 5)
!2999 = !DILocation(line: 2793, column: 10, scope: !2998)
!3000 = !DILocation(line: 2793, column: 5, scope: !2972)
!3001 = !DILocation(line: 2795, column: 15, scope: !3002)
!3002 = distinct !DILexicalBlock(scope: !2998, file: !79, line: 2794, column: 2)
!3003 = !DILocation(line: 2795, column: 14, scope: !3002)
!3004 = !DILocation(line: 2795, column: 12, scope: !3002)
!3005 = !DILocation(line: 2796, column: 2, scope: !3002)
!3006 = !DILocation(line: 2799, column: 14, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2998, file: !79, line: 2798, column: 2)
!3008 = !DILocation(line: 2799, column: 12, scope: !3007)
!3009 = !DILocation(line: 2802, column: 5, scope: !3010)
!3010 = distinct !DILexicalBlock(scope: !2972, file: !79, line: 2802, column: 5)
!3011 = !DILocation(line: 2802, column: 11, scope: !3010)
!3012 = !DILocation(line: 2802, column: 5, scope: !2972)
!3013 = !DILocation(line: 2804, column: 15, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !3010, file: !79, line: 2803, column: 2)
!3015 = !DILocation(line: 2804, column: 14, scope: !3014)
!3016 = !DILocation(line: 2804, column: 12, scope: !3014)
!3017 = !DILocation(line: 2805, column: 2, scope: !3014)
!3018 = !DILocation(line: 2808, column: 14, scope: !3019)
!3019 = distinct !DILexicalBlock(scope: !3010, file: !79, line: 2807, column: 2)
!3020 = !DILocation(line: 2808, column: 12, scope: !3019)
!3021 = !DILocation(line: 2811, column: 25, scope: !2972)
!3022 = !DILocation(line: 2811, column: 35, scope: !2972)
!3023 = !DILocation(line: 2811, column: 13, scope: !2972)
!3024 = !DILocation(line: 2811, column: 11, scope: !2972)
!3025 = !DILocation(line: 2812, column: 5, scope: !3026)
!3026 = distinct !DILexicalBlock(scope: !2972, file: !79, line: 2812, column: 5)
!3027 = !DILocation(line: 2812, column: 15, scope: !3026)
!3028 = !DILocation(line: 2812, column: 5, scope: !2972)
!3029 = !DILocation(line: 2814, column: 10, scope: !3030)
!3030 = distinct !DILexicalBlock(scope: !3026, file: !79, line: 2813, column: 2)
!3031 = !DILocation(line: 2814, column: 3, scope: !3030)
!3032 = !DILocation(line: 2818, column: 11, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !3026, file: !79, line: 2817, column: 2)
!3034 = !DILocation(line: 2818, column: 10, scope: !3033)
!3035 = !DILocation(line: 2818, column: 3, scope: !3033)
!3036 = !DILocation(line: 2820, column: 1, scope: !2972)
!3037 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !79, file: !79, line: 2837, type: !3038, scopeLine: 2838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3038 = !DISubroutineType(types: !3039)
!3039 = !{!743, !743, !17}
!3040 = !DILocalVariable(name: "value", arg: 1, scope: !3037, file: !79, line: 2837, type: !743)
!3041 = !DILocation(line: 2837, column: 29, scope: !3037)
!3042 = !DILocalVariable(name: "factor", arg: 2, scope: !3037, file: !79, line: 2837, type: !17)
!3043 = !DILocation(line: 2837, column: 39, scope: !3037)
!3044 = !DILocalVariable(name: "u32Temp1", scope: !3037, file: !79, line: 2839, type: !743)
!3045 = !DILocation(line: 2839, column: 6, scope: !3037)
!3046 = !DILocalVariable(name: "u32Temp2", scope: !3037, file: !79, line: 2839, type: !743)
!3047 = !DILocation(line: 2839, column: 20, scope: !3037)
!3048 = !DILocation(line: 2840, column: 13, scope: !3037)
!3049 = !DILocation(line: 2840, column: 21, scope: !3037)
!3050 = !DILocation(line: 2840, column: 19, scope: !3037)
!3051 = !DILocation(line: 2840, column: 11, scope: !3037)
!3052 = !DILocation(line: 2841, column: 25, scope: !3037)
!3053 = !DILocation(line: 2841, column: 32, scope: !3037)
!3054 = !DILocation(line: 2841, column: 13, scope: !3037)
!3055 = !DILocation(line: 2841, column: 11, scope: !3037)
!3056 = !DILocation(line: 2842, column: 14, scope: !3037)
!3057 = !DILocation(line: 2842, column: 23, scope: !3037)
!3058 = !DILocation(line: 2842, column: 11, scope: !3037)
!3059 = !DILocation(line: 2843, column: 14, scope: !3037)
!3060 = !DILocation(line: 2843, column: 23, scope: !3037)
!3061 = !DILocation(line: 2843, column: 11, scope: !3037)
!3062 = !DILocation(line: 2844, column: 9, scope: !3037)
!3063 = !DILocation(line: 2844, column: 2, scope: !3037)
!3064 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !79, file: !79, line: 2863, type: !3038, scopeLine: 2864, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3065 = !DILocalVariable(name: "value", arg: 1, scope: !3064, file: !79, line: 2863, type: !743)
!3066 = !DILocation(line: 2863, column: 29, scope: !3064)
!3067 = !DILocalVariable(name: "factor", arg: 2, scope: !3064, file: !79, line: 2863, type: !17)
!3068 = !DILocation(line: 2863, column: 39, scope: !3064)
!3069 = !DILocalVariable(name: "u32Temp1", scope: !3064, file: !79, line: 2865, type: !743)
!3070 = !DILocation(line: 2865, column: 6, scope: !3064)
!3071 = !DILocalVariable(name: "u32Temp2", scope: !3064, file: !79, line: 2865, type: !743)
!3072 = !DILocation(line: 2865, column: 20, scope: !3064)
!3073 = !DILocation(line: 2866, column: 13, scope: !3064)
!3074 = !DILocation(line: 2866, column: 21, scope: !3064)
!3075 = !DILocation(line: 2866, column: 19, scope: !3064)
!3076 = !DILocation(line: 2866, column: 11, scope: !3064)
!3077 = !DILocation(line: 2867, column: 25, scope: !3064)
!3078 = !DILocation(line: 2867, column: 32, scope: !3064)
!3079 = !DILocation(line: 2867, column: 13, scope: !3064)
!3080 = !DILocation(line: 2867, column: 11, scope: !3064)
!3081 = !DILocation(line: 2868, column: 14, scope: !3064)
!3082 = !DILocation(line: 2868, column: 23, scope: !3064)
!3083 = !DILocation(line: 2868, column: 11, scope: !3064)
!3084 = !DILocation(line: 2869, column: 14, scope: !3064)
!3085 = !DILocation(line: 2869, column: 23, scope: !3064)
!3086 = !DILocation(line: 2869, column: 11, scope: !3064)
!3087 = !DILocation(line: 2870, column: 6, scope: !3088)
!3088 = distinct !DILexicalBlock(scope: !3064, file: !79, line: 2870, column: 5)
!3089 = !DILocation(line: 2870, column: 14, scope: !3088)
!3090 = !DILocation(line: 2870, column: 19, scope: !3088)
!3091 = !DILocation(line: 2870, column: 5, scope: !3064)
!3092 = !DILocation(line: 2872, column: 10, scope: !3093)
!3093 = distinct !DILexicalBlock(scope: !3088, file: !79, line: 2871, column: 2)
!3094 = !DILocation(line: 2872, column: 3, scope: !3093)
!3095 = !DILocation(line: 2876, column: 3, scope: !3096)
!3096 = distinct !DILexicalBlock(scope: !3088, file: !79, line: 2875, column: 2)
!3097 = !DILocation(line: 2879, column: 1, scope: !3064)
!3098 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !79, file: !79, line: 2898, type: !3099, scopeLine: 2899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3099 = !DISubroutineType(types: !3100)
!3100 = !{!743, !743, !6}
!3101 = !DILocalVariable(name: "value", arg: 1, scope: !3098, file: !79, line: 2898, type: !743)
!3102 = !DILocation(line: 2898, column: 29, scope: !3098)
!3103 = !DILocalVariable(name: "factor", arg: 2, scope: !3098, file: !79, line: 2898, type: !6)
!3104 = !DILocation(line: 2898, column: 39, scope: !3098)
!3105 = !DILocalVariable(name: "u32Temp1", scope: !3098, file: !79, line: 2900, type: !743)
!3106 = !DILocation(line: 2900, column: 6, scope: !3098)
!3107 = !DILocalVariable(name: "u32Temp2", scope: !3098, file: !79, line: 2900, type: !743)
!3108 = !DILocation(line: 2900, column: 20, scope: !3098)
!3109 = !DILocation(line: 2901, column: 5, scope: !3110)
!3110 = distinct !DILexicalBlock(scope: !3098, file: !79, line: 2901, column: 5)
!3111 = !DILocation(line: 2901, column: 12, scope: !3110)
!3112 = !DILocation(line: 2901, column: 5, scope: !3098)
!3113 = !DILocation(line: 2904, column: 14, scope: !3114)
!3114 = distinct !DILexicalBlock(scope: !3110, file: !79, line: 2902, column: 2)
!3115 = !DILocation(line: 2904, column: 22, scope: !3114)
!3116 = !DILocation(line: 2904, column: 20, scope: !3114)
!3117 = !DILocation(line: 2904, column: 12, scope: !3114)
!3118 = !DILocation(line: 2905, column: 26, scope: !3114)
!3119 = !DILocation(line: 2905, column: 33, scope: !3114)
!3120 = !DILocation(line: 2905, column: 14, scope: !3114)
!3121 = !DILocation(line: 2905, column: 12, scope: !3114)
!3122 = !DILocation(line: 2906, column: 14, scope: !3114)
!3123 = !DILocation(line: 2906, column: 23, scope: !3114)
!3124 = !DILocation(line: 2906, column: 12, scope: !3114)
!3125 = !DILocation(line: 2907, column: 15, scope: !3114)
!3126 = !DILocation(line: 2907, column: 24, scope: !3114)
!3127 = !DILocation(line: 2907, column: 12, scope: !3114)
!3128 = !DILocation(line: 2908, column: 10, scope: !3114)
!3129 = !DILocation(line: 2908, column: 3, scope: !3114)
!3130 = !DILocation(line: 2912, column: 3, scope: !3131)
!3131 = distinct !DILexicalBlock(scope: !3110, file: !79, line: 2911, column: 2)
!3132 = !DILocation(line: 2914, column: 1, scope: !3098)
!3133 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !79, file: !79, line: 2933, type: !3099, scopeLine: 2934, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3134 = !DILocalVariable(name: "value", arg: 1, scope: !3133, file: !79, line: 2933, type: !743)
!3135 = !DILocation(line: 2933, column: 29, scope: !3133)
!3136 = !DILocalVariable(name: "factor", arg: 2, scope: !3133, file: !79, line: 2933, type: !6)
!3137 = !DILocation(line: 2933, column: 39, scope: !3133)
!3138 = !DILocalVariable(name: "u32Temp1", scope: !3133, file: !79, line: 2935, type: !743)
!3139 = !DILocation(line: 2935, column: 6, scope: !3133)
!3140 = !DILocalVariable(name: "u32Temp2", scope: !3133, file: !79, line: 2935, type: !743)
!3141 = !DILocation(line: 2935, column: 20, scope: !3133)
!3142 = !DILocation(line: 2936, column: 5, scope: !3143)
!3143 = distinct !DILexicalBlock(scope: !3133, file: !79, line: 2936, column: 5)
!3144 = !DILocation(line: 2936, column: 12, scope: !3143)
!3145 = !DILocation(line: 2936, column: 5, scope: !3133)
!3146 = !DILocation(line: 2938, column: 3, scope: !3147)
!3147 = distinct !DILexicalBlock(scope: !3143, file: !79, line: 2937, column: 2)
!3148 = !DILocation(line: 2942, column: 14, scope: !3149)
!3149 = distinct !DILexicalBlock(scope: !3143, file: !79, line: 2941, column: 2)
!3150 = !DILocation(line: 2942, column: 22, scope: !3149)
!3151 = !DILocation(line: 2942, column: 20, scope: !3149)
!3152 = !DILocation(line: 2942, column: 12, scope: !3149)
!3153 = !DILocation(line: 2943, column: 26, scope: !3149)
!3154 = !DILocation(line: 2943, column: 33, scope: !3149)
!3155 = !DILocation(line: 2943, column: 14, scope: !3149)
!3156 = !DILocation(line: 2943, column: 12, scope: !3149)
!3157 = !DILocation(line: 2944, column: 14, scope: !3149)
!3158 = !DILocation(line: 2944, column: 23, scope: !3149)
!3159 = !DILocation(line: 2944, column: 12, scope: !3149)
!3160 = !DILocation(line: 2945, column: 15, scope: !3149)
!3161 = !DILocation(line: 2945, column: 24, scope: !3149)
!3162 = !DILocation(line: 2945, column: 12, scope: !3149)
!3163 = !DILocation(line: 2946, column: 7, scope: !3164)
!3164 = distinct !DILexicalBlock(scope: !3149, file: !79, line: 2946, column: 6)
!3165 = !DILocation(line: 2946, column: 16, scope: !3164)
!3166 = !DILocation(line: 2946, column: 22, scope: !3164)
!3167 = !DILocation(line: 2946, column: 6, scope: !3149)
!3168 = !DILocation(line: 2948, column: 11, scope: !3169)
!3169 = distinct !DILexicalBlock(scope: !3164, file: !79, line: 2947, column: 3)
!3170 = !DILocation(line: 2948, column: 4, scope: !3169)
!3171 = !DILocation(line: 2952, column: 4, scope: !3172)
!3172 = distinct !DILexicalBlock(scope: !3164, file: !79, line: 2951, column: 3)
!3173 = !DILocation(line: 2955, column: 1, scope: !3133)
!3174 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !79, file: !79, line: 2977, type: !308, scopeLine: 2978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3175 = !DILocalVariable(name: "value", arg: 1, scope: !3174, file: !79, line: 2977, type: !13)
!3176 = !DILocation(line: 2977, column: 33, scope: !3174)
!3177 = !DILocalVariable(name: "factor", arg: 2, scope: !3174, file: !79, line: 2977, type: !13)
!3178 = !DILocation(line: 2977, column: 44, scope: !3174)
!3179 = !DILocation(line: 2979, column: 40, scope: !3174)
!3180 = !DILocation(line: 2979, column: 46, scope: !3174)
!3181 = !DILocation(line: 2979, column: 9, scope: !3174)
!3182 = !DILocation(line: 2979, column: 2, scope: !3174)
!3183 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !79, file: !79, line: 3001, type: !308, scopeLine: 3002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3184 = !DILocalVariable(name: "value", arg: 1, scope: !3183, file: !79, line: 3001, type: !13)
!3185 = !DILocation(line: 3001, column: 33, scope: !3183)
!3186 = !DILocalVariable(name: "factor", arg: 2, scope: !3183, file: !79, line: 3001, type: !13)
!3187 = !DILocation(line: 3001, column: 44, scope: !3183)
!3188 = !DILocation(line: 3003, column: 41, scope: !3183)
!3189 = !DILocation(line: 3003, column: 47, scope: !3183)
!3190 = !DILocation(line: 3003, column: 10, scope: !3183)
!3191 = !DILocation(line: 3003, column: 3, scope: !3183)
!3192 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !79, file: !79, line: 3026, type: !308, scopeLine: 3027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3193 = !DILocalVariable(name: "value", arg: 1, scope: !3192, file: !79, line: 3026, type: !13)
!3194 = !DILocation(line: 3026, column: 32, scope: !3192)
!3195 = !DILocalVariable(name: "factor", arg: 2, scope: !3192, file: !79, line: 3026, type: !13)
!3196 = !DILocation(line: 3026, column: 43, scope: !3192)
!3197 = !DILocation(line: 3028, column: 41, scope: !3192)
!3198 = !DILocation(line: 3028, column: 47, scope: !3192)
!3199 = !DILocation(line: 3028, column: 10, scope: !3192)
!3200 = !DILocation(line: 3028, column: 3, scope: !3192)
!3201 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !79, file: !79, line: 3051, type: !308, scopeLine: 3052, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3202 = !DILocalVariable(name: "value", arg: 1, scope: !3201, file: !79, line: 3051, type: !13)
!3203 = !DILocation(line: 3051, column: 34, scope: !3201)
!3204 = !DILocalVariable(name: "factor", arg: 2, scope: !3201, file: !79, line: 3051, type: !13)
!3205 = !DILocation(line: 3051, column: 45, scope: !3201)
!3206 = !DILocation(line: 3053, column: 44, scope: !3201)
!3207 = !DILocation(line: 3053, column: 50, scope: !3201)
!3208 = !DILocation(line: 3053, column: 10, scope: !3201)
!3209 = !DILocation(line: 3053, column: 3, scope: !3201)
!3210 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !79, file: !79, line: 3076, type: !308, scopeLine: 3077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3211 = !DILocalVariable(name: "value", arg: 1, scope: !3210, file: !79, line: 3076, type: !13)
!3212 = !DILocation(line: 3076, column: 33, scope: !3210)
!3213 = !DILocalVariable(name: "factor", arg: 2, scope: !3210, file: !79, line: 3076, type: !13)
!3214 = !DILocation(line: 3076, column: 44, scope: !3210)
!3215 = !DILocation(line: 3078, column: 44, scope: !3210)
!3216 = !DILocation(line: 3078, column: 50, scope: !3210)
!3217 = !DILocation(line: 3078, column: 10, scope: !3210)
!3218 = !DILocation(line: 3078, column: 3, scope: !3210)
!3219 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !79, file: !79, line: 3101, type: !308, scopeLine: 3102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3220 = !DILocalVariable(name: "value", arg: 1, scope: !3219, file: !79, line: 3101, type: !13)
!3221 = !DILocation(line: 3101, column: 31, scope: !3219)
!3222 = !DILocalVariable(name: "factor", arg: 2, scope: !3219, file: !79, line: 3101, type: !13)
!3223 = !DILocation(line: 3101, column: 42, scope: !3219)
!3224 = !DILocation(line: 3103, column: 44, scope: !3219)
!3225 = !DILocation(line: 3103, column: 50, scope: !3219)
!3226 = !DILocation(line: 3103, column: 10, scope: !3219)
!3227 = !DILocation(line: 3103, column: 3, scope: !3219)
!3228 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !79, file: !79, line: 3126, type: !308, scopeLine: 3127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3229 = !DILocalVariable(name: "value", arg: 1, scope: !3228, file: !79, line: 3126, type: !13)
!3230 = !DILocation(line: 3126, column: 33, scope: !3228)
!3231 = !DILocalVariable(name: "factor", arg: 2, scope: !3228, file: !79, line: 3126, type: !13)
!3232 = !DILocation(line: 3126, column: 44, scope: !3228)
!3233 = !DILocation(line: 3128, column: 44, scope: !3228)
!3234 = !DILocation(line: 3128, column: 50, scope: !3228)
!3235 = !DILocation(line: 3128, column: 10, scope: !3228)
!3236 = !DILocation(line: 3128, column: 3, scope: !3228)
!3237 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !79, file: !79, line: 3151, type: !308, scopeLine: 3152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3238 = !DILocalVariable(name: "value", arg: 1, scope: !3237, file: !79, line: 3151, type: !13)
!3239 = !DILocation(line: 3151, column: 32, scope: !3237)
!3240 = !DILocalVariable(name: "factor", arg: 2, scope: !3237, file: !79, line: 3151, type: !13)
!3241 = !DILocation(line: 3151, column: 43, scope: !3237)
!3242 = !DILocation(line: 3153, column: 44, scope: !3237)
!3243 = !DILocation(line: 3153, column: 50, scope: !3237)
!3244 = !DILocation(line: 3153, column: 10, scope: !3237)
!3245 = !DILocation(line: 3153, column: 3, scope: !3237)
!3246 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !79, file: !79, line: 3175, type: !308, scopeLine: 3176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3247 = !DILocalVariable(name: "value", arg: 1, scope: !3246, file: !79, line: 3175, type: !13)
!3248 = !DILocation(line: 3175, column: 31, scope: !3246)
!3249 = !DILocalVariable(name: "factor", arg: 2, scope: !3246, file: !79, line: 3175, type: !13)
!3250 = !DILocation(line: 3175, column: 42, scope: !3246)
!3251 = !DILocation(line: 3177, column: 44, scope: !3246)
!3252 = !DILocation(line: 3177, column: 50, scope: !3246)
!3253 = !DILocation(line: 3177, column: 10, scope: !3246)
!3254 = !DILocation(line: 3177, column: 3, scope: !3246)
!3255 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !79, file: !79, line: 3199, type: !308, scopeLine: 3200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3256 = !DILocalVariable(name: "value", arg: 1, scope: !3255, file: !79, line: 3199, type: !13)
!3257 = !DILocation(line: 3199, column: 30, scope: !3255)
!3258 = !DILocalVariable(name: "factor", arg: 2, scope: !3255, file: !79, line: 3199, type: !13)
!3259 = !DILocation(line: 3199, column: 41, scope: !3255)
!3260 = !DILocation(line: 3201, column: 44, scope: !3255)
!3261 = !DILocation(line: 3201, column: 50, scope: !3255)
!3262 = !DILocation(line: 3201, column: 10, scope: !3255)
!3263 = !DILocation(line: 3201, column: 3, scope: !3255)
!3264 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !79, file: !79, line: 3223, type: !308, scopeLine: 3224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3265 = !DILocalVariable(name: "value", arg: 1, scope: !3264, file: !79, line: 3223, type: !13)
!3266 = !DILocation(line: 3223, column: 33, scope: !3264)
!3267 = !DILocalVariable(name: "factor", arg: 2, scope: !3264, file: !79, line: 3223, type: !13)
!3268 = !DILocation(line: 3223, column: 44, scope: !3264)
!3269 = !DILocation(line: 3225, column: 44, scope: !3264)
!3270 = !DILocation(line: 3225, column: 50, scope: !3264)
!3271 = !DILocation(line: 3225, column: 10, scope: !3264)
!3272 = !DILocation(line: 3225, column: 3, scope: !3264)
!3273 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !79, file: !79, line: 3247, type: !308, scopeLine: 3248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3274 = !DILocalVariable(name: "value", arg: 1, scope: !3273, file: !79, line: 3247, type: !13)
!3275 = !DILocation(line: 3247, column: 32, scope: !3273)
!3276 = !DILocalVariable(name: "factor", arg: 2, scope: !3273, file: !79, line: 3247, type: !13)
!3277 = !DILocation(line: 3247, column: 43, scope: !3273)
!3278 = !DILocation(line: 3249, column: 44, scope: !3273)
!3279 = !DILocation(line: 3249, column: 50, scope: !3273)
!3280 = !DILocation(line: 3249, column: 10, scope: !3273)
!3281 = !DILocation(line: 3249, column: 3, scope: !3273)
!3282 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !79, file: !79, line: 3271, type: !308, scopeLine: 3272, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3283 = !DILocalVariable(name: "value", arg: 1, scope: !3282, file: !79, line: 3271, type: !13)
!3284 = !DILocation(line: 3271, column: 31, scope: !3282)
!3285 = !DILocalVariable(name: "factor", arg: 2, scope: !3282, file: !79, line: 3271, type: !13)
!3286 = !DILocation(line: 3271, column: 42, scope: !3282)
!3287 = !DILocation(line: 3273, column: 44, scope: !3282)
!3288 = !DILocation(line: 3273, column: 50, scope: !3282)
!3289 = !DILocation(line: 3273, column: 10, scope: !3282)
!3290 = !DILocation(line: 3273, column: 3, scope: !3282)
!3291 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !79, file: !79, line: 3295, type: !308, scopeLine: 3296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3292 = !DILocalVariable(name: "value", arg: 1, scope: !3291, file: !79, line: 3295, type: !13)
!3293 = !DILocation(line: 3295, column: 30, scope: !3291)
!3294 = !DILocalVariable(name: "factor", arg: 2, scope: !3291, file: !79, line: 3295, type: !13)
!3295 = !DILocation(line: 3295, column: 41, scope: !3291)
!3296 = !DILocation(line: 3297, column: 44, scope: !3291)
!3297 = !DILocation(line: 3297, column: 50, scope: !3291)
!3298 = !DILocation(line: 3297, column: 10, scope: !3291)
!3299 = !DILocation(line: 3297, column: 3, scope: !3291)
!3300 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !79, file: !79, line: 3318, type: !397, scopeLine: 3319, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3301 = !DILocalVariable(name: "value", arg: 1, scope: !3300, file: !79, line: 3318, type: !13)
!3302 = !DILocation(line: 3318, column: 33, scope: !3300)
!3303 = !DILocalVariable(name: "factor", arg: 2, scope: !3300, file: !79, line: 3318, type: !22)
!3304 = !DILocation(line: 3318, column: 44, scope: !3300)
!3305 = !DILocation(line: 3320, column: 41, scope: !3300)
!3306 = !DILocation(line: 3320, column: 47, scope: !3300)
!3307 = !DILocation(line: 3320, column: 10, scope: !3300)
!3308 = !DILocation(line: 3320, column: 3, scope: !3300)
!3309 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !79, file: !79, line: 3341, type: !397, scopeLine: 3342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3310 = !DILocalVariable(name: "value", arg: 1, scope: !3309, file: !79, line: 3341, type: !13)
!3311 = !DILocation(line: 3341, column: 32, scope: !3309)
!3312 = !DILocalVariable(name: "factor", arg: 2, scope: !3309, file: !79, line: 3341, type: !22)
!3313 = !DILocation(line: 3341, column: 43, scope: !3309)
!3314 = !DILocation(line: 3343, column: 33, scope: !3309)
!3315 = !DILocation(line: 3343, column: 39, scope: !3309)
!3316 = !DILocation(line: 3343, column: 2, scope: !3309)
!3317 = !DILocation(line: 3344, column: 1, scope: !3309)
!3318 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !79, file: !79, line: 3365, type: !397, scopeLine: 3366, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3319 = !DILocalVariable(name: "value", arg: 1, scope: !3318, file: !79, line: 3365, type: !13)
!3320 = !DILocation(line: 3365, column: 31, scope: !3318)
!3321 = !DILocalVariable(name: "factor", arg: 2, scope: !3318, file: !79, line: 3365, type: !22)
!3322 = !DILocation(line: 3365, column: 42, scope: !3318)
!3323 = !DILocation(line: 3367, column: 41, scope: !3318)
!3324 = !DILocation(line: 3367, column: 47, scope: !3318)
!3325 = !DILocation(line: 3367, column: 10, scope: !3318)
!3326 = !DILocation(line: 3367, column: 3, scope: !3318)
!3327 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !79, file: !79, line: 3390, type: !397, scopeLine: 3391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3328 = !DILocalVariable(name: "value", arg: 1, scope: !3327, file: !79, line: 3390, type: !13)
!3329 = !DILocation(line: 3390, column: 33, scope: !3327)
!3330 = !DILocalVariable(name: "factor", arg: 2, scope: !3327, file: !79, line: 3390, type: !22)
!3331 = !DILocation(line: 3390, column: 44, scope: !3327)
!3332 = !DILocation(line: 3392, column: 44, scope: !3327)
!3333 = !DILocation(line: 3392, column: 50, scope: !3327)
!3334 = !DILocation(line: 3392, column: 10, scope: !3327)
!3335 = !DILocation(line: 3392, column: 3, scope: !3327)
!3336 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !79, file: !79, line: 3415, type: !397, scopeLine: 3416, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3337 = !DILocalVariable(name: "value", arg: 1, scope: !3336, file: !79, line: 3415, type: !13)
!3338 = !DILocation(line: 3415, column: 32, scope: !3336)
!3339 = !DILocalVariable(name: "factor", arg: 2, scope: !3336, file: !79, line: 3415, type: !22)
!3340 = !DILocation(line: 3415, column: 43, scope: !3336)
!3341 = !DILocation(line: 3417, column: 44, scope: !3336)
!3342 = !DILocation(line: 3417, column: 50, scope: !3336)
!3343 = !DILocation(line: 3417, column: 10, scope: !3336)
!3344 = !DILocation(line: 3417, column: 3, scope: !3336)
!3345 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !79, file: !79, line: 3440, type: !397, scopeLine: 3441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3346 = !DILocalVariable(name: "value", arg: 1, scope: !3345, file: !79, line: 3440, type: !13)
!3347 = !DILocation(line: 3440, column: 31, scope: !3345)
!3348 = !DILocalVariable(name: "factor", arg: 2, scope: !3345, file: !79, line: 3440, type: !22)
!3349 = !DILocation(line: 3440, column: 42, scope: !3345)
!3350 = !DILocation(line: 3442, column: 44, scope: !3345)
!3351 = !DILocation(line: 3442, column: 50, scope: !3345)
!3352 = !DILocation(line: 3442, column: 10, scope: !3345)
!3353 = !DILocation(line: 3442, column: 3, scope: !3345)
!3354 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !79, file: !79, line: 3465, type: !397, scopeLine: 3466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3355 = !DILocalVariable(name: "value", arg: 1, scope: !3354, file: !79, line: 3465, type: !13)
!3356 = !DILocation(line: 3465, column: 33, scope: !3354)
!3357 = !DILocalVariable(name: "factor", arg: 2, scope: !3354, file: !79, line: 3465, type: !22)
!3358 = !DILocation(line: 3465, column: 44, scope: !3354)
!3359 = !DILocation(line: 3467, column: 44, scope: !3354)
!3360 = !DILocation(line: 3467, column: 50, scope: !3354)
!3361 = !DILocation(line: 3467, column: 10, scope: !3354)
!3362 = !DILocation(line: 3467, column: 3, scope: !3354)
!3363 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !79, file: !79, line: 3490, type: !397, scopeLine: 3491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3364 = !DILocalVariable(name: "value", arg: 1, scope: !3363, file: !79, line: 3490, type: !13)
!3365 = !DILocation(line: 3490, column: 32, scope: !3363)
!3366 = !DILocalVariable(name: "factor", arg: 2, scope: !3363, file: !79, line: 3490, type: !22)
!3367 = !DILocation(line: 3490, column: 43, scope: !3363)
!3368 = !DILocation(line: 3492, column: 44, scope: !3363)
!3369 = !DILocation(line: 3492, column: 50, scope: !3363)
!3370 = !DILocation(line: 3492, column: 10, scope: !3363)
!3371 = !DILocation(line: 3492, column: 3, scope: !3363)
!3372 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !79, file: !79, line: 3514, type: !397, scopeLine: 3515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3373 = !DILocalVariable(name: "value", arg: 1, scope: !3372, file: !79, line: 3514, type: !13)
!3374 = !DILocation(line: 3514, column: 31, scope: !3372)
!3375 = !DILocalVariable(name: "factor", arg: 2, scope: !3372, file: !79, line: 3514, type: !22)
!3376 = !DILocation(line: 3514, column: 42, scope: !3372)
!3377 = !DILocation(line: 3516, column: 44, scope: !3372)
!3378 = !DILocation(line: 3516, column: 50, scope: !3372)
!3379 = !DILocation(line: 3516, column: 10, scope: !3372)
!3380 = !DILocation(line: 3516, column: 3, scope: !3372)
!3381 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !79, file: !79, line: 3538, type: !397, scopeLine: 3539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3382 = !DILocalVariable(name: "value", arg: 1, scope: !3381, file: !79, line: 3538, type: !13)
!3383 = !DILocation(line: 3538, column: 30, scope: !3381)
!3384 = !DILocalVariable(name: "factor", arg: 2, scope: !3381, file: !79, line: 3538, type: !22)
!3385 = !DILocation(line: 3538, column: 41, scope: !3381)
!3386 = !DILocation(line: 3540, column: 44, scope: !3381)
!3387 = !DILocation(line: 3540, column: 50, scope: !3381)
!3388 = !DILocation(line: 3540, column: 10, scope: !3381)
!3389 = !DILocation(line: 3540, column: 3, scope: !3381)
!3390 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !79, file: !79, line: 3562, type: !397, scopeLine: 3563, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3391 = !DILocalVariable(name: "value", arg: 1, scope: !3390, file: !79, line: 3562, type: !13)
!3392 = !DILocation(line: 3562, column: 33, scope: !3390)
!3393 = !DILocalVariable(name: "factor", arg: 2, scope: !3390, file: !79, line: 3562, type: !22)
!3394 = !DILocation(line: 3562, column: 44, scope: !3390)
!3395 = !DILocation(line: 3564, column: 44, scope: !3390)
!3396 = !DILocation(line: 3564, column: 50, scope: !3390)
!3397 = !DILocation(line: 3564, column: 10, scope: !3390)
!3398 = !DILocation(line: 3564, column: 3, scope: !3390)
!3399 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !79, file: !79, line: 3586, type: !397, scopeLine: 3587, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3400 = !DILocalVariable(name: "value", arg: 1, scope: !3399, file: !79, line: 3586, type: !13)
!3401 = !DILocation(line: 3586, column: 32, scope: !3399)
!3402 = !DILocalVariable(name: "factor", arg: 2, scope: !3399, file: !79, line: 3586, type: !22)
!3403 = !DILocation(line: 3586, column: 43, scope: !3399)
!3404 = !DILocation(line: 3588, column: 44, scope: !3399)
!3405 = !DILocation(line: 3588, column: 50, scope: !3399)
!3406 = !DILocation(line: 3588, column: 10, scope: !3399)
!3407 = !DILocation(line: 3588, column: 3, scope: !3399)
!3408 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !79, file: !79, line: 3610, type: !397, scopeLine: 3611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3409 = !DILocalVariable(name: "value", arg: 1, scope: !3408, file: !79, line: 3610, type: !13)
!3410 = !DILocation(line: 3610, column: 31, scope: !3408)
!3411 = !DILocalVariable(name: "factor", arg: 2, scope: !3408, file: !79, line: 3610, type: !22)
!3412 = !DILocation(line: 3610, column: 42, scope: !3408)
!3413 = !DILocation(line: 3612, column: 44, scope: !3408)
!3414 = !DILocation(line: 3612, column: 50, scope: !3408)
!3415 = !DILocation(line: 3612, column: 10, scope: !3408)
!3416 = !DILocation(line: 3612, column: 3, scope: !3408)
!3417 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !79, file: !79, line: 3634, type: !397, scopeLine: 3635, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3418 = !DILocalVariable(name: "value", arg: 1, scope: !3417, file: !79, line: 3634, type: !13)
!3419 = !DILocation(line: 3634, column: 30, scope: !3417)
!3420 = !DILocalVariable(name: "factor", arg: 2, scope: !3417, file: !79, line: 3634, type: !22)
!3421 = !DILocation(line: 3634, column: 41, scope: !3417)
!3422 = !DILocation(line: 3636, column: 44, scope: !3417)
!3423 = !DILocation(line: 3636, column: 50, scope: !3417)
!3424 = !DILocation(line: 3636, column: 10, scope: !3417)
!3425 = !DILocation(line: 3636, column: 3, scope: !3417)
!3426 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !79, file: !79, line: 3656, type: !482, scopeLine: 3657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3427 = !DILocalVariable(name: "value", arg: 1, scope: !3426, file: !79, line: 3656, type: !13)
!3428 = !DILocation(line: 3656, column: 32, scope: !3426)
!3429 = !DILocalVariable(name: "factor", arg: 2, scope: !3426, file: !79, line: 3656, type: !17)
!3430 = !DILocation(line: 3656, column: 42, scope: !3426)
!3431 = !DILocation(line: 3658, column: 40, scope: !3426)
!3432 = !DILocation(line: 3658, column: 58, scope: !3426)
!3433 = !DILocation(line: 3658, column: 52, scope: !3426)
!3434 = !DILocation(line: 3658, column: 66, scope: !3426)
!3435 = !DILocation(line: 3658, column: 46, scope: !3426)
!3436 = !DILocation(line: 3658, column: 10, scope: !3426)
!3437 = !DILocation(line: 3658, column: 3, scope: !3426)
!3438 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !79, file: !79, line: 3678, type: !482, scopeLine: 3679, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3439 = !DILocalVariable(name: "value", arg: 1, scope: !3438, file: !79, line: 3678, type: !13)
!3440 = !DILocation(line: 3678, column: 31, scope: !3438)
!3441 = !DILocalVariable(name: "factor", arg: 2, scope: !3438, file: !79, line: 3678, type: !17)
!3442 = !DILocation(line: 3678, column: 41, scope: !3438)
!3443 = !DILocation(line: 3680, column: 40, scope: !3438)
!3444 = !DILocation(line: 3680, column: 58, scope: !3438)
!3445 = !DILocation(line: 3680, column: 52, scope: !3438)
!3446 = !DILocation(line: 3680, column: 66, scope: !3438)
!3447 = !DILocation(line: 3680, column: 46, scope: !3438)
!3448 = !DILocation(line: 3680, column: 10, scope: !3438)
!3449 = !DILocation(line: 3680, column: 3, scope: !3438)
!3450 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !79, file: !79, line: 3701, type: !482, scopeLine: 3702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3451 = !DILocalVariable(name: "value", arg: 1, scope: !3450, file: !79, line: 3701, type: !13)
!3452 = !DILocation(line: 3701, column: 30, scope: !3450)
!3453 = !DILocalVariable(name: "factor", arg: 2, scope: !3450, file: !79, line: 3701, type: !17)
!3454 = !DILocation(line: 3701, column: 40, scope: !3450)
!3455 = !DILocation(line: 3703, column: 40, scope: !3450)
!3456 = !DILocation(line: 3703, column: 58, scope: !3450)
!3457 = !DILocation(line: 3703, column: 52, scope: !3450)
!3458 = !DILocation(line: 3703, column: 66, scope: !3450)
!3459 = !DILocation(line: 3703, column: 46, scope: !3450)
!3460 = !DILocation(line: 3703, column: 10, scope: !3450)
!3461 = !DILocation(line: 3703, column: 3, scope: !3450)
!3462 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !79, file: !79, line: 3724, type: !482, scopeLine: 3725, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3463 = !DILocalVariable(name: "value", arg: 1, scope: !3462, file: !79, line: 3724, type: !13)
!3464 = !DILocation(line: 3724, column: 31, scope: !3462)
!3465 = !DILocalVariable(name: "factor", arg: 2, scope: !3462, file: !79, line: 3724, type: !17)
!3466 = !DILocation(line: 3724, column: 41, scope: !3462)
!3467 = !DILocation(line: 3726, column: 43, scope: !3462)
!3468 = !DILocation(line: 3726, column: 61, scope: !3462)
!3469 = !DILocation(line: 3726, column: 55, scope: !3462)
!3470 = !DILocation(line: 3726, column: 69, scope: !3462)
!3471 = !DILocation(line: 3726, column: 49, scope: !3462)
!3472 = !DILocation(line: 3726, column: 10, scope: !3462)
!3473 = !DILocation(line: 3726, column: 3, scope: !3462)
!3474 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !79, file: !79, line: 3747, type: !482, scopeLine: 3748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3475 = !DILocalVariable(name: "value", arg: 1, scope: !3474, file: !79, line: 3747, type: !13)
!3476 = !DILocation(line: 3747, column: 30, scope: !3474)
!3477 = !DILocalVariable(name: "factor", arg: 2, scope: !3474, file: !79, line: 3747, type: !17)
!3478 = !DILocation(line: 3747, column: 40, scope: !3474)
!3479 = !DILocation(line: 3749, column: 43, scope: !3474)
!3480 = !DILocation(line: 3749, column: 61, scope: !3474)
!3481 = !DILocation(line: 3749, column: 55, scope: !3474)
!3482 = !DILocation(line: 3749, column: 69, scope: !3474)
!3483 = !DILocation(line: 3749, column: 49, scope: !3474)
!3484 = !DILocation(line: 3749, column: 10, scope: !3474)
!3485 = !DILocation(line: 3749, column: 3, scope: !3474)
!3486 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !79, file: !79, line: 3769, type: !482, scopeLine: 3770, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3487 = !DILocalVariable(name: "value", arg: 1, scope: !3486, file: !79, line: 3769, type: !13)
!3488 = !DILocation(line: 3769, column: 30, scope: !3486)
!3489 = !DILocalVariable(name: "factor", arg: 2, scope: !3486, file: !79, line: 3769, type: !17)
!3490 = !DILocation(line: 3769, column: 40, scope: !3486)
!3491 = !DILocation(line: 3771, column: 43, scope: !3486)
!3492 = !DILocation(line: 3771, column: 61, scope: !3486)
!3493 = !DILocation(line: 3771, column: 55, scope: !3486)
!3494 = !DILocation(line: 3771, column: 69, scope: !3486)
!3495 = !DILocation(line: 3771, column: 49, scope: !3486)
!3496 = !DILocation(line: 3771, column: 10, scope: !3486)
!3497 = !DILocation(line: 3771, column: 3, scope: !3486)
!3498 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !79, file: !79, line: 3791, type: !482, scopeLine: 3792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3499 = !DILocalVariable(name: "value", arg: 1, scope: !3498, file: !79, line: 3791, type: !13)
!3500 = !DILocation(line: 3791, column: 29, scope: !3498)
!3501 = !DILocalVariable(name: "factor", arg: 2, scope: !3498, file: !79, line: 3791, type: !17)
!3502 = !DILocation(line: 3791, column: 39, scope: !3498)
!3503 = !DILocation(line: 3793, column: 43, scope: !3498)
!3504 = !DILocation(line: 3793, column: 61, scope: !3498)
!3505 = !DILocation(line: 3793, column: 55, scope: !3498)
!3506 = !DILocation(line: 3793, column: 69, scope: !3498)
!3507 = !DILocation(line: 3793, column: 49, scope: !3498)
!3508 = !DILocation(line: 3793, column: 10, scope: !3498)
!3509 = !DILocation(line: 3793, column: 3, scope: !3498)
!3510 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !79, file: !79, line: 3813, type: !482, scopeLine: 3814, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3511 = !DILocalVariable(name: "value", arg: 1, scope: !3510, file: !79, line: 3813, type: !13)
!3512 = !DILocation(line: 3813, column: 30, scope: !3510)
!3513 = !DILocalVariable(name: "factor", arg: 2, scope: !3510, file: !79, line: 3813, type: !17)
!3514 = !DILocation(line: 3813, column: 40, scope: !3510)
!3515 = !DILocation(line: 3815, column: 43, scope: !3510)
!3516 = !DILocation(line: 3815, column: 61, scope: !3510)
!3517 = !DILocation(line: 3815, column: 55, scope: !3510)
!3518 = !DILocation(line: 3815, column: 69, scope: !3510)
!3519 = !DILocation(line: 3815, column: 49, scope: !3510)
!3520 = !DILocation(line: 3815, column: 10, scope: !3510)
!3521 = !DILocation(line: 3815, column: 3, scope: !3510)
!3522 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !79, file: !79, line: 3835, type: !482, scopeLine: 3836, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3523 = !DILocalVariable(name: "value", arg: 1, scope: !3522, file: !79, line: 3835, type: !13)
!3524 = !DILocation(line: 3835, column: 29, scope: !3522)
!3525 = !DILocalVariable(name: "factor", arg: 2, scope: !3522, file: !79, line: 3835, type: !17)
!3526 = !DILocation(line: 3835, column: 39, scope: !3522)
!3527 = !DILocation(line: 3837, column: 43, scope: !3522)
!3528 = !DILocation(line: 3837, column: 61, scope: !3522)
!3529 = !DILocation(line: 3837, column: 55, scope: !3522)
!3530 = !DILocation(line: 3837, column: 69, scope: !3522)
!3531 = !DILocation(line: 3837, column: 49, scope: !3522)
!3532 = !DILocation(line: 3837, column: 10, scope: !3522)
!3533 = !DILocation(line: 3837, column: 3, scope: !3522)
!3534 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !79, file: !79, line: 3859, type: !1874, scopeLine: 3860, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3535 = !DILocalVariable(name: "value", arg: 1, scope: !3534, file: !79, line: 3859, type: !87)
!3536 = !DILocation(line: 3859, column: 31, scope: !3534)
!3537 = !DILocalVariable(name: "factor", arg: 2, scope: !3534, file: !79, line: 3859, type: !13)
!3538 = !DILocation(line: 3859, column: 42, scope: !3534)
!3539 = !DILocation(line: 3861, column: 41, scope: !3534)
!3540 = !DILocation(line: 3861, column: 47, scope: !3534)
!3541 = !DILocation(line: 3861, column: 10, scope: !3534)
!3542 = !DILocation(line: 3861, column: 3, scope: !3534)
!3543 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !79, file: !79, line: 5055, type: !3544, scopeLine: 5056, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3544 = !DISubroutineType(types: !3545)
!3545 = !{!87, !87, !13, !743}
!3546 = !DILocalVariable(name: "value", arg: 1, scope: !3543, file: !79, line: 5055, type: !87)
!3547 = !DILocation(line: 5055, column: 40, scope: !3543)
!3548 = !DILocalVariable(name: "factor", arg: 2, scope: !3543, file: !79, line: 5055, type: !13)
!3549 = !DILocation(line: 5055, column: 51, scope: !3543)
!3550 = !DILocalVariable(name: "count", arg: 3, scope: !3543, file: !79, line: 5055, type: !743)
!3551 = !DILocation(line: 5055, column: 63, scope: !3543)
!3552 = !DILocalVariable(name: "u32Temp1", scope: !3543, file: !79, line: 5057, type: !743)
!3553 = !DILocation(line: 5057, column: 6, scope: !3543)
!3554 = !DILocalVariable(name: "u32Temp2", scope: !3543, file: !79, line: 5057, type: !743)
!3555 = !DILocation(line: 5057, column: 17, scope: !3543)
!3556 = !DILocalVariable(name: "u32Temp3", scope: !3543, file: !79, line: 5057, type: !743)
!3557 = !DILocation(line: 5057, column: 26, scope: !3543)
!3558 = !DILocalVariable(name: "u32Temp4", scope: !3543, file: !79, line: 5057, type: !743)
!3559 = !DILocation(line: 5057, column: 35, scope: !3543)
!3560 = !DILocalVariable(name: "u8SignBit", scope: !3543, file: !79, line: 5058, type: !17)
!3561 = !DILocation(line: 5058, column: 5, scope: !3543)
!3562 = !DILocation(line: 5060, column: 7, scope: !3563)
!3563 = distinct !DILexicalBlock(scope: !3543, file: !79, line: 5060, column: 5)
!3564 = !DILocation(line: 5060, column: 12, scope: !3563)
!3565 = !DILocation(line: 5060, column: 16, scope: !3563)
!3566 = !DILocation(line: 5060, column: 20, scope: !3563)
!3567 = !DILocation(line: 5060, column: 26, scope: !3563)
!3568 = !DILocation(line: 5060, column: 31, scope: !3563)
!3569 = !DILocation(line: 5060, column: 36, scope: !3563)
!3570 = !DILocation(line: 5060, column: 41, scope: !3563)
!3571 = !DILocation(line: 5060, column: 45, scope: !3563)
!3572 = !DILocation(line: 5060, column: 49, scope: !3563)
!3573 = !DILocation(line: 5060, column: 55, scope: !3563)
!3574 = !DILocation(line: 5060, column: 5, scope: !3543)
!3575 = !DILocation(line: 5062, column: 13, scope: !3576)
!3576 = distinct !DILexicalBlock(scope: !3563, file: !79, line: 5061, column: 2)
!3577 = !DILocation(line: 5063, column: 2, scope: !3576)
!3578 = !DILocation(line: 5066, column: 13, scope: !3579)
!3579 = distinct !DILexicalBlock(scope: !3563, file: !79, line: 5065, column: 2)
!3580 = !DILocation(line: 5069, column: 5, scope: !3581)
!3581 = distinct !DILexicalBlock(scope: !3543, file: !79, line: 5069, column: 5)
!3582 = !DILocation(line: 5069, column: 10, scope: !3581)
!3583 = !DILocation(line: 5069, column: 5, scope: !3543)
!3584 = !DILocation(line: 5072, column: 44, scope: !3585)
!3585 = distinct !DILexicalBlock(scope: !3586, file: !79, line: 5072, column: 7)
!3586 = distinct !DILexicalBlock(scope: !3581, file: !79, line: 5070, column: 2)
!3587 = !DILocation(line: 5072, column: 34, scope: !3585)
!3588 = !DILocation(line: 5072, column: 9, scope: !3585)
!3589 = !DILocation(line: 5072, column: 7, scope: !3586)
!3590 = !DILocation(line: 5073, column: 7, scope: !3591)
!3591 = distinct !DILexicalBlock(scope: !3585, file: !79, line: 5072, column: 54)
!3592 = !DILocation(line: 5080, column: 36, scope: !3586)
!3593 = !DILocation(line: 5080, column: 35, scope: !3586)
!3594 = !DILocation(line: 5080, column: 25, scope: !3586)
!3595 = !DILocation(line: 5080, column: 23, scope: !3586)
!3596 = !DILocation(line: 5081, column: 3, scope: !3586)
!3597 = !DILocation(line: 5085, column: 14, scope: !3598)
!3598 = distinct !DILexicalBlock(scope: !3581, file: !79, line: 5084, column: 2)
!3599 = !DILocation(line: 5085, column: 12, scope: !3598)
!3600 = !DILocation(line: 5088, column: 5, scope: !3601)
!3601 = distinct !DILexicalBlock(scope: !3543, file: !79, line: 5088, column: 5)
!3602 = !DILocation(line: 5088, column: 11, scope: !3601)
!3603 = !DILocation(line: 5088, column: 5, scope: !3543)
!3604 = !DILocation(line: 5090, column: 15, scope: !3605)
!3605 = distinct !DILexicalBlock(scope: !3601, file: !79, line: 5089, column: 2)
!3606 = !DILocation(line: 5090, column: 14, scope: !3605)
!3607 = !DILocation(line: 5090, column: 12, scope: !3605)
!3608 = !DILocation(line: 5091, column: 2, scope: !3605)
!3609 = !DILocation(line: 5094, column: 14, scope: !3610)
!3610 = distinct !DILexicalBlock(scope: !3601, file: !79, line: 5093, column: 2)
!3611 = !DILocation(line: 5094, column: 12, scope: !3610)
!3612 = !DILocation(line: 5097, column: 13, scope: !3543)
!3613 = !DILocation(line: 5097, column: 24, scope: !3543)
!3614 = !DILocation(line: 5097, column: 22, scope: !3543)
!3615 = !DILocation(line: 5097, column: 11, scope: !3543)
!3616 = !DILocation(line: 5098, column: 25, scope: !3543)
!3617 = !DILocation(line: 5098, column: 35, scope: !3543)
!3618 = !DILocation(line: 5098, column: 13, scope: !3543)
!3619 = !DILocation(line: 5098, column: 11, scope: !3543)
!3620 = !DILocation(line: 5099, column: 13, scope: !3543)
!3621 = !DILocation(line: 5099, column: 25, scope: !3543)
!3622 = !DILocation(line: 5099, column: 22, scope: !3543)
!3623 = !DILocation(line: 5099, column: 11, scope: !3543)
!3624 = !DILocation(line: 5100, column: 14, scope: !3543)
!3625 = !DILocation(line: 5100, column: 30, scope: !3543)
!3626 = !DILocation(line: 5100, column: 29, scope: !3543)
!3627 = !DILocation(line: 5100, column: 23, scope: !3543)
!3628 = !DILocation(line: 5100, column: 11, scope: !3543)
!3629 = !DILocation(line: 5101, column: 6, scope: !3630)
!3630 = distinct !DILexicalBlock(scope: !3543, file: !79, line: 5101, column: 5)
!3631 = !DILocation(line: 5101, column: 16, scope: !3630)
!3632 = !DILocation(line: 5101, column: 14, scope: !3630)
!3633 = !DILocation(line: 5101, column: 22, scope: !3630)
!3634 = !DILocation(line: 5101, column: 5, scope: !3543)
!3635 = !DILocation(line: 5103, column: 6, scope: !3636)
!3636 = distinct !DILexicalBlock(scope: !3637, file: !79, line: 5103, column: 6)
!3637 = distinct !DILexicalBlock(scope: !3630, file: !79, line: 5102, column: 2)
!3638 = !DILocation(line: 5103, column: 16, scope: !3636)
!3639 = !DILocation(line: 5103, column: 6, scope: !3637)
!3640 = !DILocation(line: 5105, column: 7, scope: !3641)
!3641 = distinct !DILexicalBlock(scope: !3642, file: !79, line: 5105, column: 7)
!3642 = distinct !DILexicalBlock(scope: !3636, file: !79, line: 5104, column: 3)
!3643 = !DILocation(line: 5105, column: 15, scope: !3641)
!3644 = !DILocation(line: 5105, column: 7, scope: !3642)
!3645 = !DILocation(line: 5106, column: 12, scope: !3641)
!3646 = !DILocation(line: 5106, column: 5, scope: !3641)
!3647 = !DILocation(line: 5108, column: 5, scope: !3641)
!3648 = !DILocation(line: 5112, column: 7, scope: !3649)
!3649 = distinct !DILexicalBlock(scope: !3650, file: !79, line: 5112, column: 7)
!3650 = distinct !DILexicalBlock(scope: !3636, file: !79, line: 5111, column: 3)
!3651 = !DILocation(line: 5112, column: 15, scope: !3649)
!3652 = !DILocation(line: 5112, column: 7, scope: !3650)
!3653 = !DILocation(line: 5113, column: 13, scope: !3649)
!3654 = !DILocation(line: 5113, column: 12, scope: !3649)
!3655 = !DILocation(line: 5113, column: 5, scope: !3649)
!3656 = !DILocation(line: 5115, column: 5, scope: !3649)
!3657 = !DILocation(line: 5120, column: 3, scope: !3658)
!3658 = distinct !DILexicalBlock(scope: !3630, file: !79, line: 5119, column: 2)
!3659 = !DILocation(line: 5122, column: 1, scope: !3543)
!3660 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !3661, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3661 = !DISubroutineType(types: !3662)
!3662 = !{!51, !26}
!3663 = !DILocalVariable(name: "value", arg: 1, scope: !3660, file: !30, line: 42, type: !26)
!3664 = !DILocation(line: 42, column: 38, scope: !3660)
!3665 = !DILocation(line: 44, column: 12, scope: !3660)
!3666 = !DILocation(line: 44, column: 18, scope: !3660)
!3667 = !DILocation(line: 44, column: 5, scope: !3660)
!3668 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !79, file: !79, line: 3883, type: !2643, scopeLine: 3884, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3669 = !DILocalVariable(name: "value", arg: 1, scope: !3668, file: !79, line: 3883, type: !87)
!3670 = !DILocation(line: 3883, column: 30, scope: !3668)
!3671 = !DILocalVariable(name: "factor", arg: 2, scope: !3668, file: !79, line: 3883, type: !6)
!3672 = !DILocation(line: 3883, column: 40, scope: !3668)
!3673 = !DILocation(line: 3885, column: 40, scope: !3668)
!3674 = !DILocation(line: 3885, column: 46, scope: !3668)
!3675 = !DILocation(line: 3885, column: 10, scope: !3668)
!3676 = !DILocation(line: 3885, column: 3, scope: !3668)
!3677 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !79, file: !79, line: 5217, type: !3678, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3678 = !DISubroutineType(types: !3679)
!3679 = !{!87, !87, !6, !743}
!3680 = !DILocalVariable(name: "value", arg: 1, scope: !3677, file: !79, line: 5217, type: !87)
!3681 = !DILocation(line: 5217, column: 39, scope: !3677)
!3682 = !DILocalVariable(name: "factor", arg: 2, scope: !3677, file: !79, line: 5217, type: !6)
!3683 = !DILocation(line: 5217, column: 49, scope: !3677)
!3684 = !DILocalVariable(name: "count", arg: 3, scope: !3677, file: !79, line: 5217, type: !743)
!3685 = !DILocation(line: 5217, column: 61, scope: !3677)
!3686 = !DILocalVariable(name: "u32Temp1", scope: !3677, file: !79, line: 5219, type: !743)
!3687 = !DILocation(line: 5219, column: 6, scope: !3677)
!3688 = !DILocalVariable(name: "u32Temp2", scope: !3677, file: !79, line: 5219, type: !743)
!3689 = !DILocation(line: 5219, column: 17, scope: !3677)
!3690 = !DILocalVariable(name: "u32Temp3", scope: !3677, file: !79, line: 5219, type: !743)
!3691 = !DILocation(line: 5219, column: 26, scope: !3677)
!3692 = !DILocalVariable(name: "u32Temp4", scope: !3677, file: !79, line: 5219, type: !743)
!3693 = !DILocation(line: 5219, column: 35, scope: !3677)
!3694 = !DILocalVariable(name: "u8SignBit", scope: !3677, file: !79, line: 5220, type: !17)
!3695 = !DILocation(line: 5220, column: 5, scope: !3677)
!3696 = !DILocation(line: 5222, column: 7, scope: !3697)
!3697 = distinct !DILexicalBlock(scope: !3677, file: !79, line: 5222, column: 5)
!3698 = !DILocation(line: 5222, column: 12, scope: !3697)
!3699 = !DILocation(line: 5222, column: 16, scope: !3697)
!3700 = !DILocation(line: 5222, column: 20, scope: !3697)
!3701 = !DILocation(line: 5222, column: 26, scope: !3697)
!3702 = !DILocation(line: 5222, column: 31, scope: !3697)
!3703 = !DILocation(line: 5222, column: 36, scope: !3697)
!3704 = !DILocation(line: 5222, column: 41, scope: !3697)
!3705 = !DILocation(line: 5222, column: 45, scope: !3697)
!3706 = !DILocation(line: 5222, column: 49, scope: !3697)
!3707 = !DILocation(line: 5222, column: 55, scope: !3697)
!3708 = !DILocation(line: 5222, column: 5, scope: !3677)
!3709 = !DILocation(line: 5224, column: 13, scope: !3710)
!3710 = distinct !DILexicalBlock(scope: !3697, file: !79, line: 5223, column: 2)
!3711 = !DILocation(line: 5225, column: 2, scope: !3710)
!3712 = !DILocation(line: 5228, column: 13, scope: !3713)
!3713 = distinct !DILexicalBlock(scope: !3697, file: !79, line: 5227, column: 2)
!3714 = !DILocation(line: 5231, column: 5, scope: !3715)
!3715 = distinct !DILexicalBlock(scope: !3677, file: !79, line: 5231, column: 5)
!3716 = !DILocation(line: 5231, column: 10, scope: !3715)
!3717 = !DILocation(line: 5231, column: 5, scope: !3677)
!3718 = !DILocation(line: 5233, column: 15, scope: !3719)
!3719 = distinct !DILexicalBlock(scope: !3715, file: !79, line: 5232, column: 2)
!3720 = !DILocation(line: 5233, column: 14, scope: !3719)
!3721 = !DILocation(line: 5233, column: 12, scope: !3719)
!3722 = !DILocation(line: 5234, column: 2, scope: !3719)
!3723 = !DILocation(line: 5237, column: 14, scope: !3724)
!3724 = distinct !DILexicalBlock(scope: !3715, file: !79, line: 5236, column: 2)
!3725 = !DILocation(line: 5237, column: 12, scope: !3724)
!3726 = !DILocation(line: 5240, column: 5, scope: !3727)
!3727 = distinct !DILexicalBlock(scope: !3677, file: !79, line: 5240, column: 5)
!3728 = !DILocation(line: 5240, column: 11, scope: !3727)
!3729 = !DILocation(line: 5240, column: 5, scope: !3677)
!3730 = !DILocation(line: 5242, column: 15, scope: !3731)
!3731 = distinct !DILexicalBlock(scope: !3727, file: !79, line: 5241, column: 2)
!3732 = !DILocation(line: 5242, column: 14, scope: !3731)
!3733 = !DILocation(line: 5242, column: 12, scope: !3731)
!3734 = !DILocation(line: 5243, column: 2, scope: !3731)
!3735 = !DILocation(line: 5246, column: 14, scope: !3736)
!3736 = distinct !DILexicalBlock(scope: !3727, file: !79, line: 5245, column: 2)
!3737 = !DILocation(line: 5246, column: 12, scope: !3736)
!3738 = !DILocation(line: 5249, column: 13, scope: !3677)
!3739 = !DILocation(line: 5249, column: 24, scope: !3677)
!3740 = !DILocation(line: 5249, column: 22, scope: !3677)
!3741 = !DILocation(line: 5249, column: 11, scope: !3677)
!3742 = !DILocation(line: 5250, column: 25, scope: !3677)
!3743 = !DILocation(line: 5250, column: 35, scope: !3677)
!3744 = !DILocation(line: 5250, column: 13, scope: !3677)
!3745 = !DILocation(line: 5250, column: 11, scope: !3677)
!3746 = !DILocation(line: 5251, column: 13, scope: !3677)
!3747 = !DILocation(line: 5251, column: 25, scope: !3677)
!3748 = !DILocation(line: 5251, column: 22, scope: !3677)
!3749 = !DILocation(line: 5251, column: 11, scope: !3677)
!3750 = !DILocation(line: 5252, column: 14, scope: !3677)
!3751 = !DILocation(line: 5252, column: 30, scope: !3677)
!3752 = !DILocation(line: 5252, column: 29, scope: !3677)
!3753 = !DILocation(line: 5252, column: 23, scope: !3677)
!3754 = !DILocation(line: 5252, column: 11, scope: !3677)
!3755 = !DILocation(line: 5253, column: 6, scope: !3756)
!3756 = distinct !DILexicalBlock(scope: !3677, file: !79, line: 5253, column: 5)
!3757 = !DILocation(line: 5253, column: 16, scope: !3756)
!3758 = !DILocation(line: 5253, column: 14, scope: !3756)
!3759 = !DILocation(line: 5253, column: 22, scope: !3756)
!3760 = !DILocation(line: 5253, column: 5, scope: !3677)
!3761 = !DILocation(line: 5255, column: 6, scope: !3762)
!3762 = distinct !DILexicalBlock(scope: !3763, file: !79, line: 5255, column: 6)
!3763 = distinct !DILexicalBlock(scope: !3756, file: !79, line: 5254, column: 2)
!3764 = !DILocation(line: 5255, column: 16, scope: !3762)
!3765 = !DILocation(line: 5255, column: 6, scope: !3763)
!3766 = !DILocation(line: 5257, column: 7, scope: !3767)
!3767 = distinct !DILexicalBlock(scope: !3768, file: !79, line: 5257, column: 7)
!3768 = distinct !DILexicalBlock(scope: !3762, file: !79, line: 5256, column: 3)
!3769 = !DILocation(line: 5257, column: 15, scope: !3767)
!3770 = !DILocation(line: 5257, column: 7, scope: !3768)
!3771 = !DILocation(line: 5258, column: 12, scope: !3767)
!3772 = !DILocation(line: 5258, column: 5, scope: !3767)
!3773 = !DILocation(line: 5260, column: 5, scope: !3767)
!3774 = !DILocation(line: 5264, column: 7, scope: !3775)
!3775 = distinct !DILexicalBlock(scope: !3776, file: !79, line: 5264, column: 7)
!3776 = distinct !DILexicalBlock(scope: !3762, file: !79, line: 5263, column: 3)
!3777 = !DILocation(line: 5264, column: 15, scope: !3775)
!3778 = !DILocation(line: 5264, column: 7, scope: !3776)
!3779 = !DILocation(line: 5265, column: 13, scope: !3775)
!3780 = !DILocation(line: 5265, column: 12, scope: !3775)
!3781 = !DILocation(line: 5265, column: 5, scope: !3775)
!3782 = !DILocation(line: 5267, column: 5, scope: !3775)
!3783 = !DILocation(line: 5272, column: 3, scope: !3784)
!3784 = distinct !DILexicalBlock(scope: !3756, file: !79, line: 5271, column: 2)
!3785 = !DILocation(line: 5274, column: 1, scope: !3677)
!3786 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !79, file: !79, line: 3907, type: !779, scopeLine: 3908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3787 = !DILocalVariable(name: "value", arg: 1, scope: !3786, file: !79, line: 3907, type: !87)
!3788 = !DILocation(line: 3907, column: 31, scope: !3786)
!3789 = !DILocalVariable(name: "factor", arg: 2, scope: !3786, file: !79, line: 3907, type: !22)
!3790 = !DILocation(line: 3907, column: 42, scope: !3786)
!3791 = !DILocation(line: 3909, column: 41, scope: !3786)
!3792 = !DILocation(line: 3909, column: 47, scope: !3786)
!3793 = !DILocation(line: 3909, column: 10, scope: !3786)
!3794 = !DILocation(line: 3909, column: 3, scope: !3786)
!3795 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !79, file: !79, line: 5141, type: !3796, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3796 = !DISubroutineType(types: !3797)
!3797 = !{!87, !87, !22, !743}
!3798 = !DILocalVariable(name: "value", arg: 1, scope: !3795, file: !79, line: 5141, type: !87)
!3799 = !DILocation(line: 5141, column: 40, scope: !3795)
!3800 = !DILocalVariable(name: "factor", arg: 2, scope: !3795, file: !79, line: 5141, type: !22)
!3801 = !DILocation(line: 5141, column: 50, scope: !3795)
!3802 = !DILocalVariable(name: "count", arg: 3, scope: !3795, file: !79, line: 5141, type: !743)
!3803 = !DILocation(line: 5141, column: 62, scope: !3795)
!3804 = !DILocalVariable(name: "u32Temp1", scope: !3795, file: !79, line: 5143, type: !743)
!3805 = !DILocation(line: 5143, column: 6, scope: !3795)
!3806 = !DILocalVariable(name: "u32Temp2", scope: !3795, file: !79, line: 5143, type: !743)
!3807 = !DILocation(line: 5143, column: 17, scope: !3795)
!3808 = !DILocalVariable(name: "u32Temp3", scope: !3795, file: !79, line: 5143, type: !743)
!3809 = !DILocation(line: 5143, column: 26, scope: !3795)
!3810 = !DILocalVariable(name: "u32Temp4", scope: !3795, file: !79, line: 5143, type: !743)
!3811 = !DILocation(line: 5143, column: 35, scope: !3795)
!3812 = !DILocalVariable(name: "u8SignBit", scope: !3795, file: !79, line: 5144, type: !17)
!3813 = !DILocation(line: 5144, column: 5, scope: !3795)
!3814 = !DILocation(line: 5146, column: 7, scope: !3815)
!3815 = distinct !DILexicalBlock(scope: !3795, file: !79, line: 5146, column: 5)
!3816 = !DILocation(line: 5146, column: 12, scope: !3815)
!3817 = !DILocation(line: 5146, column: 16, scope: !3815)
!3818 = !DILocation(line: 5146, column: 20, scope: !3815)
!3819 = !DILocation(line: 5146, column: 26, scope: !3815)
!3820 = !DILocation(line: 5146, column: 31, scope: !3815)
!3821 = !DILocation(line: 5146, column: 36, scope: !3815)
!3822 = !DILocation(line: 5146, column: 41, scope: !3815)
!3823 = !DILocation(line: 5146, column: 45, scope: !3815)
!3824 = !DILocation(line: 5146, column: 49, scope: !3815)
!3825 = !DILocation(line: 5146, column: 55, scope: !3815)
!3826 = !DILocation(line: 5146, column: 5, scope: !3795)
!3827 = !DILocation(line: 5148, column: 13, scope: !3828)
!3828 = distinct !DILexicalBlock(scope: !3815, file: !79, line: 5147, column: 2)
!3829 = !DILocation(line: 5149, column: 2, scope: !3828)
!3830 = !DILocation(line: 5152, column: 13, scope: !3831)
!3831 = distinct !DILexicalBlock(scope: !3815, file: !79, line: 5151, column: 2)
!3832 = !DILocation(line: 5155, column: 5, scope: !3833)
!3833 = distinct !DILexicalBlock(scope: !3795, file: !79, line: 5155, column: 5)
!3834 = !DILocation(line: 5155, column: 10, scope: !3833)
!3835 = !DILocation(line: 5155, column: 5, scope: !3795)
!3836 = !DILocation(line: 5157, column: 15, scope: !3837)
!3837 = distinct !DILexicalBlock(scope: !3833, file: !79, line: 5156, column: 2)
!3838 = !DILocation(line: 5157, column: 14, scope: !3837)
!3839 = !DILocation(line: 5157, column: 12, scope: !3837)
!3840 = !DILocation(line: 5158, column: 2, scope: !3837)
!3841 = !DILocation(line: 5161, column: 14, scope: !3842)
!3842 = distinct !DILexicalBlock(scope: !3833, file: !79, line: 5160, column: 2)
!3843 = !DILocation(line: 5161, column: 12, scope: !3842)
!3844 = !DILocation(line: 5164, column: 5, scope: !3845)
!3845 = distinct !DILexicalBlock(scope: !3795, file: !79, line: 5164, column: 5)
!3846 = !DILocation(line: 5164, column: 11, scope: !3845)
!3847 = !DILocation(line: 5164, column: 5, scope: !3795)
!3848 = !DILocation(line: 5166, column: 15, scope: !3849)
!3849 = distinct !DILexicalBlock(scope: !3845, file: !79, line: 5165, column: 2)
!3850 = !DILocation(line: 5166, column: 14, scope: !3849)
!3851 = !DILocation(line: 5166, column: 12, scope: !3849)
!3852 = !DILocation(line: 5167, column: 2, scope: !3849)
!3853 = !DILocation(line: 5170, column: 14, scope: !3854)
!3854 = distinct !DILexicalBlock(scope: !3845, file: !79, line: 5169, column: 2)
!3855 = !DILocation(line: 5170, column: 12, scope: !3854)
!3856 = !DILocation(line: 5173, column: 13, scope: !3795)
!3857 = !DILocation(line: 5173, column: 24, scope: !3795)
!3858 = !DILocation(line: 5173, column: 22, scope: !3795)
!3859 = !DILocation(line: 5173, column: 11, scope: !3795)
!3860 = !DILocation(line: 5174, column: 25, scope: !3795)
!3861 = !DILocation(line: 5174, column: 35, scope: !3795)
!3862 = !DILocation(line: 5174, column: 13, scope: !3795)
!3863 = !DILocation(line: 5174, column: 11, scope: !3795)
!3864 = !DILocation(line: 5175, column: 13, scope: !3795)
!3865 = !DILocation(line: 5175, column: 25, scope: !3795)
!3866 = !DILocation(line: 5175, column: 22, scope: !3795)
!3867 = !DILocation(line: 5175, column: 11, scope: !3795)
!3868 = !DILocation(line: 5176, column: 14, scope: !3795)
!3869 = !DILocation(line: 5176, column: 30, scope: !3795)
!3870 = !DILocation(line: 5176, column: 29, scope: !3795)
!3871 = !DILocation(line: 5176, column: 23, scope: !3795)
!3872 = !DILocation(line: 5176, column: 11, scope: !3795)
!3873 = !DILocation(line: 5177, column: 6, scope: !3874)
!3874 = distinct !DILexicalBlock(scope: !3795, file: !79, line: 5177, column: 5)
!3875 = !DILocation(line: 5177, column: 16, scope: !3874)
!3876 = !DILocation(line: 5177, column: 14, scope: !3874)
!3877 = !DILocation(line: 5177, column: 22, scope: !3874)
!3878 = !DILocation(line: 5177, column: 5, scope: !3795)
!3879 = !DILocation(line: 5179, column: 6, scope: !3880)
!3880 = distinct !DILexicalBlock(scope: !3881, file: !79, line: 5179, column: 6)
!3881 = distinct !DILexicalBlock(scope: !3874, file: !79, line: 5178, column: 2)
!3882 = !DILocation(line: 5179, column: 16, scope: !3880)
!3883 = !DILocation(line: 5179, column: 6, scope: !3881)
!3884 = !DILocation(line: 5181, column: 7, scope: !3885)
!3885 = distinct !DILexicalBlock(scope: !3886, file: !79, line: 5181, column: 7)
!3886 = distinct !DILexicalBlock(scope: !3880, file: !79, line: 5180, column: 3)
!3887 = !DILocation(line: 5181, column: 15, scope: !3885)
!3888 = !DILocation(line: 5181, column: 7, scope: !3886)
!3889 = !DILocation(line: 5182, column: 12, scope: !3885)
!3890 = !DILocation(line: 5182, column: 5, scope: !3885)
!3891 = !DILocation(line: 5184, column: 5, scope: !3885)
!3892 = !DILocation(line: 5188, column: 7, scope: !3893)
!3893 = distinct !DILexicalBlock(scope: !3894, file: !79, line: 5188, column: 7)
!3894 = distinct !DILexicalBlock(scope: !3880, file: !79, line: 5187, column: 3)
!3895 = !DILocation(line: 5188, column: 15, scope: !3893)
!3896 = !DILocation(line: 5188, column: 7, scope: !3894)
!3897 = !DILocation(line: 5189, column: 13, scope: !3893)
!3898 = !DILocation(line: 5189, column: 12, scope: !3893)
!3899 = !DILocation(line: 5189, column: 5, scope: !3893)
!3900 = !DILocation(line: 5191, column: 5, scope: !3893)
!3901 = !DILocation(line: 5196, column: 3, scope: !3902)
!3902 = distinct !DILexicalBlock(scope: !3874, file: !79, line: 5195, column: 2)
!3903 = !DILocation(line: 5198, column: 1, scope: !3795)
!3904 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !79, file: !79, line: 3931, type: !2348, scopeLine: 3932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3905 = !DILocalVariable(name: "value", arg: 1, scope: !3904, file: !79, line: 3931, type: !87)
!3906 = !DILocation(line: 3931, column: 30, scope: !3904)
!3907 = !DILocalVariable(name: "factor", arg: 2, scope: !3904, file: !79, line: 3931, type: !17)
!3908 = !DILocation(line: 3931, column: 40, scope: !3904)
!3909 = !DILocation(line: 3933, column: 40, scope: !3904)
!3910 = !DILocation(line: 3933, column: 46, scope: !3904)
!3911 = !DILocation(line: 3933, column: 10, scope: !3904)
!3912 = !DILocation(line: 3933, column: 3, scope: !3904)
!3913 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !79, file: !79, line: 5536, type: !3914, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3914 = !DISubroutineType(types: !3915)
!3915 = !{!87, !87, !17, !743}
!3916 = !DILocalVariable(name: "value", arg: 1, scope: !3913, file: !79, line: 5536, type: !87)
!3917 = !DILocation(line: 5536, column: 39, scope: !3913)
!3918 = !DILocalVariable(name: "factor", arg: 2, scope: !3913, file: !79, line: 5536, type: !17)
!3919 = !DILocation(line: 5536, column: 49, scope: !3913)
!3920 = !DILocalVariable(name: "count", arg: 3, scope: !3913, file: !79, line: 5536, type: !743)
!3921 = !DILocation(line: 5536, column: 61, scope: !3913)
!3922 = !DILocalVariable(name: "u32Temp1", scope: !3913, file: !79, line: 5538, type: !743)
!3923 = !DILocation(line: 5538, column: 6, scope: !3913)
!3924 = !DILocalVariable(name: "u32Temp2", scope: !3913, file: !79, line: 5538, type: !743)
!3925 = !DILocation(line: 5538, column: 17, scope: !3913)
!3926 = !DILocalVariable(name: "u32Temp3", scope: !3913, file: !79, line: 5538, type: !743)
!3927 = !DILocation(line: 5538, column: 26, scope: !3913)
!3928 = !DILocalVariable(name: "u8SignBit", scope: !3913, file: !79, line: 5539, type: !17)
!3929 = !DILocation(line: 5539, column: 5, scope: !3913)
!3930 = !DILocation(line: 5541, column: 5, scope: !3931)
!3931 = distinct !DILexicalBlock(scope: !3913, file: !79, line: 5541, column: 5)
!3932 = !DILocation(line: 5541, column: 10, scope: !3931)
!3933 = !DILocation(line: 5541, column: 5, scope: !3913)
!3934 = !DILocation(line: 5543, column: 13, scope: !3935)
!3935 = distinct !DILexicalBlock(scope: !3931, file: !79, line: 5542, column: 2)
!3936 = !DILocation(line: 5544, column: 15, scope: !3935)
!3937 = !DILocation(line: 5544, column: 14, scope: !3935)
!3938 = !DILocation(line: 5544, column: 12, scope: !3935)
!3939 = !DILocation(line: 5545, column: 2, scope: !3935)
!3940 = !DILocation(line: 5548, column: 13, scope: !3941)
!3941 = distinct !DILexicalBlock(scope: !3931, file: !79, line: 5547, column: 2)
!3942 = !DILocation(line: 5549, column: 14, scope: !3941)
!3943 = !DILocation(line: 5549, column: 12, scope: !3941)
!3944 = !DILocation(line: 5552, column: 13, scope: !3913)
!3945 = !DILocation(line: 5552, column: 24, scope: !3913)
!3946 = !DILocation(line: 5552, column: 22, scope: !3913)
!3947 = !DILocation(line: 5552, column: 11, scope: !3913)
!3948 = !DILocation(line: 5553, column: 25, scope: !3913)
!3949 = !DILocation(line: 5553, column: 34, scope: !3913)
!3950 = !DILocation(line: 5553, column: 13, scope: !3913)
!3951 = !DILocation(line: 5553, column: 11, scope: !3913)
!3952 = !DILocation(line: 5554, column: 13, scope: !3913)
!3953 = !DILocation(line: 5554, column: 25, scope: !3913)
!3954 = !DILocation(line: 5554, column: 22, scope: !3913)
!3955 = !DILocation(line: 5554, column: 11, scope: !3913)
!3956 = !DILocation(line: 5555, column: 14, scope: !3913)
!3957 = !DILocation(line: 5555, column: 30, scope: !3913)
!3958 = !DILocation(line: 5555, column: 29, scope: !3913)
!3959 = !DILocation(line: 5555, column: 23, scope: !3913)
!3960 = !DILocation(line: 5555, column: 11, scope: !3913)
!3961 = !DILocation(line: 5556, column: 6, scope: !3962)
!3962 = distinct !DILexicalBlock(scope: !3913, file: !79, line: 5556, column: 5)
!3963 = !DILocation(line: 5556, column: 16, scope: !3962)
!3964 = !DILocation(line: 5556, column: 14, scope: !3962)
!3965 = !DILocation(line: 5556, column: 22, scope: !3962)
!3966 = !DILocation(line: 5556, column: 5, scope: !3913)
!3967 = !DILocation(line: 5558, column: 6, scope: !3968)
!3968 = distinct !DILexicalBlock(scope: !3969, file: !79, line: 5558, column: 6)
!3969 = distinct !DILexicalBlock(scope: !3962, file: !79, line: 5557, column: 2)
!3970 = !DILocation(line: 5558, column: 16, scope: !3968)
!3971 = !DILocation(line: 5558, column: 6, scope: !3969)
!3972 = !DILocation(line: 5560, column: 7, scope: !3973)
!3973 = distinct !DILexicalBlock(scope: !3974, file: !79, line: 5560, column: 7)
!3974 = distinct !DILexicalBlock(scope: !3968, file: !79, line: 5559, column: 3)
!3975 = !DILocation(line: 5560, column: 15, scope: !3973)
!3976 = !DILocation(line: 5560, column: 7, scope: !3974)
!3977 = !DILocation(line: 5561, column: 12, scope: !3973)
!3978 = !DILocation(line: 5561, column: 5, scope: !3973)
!3979 = !DILocation(line: 5563, column: 5, scope: !3973)
!3980 = !DILocation(line: 5567, column: 7, scope: !3981)
!3981 = distinct !DILexicalBlock(scope: !3982, file: !79, line: 5567, column: 7)
!3982 = distinct !DILexicalBlock(scope: !3968, file: !79, line: 5566, column: 3)
!3983 = !DILocation(line: 5567, column: 15, scope: !3981)
!3984 = !DILocation(line: 5567, column: 7, scope: !3982)
!3985 = !DILocation(line: 5569, column: 13, scope: !3986)
!3986 = distinct !DILexicalBlock(scope: !3981, file: !79, line: 5568, column: 4)
!3987 = !DILocation(line: 5569, column: 12, scope: !3986)
!3988 = !DILocation(line: 5569, column: 5, scope: !3986)
!3989 = !DILocation(line: 5573, column: 5, scope: !3990)
!3990 = distinct !DILexicalBlock(scope: !3981, file: !79, line: 5572, column: 4)
!3991 = !DILocation(line: 5579, column: 6, scope: !3992)
!3992 = distinct !DILexicalBlock(scope: !3993, file: !79, line: 5579, column: 6)
!3993 = distinct !DILexicalBlock(scope: !3962, file: !79, line: 5578, column: 2)
!3994 = !DILocation(line: 5579, column: 16, scope: !3992)
!3995 = !DILocation(line: 5579, column: 6, scope: !3993)
!3996 = !DILocation(line: 5581, column: 4, scope: !3997)
!3997 = distinct !DILexicalBlock(scope: !3992, file: !79, line: 5580, column: 3)
!3998 = !DILocation(line: 5585, column: 4, scope: !3999)
!3999 = distinct !DILexicalBlock(scope: !3992, file: !79, line: 5584, column: 3)
!4000 = !DILocation(line: 5588, column: 1, scope: !3913)
!4001 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !79, file: !79, line: 3955, type: !166, scopeLine: 3956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4002 = !DILocalVariable(name: "value", arg: 1, scope: !4001, file: !79, line: 3955, type: !6)
!4003 = !DILocation(line: 3955, column: 28, scope: !4001)
!4004 = !DILocalVariable(name: "factor", arg: 2, scope: !4001, file: !79, line: 3955, type: !17)
!4005 = !DILocation(line: 3955, column: 38, scope: !4001)
!4006 = !DILocation(line: 3957, column: 38, scope: !4001)
!4007 = !DILocation(line: 3957, column: 56, scope: !4001)
!4008 = !DILocation(line: 3957, column: 50, scope: !4001)
!4009 = !DILocation(line: 3957, column: 64, scope: !4001)
!4010 = !DILocation(line: 3957, column: 44, scope: !4001)
!4011 = !DILocation(line: 3957, column: 10, scope: !4001)
!4012 = !DILocation(line: 3957, column: 3, scope: !4001)
!4013 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !79, file: !79, line: 3979, type: !166, scopeLine: 3980, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4014 = !DILocalVariable(name: "value", arg: 1, scope: !4013, file: !79, line: 3979, type: !6)
!4015 = !DILocation(line: 3979, column: 27, scope: !4013)
!4016 = !DILocalVariable(name: "factor", arg: 2, scope: !4013, file: !79, line: 3979, type: !17)
!4017 = !DILocation(line: 3979, column: 37, scope: !4013)
!4018 = !DILocation(line: 3981, column: 38, scope: !4013)
!4019 = !DILocation(line: 3981, column: 56, scope: !4013)
!4020 = !DILocation(line: 3981, column: 50, scope: !4013)
!4021 = !DILocation(line: 3981, column: 64, scope: !4013)
!4022 = !DILocation(line: 3981, column: 44, scope: !4013)
!4023 = !DILocation(line: 3981, column: 10, scope: !4013)
!4024 = !DILocation(line: 3981, column: 3, scope: !4013)
!4025 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !79, file: !79, line: 4004, type: !166, scopeLine: 4005, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4026 = !DILocalVariable(name: "value", arg: 1, scope: !4025, file: !79, line: 4004, type: !6)
!4027 = !DILocation(line: 4004, column: 26, scope: !4025)
!4028 = !DILocalVariable(name: "factor", arg: 2, scope: !4025, file: !79, line: 4004, type: !17)
!4029 = !DILocation(line: 4004, column: 36, scope: !4025)
!4030 = !DILocation(line: 4006, column: 38, scope: !4025)
!4031 = !DILocation(line: 4006, column: 56, scope: !4025)
!4032 = !DILocation(line: 4006, column: 50, scope: !4025)
!4033 = !DILocation(line: 4006, column: 64, scope: !4025)
!4034 = !DILocation(line: 4006, column: 44, scope: !4025)
!4035 = !DILocation(line: 4006, column: 10, scope: !4025)
!4036 = !DILocation(line: 4006, column: 3, scope: !4025)
!4037 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !79, file: !79, line: 4029, type: !166, scopeLine: 4030, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4038 = !DILocalVariable(name: "value", arg: 1, scope: !4037, file: !79, line: 4029, type: !6)
!4039 = !DILocation(line: 4029, column: 27, scope: !4037)
!4040 = !DILocalVariable(name: "factor", arg: 2, scope: !4037, file: !79, line: 4029, type: !17)
!4041 = !DILocation(line: 4029, column: 37, scope: !4037)
!4042 = !DILocation(line: 4031, column: 41, scope: !4037)
!4043 = !DILocation(line: 4031, column: 59, scope: !4037)
!4044 = !DILocation(line: 4031, column: 53, scope: !4037)
!4045 = !DILocation(line: 4031, column: 67, scope: !4037)
!4046 = !DILocation(line: 4031, column: 47, scope: !4037)
!4047 = !DILocation(line: 4031, column: 10, scope: !4037)
!4048 = !DILocation(line: 4031, column: 3, scope: !4037)
!4049 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !79, file: !79, line: 4054, type: !166, scopeLine: 4055, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4050 = !DILocalVariable(name: "value", arg: 1, scope: !4049, file: !79, line: 4054, type: !6)
!4051 = !DILocation(line: 4054, column: 26, scope: !4049)
!4052 = !DILocalVariable(name: "factor", arg: 2, scope: !4049, file: !79, line: 4054, type: !17)
!4053 = !DILocation(line: 4054, column: 36, scope: !4049)
!4054 = !DILocation(line: 4056, column: 41, scope: !4049)
!4055 = !DILocation(line: 4056, column: 59, scope: !4049)
!4056 = !DILocation(line: 4056, column: 53, scope: !4049)
!4057 = !DILocation(line: 4056, column: 67, scope: !4049)
!4058 = !DILocation(line: 4056, column: 47, scope: !4049)
!4059 = !DILocation(line: 4056, column: 10, scope: !4049)
!4060 = !DILocation(line: 4056, column: 3, scope: !4049)
!4061 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !79, file: !79, line: 4078, type: !166, scopeLine: 4079, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4062 = !DILocalVariable(name: "value", arg: 1, scope: !4061, file: !79, line: 4078, type: !6)
!4063 = !DILocation(line: 4078, column: 26, scope: !4061)
!4064 = !DILocalVariable(name: "factor", arg: 2, scope: !4061, file: !79, line: 4078, type: !17)
!4065 = !DILocation(line: 4078, column: 36, scope: !4061)
!4066 = !DILocation(line: 4080, column: 41, scope: !4061)
!4067 = !DILocation(line: 4080, column: 59, scope: !4061)
!4068 = !DILocation(line: 4080, column: 53, scope: !4061)
!4069 = !DILocation(line: 4080, column: 67, scope: !4061)
!4070 = !DILocation(line: 4080, column: 47, scope: !4061)
!4071 = !DILocation(line: 4080, column: 10, scope: !4061)
!4072 = !DILocation(line: 4080, column: 3, scope: !4061)
!4073 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !79, file: !79, line: 4102, type: !166, scopeLine: 4103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4074 = !DILocalVariable(name: "value", arg: 1, scope: !4073, file: !79, line: 4102, type: !6)
!4075 = !DILocation(line: 4102, column: 25, scope: !4073)
!4076 = !DILocalVariable(name: "factor", arg: 2, scope: !4073, file: !79, line: 4102, type: !17)
!4077 = !DILocation(line: 4102, column: 35, scope: !4073)
!4078 = !DILocation(line: 4104, column: 41, scope: !4073)
!4079 = !DILocation(line: 4104, column: 59, scope: !4073)
!4080 = !DILocation(line: 4104, column: 53, scope: !4073)
!4081 = !DILocation(line: 4104, column: 67, scope: !4073)
!4082 = !DILocation(line: 4104, column: 47, scope: !4073)
!4083 = !DILocation(line: 4104, column: 10, scope: !4073)
!4084 = !DILocation(line: 4104, column: 3, scope: !4073)
!4085 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !79, file: !79, line: 4126, type: !166, scopeLine: 4127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4086 = !DILocalVariable(name: "value", arg: 1, scope: !4085, file: !79, line: 4126, type: !6)
!4087 = !DILocation(line: 4126, column: 26, scope: !4085)
!4088 = !DILocalVariable(name: "factor", arg: 2, scope: !4085, file: !79, line: 4126, type: !17)
!4089 = !DILocation(line: 4126, column: 36, scope: !4085)
!4090 = !DILocation(line: 4128, column: 41, scope: !4085)
!4091 = !DILocation(line: 4128, column: 59, scope: !4085)
!4092 = !DILocation(line: 4128, column: 53, scope: !4085)
!4093 = !DILocation(line: 4128, column: 67, scope: !4085)
!4094 = !DILocation(line: 4128, column: 47, scope: !4085)
!4095 = !DILocation(line: 4128, column: 10, scope: !4085)
!4096 = !DILocation(line: 4128, column: 3, scope: !4085)
!4097 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !79, file: !79, line: 4150, type: !166, scopeLine: 4151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4098 = !DILocalVariable(name: "value", arg: 1, scope: !4097, file: !79, line: 4150, type: !6)
!4099 = !DILocation(line: 4150, column: 25, scope: !4097)
!4100 = !DILocalVariable(name: "factor", arg: 2, scope: !4097, file: !79, line: 4150, type: !17)
!4101 = !DILocation(line: 4150, column: 35, scope: !4097)
!4102 = !DILocation(line: 4152, column: 41, scope: !4097)
!4103 = !DILocation(line: 4152, column: 59, scope: !4097)
!4104 = !DILocation(line: 4152, column: 53, scope: !4097)
!4105 = !DILocation(line: 4152, column: 67, scope: !4097)
!4106 = !DILocation(line: 4152, column: 47, scope: !4097)
!4107 = !DILocation(line: 4152, column: 10, scope: !4097)
!4108 = !DILocation(line: 4152, column: 3, scope: !4097)
!4109 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !79, file: !79, line: 4173, type: !933, scopeLine: 4174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4110 = !DILocalVariable(name: "value", arg: 1, scope: !4109, file: !79, line: 4173, type: !22)
!4111 = !DILocation(line: 4173, column: 33, scope: !4109)
!4112 = !DILocalVariable(name: "factor", arg: 2, scope: !4109, file: !79, line: 4173, type: !22)
!4113 = !DILocation(line: 4173, column: 44, scope: !4109)
!4114 = !DILocation(line: 4175, column: 41, scope: !4109)
!4115 = !DILocation(line: 4175, column: 47, scope: !4109)
!4116 = !DILocation(line: 4175, column: 10, scope: !4109)
!4117 = !DILocation(line: 4175, column: 3, scope: !4109)
!4118 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !79, file: !79, line: 4196, type: !933, scopeLine: 4197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4119 = !DILocalVariable(name: "value", arg: 1, scope: !4118, file: !79, line: 4196, type: !22)
!4120 = !DILocation(line: 4196, column: 32, scope: !4118)
!4121 = !DILocalVariable(name: "factor", arg: 2, scope: !4118, file: !79, line: 4196, type: !22)
!4122 = !DILocation(line: 4196, column: 43, scope: !4118)
!4123 = !DILocation(line: 4198, column: 41, scope: !4118)
!4124 = !DILocation(line: 4198, column: 47, scope: !4118)
!4125 = !DILocation(line: 4198, column: 10, scope: !4118)
!4126 = !DILocation(line: 4198, column: 3, scope: !4118)
!4127 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !79, file: !79, line: 4220, type: !933, scopeLine: 4221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4128 = !DILocalVariable(name: "value", arg: 1, scope: !4127, file: !79, line: 4220, type: !22)
!4129 = !DILocation(line: 4220, column: 31, scope: !4127)
!4130 = !DILocalVariable(name: "factor", arg: 2, scope: !4127, file: !79, line: 4220, type: !22)
!4131 = !DILocation(line: 4220, column: 42, scope: !4127)
!4132 = !DILocation(line: 4222, column: 41, scope: !4127)
!4133 = !DILocation(line: 4222, column: 47, scope: !4127)
!4134 = !DILocation(line: 4222, column: 10, scope: !4127)
!4135 = !DILocation(line: 4222, column: 3, scope: !4127)
!4136 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !79, file: !79, line: 4244, type: !933, scopeLine: 4245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4137 = !DILocalVariable(name: "value", arg: 1, scope: !4136, file: !79, line: 4244, type: !22)
!4138 = !DILocation(line: 4244, column: 34, scope: !4136)
!4139 = !DILocalVariable(name: "factor", arg: 2, scope: !4136, file: !79, line: 4244, type: !22)
!4140 = !DILocation(line: 4244, column: 45, scope: !4136)
!4141 = !DILocation(line: 4246, column: 44, scope: !4136)
!4142 = !DILocation(line: 4246, column: 50, scope: !4136)
!4143 = !DILocation(line: 4246, column: 10, scope: !4136)
!4144 = !DILocation(line: 4246, column: 3, scope: !4136)
!4145 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !79, file: !79, line: 4268, type: !933, scopeLine: 4269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4146 = !DILocalVariable(name: "value", arg: 1, scope: !4145, file: !79, line: 4268, type: !22)
!4147 = !DILocation(line: 4268, column: 32, scope: !4145)
!4148 = !DILocalVariable(name: "factor", arg: 2, scope: !4145, file: !79, line: 4268, type: !22)
!4149 = !DILocation(line: 4268, column: 43, scope: !4145)
!4150 = !DILocation(line: 4270, column: 44, scope: !4145)
!4151 = !DILocation(line: 4270, column: 50, scope: !4145)
!4152 = !DILocation(line: 4270, column: 10, scope: !4145)
!4153 = !DILocation(line: 4270, column: 3, scope: !4145)
!4154 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !79, file: !79, line: 4292, type: !933, scopeLine: 4293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4155 = !DILocalVariable(name: "value", arg: 1, scope: !4154, file: !79, line: 4292, type: !22)
!4156 = !DILocation(line: 4292, column: 31, scope: !4154)
!4157 = !DILocalVariable(name: "factor", arg: 2, scope: !4154, file: !79, line: 4292, type: !22)
!4158 = !DILocation(line: 4292, column: 42, scope: !4154)
!4159 = !DILocation(line: 4294, column: 44, scope: !4154)
!4160 = !DILocation(line: 4294, column: 50, scope: !4154)
!4161 = !DILocation(line: 4294, column: 10, scope: !4154)
!4162 = !DILocation(line: 4294, column: 3, scope: !4154)
!4163 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !79, file: !79, line: 4316, type: !933, scopeLine: 4317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4164 = !DILocalVariable(name: "value", arg: 1, scope: !4163, file: !79, line: 4316, type: !22)
!4165 = !DILocation(line: 4316, column: 33, scope: !4163)
!4166 = !DILocalVariable(name: "factor", arg: 2, scope: !4163, file: !79, line: 4316, type: !22)
!4167 = !DILocation(line: 4316, column: 44, scope: !4163)
!4168 = !DILocation(line: 4318, column: 44, scope: !4163)
!4169 = !DILocation(line: 4318, column: 50, scope: !4163)
!4170 = !DILocation(line: 4318, column: 10, scope: !4163)
!4171 = !DILocation(line: 4318, column: 3, scope: !4163)
!4172 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !79, file: !79, line: 4340, type: !933, scopeLine: 4341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4173 = !DILocalVariable(name: "value", arg: 1, scope: !4172, file: !79, line: 4340, type: !22)
!4174 = !DILocation(line: 4340, column: 32, scope: !4172)
!4175 = !DILocalVariable(name: "factor", arg: 2, scope: !4172, file: !79, line: 4340, type: !22)
!4176 = !DILocation(line: 4340, column: 43, scope: !4172)
!4177 = !DILocation(line: 4342, column: 44, scope: !4172)
!4178 = !DILocation(line: 4342, column: 50, scope: !4172)
!4179 = !DILocation(line: 4342, column: 10, scope: !4172)
!4180 = !DILocation(line: 4342, column: 3, scope: !4172)
!4181 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !79, file: !79, line: 4363, type: !933, scopeLine: 4364, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4182 = !DILocalVariable(name: "value", arg: 1, scope: !4181, file: !79, line: 4363, type: !22)
!4183 = !DILocation(line: 4363, column: 31, scope: !4181)
!4184 = !DILocalVariable(name: "factor", arg: 2, scope: !4181, file: !79, line: 4363, type: !22)
!4185 = !DILocation(line: 4363, column: 42, scope: !4181)
!4186 = !DILocation(line: 4365, column: 44, scope: !4181)
!4187 = !DILocation(line: 4365, column: 50, scope: !4181)
!4188 = !DILocation(line: 4365, column: 10, scope: !4181)
!4189 = !DILocation(line: 4365, column: 3, scope: !4181)
!4190 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !79, file: !79, line: 4386, type: !933, scopeLine: 4387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4191 = !DILocalVariable(name: "value", arg: 1, scope: !4190, file: !79, line: 4386, type: !22)
!4192 = !DILocation(line: 4386, column: 30, scope: !4190)
!4193 = !DILocalVariable(name: "factor", arg: 2, scope: !4190, file: !79, line: 4386, type: !22)
!4194 = !DILocation(line: 4386, column: 41, scope: !4190)
!4195 = !DILocation(line: 4388, column: 44, scope: !4190)
!4196 = !DILocation(line: 4388, column: 50, scope: !4190)
!4197 = !DILocation(line: 4388, column: 10, scope: !4190)
!4198 = !DILocation(line: 4388, column: 3, scope: !4190)
!4199 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !79, file: !79, line: 4409, type: !933, scopeLine: 4410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4200 = !DILocalVariable(name: "value", arg: 1, scope: !4199, file: !79, line: 4409, type: !22)
!4201 = !DILocation(line: 4409, column: 33, scope: !4199)
!4202 = !DILocalVariable(name: "factor", arg: 2, scope: !4199, file: !79, line: 4409, type: !22)
!4203 = !DILocation(line: 4409, column: 44, scope: !4199)
!4204 = !DILocation(line: 4411, column: 44, scope: !4199)
!4205 = !DILocation(line: 4411, column: 50, scope: !4199)
!4206 = !DILocation(line: 4411, column: 10, scope: !4199)
!4207 = !DILocation(line: 4411, column: 3, scope: !4199)
!4208 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !79, file: !79, line: 4432, type: !933, scopeLine: 4433, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4209 = !DILocalVariable(name: "value", arg: 1, scope: !4208, file: !79, line: 4432, type: !22)
!4210 = !DILocation(line: 4432, column: 32, scope: !4208)
!4211 = !DILocalVariable(name: "factor", arg: 2, scope: !4208, file: !79, line: 4432, type: !22)
!4212 = !DILocation(line: 4432, column: 43, scope: !4208)
!4213 = !DILocation(line: 4434, column: 44, scope: !4208)
!4214 = !DILocation(line: 4434, column: 50, scope: !4208)
!4215 = !DILocation(line: 4434, column: 10, scope: !4208)
!4216 = !DILocation(line: 4434, column: 3, scope: !4208)
!4217 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !79, file: !79, line: 4455, type: !933, scopeLine: 4456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4218 = !DILocalVariable(name: "value", arg: 1, scope: !4217, file: !79, line: 4455, type: !22)
!4219 = !DILocation(line: 4455, column: 31, scope: !4217)
!4220 = !DILocalVariable(name: "factor", arg: 2, scope: !4217, file: !79, line: 4455, type: !22)
!4221 = !DILocation(line: 4455, column: 42, scope: !4217)
!4222 = !DILocation(line: 4457, column: 44, scope: !4217)
!4223 = !DILocation(line: 4457, column: 50, scope: !4217)
!4224 = !DILocation(line: 4457, column: 10, scope: !4217)
!4225 = !DILocation(line: 4457, column: 3, scope: !4217)
!4226 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !79, file: !79, line: 4478, type: !933, scopeLine: 4479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4227 = !DILocalVariable(name: "value", arg: 1, scope: !4226, file: !79, line: 4478, type: !22)
!4228 = !DILocation(line: 4478, column: 30, scope: !4226)
!4229 = !DILocalVariable(name: "factor", arg: 2, scope: !4226, file: !79, line: 4478, type: !22)
!4230 = !DILocation(line: 4478, column: 41, scope: !4226)
!4231 = !DILocation(line: 4480, column: 44, scope: !4226)
!4232 = !DILocation(line: 4480, column: 50, scope: !4226)
!4233 = !DILocation(line: 4480, column: 10, scope: !4226)
!4234 = !DILocation(line: 4480, column: 3, scope: !4226)
!4235 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !79, file: !79, line: 4500, type: !978, scopeLine: 4501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4236 = !DILocalVariable(name: "x_value", arg: 1, scope: !4235, file: !79, line: 4500, type: !22)
!4237 = !DILocation(line: 4500, column: 32, scope: !4235)
!4238 = !DILocalVariable(name: "y_value", arg: 2, scope: !4235, file: !79, line: 4500, type: !17)
!4239 = !DILocation(line: 4500, column: 44, scope: !4235)
!4240 = !DILocation(line: 4502, column: 40, scope: !4235)
!4241 = !DILocation(line: 4502, column: 60, scope: !4235)
!4242 = !DILocation(line: 4502, column: 54, scope: !4235)
!4243 = !DILocation(line: 4502, column: 69, scope: !4235)
!4244 = !DILocation(line: 4502, column: 48, scope: !4235)
!4245 = !DILocation(line: 4502, column: 10, scope: !4235)
!4246 = !DILocation(line: 4502, column: 3, scope: !4235)
!4247 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !79, file: !79, line: 4522, type: !978, scopeLine: 4523, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4248 = !DILocalVariable(name: "x_value", arg: 1, scope: !4247, file: !79, line: 4522, type: !22)
!4249 = !DILocation(line: 4522, column: 31, scope: !4247)
!4250 = !DILocalVariable(name: "y_value", arg: 2, scope: !4247, file: !79, line: 4522, type: !17)
!4251 = !DILocation(line: 4522, column: 43, scope: !4247)
!4252 = !DILocation(line: 4524, column: 40, scope: !4247)
!4253 = !DILocation(line: 4524, column: 60, scope: !4247)
!4254 = !DILocation(line: 4524, column: 54, scope: !4247)
!4255 = !DILocation(line: 4524, column: 69, scope: !4247)
!4256 = !DILocation(line: 4524, column: 48, scope: !4247)
!4257 = !DILocation(line: 4524, column: 10, scope: !4247)
!4258 = !DILocation(line: 4524, column: 3, scope: !4247)
!4259 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !79, file: !79, line: 4545, type: !978, scopeLine: 4546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4260 = !DILocalVariable(name: "x_value", arg: 1, scope: !4259, file: !79, line: 4545, type: !22)
!4261 = !DILocation(line: 4545, column: 30, scope: !4259)
!4262 = !DILocalVariable(name: "y_value", arg: 2, scope: !4259, file: !79, line: 4545, type: !17)
!4263 = !DILocation(line: 4545, column: 42, scope: !4259)
!4264 = !DILocation(line: 4547, column: 40, scope: !4259)
!4265 = !DILocation(line: 4547, column: 60, scope: !4259)
!4266 = !DILocation(line: 4547, column: 54, scope: !4259)
!4267 = !DILocation(line: 4547, column: 69, scope: !4259)
!4268 = !DILocation(line: 4547, column: 48, scope: !4259)
!4269 = !DILocation(line: 4547, column: 10, scope: !4259)
!4270 = !DILocation(line: 4547, column: 3, scope: !4259)
!4271 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !79, file: !79, line: 4568, type: !978, scopeLine: 4569, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4272 = !DILocalVariable(name: "x_value", arg: 1, scope: !4271, file: !79, line: 4568, type: !22)
!4273 = !DILocation(line: 4568, column: 31, scope: !4271)
!4274 = !DILocalVariable(name: "y_value", arg: 2, scope: !4271, file: !79, line: 4568, type: !17)
!4275 = !DILocation(line: 4568, column: 43, scope: !4271)
!4276 = !DILocation(line: 4570, column: 44, scope: !4271)
!4277 = !DILocation(line: 4570, column: 64, scope: !4271)
!4278 = !DILocation(line: 4570, column: 58, scope: !4271)
!4279 = !DILocation(line: 4570, column: 73, scope: !4271)
!4280 = !DILocation(line: 4570, column: 52, scope: !4271)
!4281 = !DILocation(line: 4570, column: 10, scope: !4271)
!4282 = !DILocation(line: 4570, column: 3, scope: !4271)
!4283 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !79, file: !79, line: 4591, type: !978, scopeLine: 4592, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4284 = !DILocalVariable(name: "x_value", arg: 1, scope: !4283, file: !79, line: 4591, type: !22)
!4285 = !DILocation(line: 4591, column: 30, scope: !4283)
!4286 = !DILocalVariable(name: "y_value", arg: 2, scope: !4283, file: !79, line: 4591, type: !17)
!4287 = !DILocation(line: 4591, column: 42, scope: !4283)
!4288 = !DILocation(line: 4593, column: 44, scope: !4283)
!4289 = !DILocation(line: 4593, column: 64, scope: !4283)
!4290 = !DILocation(line: 4593, column: 58, scope: !4283)
!4291 = !DILocation(line: 4593, column: 73, scope: !4283)
!4292 = !DILocation(line: 4593, column: 52, scope: !4283)
!4293 = !DILocation(line: 4593, column: 10, scope: !4283)
!4294 = !DILocation(line: 4593, column: 3, scope: !4283)
!4295 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !79, file: !79, line: 4613, type: !978, scopeLine: 4614, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4296 = !DILocalVariable(name: "x_value", arg: 1, scope: !4295, file: !79, line: 4613, type: !22)
!4297 = !DILocation(line: 4613, column: 30, scope: !4295)
!4298 = !DILocalVariable(name: "y_value", arg: 2, scope: !4295, file: !79, line: 4613, type: !17)
!4299 = !DILocation(line: 4613, column: 42, scope: !4295)
!4300 = !DILocation(line: 4615, column: 44, scope: !4295)
!4301 = !DILocation(line: 4615, column: 64, scope: !4295)
!4302 = !DILocation(line: 4615, column: 58, scope: !4295)
!4303 = !DILocation(line: 4615, column: 73, scope: !4295)
!4304 = !DILocation(line: 4615, column: 52, scope: !4295)
!4305 = !DILocation(line: 4615, column: 10, scope: !4295)
!4306 = !DILocation(line: 4615, column: 3, scope: !4295)
!4307 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !79, file: !79, line: 4635, type: !978, scopeLine: 4636, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4308 = !DILocalVariable(name: "x_value", arg: 1, scope: !4307, file: !79, line: 4635, type: !22)
!4309 = !DILocation(line: 4635, column: 29, scope: !4307)
!4310 = !DILocalVariable(name: "y_value", arg: 2, scope: !4307, file: !79, line: 4635, type: !17)
!4311 = !DILocation(line: 4635, column: 41, scope: !4307)
!4312 = !DILocation(line: 4637, column: 44, scope: !4307)
!4313 = !DILocation(line: 4637, column: 64, scope: !4307)
!4314 = !DILocation(line: 4637, column: 58, scope: !4307)
!4315 = !DILocation(line: 4637, column: 73, scope: !4307)
!4316 = !DILocation(line: 4637, column: 52, scope: !4307)
!4317 = !DILocation(line: 4637, column: 10, scope: !4307)
!4318 = !DILocation(line: 4637, column: 3, scope: !4307)
!4319 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !79, file: !79, line: 4657, type: !978, scopeLine: 4658, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4320 = !DILocalVariable(name: "x_value", arg: 1, scope: !4319, file: !79, line: 4657, type: !22)
!4321 = !DILocation(line: 4657, column: 30, scope: !4319)
!4322 = !DILocalVariable(name: "y_value", arg: 2, scope: !4319, file: !79, line: 4657, type: !17)
!4323 = !DILocation(line: 4657, column: 42, scope: !4319)
!4324 = !DILocation(line: 4659, column: 44, scope: !4319)
!4325 = !DILocation(line: 4659, column: 64, scope: !4319)
!4326 = !DILocation(line: 4659, column: 58, scope: !4319)
!4327 = !DILocation(line: 4659, column: 73, scope: !4319)
!4328 = !DILocation(line: 4659, column: 52, scope: !4319)
!4329 = !DILocation(line: 4659, column: 10, scope: !4319)
!4330 = !DILocation(line: 4659, column: 3, scope: !4319)
!4331 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !79, file: !79, line: 4679, type: !978, scopeLine: 4680, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4332 = !DILocalVariable(name: "x_value", arg: 1, scope: !4331, file: !79, line: 4679, type: !22)
!4333 = !DILocation(line: 4679, column: 29, scope: !4331)
!4334 = !DILocalVariable(name: "y_value", arg: 2, scope: !4331, file: !79, line: 4679, type: !17)
!4335 = !DILocation(line: 4679, column: 41, scope: !4331)
!4336 = !DILocation(line: 4681, column: 44, scope: !4331)
!4337 = !DILocation(line: 4681, column: 64, scope: !4331)
!4338 = !DILocation(line: 4681, column: 58, scope: !4331)
!4339 = !DILocation(line: 4681, column: 73, scope: !4331)
!4340 = !DILocation(line: 4681, column: 52, scope: !4331)
!4341 = !DILocation(line: 4681, column: 10, scope: !4331)
!4342 = !DILocation(line: 4681, column: 3, scope: !4331)
!4343 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !79, file: !79, line: 4703, type: !1507, scopeLine: 4704, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4344 = !DILocalVariable(name: "value", arg: 1, scope: !4343, file: !79, line: 4703, type: !743)
!4345 = !DILocation(line: 4703, column: 31, scope: !4343)
!4346 = !DILocalVariable(name: "factor", arg: 2, scope: !4343, file: !79, line: 4703, type: !13)
!4347 = !DILocation(line: 4703, column: 42, scope: !4343)
!4348 = !DILocation(line: 4705, column: 41, scope: !4343)
!4349 = !DILocation(line: 4705, column: 47, scope: !4343)
!4350 = !DILocation(line: 4705, column: 10, scope: !4343)
!4351 = !DILocation(line: 4705, column: 3, scope: !4343)
!4352 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !79, file: !79, line: 5293, type: !4353, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4353 = !DISubroutineType(types: !4354)
!4354 = !{!743, !743, !13, !743}
!4355 = !DILocalVariable(name: "value", arg: 1, scope: !4352, file: !79, line: 5293, type: !743)
!4356 = !DILocation(line: 5293, column: 40, scope: !4352)
!4357 = !DILocalVariable(name: "factor", arg: 2, scope: !4352, file: !79, line: 5293, type: !13)
!4358 = !DILocation(line: 5293, column: 50, scope: !4352)
!4359 = !DILocalVariable(name: "count", arg: 3, scope: !4352, file: !79, line: 5293, type: !743)
!4360 = !DILocation(line: 5293, column: 62, scope: !4352)
!4361 = !DILocalVariable(name: "u32Temp1", scope: !4352, file: !79, line: 5295, type: !743)
!4362 = !DILocation(line: 5295, column: 6, scope: !4352)
!4363 = !DILocalVariable(name: "u32Temp2", scope: !4352, file: !79, line: 5295, type: !743)
!4364 = !DILocation(line: 5295, column: 17, scope: !4352)
!4365 = !DILocalVariable(name: "u32Temp3", scope: !4352, file: !79, line: 5295, type: !743)
!4366 = !DILocation(line: 5295, column: 26, scope: !4352)
!4367 = !DILocalVariable(name: "u8SignBit", scope: !4352, file: !79, line: 5296, type: !17)
!4368 = !DILocation(line: 5296, column: 5, scope: !4352)
!4369 = !DILocation(line: 5298, column: 5, scope: !4370)
!4370 = distinct !DILexicalBlock(scope: !4352, file: !79, line: 5298, column: 5)
!4371 = !DILocation(line: 5298, column: 11, scope: !4370)
!4372 = !DILocation(line: 5298, column: 5, scope: !4352)
!4373 = !DILocation(line: 5300, column: 13, scope: !4374)
!4374 = distinct !DILexicalBlock(scope: !4370, file: !79, line: 5299, column: 2)
!4375 = !DILocation(line: 5301, column: 2, scope: !4374)
!4376 = !DILocation(line: 5304, column: 13, scope: !4377)
!4377 = distinct !DILexicalBlock(scope: !4370, file: !79, line: 5303, column: 2)
!4378 = !DILocation(line: 5308, column: 5, scope: !4379)
!4379 = distinct !DILexicalBlock(scope: !4352, file: !79, line: 5308, column: 5)
!4380 = !DILocation(line: 5308, column: 11, scope: !4379)
!4381 = !DILocation(line: 5308, column: 5, scope: !4352)
!4382 = !DILocation(line: 5310, column: 15, scope: !4383)
!4383 = distinct !DILexicalBlock(scope: !4379, file: !79, line: 5309, column: 2)
!4384 = !DILocation(line: 5310, column: 14, scope: !4383)
!4385 = !DILocation(line: 5310, column: 12, scope: !4383)
!4386 = !DILocation(line: 5311, column: 2, scope: !4383)
!4387 = !DILocation(line: 5314, column: 14, scope: !4388)
!4388 = distinct !DILexicalBlock(scope: !4379, file: !79, line: 5313, column: 2)
!4389 = !DILocation(line: 5314, column: 12, scope: !4388)
!4390 = !DILocation(line: 5317, column: 13, scope: !4352)
!4391 = !DILocation(line: 5317, column: 21, scope: !4352)
!4392 = !DILocation(line: 5317, column: 19, scope: !4352)
!4393 = !DILocation(line: 5317, column: 11, scope: !4352)
!4394 = !DILocation(line: 5318, column: 25, scope: !4352)
!4395 = !DILocation(line: 5318, column: 32, scope: !4352)
!4396 = !DILocation(line: 5318, column: 13, scope: !4352)
!4397 = !DILocation(line: 5318, column: 11, scope: !4352)
!4398 = !DILocation(line: 5319, column: 13, scope: !4352)
!4399 = !DILocation(line: 5319, column: 25, scope: !4352)
!4400 = !DILocation(line: 5319, column: 22, scope: !4352)
!4401 = !DILocation(line: 5319, column: 11, scope: !4352)
!4402 = !DILocation(line: 5320, column: 14, scope: !4352)
!4403 = !DILocation(line: 5320, column: 30, scope: !4352)
!4404 = !DILocation(line: 5320, column: 29, scope: !4352)
!4405 = !DILocation(line: 5320, column: 23, scope: !4352)
!4406 = !DILocation(line: 5320, column: 11, scope: !4352)
!4407 = !DILocation(line: 5321, column: 6, scope: !4408)
!4408 = distinct !DILexicalBlock(scope: !4352, file: !79, line: 5321, column: 5)
!4409 = !DILocation(line: 5321, column: 16, scope: !4408)
!4410 = !DILocation(line: 5321, column: 14, scope: !4408)
!4411 = !DILocation(line: 5321, column: 22, scope: !4408)
!4412 = !DILocation(line: 5321, column: 5, scope: !4352)
!4413 = !DILocation(line: 5323, column: 6, scope: !4414)
!4414 = distinct !DILexicalBlock(scope: !4415, file: !79, line: 5323, column: 6)
!4415 = distinct !DILexicalBlock(scope: !4408, file: !79, line: 5322, column: 2)
!4416 = !DILocation(line: 5323, column: 16, scope: !4414)
!4417 = !DILocation(line: 5323, column: 6, scope: !4415)
!4418 = !DILocation(line: 5325, column: 7, scope: !4419)
!4419 = distinct !DILexicalBlock(scope: !4420, file: !79, line: 5325, column: 7)
!4420 = distinct !DILexicalBlock(scope: !4414, file: !79, line: 5324, column: 3)
!4421 = !DILocation(line: 5325, column: 15, scope: !4419)
!4422 = !DILocation(line: 5325, column: 7, scope: !4420)
!4423 = !DILocation(line: 5326, column: 12, scope: !4419)
!4424 = !DILocation(line: 5326, column: 5, scope: !4419)
!4425 = !DILocation(line: 5328, column: 5, scope: !4419)
!4426 = !DILocation(line: 5332, column: 4, scope: !4427)
!4427 = distinct !DILexicalBlock(scope: !4414, file: !79, line: 5331, column: 3)
!4428 = !DILocation(line: 5337, column: 3, scope: !4429)
!4429 = distinct !DILexicalBlock(scope: !4408, file: !79, line: 5336, column: 2)
!4430 = !DILocation(line: 5339, column: 1, scope: !4352)
!4431 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !79, file: !79, line: 4727, type: !1325, scopeLine: 4728, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4432 = !DILocalVariable(name: "value", arg: 1, scope: !4431, file: !79, line: 4727, type: !743)
!4433 = !DILocation(line: 4727, column: 31, scope: !4431)
!4434 = !DILocalVariable(name: "factor", arg: 2, scope: !4431, file: !79, line: 4727, type: !87)
!4435 = !DILocation(line: 4727, column: 42, scope: !4431)
!4436 = !DILocation(line: 4729, column: 41, scope: !4431)
!4437 = !DILocation(line: 4729, column: 47, scope: !4431)
!4438 = !DILocation(line: 4729, column: 10, scope: !4431)
!4439 = !DILocation(line: 4729, column: 3, scope: !4431)
!4440 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !79, file: !79, line: 5357, type: !4441, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4441 = !DISubroutineType(types: !4442)
!4442 = !{!743, !743, !87, !743}
!4443 = !DILocalVariable(name: "value", arg: 1, scope: !4440, file: !79, line: 5357, type: !743)
!4444 = !DILocation(line: 5357, column: 40, scope: !4440)
!4445 = !DILocalVariable(name: "factor", arg: 2, scope: !4440, file: !79, line: 5357, type: !87)
!4446 = !DILocation(line: 5357, column: 51, scope: !4440)
!4447 = !DILocalVariable(name: "count", arg: 3, scope: !4440, file: !79, line: 5357, type: !743)
!4448 = !DILocation(line: 5357, column: 63, scope: !4440)
!4449 = !DILocalVariable(name: "u32Temp1", scope: !4440, file: !79, line: 5359, type: !743)
!4450 = !DILocation(line: 5359, column: 6, scope: !4440)
!4451 = !DILocalVariable(name: "u32Temp2", scope: !4440, file: !79, line: 5359, type: !743)
!4452 = !DILocation(line: 5359, column: 17, scope: !4440)
!4453 = !DILocalVariable(name: "u8SignBit", scope: !4440, file: !79, line: 5360, type: !17)
!4454 = !DILocation(line: 5360, column: 5, scope: !4440)
!4455 = !DILocation(line: 5362, column: 5, scope: !4456)
!4456 = distinct !DILexicalBlock(scope: !4440, file: !79, line: 5362, column: 5)
!4457 = !DILocation(line: 5362, column: 11, scope: !4456)
!4458 = !DILocation(line: 5362, column: 5, scope: !4440)
!4459 = !DILocation(line: 5364, column: 13, scope: !4460)
!4460 = distinct !DILexicalBlock(scope: !4456, file: !79, line: 5363, column: 2)
!4461 = !DILocation(line: 5365, column: 2, scope: !4460)
!4462 = !DILocation(line: 5368, column: 13, scope: !4463)
!4463 = distinct !DILexicalBlock(scope: !4456, file: !79, line: 5367, column: 2)
!4464 = !DILocation(line: 5372, column: 5, scope: !4465)
!4465 = distinct !DILexicalBlock(scope: !4440, file: !79, line: 5372, column: 5)
!4466 = !DILocation(line: 5372, column: 11, scope: !4465)
!4467 = !DILocation(line: 5372, column: 5, scope: !4440)
!4468 = !DILocation(line: 5374, column: 15, scope: !4469)
!4469 = distinct !DILexicalBlock(scope: !4465, file: !79, line: 5373, column: 2)
!4470 = !DILocation(line: 5374, column: 14, scope: !4469)
!4471 = !DILocation(line: 5374, column: 12, scope: !4469)
!4472 = !DILocation(line: 5375, column: 2, scope: !4469)
!4473 = !DILocation(line: 5378, column: 14, scope: !4474)
!4474 = distinct !DILexicalBlock(scope: !4465, file: !79, line: 5377, column: 2)
!4475 = !DILocation(line: 5378, column: 12, scope: !4474)
!4476 = !DILocation(line: 5381, column: 25, scope: !4440)
!4477 = !DILocation(line: 5381, column: 32, scope: !4440)
!4478 = !DILocation(line: 5381, column: 13, scope: !4440)
!4479 = !DILocation(line: 5381, column: 11, scope: !4440)
!4480 = !DILocation(line: 5382, column: 13, scope: !4440)
!4481 = !DILocation(line: 5382, column: 26, scope: !4440)
!4482 = !DILocation(line: 5382, column: 31, scope: !4440)
!4483 = !DILocation(line: 5382, column: 22, scope: !4440)
!4484 = !DILocation(line: 5382, column: 11, scope: !4440)
!4485 = !DILocation(line: 5383, column: 5, scope: !4486)
!4486 = distinct !DILexicalBlock(scope: !4440, file: !79, line: 5383, column: 5)
!4487 = !DILocation(line: 5383, column: 15, scope: !4486)
!4488 = !DILocation(line: 5383, column: 5, scope: !4440)
!4489 = !DILocation(line: 5385, column: 10, scope: !4490)
!4490 = distinct !DILexicalBlock(scope: !4486, file: !79, line: 5384, column: 2)
!4491 = !DILocation(line: 5385, column: 3, scope: !4490)
!4492 = !DILocation(line: 5389, column: 3, scope: !4493)
!4493 = distinct !DILexicalBlock(scope: !4486, file: !79, line: 5388, column: 2)
!4494 = !DILocation(line: 5391, column: 1, scope: !4440)
!4495 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !79, file: !79, line: 4751, type: !3099, scopeLine: 4752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4496 = !DILocalVariable(name: "value", arg: 1, scope: !4495, file: !79, line: 4751, type: !743)
!4497 = !DILocation(line: 4751, column: 30, scope: !4495)
!4498 = !DILocalVariable(name: "factor", arg: 2, scope: !4495, file: !79, line: 4751, type: !6)
!4499 = !DILocation(line: 4751, column: 40, scope: !4495)
!4500 = !DILocation(line: 4753, column: 40, scope: !4495)
!4501 = !DILocation(line: 4753, column: 46, scope: !4495)
!4502 = !DILocation(line: 4753, column: 10, scope: !4495)
!4503 = !DILocation(line: 4753, column: 3, scope: !4495)
!4504 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !79, file: !79, line: 5435, type: !4505, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4505 = !DISubroutineType(types: !4506)
!4506 = !{!743, !743, !6, !743}
!4507 = !DILocalVariable(name: "value", arg: 1, scope: !4504, file: !79, line: 5435, type: !743)
!4508 = !DILocation(line: 5435, column: 39, scope: !4504)
!4509 = !DILocalVariable(name: "factor", arg: 2, scope: !4504, file: !79, line: 5435, type: !6)
!4510 = !DILocation(line: 5435, column: 49, scope: !4504)
!4511 = !DILocalVariable(name: "count", arg: 3, scope: !4504, file: !79, line: 5435, type: !743)
!4512 = !DILocation(line: 5435, column: 61, scope: !4504)
!4513 = !DILocalVariable(name: "u32Temp1", scope: !4504, file: !79, line: 5437, type: !743)
!4514 = !DILocation(line: 5437, column: 6, scope: !4504)
!4515 = !DILocalVariable(name: "u32Temp2", scope: !4504, file: !79, line: 5437, type: !743)
!4516 = !DILocation(line: 5437, column: 17, scope: !4504)
!4517 = !DILocalVariable(name: "u32Temp3", scope: !4504, file: !79, line: 5437, type: !743)
!4518 = !DILocation(line: 5437, column: 26, scope: !4504)
!4519 = !DILocalVariable(name: "u8SignBit", scope: !4504, file: !79, line: 5438, type: !17)
!4520 = !DILocation(line: 5438, column: 5, scope: !4504)
!4521 = !DILocation(line: 5440, column: 5, scope: !4522)
!4522 = distinct !DILexicalBlock(scope: !4504, file: !79, line: 5440, column: 5)
!4523 = !DILocation(line: 5440, column: 11, scope: !4522)
!4524 = !DILocation(line: 5440, column: 5, scope: !4504)
!4525 = !DILocation(line: 5442, column: 13, scope: !4526)
!4526 = distinct !DILexicalBlock(scope: !4522, file: !79, line: 5441, column: 2)
!4527 = !DILocation(line: 5443, column: 2, scope: !4526)
!4528 = !DILocation(line: 5446, column: 13, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4522, file: !79, line: 5445, column: 2)
!4530 = !DILocation(line: 5450, column: 5, scope: !4531)
!4531 = distinct !DILexicalBlock(scope: !4504, file: !79, line: 5450, column: 5)
!4532 = !DILocation(line: 5450, column: 11, scope: !4531)
!4533 = !DILocation(line: 5450, column: 5, scope: !4504)
!4534 = !DILocation(line: 5452, column: 15, scope: !4535)
!4535 = distinct !DILexicalBlock(scope: !4531, file: !79, line: 5451, column: 2)
!4536 = !DILocation(line: 5452, column: 14, scope: !4535)
!4537 = !DILocation(line: 5452, column: 12, scope: !4535)
!4538 = !DILocation(line: 5453, column: 2, scope: !4535)
!4539 = !DILocation(line: 5456, column: 14, scope: !4540)
!4540 = distinct !DILexicalBlock(scope: !4531, file: !79, line: 5455, column: 2)
!4541 = !DILocation(line: 5456, column: 12, scope: !4540)
!4542 = !DILocation(line: 5459, column: 13, scope: !4504)
!4543 = !DILocation(line: 5459, column: 21, scope: !4504)
!4544 = !DILocation(line: 5459, column: 19, scope: !4504)
!4545 = !DILocation(line: 5459, column: 11, scope: !4504)
!4546 = !DILocation(line: 5460, column: 25, scope: !4504)
!4547 = !DILocation(line: 5460, column: 32, scope: !4504)
!4548 = !DILocation(line: 5460, column: 13, scope: !4504)
!4549 = !DILocation(line: 5460, column: 11, scope: !4504)
!4550 = !DILocation(line: 5461, column: 13, scope: !4504)
!4551 = !DILocation(line: 5461, column: 25, scope: !4504)
!4552 = !DILocation(line: 5461, column: 22, scope: !4504)
!4553 = !DILocation(line: 5461, column: 11, scope: !4504)
!4554 = !DILocation(line: 5462, column: 14, scope: !4504)
!4555 = !DILocation(line: 5462, column: 30, scope: !4504)
!4556 = !DILocation(line: 5462, column: 29, scope: !4504)
!4557 = !DILocation(line: 5462, column: 23, scope: !4504)
!4558 = !DILocation(line: 5462, column: 11, scope: !4504)
!4559 = !DILocation(line: 5463, column: 6, scope: !4560)
!4560 = distinct !DILexicalBlock(scope: !4504, file: !79, line: 5463, column: 5)
!4561 = !DILocation(line: 5463, column: 16, scope: !4560)
!4562 = !DILocation(line: 5463, column: 14, scope: !4560)
!4563 = !DILocation(line: 5463, column: 22, scope: !4560)
!4564 = !DILocation(line: 5463, column: 5, scope: !4504)
!4565 = !DILocation(line: 5465, column: 6, scope: !4566)
!4566 = distinct !DILexicalBlock(scope: !4567, file: !79, line: 5465, column: 6)
!4567 = distinct !DILexicalBlock(scope: !4560, file: !79, line: 5464, column: 2)
!4568 = !DILocation(line: 5465, column: 16, scope: !4566)
!4569 = !DILocation(line: 5465, column: 6, scope: !4567)
!4570 = !DILocation(line: 5467, column: 7, scope: !4571)
!4571 = distinct !DILexicalBlock(scope: !4572, file: !79, line: 5467, column: 7)
!4572 = distinct !DILexicalBlock(scope: !4566, file: !79, line: 5466, column: 3)
!4573 = !DILocation(line: 5467, column: 15, scope: !4571)
!4574 = !DILocation(line: 5467, column: 7, scope: !4572)
!4575 = !DILocation(line: 5468, column: 12, scope: !4571)
!4576 = !DILocation(line: 5468, column: 5, scope: !4571)
!4577 = !DILocation(line: 5470, column: 5, scope: !4571)
!4578 = !DILocation(line: 5474, column: 4, scope: !4579)
!4579 = distinct !DILexicalBlock(scope: !4566, file: !79, line: 5473, column: 3)
!4580 = !DILocation(line: 5479, column: 3, scope: !4581)
!4581 = distinct !DILexicalBlock(scope: !4560, file: !79, line: 5478, column: 2)
!4582 = !DILocation(line: 5481, column: 1, scope: !4504)
!4583 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !79, file: !79, line: 4775, type: !1121, scopeLine: 4776, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4584 = !DILocalVariable(name: "value", arg: 1, scope: !4583, file: !79, line: 4775, type: !743)
!4585 = !DILocation(line: 4775, column: 31, scope: !4583)
!4586 = !DILocalVariable(name: "factor", arg: 2, scope: !4583, file: !79, line: 4775, type: !22)
!4587 = !DILocation(line: 4775, column: 42, scope: !4583)
!4588 = !DILocation(line: 4777, column: 41, scope: !4583)
!4589 = !DILocation(line: 4777, column: 47, scope: !4583)
!4590 = !DILocation(line: 4777, column: 10, scope: !4583)
!4591 = !DILocation(line: 4777, column: 3, scope: !4583)
!4592 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !79, file: !79, line: 4799, type: !1416, scopeLine: 4800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4593 = !DILocalVariable(name: "value", arg: 1, scope: !4592, file: !79, line: 4799, type: !743)
!4594 = !DILocation(line: 4799, column: 31, scope: !4592)
!4595 = !DILocalVariable(name: "factor", arg: 2, scope: !4592, file: !79, line: 4799, type: !743)
!4596 = !DILocation(line: 4799, column: 42, scope: !4592)
!4597 = !DILocation(line: 4801, column: 41, scope: !4592)
!4598 = !DILocation(line: 4801, column: 47, scope: !4592)
!4599 = !DILocation(line: 4801, column: 10, scope: !4592)
!4600 = !DILocation(line: 4801, column: 3, scope: !4592)
!4601 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !79, file: !79, line: 5408, type: !4602, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4602 = !DISubroutineType(types: !4603)
!4603 = !{!743, !743, !743, !743}
!4604 = !DILocalVariable(name: "value", arg: 1, scope: !4601, file: !79, line: 5408, type: !743)
!4605 = !DILocation(line: 5408, column: 40, scope: !4601)
!4606 = !DILocalVariable(name: "factor", arg: 2, scope: !4601, file: !79, line: 5408, type: !743)
!4607 = !DILocation(line: 5408, column: 50, scope: !4601)
!4608 = !DILocalVariable(name: "count", arg: 3, scope: !4601, file: !79, line: 5408, type: !743)
!4609 = !DILocation(line: 5408, column: 62, scope: !4601)
!4610 = !DILocalVariable(name: "u32Temp1", scope: !4601, file: !79, line: 5410, type: !743)
!4611 = !DILocation(line: 5410, column: 6, scope: !4601)
!4612 = !DILocalVariable(name: "u32Temp2", scope: !4601, file: !79, line: 5410, type: !743)
!4613 = !DILocation(line: 5410, column: 17, scope: !4601)
!4614 = !DILocalVariable(name: "u32Temp3", scope: !4601, file: !79, line: 5410, type: !743)
!4615 = !DILocation(line: 5410, column: 26, scope: !4601)
!4616 = !DILocalVariable(name: "u32Temp4", scope: !4601, file: !79, line: 5410, type: !743)
!4617 = !DILocation(line: 5410, column: 35, scope: !4601)
!4618 = !DILocalVariable(name: "u8SignBit", scope: !4601, file: !79, line: 5411, type: !17)
!4619 = !DILocation(line: 5411, column: 5, scope: !4601)
!4620 = !DILocation(line: 5413, column: 25, scope: !4601)
!4621 = !DILocation(line: 5413, column: 32, scope: !4601)
!4622 = !DILocation(line: 5413, column: 13, scope: !4601)
!4623 = !DILocation(line: 5413, column: 11, scope: !4601)
!4624 = !DILocation(line: 5414, column: 13, scope: !4601)
!4625 = !DILocation(line: 5414, column: 26, scope: !4601)
!4626 = !DILocation(line: 5414, column: 31, scope: !4601)
!4627 = !DILocation(line: 5414, column: 22, scope: !4601)
!4628 = !DILocation(line: 5414, column: 11, scope: !4601)
!4629 = !DILocation(line: 5415, column: 9, scope: !4601)
!4630 = !DILocation(line: 5415, column: 2, scope: !4601)
!4631 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !79, file: !79, line: 4823, type: !3038, scopeLine: 4824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4632 = !DILocalVariable(name: "value", arg: 1, scope: !4631, file: !79, line: 4823, type: !743)
!4633 = !DILocation(line: 4823, column: 30, scope: !4631)
!4634 = !DILocalVariable(name: "factor", arg: 2, scope: !4631, file: !79, line: 4823, type: !17)
!4635 = !DILocation(line: 4823, column: 40, scope: !4631)
!4636 = !DILocation(line: 4825, column: 40, scope: !4631)
!4637 = !DILocation(line: 4825, column: 46, scope: !4631)
!4638 = !DILocation(line: 4825, column: 10, scope: !4631)
!4639 = !DILocation(line: 4825, column: 3, scope: !4631)
!4640 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !79, file: !79, line: 5499, type: !4641, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4641 = !DISubroutineType(types: !4642)
!4642 = !{!743, !743, !17, !743}
!4643 = !DILocalVariable(name: "value", arg: 1, scope: !4640, file: !79, line: 5499, type: !743)
!4644 = !DILocation(line: 5499, column: 39, scope: !4640)
!4645 = !DILocalVariable(name: "factor", arg: 2, scope: !4640, file: !79, line: 5499, type: !17)
!4646 = !DILocation(line: 5499, column: 49, scope: !4640)
!4647 = !DILocalVariable(name: "count", arg: 3, scope: !4640, file: !79, line: 5499, type: !743)
!4648 = !DILocation(line: 5499, column: 61, scope: !4640)
!4649 = !DILocalVariable(name: "u32Temp1", scope: !4640, file: !79, line: 5501, type: !743)
!4650 = !DILocation(line: 5501, column: 6, scope: !4640)
!4651 = !DILocalVariable(name: "u32Temp2", scope: !4640, file: !79, line: 5501, type: !743)
!4652 = !DILocation(line: 5501, column: 17, scope: !4640)
!4653 = !DILocation(line: 5503, column: 13, scope: !4640)
!4654 = !DILocation(line: 5503, column: 21, scope: !4640)
!4655 = !DILocation(line: 5503, column: 19, scope: !4640)
!4656 = !DILocation(line: 5503, column: 11, scope: !4640)
!4657 = !DILocation(line: 5504, column: 25, scope: !4640)
!4658 = !DILocation(line: 5504, column: 32, scope: !4640)
!4659 = !DILocation(line: 5504, column: 13, scope: !4640)
!4660 = !DILocation(line: 5504, column: 11, scope: !4640)
!4661 = !DILocation(line: 5505, column: 13, scope: !4640)
!4662 = !DILocation(line: 5505, column: 25, scope: !4640)
!4663 = !DILocation(line: 5505, column: 22, scope: !4640)
!4664 = !DILocation(line: 5505, column: 11, scope: !4640)
!4665 = !DILocation(line: 5506, column: 14, scope: !4640)
!4666 = !DILocation(line: 5506, column: 30, scope: !4640)
!4667 = !DILocation(line: 5506, column: 29, scope: !4640)
!4668 = !DILocation(line: 5506, column: 23, scope: !4640)
!4669 = !DILocation(line: 5506, column: 11, scope: !4640)
!4670 = !DILocation(line: 5507, column: 6, scope: !4671)
!4671 = distinct !DILexicalBlock(scope: !4640, file: !79, line: 5507, column: 5)
!4672 = !DILocation(line: 5507, column: 16, scope: !4671)
!4673 = !DILocation(line: 5507, column: 14, scope: !4671)
!4674 = !DILocation(line: 5507, column: 22, scope: !4671)
!4675 = !DILocation(line: 5507, column: 5, scope: !4640)
!4676 = !DILocation(line: 5509, column: 6, scope: !4677)
!4677 = distinct !DILexicalBlock(scope: !4678, file: !79, line: 5509, column: 6)
!4678 = distinct !DILexicalBlock(scope: !4671, file: !79, line: 5508, column: 2)
!4679 = !DILocation(line: 5509, column: 14, scope: !4677)
!4680 = !DILocation(line: 5509, column: 6, scope: !4678)
!4681 = !DILocation(line: 5510, column: 11, scope: !4677)
!4682 = !DILocation(line: 5510, column: 4, scope: !4677)
!4683 = !DILocation(line: 5512, column: 4, scope: !4677)
!4684 = !DILocation(line: 5516, column: 3, scope: !4685)
!4685 = distinct !DILexicalBlock(scope: !4671, file: !79, line: 5515, column: 2)
!4686 = !DILocation(line: 5518, column: 1, scope: !4640)
!4687 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !79, file: !79, line: 4846, type: !889, scopeLine: 4847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4688 = !DILocalVariable(name: "value", arg: 1, scope: !4687, file: !79, line: 4846, type: !17)
!4689 = !DILocation(line: 4846, column: 28, scope: !4687)
!4690 = !DILocalVariable(name: "factor", arg: 2, scope: !4687, file: !79, line: 4846, type: !17)
!4691 = !DILocation(line: 4846, column: 38, scope: !4687)
!4692 = !DILocation(line: 4848, column: 38, scope: !4687)
!4693 = !DILocation(line: 4848, column: 44, scope: !4687)
!4694 = !DILocation(line: 4848, column: 10, scope: !4687)
!4695 = !DILocation(line: 4848, column: 3, scope: !4687)
!4696 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !79, file: !79, line: 4869, type: !889, scopeLine: 4870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4697 = !DILocalVariable(name: "value", arg: 1, scope: !4696, file: !79, line: 4869, type: !17)
!4698 = !DILocation(line: 4869, column: 28, scope: !4696)
!4699 = !DILocalVariable(name: "factor", arg: 2, scope: !4696, file: !79, line: 4869, type: !17)
!4700 = !DILocation(line: 4869, column: 38, scope: !4696)
!4701 = !DILocation(line: 4871, column: 38, scope: !4696)
!4702 = !DILocation(line: 4871, column: 44, scope: !4696)
!4703 = !DILocation(line: 4871, column: 10, scope: !4696)
!4704 = !DILocation(line: 4871, column: 3, scope: !4696)
!4705 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !79, file: !79, line: 4893, type: !889, scopeLine: 4894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4706 = !DILocalVariable(name: "value", arg: 1, scope: !4705, file: !79, line: 4893, type: !17)
!4707 = !DILocation(line: 4893, column: 26, scope: !4705)
!4708 = !DILocalVariable(name: "factor", arg: 2, scope: !4705, file: !79, line: 4893, type: !17)
!4709 = !DILocation(line: 4893, column: 36, scope: !4705)
!4710 = !DILocation(line: 4895, column: 38, scope: !4705)
!4711 = !DILocation(line: 4895, column: 44, scope: !4705)
!4712 = !DILocation(line: 4895, column: 10, scope: !4705)
!4713 = !DILocation(line: 4895, column: 3, scope: !4705)
!4714 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !79, file: !79, line: 4917, type: !889, scopeLine: 4918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4715 = !DILocalVariable(name: "value", arg: 1, scope: !4714, file: !79, line: 4917, type: !17)
!4716 = !DILocation(line: 4917, column: 28, scope: !4714)
!4717 = !DILocalVariable(name: "factor", arg: 2, scope: !4714, file: !79, line: 4917, type: !17)
!4718 = !DILocation(line: 4917, column: 38, scope: !4714)
!4719 = !DILocation(line: 4919, column: 41, scope: !4714)
!4720 = !DILocation(line: 4919, column: 47, scope: !4714)
!4721 = !DILocation(line: 4919, column: 10, scope: !4714)
!4722 = !DILocation(line: 4919, column: 3, scope: !4714)
!4723 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !79, file: !79, line: 4941, type: !889, scopeLine: 4942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4724 = !DILocalVariable(name: "value", arg: 1, scope: !4723, file: !79, line: 4941, type: !17)
!4725 = !DILocation(line: 4941, column: 26, scope: !4723)
!4726 = !DILocalVariable(name: "factor", arg: 2, scope: !4723, file: !79, line: 4941, type: !17)
!4727 = !DILocation(line: 4941, column: 36, scope: !4723)
!4728 = !DILocation(line: 4943, column: 41, scope: !4723)
!4729 = !DILocation(line: 4943, column: 47, scope: !4723)
!4730 = !DILocation(line: 4943, column: 10, scope: !4723)
!4731 = !DILocation(line: 4943, column: 3, scope: !4723)
!4732 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !79, file: !79, line: 4964, type: !889, scopeLine: 4965, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4733 = !DILocalVariable(name: "value", arg: 1, scope: !4732, file: !79, line: 4964, type: !17)
!4734 = !DILocation(line: 4964, column: 26, scope: !4732)
!4735 = !DILocalVariable(name: "factor", arg: 2, scope: !4732, file: !79, line: 4964, type: !17)
!4736 = !DILocation(line: 4964, column: 36, scope: !4732)
!4737 = !DILocation(line: 4966, column: 41, scope: !4732)
!4738 = !DILocation(line: 4966, column: 47, scope: !4732)
!4739 = !DILocation(line: 4966, column: 10, scope: !4732)
!4740 = !DILocation(line: 4966, column: 3, scope: !4732)
!4741 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !79, file: !79, line: 4987, type: !889, scopeLine: 4988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4742 = !DILocalVariable(name: "value", arg: 1, scope: !4741, file: !79, line: 4987, type: !17)
!4743 = !DILocation(line: 4987, column: 25, scope: !4741)
!4744 = !DILocalVariable(name: "factor", arg: 2, scope: !4741, file: !79, line: 4987, type: !17)
!4745 = !DILocation(line: 4987, column: 35, scope: !4741)
!4746 = !DILocation(line: 4989, column: 41, scope: !4741)
!4747 = !DILocation(line: 4989, column: 47, scope: !4741)
!4748 = !DILocation(line: 4989, column: 10, scope: !4741)
!4749 = !DILocation(line: 4989, column: 3, scope: !4741)
!4750 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !79, file: !79, line: 5010, type: !889, scopeLine: 5011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4751 = !DILocalVariable(name: "value", arg: 1, scope: !4750, file: !79, line: 5010, type: !17)
!4752 = !DILocation(line: 5010, column: 26, scope: !4750)
!4753 = !DILocalVariable(name: "factor", arg: 2, scope: !4750, file: !79, line: 5010, type: !17)
!4754 = !DILocation(line: 5010, column: 35, scope: !4750)
!4755 = !DILocation(line: 5012, column: 41, scope: !4750)
!4756 = !DILocation(line: 5012, column: 47, scope: !4750)
!4757 = !DILocation(line: 5012, column: 10, scope: !4750)
!4758 = !DILocation(line: 5012, column: 3, scope: !4750)
!4759 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !79, file: !79, line: 5033, type: !889, scopeLine: 5034, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4760 = !DILocalVariable(name: "value", arg: 1, scope: !4759, file: !79, line: 5033, type: !17)
!4761 = !DILocation(line: 5033, column: 25, scope: !4759)
!4762 = !DILocalVariable(name: "factor", arg: 2, scope: !4759, file: !79, line: 5033, type: !17)
!4763 = !DILocation(line: 5033, column: 35, scope: !4759)
!4764 = !DILocation(line: 5035, column: 41, scope: !4759)
!4765 = !DILocation(line: 5035, column: 47, scope: !4759)
!4766 = !DILocation(line: 5035, column: 10, scope: !4759)
!4767 = !DILocation(line: 5035, column: 3, scope: !4759)
!4768 = distinct !DISubprogram(name: "MulHighWord", scope: !4769, file: !4769, line: 39, type: !1416, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4769 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001")
!4770 = !DILocalVariable(name: "arg1", arg: 1, scope: !4768, file: !4769, line: 39, type: !743)
!4771 = !DILocation(line: 39, column: 30, scope: !4768)
!4772 = !DILocalVariable(name: "arg2", arg: 2, scope: !4768, file: !4769, line: 39, type: !743)
!4773 = !DILocation(line: 39, column: 48, scope: !4768)
!4774 = !DILocalVariable(name: "arg1_LW", scope: !4768, file: !4769, line: 41, type: !22)
!4775 = !DILocation(line: 41, column: 6, scope: !4768)
!4776 = !DILocalVariable(name: "arg1_HW", scope: !4768, file: !4769, line: 41, type: !22)
!4777 = !DILocation(line: 41, column: 14, scope: !4768)
!4778 = !DILocalVariable(name: "arg2_LW", scope: !4768, file: !4769, line: 41, type: !22)
!4779 = !DILocation(line: 41, column: 22, scope: !4768)
!4780 = !DILocalVariable(name: "arg2_HW", scope: !4768, file: !4769, line: 41, type: !22)
!4781 = !DILocation(line: 41, column: 30, scope: !4768)
!4782 = !DILocalVariable(name: "MulTemp1", scope: !4768, file: !4769, line: 42, type: !743)
!4783 = !DILocation(line: 42, column: 6, scope: !4768)
!4784 = !DILocalVariable(name: "MulTemp2", scope: !4768, file: !4769, line: 42, type: !743)
!4785 = !DILocation(line: 42, column: 16, scope: !4768)
!4786 = !DILocalVariable(name: "MulTemp3", scope: !4768, file: !4769, line: 42, type: !743)
!4787 = !DILocation(line: 42, column: 26, scope: !4768)
!4788 = !DILocalVariable(name: "MulTemp4", scope: !4768, file: !4769, line: 42, type: !743)
!4789 = !DILocation(line: 42, column: 36, scope: !4768)
!4790 = !DILocalVariable(name: "HIGHWORD", scope: !4768, file: !4769, line: 42, type: !743)
!4791 = !DILocation(line: 42, column: 47, scope: !4768)
!4792 = !DILocalVariable(name: "OverFlow", scope: !4768, file: !4769, line: 42, type: !743)
!4793 = !DILocation(line: 42, column: 57, scope: !4768)
!4794 = !DILocation(line: 43, column: 12, scope: !4768)
!4795 = !DILocation(line: 43, column: 17, scope: !4768)
!4796 = !DILocation(line: 43, column: 10, scope: !4768)
!4797 = !DILocation(line: 44, column: 13, scope: !4768)
!4798 = !DILocation(line: 44, column: 18, scope: !4768)
!4799 = !DILocation(line: 44, column: 31, scope: !4768)
!4800 = !DILocation(line: 44, column: 12, scope: !4768)
!4801 = !DILocation(line: 44, column: 10, scope: !4768)
!4802 = !DILocation(line: 45, column: 12, scope: !4768)
!4803 = !DILocation(line: 45, column: 17, scope: !4768)
!4804 = !DILocation(line: 45, column: 10, scope: !4768)
!4805 = !DILocation(line: 46, column: 13, scope: !4768)
!4806 = !DILocation(line: 46, column: 18, scope: !4768)
!4807 = !DILocation(line: 46, column: 31, scope: !4768)
!4808 = !DILocation(line: 46, column: 12, scope: !4768)
!4809 = !DILocation(line: 46, column: 10, scope: !4768)
!4810 = !DILocation(line: 47, column: 13, scope: !4768)
!4811 = !DILocation(line: 47, column: 23, scope: !4768)
!4812 = !DILocation(line: 47, column: 21, scope: !4768)
!4813 = !DILocation(line: 47, column: 11, scope: !4768)
!4814 = !DILocation(line: 48, column: 13, scope: !4768)
!4815 = !DILocation(line: 48, column: 23, scope: !4768)
!4816 = !DILocation(line: 48, column: 21, scope: !4768)
!4817 = !DILocation(line: 48, column: 11, scope: !4768)
!4818 = !DILocation(line: 49, column: 13, scope: !4768)
!4819 = !DILocation(line: 49, column: 23, scope: !4768)
!4820 = !DILocation(line: 49, column: 21, scope: !4768)
!4821 = !DILocation(line: 49, column: 11, scope: !4768)
!4822 = !DILocation(line: 50, column: 13, scope: !4768)
!4823 = !DILocation(line: 50, column: 23, scope: !4768)
!4824 = !DILocation(line: 50, column: 21, scope: !4768)
!4825 = !DILocation(line: 50, column: 11, scope: !4768)
!4826 = !DILocation(line: 52, column: 14, scope: !4768)
!4827 = !DILocation(line: 52, column: 23, scope: !4768)
!4828 = !DILocation(line: 52, column: 33, scope: !4768)
!4829 = !DILocation(line: 52, column: 42, scope: !4768)
!4830 = !DILocation(line: 52, column: 30, scope: !4768)
!4831 = !DILocation(line: 52, column: 51, scope: !4768)
!4832 = !DILocation(line: 52, column: 49, scope: !4768)
!4833 = !DILocation(line: 52, column: 11, scope: !4768)
!4834 = !DILocation(line: 53, column: 14, scope: !4768)
!4835 = !DILocation(line: 53, column: 22, scope: !4768)
!4836 = !DILocation(line: 53, column: 31, scope: !4768)
!4837 = !DILocation(line: 53, column: 40, scope: !4768)
!4838 = !DILocation(line: 53, column: 28, scope: !4768)
!4839 = !DILocation(line: 53, column: 53, scope: !4768)
!4840 = !DILocation(line: 53, column: 62, scope: !4768)
!4841 = !DILocation(line: 53, column: 50, scope: !4768)
!4842 = !DILocation(line: 53, column: 11, scope: !4768)
!4843 = !DILocation(line: 54, column: 6, scope: !4844)
!4844 = distinct !DILexicalBlock(scope: !4768, file: !4769, line: 54, column: 6)
!4845 = !DILocation(line: 54, column: 15, scope: !4844)
!4846 = !DILocation(line: 54, column: 6, scope: !4768)
!4847 = !DILocation(line: 56, column: 10, scope: !4848)
!4848 = distinct !DILexicalBlock(scope: !4844, file: !4769, line: 55, column: 2)
!4849 = !DILocation(line: 56, column: 22, scope: !4848)
!4850 = !DILocation(line: 56, column: 30, scope: !4848)
!4851 = !DILocation(line: 56, column: 19, scope: !4848)
!4852 = !DILocation(line: 56, column: 3, scope: !4848)
!4853 = !DILocation(line: 60, column: 10, scope: !4854)
!4854 = distinct !DILexicalBlock(scope: !4844, file: !4769, line: 59, column: 2)
!4855 = !DILocation(line: 60, column: 3, scope: !4854)
!4856 = !DILocation(line: 62, column: 1, scope: !4768)
!4857 = distinct !DISubprogram(name: "MulLowWord", scope: !4769, file: !4769, line: 78, type: !1416, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4858 = !DILocalVariable(name: "arg1", arg: 1, scope: !4857, file: !4769, line: 78, type: !743)
!4859 = !DILocation(line: 78, column: 29, scope: !4857)
!4860 = !DILocalVariable(name: "arg2", arg: 2, scope: !4857, file: !4769, line: 78, type: !743)
!4861 = !DILocation(line: 78, column: 47, scope: !4857)
!4862 = !DILocalVariable(name: "arg1_LW", scope: !4857, file: !4769, line: 80, type: !22)
!4863 = !DILocation(line: 80, column: 6, scope: !4857)
!4864 = !DILocalVariable(name: "arg1_HW", scope: !4857, file: !4769, line: 80, type: !22)
!4865 = !DILocation(line: 80, column: 14, scope: !4857)
!4866 = !DILocalVariable(name: "arg2_LW", scope: !4857, file: !4769, line: 80, type: !22)
!4867 = !DILocation(line: 80, column: 22, scope: !4857)
!4868 = !DILocalVariable(name: "arg2_HW", scope: !4857, file: !4769, line: 80, type: !22)
!4869 = !DILocation(line: 80, column: 30, scope: !4857)
!4870 = !DILocalVariable(name: "MulTemp1", scope: !4857, file: !4769, line: 81, type: !743)
!4871 = !DILocation(line: 81, column: 6, scope: !4857)
!4872 = !DILocalVariable(name: "MulTemp2", scope: !4857, file: !4769, line: 81, type: !743)
!4873 = !DILocation(line: 81, column: 16, scope: !4857)
!4874 = !DILocalVariable(name: "MulTemp3", scope: !4857, file: !4769, line: 81, type: !743)
!4875 = !DILocation(line: 81, column: 26, scope: !4857)
!4876 = !DILocalVariable(name: "MulTemp4", scope: !4857, file: !4769, line: 81, type: !743)
!4877 = !DILocation(line: 81, column: 36, scope: !4857)
!4878 = !DILocalVariable(name: "HIGHWORD", scope: !4857, file: !4769, line: 81, type: !743)
!4879 = !DILocation(line: 81, column: 47, scope: !4857)
!4880 = !DILocalVariable(name: "OverFlow", scope: !4857, file: !4769, line: 81, type: !743)
!4881 = !DILocation(line: 81, column: 57, scope: !4857)
!4882 = !DILocation(line: 82, column: 12, scope: !4857)
!4883 = !DILocation(line: 82, column: 17, scope: !4857)
!4884 = !DILocation(line: 82, column: 10, scope: !4857)
!4885 = !DILocation(line: 83, column: 13, scope: !4857)
!4886 = !DILocation(line: 83, column: 18, scope: !4857)
!4887 = !DILocation(line: 83, column: 31, scope: !4857)
!4888 = !DILocation(line: 83, column: 12, scope: !4857)
!4889 = !DILocation(line: 83, column: 10, scope: !4857)
!4890 = !DILocation(line: 84, column: 12, scope: !4857)
!4891 = !DILocation(line: 84, column: 17, scope: !4857)
!4892 = !DILocation(line: 84, column: 10, scope: !4857)
!4893 = !DILocation(line: 85, column: 13, scope: !4857)
!4894 = !DILocation(line: 85, column: 18, scope: !4857)
!4895 = !DILocation(line: 85, column: 31, scope: !4857)
!4896 = !DILocation(line: 85, column: 12, scope: !4857)
!4897 = !DILocation(line: 85, column: 10, scope: !4857)
!4898 = !DILocation(line: 86, column: 13, scope: !4857)
!4899 = !DILocation(line: 86, column: 23, scope: !4857)
!4900 = !DILocation(line: 86, column: 21, scope: !4857)
!4901 = !DILocation(line: 86, column: 11, scope: !4857)
!4902 = !DILocation(line: 87, column: 13, scope: !4857)
!4903 = !DILocation(line: 87, column: 23, scope: !4857)
!4904 = !DILocation(line: 87, column: 21, scope: !4857)
!4905 = !DILocation(line: 87, column: 11, scope: !4857)
!4906 = !DILocation(line: 88, column: 13, scope: !4857)
!4907 = !DILocation(line: 88, column: 23, scope: !4857)
!4908 = !DILocation(line: 88, column: 21, scope: !4857)
!4909 = !DILocation(line: 88, column: 11, scope: !4857)
!4910 = !DILocation(line: 89, column: 13, scope: !4857)
!4911 = !DILocation(line: 89, column: 23, scope: !4857)
!4912 = !DILocation(line: 89, column: 21, scope: !4857)
!4913 = !DILocation(line: 89, column: 11, scope: !4857)
!4914 = !DILocation(line: 90, column: 14, scope: !4857)
!4915 = !DILocation(line: 90, column: 28, scope: !4857)
!4916 = !DILocation(line: 90, column: 37, scope: !4857)
!4917 = !DILocation(line: 90, column: 46, scope: !4857)
!4918 = !DILocation(line: 90, column: 24, scope: !4857)
!4919 = !DILocation(line: 90, column: 56, scope: !4857)
!4920 = !DILocation(line: 90, column: 65, scope: !4857)
!4921 = !DILocation(line: 90, column: 74, scope: !4857)
!4922 = !DILocation(line: 90, column: 52, scope: !4857)
!4923 = !DILocation(line: 90, column: 11, scope: !4857)
!4924 = !DILocation(line: 92, column: 9, scope: !4857)
!4925 = !DILocation(line: 92, column: 2, scope: !4857)
!4926 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4927, file: !4927, line: 12, type: !4928, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !4931)
!4927 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4928 = !DISubroutineType(types: !4929)
!4929 = !{null, !4930}
!4930 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4931 = !{!4932}
!4932 = !DILocalVariable(name: "z", arg: 1, scope: !4926, file: !4927, line: 12, type: !4930)
!4933 = !DILocation(line: 0, scope: !4926)
!4934 = !DILocation(line: 13, column: 9, scope: !4935)
!4935 = distinct !DILexicalBlock(scope: !4926, file: !4927, line: 13, column: 7)
!4936 = !DILocation(line: 13, column: 7, scope: !4926)
!4937 = !DILocation(line: 14, column: 5, scope: !4935)
!4938 = !DILocation(line: 15, column: 1, scope: !4926)
!4939 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4940, file: !4940, line: 20, type: !4941, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4944)
!4940 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4941 = !DISubroutineType(types: !4942)
!4942 = !{null, !4943, !4943}
!4943 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4944 = !{!4945, !4946}
!4945 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4939, file: !4940, line: 20, type: !4943)
!4946 = !DILocalVariable(name: "shift", arg: 2, scope: !4939, file: !4940, line: 20, type: !4943)
!4947 = !DILocation(line: 0, scope: !4939)
!4948 = !DILocation(line: 21, column: 13, scope: !4949)
!4949 = distinct !DILexicalBlock(scope: !4939, file: !4940, line: 21, column: 7)
!4950 = !DILocation(line: 21, column: 7, scope: !4939)
!4951 = !DILocation(line: 27, column: 5, scope: !4952)
!4952 = distinct !DILexicalBlock(scope: !4949, file: !4940, line: 21, column: 26)
!4953 = !DILocation(line: 29, column: 1, scope: !4939)
