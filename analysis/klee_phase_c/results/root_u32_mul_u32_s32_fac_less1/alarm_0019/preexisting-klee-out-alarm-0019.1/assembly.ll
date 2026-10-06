; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/root_u32_mul_u32_s32_fac_less1_alarm_0019.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"count\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [84 x i8] c"KLEE-ALARM-0019: invalid RHS operand for shift. assert 0 <= (u32)(count - 32) < 32;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0019.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %factor = alloca i32, align 4
  %count = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %factor, metadata !59, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %count, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32* %result, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = bitcast i32* %value to i8*, !dbg !67
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !68
  %1 = bitcast i32* %factor to i8*, !dbg !69
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  %2 = bitcast i32* %count to i8*, !dbg !71
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  %3 = load i32, i32* %value, align 4, !dbg !73
  %4 = load i32, i32* %factor, align 4, !dbg !74
  %5 = load i32, i32* %count, align 4, !dbg !75
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %3, i32 %4, i32 %5), !dbg !76
  store i32 %call, i32* %result, align 4, !dbg !77
  %6 = load i32, i32* %result, align 4, !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !80 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !88, metadata !DIExpression()), !dbg !90
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !91, metadata !DIExpression()), !dbg !92
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !92
  %0 = load i8, i8* %value.addr, align 1, !dbg !93
  %conv = sext i8 %0 to i32, !dbg !93
  %1 = load i16, i16* %factor.addr, align 2, !dbg !94
  %conv1 = zext i16 %1 to i32, !dbg !94
  %mul = mul nsw i32 %conv, %conv1, !dbg !95
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !96
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !97
  %shr = ashr i32 %2, 16, !dbg !98
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !99
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !100
  %cmp = icmp slt i32 %3, 0, !dbg !102
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !103

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !104
  %and = and i32 %4, 65535, !dbg !105
  %cmp3 = icmp ne i32 %and, 0, !dbg !106
  br i1 %cmp3, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !108
  %add = add nsw i32 %5, 1, !dbg !110
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !111
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !112
  %conv5 = trunc i32 %6 to i8, !dbg !113
  store i8 %conv5, i8* %retval, align 1, !dbg !114
  br label %return, !dbg !114

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !115
  %conv6 = trunc i32 %7 to i8, !dbg !117
  store i8 %conv6, i8* %retval, align 1, !dbg !118
  br label %return, !dbg !118

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !119
  ret i8 %8, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !120 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !128
  %0 = load i8, i8* %value.addr, align 1, !dbg !129
  %conv = sext i8 %0 to i32, !dbg !129
  %1 = load i16, i16* %factor.addr, align 2, !dbg !130
  %conv1 = zext i16 %1 to i32, !dbg !130
  %mul = mul nsw i32 %conv, %conv1, !dbg !131
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !132
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !133
  %shr = ashr i32 %2, 8, !dbg !134
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !135
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !136
  %cmp = icmp slt i32 %3, 0, !dbg !138
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !139

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !140
  %and = and i32 %4, 255, !dbg !141
  %cmp3 = icmp ne i32 %and, 0, !dbg !142
  br i1 %cmp3, label %if.then, label %if.end, !dbg !143

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !144
  %add = add nsw i32 %5, 1, !dbg !146
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !147
  br label %if.end, !dbg !148

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !149
  %cmp5 = icmp slt i32 %6, 127, !dbg !151
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !152

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !153
  %cmp8 = icmp sgt i32 %7, -128, !dbg !156
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !157

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !158
  %conv11 = trunc i32 %8 to i8, !dbg !160
  store i8 %conv11, i8* %retval, align 1, !dbg !161
  br label %return, !dbg !161

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !162
  br label %return, !dbg !162

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !164
  br label %return, !dbg !164

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !166
  ret i8 %9, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !167 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !170, metadata !DIExpression()), !dbg !171
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !174, metadata !DIExpression()), !dbg !175
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !175
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !176, metadata !DIExpression()), !dbg !177
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !177
  %0 = load i8, i8* %value.addr, align 1, !dbg !178
  %conv = sext i8 %0 to i32, !dbg !178
  %1 = load i8, i8* %factor.addr, align 1, !dbg !179
  %conv1 = zext i8 %1 to i32, !dbg !179
  %mul = mul nsw i32 %conv, %conv1, !dbg !180
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !181
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !182
  %shr = ashr i32 %2, 8, !dbg !183
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !184
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !185
  %cmp = icmp slt i32 %3, 0, !dbg !187
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !188

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !189
  %and = and i32 %4, 255, !dbg !190
  %cmp3 = icmp ne i32 %and, 0, !dbg !191
  br i1 %cmp3, label %if.then, label %if.else, !dbg !192

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !193
  %add = add nsw i32 %5, 1, !dbg !195
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !196
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !197
  %conv5 = trunc i32 %6 to i8, !dbg !198
  store i8 %conv5, i8* %retval, align 1, !dbg !199
  br label %return, !dbg !199

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !200
  %conv6 = trunc i32 %7 to i8, !dbg !202
  store i8 %conv6, i8* %retval, align 1, !dbg !203
  br label %return, !dbg !203

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !204
  ret i8 %8, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !205 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !206, metadata !DIExpression()), !dbg !207
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !213
  %0 = load i8, i8* %value.addr, align 1, !dbg !214
  %conv = sext i8 %0 to i32, !dbg !214
  %1 = load i8, i8* %factor.addr, align 1, !dbg !215
  %conv1 = zext i8 %1 to i32, !dbg !215
  %mul = mul nsw i32 %conv, %conv1, !dbg !216
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !217
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !218
  %shr = ashr i32 %2, 7, !dbg !219
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !220
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !221
  %cmp = icmp slt i32 %3, 0, !dbg !223
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !224

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !225
  %and = and i32 %4, 127, !dbg !226
  %cmp3 = icmp ne i32 %and, 0, !dbg !227
  br i1 %cmp3, label %if.then, label %if.end, !dbg !228

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !229
  %add = add nsw i32 %5, 1, !dbg !231
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !232
  br label %if.end, !dbg !233

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !234
  %cmp5 = icmp slt i32 %6, 127, !dbg !236
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !237

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !238
  %cmp8 = icmp sgt i32 %7, -128, !dbg !241
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !242

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !243
  %conv11 = trunc i32 %8 to i8, !dbg !245
  store i8 %conv11, i8* %retval, align 1, !dbg !246
  br label %return, !dbg !246

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !247
  br label %return, !dbg !247

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !249
  br label %return, !dbg !249

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !251
  ret i8 %9, !dbg !251
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !252 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !255, metadata !DIExpression()), !dbg !256
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !259, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 0, i32* %s32MulTemp, align 4, !dbg !262
  %0 = load i16, i16* %value.addr, align 2, !dbg !263
  %conv = sext i16 %0 to i32, !dbg !263
  %1 = load i16, i16* %factor.addr, align 2, !dbg !264
  %conv1 = sext i16 %1 to i32, !dbg !264
  %mul = mul nsw i32 %conv, %conv1, !dbg !265
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !266
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !267
  %3 = load i32, i32* %count.addr, align 4, !dbg !268
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !269
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !269
  %div = sdiv i32 %2, %3, !dbg !269, !klee.check.div !270
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !271
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !272
  %conv2 = trunc i32 %4 to i16, !dbg !272
  ret i16 %conv2, !dbg !273
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !274 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !275, metadata !DIExpression()), !dbg !276
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !277, metadata !DIExpression()), !dbg !278
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 0, i32* %s32MulTemp, align 4, !dbg !282
  %0 = load i16, i16* %value.addr, align 2, !dbg !283
  %conv = sext i16 %0 to i32, !dbg !283
  %1 = load i16, i16* %factor.addr, align 2, !dbg !284
  %conv1 = sext i16 %1 to i32, !dbg !284
  %mul = mul nsw i32 %conv, %conv1, !dbg !285
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !286
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !287
  %3 = load i32, i32* %count.addr, align 4, !dbg !288
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !289
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !289
  %div = sdiv i32 %2, %3, !dbg !289, !klee.check.div !270
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !290
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !291
  %cmp = icmp slt i32 %4, 32767, !dbg !293
  br i1 %cmp, label %if.then, label %if.else7, !dbg !294

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !295
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !298
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !299

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !300
  %conv6 = trunc i32 %6 to i16, !dbg !302
  store i16 %conv6, i16* %retval, align 2, !dbg !303
  br label %return, !dbg !303

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !304
  br label %return, !dbg !304

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !306
  br label %return, !dbg !306

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !308
  ret i16 %7, !dbg !308
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !309 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !312, metadata !DIExpression()), !dbg !313
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !314, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !316, metadata !DIExpression()), !dbg !317
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !317
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !318, metadata !DIExpression()), !dbg !319
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !319
  %0 = load i16, i16* %value.addr, align 2, !dbg !320
  %conv = sext i16 %0 to i32, !dbg !320
  %1 = load i16, i16* %factor.addr, align 2, !dbg !321
  %conv1 = sext i16 %1 to i32, !dbg !321
  %mul = mul nsw i32 %conv, %conv1, !dbg !322
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !323
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !324
  %shr = ashr i32 %2, 15, !dbg !325
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !326
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !327
  %cmp = icmp slt i32 %3, 0, !dbg !329
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !330

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !331
  %and = and i32 %4, 32767, !dbg !332
  %cmp3 = icmp ne i32 %and, 0, !dbg !333
  br i1 %cmp3, label %if.then, label %if.end, !dbg !334

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !335
  %add = add nsw i32 %5, 1, !dbg !337
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !338
  br label %if.end, !dbg !339

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !340
  %cmp5 = icmp slt i32 %6, 32767, !dbg !342
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !343

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !344
  %conv8 = trunc i32 %7 to i16, !dbg !346
  store i16 %conv8, i16* %retval, align 2, !dbg !347
  br label %return, !dbg !347

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !348
  br label %return, !dbg !348

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !350
  ret i16 %8, !dbg !350
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !351 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !352, metadata !DIExpression()), !dbg !353
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !354, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !356, metadata !DIExpression()), !dbg !357
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !357
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !358, metadata !DIExpression()), !dbg !359
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !359
  %0 = load i16, i16* %value.addr, align 2, !dbg !360
  %conv = sext i16 %0 to i32, !dbg !360
  %1 = load i16, i16* %factor.addr, align 2, !dbg !361
  %conv1 = sext i16 %1 to i32, !dbg !361
  %mul = mul nsw i32 %conv, %conv1, !dbg !362
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !363
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !364
  %shr = ashr i32 %2, 14, !dbg !365
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !366
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !367
  %cmp = icmp slt i32 %3, 0, !dbg !369
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !370

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !371
  %and = and i32 %4, 16383, !dbg !372
  %cmp3 = icmp ne i32 %and, 0, !dbg !373
  br i1 %cmp3, label %if.then, label %if.end, !dbg !374

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !375
  %add = add nsw i32 %5, 1, !dbg !377
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !378
  br label %if.end, !dbg !379

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !380
  %cmp5 = icmp slt i32 %6, 32767, !dbg !382
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !383

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !384
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !387
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !388

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !389
  %conv11 = trunc i32 %8 to i16, !dbg !391
  store i16 %conv11, i16* %retval, align 2, !dbg !392
  br label %return, !dbg !392

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !393
  br label %return, !dbg !393

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !395
  br label %return, !dbg !395

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !397
  ret i16 %9, !dbg !397
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !398 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !401, metadata !DIExpression()), !dbg !402
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !403, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !405, metadata !DIExpression()), !dbg !406
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !406
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !407, metadata !DIExpression()), !dbg !408
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !408
  %0 = load i16, i16* %value.addr, align 2, !dbg !409
  %conv = sext i16 %0 to i32, !dbg !409
  %1 = load i16, i16* %factor.addr, align 2, !dbg !410
  %conv1 = zext i16 %1 to i32, !dbg !410
  %mul = mul nsw i32 %conv, %conv1, !dbg !411
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !412
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !413
  %shr = ashr i32 %2, 16, !dbg !414
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !415
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !416
  %cmp = icmp slt i32 %3, 0, !dbg !418
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !419

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !420
  %and = and i32 %4, 32767, !dbg !421
  %cmp3 = icmp ne i32 %and, 0, !dbg !422
  br i1 %cmp3, label %if.then, label %if.else, !dbg !423

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !424
  %add = add nsw i32 %5, 1, !dbg !426
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !427
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !428
  %conv5 = trunc i32 %6 to i16, !dbg !429
  store i16 %conv5, i16* %retval, align 2, !dbg !430
  br label %return, !dbg !430

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !431
  %conv6 = trunc i32 %7 to i16, !dbg !433
  store i16 %conv6, i16* %retval, align 2, !dbg !434
  br label %return, !dbg !434

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !435
  ret i16 %8, !dbg !435
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !436 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !437, metadata !DIExpression()), !dbg !438
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !439, metadata !DIExpression()), !dbg !440
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !441, metadata !DIExpression()), !dbg !442
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !442
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !443, metadata !DIExpression()), !dbg !444
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !444
  %0 = load i16, i16* %value.addr, align 2, !dbg !445
  %conv = sext i16 %0 to i32, !dbg !445
  %1 = load i16, i16* %factor.addr, align 2, !dbg !446
  %conv1 = zext i16 %1 to i32, !dbg !446
  %mul = mul nsw i32 %conv, %conv1, !dbg !447
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !448
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !449
  %shr = ashr i32 %2, 8, !dbg !450
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !451
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !452
  %cmp = icmp slt i32 %3, 0, !dbg !454
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !455

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !456
  %and = and i32 %4, 255, !dbg !457
  %cmp3 = icmp ne i32 %and, 0, !dbg !458
  br i1 %cmp3, label %if.then, label %if.end, !dbg !459

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !460
  %add = add nsw i32 %5, 1, !dbg !462
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !463
  br label %if.end, !dbg !464

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !465
  %cmp5 = icmp slt i32 %6, 32767, !dbg !467
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !468

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !469
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !472
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !473

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !474
  %conv11 = trunc i32 %8 to i16, !dbg !476
  store i16 %conv11, i16* %retval, align 2, !dbg !477
  br label %return, !dbg !477

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !478
  br label %return, !dbg !478

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !480
  br label %return, !dbg !480

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !482
  ret i16 %9, !dbg !482
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !483 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !486, metadata !DIExpression()), !dbg !487
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !488, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !490, metadata !DIExpression()), !dbg !491
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !491
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !492, metadata !DIExpression()), !dbg !493
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !493
  %0 = load i16, i16* %value.addr, align 2, !dbg !494
  %conv = sext i16 %0 to i32, !dbg !494
  %1 = load i8, i8* %factor.addr, align 1, !dbg !495
  %conv1 = zext i8 %1 to i32, !dbg !495
  %mul = mul nsw i32 %conv, %conv1, !dbg !496
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !497
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !498
  %shr = ashr i32 %2, 8, !dbg !499
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !500
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !501
  %cmp = icmp slt i32 %3, 0, !dbg !503
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !504

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !505
  %and = and i32 %4, 255, !dbg !506
  %cmp3 = icmp ne i32 %and, 0, !dbg !507
  br i1 %cmp3, label %if.then, label %if.else, !dbg !508

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !509
  %add = add nsw i32 %5, 1, !dbg !511
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !512
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !513
  %conv5 = trunc i32 %6 to i16, !dbg !513
  store i16 %conv5, i16* %retval, align 2, !dbg !514
  br label %return, !dbg !514

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !515
  %conv6 = trunc i32 %7 to i16, !dbg !515
  store i16 %conv6, i16* %retval, align 2, !dbg !517
  br label %return, !dbg !517

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !518
  ret i16 %8, !dbg !518
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !519 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !520, metadata !DIExpression()), !dbg !521
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !522, metadata !DIExpression()), !dbg !523
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !524, metadata !DIExpression()), !dbg !525
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !525
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !527
  %0 = load i16, i16* %value.addr, align 2, !dbg !528
  %conv = sext i16 %0 to i32, !dbg !528
  %1 = load i8, i8* %factor.addr, align 1, !dbg !529
  %conv1 = zext i8 %1 to i32, !dbg !529
  %mul = mul nsw i32 %conv, %conv1, !dbg !530
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !531
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !532
  %shr = ashr i32 %2, 7, !dbg !533
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !534
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !535
  %cmp = icmp slt i32 %3, 0, !dbg !537
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !538

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !539
  %and = and i32 %4, 127, !dbg !540
  %cmp3 = icmp ne i32 %and, 0, !dbg !541
  br i1 %cmp3, label %if.then, label %if.end, !dbg !542

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !543
  %add = add nsw i32 %5, 1, !dbg !545
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !546
  br label %if.end, !dbg !547

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !548
  %cmp5 = icmp slt i32 %6, 32767, !dbg !550
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !551

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !552
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !555
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !556

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !557
  %conv11 = trunc i32 %8 to i16, !dbg !559
  store i16 %conv11, i16* %retval, align 2, !dbg !560
  br label %return, !dbg !560

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !561
  br label %return, !dbg !561

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !563
  br label %return, !dbg !563

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !565
  ret i16 %9, !dbg !565
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !566 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !567, metadata !DIExpression()), !dbg !568
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !569, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !571, metadata !DIExpression()), !dbg !572
  store i32 0, i32* %s32MulTemp, align 4, !dbg !572
  %0 = load i16, i16* %value.addr, align 2, !dbg !573
  %conv = sext i16 %0 to i32, !dbg !573
  %1 = load i16, i16* %factor.addr, align 2, !dbg !574
  %conv1 = zext i16 %1 to i32, !dbg !574
  %mul = mul nsw i32 %conv, %conv1, !dbg !575
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !576
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !577
  %cmp = icmp slt i32 %2, 32767, !dbg !579
  br i1 %cmp, label %if.then, label %if.else7, !dbg !580

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !581
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !584
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !585

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !586
  %conv6 = trunc i32 %4 to i16, !dbg !588
  store i16 %conv6, i16* %retval, align 2, !dbg !589
  br label %return, !dbg !589

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !590
  br label %return, !dbg !590

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !592
  br label %return, !dbg !592

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !594
  ret i16 %5, !dbg !594
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !595 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !598, metadata !DIExpression()), !dbg !599
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !600, metadata !DIExpression()), !dbg !601
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !602, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !604, metadata !DIExpression()), !dbg !605
  store i32 0, i32* %s32MulTemp, align 4, !dbg !605
  %0 = load i16, i16* %value.addr, align 2, !dbg !606
  %conv = sext i16 %0 to i32, !dbg !606
  %1 = load i16, i16* %factor.addr, align 2, !dbg !607
  %conv1 = zext i16 %1 to i32, !dbg !607
  %mul = mul nsw i32 %conv, %conv1, !dbg !608
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !609
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !610
  %3 = load i32, i32* %count.addr, align 4, !dbg !611
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !612
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !612
  %div = sdiv i32 %2, %3, !dbg !612, !klee.check.div !270
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !613
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !614
  %conv2 = trunc i32 %4 to i16, !dbg !615
  ret i16 %conv2, !dbg !616
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !617 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !620, metadata !DIExpression()), !dbg !621
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !622, metadata !DIExpression()), !dbg !623
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !624, metadata !DIExpression()), !dbg !625
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !626, metadata !DIExpression()), !dbg !627
  store i32 0, i32* %s32MulTemp, align 4, !dbg !627
  %0 = load i16, i16* %value.addr, align 2, !dbg !628
  %conv = sext i16 %0 to i32, !dbg !628
  %1 = load i16, i16* %factor.addr, align 2, !dbg !629
  %conv1 = zext i16 %1 to i32, !dbg !629
  %mul = mul nsw i32 %conv, %conv1, !dbg !630
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !631
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !632
  %3 = load i16, i16* %count.addr, align 2, !dbg !633
  %conv2 = zext i16 %3 to i32, !dbg !633
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !634
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !634
  %div = sdiv i32 %2, %conv2, !dbg !634, !klee.check.div !270
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !635
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !636
  %cmp = icmp slt i32 %4, 32767, !dbg !638
  br i1 %cmp, label %if.then, label %if.else8, !dbg !639

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !640
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !643
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !644

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !645
  %conv7 = trunc i32 %6 to i16, !dbg !647
  store i16 %conv7, i16* %retval, align 2, !dbg !648
  br label %return, !dbg !648

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !649
  br label %return, !dbg !649

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !651
  br label %return, !dbg !651

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !653
  ret i16 %7, !dbg !653
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !654 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !655, metadata !DIExpression()), !dbg !656
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !657, metadata !DIExpression()), !dbg !658
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !659, metadata !DIExpression()), !dbg !660
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !660
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !661, metadata !DIExpression()), !dbg !662
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !662
  %0 = load i16, i16* %value.addr, align 2, !dbg !663
  %conv = sext i16 %0 to i32, !dbg !663
  %1 = load i16, i16* %factor.addr, align 2, !dbg !664
  %conv1 = zext i16 %1 to i32, !dbg !664
  %mul = mul nsw i32 %conv, %conv1, !dbg !665
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !666
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !667
  %shr = ashr i32 %2, 16, !dbg !668
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !669
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !670
  %cmp = icmp slt i32 %3, 0, !dbg !672
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !673

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !674
  %and = and i32 %4, 65535, !dbg !675
  %cmp3 = icmp ne i32 %and, 0, !dbg !676
  br i1 %cmp3, label %if.then, label %if.else, !dbg !677

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !678
  %add = add nsw i32 %5, 1, !dbg !680
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !681
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !682
  %conv5 = trunc i32 %6 to i16, !dbg !683
  store i16 %conv5, i16* %retval, align 2, !dbg !684
  br label %return, !dbg !684

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !685
  %conv6 = trunc i32 %7 to i16, !dbg !687
  store i16 %conv6, i16* %retval, align 2, !dbg !688
  br label %return, !dbg !688

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !689
  ret i16 %8, !dbg !689
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !690 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !691, metadata !DIExpression()), !dbg !692
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !693, metadata !DIExpression()), !dbg !694
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !695, metadata !DIExpression()), !dbg !696
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !696
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !697, metadata !DIExpression()), !dbg !698
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !698
  %0 = load i16, i16* %value.addr, align 2, !dbg !699
  %conv = sext i16 %0 to i32, !dbg !699
  %1 = load i16, i16* %factor.addr, align 2, !dbg !700
  %conv1 = zext i16 %1 to i32, !dbg !700
  %mul = mul nsw i32 %conv, %conv1, !dbg !701
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !702
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !703
  %shr = ashr i32 %2, 15, !dbg !704
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !705
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !706
  %cmp = icmp slt i32 %3, 0, !dbg !708
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !709

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !710
  %and = and i32 %4, 32767, !dbg !711
  %cmp3 = icmp ne i32 %and, 0, !dbg !712
  br i1 %cmp3, label %if.then, label %if.end, !dbg !713

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !714
  %add = add nsw i32 %5, 1, !dbg !716
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !717
  br label %if.end, !dbg !718

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !719
  %cmp5 = icmp slt i32 %6, 32767, !dbg !721
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !722

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !723
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !726
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !727

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !728
  %conv11 = trunc i32 %8 to i16, !dbg !730
  store i16 %conv11, i16* %retval, align 2, !dbg !731
  br label %return, !dbg !731

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !732
  br label %return, !dbg !732

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !734
  br label %return, !dbg !734

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !736
  ret i16 %9, !dbg !736
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !737 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !740, metadata !DIExpression()), !dbg !741
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !742, metadata !DIExpression()), !dbg !743
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !744, metadata !DIExpression()), !dbg !745
  store i32 0, i32* %u32MulTemp, align 4, !dbg !745
  %0 = load i16, i16* %value.addr, align 2, !dbg !746
  %conv = zext i16 %0 to i32, !dbg !746
  %1 = load i16, i16* %factor.addr, align 2, !dbg !747
  %conv1 = zext i16 %1 to i32, !dbg !747
  %mul = mul nsw i32 %conv, %conv1, !dbg !748
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !749
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !750
  %shr = lshr i32 %2, 8, !dbg !751
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !752
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !753
  %cmp = icmp ult i32 %3, 32767, !dbg !755
  br i1 %cmp, label %if.then, label %if.else, !dbg !756

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !757
  %conv3 = trunc i32 %4 to i16, !dbg !759
  store i16 %conv3, i16* %retval, align 2, !dbg !760
  br label %return, !dbg !760

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !761
  br label %return, !dbg !761

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !763
  ret i16 %5, !dbg !763
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !764 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !767, metadata !DIExpression()), !dbg !768
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !769, metadata !DIExpression()), !dbg !770
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !771, metadata !DIExpression()), !dbg !772
  store i32 0, i32* %s32MulTemp, align 4, !dbg !772
  %0 = load i16, i16* %value.addr, align 2, !dbg !773
  %conv = sext i16 %0 to i32, !dbg !773
  %1 = load i16, i16* %factor.addr, align 2, !dbg !774
  %conv1 = zext i16 %1 to i32, !dbg !774
  %mul = mul nsw i32 %conv, %conv1, !dbg !775
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !776
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !777
  ret i32 %2, !dbg !778
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !779 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !782, metadata !DIExpression()), !dbg !783
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !784, metadata !DIExpression()), !dbg !785
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !786, metadata !DIExpression()), !dbg !787
  store i32 0, i32* %s32Temp1, align 4, !dbg !787
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !788, metadata !DIExpression()), !dbg !789
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !789
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !790, metadata !DIExpression()), !dbg !791
  store i32 0, i32* %s32Factor, align 4, !dbg !791
  %0 = load i16, i16* %factor.addr, align 2, !dbg !792
  %conv = zext i16 %0 to i32, !dbg !792
  store i32 %conv, i32* %s32Factor, align 4, !dbg !793
  %1 = load i16, i16* %factor.addr, align 2, !dbg !794
  %conv1 = zext i16 %1 to i32, !dbg !794
  %cmp = icmp ne i32 %conv1, 0, !dbg !796
  br i1 %cmp, label %if.then, label %if.else19, !dbg !797

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !798
  %cmp3 = icmp slt i32 %2, 0, !dbg !801
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !802

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !803
  %4 = load i32, i32* %s32Factor, align 4, !dbg !805
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !806
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !806
  %div = sdiv i32 %3, %4, !dbg !806, !klee.check.div !270
  store i32 %div, i32* %s32Temp1, align 4, !dbg !807
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !808
  %6 = load i32, i32* %value.addr, align 4, !dbg !810
  %cmp6 = icmp sge i32 %5, %6, !dbg !811
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !812

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !813
  br label %return, !dbg !813

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !815
  %8 = load i16, i16* %factor.addr, align 2, !dbg !817
  %conv9 = zext i16 %8 to i32, !dbg !817
  %mul = mul nsw i32 %7, %conv9, !dbg !818
  store i32 %mul, i32* %retval, align 4, !dbg !819
  br label %return, !dbg !819

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !820
  %conv11 = zext i16 %9 to i32, !dbg !820
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !823
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !823
  %div12 = udiv i32 2147483647, %conv11, !dbg !823, !klee.check.div !270
  %10 = load i32, i32* %value.addr, align 4, !dbg !824
  %cmp13 = icmp ule i32 %div12, %10, !dbg !825
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !826

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !827
  br label %return, !dbg !827

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !829
  %12 = load i16, i16* %factor.addr, align 2, !dbg !831
  %conv17 = zext i16 %12 to i32, !dbg !831
  %mul18 = mul nsw i32 %11, %conv17, !dbg !832
  store i32 %mul18, i32* %retval, align 4, !dbg !833
  br label %return, !dbg !833

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !834
  br label %return, !dbg !834

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !836
  ret i32 %13, !dbg !836
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !837 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !840, metadata !DIExpression()), !dbg !841
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !842, metadata !DIExpression()), !dbg !843
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !844, metadata !DIExpression()), !dbg !845
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !846, metadata !DIExpression()), !dbg !847
  store i16 0, i16* %u16MulTemp, align 2, !dbg !847
  %0 = load i8, i8* %value.addr, align 1, !dbg !848
  %conv = zext i8 %0 to i32, !dbg !848
  %1 = load i8, i8* %factor.addr, align 1, !dbg !849
  %conv1 = zext i8 %1 to i32, !dbg !849
  %mul = mul nsw i32 %conv, %conv1, !dbg !850
  %conv2 = trunc i32 %mul to i16, !dbg !848
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !851
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !852
  %conv3 = zext i16 %2 to i32, !dbg !852
  %3 = load i16, i16* %count.addr, align 2, !dbg !853
  %conv4 = zext i16 %3 to i32, !dbg !853
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !854
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !854
  %div = sdiv i32 %conv3, %conv4, !dbg !854, !klee.check.div !270
  %conv5 = trunc i32 %div to i16, !dbg !852
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !855
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !856
  %conv6 = trunc i16 %4 to i8, !dbg !857
  ret i8 %conv6, !dbg !858
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !859 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !862, metadata !DIExpression()), !dbg !863
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !864, metadata !DIExpression()), !dbg !865
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !866, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !868, metadata !DIExpression()), !dbg !869
  store i16 0, i16* %u16MulTemp, align 2, !dbg !869
  %0 = load i8, i8* %value.addr, align 1, !dbg !870
  %conv = zext i8 %0 to i32, !dbg !870
  %1 = load i8, i8* %factor.addr, align 1, !dbg !871
  %conv1 = zext i8 %1 to i32, !dbg !871
  %mul = mul nsw i32 %conv, %conv1, !dbg !872
  %conv2 = trunc i32 %mul to i16, !dbg !870
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !873
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !874
  %conv3 = zext i16 %2 to i32, !dbg !874
  %3 = load i8, i8* %count.addr, align 1, !dbg !875
  %conv4 = zext i8 %3 to i32, !dbg !875
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !876
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !876
  %div = sdiv i32 %conv3, %conv4, !dbg !876, !klee.check.div !270
  %conv5 = trunc i32 %div to i16, !dbg !874
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !877
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !878
  %conv6 = zext i16 %4 to i32, !dbg !878
  %cmp = icmp sle i32 %conv6, 255, !dbg !880
  br i1 %cmp, label %if.then, label %if.else, !dbg !881

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !882
  %conv8 = zext i16 %5 to i32, !dbg !882
  %and = and i32 %conv8, 255, !dbg !884
  %conv9 = trunc i32 %and to i8, !dbg !882
  store i8 %conv9, i8* %retval, align 1, !dbg !885
  br label %return, !dbg !885

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !886
  br label %return, !dbg !886

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !888
  ret i8 %6, !dbg !888
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !889 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !892, metadata !DIExpression()), !dbg !893
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !894, metadata !DIExpression()), !dbg !895
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !896, metadata !DIExpression()), !dbg !897
  store i16 0, i16* %u16MulTemp, align 2, !dbg !897
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !898
  %conv = zext i8 %0 to i32, !dbg !898
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !899
  %conv1 = zext i8 %1 to i32, !dbg !899
  %mul = mul nsw i32 %conv, %conv1, !dbg !900
  %conv2 = trunc i32 %mul to i16, !dbg !898
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !901
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !902
  %conv3 = zext i16 %2 to i32, !dbg !902
  %shr = ashr i32 %conv3, 8, !dbg !903
  %conv4 = trunc i32 %shr to i16, !dbg !902
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !904
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !905
  %conv5 = trunc i16 %3 to i8, !dbg !906
  ret i8 %conv5, !dbg !907
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !908 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !909, metadata !DIExpression()), !dbg !910
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !911, metadata !DIExpression()), !dbg !912
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !913, metadata !DIExpression()), !dbg !914
  store i16 0, i16* %u16MulTemp, align 2, !dbg !914
  %0 = load i8, i8* %value.addr, align 1, !dbg !915
  %conv = zext i8 %0 to i32, !dbg !915
  %1 = load i8, i8* %factor.addr, align 1, !dbg !916
  %conv1 = zext i8 %1 to i32, !dbg !916
  %mul = mul nsw i32 %conv, %conv1, !dbg !917
  %conv2 = trunc i32 %mul to i16, !dbg !915
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !918
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !919
  %conv3 = zext i16 %2 to i32, !dbg !919
  %shr = ashr i32 %conv3, 7, !dbg !920
  %conv4 = trunc i32 %shr to i16, !dbg !919
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !921
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !922
  %conv5 = zext i16 %3 to i32, !dbg !922
  %cmp = icmp slt i32 %conv5, 255, !dbg !924
  br i1 %cmp, label %if.then, label %if.else, !dbg !925

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !926
  %conv7 = trunc i16 %4 to i8, !dbg !928
  store i8 %conv7, i8* %retval, align 1, !dbg !929
  br label %return, !dbg !929

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !930
  br label %return, !dbg !930

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !932
  ret i8 %5, !dbg !932
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !933 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !936, metadata !DIExpression()), !dbg !937
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !938, metadata !DIExpression()), !dbg !939
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !940, metadata !DIExpression()), !dbg !941
  store i32 0, i32* %u32MulTemp, align 4, !dbg !941
  %0 = load i16, i16* %value.addr, align 2, !dbg !942
  %conv = zext i16 %0 to i32, !dbg !942
  %1 = load i16, i16* %factor.addr, align 2, !dbg !943
  %conv1 = zext i16 %1 to i32, !dbg !943
  %mul = mul nsw i32 %conv, %conv1, !dbg !944
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !945
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !946
  %shr = lshr i32 %2, 16, !dbg !947
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !948
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !949
  %conv2 = trunc i32 %3 to i16, !dbg !950
  ret i16 %conv2, !dbg !951
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !952 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !953, metadata !DIExpression()), !dbg !954
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !955, metadata !DIExpression()), !dbg !956
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !957, metadata !DIExpression()), !dbg !958
  store i32 0, i32* %u32MulTemp, align 4, !dbg !958
  %0 = load i16, i16* %value.addr, align 2, !dbg !959
  %conv = zext i16 %0 to i32, !dbg !959
  %1 = load i16, i16* %factor.addr, align 2, !dbg !960
  %conv1 = zext i16 %1 to i32, !dbg !960
  %mul = mul nsw i32 %conv, %conv1, !dbg !961
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !962
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !963
  %shr = lshr i32 %2, 8, !dbg !964
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !965
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !966
  %cmp = icmp ult i32 %3, 65535, !dbg !968
  br i1 %cmp, label %if.then, label %if.else, !dbg !969

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !970
  %and = and i32 %4, 65535, !dbg !972
  %conv3 = trunc i32 %and to i16, !dbg !973
  store i16 %conv3, i16* %retval, align 2, !dbg !974
  br label %return, !dbg !974

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !975
  br label %return, !dbg !975

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !977
  ret i16 %5, !dbg !977
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !978 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !981, metadata !DIExpression()), !dbg !982
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !983, metadata !DIExpression()), !dbg !984
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !985, metadata !DIExpression()), !dbg !986
  store i32 0, i32* %u32MulTemp, align 4, !dbg !986
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !987
  %conv = zext i16 %0 to i32, !dbg !987
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !988
  %conv1 = zext i8 %1 to i32, !dbg !988
  %mul = mul nsw i32 %conv, %conv1, !dbg !989
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !990
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !991
  %shr = lshr i32 %2, 8, !dbg !992
  %and = and i32 %shr, 65535, !dbg !993
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !994
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !995
  %conv2 = trunc i32 %3 to i16, !dbg !995
  ret i16 %conv2, !dbg !996
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !997 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !998, metadata !DIExpression()), !dbg !999
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !1000, metadata !DIExpression()), !dbg !1001
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1002, metadata !DIExpression()), !dbg !1003
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1003
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1004
  %conv = zext i16 %0 to i32, !dbg !1004
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1005
  %conv1 = zext i8 %1 to i32, !dbg !1005
  %mul = mul nsw i32 %conv, %conv1, !dbg !1006
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1007
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1008
  %shr = lshr i32 %2, 7, !dbg !1009
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1010
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1011
  %cmp = icmp ult i32 %3, 65535, !dbg !1013
  br i1 %cmp, label %if.then, label %if.else, !dbg !1014

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1015
  %and = and i32 %4, 65535, !dbg !1017
  %conv3 = trunc i32 %and to i16, !dbg !1018
  store i16 %conv3, i16* %retval, align 2, !dbg !1019
  br label %return, !dbg !1019

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1020
  br label %return, !dbg !1020

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1022
  ret i16 %5, !dbg !1022
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1023 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1030, metadata !DIExpression()), !dbg !1031
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1032, metadata !DIExpression()), !dbg !1033
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1033
  %0 = load i16, i16* %value.addr, align 2, !dbg !1034
  %conv = zext i16 %0 to i32, !dbg !1034
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1035
  %conv1 = zext i16 %1 to i32, !dbg !1035
  %mul = mul nsw i32 %conv, %conv1, !dbg !1036
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1037
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1038
  %3 = load i32, i32* %count.addr, align 4, !dbg !1039
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1040
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1040
  %div = udiv i32 %2, %3, !dbg !1040, !klee.check.div !270
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1041
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1042
  %and = and i32 %4, 65535, !dbg !1043
  %conv2 = trunc i32 %and to i16, !dbg !1044
  ret i16 %conv2, !dbg !1045
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1046 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1056
  %0 = load i16, i16* %value.addr, align 2, !dbg !1057
  %conv = zext i16 %0 to i32, !dbg !1057
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1058
  %conv1 = zext i16 %1 to i32, !dbg !1058
  %mul = mul nsw i32 %conv, %conv1, !dbg !1059
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1060
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1061
  %3 = load i16, i16* %count.addr, align 2, !dbg !1062
  %conv2 = zext i16 %3 to i32, !dbg !1062
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1063
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1063
  %div = udiv i32 %2, %conv2, !dbg !1063, !klee.check.div !270
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1064
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1065
  %cmp = icmp ule i32 %4, 65535, !dbg !1067
  br i1 %cmp, label %if.then, label %if.else, !dbg !1068

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1069
  %and = and i32 %5, 65535, !dbg !1071
  %conv4 = trunc i32 %and to i16, !dbg !1072
  store i16 %conv4, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1074
  br label %return, !dbg !1074

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1076
  ret i16 %6, !dbg !1076
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1077 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1078, metadata !DIExpression()), !dbg !1079
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1080, metadata !DIExpression()), !dbg !1081
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1082, metadata !DIExpression()), !dbg !1083
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1083
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1084
  %conv = zext i16 %0 to i32, !dbg !1084
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1085
  %conv1 = zext i16 %1 to i32, !dbg !1085
  %mul = mul nsw i32 %conv, %conv1, !dbg !1086
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1087
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1088
  %shr = lshr i32 %2, 16, !dbg !1089
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1090
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1091
  %and = and i32 65535, %3, !dbg !1092
  %conv2 = trunc i32 %and to i16, !dbg !1093
  ret i16 %conv2, !dbg !1094
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1095 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1096, metadata !DIExpression()), !dbg !1097
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1098, metadata !DIExpression()), !dbg !1099
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1100, metadata !DIExpression()), !dbg !1101
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1101
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1102
  %conv = zext i16 %0 to i32, !dbg !1102
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1103
  %conv1 = zext i16 %1 to i32, !dbg !1103
  %mul = mul nsw i32 %conv, %conv1, !dbg !1104
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1105
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1106
  %shr = lshr i32 %2, 15, !dbg !1107
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1108
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1109
  %cmp = icmp ule i32 %3, 65535, !dbg !1111
  br i1 %cmp, label %if.then, label %if.else, !dbg !1112

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1113
  %and = and i32 %4, 65535, !dbg !1115
  %conv3 = trunc i32 %and to i16, !dbg !1116
  store i16 %conv3, i16* %retval, align 2, !dbg !1117
  br label %return, !dbg !1117

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1118
  br label %return, !dbg !1118

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1120
  ret i16 %5, !dbg !1120
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1121 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1124, metadata !DIExpression()), !dbg !1125
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1126, metadata !DIExpression()), !dbg !1127
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1128, metadata !DIExpression()), !dbg !1129
  store i32 0, i32* %u32Temp1, align 4, !dbg !1129
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1130
  %conv = zext i16 %0 to i32, !dbg !1130
  %cmp = icmp sgt i32 %conv, 0, !dbg !1132
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1133

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1134
  %conv2 = zext i16 %1 to i32, !dbg !1134
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1136
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1136
  %div = udiv i32 -1, %conv2, !dbg !1136, !klee.check.div !270
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1137
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1138
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1140
  %cmp3 = icmp ult i32 %2, %3, !dbg !1141
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1142

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1143
  br label %return, !dbg !1143

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1145
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1147
  %conv6 = zext i16 %5 to i32, !dbg !1147
  %mul = mul i32 %4, %conv6, !dbg !1148
  store i32 %mul, i32* %retval, align 4, !dbg !1149
  br label %return, !dbg !1149

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1150
  br label %return, !dbg !1150

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1152
  ret i32 %6, !dbg !1152
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1153 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1158, metadata !DIExpression()), !dbg !1159
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1160, metadata !DIExpression()), !dbg !1161
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1162, metadata !DIExpression()), !dbg !1163
  store i32 0, i32* %u32Temp1, align 4, !dbg !1163
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1164, metadata !DIExpression()), !dbg !1165
  store i32 0, i32* %u32Temp2, align 4, !dbg !1165
  %0 = load i32, i32* %value.addr, align 4, !dbg !1166
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1167
  %conv = zext i16 %1 to i32, !dbg !1167
  %mul = mul i32 %0, %conv, !dbg !1168
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1169
  %2 = load i32, i32* %value.addr, align 4, !dbg !1170
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1171
  %conv1 = zext i16 %3 to i32, !dbg !1171
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1172
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1173
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1174
  %5 = load i32, i32* %count.addr, align 4, !dbg !1175
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1176
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1176
  %shr = lshr i32 %4, %5, !dbg !1176, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1177
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1178
  %7 = load i32, i32* %count.addr, align 4, !dbg !1179
  %sub = sub i32 32, %7, !dbg !1180
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1181
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1181
  %shl = shl i32 %6, %sub, !dbg !1181, !klee.check.shift !270
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1182
  %or = or i32 %8, %shl, !dbg !1182
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1182
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1183
  %10 = load i32, i32* %count.addr, align 4, !dbg !1185
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1186
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1186
  %shr2 = lshr i32 %9, %10, !dbg !1186, !klee.check.shift !270
  %cmp = icmp eq i32 %shr2, 0, !dbg !1187
  br i1 %cmp, label %if.then, label %if.else, !dbg !1188

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1189
  store i32 %11, i32* %retval, align 4, !dbg !1191
  br label %return, !dbg !1191

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1192
  br label %return, !dbg !1192

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1194
  ret i32 %12, !dbg !1194
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1195 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1198, metadata !DIExpression()), !dbg !1199
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1200, metadata !DIExpression()), !dbg !1201
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1202, metadata !DIExpression()), !dbg !1203
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1204, metadata !DIExpression()), !dbg !1205
  store i16 0, i16* %s16Temp1, align 2, !dbg !1205
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1206
  %conv = zext i8 %0 to i32, !dbg !1206
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1207
  %conv1 = zext i8 %1 to i32, !dbg !1207
  %sub = sub nsw i32 %conv, %conv1, !dbg !1208
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1209
  %conv2 = sext i8 %2 to i32, !dbg !1209
  %mul = mul nsw i32 %sub, %conv2, !dbg !1210
  %div = sdiv i32 %mul, 32, !dbg !1211
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1212
  %conv3 = zext i8 %3 to i32, !dbg !1212
  %add = add nsw i32 %div, %conv3, !dbg !1213
  %conv4 = trunc i32 %add to i16, !dbg !1214
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1215
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1216
  %conv5 = sext i16 %4 to i32, !dbg !1216
  %cmp = icmp slt i32 %conv5, 255, !dbg !1218
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1219

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1220
  %conv7 = sext i16 %5 to i32, !dbg !1220
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1223
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1224

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1225
  %conv11 = trunc i16 %6 to i8, !dbg !1227
  store i8 %conv11, i8* %retval, align 1, !dbg !1228
  br label %return, !dbg !1228

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1229
  br label %return, !dbg !1229

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1231
  br label %return, !dbg !1231

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1233
  ret i8 %7, !dbg !1233
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1234 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1237, metadata !DIExpression()), !dbg !1238
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1239, metadata !DIExpression()), !dbg !1240
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1241, metadata !DIExpression()), !dbg !1242
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1243, metadata !DIExpression()), !dbg !1244
  store i32 0, i32* %s32Temp1, align 4, !dbg !1244
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1245
  %conv = zext i16 %0 to i32, !dbg !1245
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1246
  %conv1 = zext i16 %1 to i32, !dbg !1246
  %sub = sub nsw i32 %conv, %conv1, !dbg !1247
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1248
  %conv2 = sext i8 %2 to i32, !dbg !1248
  %mul = mul nsw i32 %sub, %conv2, !dbg !1249
  %div = sdiv i32 %mul, 32, !dbg !1250
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1251
  %conv3 = zext i16 %3 to i32, !dbg !1251
  %add = add nsw i32 %div, %conv3, !dbg !1252
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1253
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1254
  %cmp = icmp slt i32 %4, 65535, !dbg !1256
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1257

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1258
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1261
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1262

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1263
  %conv8 = trunc i32 %6 to i16, !dbg !1265
  store i16 %conv8, i16* %retval, align 2, !dbg !1266
  br label %return, !dbg !1266

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1267
  br label %return, !dbg !1267

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1269
  br label %return, !dbg !1269

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1271
  ret i16 %7, !dbg !1271
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1272 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1273, metadata !DIExpression()), !dbg !1274
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1275, metadata !DIExpression()), !dbg !1276
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1277, metadata !DIExpression()), !dbg !1278
  store i32 0, i32* %u32Temp1, align 4, !dbg !1278
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1279
  %conv = zext i16 %0 to i32, !dbg !1279
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1280
  %conv1 = zext i16 %1 to i32, !dbg !1280
  %mul = mul nsw i32 %conv, %conv1, !dbg !1281
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1282
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1283
  %cmp = icmp ule i32 %2, 65535, !dbg !1285
  br i1 %cmp, label %if.then, label %if.else, !dbg !1286

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1287
  %and = and i32 %3, 65535, !dbg !1289
  %conv3 = trunc i32 %and to i16, !dbg !1290
  store i16 %conv3, i16* %retval, align 2, !dbg !1291
  br label %return, !dbg !1291

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1292
  br label %return, !dbg !1292

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1294
  ret i16 %4, !dbg !1294
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1295 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1298, metadata !DIExpression()), !dbg !1299
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1300, metadata !DIExpression()), !dbg !1301
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1302, metadata !DIExpression()), !dbg !1303
  store i32 0, i32* %u32Temp1, align 4, !dbg !1303
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1304
  %conv = zext i16 %0 to i32, !dbg !1304
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1305
  %conv1 = zext i16 %1 to i32, !dbg !1305
  %mul = mul nsw i32 %conv, %conv1, !dbg !1306
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1307
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1308
  ret i32 %2, !dbg !1309
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1310 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1313, metadata !DIExpression()), !dbg !1314
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1315, metadata !DIExpression()), !dbg !1316
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1317, metadata !DIExpression()), !dbg !1318
  store i32 0, i32* %s32Temp1, align 4, !dbg !1318
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1319
  %conv = sext i16 %0 to i32, !dbg !1319
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1320
  %conv1 = sext i16 %1 to i32, !dbg !1320
  %mul = mul nsw i32 %conv, %conv1, !dbg !1321
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1322
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1323
  ret i32 %2, !dbg !1324
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1325 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1332, metadata !DIExpression()), !dbg !1333
  store i32 0, i32* %s32Temp1, align 4, !dbg !1333
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1334
  %cmp = icmp sgt i32 %0, 0, !dbg !1336
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1337

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1338
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1340
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1340
  %div = udiv i32 -1, %1, !dbg !1340, !klee.check.div !270
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1341
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1342
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1344
  %cmp1 = icmp ult i32 %2, %3, !dbg !1345
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1346

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1347
  br label %return, !dbg !1347

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1349
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1351
  %mul = mul i32 %4, %5, !dbg !1352
  store i32 %mul, i32* %retval, align 4, !dbg !1353
  br label %return, !dbg !1353

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1354
  br label %return, !dbg !1354

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1356
  ret i32 %6, !dbg !1356
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1357 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1360, metadata !DIExpression()), !dbg !1361
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1362, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1364, metadata !DIExpression()), !dbg !1365
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1366, metadata !DIExpression()), !dbg !1367
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1368, metadata !DIExpression()), !dbg !1369
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1370, metadata !DIExpression()), !dbg !1371
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1372
  %cmp = icmp slt i32 %0, 0, !dbg !1374
  br i1 %cmp, label %if.then, label %if.else, !dbg !1375

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1376
  %sub = sub nsw i32 0, %1, !dbg !1377
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1378
  br label %if.end, !dbg !1379

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1380
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1381
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1382
  %cmp1 = icmp slt i32 %3, 0, !dbg !1384
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1385

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1386
  %sub3 = sub nsw i32 0, %4, !dbg !1387
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1388
  br label %if.end5, !dbg !1389

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1390
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1391
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1392
  %cmp6 = icmp slt i32 %6, 0, !dbg !1394
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1395
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1395

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1396
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1397
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1398
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1398

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1399
  br label %if.end13, !dbg !1400

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1401
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1402
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1403
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1404
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1405
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1406
  %conv = zext i8 %12 to i32, !dbg !1406
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1408
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1409

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1410
  br label %return, !dbg !1410

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1412
  store i32 %13, i32* %retval, align 4, !dbg !1414
  br label %return, !dbg !1414

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1415
  ret i32 %14, !dbg !1415
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1416 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1419, metadata !DIExpression()), !dbg !1420
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1421, metadata !DIExpression()), !dbg !1422
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1423, metadata !DIExpression()), !dbg !1424
  store i32 0, i32* %u32Temp1, align 4, !dbg !1424
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1425
  %cmp = icmp ne i32 %0, 0, !dbg !1427
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1428

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1429
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1431
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1431
  %div = udiv i32 -1, %1, !dbg !1431, !klee.check.div !270
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1432
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1433
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1435
  %cmp1 = icmp ult i32 %2, %3, !dbg !1436
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1437

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1440
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1442
  %mul = mul i32 %4, %5, !dbg !1443
  store i32 %mul, i32* %retval, align 4, !dbg !1444
  br label %return, !dbg !1444

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1445
  br label %return, !dbg !1445

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1447
  ret i32 %6, !dbg !1447
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1448 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1449, metadata !DIExpression()), !dbg !1450
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1451, metadata !DIExpression()), !dbg !1452
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1453, metadata !DIExpression()), !dbg !1454
  store i32 0, i32* %u32Temp1, align 4, !dbg !1454
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1455, metadata !DIExpression()), !dbg !1456
  store i32 0, i32* %u32Temp2, align 4, !dbg !1456
  %0 = load i32, i32* %value.addr, align 4, !dbg !1457
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1458
  %conv = zext i16 %1 to i32, !dbg !1458
  %mul = mul i32 %0, %conv, !dbg !1459
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1460
  %2 = load i32, i32* %value.addr, align 4, !dbg !1461
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1462
  %conv1 = zext i16 %3 to i32, !dbg !1462
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1463
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1464
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1465
  %shr = lshr i32 %4, 16, !dbg !1466
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1467
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1468
  %shl = shl i32 %5, 16, !dbg !1469
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1470
  %or = or i32 %6, %shl, !dbg !1470
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1470
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1471
  ret i32 %7, !dbg !1472
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1473 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1474, metadata !DIExpression()), !dbg !1475
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1476, metadata !DIExpression()), !dbg !1477
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1478, metadata !DIExpression()), !dbg !1479
  store i32 0, i32* %u32Temp1, align 4, !dbg !1479
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1480, metadata !DIExpression()), !dbg !1481
  store i32 0, i32* %u32Temp2, align 4, !dbg !1481
  %0 = load i32, i32* %value.addr, align 4, !dbg !1482
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1483
  %conv = zext i16 %1 to i32, !dbg !1483
  %mul = mul i32 %0, %conv, !dbg !1484
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1485
  %2 = load i32, i32* %value.addr, align 4, !dbg !1486
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1487
  %conv1 = zext i16 %3 to i32, !dbg !1487
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1488
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1489
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1490
  %shr = lshr i32 %4, 15, !dbg !1491
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1492
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1493
  %shl = shl i32 %5, 17, !dbg !1494
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1495
  %or = or i32 %6, %shl, !dbg !1495
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1495
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1496
  %shr2 = lshr i32 %7, 15, !dbg !1498
  %cmp = icmp eq i32 %shr2, 0, !dbg !1499
  br i1 %cmp, label %if.then, label %if.else, !dbg !1500

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1501
  store i32 %8, i32* %retval, align 4, !dbg !1503
  br label %return, !dbg !1503

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1504
  br label %return, !dbg !1504

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1506
  ret i32 %9, !dbg !1506
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1507 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1510, metadata !DIExpression()), !dbg !1511
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1512, metadata !DIExpression()), !dbg !1513
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1514, metadata !DIExpression()), !dbg !1515
  store i32 0, i32* %u32Temp1, align 4, !dbg !1515
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1516, metadata !DIExpression()), !dbg !1517
  store i32 0, i32* %u32Temp2, align 4, !dbg !1517
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1518
  %conv = sext i16 %0 to i32, !dbg !1518
  %cmp = icmp sgt i32 %conv, 0, !dbg !1520
  br i1 %cmp, label %if.then, label %if.else, !dbg !1521

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1522
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1524
  %conv2 = sext i16 %2 to i32, !dbg !1524
  %mul = mul i32 %1, %conv2, !dbg !1525
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1526
  %3 = load i32, i32* %value.addr, align 4, !dbg !1527
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1528
  %conv3 = sext i16 %4 to i32, !dbg !1528
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1529
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1530
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1531
  %shr = lshr i32 %5, 15, !dbg !1532
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1533
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1534
  %shl = shl i32 %6, 17, !dbg !1535
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1536
  %or = or i32 %7, %shl, !dbg !1536
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1536
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1537
  store i32 %8, i32* %retval, align 4, !dbg !1538
  br label %return, !dbg !1538

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1539
  br label %return, !dbg !1539

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1541
  ret i32 %9, !dbg !1541
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1542 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1543, metadata !DIExpression()), !dbg !1544
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1545, metadata !DIExpression()), !dbg !1546
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1547, metadata !DIExpression()), !dbg !1548
  store i32 0, i32* %u32Temp1, align 4, !dbg !1548
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1549, metadata !DIExpression()), !dbg !1550
  store i32 0, i32* %u32Temp2, align 4, !dbg !1550
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1551
  %conv = sext i16 %0 to i32, !dbg !1551
  %cmp = icmp sle i32 %conv, 0, !dbg !1553
  br i1 %cmp, label %if.then, label %if.else, !dbg !1554

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1555
  br label %return, !dbg !1555

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1557
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1559
  %conv2 = sext i16 %2 to i32, !dbg !1559
  %mul = mul i32 %1, %conv2, !dbg !1560
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1561
  %3 = load i32, i32* %value.addr, align 4, !dbg !1562
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1563
  %conv3 = sext i16 %4 to i32, !dbg !1563
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1564
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1565
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1566
  %shr = lshr i32 %5, 14, !dbg !1567
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1568
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1569
  %shl = shl i32 %6, 18, !dbg !1570
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1571
  %or = or i32 %7, %shl, !dbg !1571
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1571
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1572
  %shr4 = lshr i32 %8, 14, !dbg !1574
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1575
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1576

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1577
  store i32 %9, i32* %retval, align 4, !dbg !1579
  br label %return, !dbg !1579

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1580
  br label %return, !dbg !1580

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1582
  ret i32 %10, !dbg !1582
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1583 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1586, metadata !DIExpression()), !dbg !1587
  %0 = load i32, i32* %value.addr, align 4, !dbg !1588
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1589
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1590
  ret i32 %call, !dbg !1591
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1592 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1595, metadata !DIExpression()), !dbg !1596
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1597, metadata !DIExpression()), !dbg !1598
  store i32 0, i32* %u32Temp1, align 4, !dbg !1598
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1599, metadata !DIExpression()), !dbg !1600
  store i32 0, i32* %u32Temp2, align 4, !dbg !1600
  %0 = load i32, i32* %value.addr, align 4, !dbg !1601
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1602
  %mul = mul i32 %0, %1, !dbg !1603
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1604
  %2 = load i32, i32* %value.addr, align 4, !dbg !1605
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1606
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1607
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1608
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1609
  %shr = lshr i32 %4, 31, !dbg !1610
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1611
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1612
  %shl = shl i32 %5, 1, !dbg !1613
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1614
  %or = or i32 %6, %shl, !dbg !1614
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1614
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1615
  %shr1 = lshr i32 %7, 31, !dbg !1617
  %cmp = icmp eq i32 %shr1, 0, !dbg !1618
  br i1 %cmp, label %if.then, label %if.else, !dbg !1619

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1620
  store i32 %8, i32* %retval, align 4, !dbg !1622
  br label %return, !dbg !1622

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1623
  br label %return, !dbg !1623

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1625
  ret i32 %9, !dbg !1625
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1626 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1627, metadata !DIExpression()), !dbg !1628
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1629, metadata !DIExpression()), !dbg !1630
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1631, metadata !DIExpression()), !dbg !1632
  store i32 0, i32* %u32Temp1, align 4, !dbg !1632
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1633, metadata !DIExpression()), !dbg !1634
  store i32 0, i32* %u32Temp2, align 4, !dbg !1634
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1635
  %cmp = icmp sgt i32 %0, 0, !dbg !1637
  br i1 %cmp, label %if.then, label %if.else, !dbg !1638

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1639
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1641
  %mul = mul i32 %1, %2, !dbg !1642
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1643
  %3 = load i32, i32* %value.addr, align 4, !dbg !1644
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1645
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1646
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1647
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1648
  %shr = lshr i32 %5, 31, !dbg !1649
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1650
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1651
  %shl = shl i32 %6, 1, !dbg !1652
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1653
  %or = or i32 %7, %shl, !dbg !1653
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1653
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1654
  store i32 %8, i32* %retval, align 4, !dbg !1655
  br label %return, !dbg !1655

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1656
  br label %return, !dbg !1656

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1658
  ret i32 %9, !dbg !1658
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1659 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1660, metadata !DIExpression()), !dbg !1661
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1662, metadata !DIExpression()), !dbg !1663
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1664, metadata !DIExpression()), !dbg !1665
  store i32 0, i32* %u32Temp1, align 4, !dbg !1665
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1666, metadata !DIExpression()), !dbg !1667
  store i32 0, i32* %u32Temp2, align 4, !dbg !1667
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1668
  %cmp = icmp sle i32 %0, 0, !dbg !1670
  br i1 %cmp, label %if.then, label %if.else, !dbg !1671

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1672
  br label %return, !dbg !1672

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1674
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1676
  %mul = mul i32 %1, %2, !dbg !1677
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1678
  %3 = load i32, i32* %value.addr, align 4, !dbg !1679
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1680
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1681
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1682
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1683
  %shr = lshr i32 %5, 30, !dbg !1684
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1685
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1686
  %shl = shl i32 %6, 2, !dbg !1687
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1688
  %or = or i32 %7, %shl, !dbg !1688
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1688
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1689
  %shr1 = lshr i32 %8, 30, !dbg !1691
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1692
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1693

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1694
  store i32 %9, i32* %retval, align 4, !dbg !1696
  br label %return, !dbg !1696

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1697
  br label %return, !dbg !1697

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1699
  ret i32 %10, !dbg !1699
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1700 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1703, metadata !DIExpression()), !dbg !1704
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1705, metadata !DIExpression()), !dbg !1706
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1707, metadata !DIExpression()), !dbg !1708
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1708
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1709
  %cmp = icmp slt i32 %0, 0, !dbg !1711
  br i1 %cmp, label %if.then, label %if.end, !dbg !1712

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1713
  %sub = sub nsw i32 0, %1, !dbg !1715
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1716
  br label %if.end, !dbg !1717

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1718
  %cmp1 = icmp ne i32 %2, 0, !dbg !1720
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1721

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1722
  %cmp3 = icmp sle i32 %3, 0, !dbg !1725
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1726

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1727
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1730
  %div = udiv i32 -2147483648, %4, !dbg !1730, !klee.check.div !270
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1731
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1732
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1733

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1734
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1736
  %mul = mul i32 %6, %7, !dbg !1737
  store i32 %mul, i32* %retval, align 4, !dbg !1738
  br label %return, !dbg !1738

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1739
  br label %return, !dbg !1739

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1741
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1744
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1744
  %div8 = sdiv i32 2147483647, %8, !dbg !1744, !klee.check.div !270
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1745
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1746
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1747

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1748
  br label %return, !dbg !1748

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1750
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1752
  %mul12 = mul i32 %10, %11, !dbg !1753
  store i32 %mul12, i32* %retval, align 4, !dbg !1754
  br label %return, !dbg !1754

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1755
  br label %return, !dbg !1755

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1757
  ret i32 %12, !dbg !1757
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1758 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1759, metadata !DIExpression()), !dbg !1760
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1761, metadata !DIExpression()), !dbg !1762
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1763, metadata !DIExpression()), !dbg !1764
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1765, metadata !DIExpression()), !dbg !1766
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1767, metadata !DIExpression()), !dbg !1768
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1769, metadata !DIExpression()), !dbg !1770
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1771
  %cmp = icmp slt i32 %0, 0, !dbg !1773
  br i1 %cmp, label %if.then, label %if.else, !dbg !1774

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1775
  %sub = sub nsw i32 0, %1, !dbg !1777
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1778
  store i8 1, i8* %u8SignBit, align 1, !dbg !1779
  br label %if.end, !dbg !1780

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1781
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1783
  store i8 0, i8* %u8SignBit, align 1, !dbg !1784
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1785
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1786
  %conv = zext i16 %4 to i32, !dbg !1786
  %mul = mul i32 %3, %conv, !dbg !1787
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1788
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1789
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1790
  %conv1 = zext i16 %6 to i32, !dbg !1790
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1791
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1792
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1793
  %shr = lshr i32 %7, 16, !dbg !1794
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1795
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1796
  %shl = shl i32 %8, 16, !dbg !1797
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1798
  %or = or i32 %9, %shl, !dbg !1798
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1798
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1799
  %conv2 = zext i8 %10 to i32, !dbg !1799
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1801
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1802

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1803
  store i32 %11, i32* %retval, align 4, !dbg !1805
  br label %return, !dbg !1805

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1806
  %sub7 = sub i32 0, %12, !dbg !1808
  store i32 %sub7, i32* %retval, align 4, !dbg !1809
  br label %return, !dbg !1809

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1810
  ret i32 %13, !dbg !1810
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1811 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1812, metadata !DIExpression()), !dbg !1813
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1814, metadata !DIExpression()), !dbg !1815
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1816, metadata !DIExpression()), !dbg !1817
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1818, metadata !DIExpression()), !dbg !1819
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1820, metadata !DIExpression()), !dbg !1821
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1822, metadata !DIExpression()), !dbg !1823
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1824
  %cmp = icmp slt i32 %0, 0, !dbg !1826
  br i1 %cmp, label %if.then, label %if.else, !dbg !1827

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1828
  %sub = sub nsw i32 0, %1, !dbg !1830
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1831
  store i8 1, i8* %u8SignBit, align 1, !dbg !1832
  br label %if.end, !dbg !1833

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1834
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1836
  store i8 0, i8* %u8SignBit, align 1, !dbg !1837
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1838
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1839
  %conv = zext i16 %4 to i32, !dbg !1839
  %mul = mul i32 %3, %conv, !dbg !1840
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1841
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1842
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1843
  %conv1 = zext i16 %6 to i32, !dbg !1843
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1844
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1845
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1846
  %shr = lshr i32 %7, 15, !dbg !1847
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1848
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1849
  %shl = shl i32 %8, 17, !dbg !1850
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1851
  %or = or i32 %9, %shl, !dbg !1851
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1851
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1852
  %conv2 = zext i8 %10 to i32, !dbg !1852
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1854
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1855

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1856
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1859
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1860

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1861
  store i32 %12, i32* %retval, align 4, !dbg !1862
  br label %return, !dbg !1862

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1863
  br label %return, !dbg !1863

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1864
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1867
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1868

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1869
  %sub14 = sub i32 0, %14, !dbg !1870
  store i32 %sub14, i32* %retval, align 4, !dbg !1871
  br label %return, !dbg !1871

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1872
  br label %return, !dbg !1872

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1873
  ret i32 %15, !dbg !1873
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1874 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1877, metadata !DIExpression()), !dbg !1878
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1879, metadata !DIExpression()), !dbg !1880
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1881, metadata !DIExpression()), !dbg !1882
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1883, metadata !DIExpression()), !dbg !1884
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1885, metadata !DIExpression()), !dbg !1886
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1887, metadata !DIExpression()), !dbg !1888
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1889, metadata !DIExpression()), !dbg !1890
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1891
  %cmp = icmp slt i32 %0, 0, !dbg !1893
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1894

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1895
  %conv = sext i16 %1 to i32, !dbg !1895
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1896
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1897

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1898
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1899
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1900

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1901
  %conv6 = sext i16 %3 to i32, !dbg !1901
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1902
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1903

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1904
  br label %if.end, !dbg !1906

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1907
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1909
  %cmp9 = icmp slt i32 %4, 0, !dbg !1911
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1912

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1913
  %sub = sub nsw i32 0, %5, !dbg !1915
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1916
  br label %if.end13, !dbg !1917

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1918
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1920
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1921
  %conv14 = sext i16 %7 to i32, !dbg !1921
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1923
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1924

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1925
  %conv18 = sext i16 %8 to i32, !dbg !1925
  %sub19 = sub nsw i32 0, %conv18, !dbg !1927
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1928
  br label %if.end22, !dbg !1929

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1930
  %conv21 = sext i16 %9 to i32, !dbg !1930
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1932
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1933
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1934
  %mul = mul i32 %10, %11, !dbg !1935
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1936
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1937
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1938
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1939
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1940
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1941
  %shr = lshr i32 %14, 15, !dbg !1942
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1943
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1944
  %shl = shl i32 %15, 17, !dbg !1945
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1946
  %or = or i32 %16, %shl, !dbg !1946
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1946
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1947
  %conv23 = zext i8 %17 to i32, !dbg !1947
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1949
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1950

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1951
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1954
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1955

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1956
  store i32 %19, i32* %retval, align 4, !dbg !1957
  br label %return, !dbg !1957

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1958
  br label %return, !dbg !1958

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1959
  %sub32 = sub i32 0, %20, !dbg !1961
  store i32 %sub32, i32* %retval, align 4, !dbg !1962
  br label %return, !dbg !1962

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1963
  ret i32 %21, !dbg !1963
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1964 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1965, metadata !DIExpression()), !dbg !1966
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1967, metadata !DIExpression()), !dbg !1968
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1969, metadata !DIExpression()), !dbg !1970
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1971, metadata !DIExpression()), !dbg !1972
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1973, metadata !DIExpression()), !dbg !1974
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1975, metadata !DIExpression()), !dbg !1976
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1977, metadata !DIExpression()), !dbg !1978
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1979
  %cmp = icmp slt i32 %0, 0, !dbg !1981
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1982

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1983
  %conv = sext i16 %1 to i32, !dbg !1983
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1984
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1985

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1986
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1987
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1988

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1989
  %conv6 = sext i16 %3 to i32, !dbg !1989
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1990
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1991

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1992
  br label %if.end, !dbg !1994

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1995
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1997
  %cmp9 = icmp slt i32 %4, 0, !dbg !1999
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2000

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2001
  %sub = sub nsw i32 0, %5, !dbg !2003
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2004
  br label %if.end13, !dbg !2005

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2006
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2008
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2009
  %conv14 = sext i16 %7 to i32, !dbg !2009
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2011
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2012

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2013
  %conv18 = sext i16 %8 to i32, !dbg !2013
  %sub19 = sub nsw i32 0, %conv18, !dbg !2015
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2016
  br label %if.end22, !dbg !2017

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2018
  %conv21 = sext i16 %9 to i32, !dbg !2018
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2020
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2021
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2022
  %mul = mul i32 %10, %11, !dbg !2023
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2024
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2025
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2026
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2027
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2028
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2029
  %shr = lshr i32 %14, 14, !dbg !2030
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2031
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2032
  %shl = shl i32 %15, 18, !dbg !2033
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2034
  %or = or i32 %16, %shl, !dbg !2034
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2034
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2035
  %shr23 = lshr i32 %17, 14, !dbg !2037
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2038
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2039

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2040
  %conv27 = zext i8 %18 to i32, !dbg !2040
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2043
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2044

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2045
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2048
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2049

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2050
  store i32 %20, i32* %retval, align 4, !dbg !2051
  br label %return, !dbg !2051

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2052
  br label %return, !dbg !2052

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2053
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2056
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2057

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2058
  %sub39 = sub i32 0, %22, !dbg !2059
  store i32 %sub39, i32* %retval, align 4, !dbg !2060
  br label %return, !dbg !2060

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2061
  br label %return, !dbg !2061

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2062
  br label %return, !dbg !2062

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2064
  ret i32 %23, !dbg !2064
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2065 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2068, metadata !DIExpression()), !dbg !2069
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2070, metadata !DIExpression()), !dbg !2071
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2072, metadata !DIExpression()), !dbg !2073
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2074, metadata !DIExpression()), !dbg !2075
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2076, metadata !DIExpression()), !dbg !2077
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2078
  %cmp = icmp slt i32 %0, 0, !dbg !2080
  br i1 %cmp, label %if.then, label %if.else, !dbg !2081

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2082
  %sub = sub nsw i32 0, %1, !dbg !2084
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2085
  store i8 1, i8* %u8SignBit, align 1, !dbg !2086
  br label %if.end, !dbg !2087

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2088
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2090
  store i8 0, i8* %u8SignBit, align 1, !dbg !2091
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2092
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2093
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2094
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2095
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2096
  %conv = zext i8 %5 to i32, !dbg !2096
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2098
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2099

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2100
  store i32 %6, i32* %retval, align 4, !dbg !2101
  br label %return, !dbg !2101

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2102
  %sub5 = sub i32 0, %7, !dbg !2103
  store i32 %sub5, i32* %retval, align 4, !dbg !2104
  br label %return, !dbg !2104

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2105
  ret i32 %8, !dbg !2105
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2106 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2107, metadata !DIExpression()), !dbg !2108
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2109, metadata !DIExpression()), !dbg !2110
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2111, metadata !DIExpression()), !dbg !2112
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2113, metadata !DIExpression()), !dbg !2114
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2115, metadata !DIExpression()), !dbg !2116
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2117, metadata !DIExpression()), !dbg !2118
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2119
  %cmp = icmp slt i32 %0, 0, !dbg !2121
  br i1 %cmp, label %if.then, label %if.else, !dbg !2122

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2123
  %sub = sub nsw i32 0, %1, !dbg !2125
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2126
  store i8 1, i8* %u8SignBit, align 1, !dbg !2127
  br label %if.end, !dbg !2128

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2129
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2131
  store i8 0, i8* %u8SignBit, align 1, !dbg !2132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2133
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2134
  %mul = mul i32 %3, %4, !dbg !2135
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2136
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2137
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2138
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2139
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2140
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2141
  %shr = lshr i32 %7, 31, !dbg !2142
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2143
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2144
  %shl = shl i32 %8, 1, !dbg !2145
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2146
  %or = or i32 %9, %shl, !dbg !2146
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2146
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2147
  %conv = zext i8 %10 to i32, !dbg !2147
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2149
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2150

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2151
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2154
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2155

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2156
  store i32 %12, i32* %retval, align 4, !dbg !2157
  br label %return, !dbg !2157

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2158
  br label %return, !dbg !2158

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2159
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2162
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2163

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2164
  %sub12 = sub i32 0, %14, !dbg !2165
  store i32 %sub12, i32* %retval, align 4, !dbg !2166
  br label %return, !dbg !2166

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2167
  br label %return, !dbg !2167

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2168
  ret i32 %15, !dbg !2168
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2169 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2172, metadata !DIExpression()), !dbg !2173
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2174, metadata !DIExpression()), !dbg !2175
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2176, metadata !DIExpression()), !dbg !2177
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2178, metadata !DIExpression()), !dbg !2179
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2180, metadata !DIExpression()), !dbg !2181
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2182, metadata !DIExpression()), !dbg !2183
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2184, metadata !DIExpression()), !dbg !2185
  %0 = load i32, i32* %value.addr, align 4, !dbg !2186
  %cmp = icmp slt i32 %0, 0, !dbg !2188
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2189
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2189

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2190
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2191
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2192
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2192

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2193
  br label %if.end, !dbg !2195

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2196
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2198
  %cmp5 = icmp slt i32 %4, 0, !dbg !2200
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2201

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2202
  %sub = sub nsw i32 0, %5, !dbg !2204
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2205
  br label %if.end8, !dbg !2206

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2207
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2209
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2210
  %cmp9 = icmp slt i32 %7, 0, !dbg !2212
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2213

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2214
  %sub11 = sub nsw i32 0, %8, !dbg !2216
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2217
  br label %if.end13, !dbg !2218

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2219
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2221
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2222
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2223
  %mul = mul i32 %10, %11, !dbg !2224
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2225
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2226
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2227
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2228
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2229
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2230
  %shr = lshr i32 %14, 31, !dbg !2231
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2232
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2233
  %shl = shl i32 %15, 1, !dbg !2234
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2235
  %or = or i32 %16, %shl, !dbg !2235
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2235
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2236
  %conv = zext i8 %17 to i32, !dbg !2236
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2238
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2239

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2240
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2243
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2244

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2245
  store i32 %19, i32* %retval, align 4, !dbg !2246
  br label %return, !dbg !2246

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2247
  br label %return, !dbg !2247

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2248
  %sub22 = sub i32 0, %20, !dbg !2250
  store i32 %sub22, i32* %retval, align 4, !dbg !2251
  br label %return, !dbg !2251

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2252
  ret i32 %21, !dbg !2252
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2253 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2254, metadata !DIExpression()), !dbg !2255
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2256, metadata !DIExpression()), !dbg !2257
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2258, metadata !DIExpression()), !dbg !2259
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2260, metadata !DIExpression()), !dbg !2261
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2262, metadata !DIExpression()), !dbg !2263
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2264, metadata !DIExpression()), !dbg !2265
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2266, metadata !DIExpression()), !dbg !2267
  %0 = load i32, i32* %value.addr, align 4, !dbg !2268
  %cmp = icmp slt i32 %0, 0, !dbg !2270
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2271
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2271

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2272
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2273
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2274
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2274

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2275
  br label %if.end, !dbg !2277

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2278
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2280
  %cmp5 = icmp slt i32 %4, 0, !dbg !2282
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2283

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2284
  %sub = sub nsw i32 0, %5, !dbg !2286
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2287
  br label %if.end8, !dbg !2288

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2289
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2291
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2292
  %cmp9 = icmp slt i32 %7, 0, !dbg !2294
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2295

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2296
  %sub11 = sub nsw i32 0, %8, !dbg !2298
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2299
  br label %if.end13, !dbg !2300

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2301
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2303
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2304
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2305
  %mul = mul i32 %10, %11, !dbg !2306
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2307
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2308
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2309
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2310
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2311
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2312
  %shr = lshr i32 %14, 30, !dbg !2313
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2314
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2315
  %shl = shl i32 %15, 2, !dbg !2316
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2317
  %or = or i32 %16, %shl, !dbg !2317
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2317
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2318
  %shr14 = lshr i32 %17, 30, !dbg !2320
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2321
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2322

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2323
  %conv = zext i8 %18 to i32, !dbg !2323
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2326
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2327

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2328
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2331
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2332

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2333
  store i32 %20, i32* %retval, align 4, !dbg !2334
  br label %return, !dbg !2334

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2335
  br label %return, !dbg !2335

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2336
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2339
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2340

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2341
  %sub28 = sub i32 0, %22, !dbg !2342
  store i32 %sub28, i32* %retval, align 4, !dbg !2343
  br label %return, !dbg !2343

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2344
  br label %return, !dbg !2344

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2345
  br label %return, !dbg !2345

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2347
  ret i32 %23, !dbg !2347
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2348 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2351, metadata !DIExpression()), !dbg !2352
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2353, metadata !DIExpression()), !dbg !2354
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2355, metadata !DIExpression()), !dbg !2356
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2357, metadata !DIExpression()), !dbg !2358
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2359, metadata !DIExpression()), !dbg !2360
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2361, metadata !DIExpression()), !dbg !2362
  %0 = load i32, i32* %value.addr, align 4, !dbg !2363
  %cmp = icmp slt i32 %0, 0, !dbg !2365
  br i1 %cmp, label %if.then, label %if.else, !dbg !2366

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2367
  %sub = sub nsw i32 0, %1, !dbg !2369
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2370
  store i8 1, i8* %u8SignBit, align 1, !dbg !2371
  br label %if.end, !dbg !2372

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2373
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2375
  store i8 0, i8* %u8SignBit, align 1, !dbg !2376
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2377
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2378
  %conv = zext i8 %4 to i32, !dbg !2378
  %mul = mul i32 %3, %conv, !dbg !2379
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2380
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2381
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2382
  %conv1 = zext i8 %6 to i32, !dbg !2382
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2383
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2384
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2385
  %shr = lshr i32 %7, 8, !dbg !2386
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2387
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2388
  %shl = shl i32 %8, 24, !dbg !2389
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2390
  %or = or i32 %9, %shl, !dbg !2390
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2390
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2391
  %conv2 = zext i8 %10 to i32, !dbg !2391
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2393
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2394

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2395
  store i32 %11, i32* %retval, align 4, !dbg !2397
  br label %return, !dbg !2397

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2398
  %sub7 = sub i32 0, %12, !dbg !2400
  store i32 %sub7, i32* %retval, align 4, !dbg !2401
  br label %return, !dbg !2401

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2402
  ret i32 %13, !dbg !2402
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2403 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2404, metadata !DIExpression()), !dbg !2405
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2406, metadata !DIExpression()), !dbg !2407
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2408, metadata !DIExpression()), !dbg !2409
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2410, metadata !DIExpression()), !dbg !2411
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2412, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2414, metadata !DIExpression()), !dbg !2415
  %0 = load i32, i32* %value.addr, align 4, !dbg !2416
  %cmp = icmp slt i32 %0, 0, !dbg !2418
  br i1 %cmp, label %if.then, label %if.else, !dbg !2419

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2420
  %sub = sub nsw i32 0, %1, !dbg !2422
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2423
  store i8 1, i8* %u8SignBit, align 1, !dbg !2424
  br label %if.end, !dbg !2425

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2426
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2428
  store i8 0, i8* %u8SignBit, align 1, !dbg !2429
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2430
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2431
  %conv = zext i8 %4 to i32, !dbg !2431
  %mul = mul i32 %3, %conv, !dbg !2432
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2433
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2434
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2435
  %conv1 = zext i8 %6 to i32, !dbg !2435
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2436
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2437
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2438
  %shr = lshr i32 %7, 7, !dbg !2439
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2440
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2441
  %shl = shl i32 %8, 25, !dbg !2442
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2443
  %or = or i32 %9, %shl, !dbg !2443
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2443
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2444
  %conv2 = zext i8 %10 to i32, !dbg !2444
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2446
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2447

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2448
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2451
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2452

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2453
  store i32 %12, i32* %retval, align 4, !dbg !2454
  br label %return, !dbg !2454

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2455
  br label %return, !dbg !2455

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2456
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2459
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2460

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2461
  %sub14 = sub i32 0, %14, !dbg !2462
  store i32 %sub14, i32* %retval, align 4, !dbg !2463
  br label %return, !dbg !2463

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2464
  br label %return, !dbg !2464

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2465
  ret i32 %15, !dbg !2465
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2466 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2469, metadata !DIExpression()), !dbg !2470
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2471, metadata !DIExpression()), !dbg !2472
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2473, metadata !DIExpression()), !dbg !2474
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2475, metadata !DIExpression()), !dbg !2476
  store i32 0, i32* %u32Temp1, align 4, !dbg !2476
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2477, metadata !DIExpression()), !dbg !2478
  store i32 0, i32* %u32Temp2, align 4, !dbg !2478
  %0 = load i8, i8* %power.addr, align 1, !dbg !2479
  %conv = zext i8 %0 to i32, !dbg !2479
  %cmp = icmp sge i32 %conv, 32, !dbg !2481
  br i1 %cmp, label %if.then, label %if.else, !dbg !2482

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2483
  br label %if.end7, !dbg !2485

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2486
  %conv2 = zext i8 %1 to i32, !dbg !2486
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2488
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2489

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2490
  br label %if.end7, !dbg !2492

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2493
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2494
  %mul = mul i32 %2, %3, !dbg !2495
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2496
  %4 = load i32, i32* %value.addr, align 4, !dbg !2497
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2498
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2499
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2500
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2501
  %7 = load i8, i8* %power.addr, align 1, !dbg !2502
  %conv8 = zext i8 %7 to i32, !dbg !2502
  %sub = sub nsw i32 32, %conv8, !dbg !2503
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2504
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2504
  %shr = lshr i32 %6, %sub, !dbg !2504, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2505
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2506
  %9 = load i8, i8* %power.addr, align 1, !dbg !2507
  %conv9 = zext i8 %9 to i32, !dbg !2507
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2508
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2508
  %shl = shl i32 %8, %conv9, !dbg !2508, !klee.check.shift !270
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2509
  %or = or i32 %10, %shl, !dbg !2509
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2509
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2510
  %12 = load i8, i8* %power.addr, align 1, !dbg !2512
  %conv10 = zext i8 %12 to i32, !dbg !2512
  %sub11 = sub nsw i32 32, %conv10, !dbg !2513
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2514
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2514
  %shr12 = lshr i32 %11, %sub11, !dbg !2514, !klee.check.shift !270
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2515
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2516

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2517
  store i32 %13, i32* %retval, align 4, !dbg !2519
  br label %return, !dbg !2519

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2520
  br label %return, !dbg !2520

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2522
  ret i32 %14, !dbg !2522
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2523 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2526, metadata !DIExpression()), !dbg !2527
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2528, metadata !DIExpression()), !dbg !2529
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2530, metadata !DIExpression()), !dbg !2531
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2532, metadata !DIExpression()), !dbg !2533
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2534, metadata !DIExpression()), !dbg !2535
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2536, metadata !DIExpression()), !dbg !2537
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2538, metadata !DIExpression()), !dbg !2539
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2540, metadata !DIExpression()), !dbg !2541
  %0 = load i8, i8* %power.addr, align 1, !dbg !2542
  %conv = zext i8 %0 to i32, !dbg !2542
  %cmp = icmp sge i32 %conv, 32, !dbg !2544
  br i1 %cmp, label %if.then, label %if.else, !dbg !2545

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2546
  br label %if.end7, !dbg !2548

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2549
  %conv2 = zext i8 %1 to i32, !dbg !2549
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2551
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2552

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2553
  br label %if.end7, !dbg !2555

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2556
  %cmp8 = icmp slt i32 %2, 0, !dbg !2558
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2559
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2559

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2560
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2561
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2562
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2562

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2563
  br label %if.end19, !dbg !2565

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2566
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2568
  %cmp20 = icmp slt i32 %6, 0, !dbg !2570
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2571

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2572
  %sub = sub nsw i32 0, %7, !dbg !2574
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2575
  br label %if.end24, !dbg !2576

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2577
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2579
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2580
  %cmp25 = icmp slt i32 %9, 0, !dbg !2582
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2583

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2584
  %sub28 = sub nsw i32 0, %10, !dbg !2586
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2587
  br label %if.end30, !dbg !2588

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2589
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2591
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2592
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2593
  %mul = mul i32 %12, %13, !dbg !2594
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2595
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2596
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2597
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2598
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2599
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2600
  %17 = load i8, i8* %power.addr, align 1, !dbg !2601
  %conv31 = zext i8 %17 to i32, !dbg !2601
  %sub32 = sub nsw i32 32, %conv31, !dbg !2602
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2603
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2603
  %shr = lshr i32 %16, %sub32, !dbg !2603, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2604
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2605
  %19 = load i8, i8* %power.addr, align 1, !dbg !2606
  %conv33 = zext i8 %19 to i32, !dbg !2606
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2607
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2607
  %shl = shl i32 %18, %conv33, !dbg !2607, !klee.check.shift !270
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2608
  %or = or i32 %20, %shl, !dbg !2608
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2608
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2609
  %22 = load i8, i8* %power.addr, align 1, !dbg !2611
  %conv34 = zext i8 %22 to i32, !dbg !2611
  %sub35 = sub nsw i32 32, %conv34, !dbg !2612
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2613
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2613
  %shr36 = lshr i32 %21, %sub35, !dbg !2613, !klee.check.shift !270
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2614
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2615

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2616
  %conv40 = zext i8 %23 to i32, !dbg !2616
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2619
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2620

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2621
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2624
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2625

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2626
  store i32 %25, i32* %retval, align 4, !dbg !2627
  br label %return, !dbg !2627

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2628
  br label %return, !dbg !2628

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2629
  %sub49 = sub i32 0, %26, !dbg !2631
  store i32 %sub49, i32* %retval, align 4, !dbg !2632
  br label %return, !dbg !2632

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2633
  %conv51 = zext i8 %27 to i32, !dbg !2633
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2636
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2637

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2638
  br label %return, !dbg !2638

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2640
  br label %return, !dbg !2640

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2642
  ret i32 %28, !dbg !2642
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2643 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2646, metadata !DIExpression()), !dbg !2647
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2648, metadata !DIExpression()), !dbg !2649
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2650, metadata !DIExpression()), !dbg !2651
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2652, metadata !DIExpression()), !dbg !2653
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2654, metadata !DIExpression()), !dbg !2655
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2656, metadata !DIExpression()), !dbg !2657
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2658, metadata !DIExpression()), !dbg !2659
  %0 = load i32, i32* %value.addr, align 4, !dbg !2660
  %cmp = icmp slt i32 %0, 0, !dbg !2662
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2663

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2664
  %conv = sext i8 %1 to i32, !dbg !2664
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2665
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2666

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2667
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2668
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2669

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2670
  %conv6 = sext i8 %3 to i32, !dbg !2670
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2671
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2672

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2673
  br label %if.end, !dbg !2675

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2676
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2678
  %cmp9 = icmp slt i32 %4, 0, !dbg !2680
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2681

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2682
  %sub = sub nsw i32 0, %5, !dbg !2684
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2685
  br label %if.end13, !dbg !2686

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2687
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2689
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2690
  %conv14 = sext i8 %7 to i32, !dbg !2690
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2692
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2693

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2694
  %conv18 = sext i8 %8 to i32, !dbg !2694
  %sub19 = sub nsw i32 0, %conv18, !dbg !2696
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2697
  br label %if.end22, !dbg !2698

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2699
  %conv21 = sext i8 %9 to i32, !dbg !2699
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2701
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2702
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2703
  %mul = mul i32 %10, %11, !dbg !2704
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2705
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2706
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2707
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2708
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2709
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2710
  %shr = lshr i32 %14, 7, !dbg !2711
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2712
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2713
  %shl = shl i32 %15, 25, !dbg !2714
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2715
  %or = or i32 %16, %shl, !dbg !2715
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2715
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2716
  %conv23 = zext i8 %17 to i32, !dbg !2716
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2718
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2719

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2720
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2723
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2724

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2725
  store i32 %19, i32* %retval, align 4, !dbg !2726
  br label %return, !dbg !2726

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2727
  br label %return, !dbg !2727

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2728
  %sub32 = sub i32 0, %20, !dbg !2730
  store i32 %sub32, i32* %retval, align 4, !dbg !2731
  br label %return, !dbg !2731

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2732
  ret i32 %21, !dbg !2732
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2733 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2734, metadata !DIExpression()), !dbg !2735
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2736, metadata !DIExpression()), !dbg !2737
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2738, metadata !DIExpression()), !dbg !2739
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2740, metadata !DIExpression()), !dbg !2741
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2742, metadata !DIExpression()), !dbg !2743
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2744, metadata !DIExpression()), !dbg !2745
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2746, metadata !DIExpression()), !dbg !2747
  %0 = load i32, i32* %value.addr, align 4, !dbg !2748
  %cmp = icmp slt i32 %0, 0, !dbg !2750
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2751

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2752
  %conv = sext i8 %1 to i32, !dbg !2752
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2753
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2754

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2755
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2756
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2757

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2758
  %conv6 = sext i8 %3 to i32, !dbg !2758
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2759
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2760

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2761
  br label %if.end, !dbg !2763

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2764
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2766
  %cmp9 = icmp slt i32 %4, 0, !dbg !2768
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2769

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2770
  %sub = sub nsw i32 0, %5, !dbg !2772
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2773
  br label %if.end13, !dbg !2774

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2775
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2777
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2778
  %conv14 = sext i8 %7 to i32, !dbg !2778
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2780
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2781

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2782
  %conv18 = sext i8 %8 to i32, !dbg !2782
  %sub19 = sub nsw i32 0, %conv18, !dbg !2784
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2785
  br label %if.end22, !dbg !2786

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2787
  %conv21 = sext i8 %9 to i32, !dbg !2787
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2789
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2790
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2791
  %mul = mul i32 %10, %11, !dbg !2792
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2793
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2794
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2795
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2796
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2797
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2798
  %shr = lshr i32 %14, 6, !dbg !2799
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2800
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2801
  %shl = shl i32 %15, 26, !dbg !2802
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2803
  %or = or i32 %16, %shl, !dbg !2803
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2803
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2804
  %shr23 = lshr i32 %17, 6, !dbg !2806
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2807
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2808

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2809
  %conv27 = zext i8 %18 to i32, !dbg !2809
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2812
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2813

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2814
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2817
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2818

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2819
  store i32 %20, i32* %retval, align 4, !dbg !2820
  br label %return, !dbg !2820

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2821
  br label %return, !dbg !2821

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2822
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2825
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2826

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2827
  %sub39 = sub i32 0, %22, !dbg !2828
  store i32 %sub39, i32* %retval, align 4, !dbg !2829
  br label %return, !dbg !2829

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2830
  br label %return, !dbg !2830

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2831
  br label %return, !dbg !2831

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2833
  ret i32 %23, !dbg !2833
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2834 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2835, metadata !DIExpression()), !dbg !2836
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2837, metadata !DIExpression()), !dbg !2838
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2839, metadata !DIExpression()), !dbg !2840
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2841, metadata !DIExpression()), !dbg !2842
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2843, metadata !DIExpression()), !dbg !2844
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2845, metadata !DIExpression()), !dbg !2846
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2847, metadata !DIExpression()), !dbg !2848
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2849
  %cmp = icmp slt i32 %0, 0, !dbg !2851
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2852
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2852

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2853
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2854
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2855
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2855

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2856
  br label %if.end, !dbg !2858

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2859
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2861
  %cmp5 = icmp slt i32 %4, 0, !dbg !2863
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2864

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2865
  %sub = sub nsw i32 0, %5, !dbg !2867
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2868
  br label %if.end8, !dbg !2869

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2870
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2872
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2873
  %cmp9 = icmp slt i32 %7, 0, !dbg !2875
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2876

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2877
  %sub11 = sub nsw i32 0, %8, !dbg !2879
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2880
  br label %if.end13, !dbg !2881

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2882
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2884
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2885
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2886
  %mul = mul i32 %10, %11, !dbg !2887
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2888
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2889
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2890
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2891
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2892
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2893
  %cmp14 = icmp eq i32 %14, 0, !dbg !2895
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2896

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2897
  %conv = zext i8 %15 to i32, !dbg !2897
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2900
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2901

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2902
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2905
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2906

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2907
  store i32 %17, i32* %retval, align 4, !dbg !2908
  br label %return, !dbg !2908

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2909
  br label %return, !dbg !2909

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2910
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2913
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2914

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2915
  %sub27 = sub i32 0, %19, !dbg !2916
  store i32 %sub27, i32* %retval, align 4, !dbg !2917
  br label %return, !dbg !2917

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2918
  br label %return, !dbg !2918

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2919
  %conv30 = zext i8 %20 to i32, !dbg !2919
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2922
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2923

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2924
  br label %return, !dbg !2924

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2926
  br label %return, !dbg !2926

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2928
  ret i32 %21, !dbg !2928
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2929 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2930, metadata !DIExpression()), !dbg !2931
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2932, metadata !DIExpression()), !dbg !2933
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2934, metadata !DIExpression()), !dbg !2935
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2936, metadata !DIExpression()), !dbg !2937
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2938, metadata !DIExpression()), !dbg !2939
  %0 = load i32, i32* %value.addr, align 4, !dbg !2940
  %cmp = icmp slt i32 %0, 0, !dbg !2942
  br i1 %cmp, label %if.then, label %if.else, !dbg !2943

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2944
  %sub = sub nsw i32 0, %1, !dbg !2946
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2947
  store i8 1, i8* %u8SignBit, align 1, !dbg !2948
  br label %if.end, !dbg !2949

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2950
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2952
  store i8 0, i8* %u8SignBit, align 1, !dbg !2953
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2954
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2955
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2956
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2957
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2958
  %shr = lshr i32 %5, 1, !dbg !2959
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2960
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2961
  %conv = zext i8 %6 to i32, !dbg !2961
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2963
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2964

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2965
  store i32 %7, i32* %retval, align 4, !dbg !2967
  br label %return, !dbg !2967

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2968
  %sub5 = sub i32 0, %8, !dbg !2970
  store i32 %sub5, i32* %retval, align 4, !dbg !2971
  br label %return, !dbg !2971

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2972
  ret i32 %9, !dbg !2972
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2973 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2974, metadata !DIExpression()), !dbg !2975
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2976, metadata !DIExpression()), !dbg !2977
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2978, metadata !DIExpression()), !dbg !2979
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2980, metadata !DIExpression()), !dbg !2981
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2982, metadata !DIExpression()), !dbg !2983
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2984, metadata !DIExpression()), !dbg !2985
  %0 = load i32, i32* %value.addr, align 4, !dbg !2986
  %cmp = icmp slt i32 %0, 0, !dbg !2988
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2989
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2989

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2990
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2991
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2992
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2992

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2993
  br label %if.end, !dbg !2995

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2996
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2998
  %cmp5 = icmp slt i32 %4, 0, !dbg !3000
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3001

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3002
  %sub = sub nsw i32 0, %5, !dbg !3004
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3005
  br label %if.end8, !dbg !3006

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3007
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3009
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3010
  %cmp9 = icmp slt i32 %7, 0, !dbg !3012
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3013

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3014
  %sub11 = sub nsw i32 0, %8, !dbg !3016
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3017
  br label %if.end13, !dbg !3018

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3019
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3021
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3022
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3023
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3024
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3025
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3026
  %conv = zext i8 %12 to i32, !dbg !3026
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3028
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3029

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3030
  store i32 %13, i32* %retval, align 4, !dbg !3032
  br label %return, !dbg !3032

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3033
  %sub18 = sub i32 0, %14, !dbg !3035
  store i32 %sub18, i32* %retval, align 4, !dbg !3036
  br label %return, !dbg !3036

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3037
  ret i32 %15, !dbg !3037
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3038 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3041, metadata !DIExpression()), !dbg !3042
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3043, metadata !DIExpression()), !dbg !3044
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3045, metadata !DIExpression()), !dbg !3046
  store i32 0, i32* %u32Temp1, align 4, !dbg !3046
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3047, metadata !DIExpression()), !dbg !3048
  store i32 0, i32* %u32Temp2, align 4, !dbg !3048
  %0 = load i32, i32* %value.addr, align 4, !dbg !3049
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3050
  %conv = zext i8 %1 to i32, !dbg !3050
  %mul = mul i32 %0, %conv, !dbg !3051
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3052
  %2 = load i32, i32* %value.addr, align 4, !dbg !3053
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3054
  %conv1 = zext i8 %3 to i32, !dbg !3054
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3055
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3056
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3057
  %shr = lshr i32 %4, 8, !dbg !3058
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3059
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3060
  %shl = shl i32 %5, 24, !dbg !3061
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3062
  %or = or i32 %6, %shl, !dbg !3062
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3062
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3063
  ret i32 %7, !dbg !3064
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3065 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3066, metadata !DIExpression()), !dbg !3067
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3068, metadata !DIExpression()), !dbg !3069
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3070, metadata !DIExpression()), !dbg !3071
  store i32 0, i32* %u32Temp1, align 4, !dbg !3071
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3072, metadata !DIExpression()), !dbg !3073
  store i32 0, i32* %u32Temp2, align 4, !dbg !3073
  %0 = load i32, i32* %value.addr, align 4, !dbg !3074
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3075
  %conv = zext i8 %1 to i32, !dbg !3075
  %mul = mul i32 %0, %conv, !dbg !3076
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3077
  %2 = load i32, i32* %value.addr, align 4, !dbg !3078
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3079
  %conv1 = zext i8 %3 to i32, !dbg !3079
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3080
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3081
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3082
  %shr = lshr i32 %4, 7, !dbg !3083
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3084
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3085
  %shl = shl i32 %5, 25, !dbg !3086
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3087
  %or = or i32 %6, %shl, !dbg !3087
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3087
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3088
  %shr2 = lshr i32 %7, 7, !dbg !3090
  %cmp = icmp eq i32 %shr2, 0, !dbg !3091
  br i1 %cmp, label %if.then, label %if.else, !dbg !3092

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3093
  store i32 %8, i32* %retval, align 4, !dbg !3095
  br label %return, !dbg !3095

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3096
  br label %return, !dbg !3096

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3098
  ret i32 %9, !dbg !3098
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3099 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3102, metadata !DIExpression()), !dbg !3103
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3104, metadata !DIExpression()), !dbg !3105
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3106, metadata !DIExpression()), !dbg !3107
  store i32 0, i32* %u32Temp1, align 4, !dbg !3107
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3108, metadata !DIExpression()), !dbg !3109
  store i32 0, i32* %u32Temp2, align 4, !dbg !3109
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3110
  %conv = sext i8 %0 to i32, !dbg !3110
  %cmp = icmp sgt i32 %conv, 0, !dbg !3112
  br i1 %cmp, label %if.then, label %if.else, !dbg !3113

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3114
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3116
  %conv2 = sext i8 %2 to i32, !dbg !3116
  %mul = mul i32 %1, %conv2, !dbg !3117
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3118
  %3 = load i32, i32* %value.addr, align 4, !dbg !3119
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3120
  %conv3 = sext i8 %4 to i32, !dbg !3120
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3121
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3122
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3123
  %shr = lshr i32 %5, 7, !dbg !3124
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3125
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3126
  %shl = shl i32 %6, 25, !dbg !3127
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3128
  %or = or i32 %7, %shl, !dbg !3128
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3128
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3129
  store i32 %8, i32* %retval, align 4, !dbg !3130
  br label %return, !dbg !3130

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3131
  br label %return, !dbg !3131

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3133
  ret i32 %9, !dbg !3133
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3134 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3135, metadata !DIExpression()), !dbg !3136
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3137, metadata !DIExpression()), !dbg !3138
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3139, metadata !DIExpression()), !dbg !3140
  store i32 0, i32* %u32Temp1, align 4, !dbg !3140
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3141, metadata !DIExpression()), !dbg !3142
  store i32 0, i32* %u32Temp2, align 4, !dbg !3142
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3143
  %conv = sext i8 %0 to i32, !dbg !3143
  %cmp = icmp sle i32 %conv, 0, !dbg !3145
  br i1 %cmp, label %if.then, label %if.else, !dbg !3146

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3147
  br label %return, !dbg !3147

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3149
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3151
  %conv2 = sext i8 %2 to i32, !dbg !3151
  %mul = mul i32 %1, %conv2, !dbg !3152
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3153
  %3 = load i32, i32* %value.addr, align 4, !dbg !3154
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3155
  %conv3 = sext i8 %4 to i32, !dbg !3155
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3156
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3157
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3158
  %shr = lshr i32 %5, 6, !dbg !3159
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3160
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3161
  %shl = shl i32 %6, 26, !dbg !3162
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3163
  %or = or i32 %7, %shl, !dbg !3163
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3163
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3164
  %shr4 = lshr i32 %8, 6, !dbg !3166
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3167
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3168

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3169
  store i32 %9, i32* %retval, align 4, !dbg !3171
  br label %return, !dbg !3171

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3172
  br label %return, !dbg !3172

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3174
  ret i32 %10, !dbg !3174
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3175 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3176, metadata !DIExpression()), !dbg !3177
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3178, metadata !DIExpression()), !dbg !3179
  %0 = load i16, i16* %value.addr, align 2, !dbg !3180
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3181
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3182
  ret i16 %call, !dbg !3183
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3184 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3185, metadata !DIExpression()), !dbg !3186
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3187, metadata !DIExpression()), !dbg !3188
  %0 = load i16, i16* %value.addr, align 2, !dbg !3189
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3190
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3191
  ret i16 %call, !dbg !3192
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3193 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3194, metadata !DIExpression()), !dbg !3195
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3196, metadata !DIExpression()), !dbg !3197
  %0 = load i16, i16* %value.addr, align 2, !dbg !3198
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3199
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3200
  ret i16 %call, !dbg !3201
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3202 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3203, metadata !DIExpression()), !dbg !3204
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3205, metadata !DIExpression()), !dbg !3206
  %0 = load i16, i16* %value.addr, align 2, !dbg !3207
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3208
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3209
  ret i16 %call, !dbg !3210
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3211 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3212, metadata !DIExpression()), !dbg !3213
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3214, metadata !DIExpression()), !dbg !3215
  %0 = load i16, i16* %value.addr, align 2, !dbg !3216
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3217
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3218
  ret i16 %call, !dbg !3219
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3220 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3221, metadata !DIExpression()), !dbg !3222
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3223, metadata !DIExpression()), !dbg !3224
  %0 = load i16, i16* %value.addr, align 2, !dbg !3225
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3226
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3227
  ret i16 %call, !dbg !3228
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3229 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3230, metadata !DIExpression()), !dbg !3231
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3232, metadata !DIExpression()), !dbg !3233
  %0 = load i16, i16* %value.addr, align 2, !dbg !3234
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3235
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3236
  ret i16 %call, !dbg !3237
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3238 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3239, metadata !DIExpression()), !dbg !3240
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3241, metadata !DIExpression()), !dbg !3242
  %0 = load i16, i16* %value.addr, align 2, !dbg !3243
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3244
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3245
  ret i16 %call, !dbg !3246
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3247 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3248, metadata !DIExpression()), !dbg !3249
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3250, metadata !DIExpression()), !dbg !3251
  %0 = load i16, i16* %value.addr, align 2, !dbg !3252
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3253
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3254
  ret i16 %call, !dbg !3255
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3256 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3257, metadata !DIExpression()), !dbg !3258
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3259, metadata !DIExpression()), !dbg !3260
  %0 = load i16, i16* %value.addr, align 2, !dbg !3261
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3262
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3263
  ret i16 %call, !dbg !3264
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3265 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3266, metadata !DIExpression()), !dbg !3267
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3268, metadata !DIExpression()), !dbg !3269
  %0 = load i16, i16* %value.addr, align 2, !dbg !3270
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3271
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3272
  ret i16 %call, !dbg !3273
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3274 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3275, metadata !DIExpression()), !dbg !3276
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3277, metadata !DIExpression()), !dbg !3278
  %0 = load i16, i16* %value.addr, align 2, !dbg !3279
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3280
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3281
  ret i16 %call, !dbg !3282
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3283 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3284, metadata !DIExpression()), !dbg !3285
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3286, metadata !DIExpression()), !dbg !3287
  %0 = load i16, i16* %value.addr, align 2, !dbg !3288
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3289
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3290
  ret i16 %call, !dbg !3291
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3292 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3293, metadata !DIExpression()), !dbg !3294
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3295, metadata !DIExpression()), !dbg !3296
  %0 = load i16, i16* %value.addr, align 2, !dbg !3297
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3298
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3299
  ret i16 %call, !dbg !3300
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3301 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3302, metadata !DIExpression()), !dbg !3303
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3304, metadata !DIExpression()), !dbg !3305
  %0 = load i16, i16* %value.addr, align 2, !dbg !3306
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3307
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3308
  ret i16 %call, !dbg !3309
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3310 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3311, metadata !DIExpression()), !dbg !3312
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3313, metadata !DIExpression()), !dbg !3314
  %0 = load i16, i16* %value.addr, align 2, !dbg !3315
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3316
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3317
  %2 = load i16, i16* %retval, align 2, !dbg !3318
  ret i16 %2, !dbg !3318
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3319 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3320, metadata !DIExpression()), !dbg !3321
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3322, metadata !DIExpression()), !dbg !3323
  %0 = load i16, i16* %value.addr, align 2, !dbg !3324
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3325
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3326
  ret i16 %call, !dbg !3327
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3328 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3329, metadata !DIExpression()), !dbg !3330
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3331, metadata !DIExpression()), !dbg !3332
  %0 = load i16, i16* %value.addr, align 2, !dbg !3333
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3334
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3335
  ret i16 %call, !dbg !3336
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3337 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3338, metadata !DIExpression()), !dbg !3339
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3340, metadata !DIExpression()), !dbg !3341
  %0 = load i16, i16* %value.addr, align 2, !dbg !3342
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3343
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3344
  ret i16 %call, !dbg !3345
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3346 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3347, metadata !DIExpression()), !dbg !3348
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3349, metadata !DIExpression()), !dbg !3350
  %0 = load i16, i16* %value.addr, align 2, !dbg !3351
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3352
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3353
  ret i16 %call, !dbg !3354
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3355 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3356, metadata !DIExpression()), !dbg !3357
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3358, metadata !DIExpression()), !dbg !3359
  %0 = load i16, i16* %value.addr, align 2, !dbg !3360
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3361
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3362
  ret i16 %call, !dbg !3363
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3364 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3365, metadata !DIExpression()), !dbg !3366
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3367, metadata !DIExpression()), !dbg !3368
  %0 = load i16, i16* %value.addr, align 2, !dbg !3369
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3370
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3371
  ret i16 %call, !dbg !3372
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3373 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3374, metadata !DIExpression()), !dbg !3375
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3376, metadata !DIExpression()), !dbg !3377
  %0 = load i16, i16* %value.addr, align 2, !dbg !3378
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3379
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3380
  ret i16 %call, !dbg !3381
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3382 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3383, metadata !DIExpression()), !dbg !3384
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3385, metadata !DIExpression()), !dbg !3386
  %0 = load i16, i16* %value.addr, align 2, !dbg !3387
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3388
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3389
  ret i16 %call, !dbg !3390
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3391 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3392, metadata !DIExpression()), !dbg !3393
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3394, metadata !DIExpression()), !dbg !3395
  %0 = load i16, i16* %value.addr, align 2, !dbg !3396
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3397
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3398
  ret i16 %call, !dbg !3399
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3400 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3401, metadata !DIExpression()), !dbg !3402
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3403, metadata !DIExpression()), !dbg !3404
  %0 = load i16, i16* %value.addr, align 2, !dbg !3405
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3406
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3407
  ret i16 %call, !dbg !3408
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3409 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3410, metadata !DIExpression()), !dbg !3411
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3412, metadata !DIExpression()), !dbg !3413
  %0 = load i16, i16* %value.addr, align 2, !dbg !3414
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3415
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3416
  ret i16 %call, !dbg !3417
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3418 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3419, metadata !DIExpression()), !dbg !3420
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3421, metadata !DIExpression()), !dbg !3422
  %0 = load i16, i16* %value.addr, align 2, !dbg !3423
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3424
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3425
  ret i16 %call, !dbg !3426
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3427 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3428, metadata !DIExpression()), !dbg !3429
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3430, metadata !DIExpression()), !dbg !3431
  %0 = load i16, i16* %value.addr, align 2, !dbg !3432
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3433
  %conv = zext i8 %1 to i16, !dbg !3434
  %conv1 = zext i16 %conv to i32, !dbg !3434
  %shl = shl i32 %conv1, 5, !dbg !3435
  %conv2 = trunc i32 %shl to i16, !dbg !3436
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3437
  ret i16 %call, !dbg !3438
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3439 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3440, metadata !DIExpression()), !dbg !3441
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3442, metadata !DIExpression()), !dbg !3443
  %0 = load i16, i16* %value.addr, align 2, !dbg !3444
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3445
  %conv = zext i8 %1 to i16, !dbg !3446
  %conv1 = zext i16 %conv to i32, !dbg !3446
  %shl = shl i32 %conv1, 6, !dbg !3447
  %conv2 = trunc i32 %shl to i16, !dbg !3448
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3449
  ret i16 %call, !dbg !3450
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3451 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3452, metadata !DIExpression()), !dbg !3453
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3454, metadata !DIExpression()), !dbg !3455
  %0 = load i16, i16* %value.addr, align 2, !dbg !3456
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3457
  %conv = zext i8 %1 to i16, !dbg !3458
  %conv1 = zext i16 %conv to i32, !dbg !3458
  %shl = shl i32 %conv1, 7, !dbg !3459
  %conv2 = trunc i32 %shl to i16, !dbg !3460
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3461
  ret i16 %call, !dbg !3462
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3463 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3464, metadata !DIExpression()), !dbg !3465
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3466, metadata !DIExpression()), !dbg !3467
  %0 = load i16, i16* %value.addr, align 2, !dbg !3468
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3469
  %conv = zext i8 %1 to i16, !dbg !3470
  %conv1 = zext i16 %conv to i32, !dbg !3470
  %shl = shl i32 %conv1, 7, !dbg !3471
  %conv2 = trunc i32 %shl to i16, !dbg !3472
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3473
  ret i16 %call, !dbg !3474
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3475 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3476, metadata !DIExpression()), !dbg !3477
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3478, metadata !DIExpression()), !dbg !3479
  %0 = load i16, i16* %value.addr, align 2, !dbg !3480
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3481
  %conv = zext i8 %1 to i16, !dbg !3482
  %conv1 = zext i16 %conv to i32, !dbg !3482
  %shl = shl i32 %conv1, 4, !dbg !3483
  %conv2 = trunc i32 %shl to i16, !dbg !3484
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3485
  ret i16 %call, !dbg !3486
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3487 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3488, metadata !DIExpression()), !dbg !3489
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3490, metadata !DIExpression()), !dbg !3491
  %0 = load i16, i16* %value.addr, align 2, !dbg !3492
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3493
  %conv = zext i8 %1 to i16, !dbg !3494
  %conv1 = zext i16 %conv to i32, !dbg !3494
  %shl = shl i32 %conv1, 5, !dbg !3495
  %conv2 = trunc i32 %shl to i16, !dbg !3496
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3497
  ret i16 %call, !dbg !3498
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3499 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3500, metadata !DIExpression()), !dbg !3501
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3502, metadata !DIExpression()), !dbg !3503
  %0 = load i16, i16* %value.addr, align 2, !dbg !3504
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3505
  %conv = zext i8 %1 to i16, !dbg !3506
  %conv1 = zext i16 %conv to i32, !dbg !3506
  %shl = shl i32 %conv1, 2, !dbg !3507
  %conv2 = trunc i32 %shl to i16, !dbg !3508
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3509
  ret i16 %call, !dbg !3510
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3511 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3512, metadata !DIExpression()), !dbg !3513
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3514, metadata !DIExpression()), !dbg !3515
  %0 = load i16, i16* %value.addr, align 2, !dbg !3516
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3517
  %conv = zext i8 %1 to i16, !dbg !3518
  %conv1 = zext i16 %conv to i32, !dbg !3518
  %shl = shl i32 %conv1, 6, !dbg !3519
  %conv2 = trunc i32 %shl to i16, !dbg !3520
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3521
  ret i16 %call, !dbg !3522
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3523 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3524, metadata !DIExpression()), !dbg !3525
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3526, metadata !DIExpression()), !dbg !3527
  %0 = load i16, i16* %value.addr, align 2, !dbg !3528
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3529
  %conv = zext i8 %1 to i16, !dbg !3530
  %conv1 = zext i16 %conv to i32, !dbg !3530
  %shl = shl i32 %conv1, 3, !dbg !3531
  %conv2 = trunc i32 %shl to i16, !dbg !3532
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3533
  ret i16 %call, !dbg !3534
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3535 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3536, metadata !DIExpression()), !dbg !3537
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3538, metadata !DIExpression()), !dbg !3539
  %0 = load i32, i32* %value.addr, align 4, !dbg !3540
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3541
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3542
  ret i32 %call, !dbg !3543
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3544 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3547, metadata !DIExpression()), !dbg !3548
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3549, metadata !DIExpression()), !dbg !3550
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3551, metadata !DIExpression()), !dbg !3552
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3553, metadata !DIExpression()), !dbg !3554
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3555, metadata !DIExpression()), !dbg !3556
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3557, metadata !DIExpression()), !dbg !3558
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3559, metadata !DIExpression()), !dbg !3560
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3561, metadata !DIExpression()), !dbg !3562
  %0 = load i32, i32* %value.addr, align 4, !dbg !3563
  %cmp = icmp slt i32 %0, 0, !dbg !3565
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3566

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3567
  %conv = sext i16 %1 to i32, !dbg !3567
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3568
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3569

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3570
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3571
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3572

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3573
  %conv6 = sext i16 %3 to i32, !dbg !3573
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3574
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3575

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3576
  br label %if.end, !dbg !3578

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3579
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3581
  %cmp9 = icmp slt i32 %4, 0, !dbg !3583
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3584

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3585
  %sub = sub nsw i32 0, %5, !dbg !3587
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3588
  br label %if.end13, !dbg !3589

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3590
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3592
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3593
  %conv14 = sext i16 %7 to i32, !dbg !3593
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3595
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3596

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3597
  %conv18 = sext i16 %8 to i32, !dbg !3597
  %sub19 = sub nsw i32 0, %conv18, !dbg !3599
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3600
  br label %if.end22, !dbg !3601

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3602
  %conv21 = sext i16 %9 to i32, !dbg !3602
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3604
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3605
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3606
  %mul = mul i32 %10, %11, !dbg !3607
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3608
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3609
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3610
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3611
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3612
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3613
  %15 = load i32, i32* %count.addr, align 4, !dbg !3614
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3615
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3615
  %shr = lshr i32 %14, %15, !dbg !3615, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3616
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3617
  %17 = load i32, i32* %count.addr, align 4, !dbg !3618
  %sub23 = sub i32 32, %17, !dbg !3619
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3620
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3620
  %shl = shl i32 %16, %sub23, !dbg !3620, !klee.check.shift !270
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3621
  %or = or i32 %18, %shl, !dbg !3621
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3621
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3622
  %20 = load i32, i32* %count.addr, align 4, !dbg !3624
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3625
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3625
  %shr24 = lshr i32 %19, %20, !dbg !3625, !klee.check.shift !270
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3626
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3627

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3628
  %conv28 = zext i8 %21 to i32, !dbg !3628
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3631
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3632

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3633
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3636
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3637

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3638
  store i32 %23, i32* %retval, align 4, !dbg !3639
  br label %return, !dbg !3639

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3640
  br label %return, !dbg !3640

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3641
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3644
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3645

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3646
  %sub40 = sub i32 0, %25, !dbg !3647
  store i32 %sub40, i32* %retval, align 4, !dbg !3648
  br label %return, !dbg !3648

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3649
  br label %return, !dbg !3649

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3650
  br label %return, !dbg !3650

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3652
  ret i32 %26, !dbg !3652
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3653 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3654, metadata !DIExpression()), !dbg !3655
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3656, metadata !DIExpression()), !dbg !3657
  %0 = load i32, i32* %value.addr, align 4, !dbg !3658
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3659
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3660
  ret i32 %call, !dbg !3661
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3662 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3665, metadata !DIExpression()), !dbg !3666
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3667, metadata !DIExpression()), !dbg !3668
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3669, metadata !DIExpression()), !dbg !3670
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3671, metadata !DIExpression()), !dbg !3672
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3673, metadata !DIExpression()), !dbg !3674
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3675, metadata !DIExpression()), !dbg !3676
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3677, metadata !DIExpression()), !dbg !3678
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3679, metadata !DIExpression()), !dbg !3680
  %0 = load i32, i32* %value.addr, align 4, !dbg !3681
  %cmp = icmp slt i32 %0, 0, !dbg !3683
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3684

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3685
  %conv = sext i8 %1 to i32, !dbg !3685
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3686
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3687

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3688
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3689
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3690

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3691
  %conv6 = sext i8 %3 to i32, !dbg !3691
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3692
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3693

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3694
  br label %if.end, !dbg !3696

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3697
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3699
  %cmp9 = icmp slt i32 %4, 0, !dbg !3701
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3702

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3703
  %sub = sub nsw i32 0, %5, !dbg !3705
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3706
  br label %if.end13, !dbg !3707

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3708
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3710
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3711
  %conv14 = sext i8 %7 to i32, !dbg !3711
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3713
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3714

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3715
  %conv18 = sext i8 %8 to i32, !dbg !3715
  %sub19 = sub nsw i32 0, %conv18, !dbg !3717
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3718
  br label %if.end22, !dbg !3719

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3720
  %conv21 = sext i8 %9 to i32, !dbg !3720
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3722
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3723
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3724
  %mul = mul i32 %10, %11, !dbg !3725
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3726
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3727
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3728
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3729
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3730
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3731
  %15 = load i32, i32* %count.addr, align 4, !dbg !3732
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3733
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3733
  %shr = lshr i32 %14, %15, !dbg !3733, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3734
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3735
  %17 = load i32, i32* %count.addr, align 4, !dbg !3736
  %sub23 = sub i32 32, %17, !dbg !3737
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3738
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3738
  %shl = shl i32 %16, %sub23, !dbg !3738, !klee.check.shift !270
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3739
  %or = or i32 %18, %shl, !dbg !3739
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3739
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3740
  %20 = load i32, i32* %count.addr, align 4, !dbg !3742
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3743
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3743
  %shr24 = lshr i32 %19, %20, !dbg !3743, !klee.check.shift !270
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3744
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3745

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3746
  %conv28 = zext i8 %21 to i32, !dbg !3746
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3749
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3750

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3751
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3754
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3755

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3756
  store i32 %23, i32* %retval, align 4, !dbg !3757
  br label %return, !dbg !3757

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3758
  br label %return, !dbg !3758

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3759
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3762
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3763

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3764
  %sub40 = sub i32 0, %25, !dbg !3765
  store i32 %sub40, i32* %retval, align 4, !dbg !3766
  br label %return, !dbg !3766

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3767
  br label %return, !dbg !3767

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3768
  br label %return, !dbg !3768

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3770
  ret i32 %26, !dbg !3770
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3771 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3772, metadata !DIExpression()), !dbg !3773
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3774, metadata !DIExpression()), !dbg !3775
  %0 = load i32, i32* %value.addr, align 4, !dbg !3776
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3777
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3778
  ret i32 %call, !dbg !3779
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3780 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3783, metadata !DIExpression()), !dbg !3784
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3785, metadata !DIExpression()), !dbg !3786
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3787, metadata !DIExpression()), !dbg !3788
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3789, metadata !DIExpression()), !dbg !3790
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3791, metadata !DIExpression()), !dbg !3792
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3793, metadata !DIExpression()), !dbg !3794
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3795, metadata !DIExpression()), !dbg !3796
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3797, metadata !DIExpression()), !dbg !3798
  %0 = load i32, i32* %value.addr, align 4, !dbg !3799
  %cmp = icmp slt i32 %0, 0, !dbg !3801
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3802

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3803
  %conv = zext i16 %1 to i32, !dbg !3803
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3804
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3805

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3806
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3807
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3808

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3809
  %conv6 = zext i16 %3 to i32, !dbg !3809
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3810
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3811

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3812
  br label %if.end, !dbg !3814

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3815
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3817
  %cmp9 = icmp slt i32 %4, 0, !dbg !3819
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3820

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3821
  %sub = sub nsw i32 0, %5, !dbg !3823
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3824
  br label %if.end13, !dbg !3825

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3826
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3828
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3829
  %conv14 = zext i16 %7 to i32, !dbg !3829
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3831
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3832

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3833
  %conv18 = zext i16 %8 to i32, !dbg !3833
  %sub19 = sub nsw i32 0, %conv18, !dbg !3835
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3836
  br label %if.end22, !dbg !3837

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3838
  %conv21 = zext i16 %9 to i32, !dbg !3838
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3840
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3841
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3842
  %mul = mul i32 %10, %11, !dbg !3843
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3844
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3845
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3846
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3847
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3848
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3849
  %15 = load i32, i32* %count.addr, align 4, !dbg !3850
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3851
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3851
  %shr = lshr i32 %14, %15, !dbg !3851, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3852
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3853
  %17 = load i32, i32* %count.addr, align 4, !dbg !3854
  %sub23 = sub i32 32, %17, !dbg !3855
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3856
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3856
  %shl = shl i32 %16, %sub23, !dbg !3856, !klee.check.shift !270
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3857
  %or = or i32 %18, %shl, !dbg !3857
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3857
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3858
  %20 = load i32, i32* %count.addr, align 4, !dbg !3860
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3861
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3861
  %shr24 = lshr i32 %19, %20, !dbg !3861, !klee.check.shift !270
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3862
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3863

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3864
  %conv28 = zext i8 %21 to i32, !dbg !3864
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3867
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3868

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3869
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3872
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3873

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3874
  store i32 %23, i32* %retval, align 4, !dbg !3875
  br label %return, !dbg !3875

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3876
  br label %return, !dbg !3876

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3877
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3880
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3881

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3882
  %sub40 = sub i32 0, %25, !dbg !3883
  store i32 %sub40, i32* %retval, align 4, !dbg !3884
  br label %return, !dbg !3884

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3885
  br label %return, !dbg !3885

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3886
  br label %return, !dbg !3886

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3888
  ret i32 %26, !dbg !3888
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3889 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3890, metadata !DIExpression()), !dbg !3891
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3892, metadata !DIExpression()), !dbg !3893
  %0 = load i32, i32* %value.addr, align 4, !dbg !3894
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3895
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3896
  ret i32 %call, !dbg !3897
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3898 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3901, metadata !DIExpression()), !dbg !3902
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3903, metadata !DIExpression()), !dbg !3904
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3905, metadata !DIExpression()), !dbg !3906
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3907, metadata !DIExpression()), !dbg !3908
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3909, metadata !DIExpression()), !dbg !3910
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3911, metadata !DIExpression()), !dbg !3912
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3913, metadata !DIExpression()), !dbg !3914
  %0 = load i32, i32* %value.addr, align 4, !dbg !3915
  %cmp = icmp slt i32 %0, 0, !dbg !3917
  br i1 %cmp, label %if.then, label %if.else, !dbg !3918

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3919
  %1 = load i32, i32* %value.addr, align 4, !dbg !3921
  %sub = sub nsw i32 0, %1, !dbg !3922
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3923
  br label %if.end, !dbg !3924

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3925
  %2 = load i32, i32* %value.addr, align 4, !dbg !3927
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3928
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3929
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3930
  %conv = zext i8 %4 to i32, !dbg !3930
  %mul = mul i32 %3, %conv, !dbg !3931
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3932
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3933
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3934
  %conv1 = zext i8 %6 to i32, !dbg !3934
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3935
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3936
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3937
  %8 = load i32, i32* %count.addr, align 4, !dbg !3938
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3939
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3939
  %shr = lshr i32 %7, %8, !dbg !3939, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3940
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3941
  %10 = load i32, i32* %count.addr, align 4, !dbg !3942
  %sub2 = sub i32 32, %10, !dbg !3943
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3944
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3944
  %shl = shl i32 %9, %sub2, !dbg !3944, !klee.check.shift !270
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3945
  %or = or i32 %11, %shl, !dbg !3945
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3945
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3946
  %13 = load i32, i32* %count.addr, align 4, !dbg !3948
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3949
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3949
  %shr3 = lshr i32 %12, %13, !dbg !3949, !klee.check.shift !270
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3950
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3951

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3952
  %conv7 = zext i8 %14 to i32, !dbg !3952
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3955
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3956

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3957
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3960
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3961

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3962
  store i32 %16, i32* %retval, align 4, !dbg !3963
  br label %return, !dbg !3963

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3964
  br label %return, !dbg !3964

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3965
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3968
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3969

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3970
  %sub19 = sub i32 0, %18, !dbg !3972
  store i32 %sub19, i32* %retval, align 4, !dbg !3973
  br label %return, !dbg !3973

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3974
  br label %return, !dbg !3974

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3976
  %conv22 = zext i8 %19 to i32, !dbg !3976
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3979
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3980

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3981
  br label %return, !dbg !3981

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3983
  br label %return, !dbg !3983

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3985
  ret i32 %20, !dbg !3985
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3986 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3987, metadata !DIExpression()), !dbg !3988
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3989, metadata !DIExpression()), !dbg !3990
  %0 = load i8, i8* %value.addr, align 1, !dbg !3991
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3992
  %conv = zext i8 %1 to i16, !dbg !3993
  %conv1 = zext i16 %conv to i32, !dbg !3993
  %shl = shl i32 %conv1, 5, !dbg !3994
  %conv2 = trunc i32 %shl to i16, !dbg !3995
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !3996
  ret i8 %call, !dbg !3997
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !3998 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3999, metadata !DIExpression()), !dbg !4000
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4001, metadata !DIExpression()), !dbg !4002
  %0 = load i8, i8* %value.addr, align 1, !dbg !4003
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4004
  %conv = zext i8 %1 to i16, !dbg !4005
  %conv1 = zext i16 %conv to i32, !dbg !4005
  %shl = shl i32 %conv1, 6, !dbg !4006
  %conv2 = trunc i32 %shl to i16, !dbg !4007
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4008
  ret i8 %call, !dbg !4009
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4010 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4011, metadata !DIExpression()), !dbg !4012
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4013, metadata !DIExpression()), !dbg !4014
  %0 = load i8, i8* %value.addr, align 1, !dbg !4015
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4016
  %conv = zext i8 %1 to i16, !dbg !4017
  %conv1 = zext i16 %conv to i32, !dbg !4017
  %shl = shl i32 %conv1, 7, !dbg !4018
  %conv2 = trunc i32 %shl to i16, !dbg !4019
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4020
  ret i8 %call, !dbg !4021
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4022 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4023, metadata !DIExpression()), !dbg !4024
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4025, metadata !DIExpression()), !dbg !4026
  %0 = load i8, i8* %value.addr, align 1, !dbg !4027
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4028
  %conv = zext i8 %1 to i16, !dbg !4029
  %conv1 = zext i16 %conv to i32, !dbg !4029
  %shl = shl i32 %conv1, 7, !dbg !4030
  %conv2 = trunc i32 %shl to i16, !dbg !4031
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4032
  ret i8 %call, !dbg !4033
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4034 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4035, metadata !DIExpression()), !dbg !4036
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4037, metadata !DIExpression()), !dbg !4038
  %0 = load i8, i8* %value.addr, align 1, !dbg !4039
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4040
  %conv = zext i8 %1 to i16, !dbg !4041
  %conv1 = zext i16 %conv to i32, !dbg !4041
  %shl = shl i32 %conv1, 4, !dbg !4042
  %conv2 = trunc i32 %shl to i16, !dbg !4043
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4044
  ret i8 %call, !dbg !4045
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4046 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4047, metadata !DIExpression()), !dbg !4048
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4049, metadata !DIExpression()), !dbg !4050
  %0 = load i8, i8* %value.addr, align 1, !dbg !4051
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4052
  %conv = zext i8 %1 to i16, !dbg !4053
  %conv1 = zext i16 %conv to i32, !dbg !4053
  %shl = shl i32 %conv1, 5, !dbg !4054
  %conv2 = trunc i32 %shl to i16, !dbg !4055
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4056
  ret i8 %call, !dbg !4057
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4058 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4059, metadata !DIExpression()), !dbg !4060
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4061, metadata !DIExpression()), !dbg !4062
  %0 = load i8, i8* %value.addr, align 1, !dbg !4063
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4064
  %conv = zext i8 %1 to i16, !dbg !4065
  %conv1 = zext i16 %conv to i32, !dbg !4065
  %shl = shl i32 %conv1, 2, !dbg !4066
  %conv2 = trunc i32 %shl to i16, !dbg !4067
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4068
  ret i8 %call, !dbg !4069
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4070 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4071, metadata !DIExpression()), !dbg !4072
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4073, metadata !DIExpression()), !dbg !4074
  %0 = load i8, i8* %value.addr, align 1, !dbg !4075
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4076
  %conv = zext i8 %1 to i16, !dbg !4077
  %conv1 = zext i16 %conv to i32, !dbg !4077
  %shl = shl i32 %conv1, 6, !dbg !4078
  %conv2 = trunc i32 %shl to i16, !dbg !4079
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4080
  ret i8 %call, !dbg !4081
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4082 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4083, metadata !DIExpression()), !dbg !4084
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4085, metadata !DIExpression()), !dbg !4086
  %0 = load i8, i8* %value.addr, align 1, !dbg !4087
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4088
  %conv = zext i8 %1 to i16, !dbg !4089
  %conv1 = zext i16 %conv to i32, !dbg !4089
  %shl = shl i32 %conv1, 3, !dbg !4090
  %conv2 = trunc i32 %shl to i16, !dbg !4091
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4092
  ret i8 %call, !dbg !4093
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4094 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4095, metadata !DIExpression()), !dbg !4096
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4097, metadata !DIExpression()), !dbg !4098
  %0 = load i16, i16* %value.addr, align 2, !dbg !4099
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4100
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4101
  ret i16 %call, !dbg !4102
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4103 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4104, metadata !DIExpression()), !dbg !4105
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4106, metadata !DIExpression()), !dbg !4107
  %0 = load i16, i16* %value.addr, align 2, !dbg !4108
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4109
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4110
  ret i16 %call, !dbg !4111
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4112 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4113, metadata !DIExpression()), !dbg !4114
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4115, metadata !DIExpression()), !dbg !4116
  %0 = load i16, i16* %value.addr, align 2, !dbg !4117
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4118
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4119
  ret i16 %call, !dbg !4120
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4121 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4122, metadata !DIExpression()), !dbg !4123
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4124, metadata !DIExpression()), !dbg !4125
  %0 = load i16, i16* %value.addr, align 2, !dbg !4126
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4127
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4128
  ret i16 %call, !dbg !4129
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4130 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4131, metadata !DIExpression()), !dbg !4132
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4133, metadata !DIExpression()), !dbg !4134
  %0 = load i16, i16* %value.addr, align 2, !dbg !4135
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4136
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4137
  ret i16 %call, !dbg !4138
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4139 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4140, metadata !DIExpression()), !dbg !4141
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4142, metadata !DIExpression()), !dbg !4143
  %0 = load i16, i16* %value.addr, align 2, !dbg !4144
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4145
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4146
  ret i16 %call, !dbg !4147
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4148 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4149, metadata !DIExpression()), !dbg !4150
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4151, metadata !DIExpression()), !dbg !4152
  %0 = load i16, i16* %value.addr, align 2, !dbg !4153
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4154
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4155
  ret i16 %call, !dbg !4156
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4157 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4158, metadata !DIExpression()), !dbg !4159
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4160, metadata !DIExpression()), !dbg !4161
  %0 = load i16, i16* %value.addr, align 2, !dbg !4162
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4163
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4164
  ret i16 %call, !dbg !4165
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4166 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4167, metadata !DIExpression()), !dbg !4168
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4169, metadata !DIExpression()), !dbg !4170
  %0 = load i16, i16* %value.addr, align 2, !dbg !4171
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4172
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4173
  ret i16 %call, !dbg !4174
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4175 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4176, metadata !DIExpression()), !dbg !4177
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4178, metadata !DIExpression()), !dbg !4179
  %0 = load i16, i16* %value.addr, align 2, !dbg !4180
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4181
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4182
  ret i16 %call, !dbg !4183
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4184 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4185, metadata !DIExpression()), !dbg !4186
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4187, metadata !DIExpression()), !dbg !4188
  %0 = load i16, i16* %value.addr, align 2, !dbg !4189
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4190
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4191
  ret i16 %call, !dbg !4192
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4193 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4194, metadata !DIExpression()), !dbg !4195
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4196, metadata !DIExpression()), !dbg !4197
  %0 = load i16, i16* %value.addr, align 2, !dbg !4198
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4199
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4200
  ret i16 %call, !dbg !4201
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4202 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4203, metadata !DIExpression()), !dbg !4204
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4205, metadata !DIExpression()), !dbg !4206
  %0 = load i16, i16* %value.addr, align 2, !dbg !4207
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4208
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4209
  ret i16 %call, !dbg !4210
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4211 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4212, metadata !DIExpression()), !dbg !4213
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4214, metadata !DIExpression()), !dbg !4215
  %0 = load i16, i16* %value.addr, align 2, !dbg !4216
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4217
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4218
  ret i16 %call, !dbg !4219
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4220 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4221, metadata !DIExpression()), !dbg !4222
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4223, metadata !DIExpression()), !dbg !4224
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4225
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4226
  %conv = zext i8 %1 to i16, !dbg !4227
  %conv1 = zext i16 %conv to i32, !dbg !4227
  %shl = shl i32 %conv1, 5, !dbg !4228
  %conv2 = trunc i32 %shl to i16, !dbg !4229
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4230
  ret i16 %call, !dbg !4231
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4232 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4233, metadata !DIExpression()), !dbg !4234
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4235, metadata !DIExpression()), !dbg !4236
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4237
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4238
  %conv = zext i8 %1 to i16, !dbg !4239
  %conv1 = zext i16 %conv to i32, !dbg !4239
  %shl = shl i32 %conv1, 6, !dbg !4240
  %conv2 = trunc i32 %shl to i16, !dbg !4241
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4242
  ret i16 %call, !dbg !4243
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4244 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4245, metadata !DIExpression()), !dbg !4246
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4247, metadata !DIExpression()), !dbg !4248
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4249
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4250
  %conv = zext i8 %1 to i16, !dbg !4251
  %conv1 = zext i16 %conv to i32, !dbg !4251
  %shl = shl i32 %conv1, 7, !dbg !4252
  %conv2 = trunc i32 %shl to i16, !dbg !4253
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4254
  ret i16 %call, !dbg !4255
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4256 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4257, metadata !DIExpression()), !dbg !4258
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4259, metadata !DIExpression()), !dbg !4260
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4261
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4262
  %conv = zext i8 %1 to i16, !dbg !4263
  %conv1 = zext i16 %conv to i32, !dbg !4263
  %shl = shl i32 %conv1, 7, !dbg !4264
  %conv2 = trunc i32 %shl to i16, !dbg !4265
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4266
  ret i16 %call, !dbg !4267
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4268 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4269, metadata !DIExpression()), !dbg !4270
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4271, metadata !DIExpression()), !dbg !4272
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4273
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4274
  %conv = zext i8 %1 to i16, !dbg !4275
  %conv1 = zext i16 %conv to i32, !dbg !4275
  %shl = shl i32 %conv1, 4, !dbg !4276
  %conv2 = trunc i32 %shl to i16, !dbg !4277
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4278
  ret i16 %call, !dbg !4279
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4280 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4281, metadata !DIExpression()), !dbg !4282
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4283, metadata !DIExpression()), !dbg !4284
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4285
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4286
  %conv = zext i8 %1 to i16, !dbg !4287
  %conv1 = zext i16 %conv to i32, !dbg !4287
  %shl = shl i32 %conv1, 5, !dbg !4288
  %conv2 = trunc i32 %shl to i16, !dbg !4289
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4290
  ret i16 %call, !dbg !4291
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4292 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4293, metadata !DIExpression()), !dbg !4294
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4295, metadata !DIExpression()), !dbg !4296
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4297
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4298
  %conv = zext i8 %1 to i16, !dbg !4299
  %conv1 = zext i16 %conv to i32, !dbg !4299
  %shl = shl i32 %conv1, 2, !dbg !4300
  %conv2 = trunc i32 %shl to i16, !dbg !4301
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4302
  ret i16 %call, !dbg !4303
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4304 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4305, metadata !DIExpression()), !dbg !4306
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4307, metadata !DIExpression()), !dbg !4308
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4309
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4310
  %conv = zext i8 %1 to i16, !dbg !4311
  %conv1 = zext i16 %conv to i32, !dbg !4311
  %shl = shl i32 %conv1, 6, !dbg !4312
  %conv2 = trunc i32 %shl to i16, !dbg !4313
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4314
  ret i16 %call, !dbg !4315
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4316 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4317, metadata !DIExpression()), !dbg !4318
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4319, metadata !DIExpression()), !dbg !4320
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4321
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4322
  %conv = zext i8 %1 to i16, !dbg !4323
  %conv1 = zext i16 %conv to i32, !dbg !4323
  %shl = shl i32 %conv1, 3, !dbg !4324
  %conv2 = trunc i32 %shl to i16, !dbg !4325
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4326
  ret i16 %call, !dbg !4327
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4328 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4329, metadata !DIExpression()), !dbg !4330
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4331, metadata !DIExpression()), !dbg !4332
  %0 = load i32, i32* %value.addr, align 4, !dbg !4333
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4334
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4335
  ret i32 %call, !dbg !4336
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4337 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4340, metadata !DIExpression()), !dbg !4341
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4342, metadata !DIExpression()), !dbg !4343
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4344, metadata !DIExpression()), !dbg !4345
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4346, metadata !DIExpression()), !dbg !4347
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4348, metadata !DIExpression()), !dbg !4349
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4350, metadata !DIExpression()), !dbg !4351
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4352, metadata !DIExpression()), !dbg !4353
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4354
  %conv = sext i16 %0 to i32, !dbg !4354
  %cmp = icmp slt i32 %conv, 0, !dbg !4356
  br i1 %cmp, label %if.then, label %if.else, !dbg !4357

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4358
  br label %if.end, !dbg !4360

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4361
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4363
  %conv2 = sext i16 %1 to i32, !dbg !4363
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4365
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4366

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4367
  %conv6 = sext i16 %2 to i32, !dbg !4367
  %sub = sub nsw i32 0, %conv6, !dbg !4369
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4370
  br label %if.end9, !dbg !4371

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4372
  %conv8 = sext i16 %3 to i32, !dbg !4372
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4374
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4375
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4376
  %mul = mul i32 %4, %5, !dbg !4377
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4378
  %6 = load i32, i32* %value.addr, align 4, !dbg !4379
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4380
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4381
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4382
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4383
  %9 = load i32, i32* %count.addr, align 4, !dbg !4384
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4385
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4385
  %shr = lshr i32 %8, %9, !dbg !4385, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4386
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4387
  %11 = load i32, i32* %count.addr, align 4, !dbg !4388
  %sub10 = sub i32 32, %11, !dbg !4389
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4390
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4390
  %shl = shl i32 %10, %sub10, !dbg !4390, !klee.check.shift !270
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4391
  %or = or i32 %12, %shl, !dbg !4391
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4391
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4392
  %14 = load i32, i32* %count.addr, align 4, !dbg !4394
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4395
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4395
  %shr11 = lshr i32 %13, %14, !dbg !4395, !klee.check.shift !270
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4396
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4397

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4398
  %conv15 = zext i8 %15 to i32, !dbg !4398
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4401
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4402

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4403
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4406
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4407

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4408
  store i32 %17, i32* %retval, align 4, !dbg !4409
  br label %return, !dbg !4409

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4410
  br label %return, !dbg !4410

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4411
  br label %return, !dbg !4411

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4413
  br label %return, !dbg !4413

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4415
  ret i32 %18, !dbg !4415
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4416 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4417, metadata !DIExpression()), !dbg !4418
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4419, metadata !DIExpression()), !dbg !4420
  %0 = load i32, i32* %value.addr, align 4, !dbg !4421
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4422
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4423
  ret i32 %call, !dbg !4424
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4425 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4428, metadata !DIExpression()), !dbg !4429
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4430, metadata !DIExpression()), !dbg !4431
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4432, metadata !DIExpression()), !dbg !4433
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4434, metadata !DIExpression()), !dbg !4435
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4436, metadata !DIExpression()), !dbg !4437
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4438, metadata !DIExpression()), !dbg !4439
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4440
  %cmp = icmp slt i32 %0, 0, !dbg !4442
  br i1 %cmp, label %if.then, label %if.else, !dbg !4443

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4444
  br label %if.end, !dbg !4446

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4447
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4449
  %cmp1 = icmp slt i32 %1, 0, !dbg !4451
  br i1 %cmp1, label %if.then2, label %if.else5, !dbg !4452

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4453
  %conv = sext i32 %2 to i64, !dbg !4456
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !4457
  %tobool = icmp ne i32 %call, 0, !dbg !4457
  br i1 %tobool, label %if.end4, label %if.then3, !dbg !4458

if.then3:                                         ; preds = %if.then2
  store i32 0, i32* %retval, align 4, !dbg !4459
  br label %return, !dbg !4459

if.end4:                                          ; preds = %if.then2
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4461
  %sub = sub nsw i32 0, %3, !dbg !4462
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4463
  br label %if.end6, !dbg !4464

if.else5:                                         ; preds = %if.end
  %4 = load i32, i32* %factor.addr, align 4, !dbg !4465
  store i32 %4, i32* %u32Temp1, align 4, !dbg !4467
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.end4
  %5 = load i32, i32* %value.addr, align 4, !dbg !4468
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !4469
  %call7 = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !4470
  store i32 %call7, i32* %u32Temp2, align 4, !dbg !4471
  %7 = load i32, i32* %count.addr, align 4, !dbg !4472
  %sub8 = sub i32 %7, 32, !dbg !4474
  %conv9 = zext i32 %sub8 to i64, !dbg !4475
  %call10 = call i32 @klee_alarm_shift_count_valid(i64 %conv9, i64 32), !dbg !4476
  %tobool11 = icmp ne i32 %call10, 0, !dbg !4476
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !4477

if.then12:                                        ; preds = %if.end6
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 5380, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !4478
  unreachable, !dbg !4478

if.end13:                                         ; preds = %if.end6
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4480
  %9 = load i32, i32* %count.addr, align 4, !dbg !4481
  %sub14 = sub i32 %9, 32, !dbg !4482
  %int_cast_to_i64 = zext i32 %sub14 to i64, !dbg !4483
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4483
  %shr = lshr i32 %8, %sub14, !dbg !4483, !klee.check.shift !270
  %conv15 = zext i32 %shr to i64, !dbg !4484
  store volatile i64 %conv15, i64* @klee_alarm_sink_s64, align 8, !dbg !4485
  store i32 0, i32* %retval, align 4, !dbg !4486
  br label %return, !dbg !4486

return:                                           ; preds = %if.end13, %if.then3
  %10 = load i32, i32* %retval, align 4, !dbg !4487
  ret i32 %10, !dbg !4487
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !4488 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !4491, metadata !DIExpression()), !dbg !4492
  %0 = load i64, i64* %value.addr, align 8, !dbg !4493
  %cmp = icmp ne i64 %0, -2147483648, !dbg !4494
  %conv = zext i1 %cmp to i32, !dbg !4494
  ret i32 %conv, !dbg !4495
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_shift_count_valid(i64 %count, i64 %width) #0 !dbg !4496 {
entry:
  %count.addr = alloca i64, align 8
  %width.addr = alloca i64, align 8
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !4499, metadata !DIExpression()), !dbg !4500
  store i64 %width, i64* %width.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %width.addr, metadata !4501, metadata !DIExpression()), !dbg !4502
  %0 = load i64, i64* %count.addr, align 8, !dbg !4503
  %cmp = icmp sge i64 %0, 0, !dbg !4504
  %1 = load i64, i64* %count.addr, align 8, !dbg !4505
  %2 = load i64, i64* %width.addr, align 8, !dbg !4505
  %cmp1 = icmp slt i64 %1, %2, !dbg !4505
  %3 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !4505
  %land.ext = zext i1 %3 to i32, !dbg !4505
  ret i32 %land.ext, !dbg !4506
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4507 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4508, metadata !DIExpression()), !dbg !4509
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4510, metadata !DIExpression()), !dbg !4511
  %0 = load i32, i32* %value.addr, align 4, !dbg !4512
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4513
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4514
  ret i32 %call, !dbg !4515
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4516 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4519, metadata !DIExpression()), !dbg !4520
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4521, metadata !DIExpression()), !dbg !4522
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4523, metadata !DIExpression()), !dbg !4524
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4525, metadata !DIExpression()), !dbg !4526
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4527, metadata !DIExpression()), !dbg !4528
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4529, metadata !DIExpression()), !dbg !4530
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4531, metadata !DIExpression()), !dbg !4532
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4533
  %conv = sext i8 %0 to i32, !dbg !4533
  %cmp = icmp slt i32 %conv, 0, !dbg !4535
  br i1 %cmp, label %if.then, label %if.else, !dbg !4536

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4537
  br label %if.end, !dbg !4539

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4540
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4542
  %conv2 = sext i8 %1 to i32, !dbg !4542
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4544
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4545

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4546
  %conv6 = sext i8 %2 to i32, !dbg !4546
  %sub = sub nsw i32 0, %conv6, !dbg !4548
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4549
  br label %if.end9, !dbg !4550

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4551
  %conv8 = sext i8 %3 to i32, !dbg !4551
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4553
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4554
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4555
  %mul = mul i32 %4, %5, !dbg !4556
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4557
  %6 = load i32, i32* %value.addr, align 4, !dbg !4558
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4559
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4560
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4561
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4562
  %9 = load i32, i32* %count.addr, align 4, !dbg !4563
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4564
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4564
  %shr = lshr i32 %8, %9, !dbg !4564, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4565
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4566
  %11 = load i32, i32* %count.addr, align 4, !dbg !4567
  %sub10 = sub i32 32, %11, !dbg !4568
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4569
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4569
  %shl = shl i32 %10, %sub10, !dbg !4569, !klee.check.shift !270
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4570
  %or = or i32 %12, %shl, !dbg !4570
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4570
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4571
  %14 = load i32, i32* %count.addr, align 4, !dbg !4573
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4574
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4574
  %shr11 = lshr i32 %13, %14, !dbg !4574, !klee.check.shift !270
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4575
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4576

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4577
  %conv15 = zext i8 %15 to i32, !dbg !4577
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4580
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4581

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4582
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4585
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4586

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4587
  store i32 %17, i32* %retval, align 4, !dbg !4588
  br label %return, !dbg !4588

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4589
  br label %return, !dbg !4589

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4590
  br label %return, !dbg !4590

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4592
  br label %return, !dbg !4592

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4594
  ret i32 %18, !dbg !4594
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4595 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4596, metadata !DIExpression()), !dbg !4597
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4598, metadata !DIExpression()), !dbg !4599
  %0 = load i32, i32* %value.addr, align 4, !dbg !4600
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4601
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4602
  ret i32 %call, !dbg !4603
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4604 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4605, metadata !DIExpression()), !dbg !4606
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4607, metadata !DIExpression()), !dbg !4608
  %0 = load i32, i32* %value.addr, align 4, !dbg !4609
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4610
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4611
  ret i32 %call, !dbg !4612
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4613 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4616, metadata !DIExpression()), !dbg !4617
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4618, metadata !DIExpression()), !dbg !4619
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4620, metadata !DIExpression()), !dbg !4621
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4622, metadata !DIExpression()), !dbg !4623
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4624, metadata !DIExpression()), !dbg !4625
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4626, metadata !DIExpression()), !dbg !4627
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4628, metadata !DIExpression()), !dbg !4629
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4630, metadata !DIExpression()), !dbg !4631
  %0 = load i32, i32* %value.addr, align 4, !dbg !4632
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4633
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4634
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4635
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4636
  %3 = load i32, i32* %count.addr, align 4, !dbg !4637
  %sub = sub i32 %3, 32, !dbg !4638
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4639
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4639
  %shr = lshr i32 %2, %sub, !dbg !4639, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4640
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4641
  ret i32 %4, !dbg !4642
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4643 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4644, metadata !DIExpression()), !dbg !4645
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4646, metadata !DIExpression()), !dbg !4647
  %0 = load i32, i32* %value.addr, align 4, !dbg !4648
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4649
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4650
  ret i32 %call, !dbg !4651
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4652 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4655, metadata !DIExpression()), !dbg !4656
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4657, metadata !DIExpression()), !dbg !4658
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4659, metadata !DIExpression()), !dbg !4660
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4661, metadata !DIExpression()), !dbg !4662
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4663, metadata !DIExpression()), !dbg !4664
  %0 = load i32, i32* %value.addr, align 4, !dbg !4665
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4666
  %conv = zext i8 %1 to i32, !dbg !4666
  %mul = mul i32 %0, %conv, !dbg !4667
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4668
  %2 = load i32, i32* %value.addr, align 4, !dbg !4669
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4670
  %conv1 = zext i8 %3 to i32, !dbg !4670
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4671
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4672
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4673
  %5 = load i32, i32* %count.addr, align 4, !dbg !4674
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4675
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4675
  %shr = lshr i32 %4, %5, !dbg !4675, !klee.check.shift !270
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4676
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4677
  %7 = load i32, i32* %count.addr, align 4, !dbg !4678
  %sub = sub i32 32, %7, !dbg !4679
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4680
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4680
  %shl = shl i32 %6, %sub, !dbg !4680, !klee.check.shift !270
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4681
  %or = or i32 %8, %shl, !dbg !4681
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4681
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4682
  %10 = load i32, i32* %count.addr, align 4, !dbg !4684
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4685
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4685
  %shr2 = lshr i32 %9, %10, !dbg !4685, !klee.check.shift !270
  %cmp = icmp eq i32 %shr2, 0, !dbg !4686
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4687

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4688
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4691
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4692

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4693
  store i32 %12, i32* %retval, align 4, !dbg !4694
  br label %return, !dbg !4694

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4695
  br label %return, !dbg !4695

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4696
  br label %return, !dbg !4696

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4698
  ret i32 %13, !dbg !4698
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4699 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4700, metadata !DIExpression()), !dbg !4701
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4702, metadata !DIExpression()), !dbg !4703
  %0 = load i8, i8* %value.addr, align 1, !dbg !4704
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4705
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4706
  ret i8 %call, !dbg !4707
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4708 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4709, metadata !DIExpression()), !dbg !4710
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4711, metadata !DIExpression()), !dbg !4712
  %0 = load i8, i8* %value.addr, align 1, !dbg !4713
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4714
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4715
  ret i8 %call, !dbg !4716
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4717 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4718, metadata !DIExpression()), !dbg !4719
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4720, metadata !DIExpression()), !dbg !4721
  %0 = load i8, i8* %value.addr, align 1, !dbg !4722
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4723
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4724
  ret i8 %call, !dbg !4725
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4726 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4727, metadata !DIExpression()), !dbg !4728
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4729, metadata !DIExpression()), !dbg !4730
  %0 = load i8, i8* %value.addr, align 1, !dbg !4731
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4732
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4733
  ret i8 %call, !dbg !4734
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4735 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4736, metadata !DIExpression()), !dbg !4737
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4738, metadata !DIExpression()), !dbg !4739
  %0 = load i8, i8* %value.addr, align 1, !dbg !4740
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4741
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4742
  ret i8 %call, !dbg !4743
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4744 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4745, metadata !DIExpression()), !dbg !4746
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4747, metadata !DIExpression()), !dbg !4748
  %0 = load i8, i8* %value.addr, align 1, !dbg !4749
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4750
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4751
  ret i8 %call, !dbg !4752
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4753 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4754, metadata !DIExpression()), !dbg !4755
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4756, metadata !DIExpression()), !dbg !4757
  %0 = load i8, i8* %value.addr, align 1, !dbg !4758
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4759
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4760
  ret i8 %call, !dbg !4761
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4762 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4763, metadata !DIExpression()), !dbg !4764
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4765, metadata !DIExpression()), !dbg !4766
  %0 = load i8, i8* %value.addr, align 1, !dbg !4767
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4768
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4769
  ret i8 %call, !dbg !4770
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4771 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4772, metadata !DIExpression()), !dbg !4773
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4774, metadata !DIExpression()), !dbg !4775
  %0 = load i8, i8* %value.addr, align 1, !dbg !4776
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4777
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4778
  ret i8 %call, !dbg !4779
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4780 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4782, metadata !DIExpression()), !dbg !4783
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4784, metadata !DIExpression()), !dbg !4785
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4786, metadata !DIExpression()), !dbg !4787
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4788, metadata !DIExpression()), !dbg !4789
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4790, metadata !DIExpression()), !dbg !4791
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4792, metadata !DIExpression()), !dbg !4793
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4794, metadata !DIExpression()), !dbg !4795
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4796, metadata !DIExpression()), !dbg !4797
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4798, metadata !DIExpression()), !dbg !4799
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4800, metadata !DIExpression()), !dbg !4801
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4802, metadata !DIExpression()), !dbg !4803
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4804, metadata !DIExpression()), !dbg !4805
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4806
  %and = and i32 %0, 65535, !dbg !4807
  %conv = trunc i32 %and to i16, !dbg !4806
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4808
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4809
  %and1 = and i32 %1, -65536, !dbg !4810
  %shr = lshr i32 %and1, 16, !dbg !4811
  %conv2 = trunc i32 %shr to i16, !dbg !4812
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4813
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4814
  %and3 = and i32 %2, 65535, !dbg !4815
  %conv4 = trunc i32 %and3 to i16, !dbg !4814
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4816
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4817
  %and5 = and i32 %3, -65536, !dbg !4818
  %shr6 = lshr i32 %and5, 16, !dbg !4819
  %conv7 = trunc i32 %shr6 to i16, !dbg !4820
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4821
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4822
  %conv8 = zext i16 %4 to i32, !dbg !4824
  %conv9 = sext i32 %conv8 to i64, !dbg !4825
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4826
  %conv10 = zext i16 %5 to i32, !dbg !4827
  %conv11 = sext i32 %conv10 to i64, !dbg !4828
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !4829
  %tobool = icmp ne i32 %call, 0, !dbg !4829
  br i1 %tobool, label %if.end, label %if.then, !dbg !4830

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !4831
  br label %return, !dbg !4831

if.end:                                           ; preds = %entry
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4833
  %conv12 = zext i16 %6 to i32, !dbg !4833
  %7 = load i16, i16* %arg2_LW, align 2, !dbg !4834
  %conv13 = zext i16 %7 to i32, !dbg !4834
  %mul = mul nsw i32 %conv12, %conv13, !dbg !4835
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4836
  %8 = load i16, i16* %arg1_LW, align 2, !dbg !4837
  %conv14 = zext i16 %8 to i32, !dbg !4837
  %9 = load i16, i16* %arg2_HW, align 2, !dbg !4838
  %conv15 = zext i16 %9 to i32, !dbg !4838
  %mul16 = mul nsw i32 %conv14, %conv15, !dbg !4839
  store i32 %mul16, i32* %MulTemp2, align 4, !dbg !4840
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4841
  %conv17 = zext i16 %10 to i32, !dbg !4843
  %conv18 = sext i32 %conv17 to i64, !dbg !4844
  %11 = load i16, i16* %arg2_LW, align 2, !dbg !4845
  %conv19 = zext i16 %11 to i32, !dbg !4846
  %conv20 = sext i32 %conv19 to i64, !dbg !4847
  %call21 = call i32 @klee_alarm_s32_mul_upper(i64 %conv18, i64 %conv20), !dbg !4848
  %tobool22 = icmp ne i32 %call21, 0, !dbg !4848
  br i1 %tobool22, label %if.end24, label %if.then23, !dbg !4849

if.then23:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !4850
  br label %return, !dbg !4850

if.end24:                                         ; preds = %if.end
  %12 = load i16, i16* %arg1_HW, align 2, !dbg !4852
  %conv25 = zext i16 %12 to i32, !dbg !4852
  %13 = load i16, i16* %arg2_LW, align 2, !dbg !4853
  %conv26 = zext i16 %13 to i32, !dbg !4853
  %mul27 = mul nsw i32 %conv25, %conv26, !dbg !4854
  store i32 %mul27, i32* %MulTemp3, align 4, !dbg !4855
  %14 = load i16, i16* %arg1_HW, align 2, !dbg !4856
  %conv28 = zext i16 %14 to i32, !dbg !4856
  %15 = load i16, i16* %arg2_HW, align 2, !dbg !4857
  %conv29 = zext i16 %15 to i32, !dbg !4857
  %mul30 = mul nsw i32 %conv28, %conv29, !dbg !4858
  store i32 %mul30, i32* %MulTemp4, align 4, !dbg !4859
  %16 = load i32, i32* %MulTemp2, align 4, !dbg !4860
  %shr31 = lshr i32 %16, 16, !dbg !4861
  %17 = load i32, i32* %MulTemp3, align 4, !dbg !4862
  %shr32 = lshr i32 %17, 16, !dbg !4863
  %add = add i32 %shr31, %shr32, !dbg !4864
  %18 = load i32, i32* %MulTemp4, align 4, !dbg !4865
  %add33 = add i32 %add, %18, !dbg !4866
  store i32 %add33, i32* %HIGHWORD, align 4, !dbg !4867
  %19 = load i32, i32* %MulTemp1, align 4, !dbg !4868
  %shr34 = lshr i32 %19, 16, !dbg !4869
  %20 = load i32, i32* %MulTemp2, align 4, !dbg !4870
  %and35 = and i32 %20, 65535, !dbg !4871
  %add36 = add i32 %shr34, %and35, !dbg !4872
  %21 = load i32, i32* %MulTemp3, align 4, !dbg !4873
  %and37 = and i32 %21, 65535, !dbg !4874
  %add38 = add i32 %add36, %and37, !dbg !4875
  store i32 %add38, i32* %OverFlow, align 4, !dbg !4876
  %22 = load i32, i32* %OverFlow, align 4, !dbg !4877
  %cmp = icmp ugt i32 %22, 65535, !dbg !4879
  br i1 %cmp, label %if.then40, label %if.else, !dbg !4880

if.then40:                                        ; preds = %if.end24
  %23 = load i32, i32* %HIGHWORD, align 4, !dbg !4881
  %24 = load i32, i32* %OverFlow, align 4, !dbg !4883
  %shr41 = lshr i32 %24, 16, !dbg !4884
  %add42 = add i32 %23, %shr41, !dbg !4885
  store i32 %add42, i32* %retval, align 4, !dbg !4886
  br label %return, !dbg !4886

if.else:                                          ; preds = %if.end24
  %25 = load i32, i32* %HIGHWORD, align 4, !dbg !4887
  store i32 %25, i32* %retval, align 4, !dbg !4889
  br label %return, !dbg !4889

return:                                           ; preds = %if.else, %if.then40, %if.then23, %if.then
  %26 = load i32, i32* %retval, align 4, !dbg !4890
  ret i32 %26, !dbg !4890
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !4891 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !4892, metadata !DIExpression()), !dbg !4893
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !4894, metadata !DIExpression()), !dbg !4895
  %0 = load i64, i64* %left.addr, align 8, !dbg !4896
  %1 = load i64, i64* %right.addr, align 8, !dbg !4897
  %mul = mul nsw i64 %0, %1, !dbg !4898
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !4899
  %conv = zext i1 %cmp to i32, !dbg !4899
  ret i32 %conv, !dbg !4900
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4901 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4902, metadata !DIExpression()), !dbg !4903
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4904, metadata !DIExpression()), !dbg !4905
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4906, metadata !DIExpression()), !dbg !4907
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4908, metadata !DIExpression()), !dbg !4909
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4910, metadata !DIExpression()), !dbg !4911
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4912, metadata !DIExpression()), !dbg !4913
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4914, metadata !DIExpression()), !dbg !4915
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4916, metadata !DIExpression()), !dbg !4917
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4918, metadata !DIExpression()), !dbg !4919
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4920, metadata !DIExpression()), !dbg !4921
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4922, metadata !DIExpression()), !dbg !4923
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4924, metadata !DIExpression()), !dbg !4925
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4926
  %and = and i32 %0, 65535, !dbg !4927
  %conv = trunc i32 %and to i16, !dbg !4926
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4928
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4929
  %and1 = and i32 %1, -65536, !dbg !4930
  %shr = lshr i32 %and1, 16, !dbg !4931
  %conv2 = trunc i32 %shr to i16, !dbg !4932
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4933
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4934
  %and3 = and i32 %2, 65535, !dbg !4935
  %conv4 = trunc i32 %and3 to i16, !dbg !4934
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4936
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4937
  %and5 = and i32 %3, -65536, !dbg !4938
  %shr6 = lshr i32 %and5, 16, !dbg !4939
  %conv7 = trunc i32 %shr6 to i16, !dbg !4940
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4941
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4942
  %conv8 = zext i16 %4 to i32, !dbg !4942
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4943
  %conv9 = zext i16 %5 to i32, !dbg !4943
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4944
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4945
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4946
  %conv10 = zext i16 %6 to i32, !dbg !4946
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4947
  %conv11 = zext i16 %7 to i32, !dbg !4947
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4948
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4949
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4950
  %conv13 = zext i16 %8 to i32, !dbg !4950
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4951
  %conv14 = zext i16 %9 to i32, !dbg !4951
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4952
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4953
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4954
  %conv16 = zext i16 %10 to i32, !dbg !4954
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4955
  %conv17 = zext i16 %11 to i32, !dbg !4955
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4956
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4957
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4958
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4959
  %and19 = and i32 %13, 65535, !dbg !4960
  %shl = shl i32 %and19, 16, !dbg !4961
  %add = add i32 %12, %shl, !dbg !4962
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4963
  %and20 = and i32 %14, 65535, !dbg !4964
  %shl21 = shl i32 %and20, 16, !dbg !4965
  %add22 = add i32 %add, %shl21, !dbg !4966
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4967
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4968
  ret i32 %15, !dbg !4969
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4970 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4976, metadata !DIExpression()), !dbg !4977
  %2 = icmp eq i64 %0, 0, !dbg !4978
  br i1 %2, label %3, label %4, !dbg !4980

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4981
  unreachable, !dbg !4981

4:                                                ; preds = %1
  ret void, !dbg !4982
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4983 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4989, metadata !DIExpression()), !dbg !4991
  call void @llvm.dbg.value(metadata i64 %1, metadata !4990, metadata !DIExpression()), !dbg !4991
  %3 = icmp ult i64 %1, %0, !dbg !4992
  br i1 %3, label %5, label %4, !dbg !4994

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4995
  unreachable, !dbg !4995

5:                                                ; preds = %2
  ret void, !dbg !4997
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!36, !2, !38, !42, !44}
!llvm.ident = !{!46, !46, !46, !47, !47}
!llvm.module.flags = !{!48, !49, !50, !51, !52}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !34, line: 21, type: !35, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !33, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/mul_Ccode_alarm_0019.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
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
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !32)
!32 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!33 = !{!0}
!34 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!35 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!36 = distinct !DICompileUnit(language: DW_LANG_C99, file: !37, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!38 = distinct !DICompileUnit(language: DW_LANG_C99, file: !39, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !40, splitDebugInlining: false, nameTableKind: None)
!39 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/MulHword_alarm_0019.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!40 = !{!26, !41}
!41 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!42 = distinct !DICompileUnit(language: DW_LANG_C89, file: !43, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!43 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!44 = distinct !DICompileUnit(language: DW_LANG_C89, file: !45, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!45 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!46 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!47 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!48 = !{i32 7, !"Dwarf Version", i32 4}
!49 = !{i32 2, !"Debug Info Version", i32 3}
!50 = !{i32 1, !"wchar_size", i32 4}
!51 = !{i32 7, !"uwtable", i32 1}
!52 = !{i32 7, !"frame-pointer", i32 2}
!53 = distinct !DISubprogram(name: "main", scope: !54, file: !54, line: 7, type: !55, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, retainedNodes: !4)
!54 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!55 = !DISubroutineType(types: !56)
!56 = !{!41}
!57 = !DILocalVariable(name: "value", scope: !53, file: !54, line: 9, type: !30)
!58 = !DILocation(line: 9, column: 14, scope: !53)
!59 = !DILocalVariable(name: "factor", scope: !53, file: !54, line: 10, type: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !41)
!62 = !DILocation(line: 10, column: 13, scope: !53)
!63 = !DILocalVariable(name: "count", scope: !53, file: !54, line: 11, type: !30)
!64 = !DILocation(line: 11, column: 14, scope: !53)
!65 = !DILocalVariable(name: "result", scope: !53, file: !54, line: 12, type: !30)
!66 = !DILocation(line: 12, column: 14, scope: !53)
!67 = !DILocation(line: 14, column: 24, scope: !53)
!68 = !DILocation(line: 14, column: 5, scope: !53)
!69 = !DILocation(line: 15, column: 24, scope: !53)
!70 = !DILocation(line: 15, column: 5, scope: !53)
!71 = !DILocation(line: 16, column: 24, scope: !53)
!72 = !DILocation(line: 16, column: 5, scope: !53)
!73 = !DILocation(line: 18, column: 45, scope: !53)
!74 = !DILocation(line: 18, column: 52, scope: !53)
!75 = !DILocation(line: 18, column: 60, scope: !53)
!76 = !DILocation(line: 18, column: 14, scope: !53)
!77 = !DILocation(line: 18, column: 12, scope: !53)
!78 = !DILocation(line: 20, column: 11, scope: !53)
!79 = !DILocation(line: 21, column: 5, scope: !53)
!80 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !81, file: !81, line: 43, type: !82, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!82 = !DISubroutineType(types: !83)
!83 = !{!6, !6, !22}
!84 = !DILocalVariable(name: "value", arg: 1, scope: !80, file: !81, line: 43, type: !6)
!85 = !DILocation(line: 43, column: 35, scope: !80)
!86 = !DILocalVariable(name: "factor", arg: 2, scope: !80, file: !81, line: 43, type: !22)
!87 = !DILocation(line: 43, column: 46, scope: !80)
!88 = !DILocalVariable(name: "s32MulTemp1", scope: !80, file: !81, line: 45, type: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !60)
!90 = !DILocation(line: 45, column: 6, scope: !80)
!91 = !DILocalVariable(name: "s32MulTemp2", scope: !80, file: !81, line: 45, type: !89)
!92 = !DILocation(line: 45, column: 24, scope: !80)
!93 = !DILocation(line: 46, column: 16, scope: !80)
!94 = !DILocation(line: 46, column: 24, scope: !80)
!95 = !DILocation(line: 46, column: 22, scope: !80)
!96 = !DILocation(line: 46, column: 14, scope: !80)
!97 = !DILocation(line: 48, column: 16, scope: !80)
!98 = !DILocation(line: 48, column: 28, scope: !80)
!99 = !DILocation(line: 48, column: 14, scope: !80)
!100 = !DILocation(line: 50, column: 6, scope: !101)
!101 = distinct !DILexicalBlock(scope: !80, file: !81, line: 50, column: 5)
!102 = !DILocation(line: 50, column: 17, scope: !101)
!103 = !DILocation(line: 50, column: 21, scope: !101)
!104 = !DILocation(line: 50, column: 25, scope: !101)
!105 = !DILocation(line: 50, column: 37, scope: !101)
!106 = !DILocation(line: 50, column: 46, scope: !101)
!107 = !DILocation(line: 50, column: 5, scope: !80)
!108 = !DILocation(line: 52, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !81, line: 51, column: 2)
!110 = !DILocation(line: 52, column: 29, scope: !109)
!111 = !DILocation(line: 52, column: 15, scope: !109)
!112 = !DILocation(line: 53, column: 14, scope: !109)
!113 = !DILocation(line: 53, column: 10, scope: !109)
!114 = !DILocation(line: 53, column: 3, scope: !109)
!115 = !DILocation(line: 57, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !101, file: !81, line: 56, column: 2)
!117 = !DILocation(line: 57, column: 10, scope: !116)
!118 = !DILocation(line: 57, column: 3, scope: !116)
!119 = !DILocation(line: 59, column: 1, scope: !80)
!120 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !81, file: !81, line: 77, type: !82, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "value", arg: 1, scope: !120, file: !81, line: 77, type: !6)
!122 = !DILocation(line: 77, column: 38, scope: !120)
!123 = !DILocalVariable(name: "factor", arg: 2, scope: !120, file: !81, line: 77, type: !22)
!124 = !DILocation(line: 77, column: 49, scope: !120)
!125 = !DILocalVariable(name: "s32MulTemp1", scope: !120, file: !81, line: 79, type: !89)
!126 = !DILocation(line: 79, column: 6, scope: !120)
!127 = !DILocalVariable(name: "s32MulTemp2", scope: !120, file: !81, line: 79, type: !89)
!128 = !DILocation(line: 79, column: 24, scope: !120)
!129 = !DILocation(line: 80, column: 16, scope: !120)
!130 = !DILocation(line: 80, column: 24, scope: !120)
!131 = !DILocation(line: 80, column: 22, scope: !120)
!132 = !DILocation(line: 80, column: 14, scope: !120)
!133 = !DILocation(line: 81, column: 16, scope: !120)
!134 = !DILocation(line: 81, column: 28, scope: !120)
!135 = !DILocation(line: 81, column: 14, scope: !120)
!136 = !DILocation(line: 82, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !120, file: !81, line: 82, column: 5)
!138 = !DILocation(line: 82, column: 17, scope: !137)
!139 = !DILocation(line: 82, column: 21, scope: !137)
!140 = !DILocation(line: 82, column: 25, scope: !137)
!141 = !DILocation(line: 82, column: 37, scope: !137)
!142 = !DILocation(line: 82, column: 44, scope: !137)
!143 = !DILocation(line: 82, column: 5, scope: !120)
!144 = !DILocation(line: 84, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !81, line: 83, column: 2)
!146 = !DILocation(line: 84, column: 29, scope: !145)
!147 = !DILocation(line: 84, column: 15, scope: !145)
!148 = !DILocation(line: 85, column: 2, scope: !145)
!149 = !DILocation(line: 91, column: 5, scope: !150)
!150 = distinct !DILexicalBlock(scope: !120, file: !81, line: 91, column: 5)
!151 = !DILocation(line: 91, column: 17, scope: !150)
!152 = !DILocation(line: 91, column: 5, scope: !120)
!153 = !DILocation(line: 93, column: 6, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !81, line: 93, column: 6)
!155 = distinct !DILexicalBlock(scope: !150, file: !81, line: 92, column: 2)
!156 = !DILocation(line: 93, column: 18, scope: !154)
!157 = !DILocation(line: 93, column: 6, scope: !155)
!158 = !DILocation(line: 95, column: 15, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !81, line: 94, column: 3)
!160 = !DILocation(line: 95, column: 11, scope: !159)
!161 = !DILocation(line: 95, column: 4, scope: !159)
!162 = !DILocation(line: 99, column: 4, scope: !163)
!163 = distinct !DILexicalBlock(scope: !154, file: !81, line: 98, column: 3)
!164 = !DILocation(line: 104, column: 3, scope: !165)
!165 = distinct !DILexicalBlock(scope: !150, file: !81, line: 103, column: 2)
!166 = !DILocation(line: 106, column: 1, scope: !120)
!167 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !81, file: !81, line: 123, type: !168, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DISubroutineType(types: !169)
!169 = !{!6, !6, !17}
!170 = !DILocalVariable(name: "value", arg: 1, scope: !167, file: !81, line: 123, type: !6)
!171 = !DILocation(line: 123, column: 25, scope: !167)
!172 = !DILocalVariable(name: "factor", arg: 2, scope: !167, file: !81, line: 123, type: !17)
!173 = !DILocation(line: 123, column: 35, scope: !167)
!174 = !DILocalVariable(name: "s32MulTemp1", scope: !167, file: !81, line: 125, type: !89)
!175 = !DILocation(line: 125, column: 6, scope: !167)
!176 = !DILocalVariable(name: "s32MulTemp2", scope: !167, file: !81, line: 125, type: !89)
!177 = !DILocation(line: 125, column: 24, scope: !167)
!178 = !DILocation(line: 126, column: 16, scope: !167)
!179 = !DILocation(line: 126, column: 24, scope: !167)
!180 = !DILocation(line: 126, column: 22, scope: !167)
!181 = !DILocation(line: 126, column: 14, scope: !167)
!182 = !DILocation(line: 127, column: 16, scope: !167)
!183 = !DILocation(line: 127, column: 28, scope: !167)
!184 = !DILocation(line: 127, column: 14, scope: !167)
!185 = !DILocation(line: 128, column: 6, scope: !186)
!186 = distinct !DILexicalBlock(scope: !167, file: !81, line: 128, column: 5)
!187 = !DILocation(line: 128, column: 17, scope: !186)
!188 = !DILocation(line: 128, column: 21, scope: !186)
!189 = !DILocation(line: 128, column: 25, scope: !186)
!190 = !DILocation(line: 128, column: 37, scope: !186)
!191 = !DILocation(line: 128, column: 44, scope: !186)
!192 = !DILocation(line: 128, column: 5, scope: !167)
!193 = !DILocation(line: 130, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !186, file: !81, line: 129, column: 2)
!195 = !DILocation(line: 130, column: 29, scope: !194)
!196 = !DILocation(line: 130, column: 15, scope: !194)
!197 = !DILocation(line: 131, column: 14, scope: !194)
!198 = !DILocation(line: 131, column: 10, scope: !194)
!199 = !DILocation(line: 131, column: 3, scope: !194)
!200 = !DILocation(line: 135, column: 14, scope: !201)
!201 = distinct !DILexicalBlock(scope: !186, file: !81, line: 134, column: 2)
!202 = !DILocation(line: 135, column: 10, scope: !201)
!203 = !DILocation(line: 135, column: 3, scope: !201)
!204 = !DILocation(line: 137, column: 1, scope: !167)
!205 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !81, file: !81, line: 155, type: !168, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DILocalVariable(name: "value", arg: 1, scope: !205, file: !81, line: 155, type: !6)
!207 = !DILocation(line: 155, column: 25, scope: !205)
!208 = !DILocalVariable(name: "factor", arg: 2, scope: !205, file: !81, line: 155, type: !17)
!209 = !DILocation(line: 155, column: 35, scope: !205)
!210 = !DILocalVariable(name: "s32MulTemp1", scope: !205, file: !81, line: 157, type: !89)
!211 = !DILocation(line: 157, column: 6, scope: !205)
!212 = !DILocalVariable(name: "s32MulTemp2", scope: !205, file: !81, line: 157, type: !89)
!213 = !DILocation(line: 157, column: 24, scope: !205)
!214 = !DILocation(line: 158, column: 16, scope: !205)
!215 = !DILocation(line: 158, column: 24, scope: !205)
!216 = !DILocation(line: 158, column: 22, scope: !205)
!217 = !DILocation(line: 158, column: 14, scope: !205)
!218 = !DILocation(line: 159, column: 16, scope: !205)
!219 = !DILocation(line: 159, column: 28, scope: !205)
!220 = !DILocation(line: 159, column: 14, scope: !205)
!221 = !DILocation(line: 160, column: 6, scope: !222)
!222 = distinct !DILexicalBlock(scope: !205, file: !81, line: 160, column: 5)
!223 = !DILocation(line: 160, column: 17, scope: !222)
!224 = !DILocation(line: 160, column: 21, scope: !222)
!225 = !DILocation(line: 160, column: 25, scope: !222)
!226 = !DILocation(line: 160, column: 37, scope: !222)
!227 = !DILocation(line: 160, column: 44, scope: !222)
!228 = !DILocation(line: 160, column: 5, scope: !205)
!229 = !DILocation(line: 162, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !222, file: !81, line: 161, column: 2)
!231 = !DILocation(line: 162, column: 29, scope: !230)
!232 = !DILocation(line: 162, column: 15, scope: !230)
!233 = !DILocation(line: 163, column: 2, scope: !230)
!234 = !DILocation(line: 169, column: 5, scope: !235)
!235 = distinct !DILexicalBlock(scope: !205, file: !81, line: 169, column: 5)
!236 = !DILocation(line: 169, column: 17, scope: !235)
!237 = !DILocation(line: 169, column: 5, scope: !205)
!238 = !DILocation(line: 171, column: 6, scope: !239)
!239 = distinct !DILexicalBlock(scope: !240, file: !81, line: 171, column: 6)
!240 = distinct !DILexicalBlock(scope: !235, file: !81, line: 170, column: 2)
!241 = !DILocation(line: 171, column: 18, scope: !239)
!242 = !DILocation(line: 171, column: 6, scope: !240)
!243 = !DILocation(line: 173, column: 15, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !81, line: 172, column: 3)
!245 = !DILocation(line: 173, column: 11, scope: !244)
!246 = !DILocation(line: 173, column: 4, scope: !244)
!247 = !DILocation(line: 177, column: 4, scope: !248)
!248 = distinct !DILexicalBlock(scope: !239, file: !81, line: 176, column: 3)
!249 = !DILocation(line: 182, column: 3, scope: !250)
!250 = distinct !DILexicalBlock(scope: !235, file: !81, line: 181, column: 2)
!251 = !DILocation(line: 184, column: 1, scope: !205)
!252 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !81, file: !81, line: 200, type: !253, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!253 = !DISubroutineType(types: !254)
!254 = !{!13, !13, !13, !89}
!255 = !DILocalVariable(name: "value", arg: 1, scope: !252, file: !81, line: 200, type: !13)
!256 = !DILocation(line: 200, column: 40, scope: !252)
!257 = !DILocalVariable(name: "factor", arg: 2, scope: !252, file: !81, line: 200, type: !13)
!258 = !DILocation(line: 200, column: 51, scope: !252)
!259 = !DILocalVariable(name: "count", arg: 3, scope: !252, file: !81, line: 200, type: !89)
!260 = !DILocation(line: 200, column: 63, scope: !252)
!261 = !DILocalVariable(name: "s32MulTemp", scope: !252, file: !81, line: 202, type: !89)
!262 = !DILocation(line: 202, column: 6, scope: !252)
!263 = !DILocation(line: 203, column: 15, scope: !252)
!264 = !DILocation(line: 203, column: 23, scope: !252)
!265 = !DILocation(line: 203, column: 21, scope: !252)
!266 = !DILocation(line: 203, column: 13, scope: !252)
!267 = !DILocation(line: 204, column: 15, scope: !252)
!268 = !DILocation(line: 204, column: 26, scope: !252)
!269 = !DILocation(line: 204, column: 25, scope: !252)
!270 = !{!"True"}
!271 = !DILocation(line: 204, column: 13, scope: !252)
!272 = !DILocation(line: 205, column: 9, scope: !252)
!273 = !DILocation(line: 205, column: 2, scope: !252)
!274 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !81, file: !81, line: 223, type: !253, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!275 = !DILocalVariable(name: "value", arg: 1, scope: !274, file: !81, line: 223, type: !13)
!276 = !DILocation(line: 223, column: 43, scope: !274)
!277 = !DILocalVariable(name: "factor", arg: 2, scope: !274, file: !81, line: 223, type: !13)
!278 = !DILocation(line: 223, column: 54, scope: !274)
!279 = !DILocalVariable(name: "count", arg: 3, scope: !274, file: !81, line: 223, type: !89)
!280 = !DILocation(line: 223, column: 66, scope: !274)
!281 = !DILocalVariable(name: "s32MulTemp", scope: !274, file: !81, line: 225, type: !89)
!282 = !DILocation(line: 225, column: 6, scope: !274)
!283 = !DILocation(line: 226, column: 15, scope: !274)
!284 = !DILocation(line: 226, column: 23, scope: !274)
!285 = !DILocation(line: 226, column: 21, scope: !274)
!286 = !DILocation(line: 226, column: 13, scope: !274)
!287 = !DILocation(line: 227, column: 15, scope: !274)
!288 = !DILocation(line: 227, column: 26, scope: !274)
!289 = !DILocation(line: 227, column: 25, scope: !274)
!290 = !DILocation(line: 227, column: 13, scope: !274)
!291 = !DILocation(line: 228, column: 5, scope: !292)
!292 = distinct !DILexicalBlock(scope: !274, file: !81, line: 228, column: 5)
!293 = !DILocation(line: 228, column: 16, scope: !292)
!294 = !DILocation(line: 228, column: 5, scope: !274)
!295 = !DILocation(line: 230, column: 6, scope: !296)
!296 = distinct !DILexicalBlock(scope: !297, file: !81, line: 230, column: 6)
!297 = distinct !DILexicalBlock(scope: !292, file: !81, line: 229, column: 2)
!298 = !DILocation(line: 230, column: 17, scope: !296)
!299 = !DILocation(line: 230, column: 6, scope: !297)
!300 = !DILocation(line: 232, column: 16, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !81, line: 231, column: 3)
!302 = !DILocation(line: 232, column: 11, scope: !301)
!303 = !DILocation(line: 232, column: 4, scope: !301)
!304 = !DILocation(line: 236, column: 4, scope: !305)
!305 = distinct !DILexicalBlock(scope: !296, file: !81, line: 235, column: 3)
!306 = !DILocation(line: 241, column: 3, scope: !307)
!307 = distinct !DILexicalBlock(scope: !292, file: !81, line: 240, column: 2)
!308 = !DILocation(line: 243, column: 1, scope: !274)
!309 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !81, file: !81, line: 262, type: !310, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!310 = !DISubroutineType(types: !311)
!311 = !{!13, !13, !13}
!312 = !DILocalVariable(name: "value", arg: 1, scope: !309, file: !81, line: 262, type: !13)
!313 = !DILocation(line: 262, column: 30, scope: !309)
!314 = !DILocalVariable(name: "factor", arg: 2, scope: !309, file: !81, line: 262, type: !13)
!315 = !DILocation(line: 262, column: 41, scope: !309)
!316 = !DILocalVariable(name: "s32MulTemp1", scope: !309, file: !81, line: 264, type: !89)
!317 = !DILocation(line: 264, column: 6, scope: !309)
!318 = !DILocalVariable(name: "s32MulTemp2", scope: !309, file: !81, line: 264, type: !89)
!319 = !DILocation(line: 264, column: 24, scope: !309)
!320 = !DILocation(line: 265, column: 16, scope: !309)
!321 = !DILocation(line: 265, column: 24, scope: !309)
!322 = !DILocation(line: 265, column: 22, scope: !309)
!323 = !DILocation(line: 265, column: 14, scope: !309)
!324 = !DILocation(line: 266, column: 16, scope: !309)
!325 = !DILocation(line: 266, column: 28, scope: !309)
!326 = !DILocation(line: 266, column: 14, scope: !309)
!327 = !DILocation(line: 267, column: 6, scope: !328)
!328 = distinct !DILexicalBlock(scope: !309, file: !81, line: 267, column: 5)
!329 = !DILocation(line: 267, column: 17, scope: !328)
!330 = !DILocation(line: 267, column: 21, scope: !328)
!331 = !DILocation(line: 267, column: 25, scope: !328)
!332 = !DILocation(line: 267, column: 37, scope: !328)
!333 = !DILocation(line: 267, column: 46, scope: !328)
!334 = !DILocation(line: 267, column: 5, scope: !309)
!335 = !DILocation(line: 269, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !328, file: !81, line: 268, column: 2)
!337 = !DILocation(line: 269, column: 29, scope: !336)
!338 = !DILocation(line: 269, column: 15, scope: !336)
!339 = !DILocation(line: 271, column: 2, scope: !336)
!340 = !DILocation(line: 277, column: 5, scope: !341)
!341 = distinct !DILexicalBlock(scope: !309, file: !81, line: 277, column: 5)
!342 = !DILocation(line: 277, column: 17, scope: !341)
!343 = !DILocation(line: 277, column: 5, scope: !309)
!344 = !DILocation(line: 279, column: 15, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !81, line: 278, column: 2)
!346 = !DILocation(line: 279, column: 10, scope: !345)
!347 = !DILocation(line: 279, column: 3, scope: !345)
!348 = !DILocation(line: 283, column: 3, scope: !349)
!349 = distinct !DILexicalBlock(scope: !341, file: !81, line: 282, column: 2)
!350 = !DILocation(line: 285, column: 1, scope: !309)
!351 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !81, file: !81, line: 304, type: !310, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!352 = !DILocalVariable(name: "value", arg: 1, scope: !351, file: !81, line: 304, type: !13)
!353 = !DILocation(line: 304, column: 30, scope: !351)
!354 = !DILocalVariable(name: "factor", arg: 2, scope: !351, file: !81, line: 304, type: !13)
!355 = !DILocation(line: 304, column: 41, scope: !351)
!356 = !DILocalVariable(name: "s32MulTemp1", scope: !351, file: !81, line: 306, type: !89)
!357 = !DILocation(line: 306, column: 6, scope: !351)
!358 = !DILocalVariable(name: "s32MulTemp2", scope: !351, file: !81, line: 306, type: !89)
!359 = !DILocation(line: 306, column: 24, scope: !351)
!360 = !DILocation(line: 307, column: 16, scope: !351)
!361 = !DILocation(line: 307, column: 24, scope: !351)
!362 = !DILocation(line: 307, column: 22, scope: !351)
!363 = !DILocation(line: 307, column: 14, scope: !351)
!364 = !DILocation(line: 308, column: 16, scope: !351)
!365 = !DILocation(line: 308, column: 28, scope: !351)
!366 = !DILocation(line: 308, column: 14, scope: !351)
!367 = !DILocation(line: 309, column: 6, scope: !368)
!368 = distinct !DILexicalBlock(scope: !351, file: !81, line: 309, column: 5)
!369 = !DILocation(line: 309, column: 17, scope: !368)
!370 = !DILocation(line: 309, column: 21, scope: !368)
!371 = !DILocation(line: 309, column: 25, scope: !368)
!372 = !DILocation(line: 309, column: 37, scope: !368)
!373 = !DILocation(line: 309, column: 46, scope: !368)
!374 = !DILocation(line: 309, column: 5, scope: !351)
!375 = !DILocation(line: 311, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !368, file: !81, line: 310, column: 2)
!377 = !DILocation(line: 311, column: 29, scope: !376)
!378 = !DILocation(line: 311, column: 15, scope: !376)
!379 = !DILocation(line: 312, column: 2, scope: !376)
!380 = !DILocation(line: 318, column: 6, scope: !381)
!381 = distinct !DILexicalBlock(scope: !351, file: !81, line: 318, column: 6)
!382 = !DILocation(line: 318, column: 18, scope: !381)
!383 = !DILocation(line: 318, column: 6, scope: !351)
!384 = !DILocation(line: 320, column: 6, scope: !385)
!385 = distinct !DILexicalBlock(scope: !386, file: !81, line: 320, column: 6)
!386 = distinct !DILexicalBlock(scope: !381, file: !81, line: 319, column: 2)
!387 = !DILocation(line: 320, column: 18, scope: !385)
!388 = !DILocation(line: 320, column: 6, scope: !386)
!389 = !DILocation(line: 322, column: 16, scope: !390)
!390 = distinct !DILexicalBlock(scope: !385, file: !81, line: 321, column: 3)
!391 = !DILocation(line: 322, column: 11, scope: !390)
!392 = !DILocation(line: 322, column: 4, scope: !390)
!393 = !DILocation(line: 326, column: 4, scope: !394)
!394 = distinct !DILexicalBlock(scope: !385, file: !81, line: 325, column: 3)
!395 = !DILocation(line: 331, column: 3, scope: !396)
!396 = distinct !DILexicalBlock(scope: !381, file: !81, line: 330, column: 2)
!397 = !DILocation(line: 333, column: 1, scope: !351)
!398 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !81, file: !81, line: 350, type: !399, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!399 = !DISubroutineType(types: !400)
!400 = !{!13, !13, !22}
!401 = !DILocalVariable(name: "value", arg: 1, scope: !398, file: !81, line: 350, type: !13)
!402 = !DILocation(line: 350, column: 39, scope: !398)
!403 = !DILocalVariable(name: "factor", arg: 2, scope: !398, file: !81, line: 350, type: !22)
!404 = !DILocation(line: 350, column: 50, scope: !398)
!405 = !DILocalVariable(name: "s32MulTemp1", scope: !398, file: !81, line: 352, type: !89)
!406 = !DILocation(line: 352, column: 6, scope: !398)
!407 = !DILocalVariable(name: "s32MulTemp2", scope: !398, file: !81, line: 352, type: !89)
!408 = !DILocation(line: 352, column: 24, scope: !398)
!409 = !DILocation(line: 353, column: 16, scope: !398)
!410 = !DILocation(line: 353, column: 24, scope: !398)
!411 = !DILocation(line: 353, column: 22, scope: !398)
!412 = !DILocation(line: 353, column: 14, scope: !398)
!413 = !DILocation(line: 354, column: 16, scope: !398)
!414 = !DILocation(line: 354, column: 28, scope: !398)
!415 = !DILocation(line: 354, column: 14, scope: !398)
!416 = !DILocation(line: 355, column: 6, scope: !417)
!417 = distinct !DILexicalBlock(scope: !398, file: !81, line: 355, column: 5)
!418 = !DILocation(line: 355, column: 17, scope: !417)
!419 = !DILocation(line: 355, column: 21, scope: !417)
!420 = !DILocation(line: 355, column: 25, scope: !417)
!421 = !DILocation(line: 355, column: 37, scope: !417)
!422 = !DILocation(line: 355, column: 46, scope: !417)
!423 = !DILocation(line: 355, column: 5, scope: !398)
!424 = !DILocation(line: 361, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !417, file: !81, line: 360, column: 2)
!426 = !DILocation(line: 361, column: 29, scope: !425)
!427 = !DILocation(line: 361, column: 15, scope: !425)
!428 = !DILocation(line: 362, column: 15, scope: !425)
!429 = !DILocation(line: 362, column: 10, scope: !425)
!430 = !DILocation(line: 362, column: 3, scope: !425)
!431 = !DILocation(line: 366, column: 15, scope: !432)
!432 = distinct !DILexicalBlock(scope: !417, file: !81, line: 365, column: 2)
!433 = !DILocation(line: 366, column: 10, scope: !432)
!434 = !DILocation(line: 366, column: 3, scope: !432)
!435 = !DILocation(line: 368, column: 1, scope: !398)
!436 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !81, file: !81, line: 386, type: !399, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!437 = !DILocalVariable(name: "value", arg: 1, scope: !436, file: !81, line: 386, type: !13)
!438 = !DILocation(line: 386, column: 42, scope: !436)
!439 = !DILocalVariable(name: "factor", arg: 2, scope: !436, file: !81, line: 386, type: !22)
!440 = !DILocation(line: 386, column: 53, scope: !436)
!441 = !DILocalVariable(name: "s32MulTemp1", scope: !436, file: !81, line: 388, type: !89)
!442 = !DILocation(line: 388, column: 6, scope: !436)
!443 = !DILocalVariable(name: "s32MulTemp2", scope: !436, file: !81, line: 388, type: !89)
!444 = !DILocation(line: 388, column: 24, scope: !436)
!445 = !DILocation(line: 389, column: 16, scope: !436)
!446 = !DILocation(line: 389, column: 24, scope: !436)
!447 = !DILocation(line: 389, column: 22, scope: !436)
!448 = !DILocation(line: 389, column: 14, scope: !436)
!449 = !DILocation(line: 390, column: 16, scope: !436)
!450 = !DILocation(line: 390, column: 28, scope: !436)
!451 = !DILocation(line: 390, column: 14, scope: !436)
!452 = !DILocation(line: 391, column: 6, scope: !453)
!453 = distinct !DILexicalBlock(scope: !436, file: !81, line: 391, column: 5)
!454 = !DILocation(line: 391, column: 17, scope: !453)
!455 = !DILocation(line: 391, column: 21, scope: !453)
!456 = !DILocation(line: 391, column: 25, scope: !453)
!457 = !DILocation(line: 391, column: 37, scope: !453)
!458 = !DILocation(line: 391, column: 44, scope: !453)
!459 = !DILocation(line: 391, column: 5, scope: !436)
!460 = !DILocation(line: 398, column: 17, scope: !461)
!461 = distinct !DILexicalBlock(scope: !453, file: !81, line: 397, column: 2)
!462 = !DILocation(line: 398, column: 29, scope: !461)
!463 = !DILocation(line: 398, column: 15, scope: !461)
!464 = !DILocation(line: 399, column: 2, scope: !461)
!465 = !DILocation(line: 404, column: 5, scope: !466)
!466 = distinct !DILexicalBlock(scope: !436, file: !81, line: 404, column: 5)
!467 = !DILocation(line: 404, column: 17, scope: !466)
!468 = !DILocation(line: 404, column: 5, scope: !436)
!469 = !DILocation(line: 406, column: 6, scope: !470)
!470 = distinct !DILexicalBlock(scope: !471, file: !81, line: 406, column: 6)
!471 = distinct !DILexicalBlock(scope: !466, file: !81, line: 405, column: 2)
!472 = !DILocation(line: 406, column: 18, scope: !470)
!473 = !DILocation(line: 406, column: 6, scope: !471)
!474 = !DILocation(line: 408, column: 16, scope: !475)
!475 = distinct !DILexicalBlock(scope: !470, file: !81, line: 407, column: 3)
!476 = !DILocation(line: 408, column: 11, scope: !475)
!477 = !DILocation(line: 408, column: 4, scope: !475)
!478 = !DILocation(line: 412, column: 4, scope: !479)
!479 = distinct !DILexicalBlock(scope: !470, file: !81, line: 411, column: 3)
!480 = !DILocation(line: 417, column: 3, scope: !481)
!481 = distinct !DILexicalBlock(scope: !466, file: !81, line: 416, column: 2)
!482 = !DILocation(line: 419, column: 1, scope: !436)
!483 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !81, file: !81, line: 436, type: !484, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!484 = !DISubroutineType(types: !485)
!485 = !{!13, !13, !17}
!486 = !DILocalVariable(name: "value", arg: 1, scope: !483, file: !81, line: 436, type: !13)
!487 = !DILocation(line: 436, column: 29, scope: !483)
!488 = !DILocalVariable(name: "factor", arg: 2, scope: !483, file: !81, line: 436, type: !17)
!489 = !DILocation(line: 436, column: 39, scope: !483)
!490 = !DILocalVariable(name: "s32MulTemp1", scope: !483, file: !81, line: 438, type: !89)
!491 = !DILocation(line: 438, column: 6, scope: !483)
!492 = !DILocalVariable(name: "s32MulTemp2", scope: !483, file: !81, line: 438, type: !89)
!493 = !DILocation(line: 438, column: 24, scope: !483)
!494 = !DILocation(line: 439, column: 16, scope: !483)
!495 = !DILocation(line: 439, column: 24, scope: !483)
!496 = !DILocation(line: 439, column: 22, scope: !483)
!497 = !DILocation(line: 439, column: 14, scope: !483)
!498 = !DILocation(line: 440, column: 16, scope: !483)
!499 = !DILocation(line: 440, column: 28, scope: !483)
!500 = !DILocation(line: 440, column: 14, scope: !483)
!501 = !DILocation(line: 441, column: 6, scope: !502)
!502 = distinct !DILexicalBlock(scope: !483, file: !81, line: 441, column: 5)
!503 = !DILocation(line: 441, column: 17, scope: !502)
!504 = !DILocation(line: 441, column: 21, scope: !502)
!505 = !DILocation(line: 441, column: 25, scope: !502)
!506 = !DILocation(line: 441, column: 37, scope: !502)
!507 = !DILocation(line: 441, column: 44, scope: !502)
!508 = !DILocation(line: 441, column: 5, scope: !483)
!509 = !DILocation(line: 448, column: 17, scope: !510)
!510 = distinct !DILexicalBlock(scope: !502, file: !81, line: 447, column: 2)
!511 = !DILocation(line: 448, column: 29, scope: !510)
!512 = !DILocation(line: 448, column: 15, scope: !510)
!513 = !DILocation(line: 449, column: 10, scope: !510)
!514 = !DILocation(line: 449, column: 3, scope: !510)
!515 = !DILocation(line: 453, column: 10, scope: !516)
!516 = distinct !DILexicalBlock(scope: !502, file: !81, line: 452, column: 2)
!517 = !DILocation(line: 453, column: 3, scope: !516)
!518 = !DILocation(line: 455, column: 1, scope: !483)
!519 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !81, file: !81, line: 473, type: !484, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!520 = !DILocalVariable(name: "value", arg: 1, scope: !519, file: !81, line: 473, type: !13)
!521 = !DILocation(line: 473, column: 29, scope: !519)
!522 = !DILocalVariable(name: "factor", arg: 2, scope: !519, file: !81, line: 473, type: !17)
!523 = !DILocation(line: 473, column: 39, scope: !519)
!524 = !DILocalVariable(name: "s32MulTemp1", scope: !519, file: !81, line: 475, type: !89)
!525 = !DILocation(line: 475, column: 6, scope: !519)
!526 = !DILocalVariable(name: "s32MulTemp2", scope: !519, file: !81, line: 475, type: !89)
!527 = !DILocation(line: 475, column: 24, scope: !519)
!528 = !DILocation(line: 476, column: 16, scope: !519)
!529 = !DILocation(line: 476, column: 24, scope: !519)
!530 = !DILocation(line: 476, column: 22, scope: !519)
!531 = !DILocation(line: 476, column: 14, scope: !519)
!532 = !DILocation(line: 477, column: 16, scope: !519)
!533 = !DILocation(line: 477, column: 28, scope: !519)
!534 = !DILocation(line: 477, column: 14, scope: !519)
!535 = !DILocation(line: 478, column: 6, scope: !536)
!536 = distinct !DILexicalBlock(scope: !519, file: !81, line: 478, column: 5)
!537 = !DILocation(line: 478, column: 17, scope: !536)
!538 = !DILocation(line: 478, column: 21, scope: !536)
!539 = !DILocation(line: 478, column: 25, scope: !536)
!540 = !DILocation(line: 478, column: 37, scope: !536)
!541 = !DILocation(line: 478, column: 44, scope: !536)
!542 = !DILocation(line: 478, column: 5, scope: !519)
!543 = !DILocation(line: 484, column: 17, scope: !544)
!544 = distinct !DILexicalBlock(scope: !536, file: !81, line: 483, column: 2)
!545 = !DILocation(line: 484, column: 29, scope: !544)
!546 = !DILocation(line: 484, column: 15, scope: !544)
!547 = !DILocation(line: 485, column: 2, scope: !544)
!548 = !DILocation(line: 491, column: 6, scope: !549)
!549 = distinct !DILexicalBlock(scope: !519, file: !81, line: 491, column: 6)
!550 = !DILocation(line: 491, column: 18, scope: !549)
!551 = !DILocation(line: 491, column: 6, scope: !519)
!552 = !DILocation(line: 493, column: 6, scope: !553)
!553 = distinct !DILexicalBlock(scope: !554, file: !81, line: 493, column: 6)
!554 = distinct !DILexicalBlock(scope: !549, file: !81, line: 492, column: 2)
!555 = !DILocation(line: 493, column: 18, scope: !553)
!556 = !DILocation(line: 493, column: 6, scope: !554)
!557 = !DILocation(line: 495, column: 16, scope: !558)
!558 = distinct !DILexicalBlock(scope: !553, file: !81, line: 494, column: 3)
!559 = !DILocation(line: 495, column: 11, scope: !558)
!560 = !DILocation(line: 495, column: 4, scope: !558)
!561 = !DILocation(line: 499, column: 4, scope: !562)
!562 = distinct !DILexicalBlock(scope: !553, file: !81, line: 498, column: 3)
!563 = !DILocation(line: 504, column: 3, scope: !564)
!564 = distinct !DILexicalBlock(scope: !549, file: !81, line: 503, column: 2)
!565 = !DILocation(line: 506, column: 1, scope: !519)
!566 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !81, file: !81, line: 521, type: !399, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!567 = !DILocalVariable(name: "value", arg: 1, scope: !566, file: !81, line: 521, type: !13)
!568 = !DILocation(line: 521, column: 25, scope: !566)
!569 = !DILocalVariable(name: "factor", arg: 2, scope: !566, file: !81, line: 521, type: !22)
!570 = !DILocation(line: 521, column: 36, scope: !566)
!571 = !DILocalVariable(name: "s32MulTemp", scope: !566, file: !81, line: 523, type: !89)
!572 = !DILocation(line: 523, column: 6, scope: !566)
!573 = !DILocation(line: 524, column: 15, scope: !566)
!574 = !DILocation(line: 524, column: 23, scope: !566)
!575 = !DILocation(line: 524, column: 21, scope: !566)
!576 = !DILocation(line: 524, column: 13, scope: !566)
!577 = !DILocation(line: 525, column: 5, scope: !578)
!578 = distinct !DILexicalBlock(scope: !566, file: !81, line: 525, column: 5)
!579 = !DILocation(line: 525, column: 16, scope: !578)
!580 = !DILocation(line: 525, column: 5, scope: !566)
!581 = !DILocation(line: 527, column: 6, scope: !582)
!582 = distinct !DILexicalBlock(scope: !583, file: !81, line: 527, column: 6)
!583 = distinct !DILexicalBlock(scope: !578, file: !81, line: 526, column: 2)
!584 = !DILocation(line: 527, column: 17, scope: !582)
!585 = !DILocation(line: 527, column: 6, scope: !583)
!586 = !DILocation(line: 529, column: 16, scope: !587)
!587 = distinct !DILexicalBlock(scope: !582, file: !81, line: 528, column: 3)
!588 = !DILocation(line: 529, column: 11, scope: !587)
!589 = !DILocation(line: 529, column: 4, scope: !587)
!590 = !DILocation(line: 533, column: 4, scope: !591)
!591 = distinct !DILexicalBlock(scope: !582, file: !81, line: 532, column: 3)
!592 = !DILocation(line: 538, column: 3, scope: !593)
!593 = distinct !DILexicalBlock(scope: !578, file: !81, line: 537, column: 2)
!594 = !DILocation(line: 540, column: 1, scope: !566)
!595 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !81, file: !81, line: 556, type: !596, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!596 = !DISubroutineType(types: !597)
!597 = !{!13, !13, !22, !89}
!598 = !DILocalVariable(name: "value", arg: 1, scope: !595, file: !81, line: 556, type: !13)
!599 = !DILocation(line: 556, column: 40, scope: !595)
!600 = !DILocalVariable(name: "factor", arg: 2, scope: !595, file: !81, line: 556, type: !22)
!601 = !DILocation(line: 556, column: 50, scope: !595)
!602 = !DILocalVariable(name: "count", arg: 3, scope: !595, file: !81, line: 556, type: !89)
!603 = !DILocation(line: 556, column: 61, scope: !595)
!604 = !DILocalVariable(name: "s32MulTemp", scope: !595, file: !81, line: 558, type: !89)
!605 = !DILocation(line: 558, column: 6, scope: !595)
!606 = !DILocation(line: 559, column: 15, scope: !595)
!607 = !DILocation(line: 559, column: 23, scope: !595)
!608 = !DILocation(line: 559, column: 21, scope: !595)
!609 = !DILocation(line: 559, column: 13, scope: !595)
!610 = !DILocation(line: 560, column: 15, scope: !595)
!611 = !DILocation(line: 560, column: 26, scope: !595)
!612 = !DILocation(line: 560, column: 25, scope: !595)
!613 = !DILocation(line: 560, column: 13, scope: !595)
!614 = !DILocation(line: 561, column: 14, scope: !595)
!615 = !DILocation(line: 561, column: 9, scope: !595)
!616 = !DILocation(line: 561, column: 2, scope: !595)
!617 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !81, file: !81, line: 580, type: !618, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!618 = !DISubroutineType(types: !619)
!619 = !{!13, !13, !22, !22}
!620 = !DILocalVariable(name: "value", arg: 1, scope: !617, file: !81, line: 580, type: !13)
!621 = !DILocation(line: 580, column: 43, scope: !617)
!622 = !DILocalVariable(name: "factor", arg: 2, scope: !617, file: !81, line: 580, type: !22)
!623 = !DILocation(line: 580, column: 53, scope: !617)
!624 = !DILocalVariable(name: "count", arg: 3, scope: !617, file: !81, line: 580, type: !22)
!625 = !DILocation(line: 580, column: 64, scope: !617)
!626 = !DILocalVariable(name: "s32MulTemp", scope: !617, file: !81, line: 582, type: !89)
!627 = !DILocation(line: 582, column: 6, scope: !617)
!628 = !DILocation(line: 583, column: 15, scope: !617)
!629 = !DILocation(line: 583, column: 23, scope: !617)
!630 = !DILocation(line: 583, column: 21, scope: !617)
!631 = !DILocation(line: 583, column: 13, scope: !617)
!632 = !DILocation(line: 584, column: 15, scope: !617)
!633 = !DILocation(line: 584, column: 26, scope: !617)
!634 = !DILocation(line: 584, column: 25, scope: !617)
!635 = !DILocation(line: 584, column: 13, scope: !617)
!636 = !DILocation(line: 585, column: 5, scope: !637)
!637 = distinct !DILexicalBlock(scope: !617, file: !81, line: 585, column: 5)
!638 = !DILocation(line: 585, column: 16, scope: !637)
!639 = !DILocation(line: 585, column: 5, scope: !617)
!640 = !DILocation(line: 587, column: 6, scope: !641)
!641 = distinct !DILexicalBlock(scope: !642, file: !81, line: 587, column: 6)
!642 = distinct !DILexicalBlock(scope: !637, file: !81, line: 586, column: 2)
!643 = !DILocation(line: 587, column: 17, scope: !641)
!644 = !DILocation(line: 587, column: 6, scope: !642)
!645 = !DILocation(line: 589, column: 16, scope: !646)
!646 = distinct !DILexicalBlock(scope: !641, file: !81, line: 588, column: 3)
!647 = !DILocation(line: 589, column: 11, scope: !646)
!648 = !DILocation(line: 589, column: 4, scope: !646)
!649 = !DILocation(line: 593, column: 4, scope: !650)
!650 = distinct !DILexicalBlock(scope: !641, file: !81, line: 592, column: 3)
!651 = !DILocation(line: 598, column: 3, scope: !652)
!652 = distinct !DILexicalBlock(scope: !637, file: !81, line: 597, column: 2)
!653 = !DILocation(line: 600, column: 1, scope: !617)
!654 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !81, file: !81, line: 617, type: !399, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!655 = !DILocalVariable(name: "value", arg: 1, scope: !654, file: !81, line: 617, type: !13)
!656 = !DILocation(line: 617, column: 31, scope: !654)
!657 = !DILocalVariable(name: "factor", arg: 2, scope: !654, file: !81, line: 617, type: !22)
!658 = !DILocation(line: 617, column: 42, scope: !654)
!659 = !DILocalVariable(name: "s32MulTemp1", scope: !654, file: !81, line: 619, type: !89)
!660 = !DILocation(line: 619, column: 6, scope: !654)
!661 = !DILocalVariable(name: "s32MulTemp2", scope: !654, file: !81, line: 619, type: !89)
!662 = !DILocation(line: 619, column: 24, scope: !654)
!663 = !DILocation(line: 620, column: 16, scope: !654)
!664 = !DILocation(line: 620, column: 24, scope: !654)
!665 = !DILocation(line: 620, column: 22, scope: !654)
!666 = !DILocation(line: 620, column: 14, scope: !654)
!667 = !DILocation(line: 621, column: 16, scope: !654)
!668 = !DILocation(line: 621, column: 28, scope: !654)
!669 = !DILocation(line: 621, column: 14, scope: !654)
!670 = !DILocation(line: 622, column: 6, scope: !671)
!671 = distinct !DILexicalBlock(scope: !654, file: !81, line: 622, column: 5)
!672 = !DILocation(line: 622, column: 17, scope: !671)
!673 = !DILocation(line: 622, column: 21, scope: !671)
!674 = !DILocation(line: 622, column: 25, scope: !671)
!675 = !DILocation(line: 622, column: 37, scope: !671)
!676 = !DILocation(line: 622, column: 46, scope: !671)
!677 = !DILocation(line: 622, column: 5, scope: !654)
!678 = !DILocation(line: 629, column: 17, scope: !679)
!679 = distinct !DILexicalBlock(scope: !671, file: !81, line: 628, column: 2)
!680 = !DILocation(line: 629, column: 29, scope: !679)
!681 = !DILocation(line: 629, column: 15, scope: !679)
!682 = !DILocation(line: 630, column: 15, scope: !679)
!683 = !DILocation(line: 630, column: 10, scope: !679)
!684 = !DILocation(line: 630, column: 3, scope: !679)
!685 = !DILocation(line: 634, column: 15, scope: !686)
!686 = distinct !DILexicalBlock(scope: !671, file: !81, line: 633, column: 2)
!687 = !DILocation(line: 634, column: 10, scope: !686)
!688 = !DILocation(line: 634, column: 3, scope: !686)
!689 = !DILocation(line: 636, column: 1, scope: !654)
!690 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !81, file: !81, line: 654, type: !399, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!691 = !DILocalVariable(name: "value", arg: 1, scope: !690, file: !81, line: 654, type: !13)
!692 = !DILocation(line: 654, column: 31, scope: !690)
!693 = !DILocalVariable(name: "factor", arg: 2, scope: !690, file: !81, line: 654, type: !22)
!694 = !DILocation(line: 654, column: 42, scope: !690)
!695 = !DILocalVariable(name: "s32MulTemp1", scope: !690, file: !81, line: 656, type: !89)
!696 = !DILocation(line: 656, column: 6, scope: !690)
!697 = !DILocalVariable(name: "s32MulTemp2", scope: !690, file: !81, line: 656, type: !89)
!698 = !DILocation(line: 656, column: 24, scope: !690)
!699 = !DILocation(line: 657, column: 16, scope: !690)
!700 = !DILocation(line: 657, column: 24, scope: !690)
!701 = !DILocation(line: 657, column: 22, scope: !690)
!702 = !DILocation(line: 657, column: 14, scope: !690)
!703 = !DILocation(line: 658, column: 16, scope: !690)
!704 = !DILocation(line: 658, column: 28, scope: !690)
!705 = !DILocation(line: 658, column: 14, scope: !690)
!706 = !DILocation(line: 659, column: 6, scope: !707)
!707 = distinct !DILexicalBlock(scope: !690, file: !81, line: 659, column: 5)
!708 = !DILocation(line: 659, column: 17, scope: !707)
!709 = !DILocation(line: 659, column: 21, scope: !707)
!710 = !DILocation(line: 659, column: 25, scope: !707)
!711 = !DILocation(line: 659, column: 37, scope: !707)
!712 = !DILocation(line: 659, column: 46, scope: !707)
!713 = !DILocation(line: 659, column: 5, scope: !690)
!714 = !DILocation(line: 665, column: 17, scope: !715)
!715 = distinct !DILexicalBlock(scope: !707, file: !81, line: 664, column: 2)
!716 = !DILocation(line: 665, column: 29, scope: !715)
!717 = !DILocation(line: 665, column: 15, scope: !715)
!718 = !DILocation(line: 666, column: 2, scope: !715)
!719 = !DILocation(line: 672, column: 6, scope: !720)
!720 = distinct !DILexicalBlock(scope: !690, file: !81, line: 672, column: 6)
!721 = !DILocation(line: 672, column: 18, scope: !720)
!722 = !DILocation(line: 672, column: 6, scope: !690)
!723 = !DILocation(line: 674, column: 6, scope: !724)
!724 = distinct !DILexicalBlock(scope: !725, file: !81, line: 674, column: 6)
!725 = distinct !DILexicalBlock(scope: !720, file: !81, line: 673, column: 2)
!726 = !DILocation(line: 674, column: 18, scope: !724)
!727 = !DILocation(line: 674, column: 6, scope: !725)
!728 = !DILocation(line: 676, column: 16, scope: !729)
!729 = distinct !DILexicalBlock(scope: !724, file: !81, line: 675, column: 3)
!730 = !DILocation(line: 676, column: 11, scope: !729)
!731 = !DILocation(line: 676, column: 4, scope: !729)
!732 = !DILocation(line: 680, column: 4, scope: !733)
!733 = distinct !DILexicalBlock(scope: !724, file: !81, line: 679, column: 3)
!734 = !DILocation(line: 685, column: 3, scope: !735)
!735 = distinct !DILexicalBlock(scope: !720, file: !81, line: 684, column: 2)
!736 = !DILocation(line: 687, column: 1, scope: !690)
!737 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !81, file: !81, line: 704, type: !738, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!738 = !DISubroutineType(types: !739)
!739 = !{!13, !22, !22}
!740 = !DILocalVariable(name: "value", arg: 1, scope: !737, file: !81, line: 704, type: !22)
!741 = !DILocation(line: 704, column: 33, scope: !737)
!742 = !DILocalVariable(name: "factor", arg: 2, scope: !737, file: !81, line: 704, type: !22)
!743 = !DILocation(line: 704, column: 44, scope: !737)
!744 = !DILocalVariable(name: "u32MulTemp", scope: !737, file: !81, line: 706, type: !29)
!745 = !DILocation(line: 706, column: 6, scope: !737)
!746 = !DILocation(line: 707, column: 15, scope: !737)
!747 = !DILocation(line: 707, column: 23, scope: !737)
!748 = !DILocation(line: 707, column: 21, scope: !737)
!749 = !DILocation(line: 707, column: 13, scope: !737)
!750 = !DILocation(line: 708, column: 15, scope: !737)
!751 = !DILocation(line: 708, column: 26, scope: !737)
!752 = !DILocation(line: 708, column: 13, scope: !737)
!753 = !DILocation(line: 709, column: 5, scope: !754)
!754 = distinct !DILexicalBlock(scope: !737, file: !81, line: 709, column: 5)
!755 = !DILocation(line: 709, column: 16, scope: !754)
!756 = !DILocation(line: 709, column: 5, scope: !737)
!757 = !DILocation(line: 711, column: 15, scope: !758)
!758 = distinct !DILexicalBlock(scope: !754, file: !81, line: 710, column: 2)
!759 = !DILocation(line: 711, column: 10, scope: !758)
!760 = !DILocation(line: 711, column: 3, scope: !758)
!761 = !DILocation(line: 715, column: 3, scope: !762)
!762 = distinct !DILexicalBlock(scope: !754, file: !81, line: 714, column: 2)
!763 = !DILocation(line: 717, column: 1, scope: !737)
!764 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !81, file: !81, line: 732, type: !765, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!765 = !DISubroutineType(types: !766)
!766 = !{!89, !13, !22}
!767 = !DILocalVariable(name: "value", arg: 1, scope: !764, file: !81, line: 732, type: !13)
!768 = !DILocation(line: 732, column: 25, scope: !764)
!769 = !DILocalVariable(name: "factor", arg: 2, scope: !764, file: !81, line: 732, type: !22)
!770 = !DILocation(line: 732, column: 36, scope: !764)
!771 = !DILocalVariable(name: "s32MulTemp", scope: !764, file: !81, line: 734, type: !89)
!772 = !DILocation(line: 734, column: 6, scope: !764)
!773 = !DILocation(line: 735, column: 15, scope: !764)
!774 = !DILocation(line: 735, column: 23, scope: !764)
!775 = !DILocation(line: 735, column: 21, scope: !764)
!776 = !DILocation(line: 735, column: 13, scope: !764)
!777 = !DILocation(line: 736, column: 9, scope: !764)
!778 = !DILocation(line: 736, column: 2, scope: !764)
!779 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !81, file: !81, line: 752, type: !780, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!780 = !DISubroutineType(types: !781)
!781 = !{!89, !89, !22}
!782 = !DILocalVariable(name: "value", arg: 1, scope: !779, file: !81, line: 752, type: !89)
!783 = !DILocation(line: 752, column: 25, scope: !779)
!784 = !DILocalVariable(name: "factor", arg: 2, scope: !779, file: !81, line: 752, type: !22)
!785 = !DILocation(line: 752, column: 36, scope: !779)
!786 = !DILocalVariable(name: "s32Temp1", scope: !779, file: !81, line: 754, type: !89)
!787 = !DILocation(line: 754, column: 6, scope: !779)
!788 = !DILocalVariable(name: "s32Temp2", scope: !779, file: !81, line: 754, type: !89)
!789 = !DILocation(line: 754, column: 20, scope: !779)
!790 = !DILocalVariable(name: "s32Factor", scope: !779, file: !81, line: 754, type: !89)
!791 = !DILocation(line: 754, column: 44, scope: !779)
!792 = !DILocation(line: 755, column: 14, scope: !779)
!793 = !DILocation(line: 755, column: 12, scope: !779)
!794 = !DILocation(line: 756, column: 5, scope: !795)
!795 = distinct !DILexicalBlock(scope: !779, file: !81, line: 756, column: 5)
!796 = !DILocation(line: 756, column: 12, scope: !795)
!797 = !DILocation(line: 756, column: 5, scope: !779)
!798 = !DILocation(line: 758, column: 6, scope: !799)
!799 = distinct !DILexicalBlock(scope: !800, file: !81, line: 758, column: 6)
!800 = distinct !DILexicalBlock(scope: !795, file: !81, line: 757, column: 2)
!801 = !DILocation(line: 758, column: 12, scope: !799)
!802 = !DILocation(line: 758, column: 6, scope: !800)
!803 = !DILocation(line: 760, column: 15, scope: !804)
!804 = distinct !DILexicalBlock(scope: !799, file: !81, line: 759, column: 3)
!805 = !DILocation(line: 760, column: 26, scope: !804)
!806 = !DILocation(line: 760, column: 24, scope: !804)
!807 = !DILocation(line: 760, column: 13, scope: !804)
!808 = !DILocation(line: 761, column: 7, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !81, line: 761, column: 7)
!810 = !DILocation(line: 761, column: 19, scope: !809)
!811 = !DILocation(line: 761, column: 16, scope: !809)
!812 = !DILocation(line: 761, column: 7, scope: !804)
!813 = !DILocation(line: 763, column: 5, scope: !814)
!814 = distinct !DILexicalBlock(scope: !809, file: !81, line: 762, column: 4)
!815 = !DILocation(line: 767, column: 13, scope: !816)
!816 = distinct !DILexicalBlock(scope: !809, file: !81, line: 766, column: 4)
!817 = !DILocation(line: 767, column: 19, scope: !816)
!818 = !DILocation(line: 767, column: 18, scope: !816)
!819 = !DILocation(line: 767, column: 5, scope: !816)
!820 = !DILocation(line: 772, column: 20, scope: !821)
!821 = distinct !DILexicalBlock(scope: !822, file: !81, line: 772, column: 7)
!822 = distinct !DILexicalBlock(scope: !799, file: !81, line: 771, column: 3)
!823 = !DILocation(line: 772, column: 19, scope: !821)
!824 = !DILocation(line: 772, column: 31, scope: !821)
!825 = !DILocation(line: 772, column: 28, scope: !821)
!826 = !DILocation(line: 772, column: 7, scope: !822)
!827 = !DILocation(line: 774, column: 5, scope: !828)
!828 = distinct !DILexicalBlock(scope: !821, file: !81, line: 773, column: 4)
!829 = !DILocation(line: 778, column: 13, scope: !830)
!830 = distinct !DILexicalBlock(scope: !821, file: !81, line: 777, column: 4)
!831 = !DILocation(line: 778, column: 19, scope: !830)
!832 = !DILocation(line: 778, column: 18, scope: !830)
!833 = !DILocation(line: 778, column: 5, scope: !830)
!834 = !DILocation(line: 784, column: 3, scope: !835)
!835 = distinct !DILexicalBlock(scope: !795, file: !81, line: 783, column: 2)
!836 = !DILocation(line: 786, column: 1, scope: !779)
!837 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !81, file: !81, line: 802, type: !838, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!838 = !DISubroutineType(types: !839)
!839 = !{!17, !17, !17, !22}
!840 = !DILocalVariable(name: "value", arg: 1, scope: !837, file: !81, line: 802, type: !17)
!841 = !DILocation(line: 802, column: 35, scope: !837)
!842 = !DILocalVariable(name: "factor", arg: 2, scope: !837, file: !81, line: 802, type: !17)
!843 = !DILocation(line: 802, column: 44, scope: !837)
!844 = !DILocalVariable(name: "count", arg: 3, scope: !837, file: !81, line: 802, type: !22)
!845 = !DILocation(line: 802, column: 55, scope: !837)
!846 = !DILocalVariable(name: "u16MulTemp", scope: !837, file: !81, line: 804, type: !22)
!847 = !DILocation(line: 804, column: 6, scope: !837)
!848 = !DILocation(line: 805, column: 15, scope: !837)
!849 = !DILocation(line: 805, column: 23, scope: !837)
!850 = !DILocation(line: 805, column: 21, scope: !837)
!851 = !DILocation(line: 805, column: 13, scope: !837)
!852 = !DILocation(line: 806, column: 15, scope: !837)
!853 = !DILocation(line: 806, column: 26, scope: !837)
!854 = !DILocation(line: 806, column: 25, scope: !837)
!855 = !DILocation(line: 806, column: 13, scope: !837)
!856 = !DILocation(line: 807, column: 13, scope: !837)
!857 = !DILocation(line: 807, column: 9, scope: !837)
!858 = !DILocation(line: 807, column: 2, scope: !837)
!859 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !81, file: !81, line: 824, type: !860, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!860 = !DISubroutineType(types: !861)
!861 = !{!17, !17, !17, !17}
!862 = !DILocalVariable(name: "value", arg: 1, scope: !859, file: !81, line: 824, type: !17)
!863 = !DILocation(line: 824, column: 38, scope: !859)
!864 = !DILocalVariable(name: "factor", arg: 2, scope: !859, file: !81, line: 824, type: !17)
!865 = !DILocation(line: 824, column: 47, scope: !859)
!866 = !DILocalVariable(name: "count", arg: 3, scope: !859, file: !81, line: 824, type: !17)
!867 = !DILocation(line: 824, column: 57, scope: !859)
!868 = !DILocalVariable(name: "u16MulTemp", scope: !859, file: !81, line: 826, type: !22)
!869 = !DILocation(line: 826, column: 6, scope: !859)
!870 = !DILocation(line: 827, column: 15, scope: !859)
!871 = !DILocation(line: 827, column: 23, scope: !859)
!872 = !DILocation(line: 827, column: 21, scope: !859)
!873 = !DILocation(line: 827, column: 13, scope: !859)
!874 = !DILocation(line: 828, column: 15, scope: !859)
!875 = !DILocation(line: 828, column: 26, scope: !859)
!876 = !DILocation(line: 828, column: 25, scope: !859)
!877 = !DILocation(line: 828, column: 13, scope: !859)
!878 = !DILocation(line: 829, column: 5, scope: !879)
!879 = distinct !DILexicalBlock(scope: !859, file: !81, line: 829, column: 5)
!880 = !DILocation(line: 829, column: 16, scope: !879)
!881 = !DILocation(line: 829, column: 5, scope: !859)
!882 = !DILocation(line: 831, column: 10, scope: !883)
!883 = distinct !DILexicalBlock(scope: !879, file: !81, line: 830, column: 2)
!884 = !DILocation(line: 831, column: 21, scope: !883)
!885 = !DILocation(line: 831, column: 3, scope: !883)
!886 = !DILocation(line: 835, column: 3, scope: !887)
!887 = distinct !DILexicalBlock(scope: !879, file: !81, line: 834, column: 2)
!888 = !DILocation(line: 837, column: 1, scope: !859)
!889 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !81, file: !81, line: 854, type: !890, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!890 = !DISubroutineType(types: !891)
!891 = !{!17, !17, !17}
!892 = !DILocalVariable(name: "x_value", arg: 1, scope: !889, file: !81, line: 854, type: !17)
!893 = !DILocation(line: 854, column: 25, scope: !889)
!894 = !DILocalVariable(name: "y_value", arg: 2, scope: !889, file: !81, line: 854, type: !17)
!895 = !DILocation(line: 854, column: 36, scope: !889)
!896 = !DILocalVariable(name: "u16MulTemp", scope: !889, file: !81, line: 856, type: !22)
!897 = !DILocation(line: 856, column: 6, scope: !889)
!898 = !DILocation(line: 857, column: 15, scope: !889)
!899 = !DILocation(line: 857, column: 25, scope: !889)
!900 = !DILocation(line: 857, column: 23, scope: !889)
!901 = !DILocation(line: 857, column: 13, scope: !889)
!902 = !DILocation(line: 858, column: 15, scope: !889)
!903 = !DILocation(line: 858, column: 26, scope: !889)
!904 = !DILocation(line: 858, column: 13, scope: !889)
!905 = !DILocation(line: 859, column: 13, scope: !889)
!906 = !DILocation(line: 859, column: 9, scope: !889)
!907 = !DILocation(line: 859, column: 2, scope: !889)
!908 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !81, file: !81, line: 878, type: !890, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!909 = !DILocalVariable(name: "value", arg: 1, scope: !908, file: !81, line: 878, type: !17)
!910 = !DILocation(line: 878, column: 26, scope: !908)
!911 = !DILocalVariable(name: "factor", arg: 2, scope: !908, file: !81, line: 878, type: !17)
!912 = !DILocation(line: 878, column: 36, scope: !908)
!913 = !DILocalVariable(name: "u16MulTemp", scope: !908, file: !81, line: 880, type: !22)
!914 = !DILocation(line: 880, column: 6, scope: !908)
!915 = !DILocation(line: 881, column: 15, scope: !908)
!916 = !DILocation(line: 881, column: 23, scope: !908)
!917 = !DILocation(line: 881, column: 21, scope: !908)
!918 = !DILocation(line: 881, column: 13, scope: !908)
!919 = !DILocation(line: 882, column: 15, scope: !908)
!920 = !DILocation(line: 882, column: 26, scope: !908)
!921 = !DILocation(line: 882, column: 13, scope: !908)
!922 = !DILocation(line: 883, column: 5, scope: !923)
!923 = distinct !DILexicalBlock(scope: !908, file: !81, line: 883, column: 5)
!924 = !DILocation(line: 883, column: 16, scope: !923)
!925 = !DILocation(line: 883, column: 5, scope: !908)
!926 = !DILocation(line: 885, column: 14, scope: !927)
!927 = distinct !DILexicalBlock(scope: !923, file: !81, line: 884, column: 2)
!928 = !DILocation(line: 885, column: 10, scope: !927)
!929 = !DILocation(line: 885, column: 3, scope: !927)
!930 = !DILocation(line: 889, column: 3, scope: !931)
!931 = distinct !DILexicalBlock(scope: !923, file: !81, line: 888, column: 2)
!932 = !DILocation(line: 891, column: 1, scope: !908)
!933 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !81, file: !81, line: 907, type: !934, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!934 = !DISubroutineType(types: !935)
!935 = !{!22, !22, !22}
!936 = !DILocalVariable(name: "value", arg: 1, scope: !933, file: !81, line: 907, type: !22)
!937 = !DILocation(line: 907, column: 39, scope: !933)
!938 = !DILocalVariable(name: "factor", arg: 2, scope: !933, file: !81, line: 907, type: !22)
!939 = !DILocation(line: 907, column: 49, scope: !933)
!940 = !DILocalVariable(name: "u32MulTemp", scope: !933, file: !81, line: 909, type: !29)
!941 = !DILocation(line: 909, column: 6, scope: !933)
!942 = !DILocation(line: 910, column: 15, scope: !933)
!943 = !DILocation(line: 910, column: 23, scope: !933)
!944 = !DILocation(line: 910, column: 21, scope: !933)
!945 = !DILocation(line: 910, column: 13, scope: !933)
!946 = !DILocation(line: 911, column: 15, scope: !933)
!947 = !DILocation(line: 911, column: 26, scope: !933)
!948 = !DILocation(line: 911, column: 13, scope: !933)
!949 = !DILocation(line: 912, column: 14, scope: !933)
!950 = !DILocation(line: 912, column: 9, scope: !933)
!951 = !DILocation(line: 912, column: 2, scope: !933)
!952 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !81, file: !81, line: 931, type: !934, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!953 = !DILocalVariable(name: "value", arg: 1, scope: !952, file: !81, line: 931, type: !22)
!954 = !DILocation(line: 931, column: 43, scope: !952)
!955 = !DILocalVariable(name: "factor", arg: 2, scope: !952, file: !81, line: 931, type: !22)
!956 = !DILocation(line: 931, column: 53, scope: !952)
!957 = !DILocalVariable(name: "u32MulTemp", scope: !952, file: !81, line: 933, type: !29)
!958 = !DILocation(line: 933, column: 6, scope: !952)
!959 = !DILocation(line: 934, column: 15, scope: !952)
!960 = !DILocation(line: 934, column: 23, scope: !952)
!961 = !DILocation(line: 934, column: 21, scope: !952)
!962 = !DILocation(line: 934, column: 13, scope: !952)
!963 = !DILocation(line: 935, column: 15, scope: !952)
!964 = !DILocation(line: 935, column: 26, scope: !952)
!965 = !DILocation(line: 935, column: 13, scope: !952)
!966 = !DILocation(line: 936, column: 5, scope: !967)
!967 = distinct !DILexicalBlock(scope: !952, file: !81, line: 936, column: 5)
!968 = !DILocation(line: 936, column: 16, scope: !967)
!969 = !DILocation(line: 936, column: 5, scope: !952)
!970 = !DILocation(line: 938, column: 11, scope: !971)
!971 = distinct !DILexicalBlock(scope: !967, file: !81, line: 937, column: 2)
!972 = !DILocation(line: 938, column: 22, scope: !971)
!973 = !DILocation(line: 938, column: 10, scope: !971)
!974 = !DILocation(line: 938, column: 3, scope: !971)
!975 = !DILocation(line: 942, column: 3, scope: !976)
!976 = distinct !DILexicalBlock(scope: !967, file: !81, line: 941, column: 2)
!977 = !DILocation(line: 944, column: 1, scope: !952)
!978 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !81, file: !81, line: 962, type: !979, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!979 = !DISubroutineType(types: !980)
!980 = !{!22, !22, !17}
!981 = !DILocalVariable(name: "x_value", arg: 1, scope: !978, file: !81, line: 962, type: !22)
!982 = !DILocation(line: 962, column: 29, scope: !978)
!983 = !DILocalVariable(name: "y_value", arg: 2, scope: !978, file: !81, line: 962, type: !17)
!984 = !DILocation(line: 962, column: 41, scope: !978)
!985 = !DILocalVariable(name: "u32MulTemp", scope: !978, file: !81, line: 964, type: !29)
!986 = !DILocation(line: 964, column: 6, scope: !978)
!987 = !DILocation(line: 965, column: 15, scope: !978)
!988 = !DILocation(line: 965, column: 25, scope: !978)
!989 = !DILocation(line: 965, column: 23, scope: !978)
!990 = !DILocation(line: 965, column: 13, scope: !978)
!991 = !DILocation(line: 966, column: 16, scope: !978)
!992 = !DILocation(line: 966, column: 27, scope: !978)
!993 = !DILocation(line: 966, column: 33, scope: !978)
!994 = !DILocation(line: 966, column: 13, scope: !978)
!995 = !DILocation(line: 967, column: 9, scope: !978)
!996 = !DILocation(line: 967, column: 2, scope: !978)
!997 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !81, file: !81, line: 986, type: !979, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!998 = !DILocalVariable(name: "x_value", arg: 1, scope: !997, file: !81, line: 986, type: !22)
!999 = !DILocation(line: 986, column: 29, scope: !997)
!1000 = !DILocalVariable(name: "y_value", arg: 2, scope: !997, file: !81, line: 986, type: !17)
!1001 = !DILocation(line: 986, column: 41, scope: !997)
!1002 = !DILocalVariable(name: "u32MulTemp", scope: !997, file: !81, line: 988, type: !29)
!1003 = !DILocation(line: 988, column: 6, scope: !997)
!1004 = !DILocation(line: 989, column: 15, scope: !997)
!1005 = !DILocation(line: 989, column: 25, scope: !997)
!1006 = !DILocation(line: 989, column: 23, scope: !997)
!1007 = !DILocation(line: 989, column: 13, scope: !997)
!1008 = !DILocation(line: 990, column: 15, scope: !997)
!1009 = !DILocation(line: 990, column: 26, scope: !997)
!1010 = !DILocation(line: 990, column: 13, scope: !997)
!1011 = !DILocation(line: 991, column: 5, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !997, file: !81, line: 991, column: 5)
!1013 = !DILocation(line: 991, column: 16, scope: !1012)
!1014 = !DILocation(line: 991, column: 5, scope: !997)
!1015 = !DILocation(line: 993, column: 11, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1012, file: !81, line: 992, column: 2)
!1017 = !DILocation(line: 993, column: 22, scope: !1016)
!1018 = !DILocation(line: 993, column: 10, scope: !1016)
!1019 = !DILocation(line: 993, column: 3, scope: !1016)
!1020 = !DILocation(line: 997, column: 3, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1012, file: !81, line: 996, column: 2)
!1022 = !DILocation(line: 999, column: 1, scope: !997)
!1023 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !81, file: !81, line: 1015, type: !1024, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!22, !22, !22, !29}
!1026 = !DILocalVariable(name: "value", arg: 1, scope: !1023, file: !81, line: 1015, type: !22)
!1027 = !DILocation(line: 1015, column: 40, scope: !1023)
!1028 = !DILocalVariable(name: "factor", arg: 2, scope: !1023, file: !81, line: 1015, type: !22)
!1029 = !DILocation(line: 1015, column: 50, scope: !1023)
!1030 = !DILocalVariable(name: "count", arg: 3, scope: !1023, file: !81, line: 1015, type: !29)
!1031 = !DILocation(line: 1015, column: 61, scope: !1023)
!1032 = !DILocalVariable(name: "u32MulTemp", scope: !1023, file: !81, line: 1017, type: !29)
!1033 = !DILocation(line: 1017, column: 6, scope: !1023)
!1034 = !DILocation(line: 1018, column: 15, scope: !1023)
!1035 = !DILocation(line: 1018, column: 23, scope: !1023)
!1036 = !DILocation(line: 1018, column: 21, scope: !1023)
!1037 = !DILocation(line: 1018, column: 13, scope: !1023)
!1038 = !DILocation(line: 1019, column: 15, scope: !1023)
!1039 = !DILocation(line: 1019, column: 26, scope: !1023)
!1040 = !DILocation(line: 1019, column: 25, scope: !1023)
!1041 = !DILocation(line: 1019, column: 13, scope: !1023)
!1042 = !DILocation(line: 1020, column: 10, scope: !1023)
!1043 = !DILocation(line: 1020, column: 21, scope: !1023)
!1044 = !DILocation(line: 1020, column: 9, scope: !1023)
!1045 = !DILocation(line: 1020, column: 2, scope: !1023)
!1046 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !81, file: !81, line: 1038, type: !1047, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!22, !22, !22, !22}
!1049 = !DILocalVariable(name: "value", arg: 1, scope: !1046, file: !81, line: 1038, type: !22)
!1050 = !DILocation(line: 1038, column: 43, scope: !1046)
!1051 = !DILocalVariable(name: "factor", arg: 2, scope: !1046, file: !81, line: 1038, type: !22)
!1052 = !DILocation(line: 1038, column: 53, scope: !1046)
!1053 = !DILocalVariable(name: "count", arg: 3, scope: !1046, file: !81, line: 1038, type: !22)
!1054 = !DILocation(line: 1038, column: 64, scope: !1046)
!1055 = !DILocalVariable(name: "u32MulTemp", scope: !1046, file: !81, line: 1040, type: !29)
!1056 = !DILocation(line: 1040, column: 6, scope: !1046)
!1057 = !DILocation(line: 1041, column: 15, scope: !1046)
!1058 = !DILocation(line: 1041, column: 23, scope: !1046)
!1059 = !DILocation(line: 1041, column: 21, scope: !1046)
!1060 = !DILocation(line: 1041, column: 13, scope: !1046)
!1061 = !DILocation(line: 1042, column: 15, scope: !1046)
!1062 = !DILocation(line: 1042, column: 26, scope: !1046)
!1063 = !DILocation(line: 1042, column: 25, scope: !1046)
!1064 = !DILocation(line: 1042, column: 13, scope: !1046)
!1065 = !DILocation(line: 1043, column: 5, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1046, file: !81, line: 1043, column: 5)
!1067 = !DILocation(line: 1043, column: 16, scope: !1066)
!1068 = !DILocation(line: 1043, column: 5, scope: !1046)
!1069 = !DILocation(line: 1045, column: 11, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1066, file: !81, line: 1044, column: 2)
!1071 = !DILocation(line: 1045, column: 22, scope: !1070)
!1072 = !DILocation(line: 1045, column: 10, scope: !1070)
!1073 = !DILocation(line: 1045, column: 3, scope: !1070)
!1074 = !DILocation(line: 1049, column: 3, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1066, file: !81, line: 1048, column: 2)
!1076 = !DILocation(line: 1051, column: 1, scope: !1046)
!1077 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !81, file: !81, line: 1067, type: !934, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1078 = !DILocalVariable(name: "x_value", arg: 1, scope: !1077, file: !81, line: 1067, type: !22)
!1079 = !DILocation(line: 1067, column: 30, scope: !1077)
!1080 = !DILocalVariable(name: "y_value", arg: 2, scope: !1077, file: !81, line: 1067, type: !22)
!1081 = !DILocation(line: 1067, column: 42, scope: !1077)
!1082 = !DILocalVariable(name: "u32MulTemp", scope: !1077, file: !81, line: 1069, type: !29)
!1083 = !DILocation(line: 1069, column: 6, scope: !1077)
!1084 = !DILocation(line: 1070, column: 15, scope: !1077)
!1085 = !DILocation(line: 1070, column: 25, scope: !1077)
!1086 = !DILocation(line: 1070, column: 23, scope: !1077)
!1087 = !DILocation(line: 1070, column: 13, scope: !1077)
!1088 = !DILocation(line: 1071, column: 15, scope: !1077)
!1089 = !DILocation(line: 1071, column: 26, scope: !1077)
!1090 = !DILocation(line: 1071, column: 13, scope: !1077)
!1091 = !DILocation(line: 1072, column: 19, scope: !1077)
!1092 = !DILocation(line: 1072, column: 17, scope: !1077)
!1093 = !DILocation(line: 1072, column: 9, scope: !1077)
!1094 = !DILocation(line: 1072, column: 2, scope: !1077)
!1095 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !81, file: !81, line: 1091, type: !934, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1096 = !DILocalVariable(name: "x_value", arg: 1, scope: !1095, file: !81, line: 1091, type: !22)
!1097 = !DILocation(line: 1091, column: 30, scope: !1095)
!1098 = !DILocalVariable(name: "y_value", arg: 2, scope: !1095, file: !81, line: 1091, type: !22)
!1099 = !DILocation(line: 1091, column: 42, scope: !1095)
!1100 = !DILocalVariable(name: "u32MulTemp", scope: !1095, file: !81, line: 1093, type: !29)
!1101 = !DILocation(line: 1093, column: 6, scope: !1095)
!1102 = !DILocation(line: 1094, column: 15, scope: !1095)
!1103 = !DILocation(line: 1094, column: 25, scope: !1095)
!1104 = !DILocation(line: 1094, column: 23, scope: !1095)
!1105 = !DILocation(line: 1094, column: 13, scope: !1095)
!1106 = !DILocation(line: 1095, column: 15, scope: !1095)
!1107 = !DILocation(line: 1095, column: 26, scope: !1095)
!1108 = !DILocation(line: 1095, column: 13, scope: !1095)
!1109 = !DILocation(line: 1096, column: 5, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1095, file: !81, line: 1096, column: 5)
!1111 = !DILocation(line: 1096, column: 16, scope: !1110)
!1112 = !DILocation(line: 1096, column: 5, scope: !1095)
!1113 = !DILocation(line: 1098, column: 11, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1110, file: !81, line: 1097, column: 2)
!1115 = !DILocation(line: 1098, column: 22, scope: !1114)
!1116 = !DILocation(line: 1098, column: 10, scope: !1114)
!1117 = !DILocation(line: 1098, column: 3, scope: !1114)
!1118 = !DILocation(line: 1102, column: 3, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1110, file: !81, line: 1101, column: 2)
!1120 = !DILocation(line: 1104, column: 1, scope: !1095)
!1121 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !81, file: !81, line: 1119, type: !1122, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!29, !29, !22}
!1124 = !DILocalVariable(name: "x_value", arg: 1, scope: !1121, file: !81, line: 1119, type: !29)
!1125 = !DILocation(line: 1119, column: 26, scope: !1121)
!1126 = !DILocalVariable(name: "y_value", arg: 2, scope: !1121, file: !81, line: 1119, type: !22)
!1127 = !DILocation(line: 1119, column: 39, scope: !1121)
!1128 = !DILocalVariable(name: "u32Temp1", scope: !1121, file: !81, line: 1122, type: !29)
!1129 = !DILocation(line: 1122, column: 6, scope: !1121)
!1130 = !DILocation(line: 1123, column: 5, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1121, file: !81, line: 1123, column: 5)
!1132 = !DILocation(line: 1123, column: 13, scope: !1131)
!1133 = !DILocation(line: 1123, column: 5, scope: !1121)
!1134 = !DILocation(line: 1125, column: 26, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1131, file: !81, line: 1124, column: 2)
!1136 = !DILocation(line: 1125, column: 25, scope: !1135)
!1137 = !DILocation(line: 1125, column: 12, scope: !1135)
!1138 = !DILocation(line: 1126, column: 6, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1135, file: !81, line: 1126, column: 6)
!1140 = !DILocation(line: 1126, column: 17, scope: !1139)
!1141 = !DILocation(line: 1126, column: 15, scope: !1139)
!1142 = !DILocation(line: 1126, column: 6, scope: !1135)
!1143 = !DILocation(line: 1128, column: 4, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1139, file: !81, line: 1127, column: 3)
!1145 = !DILocation(line: 1132, column: 12, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1139, file: !81, line: 1131, column: 3)
!1147 = !DILocation(line: 1132, column: 22, scope: !1146)
!1148 = !DILocation(line: 1132, column: 20, scope: !1146)
!1149 = !DILocation(line: 1132, column: 4, scope: !1146)
!1150 = !DILocation(line: 1137, column: 3, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1131, file: !81, line: 1136, column: 2)
!1152 = !DILocation(line: 1140, column: 2, scope: !1121)
!1153 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !81, file: !81, line: 1157, type: !1154, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!29, !29, !22, !29}
!1156 = !DILocalVariable(name: "value", arg: 1, scope: !1153, file: !81, line: 1157, type: !29)
!1157 = !DILocation(line: 1157, column: 40, scope: !1153)
!1158 = !DILocalVariable(name: "factor", arg: 2, scope: !1153, file: !81, line: 1157, type: !22)
!1159 = !DILocation(line: 1157, column: 50, scope: !1153)
!1160 = !DILocalVariable(name: "count", arg: 3, scope: !1153, file: !81, line: 1157, type: !29)
!1161 = !DILocation(line: 1157, column: 62, scope: !1153)
!1162 = !DILocalVariable(name: "u32Temp1", scope: !1153, file: !81, line: 1159, type: !29)
!1163 = !DILocation(line: 1159, column: 6, scope: !1153)
!1164 = !DILocalVariable(name: "u32Temp2", scope: !1153, file: !81, line: 1159, type: !29)
!1165 = !DILocation(line: 1159, column: 20, scope: !1153)
!1166 = !DILocation(line: 1160, column: 13, scope: !1153)
!1167 = !DILocation(line: 1160, column: 21, scope: !1153)
!1168 = !DILocation(line: 1160, column: 19, scope: !1153)
!1169 = !DILocation(line: 1160, column: 11, scope: !1153)
!1170 = !DILocation(line: 1161, column: 25, scope: !1153)
!1171 = !DILocation(line: 1161, column: 32, scope: !1153)
!1172 = !DILocation(line: 1161, column: 13, scope: !1153)
!1173 = !DILocation(line: 1161, column: 11, scope: !1153)
!1174 = !DILocation(line: 1162, column: 13, scope: !1153)
!1175 = !DILocation(line: 1162, column: 25, scope: !1153)
!1176 = !DILocation(line: 1162, column: 22, scope: !1153)
!1177 = !DILocation(line: 1162, column: 11, scope: !1153)
!1178 = !DILocation(line: 1163, column: 14, scope: !1153)
!1179 = !DILocation(line: 1163, column: 30, scope: !1153)
!1180 = !DILocation(line: 1163, column: 29, scope: !1153)
!1181 = !DILocation(line: 1163, column: 23, scope: !1153)
!1182 = !DILocation(line: 1163, column: 11, scope: !1153)
!1183 = !DILocation(line: 1164, column: 6, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1153, file: !81, line: 1164, column: 5)
!1185 = !DILocation(line: 1164, column: 16, scope: !1184)
!1186 = !DILocation(line: 1164, column: 14, scope: !1184)
!1187 = !DILocation(line: 1164, column: 23, scope: !1184)
!1188 = !DILocation(line: 1164, column: 5, scope: !1153)
!1189 = !DILocation(line: 1166, column: 10, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1184, file: !81, line: 1165, column: 2)
!1191 = !DILocation(line: 1166, column: 3, scope: !1190)
!1192 = !DILocation(line: 1170, column: 3, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1184, file: !81, line: 1169, column: 2)
!1194 = !DILocation(line: 1172, column: 1, scope: !1153)
!1195 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !81, file: !81, line: 1188, type: !1196, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1196 = !DISubroutineType(types: !1197)
!1197 = !{!17, !17, !17, !6}
!1198 = !DILocalVariable(name: "val1", arg: 1, scope: !1195, file: !81, line: 1188, type: !17)
!1199 = !DILocation(line: 1188, column: 25, scope: !1195)
!1200 = !DILocalVariable(name: "val2", arg: 2, scope: !1195, file: !81, line: 1188, type: !17)
!1201 = !DILocation(line: 1188, column: 34, scope: !1195)
!1202 = !DILocalVariable(name: "factor", arg: 3, scope: !1195, file: !81, line: 1188, type: !6)
!1203 = !DILocation(line: 1188, column: 43, scope: !1195)
!1204 = !DILocalVariable(name: "s16Temp1", scope: !1195, file: !81, line: 1190, type: !13)
!1205 = !DILocation(line: 1190, column: 6, scope: !1195)
!1206 = !DILocation(line: 1191, column: 15, scope: !1195)
!1207 = !DILocation(line: 1191, column: 22, scope: !1195)
!1208 = !DILocation(line: 1191, column: 20, scope: !1195)
!1209 = !DILocation(line: 1191, column: 28, scope: !1195)
!1210 = !DILocation(line: 1191, column: 27, scope: !1195)
!1211 = !DILocation(line: 1191, column: 35, scope: !1195)
!1212 = !DILocation(line: 1191, column: 39, scope: !1195)
!1213 = !DILocation(line: 1191, column: 38, scope: !1195)
!1214 = !DILocation(line: 1191, column: 13, scope: !1195)
!1215 = !DILocation(line: 1191, column: 11, scope: !1195)
!1216 = !DILocation(line: 1192, column: 5, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1195, file: !81, line: 1192, column: 5)
!1218 = !DILocation(line: 1192, column: 14, scope: !1217)
!1219 = !DILocation(line: 1192, column: 5, scope: !1195)
!1220 = !DILocation(line: 1194, column: 6, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1222, file: !81, line: 1194, column: 6)
!1222 = distinct !DILexicalBlock(scope: !1217, file: !81, line: 1193, column: 2)
!1223 = !DILocation(line: 1194, column: 15, scope: !1221)
!1224 = !DILocation(line: 1194, column: 6, scope: !1222)
!1225 = !DILocation(line: 1196, column: 15, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !81, line: 1195, column: 3)
!1227 = !DILocation(line: 1196, column: 11, scope: !1226)
!1228 = !DILocation(line: 1196, column: 4, scope: !1226)
!1229 = !DILocation(line: 1200, column: 4, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1221, file: !81, line: 1199, column: 3)
!1231 = !DILocation(line: 1205, column: 3, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1217, file: !81, line: 1204, column: 2)
!1233 = !DILocation(line: 1208, column: 1, scope: !1195)
!1234 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !81, file: !81, line: 1224, type: !1235, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1235 = !DISubroutineType(types: !1236)
!1236 = !{!22, !22, !22, !6}
!1237 = !DILocalVariable(name: "val1", arg: 1, scope: !1234, file: !81, line: 1224, type: !22)
!1238 = !DILocation(line: 1224, column: 30, scope: !1234)
!1239 = !DILocalVariable(name: "val2", arg: 2, scope: !1234, file: !81, line: 1224, type: !22)
!1240 = !DILocation(line: 1224, column: 40, scope: !1234)
!1241 = !DILocalVariable(name: "factor", arg: 3, scope: !1234, file: !81, line: 1224, type: !6)
!1242 = !DILocation(line: 1224, column: 49, scope: !1234)
!1243 = !DILocalVariable(name: "s32Temp1", scope: !1234, file: !81, line: 1226, type: !89)
!1244 = !DILocation(line: 1226, column: 6, scope: !1234)
!1245 = !DILocation(line: 1227, column: 15, scope: !1234)
!1246 = !DILocation(line: 1227, column: 22, scope: !1234)
!1247 = !DILocation(line: 1227, column: 20, scope: !1234)
!1248 = !DILocation(line: 1227, column: 28, scope: !1234)
!1249 = !DILocation(line: 1227, column: 27, scope: !1234)
!1250 = !DILocation(line: 1227, column: 35, scope: !1234)
!1251 = !DILocation(line: 1227, column: 39, scope: !1234)
!1252 = !DILocation(line: 1227, column: 38, scope: !1234)
!1253 = !DILocation(line: 1227, column: 11, scope: !1234)
!1254 = !DILocation(line: 1228, column: 5, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1234, file: !81, line: 1228, column: 5)
!1256 = !DILocation(line: 1228, column: 14, scope: !1255)
!1257 = !DILocation(line: 1228, column: 5, scope: !1234)
!1258 = !DILocation(line: 1230, column: 6, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1260, file: !81, line: 1230, column: 6)
!1260 = distinct !DILexicalBlock(scope: !1255, file: !81, line: 1229, column: 2)
!1261 = !DILocation(line: 1230, column: 15, scope: !1259)
!1262 = !DILocation(line: 1230, column: 6, scope: !1260)
!1263 = !DILocation(line: 1232, column: 16, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1259, file: !81, line: 1231, column: 3)
!1265 = !DILocation(line: 1232, column: 11, scope: !1264)
!1266 = !DILocation(line: 1232, column: 4, scope: !1264)
!1267 = !DILocation(line: 1236, column: 4, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1259, file: !81, line: 1235, column: 3)
!1269 = !DILocation(line: 1242, column: 3, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1255, file: !81, line: 1241, column: 2)
!1271 = !DILocation(line: 1244, column: 1, scope: !1234)
!1272 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !81, file: !81, line: 1259, type: !934, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1273 = !DILocalVariable(name: "val1", arg: 1, scope: !1272, file: !81, line: 1259, type: !22)
!1274 = !DILocation(line: 1259, column: 26, scope: !1272)
!1275 = !DILocalVariable(name: "val2", arg: 2, scope: !1272, file: !81, line: 1259, type: !22)
!1276 = !DILocation(line: 1259, column: 36, scope: !1272)
!1277 = !DILocalVariable(name: "u32Temp1", scope: !1272, file: !81, line: 1261, type: !29)
!1278 = !DILocation(line: 1261, column: 6, scope: !1272)
!1279 = !DILocation(line: 1262, column: 13, scope: !1272)
!1280 = !DILocation(line: 1262, column: 20, scope: !1272)
!1281 = !DILocation(line: 1262, column: 18, scope: !1272)
!1282 = !DILocation(line: 1262, column: 11, scope: !1272)
!1283 = !DILocation(line: 1263, column: 5, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1272, file: !81, line: 1263, column: 5)
!1285 = !DILocation(line: 1263, column: 14, scope: !1284)
!1286 = !DILocation(line: 1263, column: 5, scope: !1272)
!1287 = !DILocation(line: 1265, column: 11, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1284, file: !81, line: 1264, column: 2)
!1289 = !DILocation(line: 1265, column: 20, scope: !1288)
!1290 = !DILocation(line: 1265, column: 10, scope: !1288)
!1291 = !DILocation(line: 1265, column: 3, scope: !1288)
!1292 = !DILocation(line: 1269, column: 3, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1284, file: !81, line: 1268, column: 2)
!1294 = !DILocation(line: 1271, column: 1, scope: !1272)
!1295 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !81, file: !81, line: 1285, type: !1296, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{!29, !22, !22}
!1298 = !DILocalVariable(name: "x_value", arg: 1, scope: !1295, file: !81, line: 1285, type: !22)
!1299 = !DILocation(line: 1285, column: 25, scope: !1295)
!1300 = !DILocalVariable(name: "y_value", arg: 2, scope: !1295, file: !81, line: 1285, type: !22)
!1301 = !DILocation(line: 1285, column: 38, scope: !1295)
!1302 = !DILocalVariable(name: "u32Temp1", scope: !1295, file: !81, line: 1287, type: !29)
!1303 = !DILocation(line: 1287, column: 6, scope: !1295)
!1304 = !DILocation(line: 1288, column: 13, scope: !1295)
!1305 = !DILocation(line: 1288, column: 23, scope: !1295)
!1306 = !DILocation(line: 1288, column: 21, scope: !1295)
!1307 = !DILocation(line: 1288, column: 11, scope: !1295)
!1308 = !DILocation(line: 1289, column: 9, scope: !1295)
!1309 = !DILocation(line: 1289, column: 2, scope: !1295)
!1310 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !81, file: !81, line: 1307, type: !1311, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!89, !13, !13}
!1313 = !DILocalVariable(name: "x_value", arg: 1, scope: !1310, file: !81, line: 1307, type: !13)
!1314 = !DILocation(line: 1307, column: 25, scope: !1310)
!1315 = !DILocalVariable(name: "y_value", arg: 2, scope: !1310, file: !81, line: 1307, type: !13)
!1316 = !DILocation(line: 1307, column: 38, scope: !1310)
!1317 = !DILocalVariable(name: "s32Temp1", scope: !1310, file: !81, line: 1309, type: !89)
!1318 = !DILocation(line: 1309, column: 6, scope: !1310)
!1319 = !DILocation(line: 1310, column: 13, scope: !1310)
!1320 = !DILocation(line: 1310, column: 23, scope: !1310)
!1321 = !DILocation(line: 1310, column: 21, scope: !1310)
!1322 = !DILocation(line: 1310, column: 11, scope: !1310)
!1323 = !DILocation(line: 1311, column: 9, scope: !1310)
!1324 = !DILocation(line: 1311, column: 2, scope: !1310)
!1325 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !81, file: !81, line: 1328, type: !1326, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1326 = !DISubroutineType(types: !1327)
!1327 = !{!29, !29, !89}
!1328 = !DILocalVariable(name: "val1", arg: 1, scope: !1325, file: !81, line: 1328, type: !29)
!1329 = !DILocation(line: 1328, column: 25, scope: !1325)
!1330 = !DILocalVariable(name: "val2", arg: 2, scope: !1325, file: !81, line: 1328, type: !89)
!1331 = !DILocation(line: 1328, column: 35, scope: !1325)
!1332 = !DILocalVariable(name: "s32Temp1", scope: !1325, file: !81, line: 1330, type: !89)
!1333 = !DILocation(line: 1330, column: 6, scope: !1325)
!1334 = !DILocation(line: 1331, column: 5, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1325, file: !81, line: 1331, column: 5)
!1336 = !DILocation(line: 1331, column: 10, scope: !1335)
!1337 = !DILocation(line: 1331, column: 5, scope: !1325)
!1338 = !DILocation(line: 1333, column: 25, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1335, file: !81, line: 1332, column: 2)
!1340 = !DILocation(line: 1333, column: 24, scope: !1339)
!1341 = !DILocation(line: 1333, column: 12, scope: !1339)
!1342 = !DILocation(line: 1334, column: 6, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1339, file: !81, line: 1334, column: 6)
!1344 = !DILocation(line: 1334, column: 17, scope: !1343)
!1345 = !DILocation(line: 1334, column: 15, scope: !1343)
!1346 = !DILocation(line: 1334, column: 6, scope: !1339)
!1347 = !DILocation(line: 1336, column: 4, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1343, file: !81, line: 1335, column: 3)
!1349 = !DILocation(line: 1340, column: 12, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1343, file: !81, line: 1339, column: 3)
!1351 = !DILocation(line: 1340, column: 19, scope: !1350)
!1352 = !DILocation(line: 1340, column: 17, scope: !1350)
!1353 = !DILocation(line: 1340, column: 4, scope: !1350)
!1354 = !DILocation(line: 1345, column: 3, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1335, file: !81, line: 1344, column: 2)
!1356 = !DILocation(line: 1347, column: 1, scope: !1325)
!1357 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !81, file: !81, line: 1362, type: !1358, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!29, !89, !89}
!1360 = !DILocalVariable(name: "val1", arg: 1, scope: !1357, file: !81, line: 1362, type: !89)
!1361 = !DILocation(line: 1362, column: 25, scope: !1357)
!1362 = !DILocalVariable(name: "val2", arg: 2, scope: !1357, file: !81, line: 1362, type: !89)
!1363 = !DILocation(line: 1362, column: 35, scope: !1357)
!1364 = !DILocalVariable(name: "u32Temp1", scope: !1357, file: !81, line: 1364, type: !29)
!1365 = !DILocation(line: 1364, column: 6, scope: !1357)
!1366 = !DILocalVariable(name: "u32Temp2", scope: !1357, file: !81, line: 1364, type: !29)
!1367 = !DILocation(line: 1364, column: 17, scope: !1357)
!1368 = !DILocalVariable(name: "u32Temp3", scope: !1357, file: !81, line: 1364, type: !29)
!1369 = !DILocation(line: 1364, column: 27, scope: !1357)
!1370 = !DILocalVariable(name: "u8SignBit", scope: !1357, file: !81, line: 1365, type: !17)
!1371 = !DILocation(line: 1365, column: 5, scope: !1357)
!1372 = !DILocation(line: 1367, column: 5, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1357, file: !81, line: 1367, column: 5)
!1374 = !DILocation(line: 1367, column: 9, scope: !1373)
!1375 = !DILocation(line: 1367, column: 5, scope: !1357)
!1376 = !DILocation(line: 1368, column: 15, scope: !1373)
!1377 = !DILocation(line: 1368, column: 14, scope: !1373)
!1378 = !DILocation(line: 1368, column: 12, scope: !1373)
!1379 = !DILocation(line: 1368, column: 3, scope: !1373)
!1380 = !DILocation(line: 1370, column: 14, scope: !1373)
!1381 = !DILocation(line: 1370, column: 12, scope: !1373)
!1382 = !DILocation(line: 1372, column: 5, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1357, file: !81, line: 1372, column: 5)
!1384 = !DILocation(line: 1372, column: 9, scope: !1383)
!1385 = !DILocation(line: 1372, column: 5, scope: !1357)
!1386 = !DILocation(line: 1373, column: 15, scope: !1383)
!1387 = !DILocation(line: 1373, column: 14, scope: !1383)
!1388 = !DILocation(line: 1373, column: 12, scope: !1383)
!1389 = !DILocation(line: 1373, column: 3, scope: !1383)
!1390 = !DILocation(line: 1375, column: 14, scope: !1383)
!1391 = !DILocation(line: 1375, column: 12, scope: !1383)
!1392 = !DILocation(line: 1377, column: 6, scope: !1393)
!1393 = distinct !DILexicalBlock(scope: !1357, file: !81, line: 1377, column: 5)
!1394 = !DILocation(line: 1377, column: 10, scope: !1393)
!1395 = !DILocation(line: 1377, column: 13, scope: !1393)
!1396 = !DILocation(line: 1377, column: 28, scope: !1393)
!1397 = !DILocation(line: 1377, column: 32, scope: !1393)
!1398 = !DILocation(line: 1377, column: 35, scope: !1393)
!1399 = !DILocation(line: 1378, column: 12, scope: !1393)
!1400 = !DILocation(line: 1378, column: 3, scope: !1393)
!1401 = !DILocation(line: 1380, column: 12, scope: !1393)
!1402 = !DILocation(line: 1381, column: 29, scope: !1357)
!1403 = !DILocation(line: 1381, column: 38, scope: !1357)
!1404 = !DILocation(line: 1381, column: 13, scope: !1357)
!1405 = !DILocation(line: 1381, column: 11, scope: !1357)
!1406 = !DILocation(line: 1383, column: 5, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1357, file: !81, line: 1383, column: 5)
!1408 = !DILocation(line: 1383, column: 14, scope: !1407)
!1409 = !DILocation(line: 1383, column: 5, scope: !1357)
!1410 = !DILocation(line: 1385, column: 3, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1407, file: !81, line: 1384, column: 2)
!1412 = !DILocation(line: 1389, column: 10, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1407, file: !81, line: 1388, column: 2)
!1414 = !DILocation(line: 1389, column: 3, scope: !1413)
!1415 = !DILocation(line: 1440, column: 1, scope: !1357)
!1416 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !81, file: !81, line: 1455, type: !1417, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!29, !29, !29}
!1419 = !DILocalVariable(name: "val1", arg: 1, scope: !1416, file: !81, line: 1455, type: !29)
!1420 = !DILocation(line: 1455, column: 25, scope: !1416)
!1421 = !DILocalVariable(name: "val2", arg: 2, scope: !1416, file: !81, line: 1455, type: !29)
!1422 = !DILocation(line: 1455, column: 35, scope: !1416)
!1423 = !DILocalVariable(name: "u32Temp1", scope: !1416, file: !81, line: 1457, type: !29)
!1424 = !DILocation(line: 1457, column: 6, scope: !1416)
!1425 = !DILocation(line: 1458, column: 5, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1416, file: !81, line: 1458, column: 5)
!1427 = !DILocation(line: 1458, column: 10, scope: !1426)
!1428 = !DILocation(line: 1458, column: 5, scope: !1416)
!1429 = !DILocation(line: 1460, column: 26, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1426, file: !81, line: 1459, column: 2)
!1431 = !DILocation(line: 1460, column: 25, scope: !1430)
!1432 = !DILocation(line: 1460, column: 12, scope: !1430)
!1433 = !DILocation(line: 1461, column: 6, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1430, file: !81, line: 1461, column: 6)
!1435 = !DILocation(line: 1461, column: 17, scope: !1434)
!1436 = !DILocation(line: 1461, column: 15, scope: !1434)
!1437 = !DILocation(line: 1461, column: 6, scope: !1430)
!1438 = !DILocation(line: 1463, column: 4, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1434, file: !81, line: 1462, column: 3)
!1440 = !DILocation(line: 1467, column: 12, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1434, file: !81, line: 1466, column: 3)
!1442 = !DILocation(line: 1467, column: 19, scope: !1441)
!1443 = !DILocation(line: 1467, column: 17, scope: !1441)
!1444 = !DILocation(line: 1467, column: 4, scope: !1441)
!1445 = !DILocation(line: 1472, column: 3, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1426, file: !81, line: 1471, column: 2)
!1447 = !DILocation(line: 1474, column: 1, scope: !1416)
!1448 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !81, file: !81, line: 1501, type: !1122, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1449 = !DILocalVariable(name: "value", arg: 1, scope: !1448, file: !81, line: 1501, type: !29)
!1450 = !DILocation(line: 1501, column: 30, scope: !1448)
!1451 = !DILocalVariable(name: "factor", arg: 2, scope: !1448, file: !81, line: 1501, type: !22)
!1452 = !DILocation(line: 1501, column: 41, scope: !1448)
!1453 = !DILocalVariable(name: "u32Temp1", scope: !1448, file: !81, line: 1503, type: !29)
!1454 = !DILocation(line: 1503, column: 6, scope: !1448)
!1455 = !DILocalVariable(name: "u32Temp2", scope: !1448, file: !81, line: 1503, type: !29)
!1456 = !DILocation(line: 1503, column: 20, scope: !1448)
!1457 = !DILocation(line: 1504, column: 13, scope: !1448)
!1458 = !DILocation(line: 1504, column: 21, scope: !1448)
!1459 = !DILocation(line: 1504, column: 19, scope: !1448)
!1460 = !DILocation(line: 1504, column: 11, scope: !1448)
!1461 = !DILocation(line: 1505, column: 25, scope: !1448)
!1462 = !DILocation(line: 1505, column: 32, scope: !1448)
!1463 = !DILocation(line: 1505, column: 13, scope: !1448)
!1464 = !DILocation(line: 1505, column: 11, scope: !1448)
!1465 = !DILocation(line: 1506, column: 14, scope: !1448)
!1466 = !DILocation(line: 1506, column: 23, scope: !1448)
!1467 = !DILocation(line: 1506, column: 11, scope: !1448)
!1468 = !DILocation(line: 1507, column: 14, scope: !1448)
!1469 = !DILocation(line: 1507, column: 23, scope: !1448)
!1470 = !DILocation(line: 1507, column: 11, scope: !1448)
!1471 = !DILocation(line: 1508, column: 9, scope: !1448)
!1472 = !DILocation(line: 1508, column: 2, scope: !1448)
!1473 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !81, file: !81, line: 1527, type: !1122, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1474 = !DILocalVariable(name: "value", arg: 1, scope: !1473, file: !81, line: 1527, type: !29)
!1475 = !DILocation(line: 1527, column: 30, scope: !1473)
!1476 = !DILocalVariable(name: "factor", arg: 2, scope: !1473, file: !81, line: 1527, type: !22)
!1477 = !DILocation(line: 1527, column: 41, scope: !1473)
!1478 = !DILocalVariable(name: "u32Temp1", scope: !1473, file: !81, line: 1529, type: !29)
!1479 = !DILocation(line: 1529, column: 6, scope: !1473)
!1480 = !DILocalVariable(name: "u32Temp2", scope: !1473, file: !81, line: 1529, type: !29)
!1481 = !DILocation(line: 1529, column: 20, scope: !1473)
!1482 = !DILocation(line: 1530, column: 13, scope: !1473)
!1483 = !DILocation(line: 1530, column: 21, scope: !1473)
!1484 = !DILocation(line: 1530, column: 19, scope: !1473)
!1485 = !DILocation(line: 1530, column: 11, scope: !1473)
!1486 = !DILocation(line: 1531, column: 25, scope: !1473)
!1487 = !DILocation(line: 1531, column: 32, scope: !1473)
!1488 = !DILocation(line: 1531, column: 13, scope: !1473)
!1489 = !DILocation(line: 1531, column: 11, scope: !1473)
!1490 = !DILocation(line: 1532, column: 13, scope: !1473)
!1491 = !DILocation(line: 1532, column: 22, scope: !1473)
!1492 = !DILocation(line: 1532, column: 11, scope: !1473)
!1493 = !DILocation(line: 1533, column: 14, scope: !1473)
!1494 = !DILocation(line: 1533, column: 23, scope: !1473)
!1495 = !DILocation(line: 1533, column: 11, scope: !1473)
!1496 = !DILocation(line: 1534, column: 6, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1473, file: !81, line: 1534, column: 5)
!1498 = !DILocation(line: 1534, column: 14, scope: !1497)
!1499 = !DILocation(line: 1534, column: 20, scope: !1497)
!1500 = !DILocation(line: 1534, column: 5, scope: !1473)
!1501 = !DILocation(line: 1536, column: 10, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1497, file: !81, line: 1535, column: 2)
!1503 = !DILocation(line: 1536, column: 3, scope: !1502)
!1504 = !DILocation(line: 1540, column: 3, scope: !1505)
!1505 = distinct !DILexicalBlock(scope: !1497, file: !81, line: 1539, column: 2)
!1506 = !DILocation(line: 1542, column: 1, scope: !1473)
!1507 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !81, file: !81, line: 1560, type: !1508, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{!29, !29, !13}
!1510 = !DILocalVariable(name: "value", arg: 1, scope: !1507, file: !81, line: 1560, type: !29)
!1511 = !DILocation(line: 1560, column: 30, scope: !1507)
!1512 = !DILocalVariable(name: "factor", arg: 2, scope: !1507, file: !81, line: 1560, type: !13)
!1513 = !DILocation(line: 1560, column: 41, scope: !1507)
!1514 = !DILocalVariable(name: "u32Temp1", scope: !1507, file: !81, line: 1562, type: !29)
!1515 = !DILocation(line: 1562, column: 6, scope: !1507)
!1516 = !DILocalVariable(name: "u32Temp2", scope: !1507, file: !81, line: 1562, type: !29)
!1517 = !DILocation(line: 1562, column: 20, scope: !1507)
!1518 = !DILocation(line: 1563, column: 5, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1507, file: !81, line: 1563, column: 5)
!1520 = !DILocation(line: 1563, column: 12, scope: !1519)
!1521 = !DILocation(line: 1563, column: 5, scope: !1507)
!1522 = !DILocation(line: 1566, column: 14, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1519, file: !81, line: 1564, column: 2)
!1524 = !DILocation(line: 1566, column: 22, scope: !1523)
!1525 = !DILocation(line: 1566, column: 20, scope: !1523)
!1526 = !DILocation(line: 1566, column: 12, scope: !1523)
!1527 = !DILocation(line: 1567, column: 26, scope: !1523)
!1528 = !DILocation(line: 1567, column: 33, scope: !1523)
!1529 = !DILocation(line: 1567, column: 14, scope: !1523)
!1530 = !DILocation(line: 1567, column: 12, scope: !1523)
!1531 = !DILocation(line: 1568, column: 14, scope: !1523)
!1532 = !DILocation(line: 1568, column: 23, scope: !1523)
!1533 = !DILocation(line: 1568, column: 12, scope: !1523)
!1534 = !DILocation(line: 1569, column: 15, scope: !1523)
!1535 = !DILocation(line: 1569, column: 24, scope: !1523)
!1536 = !DILocation(line: 1569, column: 12, scope: !1523)
!1537 = !DILocation(line: 1570, column: 10, scope: !1523)
!1538 = !DILocation(line: 1570, column: 3, scope: !1523)
!1539 = !DILocation(line: 1574, column: 3, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1519, file: !81, line: 1573, column: 2)
!1541 = !DILocation(line: 1576, column: 1, scope: !1507)
!1542 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !81, file: !81, line: 1595, type: !1508, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1543 = !DILocalVariable(name: "value", arg: 1, scope: !1542, file: !81, line: 1595, type: !29)
!1544 = !DILocation(line: 1595, column: 31, scope: !1542)
!1545 = !DILocalVariable(name: "factor", arg: 2, scope: !1542, file: !81, line: 1595, type: !13)
!1546 = !DILocation(line: 1595, column: 42, scope: !1542)
!1547 = !DILocalVariable(name: "u32Temp1", scope: !1542, file: !81, line: 1597, type: !29)
!1548 = !DILocation(line: 1597, column: 6, scope: !1542)
!1549 = !DILocalVariable(name: "u32Temp2", scope: !1542, file: !81, line: 1597, type: !29)
!1550 = !DILocation(line: 1597, column: 20, scope: !1542)
!1551 = !DILocation(line: 1598, column: 5, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1542, file: !81, line: 1598, column: 5)
!1553 = !DILocation(line: 1598, column: 12, scope: !1552)
!1554 = !DILocation(line: 1598, column: 5, scope: !1542)
!1555 = !DILocation(line: 1600, column: 3, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1552, file: !81, line: 1599, column: 2)
!1557 = !DILocation(line: 1604, column: 14, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1552, file: !81, line: 1603, column: 2)
!1559 = !DILocation(line: 1604, column: 22, scope: !1558)
!1560 = !DILocation(line: 1604, column: 20, scope: !1558)
!1561 = !DILocation(line: 1604, column: 12, scope: !1558)
!1562 = !DILocation(line: 1605, column: 26, scope: !1558)
!1563 = !DILocation(line: 1605, column: 33, scope: !1558)
!1564 = !DILocation(line: 1605, column: 14, scope: !1558)
!1565 = !DILocation(line: 1605, column: 12, scope: !1558)
!1566 = !DILocation(line: 1606, column: 14, scope: !1558)
!1567 = !DILocation(line: 1606, column: 23, scope: !1558)
!1568 = !DILocation(line: 1606, column: 12, scope: !1558)
!1569 = !DILocation(line: 1607, column: 15, scope: !1558)
!1570 = !DILocation(line: 1607, column: 24, scope: !1558)
!1571 = !DILocation(line: 1607, column: 12, scope: !1558)
!1572 = !DILocation(line: 1608, column: 7, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1558, file: !81, line: 1608, column: 6)
!1574 = !DILocation(line: 1608, column: 16, scope: !1573)
!1575 = !DILocation(line: 1608, column: 23, scope: !1573)
!1576 = !DILocation(line: 1608, column: 6, scope: !1558)
!1577 = !DILocation(line: 1610, column: 11, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1573, file: !81, line: 1609, column: 3)
!1579 = !DILocation(line: 1610, column: 4, scope: !1578)
!1580 = !DILocation(line: 1614, column: 4, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1573, file: !81, line: 1613, column: 3)
!1582 = !DILocation(line: 1617, column: 1, scope: !1542)
!1583 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !81, file: !81, line: 1632, type: !1417, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1584 = !DILocalVariable(name: "value", arg: 1, scope: !1583, file: !81, line: 1632, type: !29)
!1585 = !DILocation(line: 1632, column: 30, scope: !1583)
!1586 = !DILocalVariable(name: "factor", arg: 2, scope: !1583, file: !81, line: 1632, type: !29)
!1587 = !DILocation(line: 1632, column: 40, scope: !1583)
!1588 = !DILocation(line: 1634, column: 21, scope: !1583)
!1589 = !DILocation(line: 1634, column: 28, scope: !1583)
!1590 = !DILocation(line: 1634, column: 9, scope: !1583)
!1591 = !DILocation(line: 1634, column: 2, scope: !1583)
!1592 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !81, file: !81, line: 1653, type: !1417, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1593 = !DILocalVariable(name: "value", arg: 1, scope: !1592, file: !81, line: 1653, type: !29)
!1594 = !DILocation(line: 1653, column: 30, scope: !1592)
!1595 = !DILocalVariable(name: "factor", arg: 2, scope: !1592, file: !81, line: 1653, type: !29)
!1596 = !DILocation(line: 1653, column: 40, scope: !1592)
!1597 = !DILocalVariable(name: "u32Temp1", scope: !1592, file: !81, line: 1655, type: !29)
!1598 = !DILocation(line: 1655, column: 6, scope: !1592)
!1599 = !DILocalVariable(name: "u32Temp2", scope: !1592, file: !81, line: 1655, type: !29)
!1600 = !DILocation(line: 1655, column: 20, scope: !1592)
!1601 = !DILocation(line: 1656, column: 13, scope: !1592)
!1602 = !DILocation(line: 1656, column: 21, scope: !1592)
!1603 = !DILocation(line: 1656, column: 19, scope: !1592)
!1604 = !DILocation(line: 1656, column: 11, scope: !1592)
!1605 = !DILocation(line: 1657, column: 25, scope: !1592)
!1606 = !DILocation(line: 1657, column: 32, scope: !1592)
!1607 = !DILocation(line: 1657, column: 13, scope: !1592)
!1608 = !DILocation(line: 1657, column: 11, scope: !1592)
!1609 = !DILocation(line: 1658, column: 13, scope: !1592)
!1610 = !DILocation(line: 1658, column: 22, scope: !1592)
!1611 = !DILocation(line: 1658, column: 11, scope: !1592)
!1612 = !DILocation(line: 1659, column: 14, scope: !1592)
!1613 = !DILocation(line: 1659, column: 23, scope: !1592)
!1614 = !DILocation(line: 1659, column: 11, scope: !1592)
!1615 = !DILocation(line: 1660, column: 6, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1592, file: !81, line: 1660, column: 5)
!1617 = !DILocation(line: 1660, column: 14, scope: !1616)
!1618 = !DILocation(line: 1660, column: 20, scope: !1616)
!1619 = !DILocation(line: 1660, column: 5, scope: !1592)
!1620 = !DILocation(line: 1662, column: 10, scope: !1621)
!1621 = distinct !DILexicalBlock(scope: !1616, file: !81, line: 1661, column: 2)
!1622 = !DILocation(line: 1662, column: 3, scope: !1621)
!1623 = !DILocation(line: 1666, column: 3, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1616, file: !81, line: 1665, column: 2)
!1625 = !DILocation(line: 1668, column: 1, scope: !1592)
!1626 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !81, file: !81, line: 1686, type: !1326, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1627 = !DILocalVariable(name: "value", arg: 1, scope: !1626, file: !81, line: 1686, type: !29)
!1628 = !DILocation(line: 1686, column: 30, scope: !1626)
!1629 = !DILocalVariable(name: "factor", arg: 2, scope: !1626, file: !81, line: 1686, type: !89)
!1630 = !DILocation(line: 1686, column: 40, scope: !1626)
!1631 = !DILocalVariable(name: "u32Temp1", scope: !1626, file: !81, line: 1688, type: !29)
!1632 = !DILocation(line: 1688, column: 6, scope: !1626)
!1633 = !DILocalVariable(name: "u32Temp2", scope: !1626, file: !81, line: 1688, type: !29)
!1634 = !DILocation(line: 1688, column: 20, scope: !1626)
!1635 = !DILocation(line: 1689, column: 5, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !1626, file: !81, line: 1689, column: 5)
!1637 = !DILocation(line: 1689, column: 12, scope: !1636)
!1638 = !DILocation(line: 1689, column: 5, scope: !1626)
!1639 = !DILocation(line: 1691, column: 14, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1636, file: !81, line: 1690, column: 2)
!1641 = !DILocation(line: 1691, column: 22, scope: !1640)
!1642 = !DILocation(line: 1691, column: 20, scope: !1640)
!1643 = !DILocation(line: 1691, column: 12, scope: !1640)
!1644 = !DILocation(line: 1692, column: 26, scope: !1640)
!1645 = !DILocation(line: 1692, column: 33, scope: !1640)
!1646 = !DILocation(line: 1692, column: 14, scope: !1640)
!1647 = !DILocation(line: 1692, column: 12, scope: !1640)
!1648 = !DILocation(line: 1693, column: 14, scope: !1640)
!1649 = !DILocation(line: 1693, column: 23, scope: !1640)
!1650 = !DILocation(line: 1693, column: 12, scope: !1640)
!1651 = !DILocation(line: 1694, column: 15, scope: !1640)
!1652 = !DILocation(line: 1694, column: 24, scope: !1640)
!1653 = !DILocation(line: 1694, column: 12, scope: !1640)
!1654 = !DILocation(line: 1695, column: 10, scope: !1640)
!1655 = !DILocation(line: 1695, column: 3, scope: !1640)
!1656 = !DILocation(line: 1699, column: 3, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1636, file: !81, line: 1698, column: 2)
!1658 = !DILocation(line: 1701, column: 1, scope: !1626)
!1659 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !81, file: !81, line: 1720, type: !1326, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1660 = !DILocalVariable(name: "value", arg: 1, scope: !1659, file: !81, line: 1720, type: !29)
!1661 = !DILocation(line: 1720, column: 30, scope: !1659)
!1662 = !DILocalVariable(name: "factor", arg: 2, scope: !1659, file: !81, line: 1720, type: !89)
!1663 = !DILocation(line: 1720, column: 40, scope: !1659)
!1664 = !DILocalVariable(name: "u32Temp1", scope: !1659, file: !81, line: 1722, type: !29)
!1665 = !DILocation(line: 1722, column: 6, scope: !1659)
!1666 = !DILocalVariable(name: "u32Temp2", scope: !1659, file: !81, line: 1722, type: !29)
!1667 = !DILocation(line: 1722, column: 20, scope: !1659)
!1668 = !DILocation(line: 1723, column: 5, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1659, file: !81, line: 1723, column: 5)
!1670 = !DILocation(line: 1723, column: 12, scope: !1669)
!1671 = !DILocation(line: 1723, column: 5, scope: !1659)
!1672 = !DILocation(line: 1725, column: 3, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1669, file: !81, line: 1724, column: 2)
!1674 = !DILocation(line: 1729, column: 14, scope: !1675)
!1675 = distinct !DILexicalBlock(scope: !1669, file: !81, line: 1728, column: 2)
!1676 = !DILocation(line: 1729, column: 22, scope: !1675)
!1677 = !DILocation(line: 1729, column: 20, scope: !1675)
!1678 = !DILocation(line: 1729, column: 12, scope: !1675)
!1679 = !DILocation(line: 1730, column: 26, scope: !1675)
!1680 = !DILocation(line: 1730, column: 33, scope: !1675)
!1681 = !DILocation(line: 1730, column: 14, scope: !1675)
!1682 = !DILocation(line: 1730, column: 12, scope: !1675)
!1683 = !DILocation(line: 1731, column: 14, scope: !1675)
!1684 = !DILocation(line: 1731, column: 23, scope: !1675)
!1685 = !DILocation(line: 1731, column: 12, scope: !1675)
!1686 = !DILocation(line: 1732, column: 15, scope: !1675)
!1687 = !DILocation(line: 1732, column: 24, scope: !1675)
!1688 = !DILocation(line: 1732, column: 12, scope: !1675)
!1689 = !DILocation(line: 1733, column: 7, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1675, file: !81, line: 1733, column: 6)
!1691 = !DILocation(line: 1733, column: 15, scope: !1690)
!1692 = !DILocation(line: 1733, column: 21, scope: !1690)
!1693 = !DILocation(line: 1733, column: 6, scope: !1675)
!1694 = !DILocation(line: 1735, column: 11, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1690, file: !81, line: 1734, column: 3)
!1696 = !DILocation(line: 1735, column: 4, scope: !1695)
!1697 = !DILocation(line: 1739, column: 4, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1690, file: !81, line: 1738, column: 3)
!1699 = !DILocation(line: 1742, column: 1, scope: !1659)
!1700 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !81, file: !81, line: 1757, type: !1701, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1701 = !DISubroutineType(types: !1702)
!1702 = !{!89, !29, !89}
!1703 = !DILocalVariable(name: "val1", arg: 1, scope: !1700, file: !81, line: 1757, type: !29)
!1704 = !DILocation(line: 1757, column: 25, scope: !1700)
!1705 = !DILocalVariable(name: "val2", arg: 2, scope: !1700, file: !81, line: 1757, type: !89)
!1706 = !DILocation(line: 1757, column: 35, scope: !1700)
!1707 = !DILocalVariable(name: "s32Val2prime", scope: !1700, file: !81, line: 1759, type: !89)
!1708 = !DILocation(line: 1759, column: 6, scope: !1700)
!1709 = !DILocation(line: 1760, column: 5, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1700, file: !81, line: 1760, column: 5)
!1711 = !DILocation(line: 1760, column: 10, scope: !1710)
!1712 = !DILocation(line: 1760, column: 5, scope: !1700)
!1713 = !DILocation(line: 1762, column: 19, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1710, file: !81, line: 1761, column: 2)
!1715 = !DILocation(line: 1762, column: 18, scope: !1714)
!1716 = !DILocation(line: 1762, column: 16, scope: !1714)
!1717 = !DILocation(line: 1763, column: 2, scope: !1714)
!1718 = !DILocation(line: 1764, column: 5, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1700, file: !81, line: 1764, column: 5)
!1720 = !DILocation(line: 1764, column: 10, scope: !1719)
!1721 = !DILocation(line: 1764, column: 5, scope: !1700)
!1722 = !DILocation(line: 1766, column: 6, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !81, line: 1766, column: 6)
!1724 = distinct !DILexicalBlock(scope: !1719, file: !81, line: 1765, column: 2)
!1725 = !DILocation(line: 1766, column: 11, scope: !1723)
!1726 = !DILocation(line: 1766, column: 6, scope: !1724)
!1727 = !DILocation(line: 1768, column: 21, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1729, file: !81, line: 1768, column: 7)
!1729 = distinct !DILexicalBlock(scope: !1723, file: !81, line: 1767, column: 3)
!1730 = !DILocation(line: 1768, column: 19, scope: !1728)
!1731 = !DILocation(line: 1768, column: 37, scope: !1728)
!1732 = !DILocation(line: 1768, column: 35, scope: !1728)
!1733 = !DILocation(line: 1768, column: 7, scope: !1729)
!1734 = !DILocation(line: 1770, column: 13, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1728, file: !81, line: 1769, column: 4)
!1736 = !DILocation(line: 1770, column: 20, scope: !1735)
!1737 = !DILocation(line: 1770, column: 18, scope: !1735)
!1738 = !DILocation(line: 1770, column: 5, scope: !1735)
!1739 = !DILocation(line: 1774, column: 5, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1728, file: !81, line: 1773, column: 4)
!1741 = !DILocation(line: 1779, column: 21, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1743, file: !81, line: 1779, column: 7)
!1743 = distinct !DILexicalBlock(scope: !1723, file: !81, line: 1778, column: 3)
!1744 = !DILocation(line: 1779, column: 19, scope: !1742)
!1745 = !DILocation(line: 1779, column: 29, scope: !1742)
!1746 = !DILocation(line: 1779, column: 27, scope: !1742)
!1747 = !DILocation(line: 1779, column: 7, scope: !1743)
!1748 = !DILocation(line: 1781, column: 5, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1742, file: !81, line: 1780, column: 4)
!1750 = !DILocation(line: 1785, column: 13, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1742, file: !81, line: 1784, column: 4)
!1752 = !DILocation(line: 1785, column: 20, scope: !1751)
!1753 = !DILocation(line: 1785, column: 18, scope: !1751)
!1754 = !DILocation(line: 1785, column: 5, scope: !1751)
!1755 = !DILocation(line: 1791, column: 3, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1719, file: !81, line: 1790, column: 2)
!1757 = !DILocation(line: 1793, column: 1, scope: !1700)
!1758 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !81, file: !81, line: 1810, type: !780, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1759 = !DILocalVariable(name: "val1", arg: 1, scope: !1758, file: !81, line: 1810, type: !89)
!1760 = !DILocation(line: 1810, column: 30, scope: !1758)
!1761 = !DILocalVariable(name: "val2", arg: 2, scope: !1758, file: !81, line: 1810, type: !22)
!1762 = !DILocation(line: 1810, column: 39, scope: !1758)
!1763 = !DILocalVariable(name: "u32Temp1", scope: !1758, file: !81, line: 1812, type: !29)
!1764 = !DILocation(line: 1812, column: 6, scope: !1758)
!1765 = !DILocalVariable(name: "u32Temp2", scope: !1758, file: !81, line: 1812, type: !29)
!1766 = !DILocation(line: 1812, column: 17, scope: !1758)
!1767 = !DILocalVariable(name: "u32Temp3", scope: !1758, file: !81, line: 1812, type: !29)
!1768 = !DILocation(line: 1812, column: 26, scope: !1758)
!1769 = !DILocalVariable(name: "u8SignBit", scope: !1758, file: !81, line: 1813, type: !17)
!1770 = !DILocation(line: 1813, column: 5, scope: !1758)
!1771 = !DILocation(line: 1815, column: 5, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1758, file: !81, line: 1815, column: 5)
!1773 = !DILocation(line: 1815, column: 9, scope: !1772)
!1774 = !DILocation(line: 1815, column: 5, scope: !1758)
!1775 = !DILocation(line: 1817, column: 15, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1772, file: !81, line: 1816, column: 2)
!1777 = !DILocation(line: 1817, column: 14, scope: !1776)
!1778 = !DILocation(line: 1817, column: 12, scope: !1776)
!1779 = !DILocation(line: 1818, column: 13, scope: !1776)
!1780 = !DILocation(line: 1819, column: 2, scope: !1776)
!1781 = !DILocation(line: 1822, column: 14, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1772, file: !81, line: 1821, column: 2)
!1783 = !DILocation(line: 1822, column: 12, scope: !1782)
!1784 = !DILocation(line: 1823, column: 13, scope: !1782)
!1785 = !DILocation(line: 1826, column: 13, scope: !1758)
!1786 = !DILocation(line: 1826, column: 24, scope: !1758)
!1787 = !DILocation(line: 1826, column: 22, scope: !1758)
!1788 = !DILocation(line: 1826, column: 11, scope: !1758)
!1789 = !DILocation(line: 1827, column: 25, scope: !1758)
!1790 = !DILocation(line: 1827, column: 35, scope: !1758)
!1791 = !DILocation(line: 1827, column: 13, scope: !1758)
!1792 = !DILocation(line: 1827, column: 11, scope: !1758)
!1793 = !DILocation(line: 1828, column: 13, scope: !1758)
!1794 = !DILocation(line: 1828, column: 22, scope: !1758)
!1795 = !DILocation(line: 1828, column: 11, scope: !1758)
!1796 = !DILocation(line: 1829, column: 14, scope: !1758)
!1797 = !DILocation(line: 1829, column: 23, scope: !1758)
!1798 = !DILocation(line: 1829, column: 11, scope: !1758)
!1799 = !DILocation(line: 1830, column: 5, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1758, file: !81, line: 1830, column: 5)
!1801 = !DILocation(line: 1830, column: 15, scope: !1800)
!1802 = !DILocation(line: 1830, column: 5, scope: !1758)
!1803 = !DILocation(line: 1832, column: 10, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1800, file: !81, line: 1831, column: 2)
!1805 = !DILocation(line: 1832, column: 3, scope: !1804)
!1806 = !DILocation(line: 1836, column: 11, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1800, file: !81, line: 1835, column: 2)
!1808 = !DILocation(line: 1836, column: 10, scope: !1807)
!1809 = !DILocation(line: 1836, column: 3, scope: !1807)
!1810 = !DILocation(line: 1838, column: 1, scope: !1758)
!1811 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !81, file: !81, line: 1857, type: !780, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1812 = !DILocalVariable(name: "val1", arg: 1, scope: !1811, file: !81, line: 1857, type: !89)
!1813 = !DILocation(line: 1857, column: 30, scope: !1811)
!1814 = !DILocalVariable(name: "val2", arg: 2, scope: !1811, file: !81, line: 1857, type: !22)
!1815 = !DILocation(line: 1857, column: 39, scope: !1811)
!1816 = !DILocalVariable(name: "u32Temp1", scope: !1811, file: !81, line: 1859, type: !29)
!1817 = !DILocation(line: 1859, column: 6, scope: !1811)
!1818 = !DILocalVariable(name: "u32Temp2", scope: !1811, file: !81, line: 1859, type: !29)
!1819 = !DILocation(line: 1859, column: 17, scope: !1811)
!1820 = !DILocalVariable(name: "u32Temp3", scope: !1811, file: !81, line: 1859, type: !29)
!1821 = !DILocation(line: 1859, column: 26, scope: !1811)
!1822 = !DILocalVariable(name: "u8SignBit", scope: !1811, file: !81, line: 1860, type: !17)
!1823 = !DILocation(line: 1860, column: 5, scope: !1811)
!1824 = !DILocation(line: 1862, column: 5, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1811, file: !81, line: 1862, column: 5)
!1826 = !DILocation(line: 1862, column: 9, scope: !1825)
!1827 = !DILocation(line: 1862, column: 5, scope: !1811)
!1828 = !DILocation(line: 1864, column: 15, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1825, file: !81, line: 1863, column: 2)
!1830 = !DILocation(line: 1864, column: 14, scope: !1829)
!1831 = !DILocation(line: 1864, column: 12, scope: !1829)
!1832 = !DILocation(line: 1865, column: 13, scope: !1829)
!1833 = !DILocation(line: 1866, column: 2, scope: !1829)
!1834 = !DILocation(line: 1869, column: 14, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1825, file: !81, line: 1868, column: 2)
!1836 = !DILocation(line: 1869, column: 12, scope: !1835)
!1837 = !DILocation(line: 1870, column: 13, scope: !1835)
!1838 = !DILocation(line: 1873, column: 13, scope: !1811)
!1839 = !DILocation(line: 1873, column: 24, scope: !1811)
!1840 = !DILocation(line: 1873, column: 22, scope: !1811)
!1841 = !DILocation(line: 1873, column: 11, scope: !1811)
!1842 = !DILocation(line: 1874, column: 25, scope: !1811)
!1843 = !DILocation(line: 1874, column: 35, scope: !1811)
!1844 = !DILocation(line: 1874, column: 13, scope: !1811)
!1845 = !DILocation(line: 1874, column: 11, scope: !1811)
!1846 = !DILocation(line: 1875, column: 13, scope: !1811)
!1847 = !DILocation(line: 1875, column: 22, scope: !1811)
!1848 = !DILocation(line: 1875, column: 11, scope: !1811)
!1849 = !DILocation(line: 1876, column: 14, scope: !1811)
!1850 = !DILocation(line: 1876, column: 23, scope: !1811)
!1851 = !DILocation(line: 1876, column: 11, scope: !1811)
!1852 = !DILocation(line: 1877, column: 5, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1811, file: !81, line: 1877, column: 5)
!1854 = !DILocation(line: 1877, column: 15, scope: !1853)
!1855 = !DILocation(line: 1877, column: 5, scope: !1811)
!1856 = !DILocation(line: 1879, column: 6, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1858, file: !81, line: 1879, column: 6)
!1858 = distinct !DILexicalBlock(scope: !1853, file: !81, line: 1878, column: 2)
!1859 = !DILocation(line: 1879, column: 14, scope: !1857)
!1860 = !DILocation(line: 1879, column: 6, scope: !1858)
!1861 = !DILocation(line: 1880, column: 11, scope: !1857)
!1862 = !DILocation(line: 1880, column: 4, scope: !1857)
!1863 = !DILocation(line: 1882, column: 4, scope: !1857)
!1864 = !DILocation(line: 1886, column: 6, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1866, file: !81, line: 1886, column: 6)
!1866 = distinct !DILexicalBlock(scope: !1853, file: !81, line: 1885, column: 2)
!1867 = !DILocation(line: 1886, column: 14, scope: !1865)
!1868 = !DILocation(line: 1886, column: 6, scope: !1866)
!1869 = !DILocation(line: 1887, column: 12, scope: !1865)
!1870 = !DILocation(line: 1887, column: 11, scope: !1865)
!1871 = !DILocation(line: 1887, column: 4, scope: !1865)
!1872 = !DILocation(line: 1889, column: 4, scope: !1865)
!1873 = !DILocation(line: 1891, column: 1, scope: !1811)
!1874 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !81, file: !81, line: 1911, type: !1875, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1875 = !DISubroutineType(types: !1876)
!1876 = !{!89, !89, !13}
!1877 = !DILocalVariable(name: "val1", arg: 1, scope: !1874, file: !81, line: 1911, type: !89)
!1878 = !DILocation(line: 1911, column: 30, scope: !1874)
!1879 = !DILocalVariable(name: "val2", arg: 2, scope: !1874, file: !81, line: 1911, type: !13)
!1880 = !DILocation(line: 1911, column: 39, scope: !1874)
!1881 = !DILocalVariable(name: "u32Temp1", scope: !1874, file: !81, line: 1913, type: !29)
!1882 = !DILocation(line: 1913, column: 6, scope: !1874)
!1883 = !DILocalVariable(name: "u32Temp2", scope: !1874, file: !81, line: 1913, type: !29)
!1884 = !DILocation(line: 1913, column: 17, scope: !1874)
!1885 = !DILocalVariable(name: "u32Temp3", scope: !1874, file: !81, line: 1913, type: !29)
!1886 = !DILocation(line: 1913, column: 26, scope: !1874)
!1887 = !DILocalVariable(name: "u32Temp4", scope: !1874, file: !81, line: 1913, type: !29)
!1888 = !DILocation(line: 1913, column: 35, scope: !1874)
!1889 = !DILocalVariable(name: "u8SignBit", scope: !1874, file: !81, line: 1914, type: !17)
!1890 = !DILocation(line: 1914, column: 5, scope: !1874)
!1891 = !DILocation(line: 1916, column: 7, scope: !1892)
!1892 = distinct !DILexicalBlock(scope: !1874, file: !81, line: 1916, column: 5)
!1893 = !DILocation(line: 1916, column: 11, scope: !1892)
!1894 = !DILocation(line: 1916, column: 15, scope: !1892)
!1895 = !DILocation(line: 1916, column: 19, scope: !1892)
!1896 = !DILocation(line: 1916, column: 23, scope: !1892)
!1897 = !DILocation(line: 1916, column: 28, scope: !1892)
!1898 = !DILocation(line: 1916, column: 33, scope: !1892)
!1899 = !DILocation(line: 1916, column: 37, scope: !1892)
!1900 = !DILocation(line: 1916, column: 41, scope: !1892)
!1901 = !DILocation(line: 1916, column: 45, scope: !1892)
!1902 = !DILocation(line: 1916, column: 49, scope: !1892)
!1903 = !DILocation(line: 1916, column: 5, scope: !1874)
!1904 = !DILocation(line: 1918, column: 13, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1892, file: !81, line: 1917, column: 2)
!1906 = !DILocation(line: 1919, column: 2, scope: !1905)
!1907 = !DILocation(line: 1922, column: 13, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1892, file: !81, line: 1921, column: 2)
!1909 = !DILocation(line: 1925, column: 5, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1874, file: !81, line: 1925, column: 5)
!1911 = !DILocation(line: 1925, column: 9, scope: !1910)
!1912 = !DILocation(line: 1925, column: 5, scope: !1874)
!1913 = !DILocation(line: 1927, column: 15, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1910, file: !81, line: 1926, column: 2)
!1915 = !DILocation(line: 1927, column: 14, scope: !1914)
!1916 = !DILocation(line: 1927, column: 12, scope: !1914)
!1917 = !DILocation(line: 1928, column: 2, scope: !1914)
!1918 = !DILocation(line: 1931, column: 14, scope: !1919)
!1919 = distinct !DILexicalBlock(scope: !1910, file: !81, line: 1930, column: 2)
!1920 = !DILocation(line: 1931, column: 12, scope: !1919)
!1921 = !DILocation(line: 1934, column: 5, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1874, file: !81, line: 1934, column: 5)
!1923 = !DILocation(line: 1934, column: 9, scope: !1922)
!1924 = !DILocation(line: 1934, column: 5, scope: !1874)
!1925 = !DILocation(line: 1936, column: 15, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1922, file: !81, line: 1935, column: 2)
!1927 = !DILocation(line: 1936, column: 14, scope: !1926)
!1928 = !DILocation(line: 1936, column: 12, scope: !1926)
!1929 = !DILocation(line: 1937, column: 2, scope: !1926)
!1930 = !DILocation(line: 1940, column: 14, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1922, file: !81, line: 1939, column: 2)
!1932 = !DILocation(line: 1940, column: 12, scope: !1931)
!1933 = !DILocation(line: 1943, column: 13, scope: !1874)
!1934 = !DILocation(line: 1943, column: 24, scope: !1874)
!1935 = !DILocation(line: 1943, column: 22, scope: !1874)
!1936 = !DILocation(line: 1943, column: 11, scope: !1874)
!1937 = !DILocation(line: 1944, column: 25, scope: !1874)
!1938 = !DILocation(line: 1944, column: 35, scope: !1874)
!1939 = !DILocation(line: 1944, column: 13, scope: !1874)
!1940 = !DILocation(line: 1944, column: 11, scope: !1874)
!1941 = !DILocation(line: 1945, column: 13, scope: !1874)
!1942 = !DILocation(line: 1945, column: 22, scope: !1874)
!1943 = !DILocation(line: 1945, column: 11, scope: !1874)
!1944 = !DILocation(line: 1946, column: 14, scope: !1874)
!1945 = !DILocation(line: 1946, column: 23, scope: !1874)
!1946 = !DILocation(line: 1946, column: 11, scope: !1874)
!1947 = !DILocation(line: 1947, column: 5, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1874, file: !81, line: 1947, column: 5)
!1949 = !DILocation(line: 1947, column: 15, scope: !1948)
!1950 = !DILocation(line: 1947, column: 5, scope: !1874)
!1951 = !DILocation(line: 1949, column: 6, scope: !1952)
!1952 = distinct !DILexicalBlock(scope: !1953, file: !81, line: 1949, column: 6)
!1953 = distinct !DILexicalBlock(scope: !1948, file: !81, line: 1948, column: 2)
!1954 = !DILocation(line: 1949, column: 14, scope: !1952)
!1955 = !DILocation(line: 1949, column: 6, scope: !1953)
!1956 = !DILocation(line: 1950, column: 11, scope: !1952)
!1957 = !DILocation(line: 1950, column: 4, scope: !1952)
!1958 = !DILocation(line: 1952, column: 4, scope: !1952)
!1959 = !DILocation(line: 1956, column: 11, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1948, file: !81, line: 1955, column: 2)
!1961 = !DILocation(line: 1956, column: 10, scope: !1960)
!1962 = !DILocation(line: 1956, column: 3, scope: !1960)
!1963 = !DILocation(line: 1958, column: 1, scope: !1874)
!1964 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !81, file: !81, line: 1977, type: !1875, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1965 = !DILocalVariable(name: "val1", arg: 1, scope: !1964, file: !81, line: 1977, type: !89)
!1966 = !DILocation(line: 1977, column: 30, scope: !1964)
!1967 = !DILocalVariable(name: "val2", arg: 2, scope: !1964, file: !81, line: 1977, type: !13)
!1968 = !DILocation(line: 1977, column: 39, scope: !1964)
!1969 = !DILocalVariable(name: "u32Temp1", scope: !1964, file: !81, line: 1979, type: !29)
!1970 = !DILocation(line: 1979, column: 6, scope: !1964)
!1971 = !DILocalVariable(name: "u32Temp2", scope: !1964, file: !81, line: 1979, type: !29)
!1972 = !DILocation(line: 1979, column: 17, scope: !1964)
!1973 = !DILocalVariable(name: "u32Temp3", scope: !1964, file: !81, line: 1979, type: !29)
!1974 = !DILocation(line: 1979, column: 26, scope: !1964)
!1975 = !DILocalVariable(name: "u32Temp4", scope: !1964, file: !81, line: 1979, type: !29)
!1976 = !DILocation(line: 1979, column: 35, scope: !1964)
!1977 = !DILocalVariable(name: "u8SignBit", scope: !1964, file: !81, line: 1980, type: !17)
!1978 = !DILocation(line: 1980, column: 5, scope: !1964)
!1979 = !DILocation(line: 1982, column: 7, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1964, file: !81, line: 1982, column: 5)
!1981 = !DILocation(line: 1982, column: 11, scope: !1980)
!1982 = !DILocation(line: 1982, column: 15, scope: !1980)
!1983 = !DILocation(line: 1982, column: 19, scope: !1980)
!1984 = !DILocation(line: 1982, column: 23, scope: !1980)
!1985 = !DILocation(line: 1982, column: 28, scope: !1980)
!1986 = !DILocation(line: 1982, column: 33, scope: !1980)
!1987 = !DILocation(line: 1982, column: 37, scope: !1980)
!1988 = !DILocation(line: 1982, column: 41, scope: !1980)
!1989 = !DILocation(line: 1982, column: 45, scope: !1980)
!1990 = !DILocation(line: 1982, column: 49, scope: !1980)
!1991 = !DILocation(line: 1982, column: 5, scope: !1964)
!1992 = !DILocation(line: 1984, column: 13, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1980, file: !81, line: 1983, column: 2)
!1994 = !DILocation(line: 1985, column: 2, scope: !1993)
!1995 = !DILocation(line: 1988, column: 13, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1980, file: !81, line: 1987, column: 2)
!1997 = !DILocation(line: 1991, column: 5, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1964, file: !81, line: 1991, column: 5)
!1999 = !DILocation(line: 1991, column: 9, scope: !1998)
!2000 = !DILocation(line: 1991, column: 5, scope: !1964)
!2001 = !DILocation(line: 1993, column: 15, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1998, file: !81, line: 1992, column: 2)
!2003 = !DILocation(line: 1993, column: 14, scope: !2002)
!2004 = !DILocation(line: 1993, column: 12, scope: !2002)
!2005 = !DILocation(line: 1994, column: 2, scope: !2002)
!2006 = !DILocation(line: 1997, column: 14, scope: !2007)
!2007 = distinct !DILexicalBlock(scope: !1998, file: !81, line: 1996, column: 2)
!2008 = !DILocation(line: 1997, column: 12, scope: !2007)
!2009 = !DILocation(line: 2000, column: 5, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !1964, file: !81, line: 2000, column: 5)
!2011 = !DILocation(line: 2000, column: 9, scope: !2010)
!2012 = !DILocation(line: 2000, column: 5, scope: !1964)
!2013 = !DILocation(line: 2002, column: 15, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !2010, file: !81, line: 2001, column: 2)
!2015 = !DILocation(line: 2002, column: 14, scope: !2014)
!2016 = !DILocation(line: 2002, column: 12, scope: !2014)
!2017 = !DILocation(line: 2003, column: 2, scope: !2014)
!2018 = !DILocation(line: 2006, column: 14, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !2010, file: !81, line: 2005, column: 2)
!2020 = !DILocation(line: 2006, column: 12, scope: !2019)
!2021 = !DILocation(line: 2009, column: 13, scope: !1964)
!2022 = !DILocation(line: 2009, column: 24, scope: !1964)
!2023 = !DILocation(line: 2009, column: 22, scope: !1964)
!2024 = !DILocation(line: 2009, column: 11, scope: !1964)
!2025 = !DILocation(line: 2010, column: 25, scope: !1964)
!2026 = !DILocation(line: 2010, column: 35, scope: !1964)
!2027 = !DILocation(line: 2010, column: 13, scope: !1964)
!2028 = !DILocation(line: 2010, column: 11, scope: !1964)
!2029 = !DILocation(line: 2011, column: 13, scope: !1964)
!2030 = !DILocation(line: 2011, column: 22, scope: !1964)
!2031 = !DILocation(line: 2011, column: 11, scope: !1964)
!2032 = !DILocation(line: 2012, column: 14, scope: !1964)
!2033 = !DILocation(line: 2012, column: 23, scope: !1964)
!2034 = !DILocation(line: 2012, column: 11, scope: !1964)
!2035 = !DILocation(line: 2013, column: 6, scope: !2036)
!2036 = distinct !DILexicalBlock(scope: !1964, file: !81, line: 2013, column: 5)
!2037 = !DILocation(line: 2013, column: 14, scope: !2036)
!2038 = !DILocation(line: 2013, column: 19, scope: !2036)
!2039 = !DILocation(line: 2013, column: 5, scope: !1964)
!2040 = !DILocation(line: 2015, column: 6, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2042, file: !81, line: 2015, column: 6)
!2042 = distinct !DILexicalBlock(scope: !2036, file: !81, line: 2014, column: 2)
!2043 = !DILocation(line: 2015, column: 16, scope: !2041)
!2044 = !DILocation(line: 2015, column: 6, scope: !2042)
!2045 = !DILocation(line: 2017, column: 7, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2047, file: !81, line: 2017, column: 7)
!2047 = distinct !DILexicalBlock(scope: !2041, file: !81, line: 2016, column: 3)
!2048 = !DILocation(line: 2017, column: 15, scope: !2046)
!2049 = !DILocation(line: 2017, column: 7, scope: !2047)
!2050 = !DILocation(line: 2018, column: 12, scope: !2046)
!2051 = !DILocation(line: 2018, column: 5, scope: !2046)
!2052 = !DILocation(line: 2020, column: 5, scope: !2046)
!2053 = !DILocation(line: 2024, column: 7, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2055, file: !81, line: 2024, column: 7)
!2055 = distinct !DILexicalBlock(scope: !2041, file: !81, line: 2023, column: 3)
!2056 = !DILocation(line: 2024, column: 15, scope: !2054)
!2057 = !DILocation(line: 2024, column: 7, scope: !2055)
!2058 = !DILocation(line: 2025, column: 13, scope: !2054)
!2059 = !DILocation(line: 2025, column: 12, scope: !2054)
!2060 = !DILocation(line: 2025, column: 5, scope: !2054)
!2061 = !DILocation(line: 2027, column: 5, scope: !2054)
!2062 = !DILocation(line: 2032, column: 3, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2036, file: !81, line: 2031, column: 2)
!2064 = !DILocation(line: 2034, column: 1, scope: !1964)
!2065 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !81, file: !81, line: 2049, type: !2066, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2066 = !DISubroutineType(types: !2067)
!2067 = !{!89, !89, !29}
!2068 = !DILocalVariable(name: "val1", arg: 1, scope: !2065, file: !81, line: 2049, type: !89)
!2069 = !DILocation(line: 2049, column: 30, scope: !2065)
!2070 = !DILocalVariable(name: "val2", arg: 2, scope: !2065, file: !81, line: 2049, type: !29)
!2071 = !DILocation(line: 2049, column: 39, scope: !2065)
!2072 = !DILocalVariable(name: "u32Temp1", scope: !2065, file: !81, line: 2051, type: !29)
!2073 = !DILocation(line: 2051, column: 6, scope: !2065)
!2074 = !DILocalVariable(name: "u32Temp2", scope: !2065, file: !81, line: 2051, type: !29)
!2075 = !DILocation(line: 2051, column: 17, scope: !2065)
!2076 = !DILocalVariable(name: "u8SignBit", scope: !2065, file: !81, line: 2052, type: !17)
!2077 = !DILocation(line: 2052, column: 5, scope: !2065)
!2078 = !DILocation(line: 2054, column: 5, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2065, file: !81, line: 2054, column: 5)
!2080 = !DILocation(line: 2054, column: 9, scope: !2079)
!2081 = !DILocation(line: 2054, column: 5, scope: !2065)
!2082 = !DILocation(line: 2056, column: 15, scope: !2083)
!2083 = distinct !DILexicalBlock(scope: !2079, file: !81, line: 2055, column: 2)
!2084 = !DILocation(line: 2056, column: 14, scope: !2083)
!2085 = !DILocation(line: 2056, column: 12, scope: !2083)
!2086 = !DILocation(line: 2057, column: 13, scope: !2083)
!2087 = !DILocation(line: 2058, column: 2, scope: !2083)
!2088 = !DILocation(line: 2061, column: 14, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2079, file: !81, line: 2060, column: 2)
!2090 = !DILocation(line: 2061, column: 12, scope: !2089)
!2091 = !DILocation(line: 2062, column: 13, scope: !2089)
!2092 = !DILocation(line: 2065, column: 25, scope: !2065)
!2093 = !DILocation(line: 2065, column: 35, scope: !2065)
!2094 = !DILocation(line: 2065, column: 13, scope: !2065)
!2095 = !DILocation(line: 2065, column: 11, scope: !2065)
!2096 = !DILocation(line: 2066, column: 5, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2065, file: !81, line: 2066, column: 5)
!2098 = !DILocation(line: 2066, column: 15, scope: !2097)
!2099 = !DILocation(line: 2066, column: 5, scope: !2065)
!2100 = !DILocation(line: 2067, column: 10, scope: !2097)
!2101 = !DILocation(line: 2067, column: 3, scope: !2097)
!2102 = !DILocation(line: 2069, column: 11, scope: !2097)
!2103 = !DILocation(line: 2069, column: 10, scope: !2097)
!2104 = !DILocation(line: 2069, column: 3, scope: !2097)
!2105 = !DILocation(line: 2070, column: 1, scope: !2065)
!2106 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !81, file: !81, line: 2089, type: !2066, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2107 = !DILocalVariable(name: "val1", arg: 1, scope: !2106, file: !81, line: 2089, type: !89)
!2108 = !DILocation(line: 2089, column: 30, scope: !2106)
!2109 = !DILocalVariable(name: "val2", arg: 2, scope: !2106, file: !81, line: 2089, type: !29)
!2110 = !DILocation(line: 2089, column: 39, scope: !2106)
!2111 = !DILocalVariable(name: "u32Temp1", scope: !2106, file: !81, line: 2091, type: !29)
!2112 = !DILocation(line: 2091, column: 6, scope: !2106)
!2113 = !DILocalVariable(name: "u32Temp2", scope: !2106, file: !81, line: 2091, type: !29)
!2114 = !DILocation(line: 2091, column: 17, scope: !2106)
!2115 = !DILocalVariable(name: "u32Temp3", scope: !2106, file: !81, line: 2091, type: !29)
!2116 = !DILocation(line: 2091, column: 26, scope: !2106)
!2117 = !DILocalVariable(name: "u8SignBit", scope: !2106, file: !81, line: 2092, type: !17)
!2118 = !DILocation(line: 2092, column: 5, scope: !2106)
!2119 = !DILocation(line: 2094, column: 5, scope: !2120)
!2120 = distinct !DILexicalBlock(scope: !2106, file: !81, line: 2094, column: 5)
!2121 = !DILocation(line: 2094, column: 9, scope: !2120)
!2122 = !DILocation(line: 2094, column: 5, scope: !2106)
!2123 = !DILocation(line: 2096, column: 15, scope: !2124)
!2124 = distinct !DILexicalBlock(scope: !2120, file: !81, line: 2095, column: 2)
!2125 = !DILocation(line: 2096, column: 14, scope: !2124)
!2126 = !DILocation(line: 2096, column: 12, scope: !2124)
!2127 = !DILocation(line: 2097, column: 13, scope: !2124)
!2128 = !DILocation(line: 2098, column: 2, scope: !2124)
!2129 = !DILocation(line: 2101, column: 14, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2120, file: !81, line: 2100, column: 2)
!2131 = !DILocation(line: 2101, column: 12, scope: !2130)
!2132 = !DILocation(line: 2102, column: 13, scope: !2130)
!2133 = !DILocation(line: 2105, column: 13, scope: !2106)
!2134 = !DILocation(line: 2105, column: 24, scope: !2106)
!2135 = !DILocation(line: 2105, column: 22, scope: !2106)
!2136 = !DILocation(line: 2105, column: 11, scope: !2106)
!2137 = !DILocation(line: 2106, column: 25, scope: !2106)
!2138 = !DILocation(line: 2106, column: 35, scope: !2106)
!2139 = !DILocation(line: 2106, column: 13, scope: !2106)
!2140 = !DILocation(line: 2106, column: 11, scope: !2106)
!2141 = !DILocation(line: 2107, column: 13, scope: !2106)
!2142 = !DILocation(line: 2107, column: 22, scope: !2106)
!2143 = !DILocation(line: 2107, column: 11, scope: !2106)
!2144 = !DILocation(line: 2108, column: 14, scope: !2106)
!2145 = !DILocation(line: 2108, column: 23, scope: !2106)
!2146 = !DILocation(line: 2108, column: 11, scope: !2106)
!2147 = !DILocation(line: 2109, column: 5, scope: !2148)
!2148 = distinct !DILexicalBlock(scope: !2106, file: !81, line: 2109, column: 5)
!2149 = !DILocation(line: 2109, column: 15, scope: !2148)
!2150 = !DILocation(line: 2109, column: 5, scope: !2106)
!2151 = !DILocation(line: 2111, column: 6, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !2153, file: !81, line: 2111, column: 6)
!2153 = distinct !DILexicalBlock(scope: !2148, file: !81, line: 2110, column: 2)
!2154 = !DILocation(line: 2111, column: 14, scope: !2152)
!2155 = !DILocation(line: 2111, column: 6, scope: !2153)
!2156 = !DILocation(line: 2112, column: 11, scope: !2152)
!2157 = !DILocation(line: 2112, column: 4, scope: !2152)
!2158 = !DILocation(line: 2114, column: 4, scope: !2152)
!2159 = !DILocation(line: 2118, column: 6, scope: !2160)
!2160 = distinct !DILexicalBlock(scope: !2161, file: !81, line: 2118, column: 6)
!2161 = distinct !DILexicalBlock(scope: !2148, file: !81, line: 2117, column: 2)
!2162 = !DILocation(line: 2118, column: 14, scope: !2160)
!2163 = !DILocation(line: 2118, column: 6, scope: !2161)
!2164 = !DILocation(line: 2119, column: 12, scope: !2160)
!2165 = !DILocation(line: 2119, column: 11, scope: !2160)
!2166 = !DILocation(line: 2119, column: 4, scope: !2160)
!2167 = !DILocation(line: 2121, column: 4, scope: !2160)
!2168 = !DILocation(line: 2123, column: 1, scope: !2106)
!2169 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !81, file: !81, line: 2141, type: !2170, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2170 = !DISubroutineType(types: !2171)
!2171 = !{!89, !89, !89}
!2172 = !DILocalVariable(name: "value", arg: 1, scope: !2169, file: !81, line: 2141, type: !89)
!2173 = !DILocation(line: 2141, column: 30, scope: !2169)
!2174 = !DILocalVariable(name: "factor", arg: 2, scope: !2169, file: !81, line: 2141, type: !89)
!2175 = !DILocation(line: 2141, column: 41, scope: !2169)
!2176 = !DILocalVariable(name: "u32Temp1", scope: !2169, file: !81, line: 2143, type: !29)
!2177 = !DILocation(line: 2143, column: 6, scope: !2169)
!2178 = !DILocalVariable(name: "u32Temp2", scope: !2169, file: !81, line: 2143, type: !29)
!2179 = !DILocation(line: 2143, column: 17, scope: !2169)
!2180 = !DILocalVariable(name: "u32Temp3", scope: !2169, file: !81, line: 2143, type: !29)
!2181 = !DILocation(line: 2143, column: 26, scope: !2169)
!2182 = !DILocalVariable(name: "u32Temp4", scope: !2169, file: !81, line: 2143, type: !29)
!2183 = !DILocation(line: 2143, column: 35, scope: !2169)
!2184 = !DILocalVariable(name: "u8SignBit", scope: !2169, file: !81, line: 2144, type: !17)
!2185 = !DILocation(line: 2144, column: 5, scope: !2169)
!2186 = !DILocation(line: 2146, column: 7, scope: !2187)
!2187 = distinct !DILexicalBlock(scope: !2169, file: !81, line: 2146, column: 5)
!2188 = !DILocation(line: 2146, column: 12, scope: !2187)
!2189 = !DILocation(line: 2146, column: 16, scope: !2187)
!2190 = !DILocation(line: 2146, column: 36, scope: !2187)
!2191 = !DILocation(line: 2146, column: 41, scope: !2187)
!2192 = !DILocation(line: 2146, column: 45, scope: !2187)
!2193 = !DILocation(line: 2148, column: 13, scope: !2194)
!2194 = distinct !DILexicalBlock(scope: !2187, file: !81, line: 2147, column: 2)
!2195 = !DILocation(line: 2149, column: 2, scope: !2194)
!2196 = !DILocation(line: 2152, column: 13, scope: !2197)
!2197 = distinct !DILexicalBlock(scope: !2187, file: !81, line: 2151, column: 2)
!2198 = !DILocation(line: 2155, column: 5, scope: !2199)
!2199 = distinct !DILexicalBlock(scope: !2169, file: !81, line: 2155, column: 5)
!2200 = !DILocation(line: 2155, column: 10, scope: !2199)
!2201 = !DILocation(line: 2155, column: 5, scope: !2169)
!2202 = !DILocation(line: 2157, column: 15, scope: !2203)
!2203 = distinct !DILexicalBlock(scope: !2199, file: !81, line: 2156, column: 2)
!2204 = !DILocation(line: 2157, column: 14, scope: !2203)
!2205 = !DILocation(line: 2157, column: 12, scope: !2203)
!2206 = !DILocation(line: 2158, column: 2, scope: !2203)
!2207 = !DILocation(line: 2161, column: 14, scope: !2208)
!2208 = distinct !DILexicalBlock(scope: !2199, file: !81, line: 2160, column: 2)
!2209 = !DILocation(line: 2161, column: 12, scope: !2208)
!2210 = !DILocation(line: 2164, column: 5, scope: !2211)
!2211 = distinct !DILexicalBlock(scope: !2169, file: !81, line: 2164, column: 5)
!2212 = !DILocation(line: 2164, column: 11, scope: !2211)
!2213 = !DILocation(line: 2164, column: 5, scope: !2169)
!2214 = !DILocation(line: 2166, column: 15, scope: !2215)
!2215 = distinct !DILexicalBlock(scope: !2211, file: !81, line: 2165, column: 2)
!2216 = !DILocation(line: 2166, column: 14, scope: !2215)
!2217 = !DILocation(line: 2166, column: 12, scope: !2215)
!2218 = !DILocation(line: 2167, column: 2, scope: !2215)
!2219 = !DILocation(line: 2170, column: 14, scope: !2220)
!2220 = distinct !DILexicalBlock(scope: !2211, file: !81, line: 2169, column: 2)
!2221 = !DILocation(line: 2170, column: 12, scope: !2220)
!2222 = !DILocation(line: 2173, column: 13, scope: !2169)
!2223 = !DILocation(line: 2173, column: 24, scope: !2169)
!2224 = !DILocation(line: 2173, column: 22, scope: !2169)
!2225 = !DILocation(line: 2173, column: 11, scope: !2169)
!2226 = !DILocation(line: 2174, column: 25, scope: !2169)
!2227 = !DILocation(line: 2174, column: 35, scope: !2169)
!2228 = !DILocation(line: 2174, column: 13, scope: !2169)
!2229 = !DILocation(line: 2174, column: 11, scope: !2169)
!2230 = !DILocation(line: 2175, column: 13, scope: !2169)
!2231 = !DILocation(line: 2175, column: 22, scope: !2169)
!2232 = !DILocation(line: 2175, column: 11, scope: !2169)
!2233 = !DILocation(line: 2176, column: 14, scope: !2169)
!2234 = !DILocation(line: 2176, column: 23, scope: !2169)
!2235 = !DILocation(line: 2176, column: 11, scope: !2169)
!2236 = !DILocation(line: 2177, column: 5, scope: !2237)
!2237 = distinct !DILexicalBlock(scope: !2169, file: !81, line: 2177, column: 5)
!2238 = !DILocation(line: 2177, column: 15, scope: !2237)
!2239 = !DILocation(line: 2177, column: 5, scope: !2169)
!2240 = !DILocation(line: 2179, column: 6, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2242, file: !81, line: 2179, column: 6)
!2242 = distinct !DILexicalBlock(scope: !2237, file: !81, line: 2178, column: 2)
!2243 = !DILocation(line: 2179, column: 14, scope: !2241)
!2244 = !DILocation(line: 2179, column: 6, scope: !2242)
!2245 = !DILocation(line: 2180, column: 11, scope: !2241)
!2246 = !DILocation(line: 2180, column: 4, scope: !2241)
!2247 = !DILocation(line: 2182, column: 4, scope: !2241)
!2248 = !DILocation(line: 2186, column: 11, scope: !2249)
!2249 = distinct !DILexicalBlock(scope: !2237, file: !81, line: 2185, column: 2)
!2250 = !DILocation(line: 2186, column: 10, scope: !2249)
!2251 = !DILocation(line: 2186, column: 3, scope: !2249)
!2252 = !DILocation(line: 2188, column: 1, scope: !2169)
!2253 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !81, file: !81, line: 2207, type: !2170, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2254 = !DILocalVariable(name: "value", arg: 1, scope: !2253, file: !81, line: 2207, type: !89)
!2255 = !DILocation(line: 2207, column: 30, scope: !2253)
!2256 = !DILocalVariable(name: "factor", arg: 2, scope: !2253, file: !81, line: 2207, type: !89)
!2257 = !DILocation(line: 2207, column: 41, scope: !2253)
!2258 = !DILocalVariable(name: "u32Temp1", scope: !2253, file: !81, line: 2209, type: !29)
!2259 = !DILocation(line: 2209, column: 6, scope: !2253)
!2260 = !DILocalVariable(name: "u32Temp2", scope: !2253, file: !81, line: 2209, type: !29)
!2261 = !DILocation(line: 2209, column: 17, scope: !2253)
!2262 = !DILocalVariable(name: "u32Temp3", scope: !2253, file: !81, line: 2209, type: !29)
!2263 = !DILocation(line: 2209, column: 26, scope: !2253)
!2264 = !DILocalVariable(name: "u32Temp4", scope: !2253, file: !81, line: 2209, type: !29)
!2265 = !DILocation(line: 2209, column: 35, scope: !2253)
!2266 = !DILocalVariable(name: "u8SignBit", scope: !2253, file: !81, line: 2210, type: !17)
!2267 = !DILocation(line: 2210, column: 5, scope: !2253)
!2268 = !DILocation(line: 2212, column: 7, scope: !2269)
!2269 = distinct !DILexicalBlock(scope: !2253, file: !81, line: 2212, column: 5)
!2270 = !DILocation(line: 2212, column: 12, scope: !2269)
!2271 = !DILocation(line: 2212, column: 16, scope: !2269)
!2272 = !DILocation(line: 2212, column: 36, scope: !2269)
!2273 = !DILocation(line: 2212, column: 41, scope: !2269)
!2274 = !DILocation(line: 2212, column: 45, scope: !2269)
!2275 = !DILocation(line: 2214, column: 13, scope: !2276)
!2276 = distinct !DILexicalBlock(scope: !2269, file: !81, line: 2213, column: 2)
!2277 = !DILocation(line: 2215, column: 2, scope: !2276)
!2278 = !DILocation(line: 2218, column: 13, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2269, file: !81, line: 2217, column: 2)
!2280 = !DILocation(line: 2221, column: 5, scope: !2281)
!2281 = distinct !DILexicalBlock(scope: !2253, file: !81, line: 2221, column: 5)
!2282 = !DILocation(line: 2221, column: 10, scope: !2281)
!2283 = !DILocation(line: 2221, column: 5, scope: !2253)
!2284 = !DILocation(line: 2223, column: 15, scope: !2285)
!2285 = distinct !DILexicalBlock(scope: !2281, file: !81, line: 2222, column: 2)
!2286 = !DILocation(line: 2223, column: 14, scope: !2285)
!2287 = !DILocation(line: 2223, column: 12, scope: !2285)
!2288 = !DILocation(line: 2224, column: 2, scope: !2285)
!2289 = !DILocation(line: 2227, column: 14, scope: !2290)
!2290 = distinct !DILexicalBlock(scope: !2281, file: !81, line: 2226, column: 2)
!2291 = !DILocation(line: 2227, column: 12, scope: !2290)
!2292 = !DILocation(line: 2230, column: 5, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2253, file: !81, line: 2230, column: 5)
!2294 = !DILocation(line: 2230, column: 11, scope: !2293)
!2295 = !DILocation(line: 2230, column: 5, scope: !2253)
!2296 = !DILocation(line: 2232, column: 15, scope: !2297)
!2297 = distinct !DILexicalBlock(scope: !2293, file: !81, line: 2231, column: 2)
!2298 = !DILocation(line: 2232, column: 14, scope: !2297)
!2299 = !DILocation(line: 2232, column: 12, scope: !2297)
!2300 = !DILocation(line: 2233, column: 2, scope: !2297)
!2301 = !DILocation(line: 2236, column: 14, scope: !2302)
!2302 = distinct !DILexicalBlock(scope: !2293, file: !81, line: 2235, column: 2)
!2303 = !DILocation(line: 2236, column: 12, scope: !2302)
!2304 = !DILocation(line: 2239, column: 13, scope: !2253)
!2305 = !DILocation(line: 2239, column: 24, scope: !2253)
!2306 = !DILocation(line: 2239, column: 22, scope: !2253)
!2307 = !DILocation(line: 2239, column: 11, scope: !2253)
!2308 = !DILocation(line: 2240, column: 25, scope: !2253)
!2309 = !DILocation(line: 2240, column: 35, scope: !2253)
!2310 = !DILocation(line: 2240, column: 13, scope: !2253)
!2311 = !DILocation(line: 2240, column: 11, scope: !2253)
!2312 = !DILocation(line: 2241, column: 13, scope: !2253)
!2313 = !DILocation(line: 2241, column: 22, scope: !2253)
!2314 = !DILocation(line: 2241, column: 11, scope: !2253)
!2315 = !DILocation(line: 2242, column: 14, scope: !2253)
!2316 = !DILocation(line: 2242, column: 23, scope: !2253)
!2317 = !DILocation(line: 2242, column: 11, scope: !2253)
!2318 = !DILocation(line: 2243, column: 6, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2253, file: !81, line: 2243, column: 5)
!2320 = !DILocation(line: 2243, column: 14, scope: !2319)
!2321 = !DILocation(line: 2243, column: 19, scope: !2319)
!2322 = !DILocation(line: 2243, column: 5, scope: !2253)
!2323 = !DILocation(line: 2245, column: 6, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2325, file: !81, line: 2245, column: 6)
!2325 = distinct !DILexicalBlock(scope: !2319, file: !81, line: 2244, column: 2)
!2326 = !DILocation(line: 2245, column: 16, scope: !2324)
!2327 = !DILocation(line: 2245, column: 6, scope: !2325)
!2328 = !DILocation(line: 2247, column: 7, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2330, file: !81, line: 2247, column: 7)
!2330 = distinct !DILexicalBlock(scope: !2324, file: !81, line: 2246, column: 3)
!2331 = !DILocation(line: 2247, column: 15, scope: !2329)
!2332 = !DILocation(line: 2247, column: 7, scope: !2330)
!2333 = !DILocation(line: 2248, column: 12, scope: !2329)
!2334 = !DILocation(line: 2248, column: 5, scope: !2329)
!2335 = !DILocation(line: 2250, column: 5, scope: !2329)
!2336 = !DILocation(line: 2254, column: 7, scope: !2337)
!2337 = distinct !DILexicalBlock(scope: !2338, file: !81, line: 2254, column: 7)
!2338 = distinct !DILexicalBlock(scope: !2324, file: !81, line: 2253, column: 3)
!2339 = !DILocation(line: 2254, column: 15, scope: !2337)
!2340 = !DILocation(line: 2254, column: 7, scope: !2338)
!2341 = !DILocation(line: 2255, column: 13, scope: !2337)
!2342 = !DILocation(line: 2255, column: 12, scope: !2337)
!2343 = !DILocation(line: 2255, column: 5, scope: !2337)
!2344 = !DILocation(line: 2257, column: 5, scope: !2337)
!2345 = !DILocation(line: 2262, column: 4, scope: !2346)
!2346 = distinct !DILexicalBlock(scope: !2319, file: !81, line: 2261, column: 2)
!2347 = !DILocation(line: 2264, column: 1, scope: !2253)
!2348 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !81, file: !81, line: 2282, type: !2349, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2349 = !DISubroutineType(types: !2350)
!2350 = !{!89, !89, !17}
!2351 = !DILocalVariable(name: "value", arg: 1, scope: !2348, file: !81, line: 2282, type: !89)
!2352 = !DILocation(line: 2282, column: 29, scope: !2348)
!2353 = !DILocalVariable(name: "factor", arg: 2, scope: !2348, file: !81, line: 2282, type: !17)
!2354 = !DILocation(line: 2282, column: 39, scope: !2348)
!2355 = !DILocalVariable(name: "u32Temp1", scope: !2348, file: !81, line: 2284, type: !29)
!2356 = !DILocation(line: 2284, column: 6, scope: !2348)
!2357 = !DILocalVariable(name: "u32Temp2", scope: !2348, file: !81, line: 2284, type: !29)
!2358 = !DILocation(line: 2284, column: 17, scope: !2348)
!2359 = !DILocalVariable(name: "u32Temp3", scope: !2348, file: !81, line: 2284, type: !29)
!2360 = !DILocation(line: 2284, column: 26, scope: !2348)
!2361 = !DILocalVariable(name: "u8SignBit", scope: !2348, file: !81, line: 2285, type: !17)
!2362 = !DILocation(line: 2285, column: 5, scope: !2348)
!2363 = !DILocation(line: 2287, column: 5, scope: !2364)
!2364 = distinct !DILexicalBlock(scope: !2348, file: !81, line: 2287, column: 5)
!2365 = !DILocation(line: 2287, column: 10, scope: !2364)
!2366 = !DILocation(line: 2287, column: 5, scope: !2348)
!2367 = !DILocation(line: 2289, column: 15, scope: !2368)
!2368 = distinct !DILexicalBlock(scope: !2364, file: !81, line: 2288, column: 2)
!2369 = !DILocation(line: 2289, column: 14, scope: !2368)
!2370 = !DILocation(line: 2289, column: 12, scope: !2368)
!2371 = !DILocation(line: 2290, column: 13, scope: !2368)
!2372 = !DILocation(line: 2291, column: 2, scope: !2368)
!2373 = !DILocation(line: 2294, column: 14, scope: !2374)
!2374 = distinct !DILexicalBlock(scope: !2364, file: !81, line: 2293, column: 2)
!2375 = !DILocation(line: 2294, column: 12, scope: !2374)
!2376 = !DILocation(line: 2295, column: 13, scope: !2374)
!2377 = !DILocation(line: 2298, column: 13, scope: !2348)
!2378 = !DILocation(line: 2298, column: 24, scope: !2348)
!2379 = !DILocation(line: 2298, column: 22, scope: !2348)
!2380 = !DILocation(line: 2298, column: 11, scope: !2348)
!2381 = !DILocation(line: 2299, column: 25, scope: !2348)
!2382 = !DILocation(line: 2299, column: 35, scope: !2348)
!2383 = !DILocation(line: 2299, column: 13, scope: !2348)
!2384 = !DILocation(line: 2299, column: 11, scope: !2348)
!2385 = !DILocation(line: 2300, column: 13, scope: !2348)
!2386 = !DILocation(line: 2300, column: 22, scope: !2348)
!2387 = !DILocation(line: 2300, column: 11, scope: !2348)
!2388 = !DILocation(line: 2301, column: 14, scope: !2348)
!2389 = !DILocation(line: 2301, column: 23, scope: !2348)
!2390 = !DILocation(line: 2301, column: 11, scope: !2348)
!2391 = !DILocation(line: 2302, column: 5, scope: !2392)
!2392 = distinct !DILexicalBlock(scope: !2348, file: !81, line: 2302, column: 5)
!2393 = !DILocation(line: 2302, column: 15, scope: !2392)
!2394 = !DILocation(line: 2302, column: 5, scope: !2348)
!2395 = !DILocation(line: 2304, column: 10, scope: !2396)
!2396 = distinct !DILexicalBlock(scope: !2392, file: !81, line: 2303, column: 2)
!2397 = !DILocation(line: 2304, column: 3, scope: !2396)
!2398 = !DILocation(line: 2308, column: 11, scope: !2399)
!2399 = distinct !DILexicalBlock(scope: !2392, file: !81, line: 2307, column: 2)
!2400 = !DILocation(line: 2308, column: 10, scope: !2399)
!2401 = !DILocation(line: 2308, column: 3, scope: !2399)
!2402 = !DILocation(line: 2310, column: 1, scope: !2348)
!2403 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !81, file: !81, line: 2329, type: !2349, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2404 = !DILocalVariable(name: "value", arg: 1, scope: !2403, file: !81, line: 2329, type: !89)
!2405 = !DILocation(line: 2329, column: 29, scope: !2403)
!2406 = !DILocalVariable(name: "factor", arg: 2, scope: !2403, file: !81, line: 2329, type: !17)
!2407 = !DILocation(line: 2329, column: 39, scope: !2403)
!2408 = !DILocalVariable(name: "u32Temp1", scope: !2403, file: !81, line: 2331, type: !29)
!2409 = !DILocation(line: 2331, column: 6, scope: !2403)
!2410 = !DILocalVariable(name: "u32Temp2", scope: !2403, file: !81, line: 2331, type: !29)
!2411 = !DILocation(line: 2331, column: 17, scope: !2403)
!2412 = !DILocalVariable(name: "u32Temp3", scope: !2403, file: !81, line: 2331, type: !29)
!2413 = !DILocation(line: 2331, column: 26, scope: !2403)
!2414 = !DILocalVariable(name: "u8SignBit", scope: !2403, file: !81, line: 2332, type: !17)
!2415 = !DILocation(line: 2332, column: 5, scope: !2403)
!2416 = !DILocation(line: 2334, column: 5, scope: !2417)
!2417 = distinct !DILexicalBlock(scope: !2403, file: !81, line: 2334, column: 5)
!2418 = !DILocation(line: 2334, column: 10, scope: !2417)
!2419 = !DILocation(line: 2334, column: 5, scope: !2403)
!2420 = !DILocation(line: 2336, column: 15, scope: !2421)
!2421 = distinct !DILexicalBlock(scope: !2417, file: !81, line: 2335, column: 2)
!2422 = !DILocation(line: 2336, column: 14, scope: !2421)
!2423 = !DILocation(line: 2336, column: 12, scope: !2421)
!2424 = !DILocation(line: 2337, column: 13, scope: !2421)
!2425 = !DILocation(line: 2338, column: 2, scope: !2421)
!2426 = !DILocation(line: 2341, column: 14, scope: !2427)
!2427 = distinct !DILexicalBlock(scope: !2417, file: !81, line: 2340, column: 2)
!2428 = !DILocation(line: 2341, column: 12, scope: !2427)
!2429 = !DILocation(line: 2342, column: 13, scope: !2427)
!2430 = !DILocation(line: 2345, column: 13, scope: !2403)
!2431 = !DILocation(line: 2345, column: 24, scope: !2403)
!2432 = !DILocation(line: 2345, column: 22, scope: !2403)
!2433 = !DILocation(line: 2345, column: 11, scope: !2403)
!2434 = !DILocation(line: 2346, column: 25, scope: !2403)
!2435 = !DILocation(line: 2346, column: 35, scope: !2403)
!2436 = !DILocation(line: 2346, column: 13, scope: !2403)
!2437 = !DILocation(line: 2346, column: 11, scope: !2403)
!2438 = !DILocation(line: 2347, column: 13, scope: !2403)
!2439 = !DILocation(line: 2347, column: 22, scope: !2403)
!2440 = !DILocation(line: 2347, column: 11, scope: !2403)
!2441 = !DILocation(line: 2348, column: 14, scope: !2403)
!2442 = !DILocation(line: 2348, column: 23, scope: !2403)
!2443 = !DILocation(line: 2348, column: 11, scope: !2403)
!2444 = !DILocation(line: 2349, column: 5, scope: !2445)
!2445 = distinct !DILexicalBlock(scope: !2403, file: !81, line: 2349, column: 5)
!2446 = !DILocation(line: 2349, column: 15, scope: !2445)
!2447 = !DILocation(line: 2349, column: 5, scope: !2403)
!2448 = !DILocation(line: 2351, column: 6, scope: !2449)
!2449 = distinct !DILexicalBlock(scope: !2450, file: !81, line: 2351, column: 6)
!2450 = distinct !DILexicalBlock(scope: !2445, file: !81, line: 2350, column: 2)
!2451 = !DILocation(line: 2351, column: 14, scope: !2449)
!2452 = !DILocation(line: 2351, column: 6, scope: !2450)
!2453 = !DILocation(line: 2352, column: 11, scope: !2449)
!2454 = !DILocation(line: 2352, column: 4, scope: !2449)
!2455 = !DILocation(line: 2354, column: 4, scope: !2449)
!2456 = !DILocation(line: 2358, column: 6, scope: !2457)
!2457 = distinct !DILexicalBlock(scope: !2458, file: !81, line: 2358, column: 6)
!2458 = distinct !DILexicalBlock(scope: !2445, file: !81, line: 2357, column: 2)
!2459 = !DILocation(line: 2358, column: 14, scope: !2457)
!2460 = !DILocation(line: 2358, column: 6, scope: !2458)
!2461 = !DILocation(line: 2359, column: 12, scope: !2457)
!2462 = !DILocation(line: 2359, column: 11, scope: !2457)
!2463 = !DILocation(line: 2359, column: 4, scope: !2457)
!2464 = !DILocation(line: 2361, column: 4, scope: !2457)
!2465 = !DILocation(line: 2363, column: 1, scope: !2403)
!2466 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !81, file: !81, line: 2380, type: !2467, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2467 = !DISubroutineType(types: !2468)
!2468 = !{!29, !29, !29, !17}
!2469 = !DILocalVariable(name: "value", arg: 1, scope: !2466, file: !81, line: 2380, type: !29)
!2470 = !DILocation(line: 2380, column: 39, scope: !2466)
!2471 = !DILocalVariable(name: "factor", arg: 2, scope: !2466, file: !81, line: 2380, type: !29)
!2472 = !DILocation(line: 2380, column: 49, scope: !2466)
!2473 = !DILocalVariable(name: "power", arg: 3, scope: !2466, file: !81, line: 2380, type: !17)
!2474 = !DILocation(line: 2380, column: 60, scope: !2466)
!2475 = !DILocalVariable(name: "u32Temp1", scope: !2466, file: !81, line: 2382, type: !29)
!2476 = !DILocation(line: 2382, column: 6, scope: !2466)
!2477 = !DILocalVariable(name: "u32Temp2", scope: !2466, file: !81, line: 2382, type: !29)
!2478 = !DILocation(line: 2382, column: 20, scope: !2466)
!2479 = !DILocation(line: 2383, column: 5, scope: !2480)
!2480 = distinct !DILexicalBlock(scope: !2466, file: !81, line: 2383, column: 5)
!2481 = !DILocation(line: 2383, column: 10, scope: !2480)
!2482 = !DILocation(line: 2383, column: 5, scope: !2466)
!2483 = !DILocation(line: 2385, column: 9, scope: !2484)
!2484 = distinct !DILexicalBlock(scope: !2480, file: !81, line: 2384, column: 2)
!2485 = !DILocation(line: 2386, column: 2, scope: !2484)
!2486 = !DILocation(line: 2387, column: 10, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !2480, file: !81, line: 2387, column: 10)
!2488 = !DILocation(line: 2387, column: 15, scope: !2487)
!2489 = !DILocation(line: 2387, column: 10, scope: !2480)
!2490 = !DILocation(line: 2389, column: 9, scope: !2491)
!2491 = distinct !DILexicalBlock(scope: !2487, file: !81, line: 2388, column: 2)
!2492 = !DILocation(line: 2390, column: 2, scope: !2491)
!2493 = !DILocation(line: 2395, column: 13, scope: !2466)
!2494 = !DILocation(line: 2395, column: 21, scope: !2466)
!2495 = !DILocation(line: 2395, column: 19, scope: !2466)
!2496 = !DILocation(line: 2395, column: 11, scope: !2466)
!2497 = !DILocation(line: 2396, column: 25, scope: !2466)
!2498 = !DILocation(line: 2396, column: 32, scope: !2466)
!2499 = !DILocation(line: 2396, column: 13, scope: !2466)
!2500 = !DILocation(line: 2396, column: 11, scope: !2466)
!2501 = !DILocation(line: 2397, column: 13, scope: !2466)
!2502 = !DILocation(line: 2397, column: 29, scope: !2466)
!2503 = !DILocation(line: 2397, column: 28, scope: !2466)
!2504 = !DILocation(line: 2397, column: 22, scope: !2466)
!2505 = !DILocation(line: 2397, column: 11, scope: !2466)
!2506 = !DILocation(line: 2398, column: 14, scope: !2466)
!2507 = !DILocation(line: 2398, column: 26, scope: !2466)
!2508 = !DILocation(line: 2398, column: 23, scope: !2466)
!2509 = !DILocation(line: 2398, column: 11, scope: !2466)
!2510 = !DILocation(line: 2399, column: 6, scope: !2511)
!2511 = distinct !DILexicalBlock(scope: !2466, file: !81, line: 2399, column: 5)
!2512 = !DILocation(line: 2399, column: 20, scope: !2511)
!2513 = !DILocation(line: 2399, column: 19, scope: !2511)
!2514 = !DILocation(line: 2399, column: 14, scope: !2511)
!2515 = !DILocation(line: 2399, column: 28, scope: !2511)
!2516 = !DILocation(line: 2399, column: 5, scope: !2466)
!2517 = !DILocation(line: 2401, column: 10, scope: !2518)
!2518 = distinct !DILexicalBlock(scope: !2511, file: !81, line: 2400, column: 2)
!2519 = !DILocation(line: 2401, column: 3, scope: !2518)
!2520 = !DILocation(line: 2405, column: 3, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2511, file: !81, line: 2404, column: 2)
!2522 = !DILocation(line: 2407, column: 1, scope: !2466)
!2523 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !81, file: !81, line: 2425, type: !2524, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2524 = !DISubroutineType(types: !2525)
!2525 = !{!89, !89, !89, !17}
!2526 = !DILocalVariable(name: "value", arg: 1, scope: !2523, file: !81, line: 2425, type: !89)
!2527 = !DILocation(line: 2425, column: 39, scope: !2523)
!2528 = !DILocalVariable(name: "factor", arg: 2, scope: !2523, file: !81, line: 2425, type: !89)
!2529 = !DILocation(line: 2425, column: 50, scope: !2523)
!2530 = !DILocalVariable(name: "power", arg: 3, scope: !2523, file: !81, line: 2425, type: !17)
!2531 = !DILocation(line: 2425, column: 61, scope: !2523)
!2532 = !DILocalVariable(name: "u32Temp1", scope: !2523, file: !81, line: 2427, type: !29)
!2533 = !DILocation(line: 2427, column: 6, scope: !2523)
!2534 = !DILocalVariable(name: "u32Temp2", scope: !2523, file: !81, line: 2427, type: !29)
!2535 = !DILocation(line: 2427, column: 17, scope: !2523)
!2536 = !DILocalVariable(name: "u32Temp3", scope: !2523, file: !81, line: 2427, type: !29)
!2537 = !DILocation(line: 2427, column: 26, scope: !2523)
!2538 = !DILocalVariable(name: "u32Temp4", scope: !2523, file: !81, line: 2427, type: !29)
!2539 = !DILocation(line: 2427, column: 35, scope: !2523)
!2540 = !DILocalVariable(name: "u8SignBit", scope: !2523, file: !81, line: 2428, type: !17)
!2541 = !DILocation(line: 2428, column: 5, scope: !2523)
!2542 = !DILocation(line: 2430, column: 5, scope: !2543)
!2543 = distinct !DILexicalBlock(scope: !2523, file: !81, line: 2430, column: 5)
!2544 = !DILocation(line: 2430, column: 10, scope: !2543)
!2545 = !DILocation(line: 2430, column: 5, scope: !2523)
!2546 = !DILocation(line: 2432, column: 9, scope: !2547)
!2547 = distinct !DILexicalBlock(scope: !2543, file: !81, line: 2431, column: 2)
!2548 = !DILocation(line: 2433, column: 2, scope: !2547)
!2549 = !DILocation(line: 2434, column: 10, scope: !2550)
!2550 = distinct !DILexicalBlock(scope: !2543, file: !81, line: 2434, column: 10)
!2551 = !DILocation(line: 2434, column: 15, scope: !2550)
!2552 = !DILocation(line: 2434, column: 10, scope: !2543)
!2553 = !DILocation(line: 2436, column: 9, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2550, file: !81, line: 2435, column: 2)
!2555 = !DILocation(line: 2437, column: 2, scope: !2554)
!2556 = !DILocation(line: 2443, column: 7, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2523, file: !81, line: 2443, column: 5)
!2558 = !DILocation(line: 2443, column: 12, scope: !2557)
!2559 = !DILocation(line: 2443, column: 16, scope: !2557)
!2560 = !DILocation(line: 2443, column: 36, scope: !2557)
!2561 = !DILocation(line: 2443, column: 41, scope: !2557)
!2562 = !DILocation(line: 2443, column: 45, scope: !2557)
!2563 = !DILocation(line: 2445, column: 13, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2557, file: !81, line: 2444, column: 2)
!2565 = !DILocation(line: 2446, column: 2, scope: !2564)
!2566 = !DILocation(line: 2449, column: 13, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2557, file: !81, line: 2448, column: 2)
!2568 = !DILocation(line: 2452, column: 5, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2523, file: !81, line: 2452, column: 5)
!2570 = !DILocation(line: 2452, column: 10, scope: !2569)
!2571 = !DILocation(line: 2452, column: 5, scope: !2523)
!2572 = !DILocation(line: 2454, column: 15, scope: !2573)
!2573 = distinct !DILexicalBlock(scope: !2569, file: !81, line: 2453, column: 2)
!2574 = !DILocation(line: 2454, column: 14, scope: !2573)
!2575 = !DILocation(line: 2454, column: 12, scope: !2573)
!2576 = !DILocation(line: 2455, column: 2, scope: !2573)
!2577 = !DILocation(line: 2458, column: 14, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2569, file: !81, line: 2457, column: 2)
!2579 = !DILocation(line: 2458, column: 12, scope: !2578)
!2580 = !DILocation(line: 2461, column: 5, scope: !2581)
!2581 = distinct !DILexicalBlock(scope: !2523, file: !81, line: 2461, column: 5)
!2582 = !DILocation(line: 2461, column: 11, scope: !2581)
!2583 = !DILocation(line: 2461, column: 5, scope: !2523)
!2584 = !DILocation(line: 2463, column: 15, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2581, file: !81, line: 2462, column: 2)
!2586 = !DILocation(line: 2463, column: 14, scope: !2585)
!2587 = !DILocation(line: 2463, column: 12, scope: !2585)
!2588 = !DILocation(line: 2464, column: 2, scope: !2585)
!2589 = !DILocation(line: 2467, column: 14, scope: !2590)
!2590 = distinct !DILexicalBlock(scope: !2581, file: !81, line: 2466, column: 2)
!2591 = !DILocation(line: 2467, column: 12, scope: !2590)
!2592 = !DILocation(line: 2470, column: 13, scope: !2523)
!2593 = !DILocation(line: 2470, column: 24, scope: !2523)
!2594 = !DILocation(line: 2470, column: 22, scope: !2523)
!2595 = !DILocation(line: 2470, column: 11, scope: !2523)
!2596 = !DILocation(line: 2471, column: 25, scope: !2523)
!2597 = !DILocation(line: 2471, column: 35, scope: !2523)
!2598 = !DILocation(line: 2471, column: 13, scope: !2523)
!2599 = !DILocation(line: 2471, column: 11, scope: !2523)
!2600 = !DILocation(line: 2472, column: 13, scope: !2523)
!2601 = !DILocation(line: 2472, column: 29, scope: !2523)
!2602 = !DILocation(line: 2472, column: 28, scope: !2523)
!2603 = !DILocation(line: 2472, column: 22, scope: !2523)
!2604 = !DILocation(line: 2472, column: 11, scope: !2523)
!2605 = !DILocation(line: 2473, column: 14, scope: !2523)
!2606 = !DILocation(line: 2473, column: 26, scope: !2523)
!2607 = !DILocation(line: 2473, column: 23, scope: !2523)
!2608 = !DILocation(line: 2473, column: 11, scope: !2523)
!2609 = !DILocation(line: 2474, column: 6, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2523, file: !81, line: 2474, column: 5)
!2611 = !DILocation(line: 2474, column: 20, scope: !2610)
!2612 = !DILocation(line: 2474, column: 19, scope: !2610)
!2613 = !DILocation(line: 2474, column: 14, scope: !2610)
!2614 = !DILocation(line: 2474, column: 27, scope: !2610)
!2615 = !DILocation(line: 2474, column: 5, scope: !2523)
!2616 = !DILocation(line: 2476, column: 6, scope: !2617)
!2617 = distinct !DILexicalBlock(scope: !2618, file: !81, line: 2476, column: 6)
!2618 = distinct !DILexicalBlock(scope: !2610, file: !81, line: 2475, column: 2)
!2619 = !DILocation(line: 2476, column: 16, scope: !2617)
!2620 = !DILocation(line: 2476, column: 6, scope: !2618)
!2621 = !DILocation(line: 2478, column: 7, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2623, file: !81, line: 2478, column: 7)
!2623 = distinct !DILexicalBlock(scope: !2617, file: !81, line: 2477, column: 3)
!2624 = !DILocation(line: 2478, column: 15, scope: !2622)
!2625 = !DILocation(line: 2478, column: 7, scope: !2623)
!2626 = !DILocation(line: 2479, column: 12, scope: !2622)
!2627 = !DILocation(line: 2479, column: 5, scope: !2622)
!2628 = !DILocation(line: 2481, column: 5, scope: !2622)
!2629 = !DILocation(line: 2485, column: 12, scope: !2630)
!2630 = distinct !DILexicalBlock(scope: !2617, file: !81, line: 2484, column: 3)
!2631 = !DILocation(line: 2485, column: 11, scope: !2630)
!2632 = !DILocation(line: 2485, column: 4, scope: !2630)
!2633 = !DILocation(line: 2490, column: 6, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2635, file: !81, line: 2490, column: 6)
!2635 = distinct !DILexicalBlock(scope: !2610, file: !81, line: 2489, column: 2)
!2636 = !DILocation(line: 2490, column: 16, scope: !2634)
!2637 = !DILocation(line: 2490, column: 6, scope: !2635)
!2638 = !DILocation(line: 2492, column: 4, scope: !2639)
!2639 = distinct !DILexicalBlock(scope: !2634, file: !81, line: 2491, column: 3)
!2640 = !DILocation(line: 2496, column: 4, scope: !2641)
!2641 = distinct !DILexicalBlock(scope: !2634, file: !81, line: 2495, column: 3)
!2642 = !DILocation(line: 2499, column: 1, scope: !2523)
!2643 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !81, file: !81, line: 2518, type: !2644, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2644 = !DISubroutineType(types: !2645)
!2645 = !{!89, !89, !6}
!2646 = !DILocalVariable(name: "value", arg: 1, scope: !2643, file: !81, line: 2518, type: !89)
!2647 = !DILocation(line: 2518, column: 29, scope: !2643)
!2648 = !DILocalVariable(name: "factor", arg: 2, scope: !2643, file: !81, line: 2518, type: !6)
!2649 = !DILocation(line: 2518, column: 39, scope: !2643)
!2650 = !DILocalVariable(name: "u32Temp1", scope: !2643, file: !81, line: 2520, type: !29)
!2651 = !DILocation(line: 2520, column: 6, scope: !2643)
!2652 = !DILocalVariable(name: "u32Temp2", scope: !2643, file: !81, line: 2520, type: !29)
!2653 = !DILocation(line: 2520, column: 17, scope: !2643)
!2654 = !DILocalVariable(name: "u32Temp3", scope: !2643, file: !81, line: 2520, type: !29)
!2655 = !DILocation(line: 2520, column: 26, scope: !2643)
!2656 = !DILocalVariable(name: "u32Temp4", scope: !2643, file: !81, line: 2520, type: !29)
!2657 = !DILocation(line: 2520, column: 35, scope: !2643)
!2658 = !DILocalVariable(name: "u8SignBit", scope: !2643, file: !81, line: 2521, type: !17)
!2659 = !DILocation(line: 2521, column: 5, scope: !2643)
!2660 = !DILocation(line: 2523, column: 7, scope: !2661)
!2661 = distinct !DILexicalBlock(scope: !2643, file: !81, line: 2523, column: 5)
!2662 = !DILocation(line: 2523, column: 12, scope: !2661)
!2663 = !DILocation(line: 2523, column: 16, scope: !2661)
!2664 = !DILocation(line: 2523, column: 20, scope: !2661)
!2665 = !DILocation(line: 2523, column: 26, scope: !2661)
!2666 = !DILocation(line: 2523, column: 31, scope: !2661)
!2667 = !DILocation(line: 2523, column: 36, scope: !2661)
!2668 = !DILocation(line: 2523, column: 41, scope: !2661)
!2669 = !DILocation(line: 2523, column: 45, scope: !2661)
!2670 = !DILocation(line: 2523, column: 49, scope: !2661)
!2671 = !DILocation(line: 2523, column: 55, scope: !2661)
!2672 = !DILocation(line: 2523, column: 5, scope: !2643)
!2673 = !DILocation(line: 2525, column: 13, scope: !2674)
!2674 = distinct !DILexicalBlock(scope: !2661, file: !81, line: 2524, column: 2)
!2675 = !DILocation(line: 2526, column: 2, scope: !2674)
!2676 = !DILocation(line: 2529, column: 13, scope: !2677)
!2677 = distinct !DILexicalBlock(scope: !2661, file: !81, line: 2528, column: 2)
!2678 = !DILocation(line: 2532, column: 5, scope: !2679)
!2679 = distinct !DILexicalBlock(scope: !2643, file: !81, line: 2532, column: 5)
!2680 = !DILocation(line: 2532, column: 10, scope: !2679)
!2681 = !DILocation(line: 2532, column: 5, scope: !2643)
!2682 = !DILocation(line: 2534, column: 15, scope: !2683)
!2683 = distinct !DILexicalBlock(scope: !2679, file: !81, line: 2533, column: 2)
!2684 = !DILocation(line: 2534, column: 14, scope: !2683)
!2685 = !DILocation(line: 2534, column: 12, scope: !2683)
!2686 = !DILocation(line: 2535, column: 2, scope: !2683)
!2687 = !DILocation(line: 2538, column: 14, scope: !2688)
!2688 = distinct !DILexicalBlock(scope: !2679, file: !81, line: 2537, column: 2)
!2689 = !DILocation(line: 2538, column: 12, scope: !2688)
!2690 = !DILocation(line: 2541, column: 5, scope: !2691)
!2691 = distinct !DILexicalBlock(scope: !2643, file: !81, line: 2541, column: 5)
!2692 = !DILocation(line: 2541, column: 11, scope: !2691)
!2693 = !DILocation(line: 2541, column: 5, scope: !2643)
!2694 = !DILocation(line: 2543, column: 15, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2691, file: !81, line: 2542, column: 2)
!2696 = !DILocation(line: 2543, column: 14, scope: !2695)
!2697 = !DILocation(line: 2543, column: 12, scope: !2695)
!2698 = !DILocation(line: 2544, column: 2, scope: !2695)
!2699 = !DILocation(line: 2547, column: 14, scope: !2700)
!2700 = distinct !DILexicalBlock(scope: !2691, file: !81, line: 2546, column: 2)
!2701 = !DILocation(line: 2547, column: 12, scope: !2700)
!2702 = !DILocation(line: 2550, column: 13, scope: !2643)
!2703 = !DILocation(line: 2550, column: 24, scope: !2643)
!2704 = !DILocation(line: 2550, column: 22, scope: !2643)
!2705 = !DILocation(line: 2550, column: 11, scope: !2643)
!2706 = !DILocation(line: 2551, column: 25, scope: !2643)
!2707 = !DILocation(line: 2551, column: 35, scope: !2643)
!2708 = !DILocation(line: 2551, column: 13, scope: !2643)
!2709 = !DILocation(line: 2551, column: 11, scope: !2643)
!2710 = !DILocation(line: 2552, column: 13, scope: !2643)
!2711 = !DILocation(line: 2552, column: 22, scope: !2643)
!2712 = !DILocation(line: 2552, column: 11, scope: !2643)
!2713 = !DILocation(line: 2553, column: 14, scope: !2643)
!2714 = !DILocation(line: 2553, column: 23, scope: !2643)
!2715 = !DILocation(line: 2553, column: 11, scope: !2643)
!2716 = !DILocation(line: 2554, column: 5, scope: !2717)
!2717 = distinct !DILexicalBlock(scope: !2643, file: !81, line: 2554, column: 5)
!2718 = !DILocation(line: 2554, column: 15, scope: !2717)
!2719 = !DILocation(line: 2554, column: 5, scope: !2643)
!2720 = !DILocation(line: 2556, column: 6, scope: !2721)
!2721 = distinct !DILexicalBlock(scope: !2722, file: !81, line: 2556, column: 6)
!2722 = distinct !DILexicalBlock(scope: !2717, file: !81, line: 2555, column: 2)
!2723 = !DILocation(line: 2556, column: 14, scope: !2721)
!2724 = !DILocation(line: 2556, column: 6, scope: !2722)
!2725 = !DILocation(line: 2557, column: 11, scope: !2721)
!2726 = !DILocation(line: 2557, column: 4, scope: !2721)
!2727 = !DILocation(line: 2559, column: 4, scope: !2721)
!2728 = !DILocation(line: 2563, column: 11, scope: !2729)
!2729 = distinct !DILexicalBlock(scope: !2717, file: !81, line: 2562, column: 2)
!2730 = !DILocation(line: 2563, column: 10, scope: !2729)
!2731 = !DILocation(line: 2563, column: 3, scope: !2729)
!2732 = !DILocation(line: 2565, column: 1, scope: !2643)
!2733 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !81, file: !81, line: 2584, type: !2644, scopeLine: 2585, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2734 = !DILocalVariable(name: "value", arg: 1, scope: !2733, file: !81, line: 2584, type: !89)
!2735 = !DILocation(line: 2584, column: 29, scope: !2733)
!2736 = !DILocalVariable(name: "factor", arg: 2, scope: !2733, file: !81, line: 2584, type: !6)
!2737 = !DILocation(line: 2584, column: 39, scope: !2733)
!2738 = !DILocalVariable(name: "u32Temp1", scope: !2733, file: !81, line: 2586, type: !29)
!2739 = !DILocation(line: 2586, column: 6, scope: !2733)
!2740 = !DILocalVariable(name: "u32Temp2", scope: !2733, file: !81, line: 2586, type: !29)
!2741 = !DILocation(line: 2586, column: 17, scope: !2733)
!2742 = !DILocalVariable(name: "u32Temp3", scope: !2733, file: !81, line: 2586, type: !29)
!2743 = !DILocation(line: 2586, column: 26, scope: !2733)
!2744 = !DILocalVariable(name: "u32Temp4", scope: !2733, file: !81, line: 2586, type: !29)
!2745 = !DILocation(line: 2586, column: 35, scope: !2733)
!2746 = !DILocalVariable(name: "u8SignBit", scope: !2733, file: !81, line: 2587, type: !17)
!2747 = !DILocation(line: 2587, column: 5, scope: !2733)
!2748 = !DILocation(line: 2589, column: 7, scope: !2749)
!2749 = distinct !DILexicalBlock(scope: !2733, file: !81, line: 2589, column: 5)
!2750 = !DILocation(line: 2589, column: 12, scope: !2749)
!2751 = !DILocation(line: 2589, column: 16, scope: !2749)
!2752 = !DILocation(line: 2589, column: 20, scope: !2749)
!2753 = !DILocation(line: 2589, column: 26, scope: !2749)
!2754 = !DILocation(line: 2589, column: 31, scope: !2749)
!2755 = !DILocation(line: 2589, column: 36, scope: !2749)
!2756 = !DILocation(line: 2589, column: 41, scope: !2749)
!2757 = !DILocation(line: 2589, column: 45, scope: !2749)
!2758 = !DILocation(line: 2589, column: 49, scope: !2749)
!2759 = !DILocation(line: 2589, column: 55, scope: !2749)
!2760 = !DILocation(line: 2589, column: 5, scope: !2733)
!2761 = !DILocation(line: 2591, column: 13, scope: !2762)
!2762 = distinct !DILexicalBlock(scope: !2749, file: !81, line: 2590, column: 2)
!2763 = !DILocation(line: 2592, column: 2, scope: !2762)
!2764 = !DILocation(line: 2595, column: 13, scope: !2765)
!2765 = distinct !DILexicalBlock(scope: !2749, file: !81, line: 2594, column: 2)
!2766 = !DILocation(line: 2598, column: 5, scope: !2767)
!2767 = distinct !DILexicalBlock(scope: !2733, file: !81, line: 2598, column: 5)
!2768 = !DILocation(line: 2598, column: 10, scope: !2767)
!2769 = !DILocation(line: 2598, column: 5, scope: !2733)
!2770 = !DILocation(line: 2600, column: 15, scope: !2771)
!2771 = distinct !DILexicalBlock(scope: !2767, file: !81, line: 2599, column: 2)
!2772 = !DILocation(line: 2600, column: 14, scope: !2771)
!2773 = !DILocation(line: 2600, column: 12, scope: !2771)
!2774 = !DILocation(line: 2601, column: 2, scope: !2771)
!2775 = !DILocation(line: 2604, column: 14, scope: !2776)
!2776 = distinct !DILexicalBlock(scope: !2767, file: !81, line: 2603, column: 2)
!2777 = !DILocation(line: 2604, column: 12, scope: !2776)
!2778 = !DILocation(line: 2607, column: 5, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2733, file: !81, line: 2607, column: 5)
!2780 = !DILocation(line: 2607, column: 11, scope: !2779)
!2781 = !DILocation(line: 2607, column: 5, scope: !2733)
!2782 = !DILocation(line: 2609, column: 15, scope: !2783)
!2783 = distinct !DILexicalBlock(scope: !2779, file: !81, line: 2608, column: 2)
!2784 = !DILocation(line: 2609, column: 14, scope: !2783)
!2785 = !DILocation(line: 2609, column: 12, scope: !2783)
!2786 = !DILocation(line: 2610, column: 2, scope: !2783)
!2787 = !DILocation(line: 2613, column: 14, scope: !2788)
!2788 = distinct !DILexicalBlock(scope: !2779, file: !81, line: 2612, column: 2)
!2789 = !DILocation(line: 2613, column: 12, scope: !2788)
!2790 = !DILocation(line: 2616, column: 13, scope: !2733)
!2791 = !DILocation(line: 2616, column: 24, scope: !2733)
!2792 = !DILocation(line: 2616, column: 22, scope: !2733)
!2793 = !DILocation(line: 2616, column: 11, scope: !2733)
!2794 = !DILocation(line: 2617, column: 25, scope: !2733)
!2795 = !DILocation(line: 2617, column: 35, scope: !2733)
!2796 = !DILocation(line: 2617, column: 13, scope: !2733)
!2797 = !DILocation(line: 2617, column: 11, scope: !2733)
!2798 = !DILocation(line: 2618, column: 13, scope: !2733)
!2799 = !DILocation(line: 2618, column: 22, scope: !2733)
!2800 = !DILocation(line: 2618, column: 11, scope: !2733)
!2801 = !DILocation(line: 2619, column: 14, scope: !2733)
!2802 = !DILocation(line: 2619, column: 23, scope: !2733)
!2803 = !DILocation(line: 2619, column: 11, scope: !2733)
!2804 = !DILocation(line: 2620, column: 6, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2733, file: !81, line: 2620, column: 5)
!2806 = !DILocation(line: 2620, column: 14, scope: !2805)
!2807 = !DILocation(line: 2620, column: 18, scope: !2805)
!2808 = !DILocation(line: 2620, column: 5, scope: !2733)
!2809 = !DILocation(line: 2622, column: 6, scope: !2810)
!2810 = distinct !DILexicalBlock(scope: !2811, file: !81, line: 2622, column: 6)
!2811 = distinct !DILexicalBlock(scope: !2805, file: !81, line: 2621, column: 2)
!2812 = !DILocation(line: 2622, column: 16, scope: !2810)
!2813 = !DILocation(line: 2622, column: 6, scope: !2811)
!2814 = !DILocation(line: 2624, column: 7, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2816, file: !81, line: 2624, column: 7)
!2816 = distinct !DILexicalBlock(scope: !2810, file: !81, line: 2623, column: 3)
!2817 = !DILocation(line: 2624, column: 15, scope: !2815)
!2818 = !DILocation(line: 2624, column: 7, scope: !2816)
!2819 = !DILocation(line: 2625, column: 12, scope: !2815)
!2820 = !DILocation(line: 2625, column: 5, scope: !2815)
!2821 = !DILocation(line: 2627, column: 5, scope: !2815)
!2822 = !DILocation(line: 2631, column: 7, scope: !2823)
!2823 = distinct !DILexicalBlock(scope: !2824, file: !81, line: 2631, column: 7)
!2824 = distinct !DILexicalBlock(scope: !2810, file: !81, line: 2630, column: 3)
!2825 = !DILocation(line: 2631, column: 15, scope: !2823)
!2826 = !DILocation(line: 2631, column: 7, scope: !2824)
!2827 = !DILocation(line: 2632, column: 13, scope: !2823)
!2828 = !DILocation(line: 2632, column: 12, scope: !2823)
!2829 = !DILocation(line: 2632, column: 5, scope: !2823)
!2830 = !DILocation(line: 2634, column: 5, scope: !2823)
!2831 = !DILocation(line: 2639, column: 3, scope: !2832)
!2832 = distinct !DILexicalBlock(scope: !2805, file: !81, line: 2638, column: 2)
!2833 = !DILocation(line: 2641, column: 1, scope: !2733)
!2834 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !81, file: !81, line: 2656, type: !2170, scopeLine: 2657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2835 = !DILocalVariable(name: "val1", arg: 1, scope: !2834, file: !81, line: 2656, type: !89)
!2836 = !DILocation(line: 2656, column: 25, scope: !2834)
!2837 = !DILocalVariable(name: "val2", arg: 2, scope: !2834, file: !81, line: 2656, type: !89)
!2838 = !DILocation(line: 2656, column: 35, scope: !2834)
!2839 = !DILocalVariable(name: "u32Temp1", scope: !2834, file: !81, line: 2658, type: !29)
!2840 = !DILocation(line: 2658, column: 6, scope: !2834)
!2841 = !DILocalVariable(name: "u32Temp2", scope: !2834, file: !81, line: 2658, type: !29)
!2842 = !DILocation(line: 2658, column: 17, scope: !2834)
!2843 = !DILocalVariable(name: "u32Temp3", scope: !2834, file: !81, line: 2658, type: !29)
!2844 = !DILocation(line: 2658, column: 26, scope: !2834)
!2845 = !DILocalVariable(name: "u32Temp4", scope: !2834, file: !81, line: 2658, type: !29)
!2846 = !DILocation(line: 2658, column: 35, scope: !2834)
!2847 = !DILocalVariable(name: "u8SignBit", scope: !2834, file: !81, line: 2659, type: !17)
!2848 = !DILocation(line: 2659, column: 5, scope: !2834)
!2849 = !DILocation(line: 2661, column: 7, scope: !2850)
!2850 = distinct !DILexicalBlock(scope: !2834, file: !81, line: 2661, column: 5)
!2851 = !DILocation(line: 2661, column: 11, scope: !2850)
!2852 = !DILocation(line: 2661, column: 15, scope: !2850)
!2853 = !DILocation(line: 2661, column: 33, scope: !2850)
!2854 = !DILocation(line: 2661, column: 37, scope: !2850)
!2855 = !DILocation(line: 2661, column: 41, scope: !2850)
!2856 = !DILocation(line: 2663, column: 13, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2850, file: !81, line: 2662, column: 2)
!2858 = !DILocation(line: 2664, column: 2, scope: !2857)
!2859 = !DILocation(line: 2667, column: 13, scope: !2860)
!2860 = distinct !DILexicalBlock(scope: !2850, file: !81, line: 2666, column: 2)
!2861 = !DILocation(line: 2670, column: 5, scope: !2862)
!2862 = distinct !DILexicalBlock(scope: !2834, file: !81, line: 2670, column: 5)
!2863 = !DILocation(line: 2670, column: 9, scope: !2862)
!2864 = !DILocation(line: 2670, column: 5, scope: !2834)
!2865 = !DILocation(line: 2672, column: 15, scope: !2866)
!2866 = distinct !DILexicalBlock(scope: !2862, file: !81, line: 2671, column: 2)
!2867 = !DILocation(line: 2672, column: 14, scope: !2866)
!2868 = !DILocation(line: 2672, column: 12, scope: !2866)
!2869 = !DILocation(line: 2673, column: 2, scope: !2866)
!2870 = !DILocation(line: 2676, column: 14, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2862, file: !81, line: 2675, column: 2)
!2872 = !DILocation(line: 2676, column: 12, scope: !2871)
!2873 = !DILocation(line: 2679, column: 5, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2834, file: !81, line: 2679, column: 5)
!2875 = !DILocation(line: 2679, column: 9, scope: !2874)
!2876 = !DILocation(line: 2679, column: 5, scope: !2834)
!2877 = !DILocation(line: 2681, column: 15, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2874, file: !81, line: 2680, column: 2)
!2879 = !DILocation(line: 2681, column: 14, scope: !2878)
!2880 = !DILocation(line: 2681, column: 12, scope: !2878)
!2881 = !DILocation(line: 2682, column: 2, scope: !2878)
!2882 = !DILocation(line: 2685, column: 14, scope: !2883)
!2883 = distinct !DILexicalBlock(scope: !2874, file: !81, line: 2684, column: 2)
!2884 = !DILocation(line: 2685, column: 12, scope: !2883)
!2885 = !DILocation(line: 2688, column: 13, scope: !2834)
!2886 = !DILocation(line: 2688, column: 24, scope: !2834)
!2887 = !DILocation(line: 2688, column: 22, scope: !2834)
!2888 = !DILocation(line: 2688, column: 11, scope: !2834)
!2889 = !DILocation(line: 2689, column: 25, scope: !2834)
!2890 = !DILocation(line: 2689, column: 35, scope: !2834)
!2891 = !DILocation(line: 2689, column: 13, scope: !2834)
!2892 = !DILocation(line: 2689, column: 11, scope: !2834)
!2893 = !DILocation(line: 2690, column: 5, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2834, file: !81, line: 2690, column: 5)
!2895 = !DILocation(line: 2690, column: 13, scope: !2894)
!2896 = !DILocation(line: 2690, column: 5, scope: !2834)
!2897 = !DILocation(line: 2692, column: 6, scope: !2898)
!2898 = distinct !DILexicalBlock(scope: !2899, file: !81, line: 2692, column: 6)
!2899 = distinct !DILexicalBlock(scope: !2894, file: !81, line: 2691, column: 2)
!2900 = !DILocation(line: 2692, column: 16, scope: !2898)
!2901 = !DILocation(line: 2692, column: 6, scope: !2899)
!2902 = !DILocation(line: 2694, column: 7, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2904, file: !81, line: 2694, column: 7)
!2904 = distinct !DILexicalBlock(scope: !2898, file: !81, line: 2693, column: 3)
!2905 = !DILocation(line: 2694, column: 15, scope: !2903)
!2906 = !DILocation(line: 2694, column: 7, scope: !2904)
!2907 = !DILocation(line: 2695, column: 12, scope: !2903)
!2908 = !DILocation(line: 2695, column: 5, scope: !2903)
!2909 = !DILocation(line: 2697, column: 5, scope: !2903)
!2910 = !DILocation(line: 2701, column: 7, scope: !2911)
!2911 = distinct !DILexicalBlock(scope: !2912, file: !81, line: 2701, column: 7)
!2912 = distinct !DILexicalBlock(scope: !2898, file: !81, line: 2700, column: 3)
!2913 = !DILocation(line: 2701, column: 15, scope: !2911)
!2914 = !DILocation(line: 2701, column: 7, scope: !2912)
!2915 = !DILocation(line: 2702, column: 13, scope: !2911)
!2916 = !DILocation(line: 2702, column: 12, scope: !2911)
!2917 = !DILocation(line: 2702, column: 5, scope: !2911)
!2918 = !DILocation(line: 2704, column: 5, scope: !2911)
!2919 = !DILocation(line: 2709, column: 6, scope: !2920)
!2920 = distinct !DILexicalBlock(scope: !2921, file: !81, line: 2709, column: 6)
!2921 = distinct !DILexicalBlock(scope: !2894, file: !81, line: 2708, column: 2)
!2922 = !DILocation(line: 2709, column: 16, scope: !2920)
!2923 = !DILocation(line: 2709, column: 6, scope: !2921)
!2924 = !DILocation(line: 2711, column: 4, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2920, file: !81, line: 2710, column: 3)
!2926 = !DILocation(line: 2715, column: 4, scope: !2927)
!2927 = distinct !DILexicalBlock(scope: !2920, file: !81, line: 2714, column: 3)
!2928 = !DILocation(line: 2719, column: 1, scope: !2834)
!2929 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !81, file: !81, line: 2737, type: !2066, scopeLine: 2738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2930 = !DILocalVariable(name: "value", arg: 1, scope: !2929, file: !81, line: 2737, type: !89)
!2931 = !DILocation(line: 2737, column: 31, scope: !2929)
!2932 = !DILocalVariable(name: "factor", arg: 2, scope: !2929, file: !81, line: 2737, type: !29)
!2933 = !DILocation(line: 2737, column: 42, scope: !2929)
!2934 = !DILocalVariable(name: "u32Temp1", scope: !2929, file: !81, line: 2739, type: !29)
!2935 = !DILocation(line: 2739, column: 6, scope: !2929)
!2936 = !DILocalVariable(name: "u32Temp2", scope: !2929, file: !81, line: 2739, type: !29)
!2937 = !DILocation(line: 2739, column: 17, scope: !2929)
!2938 = !DILocalVariable(name: "u8SignBit", scope: !2929, file: !81, line: 2740, type: !17)
!2939 = !DILocation(line: 2740, column: 5, scope: !2929)
!2940 = !DILocation(line: 2742, column: 5, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2929, file: !81, line: 2742, column: 5)
!2942 = !DILocation(line: 2742, column: 10, scope: !2941)
!2943 = !DILocation(line: 2742, column: 5, scope: !2929)
!2944 = !DILocation(line: 2744, column: 15, scope: !2945)
!2945 = distinct !DILexicalBlock(scope: !2941, file: !81, line: 2743, column: 2)
!2946 = !DILocation(line: 2744, column: 14, scope: !2945)
!2947 = !DILocation(line: 2744, column: 12, scope: !2945)
!2948 = !DILocation(line: 2745, column: 13, scope: !2945)
!2949 = !DILocation(line: 2746, column: 2, scope: !2945)
!2950 = !DILocation(line: 2749, column: 14, scope: !2951)
!2951 = distinct !DILexicalBlock(scope: !2941, file: !81, line: 2748, column: 2)
!2952 = !DILocation(line: 2749, column: 12, scope: !2951)
!2953 = !DILocation(line: 2750, column: 13, scope: !2951)
!2954 = !DILocation(line: 2753, column: 25, scope: !2929)
!2955 = !DILocation(line: 2753, column: 35, scope: !2929)
!2956 = !DILocation(line: 2753, column: 13, scope: !2929)
!2957 = !DILocation(line: 2753, column: 11, scope: !2929)
!2958 = !DILocation(line: 2754, column: 13, scope: !2929)
!2959 = !DILocation(line: 2754, column: 22, scope: !2929)
!2960 = !DILocation(line: 2754, column: 11, scope: !2929)
!2961 = !DILocation(line: 2755, column: 5, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2929, file: !81, line: 2755, column: 5)
!2963 = !DILocation(line: 2755, column: 15, scope: !2962)
!2964 = !DILocation(line: 2755, column: 5, scope: !2929)
!2965 = !DILocation(line: 2757, column: 10, scope: !2966)
!2966 = distinct !DILexicalBlock(scope: !2962, file: !81, line: 2756, column: 2)
!2967 = !DILocation(line: 2757, column: 3, scope: !2966)
!2968 = !DILocation(line: 2761, column: 11, scope: !2969)
!2969 = distinct !DILexicalBlock(scope: !2962, file: !81, line: 2760, column: 2)
!2970 = !DILocation(line: 2761, column: 10, scope: !2969)
!2971 = !DILocation(line: 2761, column: 3, scope: !2969)
!2972 = !DILocation(line: 2763, column: 1, scope: !2929)
!2973 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !81, file: !81, line: 2779, type: !2170, scopeLine: 2780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2974 = !DILocalVariable(name: "value", arg: 1, scope: !2973, file: !81, line: 2779, type: !89)
!2975 = !DILocation(line: 2779, column: 31, scope: !2973)
!2976 = !DILocalVariable(name: "factor", arg: 2, scope: !2973, file: !81, line: 2779, type: !89)
!2977 = !DILocation(line: 2779, column: 42, scope: !2973)
!2978 = !DILocalVariable(name: "u32Temp1", scope: !2973, file: !81, line: 2781, type: !29)
!2979 = !DILocation(line: 2781, column: 6, scope: !2973)
!2980 = !DILocalVariable(name: "u32Temp2", scope: !2973, file: !81, line: 2781, type: !29)
!2981 = !DILocation(line: 2781, column: 17, scope: !2973)
!2982 = !DILocalVariable(name: "u32Temp3", scope: !2973, file: !81, line: 2781, type: !29)
!2983 = !DILocation(line: 2781, column: 26, scope: !2973)
!2984 = !DILocalVariable(name: "u8SignBit", scope: !2973, file: !81, line: 2782, type: !17)
!2985 = !DILocation(line: 2782, column: 5, scope: !2973)
!2986 = !DILocation(line: 2784, column: 7, scope: !2987)
!2987 = distinct !DILexicalBlock(scope: !2973, file: !81, line: 2784, column: 5)
!2988 = !DILocation(line: 2784, column: 12, scope: !2987)
!2989 = !DILocation(line: 2784, column: 16, scope: !2987)
!2990 = !DILocation(line: 2784, column: 36, scope: !2987)
!2991 = !DILocation(line: 2784, column: 41, scope: !2987)
!2992 = !DILocation(line: 2784, column: 45, scope: !2987)
!2993 = !DILocation(line: 2786, column: 13, scope: !2994)
!2994 = distinct !DILexicalBlock(scope: !2987, file: !81, line: 2785, column: 2)
!2995 = !DILocation(line: 2787, column: 2, scope: !2994)
!2996 = !DILocation(line: 2790, column: 13, scope: !2997)
!2997 = distinct !DILexicalBlock(scope: !2987, file: !81, line: 2789, column: 2)
!2998 = !DILocation(line: 2793, column: 5, scope: !2999)
!2999 = distinct !DILexicalBlock(scope: !2973, file: !81, line: 2793, column: 5)
!3000 = !DILocation(line: 2793, column: 10, scope: !2999)
!3001 = !DILocation(line: 2793, column: 5, scope: !2973)
!3002 = !DILocation(line: 2795, column: 15, scope: !3003)
!3003 = distinct !DILexicalBlock(scope: !2999, file: !81, line: 2794, column: 2)
!3004 = !DILocation(line: 2795, column: 14, scope: !3003)
!3005 = !DILocation(line: 2795, column: 12, scope: !3003)
!3006 = !DILocation(line: 2796, column: 2, scope: !3003)
!3007 = !DILocation(line: 2799, column: 14, scope: !3008)
!3008 = distinct !DILexicalBlock(scope: !2999, file: !81, line: 2798, column: 2)
!3009 = !DILocation(line: 2799, column: 12, scope: !3008)
!3010 = !DILocation(line: 2802, column: 5, scope: !3011)
!3011 = distinct !DILexicalBlock(scope: !2973, file: !81, line: 2802, column: 5)
!3012 = !DILocation(line: 2802, column: 11, scope: !3011)
!3013 = !DILocation(line: 2802, column: 5, scope: !2973)
!3014 = !DILocation(line: 2804, column: 15, scope: !3015)
!3015 = distinct !DILexicalBlock(scope: !3011, file: !81, line: 2803, column: 2)
!3016 = !DILocation(line: 2804, column: 14, scope: !3015)
!3017 = !DILocation(line: 2804, column: 12, scope: !3015)
!3018 = !DILocation(line: 2805, column: 2, scope: !3015)
!3019 = !DILocation(line: 2808, column: 14, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !3011, file: !81, line: 2807, column: 2)
!3021 = !DILocation(line: 2808, column: 12, scope: !3020)
!3022 = !DILocation(line: 2811, column: 25, scope: !2973)
!3023 = !DILocation(line: 2811, column: 35, scope: !2973)
!3024 = !DILocation(line: 2811, column: 13, scope: !2973)
!3025 = !DILocation(line: 2811, column: 11, scope: !2973)
!3026 = !DILocation(line: 2812, column: 5, scope: !3027)
!3027 = distinct !DILexicalBlock(scope: !2973, file: !81, line: 2812, column: 5)
!3028 = !DILocation(line: 2812, column: 15, scope: !3027)
!3029 = !DILocation(line: 2812, column: 5, scope: !2973)
!3030 = !DILocation(line: 2814, column: 10, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3027, file: !81, line: 2813, column: 2)
!3032 = !DILocation(line: 2814, column: 3, scope: !3031)
!3033 = !DILocation(line: 2818, column: 11, scope: !3034)
!3034 = distinct !DILexicalBlock(scope: !3027, file: !81, line: 2817, column: 2)
!3035 = !DILocation(line: 2818, column: 10, scope: !3034)
!3036 = !DILocation(line: 2818, column: 3, scope: !3034)
!3037 = !DILocation(line: 2820, column: 1, scope: !2973)
!3038 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !81, file: !81, line: 2837, type: !3039, scopeLine: 2838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3039 = !DISubroutineType(types: !3040)
!3040 = !{!29, !29, !17}
!3041 = !DILocalVariable(name: "value", arg: 1, scope: !3038, file: !81, line: 2837, type: !29)
!3042 = !DILocation(line: 2837, column: 29, scope: !3038)
!3043 = !DILocalVariable(name: "factor", arg: 2, scope: !3038, file: !81, line: 2837, type: !17)
!3044 = !DILocation(line: 2837, column: 39, scope: !3038)
!3045 = !DILocalVariable(name: "u32Temp1", scope: !3038, file: !81, line: 2839, type: !29)
!3046 = !DILocation(line: 2839, column: 6, scope: !3038)
!3047 = !DILocalVariable(name: "u32Temp2", scope: !3038, file: !81, line: 2839, type: !29)
!3048 = !DILocation(line: 2839, column: 20, scope: !3038)
!3049 = !DILocation(line: 2840, column: 13, scope: !3038)
!3050 = !DILocation(line: 2840, column: 21, scope: !3038)
!3051 = !DILocation(line: 2840, column: 19, scope: !3038)
!3052 = !DILocation(line: 2840, column: 11, scope: !3038)
!3053 = !DILocation(line: 2841, column: 25, scope: !3038)
!3054 = !DILocation(line: 2841, column: 32, scope: !3038)
!3055 = !DILocation(line: 2841, column: 13, scope: !3038)
!3056 = !DILocation(line: 2841, column: 11, scope: !3038)
!3057 = !DILocation(line: 2842, column: 14, scope: !3038)
!3058 = !DILocation(line: 2842, column: 23, scope: !3038)
!3059 = !DILocation(line: 2842, column: 11, scope: !3038)
!3060 = !DILocation(line: 2843, column: 14, scope: !3038)
!3061 = !DILocation(line: 2843, column: 23, scope: !3038)
!3062 = !DILocation(line: 2843, column: 11, scope: !3038)
!3063 = !DILocation(line: 2844, column: 9, scope: !3038)
!3064 = !DILocation(line: 2844, column: 2, scope: !3038)
!3065 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !81, file: !81, line: 2863, type: !3039, scopeLine: 2864, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3066 = !DILocalVariable(name: "value", arg: 1, scope: !3065, file: !81, line: 2863, type: !29)
!3067 = !DILocation(line: 2863, column: 29, scope: !3065)
!3068 = !DILocalVariable(name: "factor", arg: 2, scope: !3065, file: !81, line: 2863, type: !17)
!3069 = !DILocation(line: 2863, column: 39, scope: !3065)
!3070 = !DILocalVariable(name: "u32Temp1", scope: !3065, file: !81, line: 2865, type: !29)
!3071 = !DILocation(line: 2865, column: 6, scope: !3065)
!3072 = !DILocalVariable(name: "u32Temp2", scope: !3065, file: !81, line: 2865, type: !29)
!3073 = !DILocation(line: 2865, column: 20, scope: !3065)
!3074 = !DILocation(line: 2866, column: 13, scope: !3065)
!3075 = !DILocation(line: 2866, column: 21, scope: !3065)
!3076 = !DILocation(line: 2866, column: 19, scope: !3065)
!3077 = !DILocation(line: 2866, column: 11, scope: !3065)
!3078 = !DILocation(line: 2867, column: 25, scope: !3065)
!3079 = !DILocation(line: 2867, column: 32, scope: !3065)
!3080 = !DILocation(line: 2867, column: 13, scope: !3065)
!3081 = !DILocation(line: 2867, column: 11, scope: !3065)
!3082 = !DILocation(line: 2868, column: 14, scope: !3065)
!3083 = !DILocation(line: 2868, column: 23, scope: !3065)
!3084 = !DILocation(line: 2868, column: 11, scope: !3065)
!3085 = !DILocation(line: 2869, column: 14, scope: !3065)
!3086 = !DILocation(line: 2869, column: 23, scope: !3065)
!3087 = !DILocation(line: 2869, column: 11, scope: !3065)
!3088 = !DILocation(line: 2870, column: 6, scope: !3089)
!3089 = distinct !DILexicalBlock(scope: !3065, file: !81, line: 2870, column: 5)
!3090 = !DILocation(line: 2870, column: 14, scope: !3089)
!3091 = !DILocation(line: 2870, column: 19, scope: !3089)
!3092 = !DILocation(line: 2870, column: 5, scope: !3065)
!3093 = !DILocation(line: 2872, column: 10, scope: !3094)
!3094 = distinct !DILexicalBlock(scope: !3089, file: !81, line: 2871, column: 2)
!3095 = !DILocation(line: 2872, column: 3, scope: !3094)
!3096 = !DILocation(line: 2876, column: 3, scope: !3097)
!3097 = distinct !DILexicalBlock(scope: !3089, file: !81, line: 2875, column: 2)
!3098 = !DILocation(line: 2879, column: 1, scope: !3065)
!3099 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !81, file: !81, line: 2898, type: !3100, scopeLine: 2899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3100 = !DISubroutineType(types: !3101)
!3101 = !{!29, !29, !6}
!3102 = !DILocalVariable(name: "value", arg: 1, scope: !3099, file: !81, line: 2898, type: !29)
!3103 = !DILocation(line: 2898, column: 29, scope: !3099)
!3104 = !DILocalVariable(name: "factor", arg: 2, scope: !3099, file: !81, line: 2898, type: !6)
!3105 = !DILocation(line: 2898, column: 39, scope: !3099)
!3106 = !DILocalVariable(name: "u32Temp1", scope: !3099, file: !81, line: 2900, type: !29)
!3107 = !DILocation(line: 2900, column: 6, scope: !3099)
!3108 = !DILocalVariable(name: "u32Temp2", scope: !3099, file: !81, line: 2900, type: !29)
!3109 = !DILocation(line: 2900, column: 20, scope: !3099)
!3110 = !DILocation(line: 2901, column: 5, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3099, file: !81, line: 2901, column: 5)
!3112 = !DILocation(line: 2901, column: 12, scope: !3111)
!3113 = !DILocation(line: 2901, column: 5, scope: !3099)
!3114 = !DILocation(line: 2904, column: 14, scope: !3115)
!3115 = distinct !DILexicalBlock(scope: !3111, file: !81, line: 2902, column: 2)
!3116 = !DILocation(line: 2904, column: 22, scope: !3115)
!3117 = !DILocation(line: 2904, column: 20, scope: !3115)
!3118 = !DILocation(line: 2904, column: 12, scope: !3115)
!3119 = !DILocation(line: 2905, column: 26, scope: !3115)
!3120 = !DILocation(line: 2905, column: 33, scope: !3115)
!3121 = !DILocation(line: 2905, column: 14, scope: !3115)
!3122 = !DILocation(line: 2905, column: 12, scope: !3115)
!3123 = !DILocation(line: 2906, column: 14, scope: !3115)
!3124 = !DILocation(line: 2906, column: 23, scope: !3115)
!3125 = !DILocation(line: 2906, column: 12, scope: !3115)
!3126 = !DILocation(line: 2907, column: 15, scope: !3115)
!3127 = !DILocation(line: 2907, column: 24, scope: !3115)
!3128 = !DILocation(line: 2907, column: 12, scope: !3115)
!3129 = !DILocation(line: 2908, column: 10, scope: !3115)
!3130 = !DILocation(line: 2908, column: 3, scope: !3115)
!3131 = !DILocation(line: 2912, column: 3, scope: !3132)
!3132 = distinct !DILexicalBlock(scope: !3111, file: !81, line: 2911, column: 2)
!3133 = !DILocation(line: 2914, column: 1, scope: !3099)
!3134 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !81, file: !81, line: 2933, type: !3100, scopeLine: 2934, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3135 = !DILocalVariable(name: "value", arg: 1, scope: !3134, file: !81, line: 2933, type: !29)
!3136 = !DILocation(line: 2933, column: 29, scope: !3134)
!3137 = !DILocalVariable(name: "factor", arg: 2, scope: !3134, file: !81, line: 2933, type: !6)
!3138 = !DILocation(line: 2933, column: 39, scope: !3134)
!3139 = !DILocalVariable(name: "u32Temp1", scope: !3134, file: !81, line: 2935, type: !29)
!3140 = !DILocation(line: 2935, column: 6, scope: !3134)
!3141 = !DILocalVariable(name: "u32Temp2", scope: !3134, file: !81, line: 2935, type: !29)
!3142 = !DILocation(line: 2935, column: 20, scope: !3134)
!3143 = !DILocation(line: 2936, column: 5, scope: !3144)
!3144 = distinct !DILexicalBlock(scope: !3134, file: !81, line: 2936, column: 5)
!3145 = !DILocation(line: 2936, column: 12, scope: !3144)
!3146 = !DILocation(line: 2936, column: 5, scope: !3134)
!3147 = !DILocation(line: 2938, column: 3, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3144, file: !81, line: 2937, column: 2)
!3149 = !DILocation(line: 2942, column: 14, scope: !3150)
!3150 = distinct !DILexicalBlock(scope: !3144, file: !81, line: 2941, column: 2)
!3151 = !DILocation(line: 2942, column: 22, scope: !3150)
!3152 = !DILocation(line: 2942, column: 20, scope: !3150)
!3153 = !DILocation(line: 2942, column: 12, scope: !3150)
!3154 = !DILocation(line: 2943, column: 26, scope: !3150)
!3155 = !DILocation(line: 2943, column: 33, scope: !3150)
!3156 = !DILocation(line: 2943, column: 14, scope: !3150)
!3157 = !DILocation(line: 2943, column: 12, scope: !3150)
!3158 = !DILocation(line: 2944, column: 14, scope: !3150)
!3159 = !DILocation(line: 2944, column: 23, scope: !3150)
!3160 = !DILocation(line: 2944, column: 12, scope: !3150)
!3161 = !DILocation(line: 2945, column: 15, scope: !3150)
!3162 = !DILocation(line: 2945, column: 24, scope: !3150)
!3163 = !DILocation(line: 2945, column: 12, scope: !3150)
!3164 = !DILocation(line: 2946, column: 7, scope: !3165)
!3165 = distinct !DILexicalBlock(scope: !3150, file: !81, line: 2946, column: 6)
!3166 = !DILocation(line: 2946, column: 16, scope: !3165)
!3167 = !DILocation(line: 2946, column: 22, scope: !3165)
!3168 = !DILocation(line: 2946, column: 6, scope: !3150)
!3169 = !DILocation(line: 2948, column: 11, scope: !3170)
!3170 = distinct !DILexicalBlock(scope: !3165, file: !81, line: 2947, column: 3)
!3171 = !DILocation(line: 2948, column: 4, scope: !3170)
!3172 = !DILocation(line: 2952, column: 4, scope: !3173)
!3173 = distinct !DILexicalBlock(scope: !3165, file: !81, line: 2951, column: 3)
!3174 = !DILocation(line: 2955, column: 1, scope: !3134)
!3175 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !81, file: !81, line: 2977, type: !310, scopeLine: 2978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3176 = !DILocalVariable(name: "value", arg: 1, scope: !3175, file: !81, line: 2977, type: !13)
!3177 = !DILocation(line: 2977, column: 33, scope: !3175)
!3178 = !DILocalVariable(name: "factor", arg: 2, scope: !3175, file: !81, line: 2977, type: !13)
!3179 = !DILocation(line: 2977, column: 44, scope: !3175)
!3180 = !DILocation(line: 2979, column: 40, scope: !3175)
!3181 = !DILocation(line: 2979, column: 46, scope: !3175)
!3182 = !DILocation(line: 2979, column: 9, scope: !3175)
!3183 = !DILocation(line: 2979, column: 2, scope: !3175)
!3184 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !81, file: !81, line: 3001, type: !310, scopeLine: 3002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3185 = !DILocalVariable(name: "value", arg: 1, scope: !3184, file: !81, line: 3001, type: !13)
!3186 = !DILocation(line: 3001, column: 33, scope: !3184)
!3187 = !DILocalVariable(name: "factor", arg: 2, scope: !3184, file: !81, line: 3001, type: !13)
!3188 = !DILocation(line: 3001, column: 44, scope: !3184)
!3189 = !DILocation(line: 3003, column: 41, scope: !3184)
!3190 = !DILocation(line: 3003, column: 47, scope: !3184)
!3191 = !DILocation(line: 3003, column: 10, scope: !3184)
!3192 = !DILocation(line: 3003, column: 3, scope: !3184)
!3193 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !81, file: !81, line: 3026, type: !310, scopeLine: 3027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3194 = !DILocalVariable(name: "value", arg: 1, scope: !3193, file: !81, line: 3026, type: !13)
!3195 = !DILocation(line: 3026, column: 32, scope: !3193)
!3196 = !DILocalVariable(name: "factor", arg: 2, scope: !3193, file: !81, line: 3026, type: !13)
!3197 = !DILocation(line: 3026, column: 43, scope: !3193)
!3198 = !DILocation(line: 3028, column: 41, scope: !3193)
!3199 = !DILocation(line: 3028, column: 47, scope: !3193)
!3200 = !DILocation(line: 3028, column: 10, scope: !3193)
!3201 = !DILocation(line: 3028, column: 3, scope: !3193)
!3202 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !81, file: !81, line: 3051, type: !310, scopeLine: 3052, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3203 = !DILocalVariable(name: "value", arg: 1, scope: !3202, file: !81, line: 3051, type: !13)
!3204 = !DILocation(line: 3051, column: 34, scope: !3202)
!3205 = !DILocalVariable(name: "factor", arg: 2, scope: !3202, file: !81, line: 3051, type: !13)
!3206 = !DILocation(line: 3051, column: 45, scope: !3202)
!3207 = !DILocation(line: 3053, column: 44, scope: !3202)
!3208 = !DILocation(line: 3053, column: 50, scope: !3202)
!3209 = !DILocation(line: 3053, column: 10, scope: !3202)
!3210 = !DILocation(line: 3053, column: 3, scope: !3202)
!3211 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !81, file: !81, line: 3076, type: !310, scopeLine: 3077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3212 = !DILocalVariable(name: "value", arg: 1, scope: !3211, file: !81, line: 3076, type: !13)
!3213 = !DILocation(line: 3076, column: 33, scope: !3211)
!3214 = !DILocalVariable(name: "factor", arg: 2, scope: !3211, file: !81, line: 3076, type: !13)
!3215 = !DILocation(line: 3076, column: 44, scope: !3211)
!3216 = !DILocation(line: 3078, column: 44, scope: !3211)
!3217 = !DILocation(line: 3078, column: 50, scope: !3211)
!3218 = !DILocation(line: 3078, column: 10, scope: !3211)
!3219 = !DILocation(line: 3078, column: 3, scope: !3211)
!3220 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !81, file: !81, line: 3101, type: !310, scopeLine: 3102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3221 = !DILocalVariable(name: "value", arg: 1, scope: !3220, file: !81, line: 3101, type: !13)
!3222 = !DILocation(line: 3101, column: 31, scope: !3220)
!3223 = !DILocalVariable(name: "factor", arg: 2, scope: !3220, file: !81, line: 3101, type: !13)
!3224 = !DILocation(line: 3101, column: 42, scope: !3220)
!3225 = !DILocation(line: 3103, column: 44, scope: !3220)
!3226 = !DILocation(line: 3103, column: 50, scope: !3220)
!3227 = !DILocation(line: 3103, column: 10, scope: !3220)
!3228 = !DILocation(line: 3103, column: 3, scope: !3220)
!3229 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !81, file: !81, line: 3126, type: !310, scopeLine: 3127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3230 = !DILocalVariable(name: "value", arg: 1, scope: !3229, file: !81, line: 3126, type: !13)
!3231 = !DILocation(line: 3126, column: 33, scope: !3229)
!3232 = !DILocalVariable(name: "factor", arg: 2, scope: !3229, file: !81, line: 3126, type: !13)
!3233 = !DILocation(line: 3126, column: 44, scope: !3229)
!3234 = !DILocation(line: 3128, column: 44, scope: !3229)
!3235 = !DILocation(line: 3128, column: 50, scope: !3229)
!3236 = !DILocation(line: 3128, column: 10, scope: !3229)
!3237 = !DILocation(line: 3128, column: 3, scope: !3229)
!3238 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !81, file: !81, line: 3151, type: !310, scopeLine: 3152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3239 = !DILocalVariable(name: "value", arg: 1, scope: !3238, file: !81, line: 3151, type: !13)
!3240 = !DILocation(line: 3151, column: 32, scope: !3238)
!3241 = !DILocalVariable(name: "factor", arg: 2, scope: !3238, file: !81, line: 3151, type: !13)
!3242 = !DILocation(line: 3151, column: 43, scope: !3238)
!3243 = !DILocation(line: 3153, column: 44, scope: !3238)
!3244 = !DILocation(line: 3153, column: 50, scope: !3238)
!3245 = !DILocation(line: 3153, column: 10, scope: !3238)
!3246 = !DILocation(line: 3153, column: 3, scope: !3238)
!3247 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !81, file: !81, line: 3175, type: !310, scopeLine: 3176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3248 = !DILocalVariable(name: "value", arg: 1, scope: !3247, file: !81, line: 3175, type: !13)
!3249 = !DILocation(line: 3175, column: 31, scope: !3247)
!3250 = !DILocalVariable(name: "factor", arg: 2, scope: !3247, file: !81, line: 3175, type: !13)
!3251 = !DILocation(line: 3175, column: 42, scope: !3247)
!3252 = !DILocation(line: 3177, column: 44, scope: !3247)
!3253 = !DILocation(line: 3177, column: 50, scope: !3247)
!3254 = !DILocation(line: 3177, column: 10, scope: !3247)
!3255 = !DILocation(line: 3177, column: 3, scope: !3247)
!3256 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !81, file: !81, line: 3199, type: !310, scopeLine: 3200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3257 = !DILocalVariable(name: "value", arg: 1, scope: !3256, file: !81, line: 3199, type: !13)
!3258 = !DILocation(line: 3199, column: 30, scope: !3256)
!3259 = !DILocalVariable(name: "factor", arg: 2, scope: !3256, file: !81, line: 3199, type: !13)
!3260 = !DILocation(line: 3199, column: 41, scope: !3256)
!3261 = !DILocation(line: 3201, column: 44, scope: !3256)
!3262 = !DILocation(line: 3201, column: 50, scope: !3256)
!3263 = !DILocation(line: 3201, column: 10, scope: !3256)
!3264 = !DILocation(line: 3201, column: 3, scope: !3256)
!3265 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !81, file: !81, line: 3223, type: !310, scopeLine: 3224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3266 = !DILocalVariable(name: "value", arg: 1, scope: !3265, file: !81, line: 3223, type: !13)
!3267 = !DILocation(line: 3223, column: 33, scope: !3265)
!3268 = !DILocalVariable(name: "factor", arg: 2, scope: !3265, file: !81, line: 3223, type: !13)
!3269 = !DILocation(line: 3223, column: 44, scope: !3265)
!3270 = !DILocation(line: 3225, column: 44, scope: !3265)
!3271 = !DILocation(line: 3225, column: 50, scope: !3265)
!3272 = !DILocation(line: 3225, column: 10, scope: !3265)
!3273 = !DILocation(line: 3225, column: 3, scope: !3265)
!3274 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !81, file: !81, line: 3247, type: !310, scopeLine: 3248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3275 = !DILocalVariable(name: "value", arg: 1, scope: !3274, file: !81, line: 3247, type: !13)
!3276 = !DILocation(line: 3247, column: 32, scope: !3274)
!3277 = !DILocalVariable(name: "factor", arg: 2, scope: !3274, file: !81, line: 3247, type: !13)
!3278 = !DILocation(line: 3247, column: 43, scope: !3274)
!3279 = !DILocation(line: 3249, column: 44, scope: !3274)
!3280 = !DILocation(line: 3249, column: 50, scope: !3274)
!3281 = !DILocation(line: 3249, column: 10, scope: !3274)
!3282 = !DILocation(line: 3249, column: 3, scope: !3274)
!3283 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !81, file: !81, line: 3271, type: !310, scopeLine: 3272, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3284 = !DILocalVariable(name: "value", arg: 1, scope: !3283, file: !81, line: 3271, type: !13)
!3285 = !DILocation(line: 3271, column: 31, scope: !3283)
!3286 = !DILocalVariable(name: "factor", arg: 2, scope: !3283, file: !81, line: 3271, type: !13)
!3287 = !DILocation(line: 3271, column: 42, scope: !3283)
!3288 = !DILocation(line: 3273, column: 44, scope: !3283)
!3289 = !DILocation(line: 3273, column: 50, scope: !3283)
!3290 = !DILocation(line: 3273, column: 10, scope: !3283)
!3291 = !DILocation(line: 3273, column: 3, scope: !3283)
!3292 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !81, file: !81, line: 3295, type: !310, scopeLine: 3296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3293 = !DILocalVariable(name: "value", arg: 1, scope: !3292, file: !81, line: 3295, type: !13)
!3294 = !DILocation(line: 3295, column: 30, scope: !3292)
!3295 = !DILocalVariable(name: "factor", arg: 2, scope: !3292, file: !81, line: 3295, type: !13)
!3296 = !DILocation(line: 3295, column: 41, scope: !3292)
!3297 = !DILocation(line: 3297, column: 44, scope: !3292)
!3298 = !DILocation(line: 3297, column: 50, scope: !3292)
!3299 = !DILocation(line: 3297, column: 10, scope: !3292)
!3300 = !DILocation(line: 3297, column: 3, scope: !3292)
!3301 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !81, file: !81, line: 3318, type: !399, scopeLine: 3319, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3302 = !DILocalVariable(name: "value", arg: 1, scope: !3301, file: !81, line: 3318, type: !13)
!3303 = !DILocation(line: 3318, column: 33, scope: !3301)
!3304 = !DILocalVariable(name: "factor", arg: 2, scope: !3301, file: !81, line: 3318, type: !22)
!3305 = !DILocation(line: 3318, column: 44, scope: !3301)
!3306 = !DILocation(line: 3320, column: 41, scope: !3301)
!3307 = !DILocation(line: 3320, column: 47, scope: !3301)
!3308 = !DILocation(line: 3320, column: 10, scope: !3301)
!3309 = !DILocation(line: 3320, column: 3, scope: !3301)
!3310 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !81, file: !81, line: 3341, type: !399, scopeLine: 3342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3311 = !DILocalVariable(name: "value", arg: 1, scope: !3310, file: !81, line: 3341, type: !13)
!3312 = !DILocation(line: 3341, column: 32, scope: !3310)
!3313 = !DILocalVariable(name: "factor", arg: 2, scope: !3310, file: !81, line: 3341, type: !22)
!3314 = !DILocation(line: 3341, column: 43, scope: !3310)
!3315 = !DILocation(line: 3343, column: 33, scope: !3310)
!3316 = !DILocation(line: 3343, column: 39, scope: !3310)
!3317 = !DILocation(line: 3343, column: 2, scope: !3310)
!3318 = !DILocation(line: 3344, column: 1, scope: !3310)
!3319 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !81, file: !81, line: 3365, type: !399, scopeLine: 3366, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3320 = !DILocalVariable(name: "value", arg: 1, scope: !3319, file: !81, line: 3365, type: !13)
!3321 = !DILocation(line: 3365, column: 31, scope: !3319)
!3322 = !DILocalVariable(name: "factor", arg: 2, scope: !3319, file: !81, line: 3365, type: !22)
!3323 = !DILocation(line: 3365, column: 42, scope: !3319)
!3324 = !DILocation(line: 3367, column: 41, scope: !3319)
!3325 = !DILocation(line: 3367, column: 47, scope: !3319)
!3326 = !DILocation(line: 3367, column: 10, scope: !3319)
!3327 = !DILocation(line: 3367, column: 3, scope: !3319)
!3328 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !81, file: !81, line: 3390, type: !399, scopeLine: 3391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3329 = !DILocalVariable(name: "value", arg: 1, scope: !3328, file: !81, line: 3390, type: !13)
!3330 = !DILocation(line: 3390, column: 33, scope: !3328)
!3331 = !DILocalVariable(name: "factor", arg: 2, scope: !3328, file: !81, line: 3390, type: !22)
!3332 = !DILocation(line: 3390, column: 44, scope: !3328)
!3333 = !DILocation(line: 3392, column: 44, scope: !3328)
!3334 = !DILocation(line: 3392, column: 50, scope: !3328)
!3335 = !DILocation(line: 3392, column: 10, scope: !3328)
!3336 = !DILocation(line: 3392, column: 3, scope: !3328)
!3337 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !81, file: !81, line: 3415, type: !399, scopeLine: 3416, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3338 = !DILocalVariable(name: "value", arg: 1, scope: !3337, file: !81, line: 3415, type: !13)
!3339 = !DILocation(line: 3415, column: 32, scope: !3337)
!3340 = !DILocalVariable(name: "factor", arg: 2, scope: !3337, file: !81, line: 3415, type: !22)
!3341 = !DILocation(line: 3415, column: 43, scope: !3337)
!3342 = !DILocation(line: 3417, column: 44, scope: !3337)
!3343 = !DILocation(line: 3417, column: 50, scope: !3337)
!3344 = !DILocation(line: 3417, column: 10, scope: !3337)
!3345 = !DILocation(line: 3417, column: 3, scope: !3337)
!3346 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !81, file: !81, line: 3440, type: !399, scopeLine: 3441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3347 = !DILocalVariable(name: "value", arg: 1, scope: !3346, file: !81, line: 3440, type: !13)
!3348 = !DILocation(line: 3440, column: 31, scope: !3346)
!3349 = !DILocalVariable(name: "factor", arg: 2, scope: !3346, file: !81, line: 3440, type: !22)
!3350 = !DILocation(line: 3440, column: 42, scope: !3346)
!3351 = !DILocation(line: 3442, column: 44, scope: !3346)
!3352 = !DILocation(line: 3442, column: 50, scope: !3346)
!3353 = !DILocation(line: 3442, column: 10, scope: !3346)
!3354 = !DILocation(line: 3442, column: 3, scope: !3346)
!3355 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !81, file: !81, line: 3465, type: !399, scopeLine: 3466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3356 = !DILocalVariable(name: "value", arg: 1, scope: !3355, file: !81, line: 3465, type: !13)
!3357 = !DILocation(line: 3465, column: 33, scope: !3355)
!3358 = !DILocalVariable(name: "factor", arg: 2, scope: !3355, file: !81, line: 3465, type: !22)
!3359 = !DILocation(line: 3465, column: 44, scope: !3355)
!3360 = !DILocation(line: 3467, column: 44, scope: !3355)
!3361 = !DILocation(line: 3467, column: 50, scope: !3355)
!3362 = !DILocation(line: 3467, column: 10, scope: !3355)
!3363 = !DILocation(line: 3467, column: 3, scope: !3355)
!3364 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !81, file: !81, line: 3490, type: !399, scopeLine: 3491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3365 = !DILocalVariable(name: "value", arg: 1, scope: !3364, file: !81, line: 3490, type: !13)
!3366 = !DILocation(line: 3490, column: 32, scope: !3364)
!3367 = !DILocalVariable(name: "factor", arg: 2, scope: !3364, file: !81, line: 3490, type: !22)
!3368 = !DILocation(line: 3490, column: 43, scope: !3364)
!3369 = !DILocation(line: 3492, column: 44, scope: !3364)
!3370 = !DILocation(line: 3492, column: 50, scope: !3364)
!3371 = !DILocation(line: 3492, column: 10, scope: !3364)
!3372 = !DILocation(line: 3492, column: 3, scope: !3364)
!3373 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !81, file: !81, line: 3514, type: !399, scopeLine: 3515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3374 = !DILocalVariable(name: "value", arg: 1, scope: !3373, file: !81, line: 3514, type: !13)
!3375 = !DILocation(line: 3514, column: 31, scope: !3373)
!3376 = !DILocalVariable(name: "factor", arg: 2, scope: !3373, file: !81, line: 3514, type: !22)
!3377 = !DILocation(line: 3514, column: 42, scope: !3373)
!3378 = !DILocation(line: 3516, column: 44, scope: !3373)
!3379 = !DILocation(line: 3516, column: 50, scope: !3373)
!3380 = !DILocation(line: 3516, column: 10, scope: !3373)
!3381 = !DILocation(line: 3516, column: 3, scope: !3373)
!3382 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !81, file: !81, line: 3538, type: !399, scopeLine: 3539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3383 = !DILocalVariable(name: "value", arg: 1, scope: !3382, file: !81, line: 3538, type: !13)
!3384 = !DILocation(line: 3538, column: 30, scope: !3382)
!3385 = !DILocalVariable(name: "factor", arg: 2, scope: !3382, file: !81, line: 3538, type: !22)
!3386 = !DILocation(line: 3538, column: 41, scope: !3382)
!3387 = !DILocation(line: 3540, column: 44, scope: !3382)
!3388 = !DILocation(line: 3540, column: 50, scope: !3382)
!3389 = !DILocation(line: 3540, column: 10, scope: !3382)
!3390 = !DILocation(line: 3540, column: 3, scope: !3382)
!3391 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !81, file: !81, line: 3562, type: !399, scopeLine: 3563, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3392 = !DILocalVariable(name: "value", arg: 1, scope: !3391, file: !81, line: 3562, type: !13)
!3393 = !DILocation(line: 3562, column: 33, scope: !3391)
!3394 = !DILocalVariable(name: "factor", arg: 2, scope: !3391, file: !81, line: 3562, type: !22)
!3395 = !DILocation(line: 3562, column: 44, scope: !3391)
!3396 = !DILocation(line: 3564, column: 44, scope: !3391)
!3397 = !DILocation(line: 3564, column: 50, scope: !3391)
!3398 = !DILocation(line: 3564, column: 10, scope: !3391)
!3399 = !DILocation(line: 3564, column: 3, scope: !3391)
!3400 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !81, file: !81, line: 3586, type: !399, scopeLine: 3587, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3401 = !DILocalVariable(name: "value", arg: 1, scope: !3400, file: !81, line: 3586, type: !13)
!3402 = !DILocation(line: 3586, column: 32, scope: !3400)
!3403 = !DILocalVariable(name: "factor", arg: 2, scope: !3400, file: !81, line: 3586, type: !22)
!3404 = !DILocation(line: 3586, column: 43, scope: !3400)
!3405 = !DILocation(line: 3588, column: 44, scope: !3400)
!3406 = !DILocation(line: 3588, column: 50, scope: !3400)
!3407 = !DILocation(line: 3588, column: 10, scope: !3400)
!3408 = !DILocation(line: 3588, column: 3, scope: !3400)
!3409 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !81, file: !81, line: 3610, type: !399, scopeLine: 3611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3410 = !DILocalVariable(name: "value", arg: 1, scope: !3409, file: !81, line: 3610, type: !13)
!3411 = !DILocation(line: 3610, column: 31, scope: !3409)
!3412 = !DILocalVariable(name: "factor", arg: 2, scope: !3409, file: !81, line: 3610, type: !22)
!3413 = !DILocation(line: 3610, column: 42, scope: !3409)
!3414 = !DILocation(line: 3612, column: 44, scope: !3409)
!3415 = !DILocation(line: 3612, column: 50, scope: !3409)
!3416 = !DILocation(line: 3612, column: 10, scope: !3409)
!3417 = !DILocation(line: 3612, column: 3, scope: !3409)
!3418 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !81, file: !81, line: 3634, type: !399, scopeLine: 3635, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3419 = !DILocalVariable(name: "value", arg: 1, scope: !3418, file: !81, line: 3634, type: !13)
!3420 = !DILocation(line: 3634, column: 30, scope: !3418)
!3421 = !DILocalVariable(name: "factor", arg: 2, scope: !3418, file: !81, line: 3634, type: !22)
!3422 = !DILocation(line: 3634, column: 41, scope: !3418)
!3423 = !DILocation(line: 3636, column: 44, scope: !3418)
!3424 = !DILocation(line: 3636, column: 50, scope: !3418)
!3425 = !DILocation(line: 3636, column: 10, scope: !3418)
!3426 = !DILocation(line: 3636, column: 3, scope: !3418)
!3427 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !81, file: !81, line: 3656, type: !484, scopeLine: 3657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3428 = !DILocalVariable(name: "value", arg: 1, scope: !3427, file: !81, line: 3656, type: !13)
!3429 = !DILocation(line: 3656, column: 32, scope: !3427)
!3430 = !DILocalVariable(name: "factor", arg: 2, scope: !3427, file: !81, line: 3656, type: !17)
!3431 = !DILocation(line: 3656, column: 42, scope: !3427)
!3432 = !DILocation(line: 3658, column: 40, scope: !3427)
!3433 = !DILocation(line: 3658, column: 58, scope: !3427)
!3434 = !DILocation(line: 3658, column: 52, scope: !3427)
!3435 = !DILocation(line: 3658, column: 66, scope: !3427)
!3436 = !DILocation(line: 3658, column: 46, scope: !3427)
!3437 = !DILocation(line: 3658, column: 10, scope: !3427)
!3438 = !DILocation(line: 3658, column: 3, scope: !3427)
!3439 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !81, file: !81, line: 3678, type: !484, scopeLine: 3679, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3440 = !DILocalVariable(name: "value", arg: 1, scope: !3439, file: !81, line: 3678, type: !13)
!3441 = !DILocation(line: 3678, column: 31, scope: !3439)
!3442 = !DILocalVariable(name: "factor", arg: 2, scope: !3439, file: !81, line: 3678, type: !17)
!3443 = !DILocation(line: 3678, column: 41, scope: !3439)
!3444 = !DILocation(line: 3680, column: 40, scope: !3439)
!3445 = !DILocation(line: 3680, column: 58, scope: !3439)
!3446 = !DILocation(line: 3680, column: 52, scope: !3439)
!3447 = !DILocation(line: 3680, column: 66, scope: !3439)
!3448 = !DILocation(line: 3680, column: 46, scope: !3439)
!3449 = !DILocation(line: 3680, column: 10, scope: !3439)
!3450 = !DILocation(line: 3680, column: 3, scope: !3439)
!3451 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !81, file: !81, line: 3701, type: !484, scopeLine: 3702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3452 = !DILocalVariable(name: "value", arg: 1, scope: !3451, file: !81, line: 3701, type: !13)
!3453 = !DILocation(line: 3701, column: 30, scope: !3451)
!3454 = !DILocalVariable(name: "factor", arg: 2, scope: !3451, file: !81, line: 3701, type: !17)
!3455 = !DILocation(line: 3701, column: 40, scope: !3451)
!3456 = !DILocation(line: 3703, column: 40, scope: !3451)
!3457 = !DILocation(line: 3703, column: 58, scope: !3451)
!3458 = !DILocation(line: 3703, column: 52, scope: !3451)
!3459 = !DILocation(line: 3703, column: 66, scope: !3451)
!3460 = !DILocation(line: 3703, column: 46, scope: !3451)
!3461 = !DILocation(line: 3703, column: 10, scope: !3451)
!3462 = !DILocation(line: 3703, column: 3, scope: !3451)
!3463 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !81, file: !81, line: 3724, type: !484, scopeLine: 3725, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3464 = !DILocalVariable(name: "value", arg: 1, scope: !3463, file: !81, line: 3724, type: !13)
!3465 = !DILocation(line: 3724, column: 31, scope: !3463)
!3466 = !DILocalVariable(name: "factor", arg: 2, scope: !3463, file: !81, line: 3724, type: !17)
!3467 = !DILocation(line: 3724, column: 41, scope: !3463)
!3468 = !DILocation(line: 3726, column: 43, scope: !3463)
!3469 = !DILocation(line: 3726, column: 61, scope: !3463)
!3470 = !DILocation(line: 3726, column: 55, scope: !3463)
!3471 = !DILocation(line: 3726, column: 69, scope: !3463)
!3472 = !DILocation(line: 3726, column: 49, scope: !3463)
!3473 = !DILocation(line: 3726, column: 10, scope: !3463)
!3474 = !DILocation(line: 3726, column: 3, scope: !3463)
!3475 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !81, file: !81, line: 3747, type: !484, scopeLine: 3748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3476 = !DILocalVariable(name: "value", arg: 1, scope: !3475, file: !81, line: 3747, type: !13)
!3477 = !DILocation(line: 3747, column: 30, scope: !3475)
!3478 = !DILocalVariable(name: "factor", arg: 2, scope: !3475, file: !81, line: 3747, type: !17)
!3479 = !DILocation(line: 3747, column: 40, scope: !3475)
!3480 = !DILocation(line: 3749, column: 43, scope: !3475)
!3481 = !DILocation(line: 3749, column: 61, scope: !3475)
!3482 = !DILocation(line: 3749, column: 55, scope: !3475)
!3483 = !DILocation(line: 3749, column: 69, scope: !3475)
!3484 = !DILocation(line: 3749, column: 49, scope: !3475)
!3485 = !DILocation(line: 3749, column: 10, scope: !3475)
!3486 = !DILocation(line: 3749, column: 3, scope: !3475)
!3487 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !81, file: !81, line: 3769, type: !484, scopeLine: 3770, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3488 = !DILocalVariable(name: "value", arg: 1, scope: !3487, file: !81, line: 3769, type: !13)
!3489 = !DILocation(line: 3769, column: 30, scope: !3487)
!3490 = !DILocalVariable(name: "factor", arg: 2, scope: !3487, file: !81, line: 3769, type: !17)
!3491 = !DILocation(line: 3769, column: 40, scope: !3487)
!3492 = !DILocation(line: 3771, column: 43, scope: !3487)
!3493 = !DILocation(line: 3771, column: 61, scope: !3487)
!3494 = !DILocation(line: 3771, column: 55, scope: !3487)
!3495 = !DILocation(line: 3771, column: 69, scope: !3487)
!3496 = !DILocation(line: 3771, column: 49, scope: !3487)
!3497 = !DILocation(line: 3771, column: 10, scope: !3487)
!3498 = !DILocation(line: 3771, column: 3, scope: !3487)
!3499 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !81, file: !81, line: 3791, type: !484, scopeLine: 3792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3500 = !DILocalVariable(name: "value", arg: 1, scope: !3499, file: !81, line: 3791, type: !13)
!3501 = !DILocation(line: 3791, column: 29, scope: !3499)
!3502 = !DILocalVariable(name: "factor", arg: 2, scope: !3499, file: !81, line: 3791, type: !17)
!3503 = !DILocation(line: 3791, column: 39, scope: !3499)
!3504 = !DILocation(line: 3793, column: 43, scope: !3499)
!3505 = !DILocation(line: 3793, column: 61, scope: !3499)
!3506 = !DILocation(line: 3793, column: 55, scope: !3499)
!3507 = !DILocation(line: 3793, column: 69, scope: !3499)
!3508 = !DILocation(line: 3793, column: 49, scope: !3499)
!3509 = !DILocation(line: 3793, column: 10, scope: !3499)
!3510 = !DILocation(line: 3793, column: 3, scope: !3499)
!3511 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !81, file: !81, line: 3813, type: !484, scopeLine: 3814, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3512 = !DILocalVariable(name: "value", arg: 1, scope: !3511, file: !81, line: 3813, type: !13)
!3513 = !DILocation(line: 3813, column: 30, scope: !3511)
!3514 = !DILocalVariable(name: "factor", arg: 2, scope: !3511, file: !81, line: 3813, type: !17)
!3515 = !DILocation(line: 3813, column: 40, scope: !3511)
!3516 = !DILocation(line: 3815, column: 43, scope: !3511)
!3517 = !DILocation(line: 3815, column: 61, scope: !3511)
!3518 = !DILocation(line: 3815, column: 55, scope: !3511)
!3519 = !DILocation(line: 3815, column: 69, scope: !3511)
!3520 = !DILocation(line: 3815, column: 49, scope: !3511)
!3521 = !DILocation(line: 3815, column: 10, scope: !3511)
!3522 = !DILocation(line: 3815, column: 3, scope: !3511)
!3523 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !81, file: !81, line: 3835, type: !484, scopeLine: 3836, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3524 = !DILocalVariable(name: "value", arg: 1, scope: !3523, file: !81, line: 3835, type: !13)
!3525 = !DILocation(line: 3835, column: 29, scope: !3523)
!3526 = !DILocalVariable(name: "factor", arg: 2, scope: !3523, file: !81, line: 3835, type: !17)
!3527 = !DILocation(line: 3835, column: 39, scope: !3523)
!3528 = !DILocation(line: 3837, column: 43, scope: !3523)
!3529 = !DILocation(line: 3837, column: 61, scope: !3523)
!3530 = !DILocation(line: 3837, column: 55, scope: !3523)
!3531 = !DILocation(line: 3837, column: 69, scope: !3523)
!3532 = !DILocation(line: 3837, column: 49, scope: !3523)
!3533 = !DILocation(line: 3837, column: 10, scope: !3523)
!3534 = !DILocation(line: 3837, column: 3, scope: !3523)
!3535 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !81, file: !81, line: 3859, type: !1875, scopeLine: 3860, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3536 = !DILocalVariable(name: "value", arg: 1, scope: !3535, file: !81, line: 3859, type: !89)
!3537 = !DILocation(line: 3859, column: 31, scope: !3535)
!3538 = !DILocalVariable(name: "factor", arg: 2, scope: !3535, file: !81, line: 3859, type: !13)
!3539 = !DILocation(line: 3859, column: 42, scope: !3535)
!3540 = !DILocation(line: 3861, column: 41, scope: !3535)
!3541 = !DILocation(line: 3861, column: 47, scope: !3535)
!3542 = !DILocation(line: 3861, column: 10, scope: !3535)
!3543 = !DILocation(line: 3861, column: 3, scope: !3535)
!3544 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !81, file: !81, line: 5055, type: !3545, scopeLine: 5056, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3545 = !DISubroutineType(types: !3546)
!3546 = !{!89, !89, !13, !29}
!3547 = !DILocalVariable(name: "value", arg: 1, scope: !3544, file: !81, line: 5055, type: !89)
!3548 = !DILocation(line: 5055, column: 40, scope: !3544)
!3549 = !DILocalVariable(name: "factor", arg: 2, scope: !3544, file: !81, line: 5055, type: !13)
!3550 = !DILocation(line: 5055, column: 51, scope: !3544)
!3551 = !DILocalVariable(name: "count", arg: 3, scope: !3544, file: !81, line: 5055, type: !29)
!3552 = !DILocation(line: 5055, column: 63, scope: !3544)
!3553 = !DILocalVariable(name: "u32Temp1", scope: !3544, file: !81, line: 5057, type: !29)
!3554 = !DILocation(line: 5057, column: 6, scope: !3544)
!3555 = !DILocalVariable(name: "u32Temp2", scope: !3544, file: !81, line: 5057, type: !29)
!3556 = !DILocation(line: 5057, column: 17, scope: !3544)
!3557 = !DILocalVariable(name: "u32Temp3", scope: !3544, file: !81, line: 5057, type: !29)
!3558 = !DILocation(line: 5057, column: 26, scope: !3544)
!3559 = !DILocalVariable(name: "u32Temp4", scope: !3544, file: !81, line: 5057, type: !29)
!3560 = !DILocation(line: 5057, column: 35, scope: !3544)
!3561 = !DILocalVariable(name: "u8SignBit", scope: !3544, file: !81, line: 5058, type: !17)
!3562 = !DILocation(line: 5058, column: 5, scope: !3544)
!3563 = !DILocation(line: 5060, column: 7, scope: !3564)
!3564 = distinct !DILexicalBlock(scope: !3544, file: !81, line: 5060, column: 5)
!3565 = !DILocation(line: 5060, column: 12, scope: !3564)
!3566 = !DILocation(line: 5060, column: 16, scope: !3564)
!3567 = !DILocation(line: 5060, column: 20, scope: !3564)
!3568 = !DILocation(line: 5060, column: 26, scope: !3564)
!3569 = !DILocation(line: 5060, column: 31, scope: !3564)
!3570 = !DILocation(line: 5060, column: 36, scope: !3564)
!3571 = !DILocation(line: 5060, column: 41, scope: !3564)
!3572 = !DILocation(line: 5060, column: 45, scope: !3564)
!3573 = !DILocation(line: 5060, column: 49, scope: !3564)
!3574 = !DILocation(line: 5060, column: 55, scope: !3564)
!3575 = !DILocation(line: 5060, column: 5, scope: !3544)
!3576 = !DILocation(line: 5062, column: 13, scope: !3577)
!3577 = distinct !DILexicalBlock(scope: !3564, file: !81, line: 5061, column: 2)
!3578 = !DILocation(line: 5063, column: 2, scope: !3577)
!3579 = !DILocation(line: 5066, column: 13, scope: !3580)
!3580 = distinct !DILexicalBlock(scope: !3564, file: !81, line: 5065, column: 2)
!3581 = !DILocation(line: 5069, column: 5, scope: !3582)
!3582 = distinct !DILexicalBlock(scope: !3544, file: !81, line: 5069, column: 5)
!3583 = !DILocation(line: 5069, column: 10, scope: !3582)
!3584 = !DILocation(line: 5069, column: 5, scope: !3544)
!3585 = !DILocation(line: 5071, column: 15, scope: !3586)
!3586 = distinct !DILexicalBlock(scope: !3582, file: !81, line: 5070, column: 2)
!3587 = !DILocation(line: 5071, column: 14, scope: !3586)
!3588 = !DILocation(line: 5071, column: 12, scope: !3586)
!3589 = !DILocation(line: 5072, column: 2, scope: !3586)
!3590 = !DILocation(line: 5075, column: 14, scope: !3591)
!3591 = distinct !DILexicalBlock(scope: !3582, file: !81, line: 5074, column: 2)
!3592 = !DILocation(line: 5075, column: 12, scope: !3591)
!3593 = !DILocation(line: 5078, column: 5, scope: !3594)
!3594 = distinct !DILexicalBlock(scope: !3544, file: !81, line: 5078, column: 5)
!3595 = !DILocation(line: 5078, column: 11, scope: !3594)
!3596 = !DILocation(line: 5078, column: 5, scope: !3544)
!3597 = !DILocation(line: 5080, column: 15, scope: !3598)
!3598 = distinct !DILexicalBlock(scope: !3594, file: !81, line: 5079, column: 2)
!3599 = !DILocation(line: 5080, column: 14, scope: !3598)
!3600 = !DILocation(line: 5080, column: 12, scope: !3598)
!3601 = !DILocation(line: 5081, column: 2, scope: !3598)
!3602 = !DILocation(line: 5084, column: 14, scope: !3603)
!3603 = distinct !DILexicalBlock(scope: !3594, file: !81, line: 5083, column: 2)
!3604 = !DILocation(line: 5084, column: 12, scope: !3603)
!3605 = !DILocation(line: 5087, column: 13, scope: !3544)
!3606 = !DILocation(line: 5087, column: 24, scope: !3544)
!3607 = !DILocation(line: 5087, column: 22, scope: !3544)
!3608 = !DILocation(line: 5087, column: 11, scope: !3544)
!3609 = !DILocation(line: 5088, column: 25, scope: !3544)
!3610 = !DILocation(line: 5088, column: 35, scope: !3544)
!3611 = !DILocation(line: 5088, column: 13, scope: !3544)
!3612 = !DILocation(line: 5088, column: 11, scope: !3544)
!3613 = !DILocation(line: 5089, column: 13, scope: !3544)
!3614 = !DILocation(line: 5089, column: 25, scope: !3544)
!3615 = !DILocation(line: 5089, column: 22, scope: !3544)
!3616 = !DILocation(line: 5089, column: 11, scope: !3544)
!3617 = !DILocation(line: 5090, column: 14, scope: !3544)
!3618 = !DILocation(line: 5090, column: 30, scope: !3544)
!3619 = !DILocation(line: 5090, column: 29, scope: !3544)
!3620 = !DILocation(line: 5090, column: 23, scope: !3544)
!3621 = !DILocation(line: 5090, column: 11, scope: !3544)
!3622 = !DILocation(line: 5091, column: 6, scope: !3623)
!3623 = distinct !DILexicalBlock(scope: !3544, file: !81, line: 5091, column: 5)
!3624 = !DILocation(line: 5091, column: 16, scope: !3623)
!3625 = !DILocation(line: 5091, column: 14, scope: !3623)
!3626 = !DILocation(line: 5091, column: 22, scope: !3623)
!3627 = !DILocation(line: 5091, column: 5, scope: !3544)
!3628 = !DILocation(line: 5093, column: 6, scope: !3629)
!3629 = distinct !DILexicalBlock(scope: !3630, file: !81, line: 5093, column: 6)
!3630 = distinct !DILexicalBlock(scope: !3623, file: !81, line: 5092, column: 2)
!3631 = !DILocation(line: 5093, column: 16, scope: !3629)
!3632 = !DILocation(line: 5093, column: 6, scope: !3630)
!3633 = !DILocation(line: 5095, column: 7, scope: !3634)
!3634 = distinct !DILexicalBlock(scope: !3635, file: !81, line: 5095, column: 7)
!3635 = distinct !DILexicalBlock(scope: !3629, file: !81, line: 5094, column: 3)
!3636 = !DILocation(line: 5095, column: 15, scope: !3634)
!3637 = !DILocation(line: 5095, column: 7, scope: !3635)
!3638 = !DILocation(line: 5096, column: 12, scope: !3634)
!3639 = !DILocation(line: 5096, column: 5, scope: !3634)
!3640 = !DILocation(line: 5098, column: 5, scope: !3634)
!3641 = !DILocation(line: 5102, column: 7, scope: !3642)
!3642 = distinct !DILexicalBlock(scope: !3643, file: !81, line: 5102, column: 7)
!3643 = distinct !DILexicalBlock(scope: !3629, file: !81, line: 5101, column: 3)
!3644 = !DILocation(line: 5102, column: 15, scope: !3642)
!3645 = !DILocation(line: 5102, column: 7, scope: !3643)
!3646 = !DILocation(line: 5103, column: 13, scope: !3642)
!3647 = !DILocation(line: 5103, column: 12, scope: !3642)
!3648 = !DILocation(line: 5103, column: 5, scope: !3642)
!3649 = !DILocation(line: 5105, column: 5, scope: !3642)
!3650 = !DILocation(line: 5110, column: 3, scope: !3651)
!3651 = distinct !DILexicalBlock(scope: !3623, file: !81, line: 5109, column: 2)
!3652 = !DILocation(line: 5112, column: 1, scope: !3544)
!3653 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !81, file: !81, line: 3883, type: !2644, scopeLine: 3884, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3654 = !DILocalVariable(name: "value", arg: 1, scope: !3653, file: !81, line: 3883, type: !89)
!3655 = !DILocation(line: 3883, column: 30, scope: !3653)
!3656 = !DILocalVariable(name: "factor", arg: 2, scope: !3653, file: !81, line: 3883, type: !6)
!3657 = !DILocation(line: 3883, column: 40, scope: !3653)
!3658 = !DILocation(line: 3885, column: 40, scope: !3653)
!3659 = !DILocation(line: 3885, column: 46, scope: !3653)
!3660 = !DILocation(line: 3885, column: 10, scope: !3653)
!3661 = !DILocation(line: 3885, column: 3, scope: !3653)
!3662 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !81, file: !81, line: 5207, type: !3663, scopeLine: 5208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3663 = !DISubroutineType(types: !3664)
!3664 = !{!89, !89, !6, !29}
!3665 = !DILocalVariable(name: "value", arg: 1, scope: !3662, file: !81, line: 5207, type: !89)
!3666 = !DILocation(line: 5207, column: 39, scope: !3662)
!3667 = !DILocalVariable(name: "factor", arg: 2, scope: !3662, file: !81, line: 5207, type: !6)
!3668 = !DILocation(line: 5207, column: 49, scope: !3662)
!3669 = !DILocalVariable(name: "count", arg: 3, scope: !3662, file: !81, line: 5207, type: !29)
!3670 = !DILocation(line: 5207, column: 61, scope: !3662)
!3671 = !DILocalVariable(name: "u32Temp1", scope: !3662, file: !81, line: 5209, type: !29)
!3672 = !DILocation(line: 5209, column: 6, scope: !3662)
!3673 = !DILocalVariable(name: "u32Temp2", scope: !3662, file: !81, line: 5209, type: !29)
!3674 = !DILocation(line: 5209, column: 17, scope: !3662)
!3675 = !DILocalVariable(name: "u32Temp3", scope: !3662, file: !81, line: 5209, type: !29)
!3676 = !DILocation(line: 5209, column: 26, scope: !3662)
!3677 = !DILocalVariable(name: "u32Temp4", scope: !3662, file: !81, line: 5209, type: !29)
!3678 = !DILocation(line: 5209, column: 35, scope: !3662)
!3679 = !DILocalVariable(name: "u8SignBit", scope: !3662, file: !81, line: 5210, type: !17)
!3680 = !DILocation(line: 5210, column: 5, scope: !3662)
!3681 = !DILocation(line: 5212, column: 7, scope: !3682)
!3682 = distinct !DILexicalBlock(scope: !3662, file: !81, line: 5212, column: 5)
!3683 = !DILocation(line: 5212, column: 12, scope: !3682)
!3684 = !DILocation(line: 5212, column: 16, scope: !3682)
!3685 = !DILocation(line: 5212, column: 20, scope: !3682)
!3686 = !DILocation(line: 5212, column: 26, scope: !3682)
!3687 = !DILocation(line: 5212, column: 31, scope: !3682)
!3688 = !DILocation(line: 5212, column: 36, scope: !3682)
!3689 = !DILocation(line: 5212, column: 41, scope: !3682)
!3690 = !DILocation(line: 5212, column: 45, scope: !3682)
!3691 = !DILocation(line: 5212, column: 49, scope: !3682)
!3692 = !DILocation(line: 5212, column: 55, scope: !3682)
!3693 = !DILocation(line: 5212, column: 5, scope: !3662)
!3694 = !DILocation(line: 5214, column: 13, scope: !3695)
!3695 = distinct !DILexicalBlock(scope: !3682, file: !81, line: 5213, column: 2)
!3696 = !DILocation(line: 5215, column: 2, scope: !3695)
!3697 = !DILocation(line: 5218, column: 13, scope: !3698)
!3698 = distinct !DILexicalBlock(scope: !3682, file: !81, line: 5217, column: 2)
!3699 = !DILocation(line: 5221, column: 5, scope: !3700)
!3700 = distinct !DILexicalBlock(scope: !3662, file: !81, line: 5221, column: 5)
!3701 = !DILocation(line: 5221, column: 10, scope: !3700)
!3702 = !DILocation(line: 5221, column: 5, scope: !3662)
!3703 = !DILocation(line: 5223, column: 15, scope: !3704)
!3704 = distinct !DILexicalBlock(scope: !3700, file: !81, line: 5222, column: 2)
!3705 = !DILocation(line: 5223, column: 14, scope: !3704)
!3706 = !DILocation(line: 5223, column: 12, scope: !3704)
!3707 = !DILocation(line: 5224, column: 2, scope: !3704)
!3708 = !DILocation(line: 5227, column: 14, scope: !3709)
!3709 = distinct !DILexicalBlock(scope: !3700, file: !81, line: 5226, column: 2)
!3710 = !DILocation(line: 5227, column: 12, scope: !3709)
!3711 = !DILocation(line: 5230, column: 5, scope: !3712)
!3712 = distinct !DILexicalBlock(scope: !3662, file: !81, line: 5230, column: 5)
!3713 = !DILocation(line: 5230, column: 11, scope: !3712)
!3714 = !DILocation(line: 5230, column: 5, scope: !3662)
!3715 = !DILocation(line: 5232, column: 15, scope: !3716)
!3716 = distinct !DILexicalBlock(scope: !3712, file: !81, line: 5231, column: 2)
!3717 = !DILocation(line: 5232, column: 14, scope: !3716)
!3718 = !DILocation(line: 5232, column: 12, scope: !3716)
!3719 = !DILocation(line: 5233, column: 2, scope: !3716)
!3720 = !DILocation(line: 5236, column: 14, scope: !3721)
!3721 = distinct !DILexicalBlock(scope: !3712, file: !81, line: 5235, column: 2)
!3722 = !DILocation(line: 5236, column: 12, scope: !3721)
!3723 = !DILocation(line: 5239, column: 13, scope: !3662)
!3724 = !DILocation(line: 5239, column: 24, scope: !3662)
!3725 = !DILocation(line: 5239, column: 22, scope: !3662)
!3726 = !DILocation(line: 5239, column: 11, scope: !3662)
!3727 = !DILocation(line: 5240, column: 25, scope: !3662)
!3728 = !DILocation(line: 5240, column: 35, scope: !3662)
!3729 = !DILocation(line: 5240, column: 13, scope: !3662)
!3730 = !DILocation(line: 5240, column: 11, scope: !3662)
!3731 = !DILocation(line: 5241, column: 13, scope: !3662)
!3732 = !DILocation(line: 5241, column: 25, scope: !3662)
!3733 = !DILocation(line: 5241, column: 22, scope: !3662)
!3734 = !DILocation(line: 5241, column: 11, scope: !3662)
!3735 = !DILocation(line: 5242, column: 14, scope: !3662)
!3736 = !DILocation(line: 5242, column: 30, scope: !3662)
!3737 = !DILocation(line: 5242, column: 29, scope: !3662)
!3738 = !DILocation(line: 5242, column: 23, scope: !3662)
!3739 = !DILocation(line: 5242, column: 11, scope: !3662)
!3740 = !DILocation(line: 5243, column: 6, scope: !3741)
!3741 = distinct !DILexicalBlock(scope: !3662, file: !81, line: 5243, column: 5)
!3742 = !DILocation(line: 5243, column: 16, scope: !3741)
!3743 = !DILocation(line: 5243, column: 14, scope: !3741)
!3744 = !DILocation(line: 5243, column: 22, scope: !3741)
!3745 = !DILocation(line: 5243, column: 5, scope: !3662)
!3746 = !DILocation(line: 5245, column: 6, scope: !3747)
!3747 = distinct !DILexicalBlock(scope: !3748, file: !81, line: 5245, column: 6)
!3748 = distinct !DILexicalBlock(scope: !3741, file: !81, line: 5244, column: 2)
!3749 = !DILocation(line: 5245, column: 16, scope: !3747)
!3750 = !DILocation(line: 5245, column: 6, scope: !3748)
!3751 = !DILocation(line: 5247, column: 7, scope: !3752)
!3752 = distinct !DILexicalBlock(scope: !3753, file: !81, line: 5247, column: 7)
!3753 = distinct !DILexicalBlock(scope: !3747, file: !81, line: 5246, column: 3)
!3754 = !DILocation(line: 5247, column: 15, scope: !3752)
!3755 = !DILocation(line: 5247, column: 7, scope: !3753)
!3756 = !DILocation(line: 5248, column: 12, scope: !3752)
!3757 = !DILocation(line: 5248, column: 5, scope: !3752)
!3758 = !DILocation(line: 5250, column: 5, scope: !3752)
!3759 = !DILocation(line: 5254, column: 7, scope: !3760)
!3760 = distinct !DILexicalBlock(scope: !3761, file: !81, line: 5254, column: 7)
!3761 = distinct !DILexicalBlock(scope: !3747, file: !81, line: 5253, column: 3)
!3762 = !DILocation(line: 5254, column: 15, scope: !3760)
!3763 = !DILocation(line: 5254, column: 7, scope: !3761)
!3764 = !DILocation(line: 5255, column: 13, scope: !3760)
!3765 = !DILocation(line: 5255, column: 12, scope: !3760)
!3766 = !DILocation(line: 5255, column: 5, scope: !3760)
!3767 = !DILocation(line: 5257, column: 5, scope: !3760)
!3768 = !DILocation(line: 5262, column: 3, scope: !3769)
!3769 = distinct !DILexicalBlock(scope: !3741, file: !81, line: 5261, column: 2)
!3770 = !DILocation(line: 5264, column: 1, scope: !3662)
!3771 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !81, file: !81, line: 3907, type: !780, scopeLine: 3908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3772 = !DILocalVariable(name: "value", arg: 1, scope: !3771, file: !81, line: 3907, type: !89)
!3773 = !DILocation(line: 3907, column: 31, scope: !3771)
!3774 = !DILocalVariable(name: "factor", arg: 2, scope: !3771, file: !81, line: 3907, type: !22)
!3775 = !DILocation(line: 3907, column: 42, scope: !3771)
!3776 = !DILocation(line: 3909, column: 41, scope: !3771)
!3777 = !DILocation(line: 3909, column: 47, scope: !3771)
!3778 = !DILocation(line: 3909, column: 10, scope: !3771)
!3779 = !DILocation(line: 3909, column: 3, scope: !3771)
!3780 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !81, file: !81, line: 5131, type: !3781, scopeLine: 5132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3781 = !DISubroutineType(types: !3782)
!3782 = !{!89, !89, !22, !29}
!3783 = !DILocalVariable(name: "value", arg: 1, scope: !3780, file: !81, line: 5131, type: !89)
!3784 = !DILocation(line: 5131, column: 40, scope: !3780)
!3785 = !DILocalVariable(name: "factor", arg: 2, scope: !3780, file: !81, line: 5131, type: !22)
!3786 = !DILocation(line: 5131, column: 50, scope: !3780)
!3787 = !DILocalVariable(name: "count", arg: 3, scope: !3780, file: !81, line: 5131, type: !29)
!3788 = !DILocation(line: 5131, column: 62, scope: !3780)
!3789 = !DILocalVariable(name: "u32Temp1", scope: !3780, file: !81, line: 5133, type: !29)
!3790 = !DILocation(line: 5133, column: 6, scope: !3780)
!3791 = !DILocalVariable(name: "u32Temp2", scope: !3780, file: !81, line: 5133, type: !29)
!3792 = !DILocation(line: 5133, column: 17, scope: !3780)
!3793 = !DILocalVariable(name: "u32Temp3", scope: !3780, file: !81, line: 5133, type: !29)
!3794 = !DILocation(line: 5133, column: 26, scope: !3780)
!3795 = !DILocalVariable(name: "u32Temp4", scope: !3780, file: !81, line: 5133, type: !29)
!3796 = !DILocation(line: 5133, column: 35, scope: !3780)
!3797 = !DILocalVariable(name: "u8SignBit", scope: !3780, file: !81, line: 5134, type: !17)
!3798 = !DILocation(line: 5134, column: 5, scope: !3780)
!3799 = !DILocation(line: 5136, column: 7, scope: !3800)
!3800 = distinct !DILexicalBlock(scope: !3780, file: !81, line: 5136, column: 5)
!3801 = !DILocation(line: 5136, column: 12, scope: !3800)
!3802 = !DILocation(line: 5136, column: 16, scope: !3800)
!3803 = !DILocation(line: 5136, column: 20, scope: !3800)
!3804 = !DILocation(line: 5136, column: 26, scope: !3800)
!3805 = !DILocation(line: 5136, column: 31, scope: !3800)
!3806 = !DILocation(line: 5136, column: 36, scope: !3800)
!3807 = !DILocation(line: 5136, column: 41, scope: !3800)
!3808 = !DILocation(line: 5136, column: 45, scope: !3800)
!3809 = !DILocation(line: 5136, column: 49, scope: !3800)
!3810 = !DILocation(line: 5136, column: 55, scope: !3800)
!3811 = !DILocation(line: 5136, column: 5, scope: !3780)
!3812 = !DILocation(line: 5138, column: 13, scope: !3813)
!3813 = distinct !DILexicalBlock(scope: !3800, file: !81, line: 5137, column: 2)
!3814 = !DILocation(line: 5139, column: 2, scope: !3813)
!3815 = !DILocation(line: 5142, column: 13, scope: !3816)
!3816 = distinct !DILexicalBlock(scope: !3800, file: !81, line: 5141, column: 2)
!3817 = !DILocation(line: 5145, column: 5, scope: !3818)
!3818 = distinct !DILexicalBlock(scope: !3780, file: !81, line: 5145, column: 5)
!3819 = !DILocation(line: 5145, column: 10, scope: !3818)
!3820 = !DILocation(line: 5145, column: 5, scope: !3780)
!3821 = !DILocation(line: 5147, column: 15, scope: !3822)
!3822 = distinct !DILexicalBlock(scope: !3818, file: !81, line: 5146, column: 2)
!3823 = !DILocation(line: 5147, column: 14, scope: !3822)
!3824 = !DILocation(line: 5147, column: 12, scope: !3822)
!3825 = !DILocation(line: 5148, column: 2, scope: !3822)
!3826 = !DILocation(line: 5151, column: 14, scope: !3827)
!3827 = distinct !DILexicalBlock(scope: !3818, file: !81, line: 5150, column: 2)
!3828 = !DILocation(line: 5151, column: 12, scope: !3827)
!3829 = !DILocation(line: 5154, column: 5, scope: !3830)
!3830 = distinct !DILexicalBlock(scope: !3780, file: !81, line: 5154, column: 5)
!3831 = !DILocation(line: 5154, column: 11, scope: !3830)
!3832 = !DILocation(line: 5154, column: 5, scope: !3780)
!3833 = !DILocation(line: 5156, column: 15, scope: !3834)
!3834 = distinct !DILexicalBlock(scope: !3830, file: !81, line: 5155, column: 2)
!3835 = !DILocation(line: 5156, column: 14, scope: !3834)
!3836 = !DILocation(line: 5156, column: 12, scope: !3834)
!3837 = !DILocation(line: 5157, column: 2, scope: !3834)
!3838 = !DILocation(line: 5160, column: 14, scope: !3839)
!3839 = distinct !DILexicalBlock(scope: !3830, file: !81, line: 5159, column: 2)
!3840 = !DILocation(line: 5160, column: 12, scope: !3839)
!3841 = !DILocation(line: 5163, column: 13, scope: !3780)
!3842 = !DILocation(line: 5163, column: 24, scope: !3780)
!3843 = !DILocation(line: 5163, column: 22, scope: !3780)
!3844 = !DILocation(line: 5163, column: 11, scope: !3780)
!3845 = !DILocation(line: 5164, column: 25, scope: !3780)
!3846 = !DILocation(line: 5164, column: 35, scope: !3780)
!3847 = !DILocation(line: 5164, column: 13, scope: !3780)
!3848 = !DILocation(line: 5164, column: 11, scope: !3780)
!3849 = !DILocation(line: 5165, column: 13, scope: !3780)
!3850 = !DILocation(line: 5165, column: 25, scope: !3780)
!3851 = !DILocation(line: 5165, column: 22, scope: !3780)
!3852 = !DILocation(line: 5165, column: 11, scope: !3780)
!3853 = !DILocation(line: 5166, column: 14, scope: !3780)
!3854 = !DILocation(line: 5166, column: 30, scope: !3780)
!3855 = !DILocation(line: 5166, column: 29, scope: !3780)
!3856 = !DILocation(line: 5166, column: 23, scope: !3780)
!3857 = !DILocation(line: 5166, column: 11, scope: !3780)
!3858 = !DILocation(line: 5167, column: 6, scope: !3859)
!3859 = distinct !DILexicalBlock(scope: !3780, file: !81, line: 5167, column: 5)
!3860 = !DILocation(line: 5167, column: 16, scope: !3859)
!3861 = !DILocation(line: 5167, column: 14, scope: !3859)
!3862 = !DILocation(line: 5167, column: 22, scope: !3859)
!3863 = !DILocation(line: 5167, column: 5, scope: !3780)
!3864 = !DILocation(line: 5169, column: 6, scope: !3865)
!3865 = distinct !DILexicalBlock(scope: !3866, file: !81, line: 5169, column: 6)
!3866 = distinct !DILexicalBlock(scope: !3859, file: !81, line: 5168, column: 2)
!3867 = !DILocation(line: 5169, column: 16, scope: !3865)
!3868 = !DILocation(line: 5169, column: 6, scope: !3866)
!3869 = !DILocation(line: 5171, column: 7, scope: !3870)
!3870 = distinct !DILexicalBlock(scope: !3871, file: !81, line: 5171, column: 7)
!3871 = distinct !DILexicalBlock(scope: !3865, file: !81, line: 5170, column: 3)
!3872 = !DILocation(line: 5171, column: 15, scope: !3870)
!3873 = !DILocation(line: 5171, column: 7, scope: !3871)
!3874 = !DILocation(line: 5172, column: 12, scope: !3870)
!3875 = !DILocation(line: 5172, column: 5, scope: !3870)
!3876 = !DILocation(line: 5174, column: 5, scope: !3870)
!3877 = !DILocation(line: 5178, column: 7, scope: !3878)
!3878 = distinct !DILexicalBlock(scope: !3879, file: !81, line: 5178, column: 7)
!3879 = distinct !DILexicalBlock(scope: !3865, file: !81, line: 5177, column: 3)
!3880 = !DILocation(line: 5178, column: 15, scope: !3878)
!3881 = !DILocation(line: 5178, column: 7, scope: !3879)
!3882 = !DILocation(line: 5179, column: 13, scope: !3878)
!3883 = !DILocation(line: 5179, column: 12, scope: !3878)
!3884 = !DILocation(line: 5179, column: 5, scope: !3878)
!3885 = !DILocation(line: 5181, column: 5, scope: !3878)
!3886 = !DILocation(line: 5186, column: 3, scope: !3887)
!3887 = distinct !DILexicalBlock(scope: !3859, file: !81, line: 5185, column: 2)
!3888 = !DILocation(line: 5188, column: 1, scope: !3780)
!3889 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !81, file: !81, line: 3931, type: !2349, scopeLine: 3932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3890 = !DILocalVariable(name: "value", arg: 1, scope: !3889, file: !81, line: 3931, type: !89)
!3891 = !DILocation(line: 3931, column: 30, scope: !3889)
!3892 = !DILocalVariable(name: "factor", arg: 2, scope: !3889, file: !81, line: 3931, type: !17)
!3893 = !DILocation(line: 3931, column: 40, scope: !3889)
!3894 = !DILocation(line: 3933, column: 40, scope: !3889)
!3895 = !DILocation(line: 3933, column: 46, scope: !3889)
!3896 = !DILocation(line: 3933, column: 10, scope: !3889)
!3897 = !DILocation(line: 3933, column: 3, scope: !3889)
!3898 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !81, file: !81, line: 5540, type: !3899, scopeLine: 5541, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3899 = !DISubroutineType(types: !3900)
!3900 = !{!89, !89, !17, !29}
!3901 = !DILocalVariable(name: "value", arg: 1, scope: !3898, file: !81, line: 5540, type: !89)
!3902 = !DILocation(line: 5540, column: 39, scope: !3898)
!3903 = !DILocalVariable(name: "factor", arg: 2, scope: !3898, file: !81, line: 5540, type: !17)
!3904 = !DILocation(line: 5540, column: 49, scope: !3898)
!3905 = !DILocalVariable(name: "count", arg: 3, scope: !3898, file: !81, line: 5540, type: !29)
!3906 = !DILocation(line: 5540, column: 61, scope: !3898)
!3907 = !DILocalVariable(name: "u32Temp1", scope: !3898, file: !81, line: 5542, type: !29)
!3908 = !DILocation(line: 5542, column: 6, scope: !3898)
!3909 = !DILocalVariable(name: "u32Temp2", scope: !3898, file: !81, line: 5542, type: !29)
!3910 = !DILocation(line: 5542, column: 17, scope: !3898)
!3911 = !DILocalVariable(name: "u32Temp3", scope: !3898, file: !81, line: 5542, type: !29)
!3912 = !DILocation(line: 5542, column: 26, scope: !3898)
!3913 = !DILocalVariable(name: "u8SignBit", scope: !3898, file: !81, line: 5543, type: !17)
!3914 = !DILocation(line: 5543, column: 5, scope: !3898)
!3915 = !DILocation(line: 5545, column: 5, scope: !3916)
!3916 = distinct !DILexicalBlock(scope: !3898, file: !81, line: 5545, column: 5)
!3917 = !DILocation(line: 5545, column: 10, scope: !3916)
!3918 = !DILocation(line: 5545, column: 5, scope: !3898)
!3919 = !DILocation(line: 5547, column: 13, scope: !3920)
!3920 = distinct !DILexicalBlock(scope: !3916, file: !81, line: 5546, column: 2)
!3921 = !DILocation(line: 5548, column: 15, scope: !3920)
!3922 = !DILocation(line: 5548, column: 14, scope: !3920)
!3923 = !DILocation(line: 5548, column: 12, scope: !3920)
!3924 = !DILocation(line: 5549, column: 2, scope: !3920)
!3925 = !DILocation(line: 5552, column: 13, scope: !3926)
!3926 = distinct !DILexicalBlock(scope: !3916, file: !81, line: 5551, column: 2)
!3927 = !DILocation(line: 5553, column: 14, scope: !3926)
!3928 = !DILocation(line: 5553, column: 12, scope: !3926)
!3929 = !DILocation(line: 5556, column: 13, scope: !3898)
!3930 = !DILocation(line: 5556, column: 24, scope: !3898)
!3931 = !DILocation(line: 5556, column: 22, scope: !3898)
!3932 = !DILocation(line: 5556, column: 11, scope: !3898)
!3933 = !DILocation(line: 5557, column: 25, scope: !3898)
!3934 = !DILocation(line: 5557, column: 34, scope: !3898)
!3935 = !DILocation(line: 5557, column: 13, scope: !3898)
!3936 = !DILocation(line: 5557, column: 11, scope: !3898)
!3937 = !DILocation(line: 5558, column: 13, scope: !3898)
!3938 = !DILocation(line: 5558, column: 25, scope: !3898)
!3939 = !DILocation(line: 5558, column: 22, scope: !3898)
!3940 = !DILocation(line: 5558, column: 11, scope: !3898)
!3941 = !DILocation(line: 5559, column: 14, scope: !3898)
!3942 = !DILocation(line: 5559, column: 30, scope: !3898)
!3943 = !DILocation(line: 5559, column: 29, scope: !3898)
!3944 = !DILocation(line: 5559, column: 23, scope: !3898)
!3945 = !DILocation(line: 5559, column: 11, scope: !3898)
!3946 = !DILocation(line: 5560, column: 6, scope: !3947)
!3947 = distinct !DILexicalBlock(scope: !3898, file: !81, line: 5560, column: 5)
!3948 = !DILocation(line: 5560, column: 16, scope: !3947)
!3949 = !DILocation(line: 5560, column: 14, scope: !3947)
!3950 = !DILocation(line: 5560, column: 22, scope: !3947)
!3951 = !DILocation(line: 5560, column: 5, scope: !3898)
!3952 = !DILocation(line: 5562, column: 6, scope: !3953)
!3953 = distinct !DILexicalBlock(scope: !3954, file: !81, line: 5562, column: 6)
!3954 = distinct !DILexicalBlock(scope: !3947, file: !81, line: 5561, column: 2)
!3955 = !DILocation(line: 5562, column: 16, scope: !3953)
!3956 = !DILocation(line: 5562, column: 6, scope: !3954)
!3957 = !DILocation(line: 5564, column: 7, scope: !3958)
!3958 = distinct !DILexicalBlock(scope: !3959, file: !81, line: 5564, column: 7)
!3959 = distinct !DILexicalBlock(scope: !3953, file: !81, line: 5563, column: 3)
!3960 = !DILocation(line: 5564, column: 15, scope: !3958)
!3961 = !DILocation(line: 5564, column: 7, scope: !3959)
!3962 = !DILocation(line: 5565, column: 12, scope: !3958)
!3963 = !DILocation(line: 5565, column: 5, scope: !3958)
!3964 = !DILocation(line: 5567, column: 5, scope: !3958)
!3965 = !DILocation(line: 5571, column: 7, scope: !3966)
!3966 = distinct !DILexicalBlock(scope: !3967, file: !81, line: 5571, column: 7)
!3967 = distinct !DILexicalBlock(scope: !3953, file: !81, line: 5570, column: 3)
!3968 = !DILocation(line: 5571, column: 15, scope: !3966)
!3969 = !DILocation(line: 5571, column: 7, scope: !3967)
!3970 = !DILocation(line: 5573, column: 13, scope: !3971)
!3971 = distinct !DILexicalBlock(scope: !3966, file: !81, line: 5572, column: 4)
!3972 = !DILocation(line: 5573, column: 12, scope: !3971)
!3973 = !DILocation(line: 5573, column: 5, scope: !3971)
!3974 = !DILocation(line: 5577, column: 5, scope: !3975)
!3975 = distinct !DILexicalBlock(scope: !3966, file: !81, line: 5576, column: 4)
!3976 = !DILocation(line: 5583, column: 6, scope: !3977)
!3977 = distinct !DILexicalBlock(scope: !3978, file: !81, line: 5583, column: 6)
!3978 = distinct !DILexicalBlock(scope: !3947, file: !81, line: 5582, column: 2)
!3979 = !DILocation(line: 5583, column: 16, scope: !3977)
!3980 = !DILocation(line: 5583, column: 6, scope: !3978)
!3981 = !DILocation(line: 5585, column: 4, scope: !3982)
!3982 = distinct !DILexicalBlock(scope: !3977, file: !81, line: 5584, column: 3)
!3983 = !DILocation(line: 5589, column: 4, scope: !3984)
!3984 = distinct !DILexicalBlock(scope: !3977, file: !81, line: 5588, column: 3)
!3985 = !DILocation(line: 5592, column: 1, scope: !3898)
!3986 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !81, file: !81, line: 3955, type: !168, scopeLine: 3956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3987 = !DILocalVariable(name: "value", arg: 1, scope: !3986, file: !81, line: 3955, type: !6)
!3988 = !DILocation(line: 3955, column: 28, scope: !3986)
!3989 = !DILocalVariable(name: "factor", arg: 2, scope: !3986, file: !81, line: 3955, type: !17)
!3990 = !DILocation(line: 3955, column: 38, scope: !3986)
!3991 = !DILocation(line: 3957, column: 38, scope: !3986)
!3992 = !DILocation(line: 3957, column: 56, scope: !3986)
!3993 = !DILocation(line: 3957, column: 50, scope: !3986)
!3994 = !DILocation(line: 3957, column: 64, scope: !3986)
!3995 = !DILocation(line: 3957, column: 44, scope: !3986)
!3996 = !DILocation(line: 3957, column: 10, scope: !3986)
!3997 = !DILocation(line: 3957, column: 3, scope: !3986)
!3998 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !81, file: !81, line: 3979, type: !168, scopeLine: 3980, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3999 = !DILocalVariable(name: "value", arg: 1, scope: !3998, file: !81, line: 3979, type: !6)
!4000 = !DILocation(line: 3979, column: 27, scope: !3998)
!4001 = !DILocalVariable(name: "factor", arg: 2, scope: !3998, file: !81, line: 3979, type: !17)
!4002 = !DILocation(line: 3979, column: 37, scope: !3998)
!4003 = !DILocation(line: 3981, column: 38, scope: !3998)
!4004 = !DILocation(line: 3981, column: 56, scope: !3998)
!4005 = !DILocation(line: 3981, column: 50, scope: !3998)
!4006 = !DILocation(line: 3981, column: 64, scope: !3998)
!4007 = !DILocation(line: 3981, column: 44, scope: !3998)
!4008 = !DILocation(line: 3981, column: 10, scope: !3998)
!4009 = !DILocation(line: 3981, column: 3, scope: !3998)
!4010 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !81, file: !81, line: 4004, type: !168, scopeLine: 4005, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4011 = !DILocalVariable(name: "value", arg: 1, scope: !4010, file: !81, line: 4004, type: !6)
!4012 = !DILocation(line: 4004, column: 26, scope: !4010)
!4013 = !DILocalVariable(name: "factor", arg: 2, scope: !4010, file: !81, line: 4004, type: !17)
!4014 = !DILocation(line: 4004, column: 36, scope: !4010)
!4015 = !DILocation(line: 4006, column: 38, scope: !4010)
!4016 = !DILocation(line: 4006, column: 56, scope: !4010)
!4017 = !DILocation(line: 4006, column: 50, scope: !4010)
!4018 = !DILocation(line: 4006, column: 64, scope: !4010)
!4019 = !DILocation(line: 4006, column: 44, scope: !4010)
!4020 = !DILocation(line: 4006, column: 10, scope: !4010)
!4021 = !DILocation(line: 4006, column: 3, scope: !4010)
!4022 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !81, file: !81, line: 4029, type: !168, scopeLine: 4030, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4023 = !DILocalVariable(name: "value", arg: 1, scope: !4022, file: !81, line: 4029, type: !6)
!4024 = !DILocation(line: 4029, column: 27, scope: !4022)
!4025 = !DILocalVariable(name: "factor", arg: 2, scope: !4022, file: !81, line: 4029, type: !17)
!4026 = !DILocation(line: 4029, column: 37, scope: !4022)
!4027 = !DILocation(line: 4031, column: 41, scope: !4022)
!4028 = !DILocation(line: 4031, column: 59, scope: !4022)
!4029 = !DILocation(line: 4031, column: 53, scope: !4022)
!4030 = !DILocation(line: 4031, column: 67, scope: !4022)
!4031 = !DILocation(line: 4031, column: 47, scope: !4022)
!4032 = !DILocation(line: 4031, column: 10, scope: !4022)
!4033 = !DILocation(line: 4031, column: 3, scope: !4022)
!4034 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !81, file: !81, line: 4054, type: !168, scopeLine: 4055, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4035 = !DILocalVariable(name: "value", arg: 1, scope: !4034, file: !81, line: 4054, type: !6)
!4036 = !DILocation(line: 4054, column: 26, scope: !4034)
!4037 = !DILocalVariable(name: "factor", arg: 2, scope: !4034, file: !81, line: 4054, type: !17)
!4038 = !DILocation(line: 4054, column: 36, scope: !4034)
!4039 = !DILocation(line: 4056, column: 41, scope: !4034)
!4040 = !DILocation(line: 4056, column: 59, scope: !4034)
!4041 = !DILocation(line: 4056, column: 53, scope: !4034)
!4042 = !DILocation(line: 4056, column: 67, scope: !4034)
!4043 = !DILocation(line: 4056, column: 47, scope: !4034)
!4044 = !DILocation(line: 4056, column: 10, scope: !4034)
!4045 = !DILocation(line: 4056, column: 3, scope: !4034)
!4046 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !81, file: !81, line: 4078, type: !168, scopeLine: 4079, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4047 = !DILocalVariable(name: "value", arg: 1, scope: !4046, file: !81, line: 4078, type: !6)
!4048 = !DILocation(line: 4078, column: 26, scope: !4046)
!4049 = !DILocalVariable(name: "factor", arg: 2, scope: !4046, file: !81, line: 4078, type: !17)
!4050 = !DILocation(line: 4078, column: 36, scope: !4046)
!4051 = !DILocation(line: 4080, column: 41, scope: !4046)
!4052 = !DILocation(line: 4080, column: 59, scope: !4046)
!4053 = !DILocation(line: 4080, column: 53, scope: !4046)
!4054 = !DILocation(line: 4080, column: 67, scope: !4046)
!4055 = !DILocation(line: 4080, column: 47, scope: !4046)
!4056 = !DILocation(line: 4080, column: 10, scope: !4046)
!4057 = !DILocation(line: 4080, column: 3, scope: !4046)
!4058 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !81, file: !81, line: 4102, type: !168, scopeLine: 4103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4059 = !DILocalVariable(name: "value", arg: 1, scope: !4058, file: !81, line: 4102, type: !6)
!4060 = !DILocation(line: 4102, column: 25, scope: !4058)
!4061 = !DILocalVariable(name: "factor", arg: 2, scope: !4058, file: !81, line: 4102, type: !17)
!4062 = !DILocation(line: 4102, column: 35, scope: !4058)
!4063 = !DILocation(line: 4104, column: 41, scope: !4058)
!4064 = !DILocation(line: 4104, column: 59, scope: !4058)
!4065 = !DILocation(line: 4104, column: 53, scope: !4058)
!4066 = !DILocation(line: 4104, column: 67, scope: !4058)
!4067 = !DILocation(line: 4104, column: 47, scope: !4058)
!4068 = !DILocation(line: 4104, column: 10, scope: !4058)
!4069 = !DILocation(line: 4104, column: 3, scope: !4058)
!4070 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !81, file: !81, line: 4126, type: !168, scopeLine: 4127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4071 = !DILocalVariable(name: "value", arg: 1, scope: !4070, file: !81, line: 4126, type: !6)
!4072 = !DILocation(line: 4126, column: 26, scope: !4070)
!4073 = !DILocalVariable(name: "factor", arg: 2, scope: !4070, file: !81, line: 4126, type: !17)
!4074 = !DILocation(line: 4126, column: 36, scope: !4070)
!4075 = !DILocation(line: 4128, column: 41, scope: !4070)
!4076 = !DILocation(line: 4128, column: 59, scope: !4070)
!4077 = !DILocation(line: 4128, column: 53, scope: !4070)
!4078 = !DILocation(line: 4128, column: 67, scope: !4070)
!4079 = !DILocation(line: 4128, column: 47, scope: !4070)
!4080 = !DILocation(line: 4128, column: 10, scope: !4070)
!4081 = !DILocation(line: 4128, column: 3, scope: !4070)
!4082 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !81, file: !81, line: 4150, type: !168, scopeLine: 4151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4083 = !DILocalVariable(name: "value", arg: 1, scope: !4082, file: !81, line: 4150, type: !6)
!4084 = !DILocation(line: 4150, column: 25, scope: !4082)
!4085 = !DILocalVariable(name: "factor", arg: 2, scope: !4082, file: !81, line: 4150, type: !17)
!4086 = !DILocation(line: 4150, column: 35, scope: !4082)
!4087 = !DILocation(line: 4152, column: 41, scope: !4082)
!4088 = !DILocation(line: 4152, column: 59, scope: !4082)
!4089 = !DILocation(line: 4152, column: 53, scope: !4082)
!4090 = !DILocation(line: 4152, column: 67, scope: !4082)
!4091 = !DILocation(line: 4152, column: 47, scope: !4082)
!4092 = !DILocation(line: 4152, column: 10, scope: !4082)
!4093 = !DILocation(line: 4152, column: 3, scope: !4082)
!4094 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !81, file: !81, line: 4173, type: !934, scopeLine: 4174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4095 = !DILocalVariable(name: "value", arg: 1, scope: !4094, file: !81, line: 4173, type: !22)
!4096 = !DILocation(line: 4173, column: 33, scope: !4094)
!4097 = !DILocalVariable(name: "factor", arg: 2, scope: !4094, file: !81, line: 4173, type: !22)
!4098 = !DILocation(line: 4173, column: 44, scope: !4094)
!4099 = !DILocation(line: 4175, column: 41, scope: !4094)
!4100 = !DILocation(line: 4175, column: 47, scope: !4094)
!4101 = !DILocation(line: 4175, column: 10, scope: !4094)
!4102 = !DILocation(line: 4175, column: 3, scope: !4094)
!4103 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !81, file: !81, line: 4196, type: !934, scopeLine: 4197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4104 = !DILocalVariable(name: "value", arg: 1, scope: !4103, file: !81, line: 4196, type: !22)
!4105 = !DILocation(line: 4196, column: 32, scope: !4103)
!4106 = !DILocalVariable(name: "factor", arg: 2, scope: !4103, file: !81, line: 4196, type: !22)
!4107 = !DILocation(line: 4196, column: 43, scope: !4103)
!4108 = !DILocation(line: 4198, column: 41, scope: !4103)
!4109 = !DILocation(line: 4198, column: 47, scope: !4103)
!4110 = !DILocation(line: 4198, column: 10, scope: !4103)
!4111 = !DILocation(line: 4198, column: 3, scope: !4103)
!4112 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !81, file: !81, line: 4220, type: !934, scopeLine: 4221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4113 = !DILocalVariable(name: "value", arg: 1, scope: !4112, file: !81, line: 4220, type: !22)
!4114 = !DILocation(line: 4220, column: 31, scope: !4112)
!4115 = !DILocalVariable(name: "factor", arg: 2, scope: !4112, file: !81, line: 4220, type: !22)
!4116 = !DILocation(line: 4220, column: 42, scope: !4112)
!4117 = !DILocation(line: 4222, column: 41, scope: !4112)
!4118 = !DILocation(line: 4222, column: 47, scope: !4112)
!4119 = !DILocation(line: 4222, column: 10, scope: !4112)
!4120 = !DILocation(line: 4222, column: 3, scope: !4112)
!4121 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !81, file: !81, line: 4244, type: !934, scopeLine: 4245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4122 = !DILocalVariable(name: "value", arg: 1, scope: !4121, file: !81, line: 4244, type: !22)
!4123 = !DILocation(line: 4244, column: 34, scope: !4121)
!4124 = !DILocalVariable(name: "factor", arg: 2, scope: !4121, file: !81, line: 4244, type: !22)
!4125 = !DILocation(line: 4244, column: 45, scope: !4121)
!4126 = !DILocation(line: 4246, column: 44, scope: !4121)
!4127 = !DILocation(line: 4246, column: 50, scope: !4121)
!4128 = !DILocation(line: 4246, column: 10, scope: !4121)
!4129 = !DILocation(line: 4246, column: 3, scope: !4121)
!4130 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !81, file: !81, line: 4268, type: !934, scopeLine: 4269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4131 = !DILocalVariable(name: "value", arg: 1, scope: !4130, file: !81, line: 4268, type: !22)
!4132 = !DILocation(line: 4268, column: 32, scope: !4130)
!4133 = !DILocalVariable(name: "factor", arg: 2, scope: !4130, file: !81, line: 4268, type: !22)
!4134 = !DILocation(line: 4268, column: 43, scope: !4130)
!4135 = !DILocation(line: 4270, column: 44, scope: !4130)
!4136 = !DILocation(line: 4270, column: 50, scope: !4130)
!4137 = !DILocation(line: 4270, column: 10, scope: !4130)
!4138 = !DILocation(line: 4270, column: 3, scope: !4130)
!4139 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !81, file: !81, line: 4292, type: !934, scopeLine: 4293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4140 = !DILocalVariable(name: "value", arg: 1, scope: !4139, file: !81, line: 4292, type: !22)
!4141 = !DILocation(line: 4292, column: 31, scope: !4139)
!4142 = !DILocalVariable(name: "factor", arg: 2, scope: !4139, file: !81, line: 4292, type: !22)
!4143 = !DILocation(line: 4292, column: 42, scope: !4139)
!4144 = !DILocation(line: 4294, column: 44, scope: !4139)
!4145 = !DILocation(line: 4294, column: 50, scope: !4139)
!4146 = !DILocation(line: 4294, column: 10, scope: !4139)
!4147 = !DILocation(line: 4294, column: 3, scope: !4139)
!4148 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !81, file: !81, line: 4316, type: !934, scopeLine: 4317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4149 = !DILocalVariable(name: "value", arg: 1, scope: !4148, file: !81, line: 4316, type: !22)
!4150 = !DILocation(line: 4316, column: 33, scope: !4148)
!4151 = !DILocalVariable(name: "factor", arg: 2, scope: !4148, file: !81, line: 4316, type: !22)
!4152 = !DILocation(line: 4316, column: 44, scope: !4148)
!4153 = !DILocation(line: 4318, column: 44, scope: !4148)
!4154 = !DILocation(line: 4318, column: 50, scope: !4148)
!4155 = !DILocation(line: 4318, column: 10, scope: !4148)
!4156 = !DILocation(line: 4318, column: 3, scope: !4148)
!4157 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !81, file: !81, line: 4340, type: !934, scopeLine: 4341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4158 = !DILocalVariable(name: "value", arg: 1, scope: !4157, file: !81, line: 4340, type: !22)
!4159 = !DILocation(line: 4340, column: 32, scope: !4157)
!4160 = !DILocalVariable(name: "factor", arg: 2, scope: !4157, file: !81, line: 4340, type: !22)
!4161 = !DILocation(line: 4340, column: 43, scope: !4157)
!4162 = !DILocation(line: 4342, column: 44, scope: !4157)
!4163 = !DILocation(line: 4342, column: 50, scope: !4157)
!4164 = !DILocation(line: 4342, column: 10, scope: !4157)
!4165 = !DILocation(line: 4342, column: 3, scope: !4157)
!4166 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !81, file: !81, line: 4363, type: !934, scopeLine: 4364, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4167 = !DILocalVariable(name: "value", arg: 1, scope: !4166, file: !81, line: 4363, type: !22)
!4168 = !DILocation(line: 4363, column: 31, scope: !4166)
!4169 = !DILocalVariable(name: "factor", arg: 2, scope: !4166, file: !81, line: 4363, type: !22)
!4170 = !DILocation(line: 4363, column: 42, scope: !4166)
!4171 = !DILocation(line: 4365, column: 44, scope: !4166)
!4172 = !DILocation(line: 4365, column: 50, scope: !4166)
!4173 = !DILocation(line: 4365, column: 10, scope: !4166)
!4174 = !DILocation(line: 4365, column: 3, scope: !4166)
!4175 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !81, file: !81, line: 4386, type: !934, scopeLine: 4387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4176 = !DILocalVariable(name: "value", arg: 1, scope: !4175, file: !81, line: 4386, type: !22)
!4177 = !DILocation(line: 4386, column: 30, scope: !4175)
!4178 = !DILocalVariable(name: "factor", arg: 2, scope: !4175, file: !81, line: 4386, type: !22)
!4179 = !DILocation(line: 4386, column: 41, scope: !4175)
!4180 = !DILocation(line: 4388, column: 44, scope: !4175)
!4181 = !DILocation(line: 4388, column: 50, scope: !4175)
!4182 = !DILocation(line: 4388, column: 10, scope: !4175)
!4183 = !DILocation(line: 4388, column: 3, scope: !4175)
!4184 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !81, file: !81, line: 4409, type: !934, scopeLine: 4410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4185 = !DILocalVariable(name: "value", arg: 1, scope: !4184, file: !81, line: 4409, type: !22)
!4186 = !DILocation(line: 4409, column: 33, scope: !4184)
!4187 = !DILocalVariable(name: "factor", arg: 2, scope: !4184, file: !81, line: 4409, type: !22)
!4188 = !DILocation(line: 4409, column: 44, scope: !4184)
!4189 = !DILocation(line: 4411, column: 44, scope: !4184)
!4190 = !DILocation(line: 4411, column: 50, scope: !4184)
!4191 = !DILocation(line: 4411, column: 10, scope: !4184)
!4192 = !DILocation(line: 4411, column: 3, scope: !4184)
!4193 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !81, file: !81, line: 4432, type: !934, scopeLine: 4433, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4194 = !DILocalVariable(name: "value", arg: 1, scope: !4193, file: !81, line: 4432, type: !22)
!4195 = !DILocation(line: 4432, column: 32, scope: !4193)
!4196 = !DILocalVariable(name: "factor", arg: 2, scope: !4193, file: !81, line: 4432, type: !22)
!4197 = !DILocation(line: 4432, column: 43, scope: !4193)
!4198 = !DILocation(line: 4434, column: 44, scope: !4193)
!4199 = !DILocation(line: 4434, column: 50, scope: !4193)
!4200 = !DILocation(line: 4434, column: 10, scope: !4193)
!4201 = !DILocation(line: 4434, column: 3, scope: !4193)
!4202 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !81, file: !81, line: 4455, type: !934, scopeLine: 4456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4203 = !DILocalVariable(name: "value", arg: 1, scope: !4202, file: !81, line: 4455, type: !22)
!4204 = !DILocation(line: 4455, column: 31, scope: !4202)
!4205 = !DILocalVariable(name: "factor", arg: 2, scope: !4202, file: !81, line: 4455, type: !22)
!4206 = !DILocation(line: 4455, column: 42, scope: !4202)
!4207 = !DILocation(line: 4457, column: 44, scope: !4202)
!4208 = !DILocation(line: 4457, column: 50, scope: !4202)
!4209 = !DILocation(line: 4457, column: 10, scope: !4202)
!4210 = !DILocation(line: 4457, column: 3, scope: !4202)
!4211 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !81, file: !81, line: 4478, type: !934, scopeLine: 4479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4212 = !DILocalVariable(name: "value", arg: 1, scope: !4211, file: !81, line: 4478, type: !22)
!4213 = !DILocation(line: 4478, column: 30, scope: !4211)
!4214 = !DILocalVariable(name: "factor", arg: 2, scope: !4211, file: !81, line: 4478, type: !22)
!4215 = !DILocation(line: 4478, column: 41, scope: !4211)
!4216 = !DILocation(line: 4480, column: 44, scope: !4211)
!4217 = !DILocation(line: 4480, column: 50, scope: !4211)
!4218 = !DILocation(line: 4480, column: 10, scope: !4211)
!4219 = !DILocation(line: 4480, column: 3, scope: !4211)
!4220 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !81, file: !81, line: 4500, type: !979, scopeLine: 4501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4221 = !DILocalVariable(name: "x_value", arg: 1, scope: !4220, file: !81, line: 4500, type: !22)
!4222 = !DILocation(line: 4500, column: 32, scope: !4220)
!4223 = !DILocalVariable(name: "y_value", arg: 2, scope: !4220, file: !81, line: 4500, type: !17)
!4224 = !DILocation(line: 4500, column: 44, scope: !4220)
!4225 = !DILocation(line: 4502, column: 40, scope: !4220)
!4226 = !DILocation(line: 4502, column: 60, scope: !4220)
!4227 = !DILocation(line: 4502, column: 54, scope: !4220)
!4228 = !DILocation(line: 4502, column: 69, scope: !4220)
!4229 = !DILocation(line: 4502, column: 48, scope: !4220)
!4230 = !DILocation(line: 4502, column: 10, scope: !4220)
!4231 = !DILocation(line: 4502, column: 3, scope: !4220)
!4232 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !81, file: !81, line: 4522, type: !979, scopeLine: 4523, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4233 = !DILocalVariable(name: "x_value", arg: 1, scope: !4232, file: !81, line: 4522, type: !22)
!4234 = !DILocation(line: 4522, column: 31, scope: !4232)
!4235 = !DILocalVariable(name: "y_value", arg: 2, scope: !4232, file: !81, line: 4522, type: !17)
!4236 = !DILocation(line: 4522, column: 43, scope: !4232)
!4237 = !DILocation(line: 4524, column: 40, scope: !4232)
!4238 = !DILocation(line: 4524, column: 60, scope: !4232)
!4239 = !DILocation(line: 4524, column: 54, scope: !4232)
!4240 = !DILocation(line: 4524, column: 69, scope: !4232)
!4241 = !DILocation(line: 4524, column: 48, scope: !4232)
!4242 = !DILocation(line: 4524, column: 10, scope: !4232)
!4243 = !DILocation(line: 4524, column: 3, scope: !4232)
!4244 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !81, file: !81, line: 4545, type: !979, scopeLine: 4546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4245 = !DILocalVariable(name: "x_value", arg: 1, scope: !4244, file: !81, line: 4545, type: !22)
!4246 = !DILocation(line: 4545, column: 30, scope: !4244)
!4247 = !DILocalVariable(name: "y_value", arg: 2, scope: !4244, file: !81, line: 4545, type: !17)
!4248 = !DILocation(line: 4545, column: 42, scope: !4244)
!4249 = !DILocation(line: 4547, column: 40, scope: !4244)
!4250 = !DILocation(line: 4547, column: 60, scope: !4244)
!4251 = !DILocation(line: 4547, column: 54, scope: !4244)
!4252 = !DILocation(line: 4547, column: 69, scope: !4244)
!4253 = !DILocation(line: 4547, column: 48, scope: !4244)
!4254 = !DILocation(line: 4547, column: 10, scope: !4244)
!4255 = !DILocation(line: 4547, column: 3, scope: !4244)
!4256 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !81, file: !81, line: 4568, type: !979, scopeLine: 4569, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4257 = !DILocalVariable(name: "x_value", arg: 1, scope: !4256, file: !81, line: 4568, type: !22)
!4258 = !DILocation(line: 4568, column: 31, scope: !4256)
!4259 = !DILocalVariable(name: "y_value", arg: 2, scope: !4256, file: !81, line: 4568, type: !17)
!4260 = !DILocation(line: 4568, column: 43, scope: !4256)
!4261 = !DILocation(line: 4570, column: 44, scope: !4256)
!4262 = !DILocation(line: 4570, column: 64, scope: !4256)
!4263 = !DILocation(line: 4570, column: 58, scope: !4256)
!4264 = !DILocation(line: 4570, column: 73, scope: !4256)
!4265 = !DILocation(line: 4570, column: 52, scope: !4256)
!4266 = !DILocation(line: 4570, column: 10, scope: !4256)
!4267 = !DILocation(line: 4570, column: 3, scope: !4256)
!4268 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !81, file: !81, line: 4591, type: !979, scopeLine: 4592, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4269 = !DILocalVariable(name: "x_value", arg: 1, scope: !4268, file: !81, line: 4591, type: !22)
!4270 = !DILocation(line: 4591, column: 30, scope: !4268)
!4271 = !DILocalVariable(name: "y_value", arg: 2, scope: !4268, file: !81, line: 4591, type: !17)
!4272 = !DILocation(line: 4591, column: 42, scope: !4268)
!4273 = !DILocation(line: 4593, column: 44, scope: !4268)
!4274 = !DILocation(line: 4593, column: 64, scope: !4268)
!4275 = !DILocation(line: 4593, column: 58, scope: !4268)
!4276 = !DILocation(line: 4593, column: 73, scope: !4268)
!4277 = !DILocation(line: 4593, column: 52, scope: !4268)
!4278 = !DILocation(line: 4593, column: 10, scope: !4268)
!4279 = !DILocation(line: 4593, column: 3, scope: !4268)
!4280 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !81, file: !81, line: 4613, type: !979, scopeLine: 4614, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4281 = !DILocalVariable(name: "x_value", arg: 1, scope: !4280, file: !81, line: 4613, type: !22)
!4282 = !DILocation(line: 4613, column: 30, scope: !4280)
!4283 = !DILocalVariable(name: "y_value", arg: 2, scope: !4280, file: !81, line: 4613, type: !17)
!4284 = !DILocation(line: 4613, column: 42, scope: !4280)
!4285 = !DILocation(line: 4615, column: 44, scope: !4280)
!4286 = !DILocation(line: 4615, column: 64, scope: !4280)
!4287 = !DILocation(line: 4615, column: 58, scope: !4280)
!4288 = !DILocation(line: 4615, column: 73, scope: !4280)
!4289 = !DILocation(line: 4615, column: 52, scope: !4280)
!4290 = !DILocation(line: 4615, column: 10, scope: !4280)
!4291 = !DILocation(line: 4615, column: 3, scope: !4280)
!4292 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !81, file: !81, line: 4635, type: !979, scopeLine: 4636, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4293 = !DILocalVariable(name: "x_value", arg: 1, scope: !4292, file: !81, line: 4635, type: !22)
!4294 = !DILocation(line: 4635, column: 29, scope: !4292)
!4295 = !DILocalVariable(name: "y_value", arg: 2, scope: !4292, file: !81, line: 4635, type: !17)
!4296 = !DILocation(line: 4635, column: 41, scope: !4292)
!4297 = !DILocation(line: 4637, column: 44, scope: !4292)
!4298 = !DILocation(line: 4637, column: 64, scope: !4292)
!4299 = !DILocation(line: 4637, column: 58, scope: !4292)
!4300 = !DILocation(line: 4637, column: 73, scope: !4292)
!4301 = !DILocation(line: 4637, column: 52, scope: !4292)
!4302 = !DILocation(line: 4637, column: 10, scope: !4292)
!4303 = !DILocation(line: 4637, column: 3, scope: !4292)
!4304 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !81, file: !81, line: 4657, type: !979, scopeLine: 4658, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4305 = !DILocalVariable(name: "x_value", arg: 1, scope: !4304, file: !81, line: 4657, type: !22)
!4306 = !DILocation(line: 4657, column: 30, scope: !4304)
!4307 = !DILocalVariable(name: "y_value", arg: 2, scope: !4304, file: !81, line: 4657, type: !17)
!4308 = !DILocation(line: 4657, column: 42, scope: !4304)
!4309 = !DILocation(line: 4659, column: 44, scope: !4304)
!4310 = !DILocation(line: 4659, column: 64, scope: !4304)
!4311 = !DILocation(line: 4659, column: 58, scope: !4304)
!4312 = !DILocation(line: 4659, column: 73, scope: !4304)
!4313 = !DILocation(line: 4659, column: 52, scope: !4304)
!4314 = !DILocation(line: 4659, column: 10, scope: !4304)
!4315 = !DILocation(line: 4659, column: 3, scope: !4304)
!4316 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !81, file: !81, line: 4679, type: !979, scopeLine: 4680, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4317 = !DILocalVariable(name: "x_value", arg: 1, scope: !4316, file: !81, line: 4679, type: !22)
!4318 = !DILocation(line: 4679, column: 29, scope: !4316)
!4319 = !DILocalVariable(name: "y_value", arg: 2, scope: !4316, file: !81, line: 4679, type: !17)
!4320 = !DILocation(line: 4679, column: 41, scope: !4316)
!4321 = !DILocation(line: 4681, column: 44, scope: !4316)
!4322 = !DILocation(line: 4681, column: 64, scope: !4316)
!4323 = !DILocation(line: 4681, column: 58, scope: !4316)
!4324 = !DILocation(line: 4681, column: 73, scope: !4316)
!4325 = !DILocation(line: 4681, column: 52, scope: !4316)
!4326 = !DILocation(line: 4681, column: 10, scope: !4316)
!4327 = !DILocation(line: 4681, column: 3, scope: !4316)
!4328 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !81, file: !81, line: 4703, type: !1508, scopeLine: 4704, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4329 = !DILocalVariable(name: "value", arg: 1, scope: !4328, file: !81, line: 4703, type: !29)
!4330 = !DILocation(line: 4703, column: 31, scope: !4328)
!4331 = !DILocalVariable(name: "factor", arg: 2, scope: !4328, file: !81, line: 4703, type: !13)
!4332 = !DILocation(line: 4703, column: 42, scope: !4328)
!4333 = !DILocation(line: 4705, column: 41, scope: !4328)
!4334 = !DILocation(line: 4705, column: 47, scope: !4328)
!4335 = !DILocation(line: 4705, column: 10, scope: !4328)
!4336 = !DILocation(line: 4705, column: 3, scope: !4328)
!4337 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !81, file: !81, line: 5283, type: !4338, scopeLine: 5284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4338 = !DISubroutineType(types: !4339)
!4339 = !{!29, !29, !13, !29}
!4340 = !DILocalVariable(name: "value", arg: 1, scope: !4337, file: !81, line: 5283, type: !29)
!4341 = !DILocation(line: 5283, column: 40, scope: !4337)
!4342 = !DILocalVariable(name: "factor", arg: 2, scope: !4337, file: !81, line: 5283, type: !13)
!4343 = !DILocation(line: 5283, column: 50, scope: !4337)
!4344 = !DILocalVariable(name: "count", arg: 3, scope: !4337, file: !81, line: 5283, type: !29)
!4345 = !DILocation(line: 5283, column: 62, scope: !4337)
!4346 = !DILocalVariable(name: "u32Temp1", scope: !4337, file: !81, line: 5285, type: !29)
!4347 = !DILocation(line: 5285, column: 6, scope: !4337)
!4348 = !DILocalVariable(name: "u32Temp2", scope: !4337, file: !81, line: 5285, type: !29)
!4349 = !DILocation(line: 5285, column: 17, scope: !4337)
!4350 = !DILocalVariable(name: "u32Temp3", scope: !4337, file: !81, line: 5285, type: !29)
!4351 = !DILocation(line: 5285, column: 26, scope: !4337)
!4352 = !DILocalVariable(name: "u8SignBit", scope: !4337, file: !81, line: 5286, type: !17)
!4353 = !DILocation(line: 5286, column: 5, scope: !4337)
!4354 = !DILocation(line: 5288, column: 5, scope: !4355)
!4355 = distinct !DILexicalBlock(scope: !4337, file: !81, line: 5288, column: 5)
!4356 = !DILocation(line: 5288, column: 11, scope: !4355)
!4357 = !DILocation(line: 5288, column: 5, scope: !4337)
!4358 = !DILocation(line: 5290, column: 13, scope: !4359)
!4359 = distinct !DILexicalBlock(scope: !4355, file: !81, line: 5289, column: 2)
!4360 = !DILocation(line: 5291, column: 2, scope: !4359)
!4361 = !DILocation(line: 5294, column: 13, scope: !4362)
!4362 = distinct !DILexicalBlock(scope: !4355, file: !81, line: 5293, column: 2)
!4363 = !DILocation(line: 5298, column: 5, scope: !4364)
!4364 = distinct !DILexicalBlock(scope: !4337, file: !81, line: 5298, column: 5)
!4365 = !DILocation(line: 5298, column: 11, scope: !4364)
!4366 = !DILocation(line: 5298, column: 5, scope: !4337)
!4367 = !DILocation(line: 5300, column: 15, scope: !4368)
!4368 = distinct !DILexicalBlock(scope: !4364, file: !81, line: 5299, column: 2)
!4369 = !DILocation(line: 5300, column: 14, scope: !4368)
!4370 = !DILocation(line: 5300, column: 12, scope: !4368)
!4371 = !DILocation(line: 5301, column: 2, scope: !4368)
!4372 = !DILocation(line: 5304, column: 14, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4364, file: !81, line: 5303, column: 2)
!4374 = !DILocation(line: 5304, column: 12, scope: !4373)
!4375 = !DILocation(line: 5307, column: 13, scope: !4337)
!4376 = !DILocation(line: 5307, column: 21, scope: !4337)
!4377 = !DILocation(line: 5307, column: 19, scope: !4337)
!4378 = !DILocation(line: 5307, column: 11, scope: !4337)
!4379 = !DILocation(line: 5308, column: 25, scope: !4337)
!4380 = !DILocation(line: 5308, column: 32, scope: !4337)
!4381 = !DILocation(line: 5308, column: 13, scope: !4337)
!4382 = !DILocation(line: 5308, column: 11, scope: !4337)
!4383 = !DILocation(line: 5309, column: 13, scope: !4337)
!4384 = !DILocation(line: 5309, column: 25, scope: !4337)
!4385 = !DILocation(line: 5309, column: 22, scope: !4337)
!4386 = !DILocation(line: 5309, column: 11, scope: !4337)
!4387 = !DILocation(line: 5310, column: 14, scope: !4337)
!4388 = !DILocation(line: 5310, column: 30, scope: !4337)
!4389 = !DILocation(line: 5310, column: 29, scope: !4337)
!4390 = !DILocation(line: 5310, column: 23, scope: !4337)
!4391 = !DILocation(line: 5310, column: 11, scope: !4337)
!4392 = !DILocation(line: 5311, column: 6, scope: !4393)
!4393 = distinct !DILexicalBlock(scope: !4337, file: !81, line: 5311, column: 5)
!4394 = !DILocation(line: 5311, column: 16, scope: !4393)
!4395 = !DILocation(line: 5311, column: 14, scope: !4393)
!4396 = !DILocation(line: 5311, column: 22, scope: !4393)
!4397 = !DILocation(line: 5311, column: 5, scope: !4337)
!4398 = !DILocation(line: 5313, column: 6, scope: !4399)
!4399 = distinct !DILexicalBlock(scope: !4400, file: !81, line: 5313, column: 6)
!4400 = distinct !DILexicalBlock(scope: !4393, file: !81, line: 5312, column: 2)
!4401 = !DILocation(line: 5313, column: 16, scope: !4399)
!4402 = !DILocation(line: 5313, column: 6, scope: !4400)
!4403 = !DILocation(line: 5315, column: 7, scope: !4404)
!4404 = distinct !DILexicalBlock(scope: !4405, file: !81, line: 5315, column: 7)
!4405 = distinct !DILexicalBlock(scope: !4399, file: !81, line: 5314, column: 3)
!4406 = !DILocation(line: 5315, column: 15, scope: !4404)
!4407 = !DILocation(line: 5315, column: 7, scope: !4405)
!4408 = !DILocation(line: 5316, column: 12, scope: !4404)
!4409 = !DILocation(line: 5316, column: 5, scope: !4404)
!4410 = !DILocation(line: 5318, column: 5, scope: !4404)
!4411 = !DILocation(line: 5322, column: 4, scope: !4412)
!4412 = distinct !DILexicalBlock(scope: !4399, file: !81, line: 5321, column: 3)
!4413 = !DILocation(line: 5327, column: 3, scope: !4414)
!4414 = distinct !DILexicalBlock(scope: !4393, file: !81, line: 5326, column: 2)
!4415 = !DILocation(line: 5329, column: 1, scope: !4337)
!4416 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !81, file: !81, line: 4727, type: !1326, scopeLine: 4728, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4417 = !DILocalVariable(name: "value", arg: 1, scope: !4416, file: !81, line: 4727, type: !29)
!4418 = !DILocation(line: 4727, column: 31, scope: !4416)
!4419 = !DILocalVariable(name: "factor", arg: 2, scope: !4416, file: !81, line: 4727, type: !89)
!4420 = !DILocation(line: 4727, column: 42, scope: !4416)
!4421 = !DILocation(line: 4729, column: 41, scope: !4416)
!4422 = !DILocation(line: 4729, column: 47, scope: !4416)
!4423 = !DILocation(line: 4729, column: 10, scope: !4416)
!4424 = !DILocation(line: 4729, column: 3, scope: !4416)
!4425 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !81, file: !81, line: 5347, type: !4426, scopeLine: 5348, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4426 = !DISubroutineType(types: !4427)
!4427 = !{!29, !29, !89, !29}
!4428 = !DILocalVariable(name: "value", arg: 1, scope: !4425, file: !81, line: 5347, type: !29)
!4429 = !DILocation(line: 5347, column: 40, scope: !4425)
!4430 = !DILocalVariable(name: "factor", arg: 2, scope: !4425, file: !81, line: 5347, type: !89)
!4431 = !DILocation(line: 5347, column: 51, scope: !4425)
!4432 = !DILocalVariable(name: "count", arg: 3, scope: !4425, file: !81, line: 5347, type: !29)
!4433 = !DILocation(line: 5347, column: 63, scope: !4425)
!4434 = !DILocalVariable(name: "u32Temp1", scope: !4425, file: !81, line: 5349, type: !29)
!4435 = !DILocation(line: 5349, column: 6, scope: !4425)
!4436 = !DILocalVariable(name: "u32Temp2", scope: !4425, file: !81, line: 5349, type: !29)
!4437 = !DILocation(line: 5349, column: 17, scope: !4425)
!4438 = !DILocalVariable(name: "u8SignBit", scope: !4425, file: !81, line: 5350, type: !17)
!4439 = !DILocation(line: 5350, column: 5, scope: !4425)
!4440 = !DILocation(line: 5352, column: 5, scope: !4441)
!4441 = distinct !DILexicalBlock(scope: !4425, file: !81, line: 5352, column: 5)
!4442 = !DILocation(line: 5352, column: 11, scope: !4441)
!4443 = !DILocation(line: 5352, column: 5, scope: !4425)
!4444 = !DILocation(line: 5354, column: 13, scope: !4445)
!4445 = distinct !DILexicalBlock(scope: !4441, file: !81, line: 5353, column: 2)
!4446 = !DILocation(line: 5355, column: 2, scope: !4445)
!4447 = !DILocation(line: 5358, column: 13, scope: !4448)
!4448 = distinct !DILexicalBlock(scope: !4441, file: !81, line: 5357, column: 2)
!4449 = !DILocation(line: 5362, column: 5, scope: !4450)
!4450 = distinct !DILexicalBlock(scope: !4425, file: !81, line: 5362, column: 5)
!4451 = !DILocation(line: 5362, column: 11, scope: !4450)
!4452 = !DILocation(line: 5362, column: 5, scope: !4425)
!4453 = !DILocation(line: 5365, column: 44, scope: !4454)
!4454 = distinct !DILexicalBlock(scope: !4455, file: !81, line: 5365, column: 7)
!4455 = distinct !DILexicalBlock(scope: !4450, file: !81, line: 5363, column: 2)
!4456 = !DILocation(line: 5365, column: 34, scope: !4454)
!4457 = !DILocation(line: 5365, column: 9, scope: !4454)
!4458 = !DILocation(line: 5365, column: 7, scope: !4455)
!4459 = !DILocation(line: 5366, column: 7, scope: !4460)
!4460 = distinct !DILexicalBlock(scope: !4454, file: !81, line: 5365, column: 55)
!4461 = !DILocation(line: 5368, column: 15, scope: !4455)
!4462 = !DILocation(line: 5368, column: 14, scope: !4455)
!4463 = !DILocation(line: 5368, column: 12, scope: !4455)
!4464 = !DILocation(line: 5369, column: 2, scope: !4455)
!4465 = !DILocation(line: 5372, column: 14, scope: !4466)
!4466 = distinct !DILexicalBlock(scope: !4450, file: !81, line: 5371, column: 2)
!4467 = !DILocation(line: 5372, column: 12, scope: !4466)
!4468 = !DILocation(line: 5375, column: 25, scope: !4425)
!4469 = !DILocation(line: 5375, column: 32, scope: !4425)
!4470 = !DILocation(line: 5375, column: 13, scope: !4425)
!4471 = !DILocation(line: 5375, column: 11, scope: !4425)
!4472 = !DILocation(line: 5377, column: 53, scope: !4473)
!4473 = distinct !DILexicalBlock(scope: !4425, file: !81, line: 5377, column: 6)
!4474 = !DILocation(line: 5377, column: 59, scope: !4473)
!4475 = !DILocation(line: 5377, column: 37, scope: !4473)
!4476 = !DILocation(line: 5377, column: 8, scope: !4473)
!4477 = !DILocation(line: 5377, column: 6, scope: !4425)
!4478 = !DILocation(line: 5378, column: 6, scope: !4479)
!4479 = distinct !DILexicalBlock(scope: !4473, file: !81, line: 5377, column: 73)
!4480 = !DILocation(line: 5385, column: 34, scope: !4425)
!4481 = !DILocation(line: 5385, column: 47, scope: !4425)
!4482 = !DILocation(line: 5385, column: 52, scope: !4425)
!4483 = !DILocation(line: 5385, column: 43, scope: !4425)
!4484 = !DILocation(line: 5385, column: 24, scope: !4425)
!4485 = !DILocation(line: 5385, column: 22, scope: !4425)
!4486 = !DILocation(line: 5386, column: 2, scope: !4425)
!4487 = !DILocation(line: 5395, column: 1, scope: !4425)
!4488 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !34, file: !34, line: 42, type: !4489, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4489 = !DISubroutineType(types: !4490)
!4490 = !{!41, !26}
!4491 = !DILocalVariable(name: "value", arg: 1, scope: !4488, file: !34, line: 42, type: !26)
!4492 = !DILocation(line: 42, column: 38, scope: !4488)
!4493 = !DILocation(line: 44, column: 12, scope: !4488)
!4494 = !DILocation(line: 44, column: 18, scope: !4488)
!4495 = !DILocation(line: 44, column: 5, scope: !4488)
!4496 = distinct !DISubprogram(name: "klee_alarm_shift_count_valid", scope: !34, file: !34, line: 36, type: !4497, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4497 = !DISubroutineType(types: !4498)
!4498 = !{!41, !26, !26}
!4499 = !DILocalVariable(name: "count", arg: 1, scope: !4496, file: !34, line: 36, type: !26)
!4500 = !DILocation(line: 36, column: 42, scope: !4496)
!4501 = !DILocalVariable(name: "width", arg: 2, scope: !4496, file: !34, line: 36, type: !26)
!4502 = !DILocation(line: 36, column: 57, scope: !4496)
!4503 = !DILocation(line: 38, column: 12, scope: !4496)
!4504 = !DILocation(line: 38, column: 18, scope: !4496)
!4505 = !DILocation(line: 38, column: 32, scope: !4496)
!4506 = !DILocation(line: 38, column: 5, scope: !4496)
!4507 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !81, file: !81, line: 4751, type: !3100, scopeLine: 4752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4508 = !DILocalVariable(name: "value", arg: 1, scope: !4507, file: !81, line: 4751, type: !29)
!4509 = !DILocation(line: 4751, column: 30, scope: !4507)
!4510 = !DILocalVariable(name: "factor", arg: 2, scope: !4507, file: !81, line: 4751, type: !6)
!4511 = !DILocation(line: 4751, column: 40, scope: !4507)
!4512 = !DILocation(line: 4753, column: 40, scope: !4507)
!4513 = !DILocation(line: 4753, column: 46, scope: !4507)
!4514 = !DILocation(line: 4753, column: 10, scope: !4507)
!4515 = !DILocation(line: 4753, column: 3, scope: !4507)
!4516 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !81, file: !81, line: 5439, type: !4517, scopeLine: 5440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4517 = !DISubroutineType(types: !4518)
!4518 = !{!29, !29, !6, !29}
!4519 = !DILocalVariable(name: "value", arg: 1, scope: !4516, file: !81, line: 5439, type: !29)
!4520 = !DILocation(line: 5439, column: 39, scope: !4516)
!4521 = !DILocalVariable(name: "factor", arg: 2, scope: !4516, file: !81, line: 5439, type: !6)
!4522 = !DILocation(line: 5439, column: 49, scope: !4516)
!4523 = !DILocalVariable(name: "count", arg: 3, scope: !4516, file: !81, line: 5439, type: !29)
!4524 = !DILocation(line: 5439, column: 61, scope: !4516)
!4525 = !DILocalVariable(name: "u32Temp1", scope: !4516, file: !81, line: 5441, type: !29)
!4526 = !DILocation(line: 5441, column: 6, scope: !4516)
!4527 = !DILocalVariable(name: "u32Temp2", scope: !4516, file: !81, line: 5441, type: !29)
!4528 = !DILocation(line: 5441, column: 17, scope: !4516)
!4529 = !DILocalVariable(name: "u32Temp3", scope: !4516, file: !81, line: 5441, type: !29)
!4530 = !DILocation(line: 5441, column: 26, scope: !4516)
!4531 = !DILocalVariable(name: "u8SignBit", scope: !4516, file: !81, line: 5442, type: !17)
!4532 = !DILocation(line: 5442, column: 5, scope: !4516)
!4533 = !DILocation(line: 5444, column: 5, scope: !4534)
!4534 = distinct !DILexicalBlock(scope: !4516, file: !81, line: 5444, column: 5)
!4535 = !DILocation(line: 5444, column: 11, scope: !4534)
!4536 = !DILocation(line: 5444, column: 5, scope: !4516)
!4537 = !DILocation(line: 5446, column: 13, scope: !4538)
!4538 = distinct !DILexicalBlock(scope: !4534, file: !81, line: 5445, column: 2)
!4539 = !DILocation(line: 5447, column: 2, scope: !4538)
!4540 = !DILocation(line: 5450, column: 13, scope: !4541)
!4541 = distinct !DILexicalBlock(scope: !4534, file: !81, line: 5449, column: 2)
!4542 = !DILocation(line: 5454, column: 5, scope: !4543)
!4543 = distinct !DILexicalBlock(scope: !4516, file: !81, line: 5454, column: 5)
!4544 = !DILocation(line: 5454, column: 11, scope: !4543)
!4545 = !DILocation(line: 5454, column: 5, scope: !4516)
!4546 = !DILocation(line: 5456, column: 15, scope: !4547)
!4547 = distinct !DILexicalBlock(scope: !4543, file: !81, line: 5455, column: 2)
!4548 = !DILocation(line: 5456, column: 14, scope: !4547)
!4549 = !DILocation(line: 5456, column: 12, scope: !4547)
!4550 = !DILocation(line: 5457, column: 2, scope: !4547)
!4551 = !DILocation(line: 5460, column: 14, scope: !4552)
!4552 = distinct !DILexicalBlock(scope: !4543, file: !81, line: 5459, column: 2)
!4553 = !DILocation(line: 5460, column: 12, scope: !4552)
!4554 = !DILocation(line: 5463, column: 13, scope: !4516)
!4555 = !DILocation(line: 5463, column: 21, scope: !4516)
!4556 = !DILocation(line: 5463, column: 19, scope: !4516)
!4557 = !DILocation(line: 5463, column: 11, scope: !4516)
!4558 = !DILocation(line: 5464, column: 25, scope: !4516)
!4559 = !DILocation(line: 5464, column: 32, scope: !4516)
!4560 = !DILocation(line: 5464, column: 13, scope: !4516)
!4561 = !DILocation(line: 5464, column: 11, scope: !4516)
!4562 = !DILocation(line: 5465, column: 13, scope: !4516)
!4563 = !DILocation(line: 5465, column: 25, scope: !4516)
!4564 = !DILocation(line: 5465, column: 22, scope: !4516)
!4565 = !DILocation(line: 5465, column: 11, scope: !4516)
!4566 = !DILocation(line: 5466, column: 14, scope: !4516)
!4567 = !DILocation(line: 5466, column: 30, scope: !4516)
!4568 = !DILocation(line: 5466, column: 29, scope: !4516)
!4569 = !DILocation(line: 5466, column: 23, scope: !4516)
!4570 = !DILocation(line: 5466, column: 11, scope: !4516)
!4571 = !DILocation(line: 5467, column: 6, scope: !4572)
!4572 = distinct !DILexicalBlock(scope: !4516, file: !81, line: 5467, column: 5)
!4573 = !DILocation(line: 5467, column: 16, scope: !4572)
!4574 = !DILocation(line: 5467, column: 14, scope: !4572)
!4575 = !DILocation(line: 5467, column: 22, scope: !4572)
!4576 = !DILocation(line: 5467, column: 5, scope: !4516)
!4577 = !DILocation(line: 5469, column: 6, scope: !4578)
!4578 = distinct !DILexicalBlock(scope: !4579, file: !81, line: 5469, column: 6)
!4579 = distinct !DILexicalBlock(scope: !4572, file: !81, line: 5468, column: 2)
!4580 = !DILocation(line: 5469, column: 16, scope: !4578)
!4581 = !DILocation(line: 5469, column: 6, scope: !4579)
!4582 = !DILocation(line: 5471, column: 7, scope: !4583)
!4583 = distinct !DILexicalBlock(scope: !4584, file: !81, line: 5471, column: 7)
!4584 = distinct !DILexicalBlock(scope: !4578, file: !81, line: 5470, column: 3)
!4585 = !DILocation(line: 5471, column: 15, scope: !4583)
!4586 = !DILocation(line: 5471, column: 7, scope: !4584)
!4587 = !DILocation(line: 5472, column: 12, scope: !4583)
!4588 = !DILocation(line: 5472, column: 5, scope: !4583)
!4589 = !DILocation(line: 5474, column: 5, scope: !4583)
!4590 = !DILocation(line: 5478, column: 4, scope: !4591)
!4591 = distinct !DILexicalBlock(scope: !4578, file: !81, line: 5477, column: 3)
!4592 = !DILocation(line: 5483, column: 3, scope: !4593)
!4593 = distinct !DILexicalBlock(scope: !4572, file: !81, line: 5482, column: 2)
!4594 = !DILocation(line: 5485, column: 1, scope: !4516)
!4595 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !81, file: !81, line: 4775, type: !1122, scopeLine: 4776, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4596 = !DILocalVariable(name: "value", arg: 1, scope: !4595, file: !81, line: 4775, type: !29)
!4597 = !DILocation(line: 4775, column: 31, scope: !4595)
!4598 = !DILocalVariable(name: "factor", arg: 2, scope: !4595, file: !81, line: 4775, type: !22)
!4599 = !DILocation(line: 4775, column: 42, scope: !4595)
!4600 = !DILocation(line: 4777, column: 41, scope: !4595)
!4601 = !DILocation(line: 4777, column: 47, scope: !4595)
!4602 = !DILocation(line: 4777, column: 10, scope: !4595)
!4603 = !DILocation(line: 4777, column: 3, scope: !4595)
!4604 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !81, file: !81, line: 4799, type: !1417, scopeLine: 4800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4605 = !DILocalVariable(name: "value", arg: 1, scope: !4604, file: !81, line: 4799, type: !29)
!4606 = !DILocation(line: 4799, column: 31, scope: !4604)
!4607 = !DILocalVariable(name: "factor", arg: 2, scope: !4604, file: !81, line: 4799, type: !29)
!4608 = !DILocation(line: 4799, column: 42, scope: !4604)
!4609 = !DILocation(line: 4801, column: 41, scope: !4604)
!4610 = !DILocation(line: 4801, column: 47, scope: !4604)
!4611 = !DILocation(line: 4801, column: 10, scope: !4604)
!4612 = !DILocation(line: 4801, column: 3, scope: !4604)
!4613 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !81, file: !81, line: 5412, type: !4614, scopeLine: 5413, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4614 = !DISubroutineType(types: !4615)
!4615 = !{!29, !29, !29, !29}
!4616 = !DILocalVariable(name: "value", arg: 1, scope: !4613, file: !81, line: 5412, type: !29)
!4617 = !DILocation(line: 5412, column: 40, scope: !4613)
!4618 = !DILocalVariable(name: "factor", arg: 2, scope: !4613, file: !81, line: 5412, type: !29)
!4619 = !DILocation(line: 5412, column: 50, scope: !4613)
!4620 = !DILocalVariable(name: "count", arg: 3, scope: !4613, file: !81, line: 5412, type: !29)
!4621 = !DILocation(line: 5412, column: 62, scope: !4613)
!4622 = !DILocalVariable(name: "u32Temp1", scope: !4613, file: !81, line: 5414, type: !29)
!4623 = !DILocation(line: 5414, column: 6, scope: !4613)
!4624 = !DILocalVariable(name: "u32Temp2", scope: !4613, file: !81, line: 5414, type: !29)
!4625 = !DILocation(line: 5414, column: 17, scope: !4613)
!4626 = !DILocalVariable(name: "u32Temp3", scope: !4613, file: !81, line: 5414, type: !29)
!4627 = !DILocation(line: 5414, column: 26, scope: !4613)
!4628 = !DILocalVariable(name: "u32Temp4", scope: !4613, file: !81, line: 5414, type: !29)
!4629 = !DILocation(line: 5414, column: 35, scope: !4613)
!4630 = !DILocalVariable(name: "u8SignBit", scope: !4613, file: !81, line: 5415, type: !17)
!4631 = !DILocation(line: 5415, column: 5, scope: !4613)
!4632 = !DILocation(line: 5417, column: 25, scope: !4613)
!4633 = !DILocation(line: 5417, column: 32, scope: !4613)
!4634 = !DILocation(line: 5417, column: 13, scope: !4613)
!4635 = !DILocation(line: 5417, column: 11, scope: !4613)
!4636 = !DILocation(line: 5418, column: 13, scope: !4613)
!4637 = !DILocation(line: 5418, column: 26, scope: !4613)
!4638 = !DILocation(line: 5418, column: 31, scope: !4613)
!4639 = !DILocation(line: 5418, column: 22, scope: !4613)
!4640 = !DILocation(line: 5418, column: 11, scope: !4613)
!4641 = !DILocation(line: 5419, column: 9, scope: !4613)
!4642 = !DILocation(line: 5419, column: 2, scope: !4613)
!4643 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !81, file: !81, line: 4823, type: !3039, scopeLine: 4824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4644 = !DILocalVariable(name: "value", arg: 1, scope: !4643, file: !81, line: 4823, type: !29)
!4645 = !DILocation(line: 4823, column: 30, scope: !4643)
!4646 = !DILocalVariable(name: "factor", arg: 2, scope: !4643, file: !81, line: 4823, type: !17)
!4647 = !DILocation(line: 4823, column: 40, scope: !4643)
!4648 = !DILocation(line: 4825, column: 40, scope: !4643)
!4649 = !DILocation(line: 4825, column: 46, scope: !4643)
!4650 = !DILocation(line: 4825, column: 10, scope: !4643)
!4651 = !DILocation(line: 4825, column: 3, scope: !4643)
!4652 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !81, file: !81, line: 5503, type: !4653, scopeLine: 5504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4653 = !DISubroutineType(types: !4654)
!4654 = !{!29, !29, !17, !29}
!4655 = !DILocalVariable(name: "value", arg: 1, scope: !4652, file: !81, line: 5503, type: !29)
!4656 = !DILocation(line: 5503, column: 39, scope: !4652)
!4657 = !DILocalVariable(name: "factor", arg: 2, scope: !4652, file: !81, line: 5503, type: !17)
!4658 = !DILocation(line: 5503, column: 49, scope: !4652)
!4659 = !DILocalVariable(name: "count", arg: 3, scope: !4652, file: !81, line: 5503, type: !29)
!4660 = !DILocation(line: 5503, column: 61, scope: !4652)
!4661 = !DILocalVariable(name: "u32Temp1", scope: !4652, file: !81, line: 5505, type: !29)
!4662 = !DILocation(line: 5505, column: 6, scope: !4652)
!4663 = !DILocalVariable(name: "u32Temp2", scope: !4652, file: !81, line: 5505, type: !29)
!4664 = !DILocation(line: 5505, column: 17, scope: !4652)
!4665 = !DILocation(line: 5507, column: 13, scope: !4652)
!4666 = !DILocation(line: 5507, column: 21, scope: !4652)
!4667 = !DILocation(line: 5507, column: 19, scope: !4652)
!4668 = !DILocation(line: 5507, column: 11, scope: !4652)
!4669 = !DILocation(line: 5508, column: 25, scope: !4652)
!4670 = !DILocation(line: 5508, column: 32, scope: !4652)
!4671 = !DILocation(line: 5508, column: 13, scope: !4652)
!4672 = !DILocation(line: 5508, column: 11, scope: !4652)
!4673 = !DILocation(line: 5509, column: 13, scope: !4652)
!4674 = !DILocation(line: 5509, column: 25, scope: !4652)
!4675 = !DILocation(line: 5509, column: 22, scope: !4652)
!4676 = !DILocation(line: 5509, column: 11, scope: !4652)
!4677 = !DILocation(line: 5510, column: 14, scope: !4652)
!4678 = !DILocation(line: 5510, column: 30, scope: !4652)
!4679 = !DILocation(line: 5510, column: 29, scope: !4652)
!4680 = !DILocation(line: 5510, column: 23, scope: !4652)
!4681 = !DILocation(line: 5510, column: 11, scope: !4652)
!4682 = !DILocation(line: 5511, column: 6, scope: !4683)
!4683 = distinct !DILexicalBlock(scope: !4652, file: !81, line: 5511, column: 5)
!4684 = !DILocation(line: 5511, column: 16, scope: !4683)
!4685 = !DILocation(line: 5511, column: 14, scope: !4683)
!4686 = !DILocation(line: 5511, column: 22, scope: !4683)
!4687 = !DILocation(line: 5511, column: 5, scope: !4652)
!4688 = !DILocation(line: 5513, column: 6, scope: !4689)
!4689 = distinct !DILexicalBlock(scope: !4690, file: !81, line: 5513, column: 6)
!4690 = distinct !DILexicalBlock(scope: !4683, file: !81, line: 5512, column: 2)
!4691 = !DILocation(line: 5513, column: 14, scope: !4689)
!4692 = !DILocation(line: 5513, column: 6, scope: !4690)
!4693 = !DILocation(line: 5514, column: 11, scope: !4689)
!4694 = !DILocation(line: 5514, column: 4, scope: !4689)
!4695 = !DILocation(line: 5516, column: 4, scope: !4689)
!4696 = !DILocation(line: 5520, column: 3, scope: !4697)
!4697 = distinct !DILexicalBlock(scope: !4683, file: !81, line: 5519, column: 2)
!4698 = !DILocation(line: 5522, column: 1, scope: !4652)
!4699 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !81, file: !81, line: 4846, type: !890, scopeLine: 4847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4700 = !DILocalVariable(name: "value", arg: 1, scope: !4699, file: !81, line: 4846, type: !17)
!4701 = !DILocation(line: 4846, column: 28, scope: !4699)
!4702 = !DILocalVariable(name: "factor", arg: 2, scope: !4699, file: !81, line: 4846, type: !17)
!4703 = !DILocation(line: 4846, column: 38, scope: !4699)
!4704 = !DILocation(line: 4848, column: 38, scope: !4699)
!4705 = !DILocation(line: 4848, column: 44, scope: !4699)
!4706 = !DILocation(line: 4848, column: 10, scope: !4699)
!4707 = !DILocation(line: 4848, column: 3, scope: !4699)
!4708 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !81, file: !81, line: 4869, type: !890, scopeLine: 4870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4709 = !DILocalVariable(name: "value", arg: 1, scope: !4708, file: !81, line: 4869, type: !17)
!4710 = !DILocation(line: 4869, column: 28, scope: !4708)
!4711 = !DILocalVariable(name: "factor", arg: 2, scope: !4708, file: !81, line: 4869, type: !17)
!4712 = !DILocation(line: 4869, column: 38, scope: !4708)
!4713 = !DILocation(line: 4871, column: 38, scope: !4708)
!4714 = !DILocation(line: 4871, column: 44, scope: !4708)
!4715 = !DILocation(line: 4871, column: 10, scope: !4708)
!4716 = !DILocation(line: 4871, column: 3, scope: !4708)
!4717 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !81, file: !81, line: 4893, type: !890, scopeLine: 4894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4718 = !DILocalVariable(name: "value", arg: 1, scope: !4717, file: !81, line: 4893, type: !17)
!4719 = !DILocation(line: 4893, column: 26, scope: !4717)
!4720 = !DILocalVariable(name: "factor", arg: 2, scope: !4717, file: !81, line: 4893, type: !17)
!4721 = !DILocation(line: 4893, column: 36, scope: !4717)
!4722 = !DILocation(line: 4895, column: 38, scope: !4717)
!4723 = !DILocation(line: 4895, column: 44, scope: !4717)
!4724 = !DILocation(line: 4895, column: 10, scope: !4717)
!4725 = !DILocation(line: 4895, column: 3, scope: !4717)
!4726 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !81, file: !81, line: 4917, type: !890, scopeLine: 4918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4727 = !DILocalVariable(name: "value", arg: 1, scope: !4726, file: !81, line: 4917, type: !17)
!4728 = !DILocation(line: 4917, column: 28, scope: !4726)
!4729 = !DILocalVariable(name: "factor", arg: 2, scope: !4726, file: !81, line: 4917, type: !17)
!4730 = !DILocation(line: 4917, column: 38, scope: !4726)
!4731 = !DILocation(line: 4919, column: 41, scope: !4726)
!4732 = !DILocation(line: 4919, column: 47, scope: !4726)
!4733 = !DILocation(line: 4919, column: 10, scope: !4726)
!4734 = !DILocation(line: 4919, column: 3, scope: !4726)
!4735 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !81, file: !81, line: 4941, type: !890, scopeLine: 4942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4736 = !DILocalVariable(name: "value", arg: 1, scope: !4735, file: !81, line: 4941, type: !17)
!4737 = !DILocation(line: 4941, column: 26, scope: !4735)
!4738 = !DILocalVariable(name: "factor", arg: 2, scope: !4735, file: !81, line: 4941, type: !17)
!4739 = !DILocation(line: 4941, column: 36, scope: !4735)
!4740 = !DILocation(line: 4943, column: 41, scope: !4735)
!4741 = !DILocation(line: 4943, column: 47, scope: !4735)
!4742 = !DILocation(line: 4943, column: 10, scope: !4735)
!4743 = !DILocation(line: 4943, column: 3, scope: !4735)
!4744 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !81, file: !81, line: 4964, type: !890, scopeLine: 4965, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4745 = !DILocalVariable(name: "value", arg: 1, scope: !4744, file: !81, line: 4964, type: !17)
!4746 = !DILocation(line: 4964, column: 26, scope: !4744)
!4747 = !DILocalVariable(name: "factor", arg: 2, scope: !4744, file: !81, line: 4964, type: !17)
!4748 = !DILocation(line: 4964, column: 36, scope: !4744)
!4749 = !DILocation(line: 4966, column: 41, scope: !4744)
!4750 = !DILocation(line: 4966, column: 47, scope: !4744)
!4751 = !DILocation(line: 4966, column: 10, scope: !4744)
!4752 = !DILocation(line: 4966, column: 3, scope: !4744)
!4753 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !81, file: !81, line: 4987, type: !890, scopeLine: 4988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4754 = !DILocalVariable(name: "value", arg: 1, scope: !4753, file: !81, line: 4987, type: !17)
!4755 = !DILocation(line: 4987, column: 25, scope: !4753)
!4756 = !DILocalVariable(name: "factor", arg: 2, scope: !4753, file: !81, line: 4987, type: !17)
!4757 = !DILocation(line: 4987, column: 35, scope: !4753)
!4758 = !DILocation(line: 4989, column: 41, scope: !4753)
!4759 = !DILocation(line: 4989, column: 47, scope: !4753)
!4760 = !DILocation(line: 4989, column: 10, scope: !4753)
!4761 = !DILocation(line: 4989, column: 3, scope: !4753)
!4762 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !81, file: !81, line: 5010, type: !890, scopeLine: 5011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4763 = !DILocalVariable(name: "value", arg: 1, scope: !4762, file: !81, line: 5010, type: !17)
!4764 = !DILocation(line: 5010, column: 26, scope: !4762)
!4765 = !DILocalVariable(name: "factor", arg: 2, scope: !4762, file: !81, line: 5010, type: !17)
!4766 = !DILocation(line: 5010, column: 35, scope: !4762)
!4767 = !DILocation(line: 5012, column: 41, scope: !4762)
!4768 = !DILocation(line: 5012, column: 47, scope: !4762)
!4769 = !DILocation(line: 5012, column: 10, scope: !4762)
!4770 = !DILocation(line: 5012, column: 3, scope: !4762)
!4771 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !81, file: !81, line: 5033, type: !890, scopeLine: 5034, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4772 = !DILocalVariable(name: "value", arg: 1, scope: !4771, file: !81, line: 5033, type: !17)
!4773 = !DILocation(line: 5033, column: 25, scope: !4771)
!4774 = !DILocalVariable(name: "factor", arg: 2, scope: !4771, file: !81, line: 5033, type: !17)
!4775 = !DILocation(line: 5033, column: 35, scope: !4771)
!4776 = !DILocation(line: 5035, column: 41, scope: !4771)
!4777 = !DILocation(line: 5035, column: 47, scope: !4771)
!4778 = !DILocation(line: 5035, column: 10, scope: !4771)
!4779 = !DILocation(line: 5035, column: 3, scope: !4771)
!4780 = distinct !DISubprogram(name: "MulHighWord", scope: !4781, file: !4781, line: 39, type: !1417, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !4)
!4781 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019")
!4782 = !DILocalVariable(name: "arg1", arg: 1, scope: !4780, file: !4781, line: 39, type: !29)
!4783 = !DILocation(line: 39, column: 30, scope: !4780)
!4784 = !DILocalVariable(name: "arg2", arg: 2, scope: !4780, file: !4781, line: 39, type: !29)
!4785 = !DILocation(line: 39, column: 48, scope: !4780)
!4786 = !DILocalVariable(name: "arg1_LW", scope: !4780, file: !4781, line: 41, type: !22)
!4787 = !DILocation(line: 41, column: 6, scope: !4780)
!4788 = !DILocalVariable(name: "arg1_HW", scope: !4780, file: !4781, line: 41, type: !22)
!4789 = !DILocation(line: 41, column: 14, scope: !4780)
!4790 = !DILocalVariable(name: "arg2_LW", scope: !4780, file: !4781, line: 41, type: !22)
!4791 = !DILocation(line: 41, column: 22, scope: !4780)
!4792 = !DILocalVariable(name: "arg2_HW", scope: !4780, file: !4781, line: 41, type: !22)
!4793 = !DILocation(line: 41, column: 30, scope: !4780)
!4794 = !DILocalVariable(name: "MulTemp1", scope: !4780, file: !4781, line: 42, type: !29)
!4795 = !DILocation(line: 42, column: 6, scope: !4780)
!4796 = !DILocalVariable(name: "MulTemp2", scope: !4780, file: !4781, line: 42, type: !29)
!4797 = !DILocation(line: 42, column: 16, scope: !4780)
!4798 = !DILocalVariable(name: "MulTemp3", scope: !4780, file: !4781, line: 42, type: !29)
!4799 = !DILocation(line: 42, column: 26, scope: !4780)
!4800 = !DILocalVariable(name: "MulTemp4", scope: !4780, file: !4781, line: 42, type: !29)
!4801 = !DILocation(line: 42, column: 36, scope: !4780)
!4802 = !DILocalVariable(name: "HIGHWORD", scope: !4780, file: !4781, line: 42, type: !29)
!4803 = !DILocation(line: 42, column: 47, scope: !4780)
!4804 = !DILocalVariable(name: "OverFlow", scope: !4780, file: !4781, line: 42, type: !29)
!4805 = !DILocation(line: 42, column: 57, scope: !4780)
!4806 = !DILocation(line: 43, column: 12, scope: !4780)
!4807 = !DILocation(line: 43, column: 17, scope: !4780)
!4808 = !DILocation(line: 43, column: 10, scope: !4780)
!4809 = !DILocation(line: 44, column: 13, scope: !4780)
!4810 = !DILocation(line: 44, column: 18, scope: !4780)
!4811 = !DILocation(line: 44, column: 31, scope: !4780)
!4812 = !DILocation(line: 44, column: 12, scope: !4780)
!4813 = !DILocation(line: 44, column: 10, scope: !4780)
!4814 = !DILocation(line: 45, column: 12, scope: !4780)
!4815 = !DILocation(line: 45, column: 17, scope: !4780)
!4816 = !DILocation(line: 45, column: 10, scope: !4780)
!4817 = !DILocation(line: 46, column: 13, scope: !4780)
!4818 = !DILocation(line: 46, column: 18, scope: !4780)
!4819 = !DILocation(line: 46, column: 31, scope: !4780)
!4820 = !DILocation(line: 46, column: 12, scope: !4780)
!4821 = !DILocation(line: 46, column: 10, scope: !4780)
!4822 = !DILocation(line: 48, column: 48, scope: !4823)
!4823 = distinct !DILexicalBlock(scope: !4780, file: !4781, line: 48, column: 6)
!4824 = !DILocation(line: 48, column: 43, scope: !4823)
!4825 = !DILocation(line: 48, column: 33, scope: !4823)
!4826 = !DILocation(line: 48, column: 73, scope: !4823)
!4827 = !DILocation(line: 48, column: 68, scope: !4823)
!4828 = !DILocation(line: 48, column: 58, scope: !4823)
!4829 = !DILocation(line: 48, column: 8, scope: !4823)
!4830 = !DILocation(line: 48, column: 6, scope: !4780)
!4831 = !DILocation(line: 49, column: 6, scope: !4832)
!4832 = distinct !DILexicalBlock(scope: !4823, file: !4781, line: 48, column: 85)
!4833 = !DILocation(line: 51, column: 13, scope: !4780)
!4834 = !DILocation(line: 51, column: 23, scope: !4780)
!4835 = !DILocation(line: 51, column: 21, scope: !4780)
!4836 = !DILocation(line: 51, column: 11, scope: !4780)
!4837 = !DILocation(line: 52, column: 13, scope: !4780)
!4838 = !DILocation(line: 52, column: 23, scope: !4780)
!4839 = !DILocation(line: 52, column: 21, scope: !4780)
!4840 = !DILocation(line: 52, column: 11, scope: !4780)
!4841 = !DILocation(line: 54, column: 48, scope: !4842)
!4842 = distinct !DILexicalBlock(scope: !4780, file: !4781, line: 54, column: 6)
!4843 = !DILocation(line: 54, column: 43, scope: !4842)
!4844 = !DILocation(line: 54, column: 33, scope: !4842)
!4845 = !DILocation(line: 54, column: 73, scope: !4842)
!4846 = !DILocation(line: 54, column: 68, scope: !4842)
!4847 = !DILocation(line: 54, column: 58, scope: !4842)
!4848 = !DILocation(line: 54, column: 8, scope: !4842)
!4849 = !DILocation(line: 54, column: 6, scope: !4780)
!4850 = !DILocation(line: 55, column: 6, scope: !4851)
!4851 = distinct !DILexicalBlock(scope: !4842, file: !4781, line: 54, column: 85)
!4852 = !DILocation(line: 57, column: 13, scope: !4780)
!4853 = !DILocation(line: 57, column: 23, scope: !4780)
!4854 = !DILocation(line: 57, column: 21, scope: !4780)
!4855 = !DILocation(line: 57, column: 11, scope: !4780)
!4856 = !DILocation(line: 58, column: 13, scope: !4780)
!4857 = !DILocation(line: 58, column: 23, scope: !4780)
!4858 = !DILocation(line: 58, column: 21, scope: !4780)
!4859 = !DILocation(line: 58, column: 11, scope: !4780)
!4860 = !DILocation(line: 60, column: 14, scope: !4780)
!4861 = !DILocation(line: 60, column: 23, scope: !4780)
!4862 = !DILocation(line: 60, column: 33, scope: !4780)
!4863 = !DILocation(line: 60, column: 42, scope: !4780)
!4864 = !DILocation(line: 60, column: 30, scope: !4780)
!4865 = !DILocation(line: 60, column: 51, scope: !4780)
!4866 = !DILocation(line: 60, column: 49, scope: !4780)
!4867 = !DILocation(line: 60, column: 11, scope: !4780)
!4868 = !DILocation(line: 61, column: 14, scope: !4780)
!4869 = !DILocation(line: 61, column: 22, scope: !4780)
!4870 = !DILocation(line: 61, column: 31, scope: !4780)
!4871 = !DILocation(line: 61, column: 40, scope: !4780)
!4872 = !DILocation(line: 61, column: 28, scope: !4780)
!4873 = !DILocation(line: 61, column: 53, scope: !4780)
!4874 = !DILocation(line: 61, column: 62, scope: !4780)
!4875 = !DILocation(line: 61, column: 50, scope: !4780)
!4876 = !DILocation(line: 61, column: 11, scope: !4780)
!4877 = !DILocation(line: 62, column: 6, scope: !4878)
!4878 = distinct !DILexicalBlock(scope: !4780, file: !4781, line: 62, column: 6)
!4879 = !DILocation(line: 62, column: 15, scope: !4878)
!4880 = !DILocation(line: 62, column: 6, scope: !4780)
!4881 = !DILocation(line: 64, column: 10, scope: !4882)
!4882 = distinct !DILexicalBlock(scope: !4878, file: !4781, line: 63, column: 2)
!4883 = !DILocation(line: 64, column: 22, scope: !4882)
!4884 = !DILocation(line: 64, column: 30, scope: !4882)
!4885 = !DILocation(line: 64, column: 19, scope: !4882)
!4886 = !DILocation(line: 64, column: 3, scope: !4882)
!4887 = !DILocation(line: 68, column: 10, scope: !4888)
!4888 = distinct !DILexicalBlock(scope: !4878, file: !4781, line: 67, column: 2)
!4889 = !DILocation(line: 68, column: 3, scope: !4888)
!4890 = !DILocation(line: 70, column: 1, scope: !4780)
!4891 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !34, file: !34, line: 78, type: !4497, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !4)
!4892 = !DILocalVariable(name: "left", arg: 1, scope: !4891, file: !34, line: 78, type: !26)
!4893 = !DILocation(line: 78, column: 38, scope: !4891)
!4894 = !DILocalVariable(name: "right", arg: 2, scope: !4891, file: !34, line: 78, type: !26)
!4895 = !DILocation(line: 78, column: 52, scope: !4891)
!4896 = !DILocation(line: 80, column: 12, scope: !4891)
!4897 = !DILocation(line: 80, column: 19, scope: !4891)
!4898 = !DILocation(line: 80, column: 17, scope: !4891)
!4899 = !DILocation(line: 80, column: 25, scope: !4891)
!4900 = !DILocation(line: 80, column: 5, scope: !4891)
!4901 = distinct !DISubprogram(name: "MulLowWord", scope: !4781, file: !4781, line: 86, type: !1417, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !4)
!4902 = !DILocalVariable(name: "arg1", arg: 1, scope: !4901, file: !4781, line: 86, type: !29)
!4903 = !DILocation(line: 86, column: 29, scope: !4901)
!4904 = !DILocalVariable(name: "arg2", arg: 2, scope: !4901, file: !4781, line: 86, type: !29)
!4905 = !DILocation(line: 86, column: 47, scope: !4901)
!4906 = !DILocalVariable(name: "arg1_LW", scope: !4901, file: !4781, line: 88, type: !22)
!4907 = !DILocation(line: 88, column: 6, scope: !4901)
!4908 = !DILocalVariable(name: "arg1_HW", scope: !4901, file: !4781, line: 88, type: !22)
!4909 = !DILocation(line: 88, column: 14, scope: !4901)
!4910 = !DILocalVariable(name: "arg2_LW", scope: !4901, file: !4781, line: 88, type: !22)
!4911 = !DILocation(line: 88, column: 22, scope: !4901)
!4912 = !DILocalVariable(name: "arg2_HW", scope: !4901, file: !4781, line: 88, type: !22)
!4913 = !DILocation(line: 88, column: 30, scope: !4901)
!4914 = !DILocalVariable(name: "MulTemp1", scope: !4901, file: !4781, line: 89, type: !29)
!4915 = !DILocation(line: 89, column: 6, scope: !4901)
!4916 = !DILocalVariable(name: "MulTemp2", scope: !4901, file: !4781, line: 89, type: !29)
!4917 = !DILocation(line: 89, column: 16, scope: !4901)
!4918 = !DILocalVariable(name: "MulTemp3", scope: !4901, file: !4781, line: 89, type: !29)
!4919 = !DILocation(line: 89, column: 26, scope: !4901)
!4920 = !DILocalVariable(name: "MulTemp4", scope: !4901, file: !4781, line: 89, type: !29)
!4921 = !DILocation(line: 89, column: 36, scope: !4901)
!4922 = !DILocalVariable(name: "HIGHWORD", scope: !4901, file: !4781, line: 89, type: !29)
!4923 = !DILocation(line: 89, column: 47, scope: !4901)
!4924 = !DILocalVariable(name: "OverFlow", scope: !4901, file: !4781, line: 89, type: !29)
!4925 = !DILocation(line: 89, column: 57, scope: !4901)
!4926 = !DILocation(line: 90, column: 12, scope: !4901)
!4927 = !DILocation(line: 90, column: 17, scope: !4901)
!4928 = !DILocation(line: 90, column: 10, scope: !4901)
!4929 = !DILocation(line: 91, column: 13, scope: !4901)
!4930 = !DILocation(line: 91, column: 18, scope: !4901)
!4931 = !DILocation(line: 91, column: 31, scope: !4901)
!4932 = !DILocation(line: 91, column: 12, scope: !4901)
!4933 = !DILocation(line: 91, column: 10, scope: !4901)
!4934 = !DILocation(line: 92, column: 12, scope: !4901)
!4935 = !DILocation(line: 92, column: 17, scope: !4901)
!4936 = !DILocation(line: 92, column: 10, scope: !4901)
!4937 = !DILocation(line: 93, column: 13, scope: !4901)
!4938 = !DILocation(line: 93, column: 18, scope: !4901)
!4939 = !DILocation(line: 93, column: 31, scope: !4901)
!4940 = !DILocation(line: 93, column: 12, scope: !4901)
!4941 = !DILocation(line: 93, column: 10, scope: !4901)
!4942 = !DILocation(line: 94, column: 13, scope: !4901)
!4943 = !DILocation(line: 94, column: 23, scope: !4901)
!4944 = !DILocation(line: 94, column: 21, scope: !4901)
!4945 = !DILocation(line: 94, column: 11, scope: !4901)
!4946 = !DILocation(line: 95, column: 13, scope: !4901)
!4947 = !DILocation(line: 95, column: 23, scope: !4901)
!4948 = !DILocation(line: 95, column: 21, scope: !4901)
!4949 = !DILocation(line: 95, column: 11, scope: !4901)
!4950 = !DILocation(line: 96, column: 13, scope: !4901)
!4951 = !DILocation(line: 96, column: 23, scope: !4901)
!4952 = !DILocation(line: 96, column: 21, scope: !4901)
!4953 = !DILocation(line: 96, column: 11, scope: !4901)
!4954 = !DILocation(line: 97, column: 13, scope: !4901)
!4955 = !DILocation(line: 97, column: 23, scope: !4901)
!4956 = !DILocation(line: 97, column: 21, scope: !4901)
!4957 = !DILocation(line: 97, column: 11, scope: !4901)
!4958 = !DILocation(line: 98, column: 14, scope: !4901)
!4959 = !DILocation(line: 98, column: 28, scope: !4901)
!4960 = !DILocation(line: 98, column: 37, scope: !4901)
!4961 = !DILocation(line: 98, column: 46, scope: !4901)
!4962 = !DILocation(line: 98, column: 24, scope: !4901)
!4963 = !DILocation(line: 98, column: 56, scope: !4901)
!4964 = !DILocation(line: 98, column: 65, scope: !4901)
!4965 = !DILocation(line: 98, column: 74, scope: !4901)
!4966 = !DILocation(line: 98, column: 52, scope: !4901)
!4967 = !DILocation(line: 98, column: 11, scope: !4901)
!4968 = !DILocation(line: 100, column: 9, scope: !4901)
!4969 = !DILocation(line: 100, column: 2, scope: !4901)
!4970 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4971, file: !4971, line: 12, type: !4972, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !42, retainedNodes: !4975)
!4971 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4972 = !DISubroutineType(types: !4973)
!4973 = !{null, !4974}
!4974 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4975 = !{!4976}
!4976 = !DILocalVariable(name: "z", arg: 1, scope: !4970, file: !4971, line: 12, type: !4974)
!4977 = !DILocation(line: 0, scope: !4970)
!4978 = !DILocation(line: 13, column: 9, scope: !4979)
!4979 = distinct !DILexicalBlock(scope: !4970, file: !4971, line: 13, column: 7)
!4980 = !DILocation(line: 13, column: 7, scope: !4970)
!4981 = !DILocation(line: 14, column: 5, scope: !4979)
!4982 = !DILocation(line: 15, column: 1, scope: !4970)
!4983 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4984, file: !4984, line: 20, type: !4985, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !44, retainedNodes: !4988)
!4984 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4985 = !DISubroutineType(types: !4986)
!4986 = !{null, !4987, !4987}
!4987 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4988 = !{!4989, !4990}
!4989 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4983, file: !4984, line: 20, type: !4987)
!4990 = !DILocalVariable(name: "shift", arg: 2, scope: !4983, file: !4984, line: 20, type: !4987)
!4991 = !DILocation(line: 0, scope: !4983)
!4992 = !DILocation(line: 21, column: 13, scope: !4993)
!4993 = distinct !DILexicalBlock(scope: !4983, file: !4984, line: 21, column: 7)
!4994 = !DILocation(line: 21, column: 7, scope: !4983)
!4995 = !DILocation(line: 27, column: 5, scope: !4996)
!4996 = distinct !DILexicalBlock(scope: !4993, file: !4984, line: 21, column: 26)
!4997 = !DILocation(line: 29, column: 1, scope: !4983)
